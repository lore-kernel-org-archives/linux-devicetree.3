Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793393351;
	b=PzsKmWhZqO4RzwKrTk+rSBZZUVPDEzbMTmCP5JonsXafB2BghrkrbT6NfLdflE+QETVI
	 isXnQpAEccXL5Qoeq+58bxZaaiqb3puJ5/6Bi1nsrKlEKw78O3vp5WurcD1tSbxhTeph7
	 EEJm+ES5LMs3K1IWFb9o8WGamWqmYMrGR1Tycm+75AISWgesDQSbgjb/n0MnPI6qZ2qmQ
	 6lIjMmIf13q930dilDZpBJsUw1G3Tl+7aU9sv4YtiYoJx93sBGlJwUoNIPOqS9X6+86uk
	 xNo23aysMGeGqMEA/VlYgp3ta2sVw/PtVsYAV1nPhAepvU8gZbaf8B2un8ODRbVecFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793393351;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Typ51Uy4Qhhy5vRfg7dOPnWpRdak1pUu8/q9JDm/j9k=;
	b=LlhOjs2wQiVvel2tyhoNs3ShoN9V8Vk8Jw78x1dj8EQOVN1mEK0BXo5739ZbvT1qyUIg
	 rsAp0Psent1xU0HsmCTtxGvZ/VjttigtUzEUJmkgVE8GS3njis5fpl62iEIuGGVVcB0w7
	 yF0lIsV9CI+9xE3jKorTryO/nwa83gnMvCk8bZKcqwzo63gbaxgzywRNlF+DHdicw4kTY
	 q5vd9RjclHnADp5/TGgHK8eSPwFFnbAxp6Dp7vBDUO4LA/m+yLfGm7fswRHnxQECexp9L
	 KqJf16yLDA60AH7AHiOL7WcJ6C2YI96ZeX9/LQFNsnbrymD3QCw+1ejN/iauItzIUFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i/ioKswQ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD18606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 20:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i/ioKswQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59D31F000C1;
	Fri, 30 Oct 2026 20:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793393351;
	bh=Typ51Uy4Qhhy5vRfg7dOPnWpRdak1pUu8/q9JDm/j9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i/ioKswQ8CflomoesKf8p+hjYXiZBilUDS0Os2Zjiyxlny3M25uoLm1akNq87r0SQ
	 POyCOIp8RTGXhRVclNtXOS81saNQK2IIh7NbpDDNMZNM8EzPh7ntoTI4IKR5bno5Dh
	 FC58tBNL548Of1bth+uHqW5iWXT65j85TEHvQcvhTwvplM15SBSiwEYePxoeEJYk3i
	 Kj5KqVXZcVJOrr3SN4k2ovSLpeR7+V4oBuQvb7hliuLzmZcga2TE9JIa4+4Kl398jM
	 Zgd+puCQDe354HAVGQUU72oaSgDJY6HCiWHaqhL71Rc4frwftHdLwDH9KCs4ZQxGxC
	 ENGhT+0SuKZJA==
Message-ID: <sashiko-outbox-191496@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: exynos: Add initial support for
 Exynos5515 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-for-next-lucky7-v3-4-81e02272ce69@member.fsf.org>
References: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
 <20261030-for-next-lucky7-v3-4-81e02272ce69@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 20:49:10 +0000
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
- [Medium] clk: samsung: exynos5515: CMU_PERI user muxes bypass CMU_TOP dou=
t/gout clocks
--

commit e9647c95dd003e1cc5e14508ac851bb3fa7a249e
Author: Aiden Isik <aidenisik@member.fsf.org>

arm64: dts: exynos: Add initial support for Exynos5515 SoC

This commit adds the initial device tree source for the Samsung Exynos 5515
SoC, including the Cortex-A55 CPUs, ChipID, generic timer, GIC, and the
CMU_TOP, CMU_PERI, and CMU_FSYS clock management units.

> diff --git a/arch/arm64/boot/dts/exynos/exynos5515.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5515.dtsi
> new file mode 100644
> index 0000000000000..ea70a45bfa50b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos5515.dtsi
> @@ -0,0 +1,178 @@

[ ... ]

> +		sysreg_peri: syscon@10020000 {
> +			compatible =3D "samsung,exynos5515-peri-sysreg", "syscon";
> +			reg =3D <0x10020000 0x10000>;
> +			clocks =3D <&cmu_peri CLK_GOUT_PERI_SYSREG_PCLK>;
> +		};
> +
> +		cmu_peri: clock-controller@10030000 {
> +			compatible =3D "samsung,exynos5515-cmu-peri";
> +			reg =3D <0x10030000 0x10000>;
> +			#clock-cells =3D <1>;
> +			clocks =3D <&oscclk>,
> +				 <&cmu_top CLK_DOUT_CMU_PERI_BUS>,
> +				 <&cmu_top CLK_DOUT_CMU_PERI_IP>,
> +				 <&cmu_top CLK_DOUT_CMU_PERI_UART>;
> +			clock-names =3D "oscclk",
> +				      "bus",
> +				      "ip",
> +				      "uart";
> +			samsung,sysreg =3D <&sysreg_peri>;
> +		};

[Severity: Medium]
When cmu_peri is instantiated here with CLK_DOUT_CMU_PERI_BUS,
CLK_DOUT_CMU_PERI_IP, and CLK_DOUT_CMU_PERI_UART from cmu_top, will the
CMU_PERI user muxes in drivers/clk/samsung/clk-exynos5515.c bypass those
dividers and gates?

In drivers/clk/samsung/clk-exynos5515.c, CMU_TOP defines the clock chains
mout_cmu_peri_{bus,ip,uart} -> gout_cmu_peri_{bus,ip,uart} ->
dout_cmu_peri_{bus,ip,uart}, and CMU_FSYS connects its user muxes to
dout_cmu_fsys_*:

drivers/clk/samsung/clk-exynos5515.c:
    PNAME(mout_pll_fsys_bus_user_p)         =3D { "oscclk",
                                                "dout_cmu_fsys_bus" };

However, the CMU_PERI user mux parent arrays reference mout_cmu_peri_*
instead of dout_cmu_peri_*:

drivers/clk/samsung/clk-exynos5515.c:
    PNAME(mout_pll_peri_bus_user_p)         =3D { "oscclk",
                                                "mout_cmu_peri_bus" };

    PNAME(mout_pll_peri_ip_user_p)          =3D { "oscclk",
                                                "mout_cmu_peri_ip" };
    ...
    PNAME(mout_pll_peri_uart_user_p)        =3D { "oscclk",
                                                "mout_cmu_peri_uart" };

Because exynos5515_cmu_peri_init() -> exynos_arm64_register_cmu() ->
samsung_cmu_register_one() -> samsung_clk_register_mux() resolves parents by
these global clock name strings rather than the DT clocks property,
instantiating cmu_peri causes mout_pll_peri_{bus,ip,uart}_user and all
downstream CMU_PERI clocks (such as CLK_GOUT_PERI_SYSREG_PCLK) to attach
directly to mout_cmu_peri_*, bypassing gout_cmu_peri_* and dout_cmu_peri_*.

Should mout_pll_peri_{bus,ip,uart}_user_p in
drivers/clk/samsung/clk-exynos5515.c use dout_cmu_peri_{bus,ip,uart} to mat=
ch
the clocks passed in the cmu_peri DT node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-for-next-l=
ucky7-v3-0-81e02272ce69@member.fsf.org?part=3D4
