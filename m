Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB2330B15
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138677; cv=none; b=Vw0ZD2P7aZw4Udcoq/KLhryF+2G/95SI7OxqPmsz8ERvkOx3zysGokZ/ZWJzZiJjylyw2vJ7CPDFLxh1t2eHPubk8YMQgOg5RS420IxFM1zX7KmPlNvT4Ytj+COgSK5tEcN8qYZ7v1mAPOgn4G9WqSpzXKX6pl5Ow5Yy79tbJRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138677; c=relaxed/simple;
	bh=5i0px43+O5vwLopBpX48a7Cz9Cfd6IVI9A1H6Ffje3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tSZ6uP19liV/paeNJ4AzfdNumONk2XAg71t0+uItA7Vi1st5dd1x67w1ljYzWsorKo4/huT+yXN7Ti4Mj8uIb75mZwD8vqWF2/1+eCypYqsAFZlOzuk63zH2eZjfNi1AottkBVc33j7fefv1vzRxZ1aju9nqg4VsOFi8JI2GoE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WL6qTef1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WL6qTef1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D111F000E9;
	Wed, 19 Aug 2026 11:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787138676;
	bh=xIo1tlE0VxIztwXU+LL+9vWKaY6v0lBwe4NZPfGrVCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WL6qTef1rTBLO0Qf78NPui99Lhoo6RCDoqkm4Xtgg2DRerTYaDHjNqst+0NPD5PNT
	 i8GXNYjdLpVfvWv/0T3tQ4mW6rylfQ5Al4KM8/haiEX9ILF2T5/gs3Fi9lG/jXBzSR
	 ke2uMtrgHGNaf6ULCQAcbR3Fugyu2A42LnjXeCz0ZMSMaePv1KYlTFk+6fBtexjZuB
	 TL95cGRA81q5HVx09xFDw5LY3m3NTJ3Smt6uGiU1S5feyq12IpUll+eFNz/rPVj3cH
	 WkViaJEMyMrIooGj9GOupx66GfyVvlMpRKIRnxYblvnp3PVm0lEAN2/Jg9urdaf4Na
	 NQIKqfti04CBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG
 decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
 <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 11:24:35 +0000
Message-Id: <20260819112435.C2D111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] DMA API violation and cache coherency bug when filling chroma plan=
e for grayscale JPEGs.
- [High] Lockless Read-Modify-Write on VDPU720_REG_INT causes destructive r=
ace between hardware IRQ and watchdog soft reset.
- [Medium] Valid JPEG frames are erroneously rejected due to a strict 64-by=
te tail search for the EOI marker.
- [Medium] Missing endianness conversions when writing 16-bit table entries=
 to the DMA side buffer.
--

--- Patch [5]: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG dec=
oder ---
commit 8ca41ed2bd2cec7b6e2c467549362041d9356521
Author: Lucas Sinn <lucas.sinn@wolfvision.net>

media: verisilicon: Add Rockchip VPU720 JPEG decoder

This commit adds support for the Rockchip VPU720 JPEG hardware decoder on
the RK3588 SoC to the verisilicon hantro driver. It introduces the
HANTRO_JPEG_DECODER codec and mode, implementing header parsing, Q/H table
side buffer generation, and handling of VPU720 specific configuration limit=
s.

> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu720_hw_jpeg_d=
ec.c b/drivers/media/platform/verisilicon/rockchip_vpu720_hw_jpeg_dec.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu720_hw_jpeg_dec.c
[ ... ]
> +static int vdpu720_write_qtbl(struct hantro_ctx *ctx,
> +			      const struct v4l2_jpeg_header *hdr)
> +{
[ ... ]
> +		/*
> +		 * Reorder zigzag =E2=86=92 raster scan.
> +		 * v4l2_jpeg_zigzag_scan_index[z] =3D raster position of zigzag
> +		 * element z.  JPEG Q-tables are stored in zigzag order; the
> +		 * hardware expects them in natural raster (row-major) order.
> +		 */
> +		for (i =3D 0; i < VDPU720_QTBL_ENTRIES; i++)
> +			dst[v4l2_jpeg_zigzag_scan_index[i]] =3D (u16)qtbl[i];

[Severity: Medium]
Will this write the 16-bit table entries correctly on a Big Endian kernel?

It looks like the Q-table elements are written using native CPU endianness.
Since the VPU720 hardware expects the DMA buffer to be in Little Endian for=
mat,
could this result in decoding failures and visual corruption on Big Endian
systems? Using explicit endian conversions like cpu_to_le16() might be
necessary here.

[ ... ]
> +static int vdpu720_write_htbl(struct hantro_ctx *ctx,
> +			      const struct v4l2_jpeg_header *hdr)
> +{
[ ... ]
> +		vdpu720_compute_mincode(dc_bits, min_dc, acc_dc);
> +		vdpu720_compute_mincode(ac_bits, min_ac, acc_ac);
> +
> +		for (i =3D 0; i < 16; i++)
> +			*p_mincode++ =3D min_dc[i];

[Severity: Medium]
Similarly, the Huffman mincode table entries appear to be written with
native CPU endianness. Does this also require cpu_to_le16() for the same
Little Endian hardware requirement?

[ ... ]
> +static int vdpu720_fill_chroma(struct hantro_ctx *ctx,
> +			       struct vb2_v4l2_buffer *dst_buf)
> +{
[ ... ]
> +	/* Available because variant->dst_needs_kmap */
> +	dst_cpu =3D vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> +	if (!dst_cpu) {
> +		dev_err(vpu->dev,
> +			"JPEG capture buffer has no kernel mapping\n");
> +		return -EINVAL;
> +	}
> +
> +	memset(dst_cpu + y_size, 0x80, size - y_size);

[Severity: High]
Can this memset result in data loss or corruption for the UV plane?

This memset modifies the CPU cache for a device-owned DMA buffer. Because it
is called from rockchip_vpu720_jpeg_dec_run() after the buffer has been
queued and synced for the device, it dirties the CPU cache without explicit
cache synchronization.

When the hardware completes its operations and the V4L2 core calls
dma_sync_sg_for_cpu() with DMA_FROM_DEVICE during DQBUF, the CPU cache is
unconditionally invalidated. Won't this destroy the CPU's memset writes and
leave the UV plane with uninitialized memory or stale data if non-coherent
DMABUFs are used?

[ ... ]
> +int rockchip_vpu720_jpeg_dec_run(struct hantro_ctx *ctx)
> +{
[ ... ]
> +	tail_len =3D min_t(u32, src_len, sizeof(tail));
> +	memcpy(tail, src_cpu + src_len - tail_len, tail_len);
> +
> +	for (i =3D 0; i + 1 < tail_len; i++)
> +		if (tail[i] =3D=3D 0xff && tail[i + 1] =3D=3D 0xd9)
> +			break;
> +
> +	if (i + 1 >=3D tail_len) {
> +		dev_err_ratelimited(vpu->dev,
> +				    "truncated JPEG, no EOI at the end of the %u byte payload (buffe=
r too small?)\n",
> +				    src_len);
> +		ret =3D -EINVAL;
> +		goto err;
> +	}

[Severity: Medium]
Could this strict 64-byte tail search reject valid padded JPEG frames?

If a userspace application or upstream pipeline pads the JPEG payload
(for example, with page-aligned or container-aligned chunks) and includes
the padding in bytesused, the padding might easily exceed 62 bytes.

If the 0xff 0xd9 EOI marker falls outside the strictly checked 64-byte tail
buffer, it looks like valid frames will be rejected with -EINVAL. Could this
be made more robust by scanning backwards dynamically or parsing the stream
length instead?

[ ... ]
> +static int vdpu720_soft_reset(struct hantro_dev *vpu)
> +{
> +	u32 status;
> +	int ret;
> +
> +	/*
> +	 * If the decoder is idle (DEC_E=3D0), set FORCE_SOFTRESET_VALID
> +	 * before triggering the soft reset, per downstream BSP behaviour.
> +	 */
> +	status =3D vdpu_read(vpu, VDPU720_REG_INT);
> +	if (!(status & VDPU720_DEC_E))
> +		vdpu_write(vpu, VDPU720_FORCE_SOFTRST, VDPU720_REG_SYS);
> +
> +	vdpu_write(vpu, status | VDPU720_SOFT_RST_EN, VDPU720_REG_INT);

[Severity: High]
Is there a race condition here between the watchdog soft reset and the
hardware IRQ?

vdpu720_soft_reset() is executed from the hantro_watchdog() workqueue in
process context and performs an unprotected Read-Modify-Write (RMW) on
VDPU720_REG_INT. Concurrently, rockchip_vpu720_irq() can preempt this in
hardirq context and write to the same register:

rockchip_vpu720_irq() {
    ...
    vdpu_write(vpu, clr_mask, VDPU720_REG_INT);
    ...
    vdpu_write(vpu, 0, VDPU720_REG_INT);
}

If an untimely IRQ fires, it could clear VDPU720_SOFT_RST_EN or
VDPU720_SOFT_RST_RDY midway through the reset sequence. Won't this cause
readl_relaxed_poll_timeout() to fail and force an unnecessary hard reset,
or corrupt the hardware state? Should this sequence acquire vpu->irqlock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-rk3588-jpe=
gdec-v1-0-33d74cdf369c@pengutronix.de?part=3D5
