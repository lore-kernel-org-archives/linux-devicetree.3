Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEB912FF69
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785046317; cv=none; b=VeXZpH7jbu9U8+ICUwjgkfeHQvlqkwjCrd1E8ppbCYmvFllw0cPX6A9R/gHX2b3dIIBNx6KbiUZxkz4WTm5zB8QwFmD6Tlzhc++hCpdpKPKNgYE9d31F32k5CPCaJtvdcYzipsBz8FBsiwz5KgPElSIs1t7Rc3U61b3vHBxjcrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785046317; c=relaxed/simple;
	bh=/+lA5aAoTz3J3simotZRzM87RDYgd/zCg2WSTamgs4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TBBQ/kuUK5b8bigUugzIK33nr3Lrqi0RM0+FoDr08tQPQkmqt4ib9eu6AJIb+QuwYbASeVv2HTNR2BHwbgekfSPRimu3sujs7CVY+qJXQ/Y2C4mL4aEnbAJZoSXlx+IhadkJl3VlyxvzZcyZHczLA5bX1w4Pg4M9MvKg2Pk60VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjAm/kzR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjAm/kzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109A51F000E9;
	Sun, 26 Jul 2026 06:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785046316;
	bh=VD1fRx9FnE8LTQg+b/6E2jDr0GH0OQAuomb3uhVJGGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FjAm/kzR0iYzNMm4LCNKb9c30xsarOW1wHKT4orbhB2Fs/5arjKKZqsL1Y586Iok1
	 3fIML8uQ+igEYljDfN0Nv+M9VcWOjWQ8WDoIcDnRmftYO7trRZw6AAeAjGUozLcNH4
	 x9fhl5+hFznK/FkAUW714e13SMJNK7wN/H7b4E4tcNrKdhY64LMm/UP0cAi6cmVH0I
	 19CCBcT4mqUjeUT8kmb/4IWqivTK7lY599pxAdZKiFzokjSL+DtZ+tDlx7DX3s9TPv
	 bAPzFGZcuj63SHqYtRKg/B/8mHHnMt94/LsbFGatvmZy8644s06hNGqGSokLUYozna
	 lGbggJBacBzfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 04/14] media: iris: Add helper to select relevant
 context bank device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260726-glymur-v10-4-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-4-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:11:55 +0000
Message-Id: <20260726061156.109A51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Severe Use-After-Free in firmware response handler because `v4=
l2_m2m_ctx_release` frees the context before the firmware session is closed.
- [High] Unprotected list iteration on V4L2 ready queues causes data races =
and list corruption.
--

--- Patch [4]: [PATCH v10 04/14] media: iris: Add helper to select relevant=
 context bank device ---
commit 694c94b16bf3fad4b4fbf3ea9de787f2ecf1a955
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: media: iris: Add helper to select relevant context bank device

This commit introduces a helper to associate context bank devices with
respective buffers in the iris driver. It also adds a fallback to the
core device when the platform describes the IOMMU on the parent node.

> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media=
/platform/qcom/iris/iris_vidc.c
> index 14d63dc76c9ba..26df872fb4fa1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
[ ... ]
> @@ -121,7 +121,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src=
_vq, struct vb2_queue *dst_
>  	dst_vq->drv_priv =3D inst;
>  	dst_vq->buf_struct_size =3D sizeof(struct iris_buffer);
>  	dst_vq->min_reqbufs_allocation =3D MIN_BUFFERS;
> -	dst_vq->dev =3D inst->core->dev;
> +	dst_vq->dev =3D iris_get_cb_dev(inst, BUF_OUTPUT);
>  	dst_vq->lock =3D &inst->ctx_q_lock;
> =20
>  	return vb2_queue_init(dst_vq);

[Severity: Critical]
This isn't a bug introduced by this patch, but is there a use-after-free
regression during device closure in iris_close()?

When a userspace application closes the device FD, iris_close() invokes
v4l2_m2m_ctx_release() which immediately frees the memory-to-memory context:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_close() {
    ...
    v4l2_m2m_ctx_release(inst->m2m_ctx);
    ...
}

However, this happens before the firmware session is closed and before the
instance is removed from the global core->instances list. If the firmware
asynchronously sends a response (e.g., HFI_CMD_BUFFER) during this window,
can the IRQ handler in iris_hfi_gen2_handle_output_buffer() look up the
instance and dereference the freed inst->m2m_ctx?

drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c:iris_hfi_gen2_han=
dle_output_buffer() {
    ...
    struct v4l2_m2m_ctx *m2m_ctx =3D inst->m2m_ctx;
    ...
    v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, m2m_buffer, n) {
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but could this list iteration ca=
use
a data race resulting in corruption of the V4L2 ready queues?

In driver functions like iris_hfi_gen2_handle_dequeue_buffers(), the ready
queue is iterated without holding the queue-specific rdy_spinlock:

drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c:iris_hfi_gen2_han=
dle_dequeue_buffers() {
    ...
    v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
    ...
}

Concurrently, userspace operations like VIDIOC_QBUF can call
v4l2_m2m_buf_queue(), which modifies the list under rdy_spinlock:

drivers/media/v4l2-core/v4l2-mem2mem.c:v4l2_m2m_buf_queue() {
    ...
    spin_lock_irqsave(&q_ctx->rdy_spinlock, flags);
    list_add_tail(&b->list, &q_ctx->rdy_queue);
    ...
}

Since the driver's lockless list iteration races directly with list
modifications from the V4L2 core, might this lead to corrupted list pointers
when QBUF or STREAMOFF execute concurrently with firmware responses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-glymur-v10=
-0-de451559e88b@oss.qualcomm.com?part=3D4
