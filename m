Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AB7320A37
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881069; cv=none; b=JJNoWQxVJMSRRecRYaGyvv2ZUJNYJeS3tv89ndIMOWgHPRb1/qqJ9IbTp7V06nHqefH1z2e1sB5KAWiJqHyXqw8eRuA03NHpo6kqr2Fw5kJ0qvJTrbxMXmLzNhZedglKzA0aL+69ePRIZcm4JimN6V2Sz6CHH1W7gbepI8U3kUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881069; c=relaxed/simple;
	bh=Qi6RRaxdQMHtLMfzBUA5jFNqkrClUfNFjy68RZXKQ0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lGZQoAUwtX86xDtWaVjQaJiUw5uJWSkvWKpwBM3GzT1hPuPRKW35xSXvhYQ1uIs4wmobfgpftHSm68pm35V8pA//GL0WUk6yuYtZAmxpbf7kOWkP4Lprjp4d3Legcx9gHe3sxfS3dP2ciwREzLpj4mxddPbVUsDo8NQU9y8bMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeyY8uxg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeyY8uxg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5ECE1F000FF;
	Sun, 20 Sep 2026 05:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881059;
	bh=F6DFf2OsGHycLlQbf7zeSnsaxEcNMSZmjMcJfqMRm68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HeyY8uxgg0yoiKHsk04qAHDDMlBfczfAy8PjxpY9XWAN9As2Mg0vHVutLss3JTNyZ
	 oYSx9zSXlvmpWzI7Yg081l5pd9ntj8SPe8onRXKORc8J4sfYrQtQVbIBnFiTeLg23g
	 mKi7O92ZR0zrlRFRXUIctqXJKnv3e2ij7ZBX1HnRrypJ/jrkYvAU0sw8smjz+dEbd4
	 tmu8QqM4ePamkBPFEoLLqi6kxGR4/g3igk5pa3TFXgJX/8VIciyTeY56EJYCw6S/F3
	 /tJGgvBr8rtYA2D1e3e21g8jBa/qNw/uiVVIQ4MXoF773OXuleGD2uE4Qtc8X7n1Vx
	 kZHWTiH32mSHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/28] ASoC: tas2764: Set up V/ISENSE on codec probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-macaudio-v1-15-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-15-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:10:58 +0000
Message-Id: <20260920051058.C5ECE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: tas2764: flawed V/I sense disabled logic causes inadverten=
t enable
--

commit ff9219a20060d38cf8689dacfe0f48323c8c8566
Author: James Calligeros <jcalligeros99@gmail.com>

ASoC: tas2764: Set up V/ISENSE on codec probe

This commit moves the setup of V/ISENSE to the codec probe rather than
configuring it on every hw_params or TDM slot call. This ensures it is
configured at the same time as the rest of the codec.

> diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
> index 6654100ac91d1..39372d0446d06 100644
> --- a/sound/soc/codecs/tas2764.c
> +++ b/sound/soc/codecs/tas2764.c

[ ... ]

> @@ -499,15 +470,26 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_=
dai *dai,
>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D snd_soc_component_update_bits(component, TAS2764_TDM_CFG5,
> +	return 0;
> +}
> +
> +static int tas2764_set_visense(struct tas2764_priv *tas2764, int vslot, =
int islot)
> +{
> +	int ret;
> +
> +	ret =3D snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_C=
FG5,
> +					    TAS2764_TDM_CFG5_VSNS_ENABLE |
>  					    TAS2764_TDM_CFG5_50_MASK,
> -					    tas2764->v_sense_slot);
> +					    TAS2764_TDM_CFG5_VSNS_ENABLE |
> +					    vslot);

[Severity: Medium]
Does this code inadvertently enable the sense slot and assign it to the max=
imum
value if vslot is -1?

A bitwise OR with a -1 value yields 0xffffffff. When applied with the bitma=
sk
in snd_soc_component_update_bits(), this will turn on the enable bit and set
the slot to the maximum value, which can lead to a TDM bus collision and
audio corruption.

>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D snd_soc_component_update_bits(component, TAS2764_TDM_CFG6,
> +	ret =3D snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_C=
FG6,
> +					    TAS2764_TDM_CFG6_ISNS_ENABLE |
>  					    TAS2764_TDM_CFG6_50_MASK,
> -					    tas2764->i_sense_slot);
> +					    TAS2764_TDM_CFG6_ISNS_ENABLE |
> +					    islot);
>  	if (ret < 0)
>  		return ret;

[ ... ]

> @@ -821,15 +803,12 @@ static int tas2764_codec_probe(struct snd_soc_compo=
nent *component)
>  			dev_warn(tas2764->dev, "failed to request IRQ: %d\n", ret);
>  	}
> =20
> -	ret =3D snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_C=
FG5,
> -					    TAS2764_TDM_CFG5_VSNS_ENABLE, 0);
> -	if (ret < 0)
> -		return ret;
> +	if (tas2764->v_sense_slot !=3D -1 || tas2764->i_sense_slot !=3D -1) {
> +		ret =3D tas2764_set_visense(tas2764, tas2764->v_sense_slot, tas2764->i=
_sense_slot);

[Severity: Medium]
If a user configures one of the sense slots to -1 in the device tree to dis=
able
it while keeping the other enabled, will this logical OR evaluate to true a=
nd
cause the disabled slot value (-1) to be passed to tas2764_set_visense() ab=
ove?

> +		if (ret < 0)
> +			return ret;
> +	}
> =20
> -	ret =3D snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_C=
FG6,
> -					    TAS2764_TDM_CFG6_ISNS_ENABLE, 0);
> -	if (ret < 0)
> -		return ret;
> =20
>  	switch (tas2764->devid) {
>  	case DEVID_SN012776:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D15
