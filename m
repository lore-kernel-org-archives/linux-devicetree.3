Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF81456E0A
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069578; cv=none; b=qWFgtRpo6SAvPEHnHrqiXNRpBpGVEmPiHFnqqzYAay3NAMO9zmR4wIlgbpi8U+eL86vU1qw813uRAr05OHBscw2wrPEmCtCnpDVw5ES1cLwdyrpCuybop6ZD44eDLXexGDP77cLAd6bbXQOR5wZj4gw/8NpqtZ1WFjEAUthK9a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069578; c=relaxed/simple;
	bh=GyWQ466Cy4qimyGEENSfsGpv0FQFa58Lk66qtCXUTlw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C6F/IYfFW0dj/ELHlRceZh28AS1/fKM//hHbqmqOOAY36kv+4cKmuK+F8dcRmJMoX3+bPamSWUBuOepWN/mXpk81q7c+fjIHeA3GFZqqOuvxwiMtPvOMLY2nkoByhNLzzp+QAR1QYaiaOrammlxpOd/Pa4Wj39LN42QYL2rgFIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmmqb5vU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmmqb5vU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8931F000FF;
	Tue, 22 Sep 2026 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069576;
	bh=vfaLbxIrY0qJ+Lxc3dyG7ieTFWA1v6Kq+shLaNFx0q0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lmmqb5vUZoKS4tDAOS7eDTO6bi7tZkp7HSeICWISQ+htVm72GTkwdbuVwuRMfwWqf
	 cqVHRFIzTmOzx2Wu2DtV+tOnOYdbSG/hsyeLmerjTWzUQVnmzkR7MVJZ4QxAACKTUA
	 6aJHsCWfObpofmnEyFqhvBP5CShBsKcnmp7L/ZsfBd5V2iR5TGPO4CXO5IksgYGbTp
	 vAGVWETdjC/sIAr4oxUPASpXPiv8FXc0icwQaXj+jmHyRX7CqvUD8iD3ZdH0ku5oNP
	 x8ckS8usBCei4eIPrWagFEvBuYFl5bdwyJTE0GStHeASwyPFhchNSPeXsDFRGGRegX
	 PjEsKbtbC0Nyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 08/12] media: mediatek: jpeg: fix remove buffer
 removal timing for multi-core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922091530.241762-9-kyrie.wu@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:32:56 +0000
Message-Id: <20260922093256.8B8931F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: mtk-jpeg: list corruption due to racy buffer removal
--

commit d081c3bb256d4600d543f05fb28f936f6f62ecbc
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix remove buffer removal timing for multi-core

This commit moves the calls to v4l2_m2m_src_buf_remove and
v4l2_m2m_dst_buf_remove inside the spinlock-protected scope in the
JPEG encoding and decoding workers. The intent is to ensure proper
synchronization before buffers are removed from their queues.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index edd9e2d0ab05f..0907960db1436 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

[ ... ]

> @@ -1674,6 +1671,8 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
>  			     &src_buf->vb2_buf);
>  	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
>  	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);

[Severity: High]
Can this cause list corruption if the hardware completes very quickly?

By calling mtk_jpeg_enc_start before removing the buffers from the ready
queues, is there a window where the interrupt handler completes the operati=
on,
marks the buffers as done, and wakes up userspace?

If the IRQ handler runs concurrently without acquiring the hardware lock and
userspace rapidly requeues the same buffer, could it invoke list operations=
 on
a buffer that is still in the ready queue? When the worker thread subsequen=
tly
calls v4l2_m2m_src_buf_remove, would this removal operation completely corr=
upt
the list pointers?

>  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>  	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> =20

[ ... ]

> @@ -1782,6 +1778,8 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
>  				jpeg_src_buf->bs_size,
>  				&bs,
>  				&fb);
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>  	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
>  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>  	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);

For the decoding worker, it looks like mtk_jpeg_dec_start is called after
the buffers are removed, which avoids the race condition described above.
Would it be safer to reorder the encoder side to match this sequence and
remove the buffers before starting the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922091530.2417=
62-1-kyrie.wu@mediatek.com?part=3D8
