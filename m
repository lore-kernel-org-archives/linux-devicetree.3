Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D9D1A5B9E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 06:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405321; cv=none; b=RXB3wquZXJuX+m2SPOCEz9vADrp8RvIxw+tRwnoYupWmLRkh6ZWhDnenQeDiTRDUdzJsl7h77oob4JybwAGlxNLEqinUc8Vsud0iQiXx9gOULbqFjt6ZYk+dg+rDec3yxZkWuhH8WByK93X5Y7Aqkfv6AXF8EPTlUxnqDLqyY4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405321; c=relaxed/simple;
	bh=+zRxKAAtDXdJZzDFXj+Y7Hb+f91YTR3Jn60pgjm5PWY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f71+3ebuO4jQsFEOszgm4JC37A33Vlb3xwp7BX7wHJuF6a0KnWk0JMH7XpDDygy5qcE0VNEltDKD7s8lA0PaASu2m1uUmYJgjBa+YYGR02XxfG6GAedQJUGy3nqtOtK4evyB7hGKtscfxRKLIzZ8LL4zlVIE5BS1/z6qQXeAXK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ga/4eXvE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ga/4eXvE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38CA1F000E9;
	Tue,  7 Jul 2026 06:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783405320;
	bh=lV1sYOcTLLHex0MoYVkw90vIj0KFBxn3dZQk0CeZd14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ga/4eXvERWbwYIkfOKfTM3/HgJYfTJPpYA3wPr2ZeCI0rOZ5VfSyQz2OxaP3r8zpo
	 /zAHco/ykPkD6ixGn/R1VTg2Ip9QjA5jLNMldLrpkTla4feLGOVQ6Nh7VoCGWqBJxk
	 YWJHYb8hv0ZRhgaXOaWSELBJTMD3IyXbVsRGLmPBuj8EiErsailXUeN5YX+QpWMxUt
	 jgHY8ze3I/62ZAl1KsJq9dnIcxSHEFF3fq8zvBnGwlt7/c6L+QJ8gnE9K6y41G8sNJ
	 8+GmFIJLZa4vAF2VkIIgECr4BhBhPn5NTqI/SrQKtEVvAP6A6WDkaHHSFvnmNremdU
	 zVQSku6LzzuzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5210: Add nodes for multiple
 peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-08-dts-v1-1-fce82e14cd1d@oss.qualcomm.com>
References: <20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com>
 <20260707-08-dts-v1-1-fce82e14cd1d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 06:21:59 +0000
Message-Id: <20260707062159.F38CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `gcc` node lacks the mandatory `#interconnect-cells` propert=
y.
- [Low] Missing interconnect binding header leading to build failure.
- [Low] Non-generic device node name `usb3@8a00000`.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: qcom: ipq5210: Add nodes for multipl=
e peripherals ---
commit 56c06e7d589960ad61fe5ba2fab0b467dc066d7b
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals

This commit describes common IPQ5210 SoC peripherals in the base DTSI.
It adds nodes for USB, PCIe, QPIC NAND/BAM, QFPROM, TSENS and thermal
zones, along with the CPU OPP table and CPU cooling cells.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 2cdc10529c489..6c97417e82db6 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -4,7 +4,9 @@
>   */
> =20
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,apss-ipq.h>
>  #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
> +#include <dt-bindings/interconnect/qcom,ipq5210.h>

[Severity: Low]
Does this header exist in the tree? The inclusion of
<dt-bindings/interconnect/qcom,ipq5210.h> seems to cause a build failure
because the file is missing.

[ ... ]

> @@ -146,8 +358,8 @@ gcc: clock-controller@1800000 {
>  			reg =3D <0x0 0x01800000 0x0 0x40000>;
>  			clocks =3D <&xo_board>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
>  				 <0>,
>  				 <0>;
>  			#clock-cells =3D <1>;

[Severity: Medium]
Since the pcie0 and pcie1 nodes specify interconnects pointing to the
gcc node, shouldn't the gcc node have an #interconnect-cells property?

For example, the pcie1 node added later in the patch uses:

			interconnects =3D <&gcc MASTER_CNOC_PCIE1 &gcc SLAVE_CNOC_PCIE1>,
					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;

Without #interconnect-cells in the gcc node, Device Tree parsing might fail
at runtime.

[ ... ]

> +		usb3: usb3@8a00000 {
> +			compatible =3D "qcom,ipq5210-dwc3", "qcom,snps-dwc3";
> +			reg =3D <0x0 0x08a00000 0x0 0x200000>;

[Severity: Low]
Is it possible to use a more generic node name here, like usb@8a00000 inste=
ad
of usb3@8a00000, to align with Devicetree Specification naming conventions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-08-dts-v1-=
0-fce82e14cd1d@oss.qualcomm.com?part=3D1
