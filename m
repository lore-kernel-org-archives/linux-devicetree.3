Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8497042BC33
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556812; cv=none; b=KNXj+dCGXCg3Q2fGAeyMErglGBCIzyKzbjYmkOiU2649UGCGOnVReXm63OJp9+JI8fjYZbrSjzEZDVEreypDvsYcgTLIPxTth5z9TrwOqP2HUUAcwj1PvIr/zzplx5ORWSoCSTwqsfeYkGHW6zeYgVvGvT+rlOCACAehDPde+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556812; c=relaxed/simple;
	bh=f5Y3zzljY+0C2tpGNx0DAYYJPtfef3VPn3gFSB3HV1E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bg/uLcznhO2SVr2N49mDKbd4YrgFzxxMYMVMy8yrjZZ1agK291WUnqLoMRTfwOwGWP0ODWcsucpsSoQXiYKyLVI64NdM7g8y1NwrMMBzy8/bF4i+t5lpHP2psogxT1t38hHKhDZmZgHriI1JkuyVG6n2Kd+pk/ioPi7/s6dUUlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qk98KQNp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qk98KQNp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78D41F000E9;
	Mon, 20 Jul 2026 14:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784556811;
	bh=AnN4ONjTk/96bde/qY95y7LOG4PsgYOTCIggHWUdRlg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qk98KQNpKlLuhlNu0dp6vrDNgDIBA8gAl1RhQ2zhszc1nKtcrRoXeIjnYjdgVXi+1
	 R2pN8nkHNcQcO9o0g9AL7PaVWkQkkyWiSPNwna5t+TATuYcYO0Bx09DGBm44Iumius
	 tTNYhdRCvIUgaVyHHFHAoLMdRBE7ja5mAcWVzP+EkQF6WWO9az76692flmfdfPtYM9
	 INXv5hpnIRqo78JhQswHN4ilsJ+8goQ8wU7FS9KlRF8D3wFAfn4LYD/k1exGA298Yn
	 SpYtVqDLkMryMkihWeQK1aLMg9R1ISnH3oJyQJift+Z/9MwpFu2w7jdvWmBqY4oi1Q
	 eVSYdzMZZi7uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 08/12] media: mediatek: jpeg: fix remove buffer
 removal timing for multi-core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720133432.1042046-9-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
 <20260720133432.1042046-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:13:30 +0000
Message-Id: <20260720141330.D78D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] List corruption and race condition due to delayed buffer removal f=
rom the V4L2 M2M ready queues.

Pre-existing issues:
- [High] Potential Use-After-Free due to scheduling timeout work before acq=
uiring hardware locks.
- [High] Lack of synchronization between the hardware IRQ handler and job t=
imeout worker leads to double completion.
- [High] Use-After-Free of `mtk_jpeg_ctx` during file descriptor release.
- [High] Unkillable deadlock in `stop_streaming` when buffers are queued bu=
t M2M job is not started.
--

--- Patch [8]: [PATCH v16 08/12] media: mediatek: jpeg: fix remove buffer r=
emoval timing for multi-core ---
commit ddec7ab7308507663bea72ead9e975996dce1888
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix remove buffer removal timing for multi-core

This commit moves the calls to v4l2_m2m_src_buf_remove() and
v4l2_m2m_dst_buf_remove() inside the spinlock-protected scope in the jpeg
encoder and decoder workers. This is intended to ensure buffers are properly
synchronized before removal from their queues to avoid buffer loss.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1654,9 +1654,6 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
>  		goto enc_end;
>  	}
> =20
> -	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> -
>  	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
>  			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
> =20
>  	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);

[Severity: High]
This is a pre-existing issue, but does scheduling the timeout work before
acquiring hw_lock risk a use-after-free?

If the worker thread is preempted for more than the timeout duration just
after calling schedule_delayed_work(), the timeout work could execute,
reset the hardware, and return the buffers to userspace via
v4l2_m2m_buf_done().

