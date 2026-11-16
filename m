Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794679;
	b=BmGZ6uzdF7YA4Q8RyLHTOY0rR3wk2eDNmoLGBHhoPXzLjNKRIdkNxnADxKpfIvR28ZwY
	 3sAafifLpy0UC0tp+8Kdg+BoXcmaaCti5gWPBkaxsdoHA1dP/3mIYE7n7SK3XtEPA9F1Q
	 nq6a3TykPchQBnV33rqi+dm06Qg/BSMHopTY5FK4x6srn8/VEtwYZYQZKPKFROjghiHEQ
	 JvtoLguLl2rm2jpnRczKKHDxZ0QgpULmQ7zYaTaJTZ4EQjXx5bKx2RAHzAdyR4Q8+YSsT
	 1d2WDvWQ1P5YuKSu5tg9E70B5p9VDPpEwuZg8myliVqrOM4MQGHU3pOsxp0b7G5A1hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794679;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=711OZl/Mn2kQTATiF0PZvrKesPe99WKukQHQiEUDPQU=;
	b=b4h9KkBOxBMWXjcTAmNt775Uk68EbN0yVocYqYs+zu4Vnfk6NUiS3hSJwL3maO9fkh0N
	 860drqw89wDzTu0VcDuyUwvSiozsjhkDp/I03oUGupWcugBZW5Sr+sP+Gs+73TAEvpFyP
	 e7SCM3JCFLseQuD2Xsj4Ac0M9j4C2oW1JDdAosPloCWfqSNivwldWZwmrNttOH8yEuqla
	 15rQiyEOVUZ2sxnvQr/pb/zikNu6l3DoI4pmJ/tcPA792EedkyKWxMd0hJ4irRju7znnL
	 VcSgW9M+Z3GxgMwhlfDvbgVFMsY5Uyf53J3Y3wNL+CGwBrdcpbr1j/KYshOUHr7BhFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8JCO91r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE990606A31F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8JCO91r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8BA1F000C4;
	Mon, 16 Nov 2026 02:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794679;
	bh=711OZl/Mn2kQTATiF0PZvrKesPe99WKukQHQiEUDPQU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n8JCO91rko7eKp4cw9Ur2RJicGpWawRCaFkrtldfP4LKlOOe+aq4GF4ik64Vu6KyK
	 z+5xtkfBnNwTdfb1CV3oN3f/GbA6ABU9UceiTqdhJ5OsAoICFmbrQoBCkikLEeELGp
	 cHZAQkJbg2XNtOjDah5OgdOR5vw5CppFBS7OIX+wUEQZzkdjYvpQUm1jbERGf77Ff7
	 edncemeEGOxd3P0AdxPMPoIX/vrPA4jPN9rspnzRfUCBl20ZTso7yBCnXxI6A2f9c1
	 gr/H31l94fPOvIOvZltTL0rVeKAOijNIFzqQAv/SK0boNav/llYrzmZrjzqJ38oxts
	 n+RujYMFz5u9g==
Message-ID: <sashiko-outbox-216063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 13/13] media: mediatek: jpeg: add jpeg smmu sid
 setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261116013402.1273016-14-kyrie.wu@mediatek.com>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-14-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 02:04:38 +0000
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
- [High] media: mediatek: jpeg: broken parent bookkeeping on child probe
  failure
--

commit 2fd151988985bb81b93a21e0a51263106e01c671
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: add jpeg smmu sid setting

