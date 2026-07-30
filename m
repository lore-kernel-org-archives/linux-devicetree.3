Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86ED37BE70
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434602; cv=none; b=Wx8m9Ca9FoLPJttsp12P5Mj4n3OELrjeKEjcHqe0M7C1V+raDgeor72ogNv/ec/IwIqKHdPaGts5KuY0xbnH6Ex581CIZs4rwFMpmgrKBYaz3H3XwJLE6d/ZqqY7pUM5VSukpGkFZXaQiquGzkLitHSwemIAvbpTxmfR6N6bLXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434602; c=relaxed/simple;
	bh=6OEv+fgog6oyUXnfAEYOCX09GP0wmO/MSf1mvyS4Tl4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kfpPzJy3kKxKgR8buKWHOOxWyWU9o1L8J4JYS6Ket+lXZ07AZPY770jwMK6dt8SZeyFr52Ar20x3+IkVQgHG2va9vBFS0Bdj5QRhPh4PLBUySpGgPUENGCVMkEV8EO3CrCOrCUgZZdqvCWDibi1kH8kg0yM3EEXXwyLN1dWfj5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9/FQYA5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9/FQYA5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930291F00A3A;
	Thu, 30 Jul 2026 18:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785434600;
	bh=t/jJWXdSVpPFLTwK8kWrTN6vaPuquChr1LZqjVgBiaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J9/FQYA5UjBP2JwQb4zGgvzMiMQuVKzELrJp4AisR+q4TYT8eNvaG96EdIxlDc6cO
	 q7jyBuQhP5cK1yC5tdBgl1oc14wOtLnjbKM9l6ZGixvm64smMBlqFGW5AIa4AVuiRS
	 ARyfiJKHIVd7KOLpk1SA+UO/waGUlJbBrUtI1juuVJq3EizCL4CdVFImVzkp3lsE0P
	 4toj+aefgKy2MHkilZh0zyP4hCB7+sPo8YdMJ7SIFAV9N8swplxzvb8ENnB51QOecP
	 wph/OmCofOIP2EMpClzpGfu1LMck0JoAJWMKsDgHFWAEC3RYPJ8o2kAJkJi62jy/yK
	 v7I12iEjWtmGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/15] ASoC: msm8916-wcd-analog: add quirk for cajon
 2.0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730174353.108023-16-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-16-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 18:03:20 +0000
Message-Id: <20260730180320.930291F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The 20ms delay and TEST bit clear in `POST_PMD` for HPHL/HPHR PAs =
execute before the digital codec has powered down, contradicting the hardwa=
re requirement and potentially violating hardware constraints.
--

--- Patch [15]: [PATCH v6 15/15] ASoC: msm8916-wcd-analog: add quirk for ca=
jon 2.0 ---
commit 3ee3737216b7e26df5f18202ad771c230e2fa0e3
Author: Richard Acayan <mailingradian@gmail.com>

ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

The codec version CAJON_2_0 on the Snapdragon 670 requires touching the
HPH test registers. Add the quirk so this driver can also support
SDM670.

> diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm=
8916-wcd-analog.c
> index b9325290c28d9..87f8a47cc293f 100644
> --- a/sound/soc/codecs/msm8916-wcd-analog.c
> +++ b/sound/soc/codecs/msm8916-wcd-analog.c
[ ... ]
> @@ -705,6 +707,59 @@ static int pm8916_wcd_analog_enable_ear_pa(struct sn=
d_soc_dapm_widget *w,
>  	return 0;
>  }
> =20
> +static int pm8916_wcd_analog_enable_hphl_pa(struct snd_soc_dapm_widget *=
w,
> +					    struct snd_kcontrol *kcontrol,
> +					    int event)
> +{
[ ... ]
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(7000, 7100);
> +		snd_soc_component_update_bits(component, CDC_A_RX_HPH_L_TEST,
> +				0x04, 0x04);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		/* wait 20 ms after the digital codec has powered down */
> +		msleep(20);
> +		snd_soc_component_update_bits(component, CDC_A_RX_HPH_L_TEST,
> +				0x04, 0x00);
> +		break;

[Severity: High]
Will this POST_PMD event actually wait until after the digital codec has
powered down?

During the DAPM power-down sequence, PGAs are processed (sequence 6) before
Mixers (sequence 7), DACs (sequence 8), and AIFs (sequence 12). Since this
event is attached to the "HPHL PA" PGA widget, the POST_PMD event will exec=
ute
immediately after the PA powers down, which is before the digital codec (DA=
Cs,
Mixers, AIFs) powers down.

Could this premature delay and test bit clearing cause audible pops or
hardware instability?

> +	}
> +	return 0;
> +}
> +
> +static int pm8916_wcd_analog_enable_hphr_pa(struct snd_soc_dapm_widget *=
w,
> +					    struct snd_kcontrol *kcontrol,
> +					    int event)
> +{
[ ... ]
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(7000, 7100);
> +		snd_soc_component_update_bits(component, CDC_A_RX_HPH_R_TEST,
> +				0x04, 0x04);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		msleep(20);
> +		snd_soc_component_update_bits(component, CDC_A_RX_HPH_R_TEST,
> +				0x04, 0x00);
> +		break;

[Severity: High]
Similarly here, does this execute before the digital codec powers down?

Since "HPHR PA" is also a PGA widget, it seems the 20ms sleep and TEST bit
clear will occur while the digital codec is still powered on, just like the
left channel.

> +	}
> +	return 0;
> +}
[ ... ]
> @@ -954,11 +1009,15 @@ static const struct snd_soc_dapm_widget pm8916_wcd=
_analog_dapm_widgets[] =3D {
>  	SND_SOC_DAPM_MUX("EAR_S", SND_SOC_NOPM, 0, 0, &ear_mux),
>  	SND_SOC_DAPM_SUPPLY("EAR CP", CDC_A_NCP_EN, 4, 0, NULL, 0),
> =20
> -	SND_SOC_DAPM_PGA("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA_E("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0,
> +			   pm8916_wcd_analog_enable_hphl_pa,
> +			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
>  	SND_SOC_DAPM_MUX("HPHL", SND_SOC_NOPM, 0, 0, &hphl_mux),
>  	SND_SOC_DAPM_MIXER("HPHL DAC", CDC_A_RX_HPH_L_PA_DAC_CTL, 3, 0, NULL,
>  			   0),
> -	SND_SOC_DAPM_PGA("HPHR PA", CDC_A_RX_HPH_CNP_EN, 4, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA_E("HPHR PA", CDC_A_RX_HPH_CNP_EN, 4, 0, NULL, 0,
> +			   pm8916_wcd_analog_enable_hphr_pa,
> +			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730174353.1080=
23-1-mailingradian@gmail.com?part=3D15
