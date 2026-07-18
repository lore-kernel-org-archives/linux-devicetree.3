Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A92D176FB1
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365797; cv=none; b=SgXWLTv05pSU6vv197P7B/ZWCIQu9NFQBSEFLZQL1e9bc0cY+i/1JtybTzPxt1SaV/ZnrYKwVAmTWIPY9f6Lf42gK0KJNk2f7jph75d7o61dTgiE2BMD5LVX0TqPomLJi3t05uteg2s7AmPaFNQ7DDeD0OdOcA1zjpQ9onCZ/Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365797; c=relaxed/simple;
	bh=u8wz0iE476go4ijdQsYSkQKRx3zPhqxohWpMWCSDXgg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZqeBh/+hgZ9jJ8G5S6m03R1vh+K+/+N3K9+kG3s1ZUj5tF2T7F69DZdE/wcn2GNgHfxBkOh7oa09HqXXm5e1wELL1Oe4tt8gLStarJgiszLY3NBv4y/3jxgxCau240rl02NaczD5OGerUX+8Mw9NNZRUrtrecHnPffmNEFhp8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URkOGN3d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URkOGN3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79E51F000E9;
	Sat, 18 Jul 2026 09:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365796;
	bh=RpKt7bFbtUXGvJYn5m3p9J251WLHphfCK6DFjnuvH+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=URkOGN3dnJZceI4VFPcd4Yid+r/lvYonRirzBr6cmnDs/7QwdzRdgKX1VB2ppacOu
	 ZcWU9fVbdAw4ST0cz/MMOOdiODO5QuXjMlG5v2LvKcPqp+ZR3+W4Iz+dfAC1bNhVi2
	 cnbVJV968utJM/4DI28U4FGfkmsanrW/UR9UUdHid5kVkDKehb/GQwnZTkCmNf85L6
	 SLLcEnUZNk1VglMaZJ6BkoPwJ/RlChSHd8JDNtnZe8qrm30xoCqMf92TYraa7PXgeN
	 qePLhHSOcCy3KqeMVCEKpYT4aKJcfLeAX1I8rcHH/mpr0V/gI2CsrKv2zh6agMOVea
	 HbIhR1RI9BReg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Paunovic" <royalnet026@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260718085728.6797-3-royalnet026@gmail.com>
References: <20260718085728.6797-1-royalnet026@gmail.com>
 <20260718085728.6797-3-royalnet026@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:09:55 +0000
Message-Id: <20260718090955.A79E51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect byte-swapping logic completely scrambles the extraction =
of Audio Clock Regeneration (ACR) CTS and N values, breaking sample rate re=
covery on little-endian architectures.
- [High] The `audio_work` delayed work is not explicitly cancelled in `hdmi=
rx_remove()`, leading to a Use-After-Free if the driver is unbound while an=
 audio stream is active.
--

--- Patch [2]: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio captu=
re support ---
commit b04bcd22f40b424aac824100715c46f764531875
Author: Igor Paunovic <royalnet026@gmail.com>

media: synopsys: hdmirx: add HDMI audio capture support

The Synopsys DesignWare HDMI RX controller extracts the audio stream
embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
controller. Expose it as an ALSA capture device by registering the
generic hdmi-codec as a child of the controller.

> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 25f8ca0d6d946..22f50cbf3fa7a 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c

[ ... ]

> +/* Recover the incoming audio sample rate from the ACR N/CTS + TMDS cloc=
k. */
> +static u32 hdmirx_audio_fs(struct snps_hdmirx_dev *hdmirx_dev)
> +{
> +	u64 tmds_clk, fs_audio =3D 0;
> +	u32 acr_cts, acr_n, tmdsqpclk_freq;
> +	u32 acr_pb3_0, acr_pb7_4;
> +
> +	tmdsqpclk_freq =3D hdmirx_readl(hdmirx_dev, CMU_TMDSQPCLK_FREQ);
> +	hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PH2_1);
> +	acr_pb3_0 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB3_0);
> +	acr_pb7_4 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB7_4);
> +	/*
> +	 * The packet decoder stores the ACR subpacket bytes with packet byte
> +	 * 0 in register bits [7:0], so byte-swap each word to line the bytes
> +	 * up: CTS is packet bytes 1-3 (PKTDEC_ACR_PB3_0) and N is packet
> +	 * bytes 4-6 (PKTDEC_ACR_PB7_4), 20 bits each.
> +	 */
> +	acr_cts =3D be32_to_cpu((__force __be32)acr_pb3_0) & 0xfffff;
> +	acr_n =3D (be32_to_cpu((__force __be32)acr_pb7_4) & 0x0fffff00) >> 8;

[Severity: High]
Does this byte-swapping logic scramble the extraction of the CTS and N valu=
es
on little-endian architectures?

Since the HDMI ACR packet transmits the 20-bit CTS value across PB0, PB1, a=
nd
PB2, and because it is little-endian, applying a bitmask like
acr_pb3_0 & 0xfffff natively yields the correct CTS value without any swaps.

By byte-swapping the 32-bit register, the bytes are completely reversed.
The subsequent bitmask extracts the lower 20 bits of the swapped word, which
correspond to the lower nibble of PB1, all of PB2, and all of PB3, discardi=
ng
PB0 entirely.

The same applies to acr_pb7_4 to extract N. Will this regression result in
garbage values for both acr_cts and acr_n, forcing the driver to blindly
fall back to the default sample rate?

[ ... ]

> @@ -2784,6 +3052,9 @@ static void hdmirx_remove(struct platform_device *p=
dev)
>  	struct device *dev =3D &pdev->dev;
>  	struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
> =20
> +	if (hdmirx_dev->audio_pdev)
> +		platform_device_unregister(hdmirx_dev->audio_pdev);
> +

[Severity: High]
Can this lead to a use-after-free if the driver is unbound while an audio
stream is active?

The v3 changelog notes that the synchronous cancel for the audio_work
delayed work was removed here under the assumption that audio_shutdown()
handles it.

However, ALSA does not synchronously invoke the PCM .shutdown callback
when a device is unregistered if a userspace application holds the file
descriptor open.

Because hdmirx_dev is allocated using devm_kzalloc, it is freed immediately
after hdmirx_remove() returns. Will the un-cancelled audio_work delayed work
subsequently fire and access the freed hdmirx_dev memory?

>  	v4l2_debugfs_if_free(hdmirx_dev->infoframes);
>  	debugfs_remove_recursive(hdmirx_dev->debugfs_dir);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718085728.6797=
-1-royalnet026@gmail.com?part=3D2
