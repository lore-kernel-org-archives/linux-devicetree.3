Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112CC394464
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620345; cv=none; b=bAK3P8U/eG1EMsgGeHSL6jAwZ/ClnTUUeTLxVymVAeSx+RofGtIb9zEg/7snqStYvtb9h68mMfMN5HAwSQX2pz19ig0mCIbbsQ0ACNqTOKARGD9r/j4QMqehJLZDSF1BDHbnwLy2mYcePPLzwKqix3AiAaiNHqVTOeMo1U0IOz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620345; c=relaxed/simple;
	bh=N1MkiN87Y9ZGMvVoKrZcc03C5mnWkgYkGHhmWPPt/qg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=toTZgVtpT/QMobdJKs+eVNSkWLDvE2dlGiYZmW2wYtDymiSgUN2UJV3jf4Tp7hDZfNXjSw3cDp3V00jb8TY9OGAnsDnfNNefkMTMsOkT4A3AfyX8+OzCgzuQ0KexvRSNoW66AzVEGHnKXjJF6FC0gRZDiFpNna4hqhxEkQ9JogQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1iDl8YZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1iDl8YZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1930D1F000FF;
	Sat, 10 Oct 2026 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791620340;
	bh=JP3AYkuM/9sQDSJ4Cre7zwvavRESnYooWuxihAzsDrc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X1iDl8YZTuif/gltQ9ZQXbYRmfngFcI6c0tjXA0fEDyQXcOfzMUSsU81MT8CF4KZw
	 VTM9fyugdKxcCkK4XS7ufFD3r89Q2dSu+r9wRRZclEv3+9ssCUg1u5a4jg4fWiUkXw
	 YEt8/nKl+oDVAxVlmGxY8b0Lr39jC+arY1ZJ5HbxPKlFYMPoxViZ8MHbarWBmYAEsb
	 sY+QBhCYbanFFjy0f8Mjl2Dv6Rq3eMxBowie2dslhCyloO/oC0GJ2MyvqhSbbKp/+f
	 47oogp3pZInIxQspWBO4xQOEr8ElEaTQTU+TnIA9P4mqTvzefH6LtzHO0I40xGOiCB
	 c5dNHZxtHfxOA==
Message-ID: <sashiko-outbox-166334@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 08/13] media: mediatek: jpeg: fix remove buffer
 removal timing for multi-core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <e5ca1ec64d2d99feb38484ec480debc2ac7b84a8.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <e5ca1ec64d2d99feb38484ec480debc2ac7b84a8.1791614327.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:18:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] media: mtk-jpeg: M2M buffer list corruption due to late removal
--

commit efc50151e6e8cc8e10e2f2bc55033a7e5675f87a
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix remove buffer removal timing for multi-core

This commit moves the calls to v4l2_m2m_src_buf_remove() and
v4l2_m2m_dst_buf_remove() inside the spinlock to synchronize buffer handlin=
g.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index edd9e2d0ab05f..0907960db1436 100644
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

[Severity: Critical]
Does scheduling the timeout work before removing the buffers create a race
condition?

If this worker thread stalls for the timeout duration,
mtk_jpegenc_timeout_work() can execute concurrently and return the buffers =
to
userspace. If userspace then immediately requeues the buffer with VIDIOC_QB=
UF,
it will be added to the queue via list_add_tail().

Since this worker thread hasn't yet reached v4l2_m2m_src_buf_remove(), the
buffer's node would still be linked in the M2M rdy_queue, which could result
in list corruption from double linking.

> =20
> @@ -1674,6 +1671,8 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
>  			     &src_buf->vb2_buf);
>  	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
>  	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);

[Severity: Critical]
Are we exposed to a similar list corruption race here by starting the hardw=
are
before removing the buffers from the M2M queue?

mtk_jpeg_enc_start() asynchronously kicks off the hardware. If the hardware
finishes immediately, it can trigger mtk_jpegenc_hw_irq_handler() on another
CPU.

The lockless IRQ handler retrieves the buffers and calls v4l2_m2m_buf_done(=
),
returning them to userspace. If userspace immediately requeues the buffer,
VIDIOC_QBUF will add it to the list while it's still linked in the rdy_queu=
e,
which can cause list corruption and kernel panics.

It looks like this ordering was handled correctly in mtk_jpegdec_worker(),
where mtk_jpeg_dec_start() is called after the buffers are removed. Should
mtk_jpeg_enc_start() follow the same pattern here?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791614327.gi=
t.kyrie.wu@mediatek.com?part=3D8
