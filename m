Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC153D47D4
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978897; cv=none; b=GwHJbGbc1duO4MUbSDpGv+hXh+IpRPaa8jFVfr5g3P+79bCNivQe3MFmwOMX++gvkeJ4/UG4VY1q6ye3oSUZyCjS1gN6CHUQzWdXA2YcNPHnqYH1pDrVTMcdSCAmbM5gh2VnB15aJhrYQpfk71NAm3mj9JhiZrFshu1U8jIZAWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978897; c=relaxed/simple;
	bh=PQ/dmRtf/ED613hJIk9cmMPEYLShtFG+4DQzkZ7n9XI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZzXLT94xjGesuFA3xYg2djQzTsa0xwWKzsoD+dWtVjIB/TfTYZuxrwisIYOPikVm5EXTzQ5koo78d6PdjtaNWkYoHjcf2YubKhHh+Ck04CJ2/JMnwTajTYBIOYli0m50kjAoy5pAb1GdOa+LCAtwK6UFjGD0LGCa1Oo1/7uiYr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxMAK9WN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxMAK9WN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6691F000E9;
	Thu,  2 Jul 2026 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782978889;
	bh=+tP/MD0aWHTlDiQxaoBQFFMi5TZ5D2O4P6sV/008M6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JxMAK9WNpwiWBNnBXb7lvzJwuK0xOPvq/rIlbv0gOk1EOa341kcIV1n4vE/Me0ZEa
	 esdpaXgDslwp2RMKBnZC0r6jmL863QQKgbjOZcV2QHxcijw+foSBmr2UfQm4uzmJJ1
	 nkeidaCP/EY8I7nHB0OXrosZCrzFUuFvOEvFShgHpJFQXXXosl2HRuJ0o3Bw0hiKNi
	 30woEFOv6C0TwgH7yxByhlQksrXPaE4GrIBND4erEd4gvsPp9PwyejXoTOH8nb3cRg
	 Aj5cXgz14n0+lPiCXjDiOAAxYRZ9JqqmBOTCiGLlV0UjBpCLQSe97+2eRo6k8Yw3lO
	 9KAjO3HKDdVWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 08/12] media: mediatek: jpeg: fix remove buffer
 removal timing for multi-core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702072614.10373-9-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
 <20260702072614.10373-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 07:54:48 +0000
Message-Id: <20260702075449.1A6691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] In `mtk_jpegenc_worker`, `v4l2_m2m_src_buf_remove()` and `v4l2_m2m=
_dst_buf_remove()` are incorrectly called after `mtk_jpeg_enc_start()`. Thi=
s introduces a severe race condition where an early hardware completion int=
errupt can process the buffers before they are removed from the ready queue.

Pre-existing issues:
- [High] The job timeout delayed work is scheduled before acquiring the har=
dware lock, creating a window where it can execute prematurely and lead to =
DMA memory corruption or list corruption.
- [High] Concurrent execution of the hardware IRQ handler and the timeout w=
ork leads to list corruption and state desynchronization.
- [Medium] `mtk_jpegenc_worker` leaks a PM runtime usage counter reference =
on error paths.
--

commit 4ce8f75cccbcd44894ec25eb120040d2e022ccdb
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix remove buffer removal timing for multi-core
   =20
Move calls to v4l2_m2m_src/dst_buf_remove() inside of the spinlock
protected scope to ensure all necessary operations are performed
before buffers are removed from their queues and ensure proper
synchronization of buffer handling to avoid buffer lost.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 02efaed198b85..0b9a3b66895a0 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1653,9 +1653,6 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
>  		goto enc_end;
>  	}

[Severity: Medium]
This is a pre-existing issue, but does pm_runtime_get_sync() increment
the usage counter even on failure?

If it fails here in mtk_jpegenc_worker() and jumps to enc_end without
dropping the reference, couldn't this leak the usage counter and prevent
the device from suspending?

Would using pm_runtime_put_noidle() in the error path fix this?

> -	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> -
>  	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
>  			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));

[Severity: High]
This is a pre-existing issue, but by scheduling the timeout work before
acquiring the hw_lock, could the timeout expire while the worker is
preempted?

If the worker thread is preempted or suspended longer than the timeout
period, the lockless timeout handler could execute, reset the hardware,
and return the buffer to userspace.

When the worker thread resumes, it blindly acquires the lock and configures
the hardware with pointers to the now-completed buffers. Could this result
in the hardware forcing DMA into memory that has already been freed or
reused by userspace?

This same pattern appears in mtk_jpegdec_worker() as well.

> @@ -1673,6 +1670,8 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
>  			     &src_buf->vb2_buf);
>  	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
>  	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);

[Severity: High]
By moving the buffer removal after mtk_jpeg_enc_start(), does this create a
race condition where the hardware completion interrupt processes the buffers
before they are removed from the V4L2 M2M ready queue?

If the hardware finishes instantly and triggers mtk_jpegenc_hw_irq_handler()
on another CPU, the IRQ handler will complete the buffer and return it to
userspace.

If userspace quickly dequeues and requeues it via VIDIOC_QBUF before the
worker thread calls v4l2_m2m_src_buf_remove(), the framework might call
list_add_tail() on a node already linked in the ready queue. Could this
corrupt the list pointers and lead to a kernel panic?

Should the buffers be removed from the queues before starting the hardware
to avoid this window, similar to how it is correctly handled in the decoder
modifications below?

>  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>  	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);

[ ... ]


[Severity: High]
This is a pre-existing issue not touched by this patch, but could there be a
race condition between the hardware IRQ handler and the timeout work?

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c,
mtk_jpegenc_hw_irq_handler() calls:

    cancel_delayed_work(&jpeg->job_timeout_work);

If the timer expires at the exact same moment the hardware finishes,
cancel_delayed_work() will return false, meaning the timeout work could
execute concurrently on another CPU.

Since both threads process the same buffers and simultaneously call
mtk_jpegenc_put_buf() (which executes list_add_tail()), could this corrupt
the list structure by adding the same node concurrently? Would it also lead
to double-incrementing master_jpeg->hw_rdy and double-decrementing PM
runtime?

This same vulnerability appears to exist in mtk_jpegdec_hw_irq_handler()
for the decoder.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702072614.1037=
3-1-kyrie.wu@mediatek.com?part=3D8
