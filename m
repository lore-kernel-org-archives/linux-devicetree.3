Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758ABC8D9
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132562; cv=none; b=cdqtl5t/+TUDjshoF1c7SwbXRJ19LCNKTiiXECap766pqQwwIsLvO4XV+DD9nyM5wR86OelM3waCb0nnMZfKX7dHPmr9KOfXgGyHsXQXWZbzoeFj6CynIauSkvM9qNwHah3YQ36E81xEmz2D4PDaV3aQka0PKIMuyJgaVZoK1Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132562; c=relaxed/simple;
	bh=8H9ntk0dufll4bnSBFW/CqtF1Y0Wgy+JP8i8/opLxzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sbk/opj2Lj8f7AhZpY9r7ZdtbUqqfPwGqxLNRoHm0tFoWKSCyo7aC2uaRT4gafehuxg/czWPYoFUOSmWZ6KXCP/5vQs7OwtJwGuwL4duHToW46taVrQKHkHhVcG5olyLKvc88hD83utu5lzG97zSy9QGQah7CHNgUP+G3EDXz6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Giy8oJt1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Giy8oJt1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0130A1F000FF;
	Wed, 23 Sep 2026 03:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790132561;
	bh=O61ijrfsiBSmyym0RakGjF4qJUrBGsIo5/Vrt00BxN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Giy8oJt1Kfu3A/9e35xBAFFjFb15Ub5SGFNPH30Ntituzde6gRsOvlWErk15rMvWX
	 sJ9LLQJfIsXCaorT/WEdiVz8e7MLqgW5iVysh420Qs9IPrB5EDBGbP4puenoZVuplz
	 4g+gRS9oldUcZ7/8o03DZ1ZNHatGxZXH40L7iOEQeeiK0qQMfTX1g08TNMy/dhnpri
	 gyCF6QpuuOOo/C+AKMa50P6iMLQTG8206vTXzdHRIJrbnogOsRsR+PtPimApL9cJKj
	 +47R7E97uREel9CmNkFfQrGKKHkafwF/VsU79TUFmC0I9oMeep0Qr8e5DpsfkyE3Uy
	 IODvpR/hGH1gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/14] media: mediatek: vcodec: clean xpc status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260923024258.257846-13-kyrie.wu@mediatek.com>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
 <20260923024258.257846-13-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 03:02:40 +0000
Message-Id: <20260923030241.0130A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] media: mediatek: wrong enum type used to index main_dev->reg_base a=
rray
--

commit c332070b6bf8a16fa63f12155e0ac06b323d2142
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: clean xpc status

The driver need to clean xpc status when receive decoder hardware
interrupt for mt8196 platform.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> index 881d5de41e050..46ac3e41c401c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c

[ ... ]

> @@ -166,6 +196,7 @@ static int mtk_vdec_hw_probe(struct platform_device *=
pdev)
>  	subdev_dev->hw_idx =3D hw_idx;
>  	subdev_dev->main_dev =3D main_dev;
>  	subdev_dev->reg_base[VDEC_HW_SYS] =3D main_dev->reg_base[VDEC_HW_SYS];
> +	subdev_dev->reg_base[VDEC_HW_XPC] =3D main_dev->reg_base[VDEC_HW_MISC];
                                                                     ^^^^^^=
^^^^^^

[Severity: Low]
Is the wrong enum type used here to index main_dev->reg_base?

The array main_dev->reg_base is explicitly sized by NUM_MAX_VCODEC_REG_BASE
and expects to be indexed by enum mtk_hw_reg_idx (which includes VDEC_MISC).
However, this line uses VDEC_HW_MISC, which belongs to enum
mtk_vdec_hw_reg_idx.

While both VDEC_MISC and VDEC_HW_MISC happen to evaluate to 1, avoiding an
out-of-bounds fault or incorrect register access today, this cross-enum
type mismatch creates a logic flaw that could be fragile if the enums change
in the future.

>  	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);
> =20
>  	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923024258.2578=
46-1-kyrie.wu@mediatek.com?part=3D12
