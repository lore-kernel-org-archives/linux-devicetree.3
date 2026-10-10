Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5223338D014
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620369; cv=none; b=NWs/72JDmHEXdfPfbZKlnPYAAD8rJ2kTYThcfkShwzFqeFBQZcazN4Zx1xIMcIsXFWXiMKzvOZu/CcK6vmC5ikZP3ZX7xszexr1tns6C1F8kdrT/tj+sEntan0hnjOU530m1iTcK1MBsWs+US9jffR63ttPrWomr+8bFBs1cV5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620369; c=relaxed/simple;
	bh=h1aJryadrDcAb1rcXctsAGx1wX8o6WsopDimvBourpA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sXMOMvqJY91w8SOKKmt7BCw9rU71tQBoun+My5i4KRb3vqXtutQwj7b0mY59VAAEZVA7IDdYMCrsdCSOF+J1B3rvJKyNjOS8Xf3UtBu4tmA7BtiJLeJAOlqrGJ+lYSBsQMUNlBPsiBoJghmwxL6mHonprNo3s5vnzQjhLPRarHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYorRwh1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYorRwh1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5795F1F00893;
	Sat, 10 Oct 2026 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791620366;
	bh=KEBIIuqGsCq1R9jbdZ0wE8lKj/rOVQ7znNxeE1yv+I0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JYorRwh1m+9eBcMx9xHJAq4XZxP146MTI45BvV2ybRgM45LWQmO8ABQhxVOPolZp8
	 38rc22ItojueTnqGs75xtFMEL0gsm6qve6MZPn/TtxytyrDXI5PD75yWWdK+kdcISo
	 PT4DxAFgCKNF9KL7cPuMYGEsQzgDGyUEYwoi49Ei+g10vOHKaWmnRImwPJ1V917dHY
	 +1J3L3PmHAmJD/ooh39kck5brIkKagOcoSoBPD4nHrcfDXlTVxhLIv3X7t4XJzXvdB
	 tXdMu3FfPYHRTJXrzUkF0csmUhbvZSGu2mjJtDlIVCWpscR0bsYyAjiPfTDVixlOAu
	 QZQDXvdZe8XKQ==
Message-ID: <sashiko-outbox-166335@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 06/13] media: mediatek: jpeg: fix buffer state
 update timing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <ce89b772dfbd5d86a3af4672dd40af41de8b6f98.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <ce89b772dfbd5d86a3af4672dd40af41de8b6f98.1791614327.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:19:25 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: Placebo lock and UAF in MTK JPEG worker timeout race
--

commit 8295f8055bf1ad5ac4c76dd2772ead51a8aecccb
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix buffer state update timing

This commit delays the update of the destination buffer state until after t=
he
decoder has selected a hardware core and successfully resumed its runtime PM
state. It aims to protect the destination buffer state update with the
hardware spinlock to avoid assigning frame tracking data to buffers that are
returned early.

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
The commit message states the lock is used so the completion path observes a
consistent context and frame number. However, looking at the completion pat=
hs
in mtk_jpegdec_hw_irq_handler() and mtk_jpegdec_timeout_work(), they do not
appear to acquire comp_jpeg[hw_id]->hw_lock. Does this lock provide any
mutual exclusion against those paths?

Also, because schedule_delayed_work() arms the timeout before the buffer st=
ate
is initialized, is there a risk if the worker thread is preempted immediate=
ly
after arming the timer?

For example, could this sequence occur:

1. The timeout worker fires and executes without hw_lock.
2. It reads the uninitialized frame_num.
3. It adds the buffer to dst_done_queue, resets the hardware, and returns t=
he
   buffer to userspace via v4l2_m2m_buf_done().
4. The preempted worker thread resumes and concurrently writes to
   jpeg_dst_buf->frame_num, corrupting the buffer that is already on the
   completion list or in userspace.
5. It then starts the hardware via mtk_jpeg_dec_start() on the
   already-returned buffer.

Could this lead to DMA into freed memory?

>  	ctx->total_frame_num++;
>  	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
>  	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791614327.gi=
t.kyrie.wu@mediatek.com?part=3D6