Userspace might then free or reuse these buffers. When this worker thread
eventually resumes, it would blindly configure the hardware with the
invalidated buffer pointers and start the hardware operation, which could
lead to memory corruption. This appears to affect both mtk_jpegenc_worker()
and mtk_jpegdec_worker().

> @@ -1674,6 +1671,8 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
>  			     &src_buf->vb2_buf);
>  	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
>  	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);

[Severity: High]
Can this lead to list corruption if the hardware finishes very quickly?

Because v4l2_m2m_src_buf_remove() and v4l2_m2m_dst_buf_remove() are called
after mtk_jpeg_enc_start(), the hardware can raise an interrupt before the
buffers are removed from the ready queue.

Since the IRQ handler does not acquire hw_lock, it can run concurrently on
another CPU and transition the buffer to userspace via v4l2_m2m_buf_done().
If userspace quickly dequeues and requeues the buffer, list_add_tail() will
be invoked to insert it back into the ready queue.

Because this worker thread has not yet removed the original list node,
could this corrupt the doubly-linked lists? I notice this order is used in
mtk_jpegenc_worker(), but mtk_jpegdec_worker() correctly calls the remove
functions before starting the hardware.

>  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);

[Severity: High]
This is a pre-existing issue, but does calling v4l2_m2m_job_finish()
synchronously here open a window for a use-after-free of the context?

If userspace closes the file descriptor while an encode or decode job is
running, mtk_jpeg_release() invokes v4l2_m2m_ctx_release(), which tries
to wait for running jobs by checking the TRANS_RUNNING flag.

Since v4l2_m2m_job_finish() is called immediately after starting the
hardware, the flag is cleared before the hardware actually finishes. This
causes mtk_jpeg_release() to proceed without waiting and free the context.

When the hardware interrupt eventually fires, the IRQ handler dereferences
the freed context:

mtk_jpegenc_hw_irq_handler()
    mtk_jpegenc_put_buf()
        ctx =3D jpeg->hw_param.curr_ctx;
        spin_lock_irqsave(&ctx->done_queue_lock, flags);
       =20
Can this lead to memory corruption when the lock is accessed on the freed
context?

[ ... ]

While reviewing this patch, I noticed a few other pre-existing issues in
related code.

[Severity: High]
This is a pre-existing issue, but is there a race condition between the
hardware IRQ handler and the job timeout worker?

In mtk_jpeg_enc_hw.c, the IRQ handler uses the asynchronous
cancel_delayed_work():

mtk_jpegenc_hw_irq_handler() {
    ...
    cancel_delayed_work(&jpeg->job_timeout_work);
   =20
    ctx =3D jpeg->hw_param.curr_ctx;
    ...
}

If the hardware interrupt fires at the exact moment the timeout worker
begins executing, cancel_delayed_work() returns false and does not wait.
Because neither the IRQ handler nor the timeout worker acquires hw_lock,
both will execute concurrently.

Both paths will read the same buffer pointers from hw_param and invoke
v4l2_m2m_buf_done(), which could result in a double completion of the V4L2
buffers and a double increment of the hw_rdy atomic counter.

[Severity: High]
This is a pre-existing issue, but can mtk_jpeg_enc_stop_streaming()
deadlock if buffers are queued but the M2M job is not started?

In mtk_jpeg_core.c:mtk_jpeg_enc_stop_streaming():

    if (jpeg->variant->multi_core)
        vb2_wait_for_all_buffers(q);

    while ((vb =3D mtk_jpeg_buf_remove(ctx, q->type)))
        v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);

If userspace queues buffers on only one queue (e.g., OUTPUT but not
CAPTURE), the V4L2 mem2mem core places the buffers in the driver's ready
queue but does not schedule the job.

If userspace then calls STREAMOFF, the wait loop precedes the cleanup
loop. vb2_wait_for_all_buffers() will block waiting for the driver to
return all buffers, but the code that returns the buffers is located after
the wait call.

Could this cause the process calling STREAMOFF to block forever in
uninterruptible sleep? The same logic appears to be present in
mtk_jpeg_dec_stop_streaming() as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133432.1042=
046-1-kyrie.wu@mediatek.com?part=3D8
