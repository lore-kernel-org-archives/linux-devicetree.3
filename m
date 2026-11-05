Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918396;
	b=SzICgwoCtA4eq4361JUepdC+BVMAQ/vEBSwNQ8mJ0434R0WfLpfzmSIYXUi8MmHxIQ6U
	 74juBIBAnONSdT4TDeNqmC/VGTcU7qhLXT5g20ichr86mrv2sFm5VDZoBGo7+eNvPh/7W
	 6T/3trDgt2K+VaMlLy+Q7ksYZSiROwHz0guOx+lhVcMp0LHsCAlThIj0hrVmXK+1Xreyy
	 uGDxmsq2wlDPhfivNQnWgEcohZ6iw7sII7pF+gY6S9iu3/y3rjwvgj+5HAo4T7d8Hua0Y
	 nEt7UnNxLxMqT/gogkErFWgGzLEvtMvgsMOODnpRrANxlc9rka0wy+s0yodEhmo1CRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918396;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9WLq9MEH+fVZqyNsdcL3aGsevvV+yItKilS3mcPRr4s=;
	b=NVWdO8tqZjL4oqUMWPvpqdYdDznkHKB/W5Fwmpq0LHIRjUOrBiz/e7S30p+ac1aL6XIp
	 5volSkx6j43uH3E7YWLtJs03GezsLF+UfFqXhOl0nZ8hKnAbZh9vDTMzxUNU8iQblmGYc
	 CMFCT9iHgYJxNi9Y00q04cIN6H/zX7bqcbMxtqGUTGyC3sChfYmOsl2Bfvr5DxNJcg5x+
	 2uFlZ9fYFq2QePieVLqg3z52JAAUViBGt34RMh2+geKBHFMpeuzE4tHOwxcj52p1q4u+7
	 o6V4Crd+w6XpGxi5Dg5SlOZdlA15QuzkCwdC/8m8zPBS9DuyoAh6EiQu0gAXS71A5AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PBL433Zr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06103606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 22:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PBL433Zr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9F91F008A4;
	Thu,  5 Nov 2026 22:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918395;
	bh=9WLq9MEH+fVZqyNsdcL3aGsevvV+yItKilS3mcPRr4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PBL433Zr7hkI5QXFEqVl8eE5MLF0mqdFpInvcvuHVIuSf6WpnRAsqJBoP/uxRS/O0
	 IUlPAPGyMK5B0WOG0nX4iSqjWjvNCE0KllmnSBMmTFm+q/rw2UV2D2yYrbMrIpCqsi
	 J+F3Z5JE9ZzKtqjJeay8g9PXDRndl5bNLvcQAog99oq+Zkj6bqIVegzmZ2cwpuhwVm
	 4j2dK8UcYWapQ4yg+9p3YtnZEqfNvEGog3TeEsIPENzTFN9v7vjeeUr1W1un+j6Qx1
	 lQSb0R7Gov2DO2yJ4zfxhwUrYs+f0JNnnfMUUGatXUHdt/Z14I/WgPnX7Hsreedcnh
	 DV2XDo3sYAE6g==
Message-ID: <sashiko-outbox-200320@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] ARM: dts: arm/vexpress: Fix Cortex-A15 GIC
 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-6-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
 <20261105-dt-vexpress-dts-fixes-v1-6-66615c3c8ec3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 22:39:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ARM: dts: vexpress: dropping arm,cortex-a9-gic breaks GIC init on =
v2p-ca5s
--

commit 35f1a8a2621e891a6464121f2faf6970b2efbbab
Author: Rob Herring (Arm) <robh@kernel.org>

ARM: dts: arm/vexpress: Fix Cortex-A15 GIC compatibles

This commit drops the "arm,cortex-a9-gic" fallback compatible from the GIC
interrupt-controller nodes in three Versatile Express device trees.

> diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts b/arch/arm/boot/=
dts/arm/vexpress-v2p-ca5s.dts
> index c716e60a8be0b..a5e0dde254ab3 100644
> --- a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
> +++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
> @@ -119,7 +119,7 @@ watchdog@2c000620 {
>  	};
> =20
>  	gic: interrupt-controller@2c001000 {
> -		compatible =3D "arm,cortex-a5-gic", "arm,cortex-a9-gic";
> +		compatible =3D "arm,cortex-a5-gic";

[Severity: High]
Does dropping "arm,cortex-a9-gic" from gic: interrupt-controller@2c001000 in
arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts break GIC initialization when
booting V2P-CA5s?

In arch/arm/mach-versatile/v2m.c, DT_MACHINE_START(VEXPRESS_DT) relies on
init_IRQ() -> irqchip_init() -> of_irq_init(__irqchip_of_table) to match the
root interrupt controller. However, drivers/irqchip/irq-gic.c does not decl=
are
a match for "arm,cortex-a5-gic":

drivers/irqchip/irq-gic.c:
    IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
    IRQCHIP_DECLARE(arm11mp_gic, "arm,arm11mp-gic", gic_of_init);
    IRQCHIP_DECLARE(arm1176jzf_dc_gic, "arm,arm1176jzf-devchip-gic", gic_of=
_init);
    IRQCHIP_DECLARE(cortex_a15_gic, "arm,cortex-a15-gic", gic_of_init);
    IRQCHIP_DECLARE(cortex_a9_gic, "arm,cortex-a9-gic", gic_of_init);
    IRQCHIP_DECLARE(cortex_a7_gic, "arm,cortex-a7-gic", gic_of_init);
    IRQCHIP_DECLARE(msm_8660_qgic, "qcom,msm-8660-qgic", gic_of_init);
    IRQCHIP_DECLARE(msm_qgic2, "qcom,msm-qgic2", gic_of_init);
    IRQCHIP_DECLARE(pl390, "arm,pl390", gic_of_init);

Without the "arm,cortex-a9-gic" fallback or an IRQCHIP_DECLARE entry for
"arm,cortex-a5-gic" in drivers/irqchip/irq-gic.c, of_irq_init() will not fi=
nd
a matching driver for the primary interrupt controller on V2P-CA5s.

Also, the commit subject and message only mention Cortex-A15 and
"arm,cortex-a15-gic". Was the change to vexpress-v2p-ca5s.dts unintended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-dt-vexpres=
s-dts-fixes-v1-0-66615c3c8ec3@kernel.org?part=3D6
