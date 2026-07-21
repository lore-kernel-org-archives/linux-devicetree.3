Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77673FDBF7
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617238; cv=none; b=osoZYRjB+cL+Z8AqLe6TlER2AbA3viK14MP6DQmGpI91Oi2QpukaX450K7kch/6kFyDSAW2pqkIosOysiphQgWbnFD9ENoB3PSUx05bRigq3YYW8qT8edWozb4AYBKBpFWZMi9bVLYSHC19uBWAxvs7spiPey2mFE1OeuK+GHbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617238; c=relaxed/simple;
	bh=zP/6RuIxJ1hbHtHYhRk/LmPKMP0w2cPoXAjAbx/XK70=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D7iqN/nrIh68jWbk1oZYhL4BSkoO1m4XzLbwOP+2g7EzapTeoZSzKBqlZ77vXy0MsqPeQ+S4sMihetQBcKxda64lL3a2u6ISdiKctS8tEALnNxHrXXzamaU6UB1i4lNUiRZdyIIJMhr87vohm1SYgP62Obepa38QUA4hLBQixHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uo6tb+xv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uo6tb+xv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C371F000E9;
	Tue, 21 Jul 2026 07:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784617236;
	bh=IFvLr40XZYQNJGBQrKcySZrDgppWNgrRIB6vAXjX76U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uo6tb+xvw0wIoI9x1qydfAnQ6cdrMYuo9TQl1XvLpsNRDMyLuc5LG1SLL+qlWntAp
	 Y0yNBwhXp05jga370noE0mLX4kBtnCc2nWTuZZFPsDAKjowiWoWB4V+n7qTy4qsEZC
	 KLDtmbkwx9s+mVCs5forQHoVoONNhgceRzn0rhBppofRpOE8XNYVsirrnqA1+QMl99
	 +wXUnEAIh/xzD7CGBrU1QsWS8seS5WdMcsEZwirCPDf4KvX9oEcM3+Vb09PtCmtkKs
	 qLX5NGiUFBUsesHDASimBMT/EGSgytlBt1sd/Y7xPtb9ewL4K2z5827oLR8ICw6LSU
	 e1NXhmlSOeDNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] media: synopsys: hdmirx: add HDMI audio capture
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Paunovic" <royalnet026@gmail.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721064115.64809-3-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-3-royalnet026@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 07:00:36 +0000
Message-Id: <20260721070036.51C371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The use of `swab32()` when extracting the 20-bit ACR N and CTS val=
ues incorrectly scrambles their bits. Because the packet bytes are stored c=
ontiguously from the LSB up (PB0 in [7:0], PB1 in [15:8], etc.), reversing =
the 32-bit word using `swab32()` places the LSB of CTS (PB1) into the MSB o=
f the extracted value, and the MSB of CTS (PB3) into the LSB. Masking this =
result produces a completely invalid sample rate.

Pre-existing issues:
- [High] The V4L2 `video_device` is embedded in `struct snps_hdmirx_dev`, w=
hich is allocated using `devm_kzalloc`. The driver sets `vdev.release =3D v=
ideo_device_release_empty`. If a user space process keeps the `/dev/videoX`=
 file descriptor open during device unbind, the `devm` subsystem will free =
the `snps_hdmirx_dev` memory. When the process later closes the file descri=
ptor, the V4L2 core will access the freed `video_device` to decrement its r=
efcount and call the release callback, causing a use-after-free vulnerabili=
ty.
--

--- Patch [2]: [PATCH v4 2/4] media: synopsys: hdmirx: add HDMI audio captu=
re support ---
commit 19c9c4db1394f1dc0fc1cb44d51317198a87b078
Author: Igor Paunovic <royalnet026@gmail.com>
Date:   Tue Jul 21 06:41:13 2026 +0000

    media: synopsys: hdmirx: add HDMI audio capture support

This patch adds HDMI audio capture support to the Synopsys DesignWare HDMI =
RX
controller. It extracts the embedded audio stream and exposes it as an ALSA
capture device via the generic hdmi-codec. It also introduces a periodic
worker to keep the local audio reference clock locked to the source.

> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 25f8ca0d6d946..1b4a7fda9e195 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c

[ ... ]

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
> +	 * 0 in register bits [7:0], so byte-reverse each word to line the
> +	 * bytes up: CTS is packet bytes 1-3 (PKTDEC_ACR_PB3_0) and N is
> +	 * packet bytes 4-6 (PKTDEC_ACR_PB7_4), 20 bits each. readl()
> +	 * already abstracts the bus endianness, so the reversal is
> +	 * unconditional.
> +	 */
> +	acr_cts =3D swab32(acr_pb3_0) & 0xfffff;
> +	acr_n =3D (swab32(acr_pb7_4) & 0x0fffff00) >> 8;

[Severity: High]
Does this byte reversal using swab32() incorrectly scramble the N and CTS
values?

Because the packet bytes are stored contiguously from the LSB up (with pack=
et
byte 0 in [7:0], packet byte 1 in [15:8], etc.), reversing the 32-bit word
using swab32() places the LSB of CTS (from PB1) into the MSB of the extract=
ed
value, and the MSB of CTS (from PB3) into the LSB.=20

Will this result in an invalid sample rate being calculated, causing the
driver's fallback logic to silently ignore the broken rate and use 48kHz? T=
his
could cause any audio stream not natively at 48kHz to be played back at the
wrong rate.

> +	tmds_clk =3D tmdsqpclk_freq * 4 * 1000U;
> +	if (acr_cts !=3D 0) {
> +		fs_audio =3D div_u64((tmds_clk * acr_n), acr_cts);

[ ... ]

> @@ -2765,6 +3064,10 @@ static int hdmirx_probe(struct platform_device *pd=
ev)
>  						       V4L2_DEBUGFS_IF_AVI, hdmirx_dev,
>  						       hdmirx_debugfs_if_read);
> =20
> +	ret =3D hdmirx_register_audio_device(hdmirx_dev);
> +	if (ret)
> +		dev_warn(dev, "failed to register HDMI audio codec: %d\n", ret);
> +
>  	return 0;

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-free ri=
sk
during device unbind in this driver?

The V4L2 video_device is embedded in struct snps_hdmirx_dev, which is
allocated using devm_kzalloc() earlier in hdmirx_probe(). However, the driv=
er
sets the release callback to video_device_release_empty in
hdmirx_register_stream_vdev().

If a user space process keeps the /dev/videoX file descriptor open during
device unbind (such as during driver unbind or module removal), the devm
subsystem will free the snps_hdmirx_dev memory. When the process later clos=
es
the file descriptor, will the V4L2 core access the freed video_device memory
to decrement its refcount and call the release callback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721064115.6480=
9-1-royalnet026@gmail.com?part=3D2
