Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225123B6BF1
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904289; cv=none; b=suM5g4f7GE3XRjj42zPyhf81VFEwrCdRWXHVYwBPh6cQ4p7Rsmnxk4dDTLhvtEytgzLAWYAD5bneW7lPJ0dG1XSkiH5QWSCrbkaN1b27Ue8guj3zUe/0/AMu1r95iQWnYof+78awIvK0qM34hunikJy2Ky3V6/LSuv9twZIHUG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904289; c=relaxed/simple;
	bh=ZpKWD4Jd9/6ezsHZj9lQI45j56q/rqCeP2cqqW7cOmg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HnSfAFPGuwVRPfDirJO8q5V8sHPzFHxXaWEsrulC/NexHslTPRiOkXdtQhTzpfPptHTHxBXRW5eROp+L0oVzXhda79k4AfRuQuOU+rhS26P5A+ej2JRFWYPxN5pDDGrEc55SJRvpO7Zfu1+UASPgqtuUFAlC0pu/y9VK86wqqiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLprd3Ip; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLprd3Ip"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784AC1F00A3A;
	Wed,  1 Jul 2026 11:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782904287;
	bh=crw4Gux8qKVeW5SKrXmRcEkOMUI7tTW+a0I64UdJZnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JLprd3Ipt0AGcx73uQJd/4ayJEtiJIyTkVFu8sVt/iIne+s0QZu1T+gf7XzUVIsY6
	 hux4mJU9D0hug2Ap/LsosegZlejBc2SWkZTywx+gzlvk7wWJ+p51njRsXtlmFUz+pG
	 LwENzXX75JOCpRXuwTWPTij+aM6gX8Ijp2b/NjgtNprrq0hofkEVtObcGuZ2EMClv5
	 s2TsKE/KGeJjNSNO9MUMvjMBTEUk6544CaqtFn5OKqaYcfigNUXnC2iItWZGGLhBeF
	 hPQgnLGlEjRDTH8VYXrlE6BAC9IqljqVt51KJpd40Cekb9qlcYqCKVja9aalNEZjhY
	 JhafkOAVboNsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] ASoC: qcom: Add QAIF regmap, DT parsing and
 platform init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701105757.2779738-8-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-8-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 11:11:27 +0000
Message-Id: <20260701111127.784AC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Modifying a statically allocated, shared struct (`audio_qaif_regma=
p_config`) during probe causes race conditions and state corruption.
- [High] Clocks are manually deinitialized in remove() before devres unregi=
sters the ASoC component, causing a devres ordering bug.
- [Medium] Unchecked underflow when passing `v->num_* - 1` to `GENMASK()`, =
leading to undefined behavior and hardware register corruption.
- [Medium] Bitwise ORing negative error codes returned by `regmap_write()` =
destroys original error values.
- [Medium] Unsigned variable `intf_idx` is checked for `< 0`, bypassing the=
 intended error handler.
--

commit 70dc20df9813861f68ee157ba8ffd821195c8a29
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF regmap, DT parsing and platform init

This commit adds the core CPU and platform bring-up needed for the Qualcomm
Audio Interface driver. It sets up the MMIO regmap, parses child nodes from
the devicetree for PCM/TDM/MI2S configurations, and initializes variant
resources and the ASoC CPU component.

> diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
> index 93b75ea8e48f5..99c3465466b5a 100644
> --- a/sound/soc/qcom/qaif-cpu.c
> +++ b/sound/soc/qcom/qaif-cpu.c

[ ... ]

> +static int of_qaif_parse_aif_intf_cfg(struct device *dev,
> +				      struct qaif_drv_data *data)
> +{

[ ... ]

> +		if (v->get_dma_idx) {
> +			intf_idx =3D v->get_dma_idx(dai_id);
> +			if (intf_idx < 0) {

[Severity: Medium]
Can intf_idx ever be less than 0 here?

Since intf_idx is declared as a u32, this check will always evaluate to fal=
se.
If v->get_dma_idx() returns a negative error code, it will underflow into a
large positive number and bypass this intended error handling block.

> +				dev_err(dev, "Invalid DAI ID %d for interface '%s' (node %d)\n",
> +					dai_id, intf_np->name, num_interfaces);
> +				continue;
> +			}

[ ... ]

> +int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	audio_qaif_regmap_config.max_register =3D resource_size(res);
> +	drvdata->audio_qaif_map =3D
> +		devm_regmap_init_mmio(dev, drvdata->audio_qaif,
> +				      &audio_qaif_regmap_config);

[Severity: High]
Does modifying audio_qaif_regmap_config.max_register directly cause issues =
if
multiple QAIF devices are probed?

Since audio_qaif_regmap_config is a statically allocated global structure,
multiple instances of the driver might race to overwrite this field, leaving
all instances with the register bounds of the last probed device.

> +	if (IS_ERR(drvdata->audio_qaif_map))
> +		return PTR_ERR(drvdata->audio_qaif_map);

[ ... ]

> +void asoc_qcom_qaif_cpu_platform_remove(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata =3D platform_get_drvdata(pdev);
> +
> +	if (drvdata->variant->clk_deinit)
> +		drvdata->variant->clk_deinit(pdev);
> +}

[Severity: High]
Does manually deinitializing the clocks here create a devres ordering issue?

The ASoC component is registered using devm_snd_soc_register_component(),
which means it will be unregistered during the devres teardown phase after
this remove function returns.

If the hardware clocks are already disabled here, will any teardown operati=
ons
or DAPM sequences that interact with the hardware registers cause a
synchronous external abort?

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> new file mode 100644
> index 0000000000000..35c5a1e66c763
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

[Severity: Medium]
Could v->num_rddma be zero for any hardware variants?

If a variant has 0 channels, v->num_rddma - 1 would underflow to U32_MAX,
causing GENMASK() to generate a fully populated mask. Writing this to the
hardware could map non-existent channels or corrupt reserved bits. There
doesn't appear to be a check for 0 here, unlike the v->num_intf check below.

> +	ret |=3D regmap_write(map, QAIF_EE_RDDMA_MAP_REG(v), mask);

[Severity: Medium]
Does bitwise ORing the return values from regmap_write() corrupt the error
codes?

Since regmap_write() returns negative errno values (like -EINVAL), bitwise
ORing two's complement negative numbers will mangle the return codes and
result in nonsensical error values being passed up the stack.

> +
> +	mask =3D GENMASK(v->num_wrdma - 1, 0);
> +	ret |=3D regmap_write(map, QAIF_EE_WRDMA_MAP_REG(v), mask);

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
Similar to the issue above, does accumulating negative error codes using
bitwise OR here destroy the original error values returned by regmap_write(=
)?

> +	ret |=3D regmap_write(map, QAIF_CODEC_RDDMA_MAP_QXM, qxm_sel);
> +	ret |=3D regmap_write(map, QAIF_CODEC_WRDMA_MAP_QXM, qxm_sel);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701105757.2779=
738-1-harendra.gautam@oss.qualcomm.com?part=3D7
