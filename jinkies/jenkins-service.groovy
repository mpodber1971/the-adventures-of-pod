@Grapes(
    @Grab(group='org.codehaus.groovy.modules.http-builder', module='http-builder', version='0.7.1')
)

import groovyx.net.http.HTTPBuilder
import jenkins.model.Jenkins
import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.*

/**
 * This class provided available jenkins instance types
 **/
class JenkinsMasters {
    def DEFAULT_OPTION = 'jenkins-mdc'
    def PULL_DOWN_VALUE_NOT_SELECTED = '< --'
    def SELECTED_INDICATOR = ':selected'

    // All valid magento github orgs
    def aJenkinsMasters = ['jenkins-mdc',
                           'jenkins-tool',
                           'interface-mdc']

    /**
     * This method returns a string array of all valid Jenkins master types
     **/
    def getJenkinsMastersList(bIncludeDefaultOption) {
        return (bIncludeDefaultOption ? this.aJenkinsMasters.plus(0, this.DEFAULT_OPTION + this.SELECTED_INDICATOR) : this.aJenkinsMasters)
    }

    /**
     * This method returns a string array of all valid magento github orgs plus mainline (magento org is mainline).
     **/
    def getJenkinsMasters(bIncludeDefaultOption, strEdition) {
        def intIndex = 0
        def aTargetMasters = this.aJenkinsMasters
        if (bIncludeDefaultOption) {
            if (strEdition?.trim()) {
                aTargetMasters = aTargetMasters.plus(intIndex, '< --- Do NOT run ' + strEdition + ' jobs --- >')
            } else {
                aTargetMasters = aTargetMasters.plus(intIndex, this.DEFAULT_OPTION)
            }
            intIndex++
        }

        return aTargetMasters
    }


}