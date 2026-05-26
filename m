Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5513625782A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779811101; cv=none; b=g2jG8o8jhXwQhThaSuIGso/CfZoaQ1vVpa4letml1s/l+5SrPWWjk0B2ZJWTBtvidemXLUcDuE2NMSsGQZFx6WEXayFS5qkJnVV4R1YH9TGyjTUcLs4cn9gxiQV3UmGYqh9eC/kYCBcfEojgtvk1xkYH8PSm7ADepu61tazMTSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779811101; c=relaxed/simple;
	bh=5wdzPUvJwS5RBD2TTxlRJUxAbqIyM1ztV9EPNzo/K0w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mWEEb7pZEn9y+KCZezxPbP+AXSTIHXFnDOPXtnGJiiaJ6KkR/HpxtTKsuGKRnM+YRrD/nJz4E8ZIeTq0HWnIF1XNfyWHUrlb8ZvECWYDImW/EfefP21COqWeD9QtfSsbcrZ05zYjK16ZqDgZZD+kAoDD9o+0ER3cFQIEDVEukzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYoOtYKG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYoOtYKG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D111F000E9;
	Tue, 26 May 2026 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779811099;
	bh=IhsdHQYeM0ntHVLmAYbfb46EJ/xQQ3fExfL6l1fJKVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LYoOtYKGfji3c1npTBltrk2uaIGyVfPxyVzj7E+4swfp5EAZeQQFyujp4eKdhC4GD
	 BDQcH49k09ksa0H2MwgnrHrJOr/VhsoZ83cCgYsVNwj8Kzsrl1tk1FFySvP7/Q3FpX
	 b9GdkRWUEy+4lq8B2xct/ehnHd6HqPZ+l4qYIY2nLUPTeytZmwqs8CcELhtCpRkHnX
	 RU5Z95vm+xnFpfL+VPeKSDs8nozzsmhLqi7SR/MzOWAumbp2meV/894BxDdYx5vAOy
	 IJWpVMdmNLWls+nNFg16gBtOT8a2pDkyfl/ro49T/KmOuaMU7TVAQxbVnmsI4dTFkW
	 p+Q3F6jgLy7Jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct
 config for sc7280
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Weiss" <luca.weiss@fairphone.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
References: <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 15:58:19 +0000
Message-Id: <20260526155819.A6D111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Changing the match data for qcom,sc7280-lpass-tx-macro breaks user=
space ALSA ABI and in-kernel DTS routing.

Pre-existing issues:
- [High] The v9.2 SMIC selection logic contains dead code and fails to init=
ialize DMIC clocks.
--

commit 75eb73d3fec8fc578947e66030a2b59ca6333c91
Author: Luca Weiss <luca.weiss@fairphone.com>

ASoC: codecs: lpass-tx-macro: Use correct config for sc7280

This commit updates the match data for the qcom,sc7280-lpass-tx-macro
compatible string to use lpass_ver_9_2 instead of lpass_ver_9. The commit
message notes this will change control names and warns it is a breaking
change.

> Note, that this will change control names so it's a breaking change.

[Severity: High]
Does this violate the kernel's policy against breaking userspace ABI?

Changing the match data to lpass_ver_9_2 alters the names of DAPM widgets
and ALSA controls. This will break existing ALSA UCM configurations that
rely on the old names.=20

Additionally, will this break in-kernel DTS routing for other SC7280 boards?

Multiple in-tree SC7280 device tree files (like sc7280-herobrine and
sc7280-idp) hardcode the old routing names (TX SWR_ADCn and TX SWR_DMICn).

Since these DTS files aren't updated, could the sound card fail to
instantiate on those boards due to missing audio routes?

> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-t=
x-macro.c
> index f7d168f557dd8..7f93ab0c38723 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -2493,14 +2493,9 @@ static const struct tx_macro_data lpass_ver_11 =3D=
 {
> =20
>  static const struct of_device_id tx_macro_dt_match[] =3D {
>  	{
> -		/*
> -		 * The block is actually LPASS v9.4, but keep LPASS v9 match
> -		 * data and audio widgets, due to compatibility reasons.
> -		 * Microphones are working on SC7280 fine, so apparently the fix
> -		 * is not necessary.
> -		 */
>  		.compatible =3D "qcom,sc7280-lpass-tx-macro",
> -		.data =3D &lpass_ver_9,
> +		/* LPASS v9.4 */
> +		.data =3D &lpass_ver_9_2,

[Severity: High]
This is a pre-existing issue, but by forcing SC7280 to use the v9.2 code pa=
ths,
does this expose the device to a broken DMIC clock initialization logic?

In tx_macro_put_dec_enum(), tx_macro_update_smic_sel_v9_2() is exclusively
called in the else branch when widget->shift is 0:

sound/soc/codecs/lpass-tx-macro.c:tx_macro_put_dec_enum() {
	...
	if (val !=3D 0) {
		if (widget->shift) /* MSM DMIC */
			snd_soc_component_write_field(...);
		else if (tx->data->ver <=3D LPASS_VER_9_0_0)
			tx_macro_update_smic_sel_v9(...);
		else
			tx_macro_update_smic_sel_v9_2(component, widget, tx,
						      mic_sel_reg, val);
	}
	...
}

However, inside tx_macro_update_smic_sel_v9_2(), there is an if block inten=
ded
to initialize the DMIC clocks:

sound/soc/codecs/lpass-tx-macro.c:tx_macro_update_smic_sel_v9_2() {
	...
	if (widget->shift) {
		/* MSM DMIC */
		snd_soc_component_write_field(component, mic_sel_reg,
					      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
		...
		snd_soc_component_write_field(component, dmic_clk_reg,
					      CDC_TX_SWR_DMIC_CLK_SEL_MASK,
					      CDC_TX_SWR_MIC_CLK_DEFAULT);
	}
}

Because widget->shift is always 0 when this function is called, this block
appears to be dead code and structurally impossible to reach.

Consequently, are DMIC clocks failing to initialize for v9.2 hardware?

>  	}, {
>  		.compatible =3D "qcom,sm6115-lpass-tx-macro",
>  		.data =3D &lpass_ver_10_sm6115,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-sc7280-tx-=
macro-v1-0-1aad6900fec0@fairphone.com?part=3D1
