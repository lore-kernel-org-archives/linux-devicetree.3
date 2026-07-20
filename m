Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965073B8BC6
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557396; cv=none; b=aRpRPitGD0J6Q8E6hX5RRYzPKW/6y+ufbbfAhyr3sEZDKwP3MaDa/uczSu7hfHkO4nr0Lux4ESPWKzAzYEBLCLUhYTmILRscMU/up1sLgJfHllQhjP3BvxZQQNgi6lRvLCQDbQqqTjBpV/0auzTKI0vrFb4gnqR9YsNmNnjbd8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557396; c=relaxed/simple;
	bh=AsKdK3IgRqLMAF+ikowqSS5LFma6IHdilcfgpGrqmVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NeRq+FhthTlM6n/J8vT1S8CUSYzMVyjNpwLvlL/tbIhiT/R9ntSITgcgVagb/xniUy0XxzSBnfHmWImjNz6GQ4zbZO+ttsOT6DJJfTELCj97ME9iYyMy8qF4lDEoNYOJgRAVEwkcxaO9PucSkTI9MBn6c0Bybusq3W2eSj9p6yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcQBpuQU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcQBpuQU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D17E1F000E9;
	Mon, 20 Jul 2026 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784557395;
	bh=AsKdK3IgRqLMAF+ikowqSS5LFma6IHdilcfgpGrqmVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AcQBpuQU79kkmTmRIFeaWsicduKUxGDB8XP8+zMHRn+HewRrXzzHYkqg5wpv9biIm
	 jw8ekWRP0hCiFyYTCzc+lohPQGYx0zt/6Q1ArXhock16hdPKwU/9r90/Dpr4GZgRkO
	 Cf89BAYZq2bwHktl0AA9IBJwoCJmqDIcC0OSfZxUacQ9XevFj/cDDa1dTNwsw05/vW
	 c7HB6X4OUlCtw29y32Ioa1HBLWfNaSdCqittJltmd52fIYS3NtvtFfc/SiLQfylCSB
	 5nqHEb9HG+H/GkzBZharmBEjWX3wlEm1xri3lnjXv2DlU8SNY+Qcs+iE2rgZqoCwH+
	 rtPrnuvJBohhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 11/12] media: mediatek: jpeg: add jpeg compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260720133432.1042046-12-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
 <20260720133432.1042046-12-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:23:14 +0000
Message-Id: <20260720142315.0D17E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check on the number of DT child nodes causes out-of=
-bounds array accesses and stack overflows.
- [High] Incorrect calculation of the 34-bit extension address for the enco=
der's stall address.
--

--- Patch [11]: [PATCH v16 11/12] media: mediatek: jpeg: add jpeg compatibl=
e ---
Note: The format of this report has been altered to provide a free-form
summary without quoting the original patch code, due to recitation
restrictions.

commit f9b0fac0a51678a6983018a9ca39e5cce2cb6604
Author: Kyrie Wu <kyrie.wu@mediatek.com>
media: mediatek: jpeg: add jpeg compatible

This commit adds JPEG encoder and decoder compatibles for the mt8196
platform. It sets up the variant data structures with appropriate
capabilities like multi-core and 34-bit support.

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the new
compatibles, I noticed a potential stack overflow in the core driver.

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpeg_probe(),
the code iterates over the device tree child nodes and sets
jpeg->max_hw_count to the total number of children, without capping it.

Later, in mtk_jpegenc_worker() and mtk_jpegdec_worker(), this unbounded
jpeg->max_hw_count is used as a loop limit to copy elements into the
comp_jpeg array, which is a fixed-size stack array. Additionally, in
mtk_jpegenc_hw_probe(), the hw_index is incremented and used without
bounds checking to store hardware instances into master_dev->enc_hw_dev.

Could a malformed device tree with more child nodes than the hardware limit
cause a stack buffer overflow or out-of-bounds write here? Should we add
bounds checking against MTK_JPEGENC_HW_MAX and MTK_JPEGDEC_HW_MAX?

[Severity: High]
This isn't a bug introduced by this patch, but adding support_34bit =3D true
for mt8196_jpegenc_drvdata exposes an existing issue in the encoder address
calculation.

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c at
mtk_jpeg_set_enc_dst(), when 34-bit support is enabled, the code calculates
the extended address using FIELD_PREP on the upper 32 bits of dma_addr.

It then writes the sum of this extended address and the buffer size to the
JPEG_ENC_STALL_ADDR0_EXT register. Because the extended address is a masked
bitfield representing the upper 32 bits, adding the raw byte length size
directly to this bitfield seems incorrect.

Could this result in writing an invalid, unmasked address extension to the
hardware registers, potentially leading to SMMU faults or memory corruption?
Should this instead calculate the upper 32 bits of the sum of dma_addr
and size?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133432.1042=
046-1-kyrie.wu@mediatek.com?part=3D11
