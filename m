Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B3C3A4F2C
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970529; cv=none; b=euv3UJmNwkTxdODQ4cefXGdm2OAqzfO8zFMhIVPIzEzupnRF4I7joBJq4sOU0UMhvQHg8rjq+TI4VsIZlb623NnPiqkg9m89CwU+ppirMuErHGxRaojTNpyTMYPDqMTBuWtFIjcw96+QAPqvGxdaLETt21Zv8X5Z7+LtqfB6gYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970529; c=relaxed/simple;
	bh=Gmw+7adA/v9MnBGYhhkWFRs0s7pn2lOwS+aH1AfKY5M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BTS27RUD994JNAXHkR2uLfTh9bKht2H0k0unZw8PTaiPOiXYKGpx2E5uohTXU0bOsZTWSUo7JBG58qbhNimbmFE+fXDoIBo0XK3y9hzXOfEXAxaVPbMaF9vAvfIg7jXksOeUFyoSSzcuOJvgVoffHkmznHzkVVpqMd3nsA3eIkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXes+ZRf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXes+ZRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220371F000FF;
	Wed, 14 Oct 2026 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791970528;
	bh=xAIbpM8vCjTFj1NDfirVJarGf0k/ei8jS0dMfo2BQ/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JXes+ZRfJhHQFBfpf23n9i71lAhmj+k1pAW1QvacnTpIGhVLWgqawh7nUsNXzamuq
	 2VniJfO3LjylTKTR8Gw2gy4Df8gDw/SYvq60ueETApg3oA4gcjWGSYGAXyaWFHISO3
	 G6lnBiersHUYtEcsbWNiuFLteXgH1fgRyWS8k4EA9YOrK8QTvu3qElonFa7zjb4Q3b
	 JZPWQoPTdzRYNPqlZf+c4X5SPpzfquLsdQ8UGWpJRBxzjLCTCwW33H6MeGc5sFftTg
	 Pm6en57+j99JmFhmQ2CL2zg9ZiGUABnhaGLENJMtYi2rU39nerGmVbidOFIaTdC1LI
	 h45JGxexvEM+g==
Message-ID: <sashiko-outbox-171080@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/9] ASoC: qcom: lpass-tx-macro: Add support for
 Bolero v4.0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-add_shikra_support_v5-v5-8-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-8-fb9f0667e613@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:35:27 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] cleanup: Mixing goto-based error handling with __free() scope-ba=
sed cleanup
- [Medium] ASoC: qcom: lpass-tx-macro: SWR_MIC bitwise check misidentifies =
RX_SWR_MIC
--

commit 64e799e2b76860a53ceff3f36c16c6368d70c60e
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: lpass-tx-macro: Add support for Bolero v4.0

This commit adds support for the Bolero v4.0 TX macro in the Hawi platform.
It introduces v4.0 specific register defaults, extends regmap accessors, and
registers a separate decimator widget table to handle the new mux enum and
DAPM events.

> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-t=
x-macro.c
> index 6deaaabe43afa..6480a6c9032e3 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
[ ... ]
> @@ -929,6 +998,10 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_w=
idget *w,
> =20
>  	switch (event) {
>  	case SND_SOC_DAPM_PRE_PMU:
> +		/* Disable the ADPT block before enabling the decimator */
> +		if (tx->data->has_adpt)
> +			snd_soc_component_write_field(component, CDC_ADPT0_ADPT_CTRL,
> +						      CDC_TX_ADPT_CTRL_EN_MASK, 0x0);
>  		adc_mux_reg =3D CDC_TX_INP_MUX_ADC_MUXn_CFG1(decimator);
>  		if (snd_soc_component_read(component, adc_mux_reg) & SWR_MIC) {

[Severity: Medium]
Will this bitwise check incorrectly match the newly added RX_SWR_MIC?

The adc_mux_text_v9_3 enum added below introduces RX_SWR_MIC at index 3. Wh=
en
RX_SWR_MIC is selected, snd_soc_component_read() & SWR_MIC evaluates to
3 & 1 =3D=3D 1 (true).

This erroneously triggers SWR_MIC-specific logic for RX_SWR_MIC in both
tx_macro_enable_dec() and is_amic_enabled(). If a machine driver routes
RX_SWR_MIC and powers it up, the PRE_PMU block will read the irrelevant SMIC
mux register and overwrite CDC_TX_TOP_CSR_SWR_DMICn_CTL if the leftover val=
ue
is >=3D 5.

Even if not routed, the teardown bug in PRE_PMD executes when userspace
switches the mux away from an active path to RX_SWR_MIC.

[ ... ]
> @@ -2027,6 +2103,418 @@ static const struct snd_soc_dapm_route tx_audio_m=
ap_v9_2[] =3D {
>  	{"TX SMIC MUX7", "SWR_MIC11", "TX SWR_INPUT11"},
>  };
> =20
> +static const char * const adc_mux_text_v9_3[] =3D {
> +	"MSM_DMIC", "SWR_MIC", "ANC_FB_TUNE1", "RX_SWR_MIC"
> +};

[ ... ]
> @@ -2250,6 +2751,9 @@ static int tx_macro_probe(struct platform_device *p=
dev)
>  	struct device_node *np =3D dev->of_node;
>  	struct tx_macro *tx;
>  	void __iomem *base;
> +	struct reg_default *reg_defaults __free(kfree) =3D NULL;
> +	struct regmap_config *reg_config __free(kfree) =3D NULL;
> +	size_t def_count;
>  	int ret, reg;

[ ... ]
> @@ -2304,7 +2808,40 @@ static int tx_macro_probe(struct platform_device *=
pdev)
>  		}
>  	}
> =20
> -	tx->regmap =3D devm_regmap_init_mmio(dev, base, &tx_regmap_config);
> +	reg_config =3D kmemdup(&tx_regmap_config, sizeof(*reg_config), GFP_KERN=
EL);
> +	if (!reg_config) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}

[Severity: Medium]
Is it safe to mix goto-based error handling with scope-based cleanup in this
function?

The new reg_defaults and reg_config pointers are declared with the
__free(kfree) attribute for automatic scope-based cleanup. However,
tx_macro_probe() handles errors unconditionally by jumping to the err or
err_rpm_put labels via goto statements.

The global Linux kernel cleanup guidelines explicitly forbid mixing goto-ba=
sed
error paths with __free() cleanup blocks in the same function. Doing so cau=
ses
confusing ownership semantics and can lead to bugs where the compiler emits
cleanup instructions at label destinations that interfere with the expected
control flow. The subsystem rules require converting all resources to
scope-based cleanup or converting none of them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-add_shikra=
_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com?part=3D8
