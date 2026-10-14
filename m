Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB09F47604A
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970216; cv=none; b=lTDjYxPQIEdokaHwHJM+Zp+D63mB1lpBRVCkPODHzaO4fmcH7LTu7v56EXdouq7Wh/I7jovcvVbQbSLzXS5Vi7hFzneX8WW95OsDQMbxsjW8OwPUeghYGgrTgDRTz0RWOJAO9CSfnZwS3Hj34U+LNdkNoYQRpeSw3y9eEBDRTPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970216; c=relaxed/simple;
	bh=q7dCmNLhuX0yvgKATkPAvcWhNI4Ppx24gsT/TkFB6JY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lWTz0DXUeXOItBumdKath0YYRGxXmKXxVwSdk0Zi9y+pMRaKLYRwl3AQs8UM2za9as6TZRDZFYpu8YNzec6zG7KfLEFDfabF+qZ1RH71jSOIx6Zu56rByXrwaIGMYrwFBGTeMLw8qxjTkK26ORN6/8d6e4YRjnDn0/Q9r8pF/go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ny4/RH4g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ny4/RH4g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAED1F000FF;
	Wed, 14 Oct 2026 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791970213;
	bh=On57Bzwhzo3WQFmj1BY6ctAtl4D6nBlEcRisHuccSOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ny4/RH4gfVn99GJkTgXdKblvC0RUKJiY3ZtfFDk1jO7sWxUPjf4TM3GMOhI52U+uM
	 1QXpevzjw3N1irUOgGENd9UcR4/Svcpz75fcJuhM2s0CSy+pv2BVj4Kj1Tx3IDeI0W
	 Bzqd4AmR+j/t/cRViuZ8frwDtCr0glLmaoQUEr6IB8x4RKzOD5jSLI0hDId7ucMDDG
	 ks+Vf4NwIYkJQ99GGOMpfLGrUYEqFBMUxyK4AA2bnQe3BTk+YsMoM3F3ctyW3KmPT1
	 oZW+Pd6enNkIC7DkkYMyaxu2LX+F1R0J23Uf0v33pgq8Vc3p6GX8OZoVS+DDpKDaQF
	 dzfeYqaAcazHA==
Message-ID: <sashiko-outbox-171075@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/9] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-add_shikra_support_v5-v5-5-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-5-fb9f0667e613@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:30:12 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: qcom: lpass-va-macro: Stale hardware domain state when swi=
tching decimator mux dynamically
--

commit 06fa19ab9efeab4b7696e8d81e98eecb28b18195
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-va-macro: Add SoundWire microphone support
   =20
The VA decimators can currently capture audio only from DMIC inputs.
Add support for routing audio from SoundWire microphone (SMIC) inputs
as well.

> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index 53828dd80b832..cdef2b187407e 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c

[ ... ]

> @@ -1003,6 +1032,18 @@ static int va_macro_enable_dec(struct snd_soc_dapm=
_widget *w,
> =20
>  	switch (event) {
>  	case SND_SOC_DAPM_PRE_PMU:
> +		/*
> +		 * ADC_DMIC_SEL is shared by the DMIC and the SoundWire mic
> +		 * mux, so its value depends on the order in which userspace
> +		 * restores the two controls. Program it from the resolved
> +		 * mux state of this decimator, which is what selects the
> +		 * input domain.
> +		 */
> +		snd_soc_component_update_bits(comp, dec_cfg_reg,
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> +					      is_amic_enabled(comp, decimator) ?
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);

[Severity: Medium]
The outer decimator muxes like va_dec0_mux are defined using the standard
SOC_DAPM_ENUM macro.  Unlike the inner muxes like va_smic0_mux which have
custom put callbacks (va_macro_put_dec_enum), the outer muxes lack a custom
put callback to sync this register on the fly.

If an active capture stream is running and the outer decimator mux is
dynamically toggled between VA_DMIC and SWR_MIC, the mux widget remains
powered.  Since the power state doesn't cycle, DAPM will bypass the
SND_SOC_DAPM_PRE_PMU event in va_macro_enable_dec() shown here.

Will this cause ADC_DMIC_SEL to become stale and the hardware to continue
capturing from the old domain while DAPM routes the new one, resulting in
silent or corrupted audio until the stream is restarted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-add_shikra=
_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com?part=3D5
