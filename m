Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD8E13776B
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611945; cv=none; b=EhgQH1MWk/VFimAGUkAG0ftnAmcUtfBCBJFBWfpXreeJc7iPXmCaq0wVyQDYlywoCtvUtUaeVWheIIXRMirU4pYH7lvQrndZhxxVLyjh4PjDBJdvsfSMJYXRRfPwmtGZqiY8HLIYw28VU5+dBkvVw59wmM/Q/dXmRMuK+BF1GA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611945; c=relaxed/simple;
	bh=U3BLS3BmpzDnvnQIlNBelLGYnTNzI/P+MtTIGEuU3K4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qiUqbPoK5G9ZOwKbswTOwtlpjmf0UKWYKDuDmVr+jl1a6mqstWGq9ousN5JqjQJFjix+xxMkIjQzkJCKECMQBvmCz/5WvwulwfhyEgCGao7csN6MlXDb1+1G/Gff3w+hbZN5UTgcXy8Xt0jCvtm4nB+kr/yuN2c8sFpb2ApYjow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwi4LDO2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwi4LDO2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D3F1F000FF;
	Thu, 17 Sep 2026 02:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789611944;
	bh=rzrkrhH8hDX5qCH1ZP4vXD+M4r4vVDOrXJbqIj24FnA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cwi4LDO28OPY5KWvdQk+2TNdXVxohtkvJ8QDSO8nlY1JGvVfFqktfSus7lrCdV668
	 K7J7tP+0lGFNFp6B2tjhlqMUXES2H4F4Vufvlbh1WCFIe+edh8SnWYOYgfUGs0297h
	 +0r/n5fZscRtyWvSHzC7bxBV7ia58dUMiHFxeT4Cg2BzB56lxfzON1K/p+UA07py04
	 95kHMFlT52ZDYxkAkYSkF8vULPmxzi7wwe95F5eQSaZ4VJ+joYw/fHFV5NKI8nVWC6
	 9dsmrBTvZIpC9tTkuCRxGejIDunB8yMYgXtYOcTT4zMq1AT2qDz9HYu6BQhvGDx/+b
	 xqjIFd7a0QVAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 v3 5/5] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone mux support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917-add_shikra_support-v3-5-fc0e79c341aa@oss.qualcomm.com>
References: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
 <20260917-add_shikra_support-v3-5-fc0e79c341aa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 02:25:43 +0000
Message-Id: <20260917022543.B7D3F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: lpass-va-macro: hardware state clobbering in va_macro_put_de=
c_enum()
--

commit a5472bf1265a3738d3abbcf9b151ff9456f2a107
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-va-macro: Add SoundWire microphone mux support

This commit adds support for routing audio from SoundWire microphone (SMIC)
inputs for VA decimators. It updates the decimator source selection logic
and skips DMIC-specific HPF programming when using an SMIC source.

> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index 31d399dfa8bcf..50673b012c16a 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -758,10 +758,22 @@ static int va_macro_put_dec_enum(struct snd_kcontro=
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

[Severity: High]
Does this code improperly clobber the hardware state during user-space mixer
control writes, causing it to become desynchronized from the DAPM routing
graph?

Because va_macro_put_dec_enum() immediately updates the
CDC_VA_TX_PATH_ADC_DMIC_SEL hardware bit based on the sub-mux being written,
writing to an inactive SMIC mux will clobber the hardware bit to ADC, even =
if
the actual active path (determined by VA DEC MUX) is set to DMIC. Whichever
sub-mux control is written last wins the hardware state.

This appears to cause the audio capture path to randomly break when ALSA mi=
xer
controls are initialized or restored (e.g., via alsactl restore).

> +	}
> =20
>  	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-add_shikra=
_support-v3-0-fc0e79c341aa@oss.qualcomm.com?part=3D5
