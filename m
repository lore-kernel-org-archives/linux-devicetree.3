Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140D54086A
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784513033; cv=none; b=N1Wfnx1mfaBWCt6hhgtasegqHM89x1e7X1oJBX70dV/UCgiAyWHtkKFmCoh3cqNzG5Y5ePhpNglc+6kMxp0UeAbi2xB4hT65irJ+HvAhkVlP3waFOpJ4KNi/pwysJUBm+1Saa1tFA+oXbKvKlc+33mFxBFDR8tppGXtl9KcSIXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784513033; c=relaxed/simple;
	bh=wRhTowLXgy2DeS+AfmkWHjPR/geu91zNYXQHiORSyl0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HuRnad0+Hndzq9f7OyhyNMNEgFBm1aq37twOetBpqp39SaDOz5DdMZg43bqJAWTvH2GO7htcu4ZU6iH8qPW7ZDhc7BSq3+9wOZ7qsSAllbuQ1AC4MM7ohGl6mONTeVnZhyun8T4K2PV/PB3+4y7UKq4dC1nDntf88KwPWOt+MR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwC3XPeZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwC3XPeZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE4B1F000E9;
	Mon, 20 Jul 2026 02:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784513031;
	bh=N92jAev2uub2tvEQ9gk46jAGAfSYdi+2hKIu4vzXuww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fwC3XPeZs7Ei8MxSzklmWZXciIYw5gB8GiKcPdhghg226yW1esRz5rVO0TKvlvryy
	 9aame66H79Xxbw1Xbhg8C7nMn+BNVAtYDjFsEDigz4oCXod+MZo5tPIQpE8VVvqWx4
	 bxpplBleSKwZJFgNQWFi7UrpVUMpwbMcODSd7+ss70vPIOxYFkGwvLYX3VXC61xrMC
	 fqpCeI9BQlpWVE9pUucbRl51WnSfzs6V9z//+3WIif+MpoekRN7vWkqt9BfoRx3FnB
	 xrhGZorWHHh2JKrKOuLaSclbm/xOq7R2jAq2Gs9oMyEy41kL91M7brKlctkSDdCIiH
	 mdnfpVlFFJ12Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/14] media: mediatek: vcodec: clean xpc status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260720012056.1026551-13-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-13-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 02:03:50 +0000
Message-Id: <20260720020350.BAE4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Enum type mismatch when indexing parent device's register array.

Pre-existing issues:
- [High] Null pointer dereference on spurious hardware interrupts.
- [High] Use-after-free and dirty state on probe error path.
- [High] Unconditional NULL pointer dereference in the hardware IRQ handler=
 on platforms using syscon for VDECSYS.
--

--- Patch [12]: [PATCH v6 12/14] media: mediatek: vcodec: clean xpc status =
---
commit ff6c78cd026b1536229c06cdffd12b2498c8aeb9
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: clean xpc status

The driver need to clean xpc status when receive decoder hardware
interrupt for mt8196 platform.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> index 881d5de41e050..46ac3e41c401c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> @@ -88,6 +116,8 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, vo=
id *priv)

[Severity: High]
This is a pre-existing issue, but does mtk_vdec_hw_irq_handler() in
mtk_vcodec_dec_hw.c properly handle spurious interrupts where
mtk_vcodec_get_curr_ctx() returns NULL?

If there is no active context when the interrupt fires, ctx will be NULL.
The handler subsequently passes this NULL context to mtk_v4l2_vdec_err(),
which dereferences ctx->dev directly:

mtk_vdec_hw_irq_handler() {
    ...
    ctx =3D mtk_vcodec_get_curr_ctx(dev->main_dev, dev->hw_idx);

    /* check if HW active or not */
    cg_status =3D readl(dev->reg_base[VDEC_HW_SYS] + VDEC_HW_ACTIVE_ADDR);
    if (cg_status & VDEC_HW_ACTIVE_MASK) {
        mtk_v4l2_vdec_err(ctx, "vdec active is not 0x0 (0x%08x)", cg_status=
);
        return IRQ_HANDLED;
    }
    ...
}

Could this trigger a kernel panic on spurious interrupts?

[Severity: High]
This is also a pre-existing issue, but will dev->reg_base[VDEC_HW_SYS] be
NULL in mtk_vdec_hw_irq_handler() on platforms using syscon for VDECSYS
(like MT8195 and MT8196)?

On platforms utilizing the mediatek,vdecsys syscon, main_dev->reg_base[0] is
left NULL. The subdevice probe copies this NULL pointer to the subdevice.
When an interrupt fires, the handler performs an unconditional readl() from
this NULL address in the snippet shown above, instead of using the
vdecsys_regmap fallback.

Could this cause an unconditional panic when an interrupt fires on affected
platforms?

>  	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
>  	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
> =20
> +	mtk_vdec_hw_clean_xpc(dev);
> +
>  	wake_up_dec_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);
> =20
>  	mtk_v4l2_vdec_dbg(3, ctx, "wake up ctx %d, dec_done_status=3D%x",

[ ... ]

> @@ -166,6 +196,7 @@ static int mtk_vdec_hw_probe(struct platform_device *=
pdev)
>  	subdev_dev->hw_idx =3D hw_idx;
>  	subdev_dev->main_dev =3D main_dev;
>  	subdev_dev->reg_base[VDEC_HW_SYS] =3D main_dev->reg_base[VDEC_HW_SYS];
> +	subdev_dev->reg_base[VDEC_HW_XPC] =3D main_dev->reg_base[VDEC_HW_MISC];

[Severity: Low]
Is mtk_vdec_hw_probe() indexing the main_dev->reg_base array with the
correct enum?

It looks like it is using VDEC_HW_MISC (from enum mtk_vdec_hw_reg_idx)
instead of the expected VDEC_MISC (from enum mtk_hw_reg_idx). While they
both currently evaluate to 1, could this cause out-of-bounds access or
incorrect address mappings if the enums drift?

>  	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);
> =20
>  	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {

[Severity: High]
This is a pre-existing issue, but does the mtk_vdec_hw_probe() error path
leave dangling pointers in the parent device?

If mtk_vdec_hw_init_irq() fails here, mtk_vdec_hw_probe() returns an error:

mtk_vdec_hw_probe() {
    ...
    if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
        ret =3D mtk_vdec_hw_init_irq(subdev_dev);
        if (ret)
            return ret;
    }
    ...
}

Since subdev_dev was allocated with devres, it will be automatically freed.
However, the parent (main_dev) will retain the freed pointer in
main_dev->subdev_dev[hw_idx] and the bit in main_dev->subdev_bitmap remains
set.

Could this lead to a use-after-free if another component iterates over the
subdevices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D12
