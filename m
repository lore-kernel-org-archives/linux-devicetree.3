Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DB5314B6D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228951; cv=none; b=rZBxcjsj93jcfjiPBulqVG2fyE65KPLVjNkbKfjF3CN7htYZB39oeUkVFFxXnZu/8EFLrsY9YPAIoUf8KuxUhIIzethBT3d0imRm9np/NzTIWPuHMoNt3EYuqP4LyZzus68VXgcxCOsi+eXPde3O8/1u4aFD7nkkiWbzfYsVGBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228951; c=relaxed/simple;
	bh=aoai64YQZn7wAUSh4Gp/phbuTwtezvQYsUOhxB+8J/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qdVuSh98kd3GyJS4Y11h6h4IbOdwRw7qvcNZckvJuqbRivsz6ZDkSpxL6NjeW1AFflaYMQmv04h/4FvRuwaCZx0P5LVb4/1D0kWtTlxQCX28dBTiwO5/4N1LCVyChkW/l76oGneZiqBONbmERFYb2o9AnOjPVzkAnhH11fWuI1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A68uYxwb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A68uYxwb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8B51F000E9;
	Tue, 28 Jul 2026 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785228950;
	bh=z+DBVHw02Uf67Uqeo1W4y+EsLxYilNqABRmg3pYNPBw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A68uYxwbdJQP7+EIGm3dOlvPEMiV86x3diqj5aeC2GVDDhoL+AKh2R4OP6IL3rBup
	 LOYtGiikSnlWZQD430JBvn18EvgMOTK5e8rAg63k1ianc+ammwdBY59VlKcLEuOeK6
	 nLLsBdZq4C71IFdB0+p7ip2pS2lOnuXMLfuiStDaJIcBFKPKoQsa6bMrCqGmF7VqV5
	 KLS2XA/FDPbENJ2GJfgd1lcInO9CUImEzfSulUSEaXzdXUPx4pJW5gIpF3GdlwT4Rl
	 95z4YX4nj0tjumub8oyr6/QZUcbTd5UukPWyLbuoVskFIZXa8RPlOwy1vubi4ipg0a
	 aNof/8QY5QtTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card
 with special WSA channel mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-3-b29f44720178@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
 <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-3-b29f44720178@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 08:55:49 +0000
Message-Id: <20260728085550.1A8B51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `ayaneo_ps2_priv_data` structure is missing the `const` qualifi=
er.
--

--- Patch [3]: [PATCH v3 3/3] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 ca=
rd with special WSA channel mapping ---
commit b02e8ff5c253c4eba630e44b1766096e7e732603
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with special WSA channel ma=
pping

The WSA Speakers are connected on the WSA2 interface, but the
WSA and WSA2 links are handled as a single dai and DSP interface, so
we need to specify the channel mapping of the Ayaneo Pocket S2 for the
WSA dai in order to have functional playback and avoid DSP errors.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index a9304784d41ee..4ccff32a413b6 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c

[ ... ]

> @@ -293,6 +341,14 @@ static int sc8280xp_platform_probe(struct platform_d=
evice *pdev)
>  	return devm_snd_soc_register_card(dev, card);
>  }
> =20
> +static struct snd_soc_common ayaneo_ps2_priv_data =3D {

[Severity: Low]
Should ayaneo_ps2_priv_data be declared as const?

Other similar structures in this file, such as eliza_priv_data, are already
marked as const.

> +	.driver_name =3D "ayaneo-ps2",
> +	.dapm_widgets =3D sc8280xp_dapm_widgets,
> +	.num_dapm_widgets =3D ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.snd_prepare =3D ayaneo_ps2_snd_prepare,
> +	.wcd_jack =3D true,
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-topic-sm86=
50-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org?part=3D3
