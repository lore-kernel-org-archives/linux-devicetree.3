Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588712;
	b=iylO0WGPVm4Kd+KTaXDaksBdmAqqB8NJiBPkwBK6FRBnAGDUOAAF3C7vsFKspjFPzZ7N
	 KJflvXgBkc3T4GcEQwBBegul1J/AjEdv+wJ/5D7uXnbggPPnKqiTwI2qJjKirbQYhH2bd
	 Xs+bWvHtUZDAzBzSZlK66xymgfvxVR8XebHbq2Ae8kwXvdWsGTtjqu2w6OlnZPZlZhkbR
	 yqFLhP7jmkxCpbtxxPlMHAXKuo5rqB1/hd+c9xUExfqB3TFD+zn4mu8W62KS3Gl8D4h7F
	 nK8+o3jUd+d+UTnhJblkE95MfG4Ghf0/YWERLXLivxKBe2snDUJ54mYwPFd7NyG74cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588712;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Jytb5b4xn/Mc/8CDjSCwQBqNAzxPN/ytL+xE8neqSQ0=;
	b=O4ZHNxuKQOuYQEloc5S2/maQZGibGjmyiZzdvULub2gTCPtYB11zrIf7Z7A9t9r2TZdT
	 ocoa9jaC+UnEkDUrTBfF0pJjkJ6QjtrNVE0sSkwbidpE3lATenHEQZnEMxnzRFeJELwp6
	 uiC7tX5EaRAHnAenFHHupsqbYMtCsnSXoayHP9x2eI6FfSEbxumrhuuRY9BGh2/bNH/JG
	 XoEfkoNcZRnVa68s3/qkKLHLivHsUAxowU3WN7Edw3k2ERk858MmRGbhzx0YuS7MyxhvN
	 PoZv+XlnDnoXque1xngYnPsYdiBphWisv+oTPf4K/LvUQv7cA7Xed2+QYQwo9HwQSuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Btb6a7CX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE24606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Btb6a7CX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FBA1F000D8;
	Wed, 25 Nov 2026 06:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795588712;
	bh=Jytb5b4xn/Mc/8CDjSCwQBqNAzxPN/ytL+xE8neqSQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Btb6a7CX2mHFz/14rEwpXzYbdZBVUvhhgIX6s76raY+uvO6vykGPnwoLqEwNq7h11
	 2sqVxTzyqP9VeX78rg8sJF7KzR62ad6rasPkUxBD7N8pj7OJiIPMC6vYmY/leZgk+V
	 S3NRpVQLeppqcRD2FjYTmSvbkjj5u+Fl2psxYIagP4K+yly+1+iZ99GmHYPd7ptqKD
	 PSHEdkWpw8AD0JTPmDJab6UVBYhVYjdg6ydpF+RrCUtCgoQFwvXvbCQyKjQsK7HGoy
	 g1j1fLGPYY2cBNUZIh9BhSgTKCP5FDSm/kcI4d9Q6hK/Xy+vWVvKOwFZh9dbB5cKNX
	 aTvLKY4zqaJnQ==
Message-ID: <sashiko-outbox-232721@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 15/15] media: mediatek: jpeg: add jpeg smmu sid
 setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125061618.2544386-16-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
 <20261125061618.2544386-16-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:38:31 +0000
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

commit 176ed455ed4a414badd5df2dbced78dc780e59ed
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: add jpeg smmu sid setting

This commit configures the MT8196 JPEG decoder and encoder SMMU stream IDs
via a syscon regmap and moves SMMU initialization ahead of reserving
hw_index in the child hardware probe paths.

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
[ ... ]
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
Can a failed or deferred child probe in mtk_jpegdec_smmu_init() or
mtk_jpegenc_smmu_init() leave master_dev->dec_hw_dev[] or
master_dev->enc_hw_dev[] with NULL entries and cause a NULL pointer
dereference when jobs are queued?

In mtk_jpeg_probe(), the parent sets jpeg->max_hw_count to the total number
of DT child nodes and registers the V4L2 video device regardless of whether
every child core finished probing:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpeg_probe() {
    ...
	ret =3D devm_of_platform_populate(&pdev->dev);
    ...
		for_each_child_of_node(pdev->dev.of_node, child)
			num_child++;
    ...
		jpeg->max_hw_count =3D num_child;
		atomic_set(&jpeg->hw_index, 0);
    ...
}

When a child probe fails or returns -EPROBE_DEFER before incrementing
master_dev->hw_index, its slot in dec_hw_dev[] or enc_hw_dev[] remains NULL.
mtk_jpegdec_worker() and mtk_jpegenc_worker() call mtk_jpegdec_get_hw() and
mtk_jpegenc_get_hw() before waiting on jpeg->hw_rdy, and both functions loop
up to jpeg->max_hw_count and dereference comp_jpeg->hw_state without a NULL
check:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpegdec_get_hw() {
    ...
	for (i =3D 0; i < jpeg->max_hw_count; i++) {
		comp_jpeg =3D jpeg->dec_hw_dev[i];
		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
    ...
}

In addition, because mtk_jpeg_probe() calls devm_of_platform_populate()
before atomic_set(&jpeg->hw_index, 0), if one child probes synchronously
during devm_of_platform_populate() (recording slot 0) and a second child
defers in mtk_jpegdec_smmu_init() or mtk_jpegenc_smmu_init(),
mtk_jpeg_probe() resets hw_index back to 0; when the deferred child later
probes, it claims slot 0 again, overwriting dec_hw_dev[0] or enc_hw_dev[0]
and leaving slot 1 permanently NULL.

The workers also snapshot dec_hw_dev[] and enc_hw_dev[] into a local
comp_jpeg[] array before the retry_select wait loop, and the child probes
publish dec_hw_dev[i] and enc_hw_dev[i] before calling
platform_set_drvdata() and pm_runtime_enable(), so a worker racing with a
late-probing child can dereference a stale NULL comp_jpeg[hw_id] snapshot or
call pm_runtime_resume_and_get() before the child's drvdata is set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125061618.2544=
386-1-kyrie.wu@mediatek.com?part=3D15
