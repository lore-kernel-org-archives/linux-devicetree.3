Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7730D4D2EDE
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658114; cv=none; b=SS1/xIE6vIIwVTny94cY7cr5qb3nwK027ARGhcVinKLWPKx0uVyDTDFeOTgpoXDACgrgQ3xRliMaSxjMy+l0Xf4JQo4e9AsYi0JtYI8r9rPCaKpiKsRxl6xFpmr+KSQu6WNoWkudtaICp872UXaa4qBI5Hg85XFUh3RQmnK9E0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658114; c=relaxed/simple;
	bh=046iIU+6XdHj/RATYrhQOf3blG2kSuAp6B5tONx8jzw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ALEUezXZST+FeifL0vMuGorzhRFNnyN9Iiw4+qXzEm19PWRKdDYu/owLAetW3C9/nre3UDLm76TFsQgLfZSx7/Jiwzq4cLSLw0E9hnSSf7HO0gEfPxvqoooGrcEKLsiclwNEcvZnG+8KIpOCZDxkGPo6jYbGqPBS6EonroKNqVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwkH8xgY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwkH8xgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B341F00893;
	Fri,  5 Jun 2026 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780658113;
	bh=MEXR3q2oValdEaZuNIPPM3JxWXwlBoAMpKPSIyHEtuw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CwkH8xgYo9S9FthjIVf2o6FuAgY8y3aNjr2Yu9xeyJBKecoJ929EBUbXPxjANFPyy
	 Smjhd406C0IfyFCLpW0seAnjb4rTY7Ha6juwamtg+TEy9txk301gJ6v04bjVjBhSI9
	 ruupyhwGmurWVx00l6phRnbRvGyogK5hHDio8fV0lYQVpspCcgwqX1IgLVoEjSswnw
	 3/7B5Ifloa6odqLsXnqQdClS6D+2dZPCq8uXPfMy5WIjev7x0ik9c8ABO0rNKjRa4K
	 nlOnBRcPHHjavoA0MlAEFy8pumHOVhl17wunJP1YBC3EXRFt70ZpJffSjlTBLvGsOI
	 r5g6WiimoiRSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/13] ASoC: qcom: Add QAIF regmap, DT parsing and
 platform init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605103739.3557573-11-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-11-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 11:15:12 +0000
Message-Id: <20260605111512.E9B341F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Missing lock protection around `qaif_init_ref_cnt` leads to un-ser=
ialized hardware initialization data race.
- [High] Using `GENMASK` with unchecked channel counts (e.g., `v->num_rddma=
 - 1`) causes integer underflow and undefined behavior if the count is zero.
- [High] Component teardown order is inverted, shutting down hardware befor=
e devm-managed ALSA components are unregistered.
- [High] Modifying the global static `regmap_config` structure during probe=
 causes race conditions and an out-of-bounds register access bug.
- [High] The error code from enabling the AIF CTL register is overwritten w=
ithout being returned, allowing a stream to silently fail to start.
- [High] A missing `qcom,qaif-aif-bits-per-lane` property defaults to 0, ca=
using underflows during regmap writes and setting the DAI bitclock to 0Hz.
- [Medium] Variable `intf_idx` is declared as an unsigned 32-bit integer, m=
aking the error check `if (intf_idx < 0)` tautologically false.
- [Medium] Accumulating negative error codes using bitwise OR (`ret |=3D re=
gmap_write(...)`) corrupts the return value.
--

commit 84915833d4dcf01d21e4e1a894c18953827f441d
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

    ASoC: qcom: Add QAIF regmap, DT parsing and platform init
   =20
    Add the core CPU and platform bring-up needed for the Qualcomm Audio
    Interface driver.
   =20
    The existing QAIF DAI code needs device-level infrastructure before it =
can
    configure interfaces or run PCM streams. Add the MMIO regmap setup,
    including readable, writable and volatile register tables, so the driver
    can safely access QAIF control, DMA, interrupt and SHRAM registers.

> diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
> index c9c8d78c5f5f8..e1030f5b17524 100644
> --- a/sound/soc/qcom/qaif-cpu.c
> +++ b/sound/soc/qcom/qaif-cpu.c
> @@ -783,3 +783,804 @@ const struct snd_soc_dai_ops asoc_qcom_qaif_aif_cpu=
_dai_ops =3D {
>  	.trigger	=3D qaif_aif_cpu_daiops_trigger,
>  };

[Severity: High]
Does qaif_aif_cpu_daiops_trigger() overwrite the error code from enabling t=
he
AIF CTL register?

In the SNDRV_PCM_TRIGGER_START path of qaif_aif_cpu_daiops_trigger(), the
driver calls regmap_fields_write() to turn on the interface. If this write
fails, it logs an error but proceeds to call clk_enable(), overwriting the
ret variable.

If the clock enables successfully, the trigger function returns 0 (success)
to the ALSA core. The framework and application will falsely assume the
stream is running, but the hardware interface remains disabled, resulting
in silent audio playback/capture failures.

