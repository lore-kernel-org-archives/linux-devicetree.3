Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148C355F47
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034432; cv=none; b=fCRPeUAylyAXpbwaPcjHXCavg3aAQ7UgquX8vcmuRRj4eevYcjfj4civC1tUHsKJnC6d3qCASiqbYHB/2xZ/TKyU5WHU/cPGOu06hzESn0FAaDCImGD9sHKtZt74A/FrU193qn9aBzoKwERx4K3H5AAIzl6DaamXj7VnIKHAYBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034432; c=relaxed/simple;
	bh=5PEygJcCUr4HF6395BpT9mVH/PjIFITL9tyqysADL5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rVo943OMIxvJvE+rNgsSLML6XZ4kp/OO7HdjokqLzqWh+pau4Ngu5D6EFeqBrrPAy+OqV2scSGR+gG33Nn36pofVG8HbC8/Og4YalQU0uW6lJl1izHG31zupDMQQfuPPETyXOWf9c4i7DRzdQz7EFIukmNcgjyd1V2xY7890fLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQKkmIby; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQKkmIby"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C061F000FF;
	Thu, 10 Sep 2026 10:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789034430;
	bh=MTDz74iodu4ZI+Hn9Z7sVw2/jdUQfY2YiRGSIt4eWUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RQKkmIbyF4VIxlJX+xIhqIQc31UeFKSWvsJcFn1eTLFOWlLyn6F8JUba0OCCtETjZ
	 DTe+Q5Vp08Oj1KlGmQEjjn/AKi8ms7wvXq1KQHHkxkc4cmbreQi/TWEs2quuEGQ0y0
	 tZFjLMpyAPeKSJ52+03GXT/zWAiIIH2OLnztQE2VdDbPdEWWm9X33RV5NmenGU17L2
	 rv8hCR41/qZsidKgih/Dx0WpybAbpuUFyrymdEA+VHvEsTaxnlvk/u4LOQPW1tQ44K
	 oYXHbHWbO2idotAqHq8HfQSHzSxBUrhbI1D1+E8ERcBFdvhQSzLzwBoGc1q71wRTs9
	 fVCyxD9DB5kIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone mux support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-add_shikra_support-v2-6-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-6-fdd2129c696c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:00:29 +0000
Message-Id: <20260910100030.27C061F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The HPF cutoff frequency change request bit (`CDC_VA_TX_HPF_CUTOFF=
_FREQ_CHANGE_REQ`) is permanently left asserted for SMIC sources.
- [High] The VA SMIC and VA DMIC mux put handlers conflict over the `CDC_VA=
_TX_PATH_ADC_DMIC_SEL_MASK` hardware bit, leading to silent audio routing f=
ailures.

Pre-existing issues:
- [High] The kcontrol put callback `va_macro_put_dec_enum` modifies hardwar=
e register state outside the DAPM mutex and prior to validation, introducin=
g a TOCTOU race condition and state desynchronization.
--

commit 65c41e47c0a34211271b24ec96e2c5b75c4b06b0
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-va-macro: Add SoundWire microphone mux support
   =20
The VA decimators can currently capture audio only from DMIC inputs.
Add support for routing audio from SoundWire microphone (SMIC) inputs
as well.

> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index 8353921f718e3..46f35a984321c 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c

[ ... ]

> @@ -756,10 +757,16 @@ static int va_macro_put_dec_enum(struct snd_kcontro=
l *kcontrol,
>  		return -EINVAL;
>  	}
> =20
> -	if (val !=3D 0)
> -		snd_soc_component_update_bits(component, mic_sel_reg,
> +	if (val !=3D 0) {
> +		if (strstr(widget->name, "SMIC"))
> +			snd_soc_component_update_bits(component, mic_sel_reg,
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC);
> +		else
> +			snd_soc_component_update_bits(component, mic_sel_reg,
>  					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
>  					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
> +	}
> =20
>  	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
>  }

[Severity: High]
This is a pre-existing issue, but does modifying the hardware register here=
 in
va_macro_put_dec_enum() happen outside the DAPM mutex?=20

Since snd_soc_dapm_put_enum_double() acquires the DAPM mutex and performs
bounds checking later, could an out-of-bounds enum index malicious update t=
he
hardware but get rejected by the DAPM core, causing the hardware and softwa=
re
states to permanently desynchronize?

[Severity: High]
Does this code also unconditionally overwrite the shared hardware mux selec=
tion
based on whichever control was touched last?

If userspace toggles the target DEC source (VA DECx MUX) between DMIC and S=
MIC
without also re-triggering the corresponding input mux, could this cause the
hardware register to remain incorrectly stuck on the previous selection? The
DAPM graph would properly power the new SMIC path, but the hardware register
would be incorrectly left on DMIC, potentially resulting in silent audio
routing failures.

[ ... ]

> @@ -994,21 +1011,20 @@ static int va_macro_enable_dec(struct snd_soc_dapm=
_widget *w,
>  						      CF_MIN_3DB_150HZ << 5);
> =20
>  			snd_soc_component_update_bits(comp, hpf_gate_reg,
> -				      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
> -				      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_REQ);
> +					      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
> +					      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_REQ);
> =20
>  			/*
>  			 * Minimum 1 clk cycle delay is required as per HW spec
>  			 */
>  			usleep_range(1000, 1010);
> =20
> -			snd_soc_component_update_bits(comp,
> -				hpf_gate_reg,
> -				CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
> -				0x0);
> +			if (!is_amic_enabled(comp, decimator))
> +				snd_soc_component_update_bits(comp, hpf_gate_reg,
> +						      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
> +						      0x0);
>  		}

[Severity: High]
If an SMIC path is active (!is_amic_enabled evaluates to false), does the
frequency change request bit CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_REQ remain
permanently asserted?

The hardware state machine for the HPF typically requires a 0->1->0 transit=
ion.
If this bit is conditionally left at 1 when an SMIC source is active and the
cutoff frequency differs from CF_MIN_3DB_150HZ, could it become stuck and
prevent any future HPF cutoff frequency changes from completing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-add_shikra=
_support-v2-0-fdd2129c696c@oss.qualcomm.com?part=3D6
