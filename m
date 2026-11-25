Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588191;
	b=RF2KWT4k16V0R6F9GWQrI8Gv1DIumbPkM9t77pcweYTQ7t595GaLbSYI8AW78PRFo8LF
	 umC6eZsPpsN27Eg5l+bu9f+z+6Jws78zM8oVKinrQ3CeKWU/1vBh0LXsqEe52iO6O3DuZ
	 fmIN5zk8to6r+zGtVHhJvVwqt3rlvz1oe2LlQWBckDXb4k8IX6R77gUhRiscYKIShJCOX
	 YZZsLOUqy9XlF6tjzQCBmj/I5KoK9LYwM09plOuwoRZvZeEY7UmDk+LrEC6v6FeCUHB2o
	 uWDFLrYWpFDrxxN/SeSzuCouLD4QUPMewjn3ZexfC/UeaReRJ2fNHg4zrYBOFJL6U3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588191;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3TN+IsnHlB0CzVPzXNNISjaNL0ZyQ9j5CrLpr/ajdfE=;
	b=L+ynslOiUsXsjNkMSkcUvdEu7uubdzLxpoilDSFJq92MMJ8yFwEnUUZuBehdpkBiDcxe
	 0uPJLzQqcu1l5CaF5GM/hktwRVBnG0DowqVIByP3dB8lA8J3zZF+NC3YEz9x39fbHTEOW
	 dts8JdovCTeeSYqRJql63J74FwQFEcvn7NCc69lRDJzBK0vO62FRRf5b7iWYRAyGbwcbu
	 ZOpYSUrTmusiGLsMkNtSDg8zRFfnWLgvwlFH7+0lAwXuWDszGP+Kxdh6aIzfmiACQMa+u
	 9NR1hjJAKnlGJbvmRPYIq6hme8xgyBXaK9A0naEAE+ILP78KZfFYl6juhratUWLBODw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FiuGXTDV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A70606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FiuGXTDV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5120F1F000C0;
	Wed, 25 Nov 2026 06:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795588191;
	bh=3TN+IsnHlB0CzVPzXNNISjaNL0ZyQ9j5CrLpr/ajdfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FiuGXTDVLVbRAUcdvp1KvZJ07AiS2gklrr6Ndb1KwaoDqyZ1xJFs6NFPVcQUUHol4
	 RQUCv97rzQpU1COCZCW72GTjlTwAymOJW/NEKqHp5eDlGhPnovZQZ6kMve8FHdG65U
	 V+zok+ztg2xuZtP+pzXBseoPBprn2+nlOw7ZgSTDV8bseC8rkzQH+GjoNGg5hmyOGt
	 GwIvaX68HTDhWt8HLLph5zlCw3rV9yyn44Iprh9Pc3i/u+BBvQiPlorFwCqd5sD7LY
	 BLdLef4Rqi40GbmPDTUD0ZOPochHrhi7RiNMgjyekdaJbJGfGgjJuLekYDWR6IhIrG
	 6DYlhWhloOW5A==
Message-ID: <sashiko-outbox-232700@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 01/15] media: mediatek: jpeg: fix jpeg cores'
 amounts setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125061618.2544386-2-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
 <20261125061618.2544386-2-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:29:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] media: mediatek: jpeg: child probe in mtk_jpeg_probe() before
  bounds check
- [High] media: mediatek: jpeg: NULL deref in get_hw() when max_hw_count
  > probed
--

commit cfc2baea3485ec02d134ce90cc368bfa48a69866
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix jpeg cores' amounts setting

