Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7556E43E07B
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764707; cv=none; b=LyDjXPa3s2HmU4+0dGTQTHvfikr0Xe1EC82FrG4Xfs7TnMwycoQ8sBsX4Ma5x5EsVFKcF2IaPxyi54jrT4+OoS84U/u+Xe1F5ElDb9kwp1j88GaH4G18YdcNTWl1RSCfOFH1TFvC+eTZHr/QD+2KCvfn8HhgLupM5/4S5Zlpfz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764707; c=relaxed/simple;
	bh=qSmstritCOJO/2ZRBvPf3WYdOZIqsiDFMXa/oDjbi14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E2/V0kyoeUT69Yp4LTYWrViNd/yeRnb/S/u/oYB32gi/b7ldexc0I+iNj6gan6wihnAocpPvXLI0VQdOcpKfbk8hWm2KIV1jMS53anfxjeQ4GfVFxF5094DAp9PzP+p6cuALdSM6O3ZrMHb2KbF3NQeQCcJG36B/bG3pEQv5IO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gx/Wwq7u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gx/Wwq7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88701F000E9;
	Wed, 22 Jul 2026 23:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784764706;
	bh=RnOWL+neY65CMVixL7VN3vOEv20jCCqE59+SYK0kEZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gx/Wwq7uKSoJJVt8O9zQDDLGXqzxXYXD7vJ0qFCT/w2aKf+eyA/NTmSRPEhdQO3Bt
	 WLaFxCfT/m+hFNlF0P2+E0Y7fP0UCsd8l/Amjf4eKIcL7FLXk6BCWnjuyXQIsrfiXM
	 Dg/HxXZoZBnjn/9vf4MqkhXSNnZVD+4v8KkK8IKkNzzFmCeB0HjDa42M0l0E+tSvlp
	 pJES5LEKXCgMzptCeRuNCcx9UMEmMvQ//KZ91s01nPgojRvhQSZhGBw39VvlZYOs4c
	 0Oa0FLgnUZ0WVBlv+wH67DXErdmSYO8rgNuMWleuM3LtJS9ifSiZ12Frk9UyZhshwD
	 /pSTIHr0s+GZg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/8] ASoC: SDCA: expose class helpers with hw_ops
 for non-DisCo platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722234221.884765-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 23:58:25 +0000
Message-Id: <20260722235825.C88701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Pointer aliasing in `class_function_probe()` overwrites the dynami=
cally registered function descriptor, breaking devices with multiple functi=
ons of the same type.
- [High] `sdca_class_probe()` unconditionally claims the slave device's dri=
ver data, preventing caller codec drivers from maintaining their own state =
and causing type confusion crashes.
- [High] Exported `sdca_class_probe()` queues asynchronous work but provide=
s no cleanup mechanism, leading to a Use-After-Free.
- [High] The `duplicate` flag is not preserved when injecting static functi=
on descriptors, breaking ALSA controls for duplicate functions.

Pre-existing issues:
- [High] `sdca_class_read_prop()` ignores memory allocation failures from `=
sdw_slave_read_prop()`, leading to invalid property accesses.
--

--- Patch [3]: [RFC PATCH 3/8] ASoC: SDCA: expose class helpers with hw_ops=
 for non-DisCo platforms ---
commit bcbc6a4337e2eb8e1a4a49f6313a6ae24f542dc0
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: expose class helpers with hw_ops for non-DisCo platforms

This patch modifies the SDCA class driver to expose helpers for non-DisCo
(DT/ARM) platforms. It introduces a hw_ops structure allowing codec drivers
to supply static function data and initialization routines when ACPI tables
are absent.

> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
> --- a/sound/soc/sdca/sdca_class.c
> +++ b/sound/soc/sdca/sdca_class.c
> @@ -24,7 +24,15 @@
> =20
>  #define CLASS_SDW_ATTACH_TIMEOUT_MS	5000
> =20
> -static int class_read_prop(struct sdw_slave *sdw)
> +/**
> + * sdca_class_read_prop - fill SDCA-common SoundWire slave properties
> + * @sdw: SoundWire slave
> + *
> + * Exported so codec-specific SoundWire drivers can invoke the SDCA
> + * common property setup from their own sdw_slave_ops.read_prop, and
> + * then apply codec-specific overrides inline.
> + */
> +int sdca_class_read_prop(struct sdw_slave *sdw)

[Severity: High]
This isn't a bug introduced by this patch, but since this function is now
being exported as a public API, does this safely handle allocation failures
from sdw_slave_read_prop()?

If sdw_slave_read_prop() encounters memory allocation failures, it returns
-ENOMEM. Because this function ignores the return value, the SoundWire core
might attempt to access partially initialized or NULL property structures
later on. Should we propagate the return value?

[ ... ]

