Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960706;
	b=ecLAKpiv4hYesCim9p7X5BXMH2Ha8ZC5dGopPYCCdWAPCSDwAGfqAstUWTQHZ3wnSnTp
	 K/gzAHwPeIXAEoB3Oo/rhq8rsoR7X64t84sUA+7RokGrhuTGkUEVMw+prT30wL7YWclgq
	 UyCQPCbx/gDBnZDJ+7uatFQuMPVTbJxRxLm+U8npvepC/316ecjMaI6Nh7ckM96Wo9vmJ
	 nlUG1bVqpWFxtypwi3rPAKC6JW+71Sdr9MwbTs43GNLvstoZt60ld46HmjS2MESse4EV8
	 lNG+ytk2u/WX93cG6bW+8DbvBvrZBr/tOVd2amXjpqj9lp+42pN3wbkLDu3VH39L1og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960706;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FY6FgAAaUYg8qIbckUsNLwsIoQMMJKVPdFD8h3cBzSQ=;
	b=zm+iatPEz2oc6qnkSg9c035FjEADzT2gExVJvDZxaoeP5HsRVFQgeQdYulYH9YOMbO0x
	 8shZoq3MVmc6Fr2qGhu3jd4OFmIoqOg+hPVAHwapyugyzYXByyuWMmbtQ3af7Gdsu/RlF
	 TnybIVhZ08FiAc9rUub7jsMdZvy4bia1TAWA0GXF7o7rQ6qn1/lmDoEL5OwIfos0kZxpp
	 rwSyHsq2TAGFA/VIRP9fBDIQ5aPQdWg8s6frSfotIJi3JPbED+g7C8R6aB6/U4JEOGdUb
	 gWGJh1hKKIsc13wuqy83KoXq06alqFwolU/xMqfQyszexspo5bkGvW6IdUO+oRrRucQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eq9o6PtA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30EC606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eq9o6PtA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6051F0089F;
	Fri,  6 Nov 2026 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793960705;
	bh=FY6FgAAaUYg8qIbckUsNLwsIoQMMJKVPdFD8h3cBzSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eq9o6PtAAYw85QrFnqLNrByGKb5VRFkeMWBKdn8uUZzAC0AewZQFuqm6Xh/dE/Ecl
	 +/WPb3Awzru3xIigLL5Rtu9Yqvqo9hcYh/2qrwG8hETwt0LpHZ5/Fl+MIAaivwgcv8
	 BGqXS8K9qVoNegXMJeYHwYLP/qvVrTQKZ13VvxVz6ESfsmVG97dxkzvHiKB4ldHfTg
	 f4Z+0WQqAFddjH1z1VfL0KUgGACUk35GiEZZV8O12kMGpGwCgy/VkIa45eizpbW+Sy
	 /cbrvQ1SrEc7bPzUMpPYasvGzyuRYOfubYITVMx8tBwS+5Wdub969KZbul7FkBcrbq
	 4eBfL6XXgLb7Q==
Message-ID: <sashiko-outbox-201212@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-08-dts-v8-6-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
 <20261106-08-dts-v8-6-d91401955039@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:25:04 +0000
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
- [High] arm64: dts: qcom: ipq5210: missing qcom,ice phandle on sdhc
  node
- [High] arm64: dts: qcom: ipq5210: 300 MHz ICE OPP table attached to
  sdhc node
- [Low] arm64: dts: qcom: ipq5210: undocumented sdhc_ice compatible in
  DT schema
--

commit bf4c3fadb586445746ef6dd1251be30175cb3e65
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add ICE support to SDHCI

This commit adds the SDHCI Inline Crypto Engine (ICE) node, a 300 MHz OPP
table, and CQE support for the IPQ5210 SDHCI controller, and enables the
ICE node on RDP504.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 6dfc89903d2fc..705d7ed487138 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -151,6 +151,14 @@ opp-1416000000 {
>  		};
>  	};
> =20
> +	sdhc_opp_table_300mhz: opp-table-300mhz {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz =3D /bits/ 64 <300000000>;
> +		};
> +	};
> +
>  	pmu {
>  		compatible =3D "arm,cortex-a53-pmu";
>  		interrupts =3D <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIG=
H)>;
> @@ -432,6 +440,21 @@ sdhc: mmc@7804000 {
>  				      "core",
>  				      "xo";
>  			non-removable;
> +			operating-points-v2 =3D <&sdhc_opp_table_300mhz>;

[Severity: High]
Does attaching sdhc_opp_table_300mhz to sdhc break SDHCI bus clock scaling =
on
GCC_SDCC1_APPS_CLK?

sdhci_msm_probe() binds the sdhc node's OPP table to its "core" clock
(GCC_SDCC1_APPS_CLK), which only supports frequencies from 144 kHz up to
200 MHz in ftbl_gcc_sdcc1_apps_clk_src, whereas 300 MHz is the rate for
GCC_SDCC1_ICE_CORE_CLK on sdhc_ice in ftbl_gcc_sdcc1_ice_core_clk_src.

With a single 300 MHz entry attached to sdhc, every dev_pm_opp_set_rate()
call in msm_set_clock_rate_for_bus_mode() rounds the requested bus rate
(including 400 kHz card initialization and 192 MHz operation) up to 300 MHz,
driving GCC_SDCC1_APPS_CLK at 200 MHz while leaving GCC_SDCC1_ICE_CORE_CLK =
on
sdhc_ice unconfigured.

> +			supports-cqe;
> +
> +			status =3D "disabled";
> +		};

[Severity: High]
Is sdhc missing a qcom,ice =3D <&sdhc_ice> property to link the controller =
to
the standalone ICE node?

Because sdhc has no "ice" register region, sdhci_msm_ice_init() ->
devm_of_qcom_ice_get() -> of_qcom_ice_get() looks up the "qcom,ice" phandle=
 on
the sdhc node.  Without it, of_qcom_ice_get() returns -EOPNOTSUPP and
sdhci_msm_ice_init() disables inline encryption support, while sdhc_ice pro=
bes
on RDP504 and leaves GCC_SDCC1_ICE_CORE_CLK and GCC_SDCC1_AHB_CLK permanent=
ly
enabled with no consumer to suspend them.

> +
> +		sdhc_ice: crypto@7808000 {
> +			compatible =3D "qcom,ipq5210-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg =3D <0x0 0x07808000 0x0 0x2000>;
> +
> +			clocks =3D <&gcc GCC_SDCC1_ICE_CORE_CLK>,
> +				 <&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names =3D "core",
> +				      "iface";
> =20
>  			status =3D "disabled";
>  		};

[Severity: Low]
Does "qcom,ipq5210-inline-crypto-engine" need to be documented in
Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml?

That compatible string is not in the binding's compatible enum, and the sch=
ema
also requires power-domains for compatibles not listed in its exemption lis=
t,
causing dtbs_check failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-08-dts-v8-=
0-d91401955039@oss.qualcomm.com?part=3D6
