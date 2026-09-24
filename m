Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D7548EC79
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256907; cv=none; b=F0/soyS2lIckQum1FTJvJwoXmFXJ3bbZZNZrdJw8x71EybwW/vNKxwaoMGfOsAxileRQ+sadqy0daq7F+pHc90E4qUAj3pVE/ejps6WFuXAuvnORDN3dVW+jWjQ6uVVIJKmw2lSRCmGUuXThDlX8y8Y6Vkg0M5aI5/ZiCK/kq0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256907; c=relaxed/simple;
	bh=W7P0npZnKAfQM2DThjw8IC37dpVdKH6glV2ziPoYVGc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UBbDxpubWKtH9I4wyF1JhgY+UjnpGnyAdPdIsXkYkUgv9V96Z9xpUS0e2Ir5z0vt04yTHvg0+HMgYeHZ5JWiI4mH5HtfRUw6fQbfPrcfhKhhZLb3xSDh5bkTQX75W+iiLgXIbe+Rx9gw0Iis4882uuhwHHIhMp2FKlkRCyCMwU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8gYsabW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8gYsabW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06821F000FF;
	Thu, 24 Sep 2026 13:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256899;
	bh=G24U519cijnVpy1qj8IDcFSLFvAyUleVzqF08eaEhGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U8gYsabWDAdI418Wm38oBAlhlmetSwEO0yR4uKjHplesM+9Bvr9P820J++7Xro7I2
	 E2g2v4FNAlbfuJ3sBAP/PEBPxEabV1ENFq2I2lZ0u3XEZFtg0LA2+sIAHI7J5wRHk+
	 CaDaW2SHPmW5ynBJHr//HRMXtc5fJKzMlO7nevfE4xUqwpmMMJjYPSEbY6VATTIjzF
	 ZsPXCpulDaA8H2QangI4MaiPH3h7eL941tl+0rN5nE2Vq1KPOM1fFbWR6prXYQ4Ujb
	 j7b4mTT4CsDn+N3z/3g1h7AK+b+mz/vHmpYum2fq3gZrw0e04Ot8wRU87Y7FmNr+b6
	 AocEqwS+bHZfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/8] ASoC: qcom: sdm845: Demystify TDM masks a bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924-pixel3-audio-v4-1-85b5d133aa5e@ixit.cz>
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-1-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:34:58 +0000
Message-Id: <20260924133458.E06821F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ASoC: qcom: Incorrect RX suffix for microphone TDM masks
--

commit 58ae8e5a0a62726195e8056775500ca69d67f4a4
Author: David Heidelberg <david@ixit.cz>

ASoC: qcom: sdm845: Demystify TDM masks a bit

This commit describes the bits used for each RX/TX TDM mask instead of
using hardcoded hex values.

> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 6843ab8ba017e..0ce8265ab1c1f 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -23,9 +23,14 @@
>  #define DEFAULT_MCLK_RATE		24576000
>  #define TDM_BCLK_RATE		6144000
>  #define MI2S_BCLK_RATE		1536000
> -#define LEFT_SPK_TDM_TX_MASK    0x30
> -#define RIGHT_SPK_TDM_TX_MASK   0xC0
> -#define SPK_TDM_RX_MASK         0x03
> +#define LEFT_SPK_TDM_RX_MASK	BIT(0)
> +#define RIGHT_SPK_TDM_RX_MASK	BIT(1)
> +#define SPK_TDM_RX_MASK		(LEFT_SPK_TDM_RX_MASK | RIGHT_SPK_TDM_RX_MASK)
> +#define MIC1_TDM_RX_MASK	BIT(2)
> +#define MIC2_TDM_RX_MASK	BIT(3)
> +#define MIC_TDM_RX_MASK		(MIC1_TDM_RX_MASK | MIC2_TDM_RX_MASK)

[Severity: Low]
Are these microphone masks named correctly?

Microphones are capture devices that transmit data on the bus to the CPU,
meaning they utilize TX slots from the codec's perspective.=20

While the bitwise values remain correct and do not introduce a functional
regression, naming these slots with an RX suffix appears to contradict
their semantic role. This is particularly noticeable since the stated goal
of this patch is to clarify the masks by describing their RX/TX directions.

> +#define LEFT_SPK_TDM_TX_MASK	(BIT(4) | BIT(5))
> +#define RIGHT_SPK_TDM_TX_MASK	(BIT(6) | BIT(7))
>  #define NUM_TDM_SLOTS           8
>  #define SLIM_MAX_TX_PORTS 16
>  #define SLIM_MAX_RX_PORTS 13

[ ... ]

> @@ -128,8 +133,10 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_s=
ubstream *substream,
>  			goto end;
>  		}
>  	} else {
> -		ret =3D snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
> -				8, slot_width);
> +		ret =3D snd_soc_dai_set_tdm_slot(cpu_dai,
> +					       SPK_TDM_RX_MASK |
> +					       MIC_TDM_RX_MASK, 0,
> +					       NUM_TDM_SLOTS, slot_width);

[Severity: Low]
Does passing MIC_TDM_RX_MASK here create confusion in the capture path?

This passes the RX-suffixed microphone masks into the tx_mask parameter of
snd_soc_dai_set_tdm_slot() for the CPU capture DAI, since qdsp6 AFE expects
tx_mask for capture.=20

Could this be renamed to MIC_TDM_TX_MASK to properly reflect its transmit
role and align with the parameter it is passed into?

>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>  					__func__, ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-pixel3-aud=
io-v4-0-85b5d133aa5e@ixit.cz?part=3D1
