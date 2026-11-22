Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795383129;
	b=1/g22ynOPxtTRvu3pVBFPkhCj5NQaxtq7UNOiNq44d2if1ZdEyRzvY5745nUEALhccqO
	 6jfhadY7QzXdLlt4E1Cn0qU0lcCCA8SqDfiBul2fZzcIBVl8IwSyYE9SqQYxLn02PSmVr
	 7kM43mes7dFJ2ev32r9QkUQctiow+csMPSUgKQ8jKdkRDU1UuHgYqU2SFH49tKXlRJuwT
	 xrTLO0KyDABjgybvHerVuHF57FMFUyHlGSY/59r5AV26jc2EkbgfQzmzkhaFD36TOpPEz
	 O73TAluguDnN4hKAR1fytAy53xTdI3TuPYv8hKEc1bq0ByXhP2pgRMaCex5iO7H9qQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383129;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t8jzp+O+1tTXSegBiANij8lOfrZfHOzBN5iwtxvu7xI=;
	b=dXFVN/YZDAlNNAyW8UQwImG6jF/GduWyuUSdf8hcl6MvSWy6mJ6YAijyoj7MBgQUOUQn
	 BWNVPzDuuSdI7ZOR7By+ud7fg9LjydmMDHykpIcQddQqkIMjT6q0MNoBRbDHHnnPSggJK
	 JAN3KxhOuU6TXadUlDy7EbaZIqEWlL+4czaqr1iBGFwT14BcBTfZF5yElMJ2VxFI2YZU1
	 oAX+ZRM5uGEIduc4wMjXaSxKp0IwPSXsyFE0hQy1mR0HN+YqG5oG55/01+j/ZGaYVG7i0
	 egIWMhR3HXQuhYiBWGUeAvDb8Laa9RaIfLZQkTZP1KryNxlHGSu86TOzcHxeMLuYbfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQShpZac;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422B1606A31D
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 21:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQShpZac
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C111F000C6;
	Sun, 22 Nov 2026 21:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795383129;
	bh=t8jzp+O+1tTXSegBiANij8lOfrZfHOzBN5iwtxvu7xI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UQShpZacK/qr95cnyb/V7rFAX2W5UkGTNBXcEyc1TtHQPZsD0QVpwsJliyUcxV/Fc
	 /CvDjOtv1scSrKV2A/xvE9dkIcQCWz8qbb296xcPGVuQsRxfILU6N4bWqDlYqaMhOu
	 sGGhXKkIadGWQCgtM7EDHqrQ/03uJj8C6G1hiUtPmyllhln07vmffyy4PXLWfLNTLc
	 0PvdhMO1328iChfn2bpPy9U+Bl0WV3gcpb9YBoWY1K45Dvbr1pKJALb+HHD/TMdWHR
	 qiK9mqUjHHRIdn2heAIuCxX9VABvNPAM6m9z5zV2Y4GYxf3slylA0GTTH/gkUlhban
	 zQwonmh8nHzNQ==
Message-ID: <sashiko-outbox-228358@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lucas Tanure" <tanure@linux.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261121213102.143130-4-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
 <20261121213102.143130-4-tanure@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 21:32:08 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] arm64: dts: amlogic: t7: ethmac uses unmatched compatible
  amlogic,t7-dwmac
- [High] arm64: dts: amlogic: t7: ethmac pipeline clock is never claimed
  by driver
- [Medium] arm64: dts: amlogic: t7: undocumented ethmac compatible and
  clocks in binding
--

commit 4e3c40142c3d0de22878c5872271d7ab4185032f
Author: Lucas Tanure <tanure@linux.com>

arm64: dts: amlogic: t7: add the ethernet controller

This commit adds the Devicetree nodes for the Amlogic T7 Ethernet MAC, its
MDIO bus, and the MDIO multiplexer with the internal 100M PHY.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boo=
t/dts/amlogic/amlogic-t7.dtsi
> index 7bd53ec166071..eb7f46c98b0b4 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
>  			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HI=
GH)>;
>  		};
> =20
> +		ethmac: ethernet@fdc00000 {
> +			compatible =3D "amlogic,t7-dwmac", "snps,dwmac-5.10a";
> +			reg =3D <0x0 0xfdc00000 0x0 0x10000>,
> +			      <0x0 0xfe024000 0x0 0x8>;

[Severity: High]
Can any platform driver bind to ethmac with this compatible list?

meson8b_dwmac_match[] in drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
has no entry for amlogic,t7-dwmac, and ethmac does not list a fallback
compatible such as amlogic,meson-g12a-dwmac.  No platform driver matches
snps,dwmac-5.10a directly either (it is only checked in
stmmac_probe_config_dt() after a glue driver has already bound), so
ethmac never probes when enabled by a board.

> +			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "macirq";
> +			clocks =3D <&clkc_periphs CLKID_SYS_ETH>,
> +				 <&scmi_clk CLKID_FCLK_DIV2>,
> +				 <&mpll CLKID_MPLL2>,
> +				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
> +				 <&clkc_periphs CLKID_SYS_ETHPHY>;
> +			clock-names =3D "stmmaceth", "clkin0", "clkin1", "pipeline",
> +				      "pclk";

[Severity: High]
Does any driver actually claim and enable the "pipeline" clock
(CLKID_SYS_AMPIPE_ETH)?

Neither meson8b_dwmac_probe() (which only requests "timing-adjustment",
"clkin0", and "clkin1") nor stmmac_probe_config_dt() (which only requests
"stmmaceth", "pclk", and "ptp_ref") acquires a clock named "pipeline".
Because t7_sys_ampipe_eth in drivers/clk/meson/t7-peripherals.c is defined
with flags =3D 0, CLKID_SYS_AMPIPE_ETH remains unclaimed and is gated off by
clk_disable_unused(), breaking Ethernet DMA access to memory.

[Severity: Medium]
Are the new compatible strings and clocks documented in
Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml?

The binding schema does not allow amlogic,t7-dwmac or snps,dwmac-5.10a in
compatible, and its clocks and clock-names properties only allow up to four
entries (stmmaceth, clkin0, clkin1, and timing-adjustment) without
"pipeline" or "pclk", causing dtbs_check validation to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121213102.1431=
30-1-tanure@linux.com?part=3D3
