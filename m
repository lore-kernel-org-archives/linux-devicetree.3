Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAFA495534
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053219; cv=none; b=bKSRK83iKYYGoJNk4vTJqhwU9TLqIRWEF+gWZFzMkVfSxxhOz8qNOMHKdO0mcrxflNXgCj6+suZAf9UTOGXTlywzTBEKTTIGRVlyZiD0fjeGxGwpwNFPsv3DQhl4XcRen7qafnz6bBt/JwFuaRSnLUb22lZXFWkJxb4ZkEFS3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053219; c=relaxed/simple;
	bh=2/EER7LJ+TEY3i0JUQQu3qQhEEFWG+qYg8hCPEqem68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LSndNg0xm0E25ACK6mMQFxGal9fOuUGKHbt0nmOK++7cUjpY6N/0NyOi90PuvbdYF4qVTo1gaJFapy73byCnsG9+8/3+LZkp+Cb4Ql2UcW+cDRX8I6u+7wwRCHA8Hzp4fERq2AuJBbHR/upIKjhuQX6wwarIfn9LeGAO3eIVKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5vQ5ADZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5vQ5ADZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B371F000FF;
	Thu, 10 Sep 2026 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789053210;
	bh=faHGg0tf60f4iZ8XVcctMmS5bAiurk5maOLXDDLuVkU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F5vQ5ADZpqlGVRiKDF01nBdg9colOBaCaZRjZ4R6i1A0ATP0CsWvPh0JClbnB5WIB
	 4hNdVAAGxIruimNL6KxvjdyciKHs4KVwFVGMN4By5hyEQGS+nimys6Ts0/9FpkcLRZ
	 7fWWI6uYZ6trhMNBCqaVMb3gBsEg7k1+oA8QAGxxLtxeo7nGQ4TEuCV0DibZmpiS1m
	 7lUFswXSRWVSossJn3ytcn3kpvM/MDI55KO7FAaBY3KN9euDtDKPfqGlMZxRVbKpCJ
	 o7jR+eD9aVbwsYU2zpTbHlk+Azai/JIESi8jBW35KnZJ80s1OWcVrrukz22ffGh7rj
	 C2RCsRghlaQWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-evk
 compatible support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajay Kumar Nandam" <ajay.nandam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-shikra-machine-v2-v2-5-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-5-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 15:13:29 +0000
Message-Id: <20260910151329.D1B371F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Clock provider collision on the I2S bus: both CPU and Codec DAIs a=
re configured as clock providers, resulting in a bus collision on the bitcl=
ock and frame clock lines.
--

commit 38d45c7da72e3c695c8ea9cd9e58fbc7be8c7070
Author: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

ASoC: qcom: sc8280xp: Add shikra-iqs-evk compatible support
   =20
Add machine driver support for the Qualcomm Shikra IQS EVK board.
The Shikra IQS platform uses a third-party MAX98091 codec with
modem-DSP support.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 5bcdaa1927048..0551110a685f6 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c

[ ... ]

> @@ -543,6 +557,19 @@ static const struct qcom_snd_soc_common shikra_cqs_p=
riv_data =3D {
>  	.codec_sysclk_set =3D true,
>  };
> =20
> +static const struct qcom_snd_soc_common shikra_iqs_priv_data =3D {
> +	.driver_name =3D "shikra",
> +	.dapm_widgets =3D shikra_iqs_dapm_widgets,
> +	.num_dapm_widgets =3D ARRAY_SIZE(shikra_iqs_dapm_widgets),
> +	.controls =3D shikra_iqs_controls,
> +	.num_controls =3D ARRAY_SIZE(shikra_iqs_controls),
> +	.codec_dai_fmt =3D SND_SOC_DAIFMT_CBP_CFP |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_I2S,

[Severity: High]
Does this configuration cause a clock provider collision on the I2S bus?

Here in shikra_iqs_priv_data, codec_dai_fmt configures the codec as the
clock provider (SND_SOC_DAIFMT_CBP_CFP). However, cpu_dai_fmt is left
uninitialized.

During audio playback, when sc8280xp_snd_hw_params() is called, an
uninitialized cpu_dai_fmt triggers a fallback path:

sc8280xp_snd_hw_params() {
        ...
        if (data->priv->cpu_dai_fmt) {
                ...
        } else {
                ret =3D snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
                ...
        }
        ...
}

This fallback configures the CPU DAI as a clock provider as well. With
both the codec and the CPU configured to actively drive the bitclock and
frame clock lines, will this lead to a regression with an electrical
collision on the bus?

If the CPU is intended to be the master (as implied by mi2s_bclk_enable
being true), the codec should be configured with SND_SOC_DAIFMT_CBC_CFC.
If the codec is the intended master, cpu_dai_fmt should be explicitly set
to SND_SOC_DAIFMT_BC_FC.

> +	.codec_sysclk_set =3D true,
> +	.mi2s_bclk_enable =3D true,
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-shikra-mac=
hine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com?part=3D5
