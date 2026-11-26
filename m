Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652491;
	b=pUGgtkNGsoIOIgjYh1jriIg9m/HzbhPfc3W6j6Y7wXHo96/TSdZ+zSj3DZnsZQ0LVEyN
	 HKGKXn+OVWorSUfaee0C1kJam2xFpsKQzJAoD4g9pEZVTtrMg8IuehkSgmnQoWQU0AJjF
	 WItZ+VDVeZw5r8DOi0b3XEg1vkd/lyq/v7J2GcDtBUDneywURkScj0FS6umEZTzcRaH7O
	 wwyOS2YnIbiK7jAPYc645I85+NovjAsQ/w7WzbLQsEi/5b7KH9s15cT4wbbO5EQ7amcpK
	 PPznE5L5TBsf3c2EXYp1IyRo1fi/Z0X5QQDHXrc/8ZGn86r53IItfwW+W/tuuB+Ge9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652491;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ov+34zS1NT//W/Q16Zzg/rygUX8KDVBq2mJRyYs2Rys=;
	b=nbGoMPzTLWq/vQ/gQ5koe+hl+PrgxbRyqPiGHy19FsQ8CNq/a25lAC+fsbiQJchWJTmD
	 yKYmoQq52CyDqaHX3GdXkGGlvrrXwtXifwt75Z7DToId/ooNWkoEMgFNaLR+5glMP4kZP
	 Ru4919zgiXfsh/WGe8tS7l9UoRrGBDP8FbKB0w6WXNgLh4zUAYhgmSpC2M/5j1F101d2u
	 Qsk6aGPxSJZbCGgn3+s37WDtth700RUn7VY4l92vvneURPYAHqkDO3poQA5NAujVasHrv
	 elOz5uPvC3lsBGD0MSrCcQjHBosnas8EghnqRGBDUJRO74CokOWIdP0BvixRKMJgaiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgaOJX3+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10321606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgaOJX3+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742A51F000C0;
	Thu, 26 Nov 2026 00:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795652490;
	bh=ov+34zS1NT//W/Q16Zzg/rygUX8KDVBq2mJRyYs2Rys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FgaOJX3+z8t66SvI8o39W9bEvK/hA07QONaixZsezaY3i6BEk2hLU4q/Qhlxfts8M
	 hIXD/5a5B2kGOSbi3j0X5RFSJuM8y0Y0zRoasNDshStFLQCks3irnObtgaGjQEV+Za
	 ELlPdbNe9oFbwxdPydQyT97NZMEcyKR2j4aOxJ4mqQAG/hsVG2EUyO/+cJRaLQeZdd
	 i5e0tFMdwYQQlgNLWDL8dtWj3wre7hqJ1P2bvA98VWUcqjAjRsm0xknvQ4wHt5TIYd
	 HiFcKHBWtEN0T9KvIqW4IOn4dOuntSy+3SS+x9ubxSdOxCq1ZGSxb0WGRrYq9L/882
	 ERVtjLLq9vWZA==
Message-ID: <sashiko-outbox-234462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ilia Snezhkov" <iasnezhkov@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126000711.16163-3-iasnezhkov@gmail.com>
References: <20261126000711.16163-1-iasnezhkov@gmail.com>
 <20261126000711.16163-3-iasnezhkov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 00:21:30 +0000
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
- [High] soc: mediatek: pwrap: missing INT_FLG and INT_CLR offsets in
  mt6789_regs
- [Medium] soc: mediatek: pwrap: unmapped WDT_SRC_EN and init writes to
  0x0 on MT6789
--

commit f63c0f3d9c9912d15ad03c4814d1837bc4e482d8
Author: Arseniy Velikanov <me@adomerle.pw>

soc: mediatek: mtk-pmic-pwrap: Add MT6789 support

This commit adds PMIC wrapper register definitions, cipher handling, wrapper
parameters, and device tree match table entry for the MediaTek MT6789 SoC.

> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/=
mtk-pmic-wrap.c
> index 90677187c3b56..c74e9164f3343 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -640,6 +640,17 @@ static const int mt6779_regs[] =3D {
>  	[PWRAP_WACS2_VLDCLR] =3D		0xC28,
>  };
> =20
> +static const int mt6789_regs[] =3D {
> +	[PWRAP_INIT_DONE2] =3D		0x0,
> +	[PWRAP_TIMER_EN] =3D		0x3E4,
> +	[PWRAP_INT_EN] =3D		0x450,
> +	[PWRAP_WACS2_CMD] =3D		0x880,
> +	[PWRAP_SWINF_2_WDATA_31_0] =3D	0x884,
> +	[PWRAP_SWINF_2_RDATA_31_0] =3D	0x894,
> +	[PWRAP_WACS2_VLDCLR] =3D		0x8A4,
> +	[PWRAP_WACS2_RDATA] =3D		0x8A8,
> +};

[Severity: High]
Should mt6789_regs[] also define PWRAP_INT_FLG and PWRAP_INT_CLR?

Because both are omitted here, their offsets default to 0x0
(PWRAP_INIT_DONE2).  pwrap_probe() enables interrupts in PWRAP_INT_EN with
int_en_all =3D 0x180000 and registers pwrap_interrupt() with IRQF_TRIGGER_H=
IGH:

drivers/soc/mediatek/mtk-pmic-wrap.c:pwrap_interrupt() {
	rdata =3D pwrap_readl(wrp, PWRAP_INT_FLG);
	dev_err(wrp->dev, "unexpected interrupt int=3D0x%x\n", rdata);
	pwrap_writel(wrp, 0xffffffff, PWRAP_INT_CLR);

	return IRQ_HANDLED;
}

When an enabled interrupt fires, pwrap_interrupt() reads and writes
0xffffffff to offset 0x0 instead of clearing the interrupt status register,
leaving the level-high IRQ asserted and causing an interrupt storm.  (Compa=
ring
with mt8195_regs[], which shares these register offsets and int_en_all =3D
0x180000, 0x450 is bank 1 INT1_EN with flag and clear at 0x458 and 0x45c,
while bank 0 INT_EN/FLG/CLR are at 0x420/0x428/0x42c.)

[ ... ]

> @@ -1852,6 +1864,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *w=
rp)
>  	case PWRAP_MT7622:
>  		pwrap_writel(wrp, 0, PWRAP_CIPHER_EN);
>  		break;
> +	case PWRAP_MT6789:
>  	case PWRAP_MT6873:
>  	case PWRAP_MT8183:
>  	case PWRAP_MT8195:
> @@ -2302,6 +2315,19 @@ static const struct pmic_wrapper_type pwrap_mt6779=
 =3D {
>  	.init_soc_specific =3D NULL,
>  };
> =20
> +static const struct pmic_wrapper_type pwrap_mt6789 =3D {
> +	.regs =3D mt6789_regs,
> +	.type =3D PWRAP_MT6789,
> +	.arb_en_all =3D 0x777f,
> +	.int_en_all =3D 0x180000,
> +	.int1_en_all =3D 0,
> +	.spi_w =3D PWRAP_MAN_CMD_SPI_WRITE,
> +	.wdt_src =3D PWRAP_WDT_SRC_MASK_ALL,
> +	.caps =3D PWRAP_CAP_ARB,
> +	.init_reg_clock =3D pwrap_common_init_reg_clock,
> +	.init_soc_specific =3D NULL,
> +};

[Severity: Medium]
Does probing pwrap_mt6789 overwrite PWRAP_INIT_DONE2 at offset 0x0 with
wdt_src (0xffffffff)?

In pwrap_probe(), the PWRAP_CAP_ARB check added by 9d498d0b4043 ("soc:
mediatek: pwrap: add arbiter capability") only guards PWRAP_WDT_UNIT, while
PWRAP_WDT_SRC_EN is written unconditionally:

drivers/soc/mediatek/mtk-pmic-wrap.c:pwrap_probe() {
	...
	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
		pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);

	pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN);
	...
}

Since PWRAP_WDT_SRC_EN is not in mt6789_regs[], its offset is 0x0, so every
probe writes 0xffffffff to PWRAP_INIT_DONE2.  In addition, this patch adds
PWRAP_MT6789 to pwrap_init_cipher(), but mt6789_regs[] omits all cipher and
initialization registers used by pwrap_init() and pwrap_init_cipher(), so
if PWRAP_INIT_DONE2 is not already set by the bootloader, those writes will
also hit offset 0x0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126000711.1616=
3-1-iasnezhkov@gmail.com?part=3D2
