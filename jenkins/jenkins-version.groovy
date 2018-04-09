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
class JenkinsVersions {
    def DEFAULT_OPTION = '2.89.3-1.1'
    def PULL_DOWN_VALUE_NOT_SELECTED = '< --'
    def SELECTED_INDICATOR = ':selected'

    // All valid magento github orgs
    def aJenkinsVersions = ['2.89.4-1.1',
                            '2.89.3-1.1',
                            '2.73.3-1.1',
                            '2.60.3-1.1',
                            '2.7.4-1.1']

    /**
     * This method returns a string array of all valid Jenkins master types
     **/
    def getJenkinsMastersList(bIncludeDefaultOption) {
        return (bIncludeDefaultOption ? this.aJenkinsVersions.plus(0, this.DEFAULT_OPTION + this.SELECTED_INDICATOR) : this.aJenkinsVersions)
    }

    /**
     * This method returns a string array of all valid magento github orgs plus mainline (magento org is mainline).
     **/
    def getJenkinsVersions(bIncludeDefaultOption, strEdition) {
        def intIndex = 0
        def aTargetVersions = this.aJenkinsVersions
        if (bIncludeDefaultOption) {
            if (strEdition?.trim()) {
                aTargetVersions = aTargetVersions.plus(intIndex, '< --- Do NOT run ' + strEdition + ' jobs --- >')
            } else {
                aTargetVersions = aTargetVersions.plus(intIndex, this.DEFAULT_OPTION)
            }
            intIndex++
        }

        return aTargetVersions
    }


}