[ ... ]
> +static int of_qaif_parse_aif_intf_cfg(struct device *dev,
> +					struct qaif_drv_data *data)
> +{
[ ... ]
> +		if (v->get_dma_idx) {
> +			intf_idx =3D v->get_dma_idx(dai_id);
> +			if (intf_idx < 0) {

[Severity: Medium]
Since intf_idx is declared as a u32, will this check for negative error cod=
es
ever evaluate to true?

If v->get_dma_idx() returns a negative error code like -EINVAL, it wraps to=
 a
large positive integer. The check intf_idx < 0 will always evaluate to fals=
e,
bypassing this error path. The error is only caught by the subsequent bounds
check, which will print a misleading error message instead of failing prope=
rly.

[ ... ]
> +		/* Parse frame configuration */
> +		cfg->full_cycle_en =3D of_property_read_bool(intf_np, "qcom,qaif-aif-f=
ull-cycle-en");
> +
> +		ret =3D of_property_read_u32(intf_np, "qcom,qaif-aif-bits-per-lane", &=
cfg->bits_per_lane);
> +		if (ret) {
> +			dev_warn(dev, "Missing bits-per-lane for interface %d\n", num_interfa=
ces);
> +			cfg->bits_per_lane =3D 0;

[Severity: High]
Does assigning 0 as a default here cause an integer underflow later?

When this default value is used in qaif_aif_cpu_daiops_hw_params(), it caus=
es
an integer underflow: (slot_width * 0) - 1 evaluates to 0xFFFFFFFF. This
illegal value is then written directly to the bits_per_lane hardware
register field. It also causes clk_set_rate() to request exactly 0Hz
for the IBIT clock.

[ ... ]
> +int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -EINVAL;
> +
> +	audio_qaif_regmap_config.max_register =3D resource_size(res);

[Severity: High]
Does modifying this global static struct cause a data race if multiple
QAIF instances are probed concurrently?

Also, resource_size(res) defines the maximum inclusive valid register
address. Setting max_register exactly to the resource size permits regmap
accesses one byte beyond the valid mapped region.

> +
> +	drvdata->audio_qaif_map =3D devm_regmap_init_mmio(dev, drvdata->audio_q=
aif,
> +				&audio_qaif_regmap_config);
[ ... ]
> +void asoc_qcom_qaif_cpu_platform_remove(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata =3D platform_get_drvdata(pdev);
> +
> +	if (drvdata->variant->exit)
> +		drvdata->variant->exit(pdev);

[Severity: High]
Does shutting down the hardware here invert the component teardown order?

The driver registers sound components and IRQs using devm-managed functions,
meaning they are unregistered after the remove() callback returns. Manually
calling the exit() variant here disables the hardware clocks while the ALSA
component is still fully registered and accessible to userspace.

If an active stream or concurrent operation attempts unclocked regmap
accesses during this window, it could cause a synchronous external abort
or kernel panic.

> +}
[ ... ]

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> new file mode 100644
> index 0000000000000..b298ee9d865ee
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-platform.c
[ ... ]
> +static int qaif_map_ee_resource(struct qaif_drv_data *drvdata)
> +{
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	struct regmap *map =3D drvdata->audio_qaif_map;
> +	int ret =3D 0;
> +	u32 mask;
> +
> +	mask =3D GENMASK(v->num_rddma - 1, 0);

[Severity: High]
If a hardware variant has 0 channels for a specific DMA type, does this cau=
se
an integer underflow?

Calling GENMASK(0xFFFFFFFF, 0) invokes an out-of-bounds right shift in the
kernel's __GENMASK macro, which is undefined behavior. This can generate
invalid bitmasks and potentially grant access to nonexistent channels or
corrupt registers.

> +	ret |=3D regmap_write(map, QAIF_EE_RDDMA_MAP_REG(v), mask);
> +
> +	mask =3D GENMASK(v->num_wrdma - 1, 0);
> +	ret |=3D regmap_write(map, QAIF_EE_WRDMA_MAP_REG(v), mask);

[Severity: Medium]
Is it safe to accumulate negative error codes using bitwise OR?

regmap_write() returns a negative error code (e.g., -EINVAL) on failure.
If multiple writes fail, their bitwise combination can result in an
arbitrary and misleading error code, masking the true cause of the failure
and confusing upper layers.

[ ... ]
> +static int qaif_map_dma_path(struct qaif_drv_data *drvdata)
> +{
> +	struct regmap *map =3D drvdata->audio_qaif_map;
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	int ret =3D 0;
> +	int qxm_sel =3D v->qxm_type;
> +
> +	if (qxm_sel !=3D QXM0) {
> +		dev_err(regmap_get_device(map),
> +			"%s: only QXM0 is supported, qxm_type=3D%d\n",
> +			__func__, qxm_sel);
> +		return -EINVAL;
> +	}
> +
> +	ret |=3D regmap_write(map, QAIF_RDDMA_MAP_QXM, qxm_sel);
> +	ret |=3D regmap_write(map, QAIF_WRDMA_MAP_QXM, qxm_sel);

[Severity: Medium]
Could bitwise ORing the return values here corrupt standard error values?

If multiple regmap_write() calls return negative standard error codes,
combining them via bitwise OR will result in arbitrary and misleading error
values.

[ ... ]
> +static int qaif_init(struct snd_soc_component *component)
> +{
> +	struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(compone=
nt);
> +	int ret =3D 0;
> +
> +	if (drvdata->qaif_init_ref_cnt) {
> +		dev_dbg(component->dev, "%s: QAIF init is done already: ref cnt: %d\n",
> +				__func__, drvdata->qaif_init_ref_cnt);
> +		return 0;
> +	}

[Severity: High]
Is it possible for concurrent PCM opens to race on this lockless check?

qaif_init() checks qaif_init_ref_cnt without holding any locks. Its caller,
qaif_platform_pcmops_open(), calls qaif_init() and then increments the
counter. Since ALSA's pcm->open_mutex is per-PCM device, different DAIs
can be opened concurrently by userspace, causing a data race.

This could result in simultaneous writes to shared hardware registers and
corrupted hardware state.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605103739.3557=
573-1-harendra.gautam@oss.qualcomm.com?part=3D10