This commit tracks the number of JPEG hardware core child nodes in
jpeg->max_hw_count instead of iterating over the fixed MTK_JPEGENC_HW_MAX
and MTK_JPEGDEC_HW_MAX limits, and increments jpeg->hw_rdy as each child
core probes.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index e01dd4d80722c..3caee184ff5ed 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1294,6 +1294,7 @@ static int mtk_jpeg_probe(struct platform_device *p=
dev)
>  	struct mtk_jpeg_dev *jpeg;
>  	struct device_node *child;
>  	int num_child =3D 0;
> +	int hw_max;
>  	int ret;
> =20
>  	jpeg =3D devm_kzalloc_obj(&pdev->dev, *jpeg);
> @@ -1302,6 +1303,7 @@ static int mtk_jpeg_probe(struct platform_device *p=
dev)
> =20
>  	mutex_init(&jpeg->lock);
>  	spin_lock_init(&jpeg->hw_lock);
> +	atomic_set(&jpeg->hw_rdy, 0);
>  	jpeg->dev =3D &pdev->dev;
>  	jpeg->variant =3D of_device_get_match_data(jpeg->dev);
> =20
> @@ -1325,7 +1327,14 @@ static int mtk_jpeg_probe(struct platform_device *=
pdev)
>  		for_each_child_of_node(pdev->dev.of_node, child)
>  			num_child++;
> =20
> -		atomic_set(&jpeg->hw_rdy, num_child);
> +		hw_max =3D jpeg->variant->cap_q_default_fourcc =3D=3D V4L2_PIX_FMT_JPE=
G ?
> +			 MTK_JPEGENC_HW_MAX : MTK_JPEGDEC_HW_MAX;
> +		if (num_child > hw_max)
> +			return dev_err_probe(jpeg->dev, -EINVAL,
> +					     "Too many JPEG cores: %d (max %d)\n",
> +					     num_child, hw_max);
> +
> +		jpeg->max_hw_count =3D num_child;
>  		atomic_set(&jpeg->hw_index, 0);
> =20
>  		jpeg->workqueue =3D alloc_ordered_workqueue(MTK_JPEG_NAME,

[Severity: High]
Does the num_child > hw_max check and atomic_set(&jpeg->hw_index, 0) run
too late when devm_of_platform_populate() is called earlier in
mtk_jpeg_probe()?

When the child driver is already registered (such as when built as a
module, since mtk_jpeg.ko depends on mtk-jpeg-enc-hw.ko and
mtk-jpeg-dec-hw.ko), devm_of_platform_populate() synchronously runs
mtk_jpegenc_hw_probe() or mtk_jpegdec_hw_probe() before reaching the
multi_core block:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:mtk_jpegdec_hw_probe=
() {
    ...
	i =3D atomic_add_return(1, &master_dev->hw_index) - 1;
	master_dev->dec_hw_dev[i] =3D dev;
	master_dev->reg_decbase[i] =3D dev->reg_base;
    ...
}

If num_child > hw_max, the child probes write out of bounds into
dec_hw_dev[] or enc_hw_dev[] before the bounds check in mtk_jpeg_probe()
is reached.  In addition, resetting jpeg->hw_index to 0 after
devm_of_platform_populate() means that if one child probes synchronously
(taking slot 0) and a second child defers probe, the deferred child will
also receive index 0 when it later probes, overwriting slot 0 and leaving
slot 1 NULL.

> @@ -1462,7 +1471,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *=
ctx)
>  	int i;
> =20
>  	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
>  		comp_jpeg =3D jpeg->enc_hw_dev[i];
>  		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
>  			hw_id =3D i;
> @@ -1509,7 +1518,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *=
ctx)
>  	int i;
> =20
>  	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i =3D 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
>  		comp_jpeg =3D jpeg->dec_hw_dev[i];
>  		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
>  			hw_id =3D i;
> @@ -1592,7 +1601,7 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
>  		jpeg_work);
>  	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =20
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++)
> +	for (i =3D 0; i < jpeg->max_hw_count; i++)
>  		comp_jpeg[i] =3D jpeg->enc_hw_dev[i];
>  	i =3D 0;
> =20
> @@ -1688,7 +1697,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
>  	struct mtk_jpeg_fb fb;
>  	unsigned long flags;
> =20
> -	for (i =3D 0; i < MTK_JPEGDEC_HW_MAX; i++)
> +	for (i =3D 0; i < jpeg->max_hw_count; i++)
>  		comp_jpeg[i] =3D jpeg->dec_hw_dev[i];
>  	i =3D 0;
> =20

[Severity: High]
Can mtk_jpegenc_get_hw() and mtk_jpegdec_get_hw() dereference a NULL
comp_jpeg pointer when jpeg->max_hw_count exceeds the number of probed
child cores?

jpeg->max_hw_count is set from for_each_child_of_node(), which counts all
DT child nodes including disabled ones, whereas enc_hw_dev[i] and
dec_hw_dev[i] are only populated as each child finishes probing.  If a
child node is disabled, fails or defers probe, or has not bound yet when a
V4L2 job runs, mtk_jpegenc_worker() and mtk_jpegdec_worker() call
mtk_jpegenc_get_hw() / mtk_jpegdec_get_hw() before waiting on
jpeg->hw_rdy, and iterating up to jpeg->max_hw_count hits a NULL
enc_hw_dev[i] or dec_hw_dev[i] and dereferences comp_jpeg->hw_state.

Even if a child finishes probing while the worker is waiting on
jpeg->hw_wq, comp_jpeg[] in the worker is snapshotted before the
retry_select loop, so comp_jpeg[hw_id] remains NULL and crashes at
pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125061618.2544=
386-1-kyrie.wu@mediatek.com?part=3D1
