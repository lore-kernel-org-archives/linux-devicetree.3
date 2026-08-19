Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F6D2AE7A
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787141967; cv=none; b=FIkEPUMYeQZByI4zS5NDlEgnYD7G26AUrkARmWmqBRSig6IiUY2HdtPYO8+7qJzvTC3+T7YPcsa9trCrQoI8LtCd7T5O4TDRa/NDmzRl5EQlGyZBY1wYDnWw/GM3HMv09oklWSVf12BBWV/tC3UGXHfQA0ElBmcWTX59DwkviSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787141967; c=relaxed/simple;
	bh=twxK1k8C4+BFyUdhe9LCrhIhNoSuUCBW/3QagAujVQk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sOpWO6rNscGZJqPcnYwoGSFDV1B4x4Ey6sZN0uUfRF+gJQs9Zo99UlGcNPVshTb96y6hWlKsgfa4Gqa0wneMJv7iVrCee1myqYUt/MrpOxTjxZQTgioewE1y7Td1Q1IVEHMO9nxZkI1ZlJx4YHUvslToPUNfZLZ0DAWU4VEjYS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNPRITf4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNPRITf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2056E1F000E9;
	Wed, 19 Aug 2026 12:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787141965;
	bh=QW5i7J5Py7ZqqAad2od0Xsqzds2PS7j0pUJckUGSgB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WNPRITf4tf6Bn/UOevqhhfMJsYric/QNUspfpdrb8KBGQx6UFxyCko2q/fIX7B0CJ
	 nkYAzDbIT6FuxnVOoCbAamS0jkg8Tk0fTrrVph+l19ZzY74U+Gu7K9GS2E263ljlij
	 tp1foHRzX9n/CfYHQJDUQMFb5JZZJg4CvBC+4c9xprRNFP4bdYl5yl19NN1LKdZ/AC
	 A79QI55TKndNcJGH7W24VUpT5n17034qmE+pf8IZ/nm5KPmm4z9LiGAC2AbDQtV+2u
	 Xb3JWfslTOJZ8Lbp5tl0ILVzYM6LpLgW8nHbaZjwKlAHkjnXaBj47djXbSRxfxA5l2
	 uZ2dKbNDGT5Sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] media: verisilicon: Complete the request on the
 ->run() error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260819-rk3588-jpegdec-v1-2-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
 <20260819-rk3588-jpegdec-v1-2-33d74cdf369c@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 12:19:24 +0000
Message-Id: <20260819121925.2056E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Unvalidated divisor derived from user-controlled AV1 tile conf=
iguration causes divide-by-zero panic.
- [Critical] Massive out-of-bounds write on a DMA coherent buffer due to un=
validated AV1 tile dimensions.
- [High] Missing NULL pointer check for destination buffer mapping in H1 JP=
EG encoder.
- [High] Media request control objects are leaked when device_run() fails e=
arly, causing indefinite blocking.
--

--- Patch [2]: [PATCH 2/7] media: verisilicon: Complete the request on the =
->run() error paths ---
commit f5dd21ff10c1a9217ffb61543de91059d5e0444c
Author: Sascha Hauer <s.hauer@pengutronix.de>

media: verisilicon: Complete the request on the ->run() error paths

This commit modifies several Hantro codec ->run() callbacks to ensure
hantro_end_prepare_run() is called with an error code on early return paths.
This prevents media request control objects from being leaked when the run
operations fail.

[ ... ]
> The buffers are still returned to userspace, device_run() finishes the job
> with VB2_BUF_STATE_ERROR, but nothing completes the control handler object
> bound to the media request. vb2_buffer_done() only unbinds the request
> object owned by videobuf2 itself, so num_incomplete_objects never drops to
> zero and the request stays in MEDIA_REQUEST_STATE_QUEUED forever: poll() =
on
> the request file descriptor never returns and MEDIA_REQUEST_IOC_REINIT
> fails with -EBUSY. The request is only cleaned up when userspace closes i=
t.

