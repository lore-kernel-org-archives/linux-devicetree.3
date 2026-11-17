Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888299;
	b=UO17dYc8xZnzninEZ2zmC8srpOb7tzRmyga5DOVn6G5MHK831NJWRItxn7bQHKWOiblA
	 K8wbUlLV+cmMVdrAWQE7g69yE2910CCMiTdi3gABnDqXZEzMPs7J63C1bQQaFIBZguzZI
	 ghzjmVvnIprRsE5OV+H0nsI9waye7AB4sRZ9e2MiP33pS9PkiPMDZPl6Ms9Do7q1/i8Bp
	 rQVBmxpslCeRY+WfBkBz4ZS5Q1MhmYboR6s//dVVXJeI0EpRkL4XQpXK3yTDuMvW16Vs0
	 ySuDrGSMeIDcOcYtHTa9L5yieqG0TuaqyYYQz6pbHfBJVliBaXHmBjxZSHo1815HHNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888299;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Vq5se2PbBT44b9b9gXYtBAicer31fx91JuywtuJLWUY=;
	b=MtUuucxADYt/lHJ3ROThNcHSjL4LixmQiHgoVgLb684FpaUbMvJDU/0lNo+cjwEc12fU
	 s1D+SytwC//fLZkPPOW5FwmGQACMvhBsTfpA78D7jiteVhNuWKvrFfYz74TohixUZAF0z
	 Um7QTZxD+lfcBMoowWM/jeBcUToPCf4ETP1vrG/xOJ0MAD7b1fDaXPwqTF+PindbzwnYw
	 Z4std+vQCsau4bNNY6yOACvJith4EwUz9FgAc3ptNsa6ODG9lwngCV8f7gEM/r90XcZ4D
	 k4f8UmJsXBiTDiZ7nru/B45H5onRdgBCBb7qyUhPeN5BYmW9fz1KRZ9oRxkCRtI1ydw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qygh+pFO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79042606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qygh+pFO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F501F000C4;
	Tue, 17 Nov 2026 04:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794888299;
	bh=Vq5se2PbBT44b9b9gXYtBAicer31fx91JuywtuJLWUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qygh+pFOgV9y4VQite6Ft+tolgldOELgBZuvkE12S334Y+uG+Ea1PU5a03lPlFINs
	 Hv3Uoik0/oYMgsdBttIt+pq1ssuq73M3rEMoWCygjzp8EbNVltYGa8ztvUoM2rj4zR
	 faAJB+vK79MBTgXnigeQ4FZ0r4teFjUr1foWMZwtcoyW+4h3f4LyRkOf63RjnCMVn6
	 PaNFjupk5slv1ui1GOgcbvKFRK5cethqmCSWrJ5OvEF+eTKlLik/1udSNHPYqcHkP3
	 jUhrtH428+EJFXapyRKlosqnx1u//+ShvfEaACs/8rhJuoi0qo6Nnk8zhitRFkKYNW
	 xazr5IKmi5L/Q==
Message-ID: <sashiko-outbox-218177@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 12/14] media: mediatek: vcodec: clean xpc status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117032950.1425556-13-kyrie.wu@mediatek.com>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
 <20261117032950.1425556-13-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 04:04:58 +0000
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
- [High] media: mediatek: vcodec: NULL deref in mtk_vdec_hw_clean_xpc()
  on 1-reg DT
--

commit 3c6ea2c7c9930e2a80beb78bf3ec55deb1a4a89a
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: clean xpc status

This commit clears the XPC status register in the decoder subdev interrupt
handler on MT8196 platforms.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> index fa0e13145252b..e75fe79d02d7a 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> @@ -61,6 +61,34 @@ static int mtk_vdec_hw_prob_done(struct mtk_vcodec_dec=
_dev *vdec_dev)
>  	return 0;
>  }
> =20
> +static void mtk_vdec_hw_write_reg_mask(void __iomem *reg_base, u32 reg_o=
ffset, u32 val, u32 mask)
> +{
> +	void __iomem *reg_addr =3D reg_base + reg_offset;
> +	u32 reg_val;
> +
> +	reg_val =3D  readl(reg_addr);
> +	reg_val &=3D ~mask;
> +	reg_val |=3D (val & mask);
> +	writel(reg_val, reg_addr);
> +}
> +
> +static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_dev *dev)
> +{
> +	unsigned long flags;
> +	u32 val, mask, addr =3D VDEC_XPC_CLEAN_ADDR;
> +
> +	if (dev->main_dev->chip_name !=3D MTK_VDEC_MT8196)
> +		return;
> +
> +	val =3D dev->hw_idx =3D=3D MTK_VDEC_LAT0 ? VDEC_XPC_LAT_VAL : VDEC_XPC_=
CORE_VAL;
> +	mask =3D dev->hw_idx =3D=3D MTK_VDEC_LAT0 ? VDEC_XPC_LAT_MASK : VDEC_XP=
C_CORE_MASK;
> +
> +	spin_lock_irqsave(&dev->main_dev->irqlock, flags);
> +	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, val, mask);
> +	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, 0, mask);
> +	spin_unlock_irqrestore(&dev->main_dev->irqlock, flags);
> +}

[ ... ]

> @@ -166,6 +196,7 @@ static int mtk_vdec_hw_probe(struct platform_device *=
pdev)
>  	subdev_dev->hw_idx =3D hw_idx;
>  	subdev_dev->main_dev =3D main_dev;
>  	subdev_dev->reg_base[VDEC_HW_SYS] =3D main_dev->reg_base[VDEC_HW_SYS];
> +	subdev_dev->reg_base[VDEC_HW_XPC] =3D main_dev->reg_base[VDEC_HW_MISC];

[Severity: High]
Can dev->reg_base[VDEC_HW_XPC] be NULL when mtk_vdec_hw_clean_xpc() runs in
the interrupt handler?

The mediatek,vcodec-subdev-decoder binding allows the parent decoder node to
specify a single reg entry (minItems: 1), and mtk_vcodec_get_reg_bases()
accepts reg_num =3D=3D 1, leaving main_dev->reg_base[1] as NULL.  When a de=
code
interrupt fires on MT8196 with such a Device Tree, mtk_vdec_hw_clean_xpc()
passes NULL to mtk_vdec_hw_write_reg_mask(), causing a NULL pointer
dereference in hard IRQ context while holding dev->main_dev->irqlock.

Also, main_dev->reg_base is indexed by enum mtk_hw_reg_idx (VDEC_MISC)
rather than enum mtk_vdec_hw_reg_idx (VDEC_HW_MISC).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117032950.1425=
556-1-kyrie.wu@mediatek.com?part=3D12
