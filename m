Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EF52F8EB5
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 16:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780159363; cv=none; b=UOlymKHsvRjt9qpzD1r/fJvfhaSGBvquE1w2zGRjtkLEbeajhL3z9TbEJd+xiPWO28OWih0ZMi5GBvxN/QtPXy9PQwt/ld37Rf/zr9SdpxBPpBW4VCmferKuJukF/XSIoNaKxPo+TcKSJ83nttgIM11IvkVefdgDx49R31GDOKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780159363; c=relaxed/simple;
	bh=WYQwKeIiFi9/GzVWRrryK2i9eByGrY9BHtjdceUf2v4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y1SvUtRZGDr4WdbRT+wpMtLIwSgPDk/r7NHvF34HhwSuvP3gW5PWK4xjuMD7jy9nV/Eq8tj9iWfoHQrKj9NTKcjnyHdeOohTpKC+QrU6BqcYsmn8xrQSfvbVFngDvx0gF8q58+iE6AnZJttcU+PRX88JePF6RV1zCvsOdgQuY+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ey0Ewwme; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ey0Ewwme"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B271F00893;
	Sat, 30 May 2026 16:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780159361;
	bh=tI31eU54z/F/GsAYWKKYRz3tblKx9/zA70D/ujdTlhs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ey0Ewwmeh1Ia8m0eB3xEaqbLvxzZUzKgZkrulHW9eNE1igVPtOUJmVjiiesE2sye5
	 uG/TBuqWdSbDWZZ4E7RERv7CAfMr7o8EMLLfH0ivQlm2ORZ7rrR2eawfs4TNEsPvRX
	 65bl3Yhy/ipYoSn7HiAV1o7rhCavA/oLPX+PYfLDv6PrN4V6vIxaKYtj2GsCS95+fr
	 tpsSl8UGK+JN0GQUxuRgWVid3Kvr4SniuyL1bHBDMFScyVjzSqoDIpLQcrxe3hQ83O
	 z47ZhATUhX88wDewEZtiKyF8lKOR/EFXJbzW9VmTW/DSACNFs6Ulgw6VyeC0pGRxSC
	 0Zzvv7Kkg83rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add crypto node to
 rk356x-base
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Olesinski" <dawidro@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260530160704.3453555-4-dawidro@gmail.com>
References: <20260530160704.3453555-4-dawidro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 16:42:41 +0000
Message-Id: <20260530164241.72B271F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The `crypto@fe380000` device tree node is placed out of order with =
respect to its unit address.

Pre-existing issues:
- [High] The driver requests a shared interrupt before device clocks are en=
abled, and its ISR does not check the power state, leading to a potential f=
atal unclocked register access.
--

commit 30c6ac6a0076f1ce31fb0365a3eee2a85dadf551
Author: Dawid Olesinski <dawidro@gmail.com>

arm64: dts: rockchip: Add crypto node to rk356x-base

This commit adds the device tree node for the V2 cryptographic hardware
accelerator on RK356x SoCs. The IP block sits in the non-secure peripheral
domain and is disabled by default.

> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index 64bdd8b7754b5..3b73a56046e77 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -1171,6 +1171,18 @@ gpu_leakage: gpu-leakage@1d {
>  		};
>  	};
> =20
> +	crypto: crypto@fe380000 {

[Severity: Low]
Is this device tree node placed out of order?

Device tree nodes with unit addresses are typically sorted numerically by
their physical base address. Would it be better to place this node before
the rng@fe388000 node to maintain the established sorting order?

> +		compatible =3D "rockchip,rk3568-crypto";
> +		reg =3D <0x0 0xfe380000 0x0 0x2000>;
> +		interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cru CLK_CRYPTO_NS_CORE>, <&cru ACLK_CRYPTO_NS>,
> +			 <&cru HCLK_CRYPTO_NS>;
> +		clock-names =3D "core", "aclk", "hclk";
> +		resets =3D <&cru SRST_CRYPTO_NS_CORE>;
> +		reset-names =3D "core";
> +		status =3D "disabled";
> +	};

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential issue
in the driver code that this DT node enables in
drivers/crypto/rockchip/rk2_crypto.c.

The driver requests a shared interrupt in rk2_crypto_probe() before
device clocks are enabled via runtime PM:

rk2_crypto_probe() {
    ...
    err =3D devm_request_irq(dev, rkc->irq,
                           rk2_crypto_irq_handle, IRQF_SHARED,
                           "rk-crypto", pdev);
    ...
}

If a shared device triggers the interrupt, or a spurious interrupt occurs
while the device clocks are disabled, the ISR rk2_crypto_irq_handle()
will execute and blindly read from the hardware status register:

rk2_crypto_irq_handle() {
    ...
    v =3D readl(rkc->reg + RK2_CRYPTO_DMA_INT_ST);
    ...
}

Could this cause a fatal external abort (SError) if the MMIO register
is accessed while the clock domain is unpowered?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530160704.3453=
555-1-dawidro@gmail.com?part=3D3
