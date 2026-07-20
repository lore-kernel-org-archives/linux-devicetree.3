Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F759475
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556519; cv=none; b=A65Bvkw3nYIF9q/xwTxbVMOjiFJwl7zbuykZuOhqrpEELQw/RWeO2cz4FdrFC+J0dKFt1oZipkDiP9IQgKZBeZFyFEirDwrDNsFpYcBrZLZU/u1UEluRhgnIeJ5fvmTd02pgHoTcPVrFSP6UX9WoeIaF9myYuRVqyN/nl1fgkug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556519; c=relaxed/simple;
	bh=UnjFcoyMGSUiAtYGZEZZ4zBMAxAnEBHDrp7iNeKaGj4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g6sD04DGdM35Gz/CK5oi1vUdROEOp9hGcz0p+x18O3ox4u6/b7P0lsNoav3UAZeNV4M34i5d0ANUt5HmImR+z1p6RB+q0A4/1Zqj6YiqoqBI1O4VKsYLUJj54oW/hi9iRmFgxkzoYFc2GlMFFDlJbvB+/rYPDIdH4roysE4W5r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjjFjDo5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjjFjDo5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28541F000E9;
	Mon, 20 Jul 2026 14:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784556518;
	bh=FCRK5rDKaNRXHsfMKArW+guhRA3VTj5DbJF68nq9EP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JjjFjDo5bzVHem3heAsh19ISSl31bNrREztmCV9xziIgtcOxoRd6pD/xCbjI/p5Vk
	 pr9lZz0VG11wsEHTVSRR9OCPGshciiao9yzVbUTwQgXE5u5NsXKrbJmP5NIAC06nee
	 cnr8THN/aLR5FmrGZjE+YKwyZ4XhwWNM5VIAtHCxc1K8lmybaIico9KMarAT+YkDM9
	 7nqu1pTOriLnGHSg8Nq2VMUg8E8ns0K/UPyanDDA18N+gsVDktsXUvcG1KIIT12VSH
	 9ntTxDKeJwRAUUP491bqt7BcnenigrPVFV7L2Zr2PGecbucPyynnxaYl+3nVRzQjwJ
	 9IvSaxIiiDo5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 07/12] media: mediatek: jpeg: fix resolution change
 event handling in decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260720133432.1042046-8-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
 <20260720133432.1042046-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:08:37 +0000
Message-Id: <20260720140837.C28541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Data race on V4L2 queue format structures due to unlocked modifica=
tion from the asynchronous worker thread.

Pre-existing issues:
- [High] Infinite workqueue loop and STREAMOFF deadlock due to missing .job=
_ready callback in multicore decoder.
--

--- Patch [7]: [PATCH v16 07/12] media: mediatek: jpeg: fix resolution chan=
ge event handling in decoder ---
commit e12d8cd3e85b476d842a0ea7879755769138198f
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix resolution change event handling in decoder

This patch refines the handling of resolution change events in the JPEG
decoder worker. It updates queue data before signaling the source change and
adds an early exit condition if already in the source change state.

> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1738,11 +1738,15 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
> =20
>  	if (mtk_jpeg_check_resolution_change(ctx,
>  					     &jpeg_src_buf->dec_param)) {
> -		mtk_jpeg_queue_src_chg_event(ctx);
> +		mtk_jpeg_set_queue_data(ctx, &jpeg_src_buf->dec_param);

[Severity: High]
Does calling mtk_jpeg_set_queue_data() from the asynchronous worker thread
create a data race?

This function writes directly to the format structures like ctx->out_q and
ctx->cap_q. Standard V4L2 ioctls like VIDIOC_G_FMT and VIDIOC_TRY_FMT read
these exact structures and rely on the video device lock (vdev->lock) for
serialization.

Since the worker executes without acquiring the device lock, could this
cause userspace to read torn or mismatched dimension/size values if
VIDIOC_G_FMT is called concurrently?

>  		ctx->state =3D MTK_JPEG_SOURCE_CHANGE;
> +		mtk_jpeg_queue_src_chg_event(ctx);
>  		goto getbuf_fail;
>  	}
> =20
> +	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE)
> +		goto getbuf_fail;

[Severity: High]
This is a pre-existing issue, but does jumping to getbuf_fail while
leaving buffers in the queue cause an infinite workqueue loop and
deadlock during VIDIOC_STREAMOFF?

In getbuf_fail, v4l2_m2m_job_finish() is called without removing the
source or destination buffers from the queue.

Looking at mtk_jpeg_multicore_dec_m2m_ops, it lacks a .job_ready callback:

static const struct v4l2_m2m_ops mtk_jpeg_multicore_dec_m2m_ops =3D {
	.device_run =3D mtk_jpeg_multicore_dec_device_run,
};

Because there is no .job_ready callback, the V4L2 M2M core assumes the
context is ready and immediately requeues the job. The worker will instantly
run again, hit this same early exit, and loop infinitely.

Additionally, since the buffers are never marked done or removed, could any
subsequent attempt by userspace to stop streaming deadlock permanently in
vb2_wait_for_all_buffers()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133432.1042=
046-1-kyrie.wu@mediatek.com?part=3D7