[Severity: High]
This is a pre-existing issue, but looking at device_run() in hantro_drv.c,
if it fails early before calling ctx->codec_ops->run(), it jumps to the
err_cancel_job label:

drivers/media/platform/verisilicon/hantro_drv.c:device_run() {
    ...
	if (ret < 0)
		goto err_cancel_job;

	ret =3D clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
	if (ret)
		goto err_pm_put;

	v4l2_m2m_buf_copy_metadata(src, dst);

	if (ctx->codec_ops->run(ctx))
		goto err_clk_disable;

	return;
    ...
err_cancel_job:
	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
}

Does this error path also leak the media request control object? It finishes
the job but doesn't seem to complete the control objects, which might leave
the request in MEDIA_REQUEST_STATE_QUEUED indefinitely.

[ ... ]
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc=
.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> index aa34bd2e47ad2..b273b0b56ced5 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> @@ -143,8 +143,10 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ct=
x)
> =20
>  	memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));
>  	jpeg_ctx.buffer =3D vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> -	if (!jpeg_ctx.buffer)
> +	if (!jpeg_ctx.buffer) {
> +		hantro_end_prepare_run(ctx, -ENOMEM);
>  		return -ENOMEM;
> +	}

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this fix,
I noticed that hantro_h1_jpeg_enc_run() in hantro_h1_jpeg_enc.c appears to
be missing this same NULL pointer check entirely:

drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c:hantro_h1_jpeg_enc_=
run() {
    ...
	jpeg_ctx.buffer =3D vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
	jpeg_ctx.width =3D ctx->dst_fmt.width;
	jpeg_ctx.height =3D ctx->dst_fmt.height;
	jpeg_ctx.quality =3D ctx->jpeg_quality;
	hantro_jpeg_header_assemble(&jpeg_ctx);
    ...
}

Since vb2_plane_vaddr() can return NULL if the buffer cannot be mapped,
could this cause a NULL pointer dereference in hantro_jpeg_header_assemble()
if userspace submits an unmappable buffer?

[Severity: Critical]
This is a pre-existing issue, but I noticed another potential problem relat=
ed
to V4L2 control validation in the AV1 decoder:

drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:rockchip_vp=
u981_av1_dec_set_tile_info() {
    ...
	int context_update_y =3D
	    tile_info->context_update_tile_id / tile_info->tile_cols;
	int context_update_x =3D
	    tile_info->context_update_tile_id % tile_info->tile_cols;
    ...
}

Userspace provides tile_cols via the V4L2_CID_STATELESS_AV1_FRAME control.
If this value is not validated by the V4L2 core or the driver, could setting
tile_cols to 0 trigger a divide-by-zero kernel panic?

[Severity: Critical]
This is another pre-existing issue in the same function. Further down,
tile_cols and tile_rows are used as bounds for a nested loop that writes
to the DMA coherent buffer:

drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:rockchip_vp=
u981_av1_dec_set_tile_info() {
    ...
	for (tile0 =3D 0; tile0 < tile_info->tile_cols; tile0++) {
		for (tile1 =3D 0; tile1 < tile_info->tile_rows; tile1++) {
			int tile_id =3D tile1 * tile_info->tile_cols + tile0;
			u32 start, end;
			u32 y0 =3D
			    tile_info->height_in_sbs_minus_1[tile1] + 1;
			u32 x0 =3D tile_info->width_in_sbs_minus_1[tile0] + 1;

			/* tile size in SB units (width,height) */
			*dst++ =3D x0;
            ...
}

The av1_dec->tile_info.cpu buffer is allocated with a fixed size
(AV1_MAX_TILES * 16 bytes). If a user provides large unvalidated values
for tile_cols and tile_rows (up to 65535), could this cause a massive
out-of-bounds write and memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-rk3588-jpe=
gdec-v1-0-33d74cdf369c@pengutronix.de?part=3D2
