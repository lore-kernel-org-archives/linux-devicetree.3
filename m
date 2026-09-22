Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653048EC78
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069695; cv=none; b=Jc+foWvwGJKBkI39CXZe9rHPpAKzL6mRR+FtLHWYI2dx/TdXr8oxiWToBjhj6f31rSTTO2tttwmbtMJzjyj+dGhej0fh+TDpQqIFa2wnz14bjWnf1hyJKeuHSbhEnaHPoCazc7gxN8kAC3kwNwzXeniA4oAiy5XQjksmJEdFzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069695; c=relaxed/simple;
	bh=hSQLQcqIebqqOawtyLsheZyH2UCpWiRQycrnNeVJ5YA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FJeC3L4YPY361+N5JDYALsvCf6JUoXmI3SoZA5Kk8fg5yhE8wyAbxYFYxFBC+2/pr/y9B1aO+DbQ/Lak4AN+GQYBWPAFaL0qH3es9FpDy9ecDHWkGVhN4rJWCyWs3LWcunqeua1sa7aUhx8E5AAJmn0r+uhj9QTo8LO9qNNT59A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFnA850P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFnA850P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCEF1F00893;
	Tue, 22 Sep 2026 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069693;
	bh=ezUiuNRnJx4R9BMDM0eB01NChZgVEsrb4yZHDu548zU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RFnA850PYtk7a6xvnl/bLkA9pQywnqL5+mSIftfFSFIBaCNOCpmYascPiVYcvYm5J
	 SXBBe2uYDI38oG0xywB2EDHVYG/XyyNxsJ3nScyTgU4EjryhBzEuhbwfFFby+h6p8w
	 Mf8SFBbwi43MTj2Vftwu6zAZ5v7Bw63pTuRcaE0GQkd04uccAd6F9+sEDOjcsR4tsv
	 9oVZbtNBloZJ2YfoNa1Ur3r3ztMivcy9nPeaTn2QHMZca3JqYTsU5/FtHLAddfimW1
	 7/sDHtOIeOi6gFo82wZjU9fSH9lcYDSf3l1cHYhRaMySeA2wBFrFAbP31DQhreOPik
	 OgfJzTVHHafVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 12/12] media: mediatek: jpeg: add jpeg smmu sid
 setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260922091530.241762-13-kyrie.wu@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-13-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:34:53 +0000
Message-Id: <20260922093453.6FCEF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: mediatek: jpeg: Probe failure UAF due to uncleared array en=
tries in smmu init
- [Low] media: mediatek: jpeg: Missing const on mtk8196_jpegenc_drvdata
--

commit 8c591407e461c7618344fd3592e2e6eabc6f2e56
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: add jpeg smmu sid setting
   =20
Add a configuration to set jpeg dec & enc smmu sid

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 8e96501a4f9fa..bb9bdd9913d94 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
[ ... ]
> @@ -1931,6 +1958,7 @@ static struct mtk_jpeg_variant mtk8196_jpegenc_drvd=
ata =3D {
>  	.multi_core =3D true,
>  	.jpeg_worker =3D mtk_jpegenc_worker,
>  	.support_34bit =3D true,
> +	.support_smmu =3D true,
>  };

[Severity: Low]
Is this struct missing the const qualifier?  Without it,
mtk8196_jpegenc_drvdata will be mapped to writable memory instead of
read-only data.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 07452249bcb67..3058fdf4f6054 100644
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
>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);
> =20

[Severity: High]
Does this code leave a dangling pointer in master_dev->dec_hw_dev[i] when
mtk_jpegdec_smmu_init() fails?

In mtk_jpegdec_hw_probe(), if mtk_jpegdec_smmu_init() fails during child
probe, it returns an error and devm_kzalloc() will free the dev structure.
However, dev is already stored in the parent's array
(master_dev->dec_hw_dev[i] =3D dev) and master_dev->hw_index was incremented
just above this snippet.

Can a subsequent job queued to the V4L2 device trigger mtk_jpegdec_worker()
to scan the hardware array and dereference the dangling pointer, causing
a use-after-free?

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index c7954af0eb65a..506a49d1ac04d 100644
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
>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);
> =20

[Severity: High]
Does this code leave a dangling pointer in master_dev->enc_hw_dev[i] when
mtk_jpegenc_smmu_init() fails?

In mtk_jpegenc_hw_probe(), similar to the decode probe above, if
mtk_jpegenc_smmu_init() fails, dev is freed but remains stored in the
parent's array (master_dev->enc_hw_dev[i] =3D dev) with master_dev->hw_index
already incremented.

Can a subsequent job queued to the V4L2 device trigger mtk_jpegenc_worker()
to dereference this freed pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922091530.2417=
62-1-kyrie.wu@mediatek.com?part=3D12
