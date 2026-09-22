Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BBC4ED1BC
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071218; cv=none; b=ZCv9ZamZm37bpqx3PThH5JRkM/ZhP6U8XflqJkKtkAuTwrc3AXGFSCT0yEpd7YCoxS4XCoepDWIpt084VBkxCLLhsKFO4WK7yD4EqC7WVpVzq9/A3GphtOdQkBaMugPGISYalgtLZyHCvaj6taUZv/tj1NHi6fMlOe8fd2uYqAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071218; c=relaxed/simple;
	bh=64B4hC6m4oi50GsN3EbJyZpzETUYgIy1ioIJrtcNe/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rktTRPZhQt5FEHiVjMpEOrBtnOuIHLky9g1Xkhf38uHxcm2fDXLYLmJj5B/vJZYae8SUzEHBd4Stk5k3Ta/B77BrnS77+CFcNiJ/A6gLNfLOzISaNiaTwRJVtFXCp6KqLXrRqSjwEM22BFrNpa4UgVeCbXIi6jDp7K7HEMj1Ot0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwfB6S+Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwfB6S+Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032381F00898;
	Tue, 22 Sep 2026 10:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790071216;
	bh=McYIXq7kTDNlwCCHDei6cf6fOOU0WJ+zrk3QFPX+H1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jwfB6S+QX+g3IXakHKf5+ZLCXBY5velLK4ZAGeeQH2g+NLIjO2H2o8oedZZoipNy+
	 LEolgJc0gYyLWG1rXvnM8aANumeJSwMnvNncOrfMLgFQvLIEaj7WyA/E6aLEvvxVR0
	 iA1Aq2W+TRJDgDhLn+ru/TWSGvEX1Bfi5gZuP/up1MCtt+igmtVXrg2FYRPiTYlhzN
	 QrhmWLkZGAZvsQWrkzhGD9/A8c0r0HFkXe1/OBO8THgkcQI1vm9H+qpjYyyuaoIdy8
	 tOyRarVM79rFpHkewEEgB++yK2BBSdyhT6+cpEDLKfBJygK1S4TjxFep0jC54pzogA
	 DSsquU7C8bMSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/8] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922-add_shikra_support-v1-5-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-5-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:00:14 +0000
Message-Id: <20260922100015.032381F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: qcom: lpass-va-macro: inactive mux write hijacks active stre=
am
- [Medium] ASoC: qcom: lpass-va-macro: dynamic mux switch leaves stale hard=
ware state
--

commit 930ab6f652b9c31708f76061b90cd77f78ea08ce
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-va-macro: Add SoundWire microphone support
   =20
The VA decimators can currently capture audio only from DMIC inputs.
Add support for routing audio from SoundWire microphone (SMIC) inputs
as well.

> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index 02dc3346924f1..79abbdd158b70 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
[ ... ]
> @@ -794,10 +794,22 @@ static int va_macro_put_dec_enum(struct snd_kcontro=
l *kcontrol,
>  		return -EINVAL;
>  	}
> =20
> -	if (val !=3D 0)
> -		snd_soc_component_update_bits(component, mic_sel_reg,
> -					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> -					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
> +	if (val !=3D 0) {
> +		/*
> +		 * SMIC enums use shift 0 (lower nibble of CFG0),
> +		 * DMIC enums use shift 4 (upper nibble of CFG0).
> +		 * Use e->shift_l to distinguish them without relying
> +		 * on widget name comparisons.
> +		 */
> +		if (e->shift_l =3D=3D 0)
> +			snd_soc_component_update_bits(component, mic_sel_reg,
> +						      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> +						      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC);
> +		else
> +			snd_soc_component_update_bits(component, mic_sel_reg,
> +						      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> +						      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
> +	}

[Severity: High]
Does this unconditionally overwrite the shared decimator input domain bit
regardless of which path DAPM has actively routed?

If a user-space application writes a non-zero value to the inactive sub-mux
(e.g., VA SMIC MUX0) while the decimator is actively capturing from the oth=
er
source (VA DMIC MUX0), could this instantly corrupt the active audio capture
stream mid-stream?

> =20
>  	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
>  }
[ ... ]
> @@ -1004,6 +1025,17 @@ static int va_macro_enable_dec(struct snd_soc_dapm=
_widget *w,
> =20
>  	switch (event) {
>  	case SND_SOC_DAPM_PRE_PMU:
> +		/*
> +		 * ADC_DMIC_SEL is shared by the DMIC and the SoundWire mic
> +		 * mux, so a mixer write to the mux that is not part of the
> +		 * active path can leave it stale. Program it from the mux
> +		 * state DAPM resolved for this decimator.
> +		 */
> +		snd_soc_component_update_bits(comp, dec_cfg_reg,
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> +					      is_amic_enabled(comp, decimator) ?
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);

[Severity: Medium]
Does this apply the hardware state only on PRE_PMU?

If a user dynamically switches the decimator source while it is active
(e.g., changing VA DECX MUX via mixer controls), DAPM might not execute the
PRE_PMU event since the widget remains powered.

Would this leave the newly added ADC_DMIC_SEL configuration unexecuted,
causing the hardware register to remain in a stale state and breaking the
capture stream?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-add_shikra=
_support-v1-0-6c6cb6444caf@oss.qualcomm.com?part=3D5
