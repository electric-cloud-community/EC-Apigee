package FlowPlugin::Apigee;
use JSON;
use strict;
use warnings;
use base qw/FlowPDF/;
use FlowPDF::Log;

# Feel free to use new libraries here, e.g. use File::Temp;

# Service function that is being used to set some metadata for a plugin.
sub pluginInfo {
    return {
        pluginName          => '@PLUGIN_KEY@',
        pluginVersion       => '@PLUGIN_VERSION@',
        configFields        => ['config'],
        configLocations     => ['ec_plugin_cfgs'],
        defaultConfigValues => {}
    };
}

# Auto-generated method for the procedure Add API Product to Key/Add API Product to Key
# Add your code into this method and it will be called when step runs
# Parameter: config
# Parameter: developer_email_or_id
# Parameter: app_name
# Parameter: consumer_key
# Parameter: apiProducts
# Parameter: attributes

sub addAPIProductToKey {
    my ($pluginObject) = @_;

    my $context = $pluginObject->getContext();
    my $params = $context->getRuntimeParameters();

    my $ECApigeeRESTClient = $pluginObject->getECApigeeRESTClient;
    # If you have changed your parameters in the procedure declaration, add/remove them here
    my %restParams = (
        'org_name' => $params->{'org_name'},
        'developer_email_or_id' => $params->{'developer_email_or_id'},
        'app_name' => $params->{'app_name'},
        'consumer_key' => $params->{'consumer_key'},
        'apiProducts' => $params->{'apiProducts'},
        'attributes' => $params->{'attributes'},
    );
    my $response = $ECApigeeRESTClient->addApiProductToKey(%restParams);
    logInfo("Got response from the server: ", $response);

    my $stepResult = $context->newStepResult;
    $stepResult->setOutputParameter(restResult => encode_json($response));
    $stepResult->apply();
}

# This method is used to access auto-generated REST client.
sub getECApigeeRESTClient {
    my ($self) = @_;

    my $context = $self->getContext();
    my $config = $context->getRuntimeParameters();
    require FlowPlugin::ECApigeeRESTClient;
    my $client = FlowPlugin::ECApigeeRESTClient->createFromConfig($config);
    return $client;
}
## === step ends ===
# Please do not remove the marker above, it is used to place new procedures into this file.


1;