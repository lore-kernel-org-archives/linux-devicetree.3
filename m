Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F1F2F619D
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620621; cv=none; b=IbKMEHmPRIDyBxL4d1wItLzUY83mseEiyeKwy5ToPN4l8cYsPITDRFiL6WNnBzzr3W/6mErs9kOQwzH85LD4wTjw8fBB7EKKtS+HOyDcIfKe4sJWoUoVV7PWqsDumcEbfmaMQWRgZmNiAcuTDaP+5ebPOLp1oWzF9stPyAWnAsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620621; c=relaxed/simple;
	bh=ku7E7Ou3rG8nL5RuWpcUZ6CIHFJ7XEvwYNhHVYfAIfY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=vAHqHTLs0CctQJLcf4QALHqkwhdfTGVNlGdfuq7EH//nstBEGmU8uzpm0XH5FSPF4XXK87Z9bcgV+83oMryVQ7t6v7lnrClLsG3mj2XMe2jVLfnwt/ybMoPiltACnBzXICH91FwNxVfacLbf2l3X0M1zFDVhuy9EsKHt5PXtP58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWXRLcxc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWXRLcxc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50ADD1F000FF;
	Sat, 10 Oct 2026 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791620619;
	bh=UBw1ITdccw7R3jQFofWfurvib8bbkiE63XFu7MWyS7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hWXRLcxctJ0beKGEWhkEdQ9BvbffAiO0JDlnX/WAOl3hABcI+hqb7neckNuKnmcQs
	 xbdK8j9N8oWjfHPQAL1TrFeGZ2D0MohxfK79lQAXnKrqMD/QFu48IvdTPPb9gO4Meq
	 GX3LPaXww/1SIIVU4Xiph+017YHggg/xvnRxY+1ckD+VGHi8Ya0S1YFrFKTjwf2wtF
	 rmiA92AlTpStgl6hP8DOf/R7iA70/5WK6QnRh70fvUM3PvZKs84fogrH4HYhEX0ruh
	 wtmeuG7PZ4kTB6WJYiWi1L9KIa/bSQEdjwfUY/R4m3ePcqACl/7GDCv0Bcgy3oNwEZ
	 yqLOWZ3gRICoA==
Message-ID: <sashiko-outbox-166341@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 13/13] media: mediatek: jpeg: add jpeg smmu sid
 setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <844186eba43ba7e3c956ad9264cd4ae41a0f2548.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <844186eba43ba7e3c956ad9264cd4ae41a0f2548.1791614327.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:23:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: mtk-jpeg: UAF and OOB write on smmu_init probe failure
- [High] media: mtk-jpeg: stack and heap overflow due to unbounded DT child=
 nodes
--

commit 5c85022fd040c3aae35226e60e232c6d2771df6e
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: add jpeg smmu sid setting

This commit adds a configuration to set the JPEG decoder and encoder SMMU S=
ID.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
[ ... ]
> @@ -665,6 +684,10 @@ static int mtk_jpegdec_hw_probe(struct platform_devi=
ce *pdev)
>  	master_dev->reg_decbase[i] =3D dev->reg_base;
>  	dev->master_dev =3D master_dev;
> =20
> +	ret =3D mtk_jpegdec_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
If mtk_jpegdec_smmu_init() returns an error (such as -EPROBE_DEFER
when the SMMU isn't ready), the probe function returns immediately.

Will this leave a dangling pointer in the global master_dev->dec_hw_dev[i]
array after devm frees the dev structure?

Additionally, master_dev->hw_index is incremented via atomic_add_return()
before this initialization step. Because it is not decremented on this
error path, could subsequent probe retries keep incrementing hw_index and
eventually cause an out-of-bounds write on the fixed-size dec_hw_dev array?

>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);
[ ... ]
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
[ ... ]
> @@ -388,6 +407,10 @@ static int mtk_jpegenc_hw_probe(struct platform_devi=
ce *pdev)
>  	master_dev->reg_encbase[i] =3D dev->reg_base;
>  	dev->master_dev =3D master_dev;
> =20
> +	ret =3D mtk_jpegenc_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
Similar to the decoder probe, will returning early here on SMMU init
failure cause a use-after-free by leaving the freed dev pointer in
master_dev->enc_hw_dev[i]?

Also, are there any checks to ensure the index 'i' doesn't exceed the bounds
of the master_dev->enc_hw_dev array?

The device tree child nodes are counted and assigned to jpeg->max_hw_count
without validation. Later, in mtk_jpegenc_worker(), it appears this count is
used to populate a fixed-size stack array:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpegenc_worker() {
...
	struct mtk_jpegenc_comp_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
...
	for (i =3D 0; i < jpeg->max_hw_count; i++)
		comp_jpeg[i] =3D jpeg->enc_hw_dev[i];
...
}

Could an excessively large number of DT child nodes cause a heap buffer
overflow during probe, and subsequently a stack buffer overflow here?

>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791614327.gi=
t.kyrie.wu@mediatek.com?part=3D13