> @@ -156,11 +179,47 @@ static int class_sdw_probe(struct sdw_slave *sdw, c=
onst struct sdw_device_id *id
> =20
>  	drv->dev =3D dev;
>  	drv->sdw =3D sdw;
> +	drv->hw_ops =3D hw_ops;
>  	mutex_init(&drv->regmap_lock);
>  	mutex_init(&drv->init_lock);
> =20
>  	dev_set_drvdata(drv->dev, drv);

[Severity: High]
When codec drivers call this newly exported sdca_class_probe() helper, will
they still be able to maintain their own private state?

Because this helper unconditionally assigns its internal sdca_class_drv str=
uct
to the device's driver data, any calling driver that later sets its own
drvdata will overwrite it.=20

If the codec driver sets its own drvdata, could this cause type confusion
when the exported PM callbacks execute?

sound/soc/sdca/sdca_class.c:class_runtime_resume() {
    struct sdca_class_drv *drv =3D dev_get_drvdata(dev);
    ...
    ret =3D sdw_slave_wait_for_init(drv->sdw, ...);
}

This cast would result in an invalid pointer dereference. Could the allocat=
ed
drv pointer be returned to the caller, or embedded in a public structure,
so codec drivers can safely use this API?

> +	/*
> +	 * On ARM platforms without ACPI/DisCo tables, sdca_lookup_functions()
> +	 * is a no-op and num_functions stays 0. Inject the function descriptors
> +	 * from the device-specific static data so sdca_dev_register_functions()
> +	 * can create the auxiliary devices.
> +	 */
> +	if (data->num_functions =3D=3D 0 && hw_ops && hw_ops->get_function_data=
) {
> +		struct sdca_function_data *fdata;
> +		unsigned int num =3D 0;
> +		unsigned int i;
> +
> +		fdata =3D hw_ops->get_function_data(&num);
> +		if (!fdata || num =3D=3D 0 || num > SDCA_MAX_FUNCTION_COUNT)
> +			return -EINVAL;
> +
> +		for (i =3D 0; i < num; i++) {
> +			if (!fdata[i].desc)
> +				return -EINVAL;
> +			data->function[i].type =3D fdata[i].desc->type;
> +			data->function[i].adr  =3D fdata[i].desc->adr;
> +			data->function[i].name =3D fdata[i].desc->name;
> +			data->function[i].node =3D NULL;

[Severity: High]
Does this structure copy miss the duplicate flag from the static descriptor?

In SDCA, the duplicate flag is necessary for ensuring ALSA controls for
duplicate functions (like Left and Right SmartAmps) are properly prefixed
with their address. Without this flag, won't the dynamically registered
functions have duplicate =3D false, leading to ALSA control name collisions?

[ ... ]

> @@ -185,6 +244,13 @@ static int class_sdw_probe(struct sdw_slave *sdw, co=
nst struct sdw_device_id *id
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL_NS_GPL(sdca_class_probe, "SND_SOC_SDCA_CLASS");

[Severity: High]
Could exposing this probe function lead to a Use-After-Free if a caller
subsequently unbinds or fails probe?

The sdca_class_probe() function queues an asynchronous boot_work, but its
teardown (cancel_work_sync) is only present in the unexported
class_sdw_remove(). The work lifecycle doesn't appear to be managed by
devres.

If a codec driver uses this helper and later unbinds, devres will free the
drv structure while the work remains queued, leading to a dereference of the
freed drv pointer when the work eventually executes. Should the work
cancellation be tied to devres or exposed via an un-probe helper?

[ ... ]

> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_c=
lass_function.c
> --- a/sound/soc/sdca/sdca_class_function.c
> +++ b/sound/soc/sdca/sdca_class_function.c
> @@ -329,9 +329,43 @@ static int class_function_probe(struct auxiliary_dev=
ice *auxdev,
>  	drv->core =3D core;
>  	drv->function =3D &sdev->function;
> =20
> -	ret =3D sdca_parse_function(dev, core->sdw, drv->function);
> -	if (ret)
> -		return ret;
> +	if (drv->function->desc->node) {
> +		ret =3D sdca_parse_function(dev, core->sdw, drv->function);
> +		if (ret)
> +			return ret;
> +	} else if (core->hw_ops && core->hw_ops->get_function_data) {
[ ... ]
> +		for (i =3D 0; i < num; i++) {
> +			if (fdata[i].desc &&
> +			    fdata[i].desc->type =3D=3D sdev->function.desc->type) {
> +				*drv->function =3D fdata[i];
> +				drv->function->desc =3D sdev->function.desc;

[Severity: High]
Can this structure assignment corrupt the dynamically registered function
descriptor?

Earlier in this function, drv->function is set as an alias to &sdev->functi=
on:

    drv->function =3D &sdev->function;

When *drv->function =3D fdata[i] executes, it completely overwrites
sdev->function with the static template, which destroys the original desc
pointer. The next line, drv->function->desc =3D sdev->function.desc, acts a=
s a
self-assignment and fails to restore the original dynamic descriptor.

Consequently, the dynamically injected SoundWire address is lost. If a devi=
ce
has multiple functions of the same type (like dual SmartAmps), they will bo=
th
blindly use the same address from the first template. Could this cause
SoundWire control collisions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722234221.8847=
65-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3
