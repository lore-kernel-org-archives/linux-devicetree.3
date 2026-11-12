Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459474;
	b=vyMR7mQ18B6shMQAUbRmT8D9H7IOASKmzrEwmlI+en1+okW0+zrwjy+I+tfDxTjtJglk
	 tK56L/wkGUdnvKu+5rTKDLHhntOPHlCyRR5SIwMPrHIAHfgjsdudEKUU/E2DXC1I/mFmn
	 P6eIVXJSIbAm2jkNklTyc++7ngU5LOmujJQxhXglrup2CPc6/tt2gPERwdgVoFZ/G+qH+
	 vtWT6lwb9NoSl1QlcZwaEi9VRcRfkbJXLyF8bEBAwu6C3AWxA3JgVRwWUwZ6VG2+eNsdP
	 OgYDZSt8+SLPEAMKkuH4L6pDnFQh95R5kNwzHNyYQmLbyQ264xuPRdvERHbimvor8UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459474;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t9aFDRUNfEnIv0LAN1/Rn9TP+JbR9IGPJLZC8kpkkzs=;
	b=FelWmuTiWKeZjHoqjmXD0aHyTBDMH/Uz8W3+Qj2KC7RCI28kaHWIgROaAmXd+F7VDjDh
	 yEp0101SBPvwpBMobf8SXidvQ4QVKmtAxoZdU8gHk9RZvBaa36cFnGyNW56PfiC7dvl1Y
	 Xnhy3J93ia7tm264bTJfz1fKP5aOp8GDzqQ51x1jNq4f5S2r5WOYR9i0B43pjnoDhG7t4
	 NVwAr1fyCDFutWIupiwkRnis81iHaLOeXJu6Cv4pL9WuMKkmWF4PAplRGHv3DtqHxj0Cd
	 y46lJ/0OBbBxG7G5ht6p1C4A9Jv+MlvuTtRz2aqGzXIceOKZZ9YqjvwZOuL7g6CVyGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWCJAvsY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84783606A331
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWCJAvsY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB581F00A05;
	Thu, 12 Nov 2026 04:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794459474;
	bh=t9aFDRUNfEnIv0LAN1/Rn9TP+JbR9IGPJLZC8kpkkzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HWCJAvsYhBpLP4zDidWl7gJiJN/QdjYW+4TdlzRRsE2V1OBS6zdrPnN/sQlkS239a
	 qowR+NkBbKzUHsn/JMOOOIXlwkxaopqGZbGwGQzI/LpEb9whwDG5M1VWv6Y4ES9UqJ
	 WwNHSEqq6oSi6F7citgKRL8aWhjexMsOufeRgqbYJz10h7myLqR5IwM3pu33kRpgav
	 VGpw2lqSrmFJzWIU2tLHHlrRyhWSspgdFkJ5NPvSWY57gS+jfis1CnRNTTcjUsBqID
	 aG7w7fuEcNOXC4kix9BQKq9fus7WJKdKUir955jwhUtQPLDBzogNNagOYi+Sw3o0Gs
	 3aRPKzTnWyieg==
Message-ID: <sashiko-outbox-210403@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-08-dts-v9-6-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
 <20261112-08-dts-v9-6-c34de4f78fbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:57:53 +0000
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
- [Medium] arm64: dts: qcom: ipq5210: 300 MHz ICE OPP table attached to
  sdhc node
--

commit 26d7894a0ee84572c70f5300978aa25be22d94a5
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add ICE support to SDHCI

This commit adds the SDHCI inline crypto engine (ICE) node, a 300 MHz OPP
table, and CQE support for the IPQ5210 SDHCI controller, and enables ICE on
RDP504.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index f3d688fded802..267255d2980a3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -164,6 +164,14 @@ opp-1416000000 {
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
> @@ -456,7 +464,25 @@ sdhc: mmc@7804000 {
>  			clock-names =3D "iface",
>  				      "core",
>  				      "xo";
> +
> +			qcom,ice =3D <&sdhc_ice>;
> +
>  			non-removable;
> +			operating-points-v2 =3D <&sdhc_opp_table_300mhz>;
> +			supports-cqe;
> +
> +			status =3D "disabled";
> +		};
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

[Severity: Medium]
Is sdhc_opp_table_300mhz attached to the wrong node here?

sdhci_msm_probe() calls devm_pm_opp_set_clkname(&pdev->dev, "core") and
devm_pm_opp_of_add_table(&pdev->dev), which binds operating-points-v2 on
sdhc to sdhc's "core" clock (GCC_SDCC1_APPS_CLK).  In
drivers/clk/qcom/gcc-ipq5210.c, ftbl_gcc_sdcc1_apps_clk_src only supports
rates up to 200 MHz, whereas 300 MHz is the rate in
ftbl_gcc_sdcc1_ice_core_clk_src for GCC_SDCC1_ICE_CORE_CLK on sdhc_ice.

Attaching the 300 MHz OPP table to sdhc gives GCC_SDCC1_APPS_CLK an
unreachable 300 MHz OPP while leaving GCC_SDCC1_ICE_CORE_CLK on sdhc_ice
with no rate configuration (qcom_ice_create() only enables its "core" clock
and does not parse an OPP table).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-08-dts-v9-=
0-c34de4f78fbb@oss.qualcomm.com?part=3D6
