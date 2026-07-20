Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E6141611D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556315; cv=none; b=m/22NnKbqT2zmY4oT06q+SX5CDqD2mIiN6S+pngnZGatqaNLjH37JUXBoOxlza8rUYsBUd12s9jbPhMBxmXe+vp3KcCLnLLEvx7Oe606/cY3enB6+t2O2hXW/MVXW+qO5P/xAashSNdlkbx8/KSzpDTgOsKdoq2Af+rhlGS9xrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556315; c=relaxed/simple;
	bh=GRMNfKdybdP8CoHn8b0TD1c+ftxgemvcqKNQRuWriOg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tAnFUPsIBFJ4aQxr01ai/rxxOvEFHzwRtMxsT8T58lwOF7mTNbpy3UbllTlkxWOgPghaua8OQcaTiV/d4oYOY/wAIAWy8spPnzjPIz2PNZ6Jj0Dx18N1jmekG2FQWtSclUzno7IwpGmup3wvZhKeXl/9Qj9xyMeVGkI5JmzAT3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWGOMO6U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWGOMO6U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED06C1F000E9;
	Mon, 20 Jul 2026 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784556311;
	bh=xOb/Mq/AzjWXweiUThVYjbC5FPxp8pFXjlDkFB8yfqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GWGOMO6U2GSPZwHSqE8cE8u9Udigw/vW9JlFUCrLL0qh2HetSnrCvrUlc1U8NVXrn
	 MoG6+wnkn4TqAfZntCDnAbAyoBK2L8PfSAIyqppQ/0a+tvgNTSp2RgxJnRGawGdA7p
	 XCL+ZjseG9h5buWUFguSgEyrLLtJqdR0R+1ZkcwjgfQhBVCSlIa84kXtAQc6iZsMcu
	 09R25tgNYyGRrsAN2at1HGJV0EMyQ1SDJbOkEvjQTLjH2r84PXc1tRmVdGxFFFE4s5
	 ZV8IexzA36t4Ubv9o1SSnvrcILyv0iaBiYumTRRRO289WxugRv3RrFiwop8ej7IF3w
	 10UnphYoUtO+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 06/12] media: mediatek: jpeg: fix buffer state
 update timing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720133432.1042046-7-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
 <20260720133432.1042046-7-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:05:10 +0000
Message-Id: <20260720140510.ED06C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Moving destination buffer state initialization after scheduling th=
e timeout worker introduces a race condition causing list corruption and a =
kernel oops.

Pre-existing issues:
- [High] The hardware timeout workers are scheduled before hardware start a=
nd completely lack lock synchronization, causing data races, hardware bus f=
aults, and use-after-free vulnerabilities.
- [High] The encoder worker permanently leaks a Runtime PM usage reference =
when `pm_runtime_get_sync()` fails.
--

--- Patch [6]: [PATCH v16 06/12] media: mediatek: jpeg: fix buffer state up=
date timing ---
commit adfbbc474f76db07fc27613935d0bb09341844c6
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix buffer state update timing

Update the destination buffer state only after the decoder has selected
a hardware core and resumed its runtime PM state successfully. This avoids
assigning frame tracking data to buffers that will be returned early, such
as when a source resolution change is detected.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index a5a1f6126af73..e152ebae0f219 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
[ ... ]
> @@ -1773,6 +1767,9 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
>  			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
> =20
>  	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
> +	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> +	jpeg_dst_buf->curr_ctx =3D ctx;
> +	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;

[Severity: High]
Does moving this initialization after schedule_delayed_work() create a race
condition that can corrupt the destination done queue?

If the worker thread is preempted right after calling schedule_delayed_work=
(),
the timeout worker (mtk_jpegdec_timeout_work) can fire early before
jpeg_dst_buf->frame_num is initialized.

The timeout worker will pass this uninitialized buffer to mtk_jpegdec_put_b=
uf(),
which adds it to ctx->dst_done_queue. Because frame_num is uninitialized,
it won't match ctx->last_done_frame_num and the buffer gets stranded in the
queue.

When the worker thread resumes, it initializes frame_num and starts the
hardware. Upon hardware completion, the IRQ handler will call
mtk_jpegdec_put_buf() again and execute list_add_tail() on the exact same
buffer, corrupting the linked list.

[Severity: High]
This isn't a bug introduced by this patch, but could this delayed work
scheduling cause hardware bus faults or memory corruption?

The timeout worker is armed before the hardware lock is acquired and the
hardware is started. Since the timeout workers (both mtk_jpegdec_timeout_wo=
rk
and mtk_jpegenc_timeout_work) do not acquire hw_lock, if the main worker is
preempted right after scheduling the work, the timeout worker can fire
concurrently.

It will reset the device, complete the buffers to userspace, and call
pm_runtime_put() to potentially power off the device. When the main worker
resumes, it will write to powered-off registers (causing a bus fault), and
instruct the hardware to DMA into buffers that userspace may have already
freed or reused.

[Severity: High]
This is a pre-existing issue, but is there a Runtime PM reference leak in t=
he
encoder worker's failure path?

In mtk_jpegenc_worker() (not modified in this diff), pm_runtime_get_sync()
increments the device's PM usage counter even if it returns an error. If the
resume operation fails, the code branches to the enc_end error path and
returns without calling pm_runtime_put_noidle(). This leaves the usage
counter elevated and permanently prevents the device from suspending again.

>  	ctx->total_frame_num++;
>  	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
>  	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133432.1042=
046-1-kyrie.wu@mediatek.com?part=3D6
