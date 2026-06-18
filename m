Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C133B42FD
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772126; cv=none; b=mxzOsj6B9tSruz3uMwNFr05Xd1A39TbbPVmAEQ2u60MfIW2/0j27KQmsyeGY4NbFG1L5BBYpthM4O63ZVSgwAELLt2YEg5hMzgBxN9TmwAsINPJsE7Ia1m9sgQeSbDFsDdiJEoyauQolWQUMZfGCiAVWDWgI9Key07fGQZLU7j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772126; c=relaxed/simple;
	bh=J6e8rNiFqIOMc7LL5MXSQXuuuTKRLNQTPSsQRJOJ7gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VHkFLYFuNDxwCiXnHMge0/oYwLtliuXUdYsFO3+9J0IyVjxsyXd4KuiXVqjHlqevUgUxtFnSsQ/OKaQI5XrH5itD7tzVcw6uV1pqXukpPz9a26ImPtqDpbFbON8LNubXOv3gAE5y4tgGmlTY9TPYieILgdY3xXEdP1qSIi8OaEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coGgeTaf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coGgeTaf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73C31F00A3A;
	Thu, 18 Jun 2026 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781772125;
	bh=aN/p6dHLlQgtyw2tRBETMb2fuJGO9OjUQBrVojvqxhs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=coGgeTafXQ5sFbHd5pREGVzBeFCZ3YClZZgiav+CnWB+/dGecO22eE/DzmzrYoEIU
	 Or3G5NGyF1Aw+LrAtV+xmvCRFF9VWHZ/OAY0+qmI0xVmP3o2pCsh/Y00DQ+Rdbm1CO
	 MsP/jb+evZcs1H6fx8xRkLX+u8zp0RCSHBGKMoJOoXbhp8Clb9tM2tExJ3vqAwWnwR
	 0x+6OMljTTi3MlHEPhPwkWtwqtOoqbuUrNYxIKMrdPPa96rO788PpxSZYzvuoMbozF
	 oIdM9JWU4z+0EIoXjLd+wpnZt99u1f8Z8VcrL599lv2To643B9AEGJ66dJMocIVWPX
	 cxjcpsbizAcrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] ASoC: codecs: ES8389: Fix the issue about
 mclk_src
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618082842.2778-4-zhangyi@everest-semi.com>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
 <20260618082842.2778-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 08:42:04 +0000
Message-Id: <20260618084204.D73C31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Modifying device tree property interpretation breaks existing =
configurations.

Pre-existing issues:
- [High] Incorrect BCLK (sysclk) calculation for mono streams.
--

commit 97d350d02faf890bb7862a3fb657b9cbe4613b33
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Fix the issue about mclk_src

Fix the issue with incorrect modifications to mclk_src.
When the system needs to be configured to use the MCLK from the SCLK pin,
the code still sets the relevant registers to use the MCLK from the MCLK
pin.

> diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
> --- a/sound/soc/codecs/es8389.h
> +++ b/sound/soc/codecs/es8389.h
[ ... ]
> @@ -116,9 +116,11 @@
>  #define ES8389_TDM_SLOT               (0x70 << 0)
>  #define ES8389_TDM_SHIFT              4
> =20
> -#define ES8389_MCLK_SOURCE            (1 << 6)
> -#define ES8389_MCLK_PIN               (1 << 6)
> -#define ES8389_SCLK_PIN               (0 << 6)
> +#define ES8389_MCLK_MASK              (3 << 6)
> +#define ES8389_MCLK_FROM_SCLK         (1 << 6)
> +#define ES8389_MCLK_SOURCE            ES8389_MCLK_PIN
> +#define ES8389_MCLK_PIN               0
> +#define ES8389_SCLK_PIN               1

[ ... ]

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
[ ... ]
> @@ -607,9 +607,9 @@ static int es8389_pcm_hw_params(struct snd_pcm_substr=
eam *substream,
>  	regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE, ES8389_DATA_=
LEN_MASK, state);
>  	regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE, ES8389_DATA_=
LEN_MASK, state);
> =20
> -	if (es8389->mclk_src =3D=3D ES8389_SCLK_PIN) {
> +	if (es8389->mclk_src) {

[Severity: Critical]
Does changing this condition and redefining the pin macros break existing
device tree configurations?

Previously in es8389.h, ES8389_SCLK_PIN was 0. If an existing device tree
explicitly selected SCLK using <0>, it would match the old condition.
Because ES8389_SCLK_PIN is now redefined as 1, an existing legacy DT passing
<0> will evaluate as false here and incorrectly fall back to MCLK.

Similarly, if a legacy configuration used <64> for MCLK, it would now
evaluate as true and incorrectly select SCLK. Is there a need for
compatibility fallback logic to prevent ABI breakage for deployed platforms?

>  		regmap_update_bits(es8389->regmap, ES8389_MASTER_CLK,
> -					ES8389_MCLK_SOURCE, es8389->mclk_src);
> +					ES8389_MCLK_MASK, ES8389_MCLK_FROM_SCLK);
>  		es8389->sysclk =3D params_channels(params) * params_width(params) * pa=
rams_rate(params);

[Severity: High]
This is a pre-existing issue, but does this calculation result in an
incorrect sysclk for mono streams?

By using params_channels() in es8389_pcm_hw_params(), the physical clock
rate is derived from the logical channel count. For a mono stream, this
returns 1. However, on standard I2S buses, the physical frame always
contains 2 slots (left and right), meaning the actual physical bit clock on
the wire should be 2 * width * rate.

Could this cause the sysclk calculation to be halved, making it fail to
find a matching frequency and breaking mono playback?

>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618082842.2778=
-1-zhangyi@everest-semi.com?part=3D3
