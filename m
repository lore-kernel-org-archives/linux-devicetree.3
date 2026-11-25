Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588333;
	b=LB8Pn5O2wEfXe/gvOzpE0+ZQuNHhRpfr1BgzfiJxxevcvSpAq8Sp8C/53I+LJRf/hVim
	 WAb72+LvuOnNwjOdG1pIUcVcq8wRy+trJ5C+crVV5lmFWHgY/tJ/NDdq8X1yFIFSr+pQE
	 mmRG3/unK8h7aDK4malPRLuAKZAYX5H2HTg1wfmwidkWLe5lfXSw4wibhGg8M8KujvdDF
	 AeTgiH8aS2eV/bkgbZXZqKRVeTce79QZ/6ncbNIU5ZOFO44nRPgUdA1pE+gT3pNAQ+Djz
	 9oKuHllIAPiyTpxFVVMKn5ZUDBwge54MSZIh9gyTpMuGygbZDK5cYO3h5jKDkAn5R2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588333;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Wj7VjcFGpH7B/VE09v2T6570RiFHZ0oMUqwhEGMrxbY=;
	b=LehmEKKhbKfPNLqllGYhi07wxm6b17g8qtTKFjUnMwWIsAawEJG3jd4jYdBB6201OR7G
	 h/pGw1WTfQ7+ukreSRmxfrQkGGtqVrwsP1d6HMh8eRbEW0ZqOdAcOF5B0DpO5JvcgrQ/Z
	 uE+MjDdXIOBxzchbd/IbtwcKsnSmzgo4ya1tUoZw2eJXVlcgPgQRZg8VO/sFtVfEyh62a
	 IEMQiSxJzHTwuhm01+6hdKqMq58ZZDsoyW8bEcWL7uE2e7QkppXY3u4r6zLqFq96tmsCP
	 ZPJvV3L+Tfe97mYFXRuz6bZVo6ipSXitoOZ74eckRRb6TiqBNSZWsrCM8ntnbNEdKDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQSrR4Gs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AE1606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQSrR4Gs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CE51F00A00;
	Wed, 25 Nov 2026 06:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795588332;
	bh=Wj7VjcFGpH7B/VE09v2T6570RiFHZ0oMUqwhEGMrxbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NQSrR4GsZggNhVXtt0OSadXnFjxjAfmmwFS3qLjsN9vk+Qqf/BALkS73IWTZ0t7ON
	 k30Yfll18W/k47QtNHg3OkuKU7MfG9ioykJYJuSYdH2piUe/5eZgg/M9ke+6i/gPOj
	 sOMDdYpS1BxicsFnXrzoeUwpTqHFXJkOfhcALtW0UCSJxN/HCqpbf/fP5QEcy4gf1B
	 28s+XkpB01S0ouAv+gLWjYZTYCoP9q9IDh7bkeX8ywWhtU0iv10LvAEqoE5lAoWUfS
	 /cAa24HUzYtUDQAyOWmxbqC7FNRRUU9DF9eHN5s9xhc9el/dvOokdJkHCdoFC0DlBA
	 P0uMJWTaxM4RA==
Message-ID: <sashiko-outbox-232709@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 07/15] media: mediatek: jpeg: fix resolution change
 event handling in decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125061618.2544386-8-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
 <20261125061618.2544386-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:32:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] media: mediatek: jpeg: infinite workqueue loop in
  mtk_jpegdec_worker()
--

commit c3b81e9e96516f012823565e25f860a3928a4e5b
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix resolution change event handling in decoder

This commit checks whether the decoder context is already in
MTK_JPEG_SOURCE_CHANGE before checking for resolution changes in
mtk_jpegdec_worker() and reorders the state transition before queueing the
source-change event.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index bcf8745ca1d81..199d158285d4e 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1750,10 +1750,13 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
>  	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>  	jpeg_src_buf =3D mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> =20
> +	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE)
> +		goto getbuf_fail;
> +
>  	if (mtk_jpeg_check_resolution_change(ctx,
>  					     &jpeg_src_buf->dec_param)) {
> -		mtk_jpeg_queue_src_chg_event(ctx);
>  		ctx->state =3D MTK_JPEG_SOURCE_CHANGE;
> +		mtk_jpeg_queue_src_chg_event(ctx);
>  		goto getbuf_fail;
>  	}

[Severity: High]
Does jumping to getbuf_fail while ctx->state is MTK_JPEG_SOURCE_CHANGE put
mtk_jpegdec_worker() into an unthrottled workqueue loop?

src_buf and dst_buf are only peeked here and remain on the M2M ready
queues when getbuf_fail calls v4l2_m2m_job_finish().  Unlike single-core
mtk_jpeg_dec_m2m_ops, mtk_jpeg_multicore_dec_m2m_ops does not set
.job_ready =3D mtk_jpeg_dec_job_ready to stop scheduling jobs when
ctx->state !=3D MTK_JPEG_RUNNING:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:
static const struct v4l2_m2m_ops mtk_jpeg_multicore_dec_m2m_ops =3D {
	.device_run =3D mtk_jpeg_multicore_dec_device_run,
};

static const struct v4l2_m2m_ops mtk_jpeg_dec_m2m_ops =3D {
	.device_run =3D mtk_jpeg_dec_device_run,
	.job_ready  =3D mtk_jpeg_dec_job_ready,
};

v4l2_m2m_job_finish() therefore immediately re-queues the context and
re-schedules mtk_jpegdec_worker().  Because the MTK_JPEG_SOURCE_CHANGE
check runs after mtk_jpegdec_get_hw(), every iteration also claims and
releases a hardware decoder core, starving other contexts and spinning at
100% CPU until userspace issues VIDIOC_STREAMOFF.

Should mtk_jpeg_multicore_dec_m2m_ops wire up .job_ready =3D
mtk_jpeg_dec_job_ready?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125061618.2544=
386-1-kyrie.wu@mediatek.com?part=3D7