This commit configures the JPEG decoder and encoder SMMU stream IDs via the
mediatek,smmu-config syscon on MT8196 and initializes the SMMU regmap in the
component hardware probe functions before registering each core with the
parent device.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 6b636ec63434a..508ed4ff53695 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -613,6 +613,25 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegde=
c_comp_dev *dev)
>  	return 0;
>  }
> =20
> +static int mtk_jpegdec_smmu_init(struct mtk_jpegdec_comp_dev *dev)
> +{
> +	struct mtk_jpeg_dev *master_dev =3D dev->master_dev;
> +
> +	if (!master_dev->variant->support_smmu)
> +		return 0;
> +
> +	dev->smmu_regmap =3D
> +		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
> +						"mediatek,smmu-config");
> +	if (IS_ERR(dev->smmu_regmap)) {
> +		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
> +				     "mmap smmu_base failed(%pe)\n",
> +				     dev->smmu_regmap);
> +	}
> +
> +	return 0;
> +}
> +
>  static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
>  {
>  	struct mtk_jpegdec_clk *jpegdec_clk;
> @@ -660,10 +679,15 @@ static int mtk_jpegdec_hw_probe(struct platform_dev=
ice *pdev)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "Failed to register JPEGDEC irq handler.\n");
> =20
> +	dev->master_dev =3D master_dev;
> +
> +	ret =3D mtk_jpegdec_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +
>  	i =3D atomic_add_return(1, &master_dev->hw_index) - 1;
>  	master_dev->dec_hw_dev[i] =3D dev;
>  	master_dev->reg_decbase[i] =3D dev->reg_base;
> -	dev->master_dev =3D master_dev;
> =20
>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index c2de272d71a34..8830480a4391e 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -338,6 +338,25 @@ static int mtk_jpegenc_hw_init_irq(struct mtk_jpegen=
c_comp_dev *dev)
>  	return 0;
>  }
> =20
> +static int mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
> +{
> +	struct mtk_jpeg_dev *master_dev =3D dev->master_dev;
> +
> +	if (!master_dev->variant->support_smmu)
> +		return 0;
> +
> +	dev->smmu_regmap =3D
> +		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
> +						"mediatek,smmu-config");
> +	if (IS_ERR(dev->smmu_regmap)) {
> +		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
> +				     "mmap smmu_base failed(%pe)\n",
> +				     dev->smmu_regmap);
> +	}
> +
> +	return 0;
> +}
> +
>  static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
>  {
>  	struct mtk_jpegenc_clk *jpegenc_clk;
> @@ -383,10 +402,15 @@ static int mtk_jpegenc_hw_probe(struct platform_dev=
ice *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	dev->master_dev =3D master_dev;
> +
> +	ret =3D mtk_jpegenc_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +
>  	i =3D atomic_add_return(1, &master_dev->hw_index) - 1;
>  	master_dev->enc_hw_dev[i] =3D dev;
>  	master_dev->reg_encbase[i] =3D dev->reg_base;
> -	dev->master_dev =3D master_dev;
> =20
>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);

[Severity: High]
Can returning early when mtk_jpegdec_smmu_init() or mtk_jpegenc_smmu_init()
fails or defers cause a NULL pointer dereference in mtk_jpegdec_get_hw() and
mtk_jpegenc_get_hw()?

In mtk_jpeg_probe(), jpeg->max_hw_count is set to the total number of child
DT nodes and the video device is registered regardless of whether each child
probe succeeded.  When a child probe fails or defers before reserving
hw_index, its slot in master_dev->dec_hw_dev[] or master_dev->enc_hw_dev[]
remains NULL, and mtk_jpegdec_get_hw() and mtk_jpegenc_get_hw() iterate up
to jpeg->max_hw_count without checking comp_jpeg for NULL:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpegdec_get_hw() {
    ...
	for (i =3D 0; i < jpeg->max_hw_count; i++) {
		comp_jpeg =3D jpeg->dec_hw_dev[i];
		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
    ...
}

In addition, mtk_jpeg_probe() calls devm_of_platform_populate() before
initializing jpeg->max_hw_count and resetting jpeg->hw_index to 0:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpeg_probe() {
    ...
	ret =3D devm_of_platform_populate(&pdev->dev);
	if (ret) {
		v4l2_err(&jpeg->v4l2_dev, "Master of platform populate failed.");
		return -EINVAL;
	}

	if (!jpeg->variant->multi_core) {
		...
	} else {
		init_waitqueue_head(&jpeg->hw_wq);

		for_each_child_of_node(pdev->dev.of_node, child)
			num_child++;

		jpeg->max_hw_count =3D num_child;
		atomic_set(&jpeg->hw_index, 0);
    ...
}

If one child probes synchronously inside devm_of_platform_populate() and
another defers in mtk_jpegdec_smmu_init() or mtk_jpegenc_smmu_init(),
atomic_set(&jpeg->hw_index, 0) resets hw_index to 0, so the deferred child's
later re-probe overwrites slot 0 and leaves slot 1 NULL.

Finally, when probe succeeds, master_dev->dec_hw_dev[i] and
master_dev->enc_hw_dev[i] are published with dev->hw_state already set to
MTK_JPEG_HW_IDLE without holding master_dev->hw_lock and before
platform_set_drvdata() and pm_runtime_enable() run, allowing a concurrent
worker to select hw_id =3D i and call pm_runtime_resume_and_get() before the
child device is ready.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116013402.1273=
016-1-kyrie.wu@mediatek.com?part=3D13
