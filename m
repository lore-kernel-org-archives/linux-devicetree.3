Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090013803DB
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622208; cv=none; b=ijEKXCpr6vukcCw3PIDujU5edE4f6Dkos445VDKeVRgJ8zGttljfc4P7aWITkyTJidqe8JusMeVjM3Yk3FemPVgXKEHl8OlVAIfgY6p4t4Dv2Y9aJR/QW06mFOsd709Wp3u9Lz9ImzKEueUZf0qDMxdAohl6N70OYK/nVl0lyQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622208; c=relaxed/simple;
	bh=xIXhTzDWaYpNpIkcNLf6/xgodtOEITZUki69NbVk/ps=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RAWj9RNQ2oG7tb4kqziWJCCoX/1UslqTDGNi9gfJtVZslwjd+n045PD/PLoPljwYlikUrPW097SeztT860t6UkhC4o4JVbzjF/iIeWLP1vPf69EWt0jNUSCldx5V+qPq4ZjfzmgA2pDqK6O7exm0IJE61dO4e5kL/BQTr24xr2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCD6ABDL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCD6ABDL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321691F000FF;
	Sat, 10 Oct 2026 08:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791622206;
	bh=beB/iAmCogwd7Siqw5B7SGmJ+8hGriu7h8FyQgSq+Hg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YCD6ABDLmPoPwgiXBS+0XiJqBXO8v/MSE9lytL8JB05KkNnvS7j8MbsL15e25r/6q
	 0O4ne5cXoUdcTkdT0/m/FBWaZ/yJaNEOCfj7CtbU0jEIyCeSzGFNJuFw2qlX3kwPVO
	 gLv/Y0PfULLYZ4wB/8ozooUl+qxXvPI0o09pcgeu2VXcHkHIsOAyros4VOXEgiLr7y
	 sWlxvePjjqjWv8KdH0yIOHFsBxnMsp/CxTY8JqyJEqyYQW1m8xI6SVcwg9kwC/HIBD
	 SrqmIBvTsmT+jxAUsz/HEDSxvJbp7kUQh60SmpuhfUqlLadvt7/M4lLgRLzDzRTy3f
	 sFQasSv7TLXNg==
Message-ID: <sashiko-outbox-166376@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 12/14] media: mediatek: vcodec: clean xpc status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <a0c9e3c5263d7f50d29aac7eb8c382ff89f4cb53.1791619743.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
 <a0c9e3c5263d7f50d29aac7eb8c382ff89f4cb53.1791619743.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:50:05 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: mtk-vcodec: NULL pointer deref in mtk_vdec_hw_irq_handler()
- [High] media: mtk-vcodec: NULL pointer dereference in mtk_vdec_hw_clean_x=
pc() on incomplete DT
--

commit 48b9203929193f7043af88ad2f6320fd0d5acb54
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: clean xpc status

The driver need to clean xpc status when receive decoder hardware
interrupt for mt8196 platform.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> index 881d5de41e050..46ac3e41c401c 100644
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

[Severity: High]
Does this code dereference a NULL pointer if the parent device tree node
provides only one reg entry?

If the MT8196 parent device tree node provides only one reg entry (which is
permitted by the DT bindings' minItems: 1), mtk_vcodec_get_reg_bases() will=
 map
only VDEC_SYS and leave main_dev->reg_base[VDEC_MISC] as NULL.

This NULL pointer is propagated to subdev_dev->reg_base[VDEC_HW_XPC] during
mtk_vdec_hw_probe():

    subdev_dev->reg_base[VDEC_HW_XPC] =3D main_dev->reg_base[VDEC_HW_MISC];

When the hardware interrupt fires, mtk_vdec_hw_clean_xpc() is unconditional=
ly
called for MT8196 and passes this NULL base to mtk_vdec_hw_write_reg_mask(),
which dereferences it here in readl().

Would it be better to validate the register base before use, or enforce
reg_num >=3D 2 for MT8196 during probe?

> +	reg_val &=3D ~mask;
> +	reg_val |=3D (val & mask);
> +	writel(reg_val, reg_addr);
> +}

[ ... ]

> @@ -88,6 +116,8 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, vo=
id *priv)
>  	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
>  	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
> =20
> +	mtk_vdec_hw_clean_xpc(dev);
> +
>  	wake_up_dec_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);

[Severity: High]
Can ctx be NULL here during the context teardown race window?

If a delayed or spurious interrupt fires during the teardown path window
(after mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE) clears the current
context, but before mtk_vcodec_dec_disable_irq() is called), or if hardware
continues generating events before IRQs are disabled, mtk_vdec_hw_irq_handl=
er()
fetches a NULL ctx.

If the HW is inactive, the NULL ctx is unconditionally dereferenced earlier=
 by
the mtk_v4l2_vdec_err macro to log an error. If the HW is active, it is
unconditionally dereferenced here to wake up the context queue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791619742.gi=
t.kyrie.wu@mediatek.com?part=3D12
