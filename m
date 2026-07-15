Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0DF48C8A1
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146936; cv=none; b=qyhsYM/UhhLjxX2U2DoyR0l9kT/XiPY/wiBYEGLLZd/1eQ0grDbWdUgT2WbMm/uJCUTSL9mjTqins3cj24XvZ2w9VAUTAyfG8ZMoWYih3QbkE1OZVDdq/sopxyhm/5XJlsdStR6C9BsysiS78TVbcMQXZNh4g7nNmkJUpVw++Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146936; c=relaxed/simple;
	bh=T30w3UZ7yKxY9ul2JUD0RUUMOAJGsOG5DvVLNEeE3QY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Twa2tti3+TTRW62gAPTebQitm0mS+TxhLB14N1ROzTKXjL/xq55lnKWFZbuPppyN5cTH2s8L457EzcjYsU0+ncjUM6yptyWmFLRl/0vUmzsEB4ybKoVxi447YuLeh5NL9k5FQ04HHKQNS91Mg9tvWmLT2ed3/FFaJyWGeHu8kbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXQ1M3bG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXQ1M3bG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6C21F000E9;
	Wed, 15 Jul 2026 20:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784146935;
	bh=RaPuMzSBqXuixBmBEAHvdug0cI6L4FNUa8Od/sXL1SY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kXQ1M3bGlkjSlR0LkZkxB+CA5XYVVkOS867o4B8cwwS5mjeV//igPUx87DdMACiiQ
	 8sxa6nuhg5w3E2xBtXOSUuBNsn14XZi7TTu2dUPZzikogKPbQPRy9ZGckawPEsq3Xt
	 u5pM9rvxkOLgNEPvUjHenW5rTc2ULmIDU5weTjQqyGtXxj+y5v6pgs2Cmyf4nJmJUP
	 5+XsH9VM279xlyAqwTZ+Q95dZEWJxcMLwqtQTozBIc98uwfoARPxQ9gm+ENq1UFpIg
	 8wnV8pwr4VaDlUspc9meV4huwAQamq9bMQJtXlK1tSpkBlFUbV2HU+KjbrlOvT/Ora
	 d6CVZr8dF5bcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: synopsys: hdmirx: add HDMI audio capture
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Paunovic" <royalnet026@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715200834.8486-3-royalnet026@gmail.com>
References: <20260715200834.8486-1-royalnet026@gmail.com>
 <20260715200834.8486-3-royalnet026@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 20:22:14 +0000
Message-Id: <20260715202215.1F6C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Severe logical and mathematical errors in Audio Clock Regeneration=
 (ACR) N and CTS parsing, leading to hardware clock recovery failure.
- [High] Dummy `hdmirx_audio_get_dai_id` callback unconditionally returns 0=
, breaking S/PDIF DAI OF graph mapping.
--

--- Patch [2]: [PATCH v2 2/2] media: synopsys: hdmirx: add HDMI audio captu=
re support ---
commit c4b60dd6e2a0b110adfab2b5a2ccf3d214ed0d05
Author: Igor Paunovic <royalnet026@gmail.com>

media: synopsys: hdmirx: add HDMI audio capture support
   =20
The Synopsys DesignWare HDMI RX controller extracts the audio stream
embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
controller. Expose it as an ALSA capture device by registering the
generic hdmi-codec as a child of the controller, so that a
simple-audio-card in the device tree can bind the HDMI RX audio DAI.

> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 25f8ca0d6d946..acabd43664c10 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c

[ ... ]

> @@ -2646,6 +2662,255 @@ static int hdmirx_register_cec(struct snps_hdmirx=
_dev *hdmirx_dev,

[ ... ]

> +/* Recover the incoming audio sample rate from the ACR N/CTS + TMDS cloc=
k. */
> +static u32 hdmirx_audio_fs(struct snps_hdmirx_dev *hdmirx_dev)
> +{
> +	u64 tmds_clk, fs_audio =3D 0;
> +	u32 acr_cts, acr_n, tmdsqpclk_freq;
> +	u32 acr_pb7_4, acr_pb3_0;
> +
> +	tmdsqpclk_freq =3D hdmirx_readl(hdmirx_dev, CMU_TMDSQPCLK_FREQ);
> +	hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PH2_1);
> +	acr_pb7_4 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB3_0);
> +	acr_pb3_0 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB7_4);
> +	acr_cts =3D be32_to_cpu((__force __be32)acr_pb7_4) & 0xfffff;
> +	acr_n =3D (be32_to_cpu((__force __be32)acr_pb3_0) & 0x0fffff00) >> 8;

[Severity: High]
Does this code incorrectly parse the ACR N and CTS values?

The variables acr_pb7_4 and acr_pb3_0 are assigned the swapped register
contents (PKTDEC_ACR_PB3_0 is assigned to acr_pb7_4, and vice versa).

Additionally, applying be32_to_cpu() to the native-endian result of
hdmirx_readl() will cause big-endian byte-swapping on little-endian
architectures. Because of the swapped assignment and byte reversal, the
bitwise shift operations extract completely incorrect bytes.

Will this cause hardware clock regeneration to fail and silently fall back
to the ALSA default sample rate (48kHz)?

> +	tmds_clk =3D tmdsqpclk_freq * 4 * 1000U;
> +	if (acr_cts !=3D 0) {
> +		fs_audio =3D div_u64((tmds_clk * acr_n), acr_cts);
> +		fs_audio /=3D 128;
> +		fs_audio =3D hdmirx_audio_closest_fs(fs_audio);
> +	}
> +	return (u32)fs_audio;
> +}

[ ... ]

> +static int hdmirx_audio_get_dai_id(struct snd_soc_component *component,
> +				   struct device_node *endpoint,
> +				   void *data)
> +{
> +	return 0;
> +}

[Severity: High]
Does this dummy callback break the S/PDIF DAI OF graph mapping?

The driver registers two audio DAIs (0 for I2S, 1 for S/PDIF) to match the
DT binding. However, this callback unconditionally returns 0, which overrid=
es
the standard DAI index parsing in the ASoC core.

Consequently, any DT endpoint requesting S/PDIF (reg =3D <1>) will be
incorrectly forced to map to DAI 0 (I2S). This bypasses the intended
-EOPNOTSUPP rejection in hdmirx_audio_hw_params() and erroneously configures
the hardware for I2S when S/PDIF was requested.

Could this dummy callback simply be removed to allow the core to map the reg
property to the correct DAI ID naturally?

> +
> +static const struct hdmi_codec_ops hdmirx_audio_codec_ops =3D {
> +	.hw_params =3D hdmirx_audio_hw_params,
> +	.audio_shutdown =3D hdmirx_audio_shutdown,
> +	.get_dai_id =3D hdmirx_audio_get_dai_id,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715200834.8486=
-1-royalnet026@gmail.com?part=3D2
