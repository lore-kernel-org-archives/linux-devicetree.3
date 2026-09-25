Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D14043C051
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317728; cv=none; b=B6fzSBnOPNhmTV20r0m6LjH5viVM/9IkqWAK0lzOA2Y3yBR1zRJcmyZSnABY1AAIj8VvBInXBE5yzwnN+VrWOA1xGIfKQtxuafH3jtjUNEozigv2UiXzZls5yinNQixahiGLBOOaefAF7vgPsgMk8JN+mWcG81mPWk/+K/T8SCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317728; c=relaxed/simple;
	bh=Ez2Xvr5rnj2NGtp+nLhWx0wQ2yyKI25hr9vlO8bu5ic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wf3OzwAvum1bngT2OEqqo4IOXHD/qlhXo+G68/K0Lea51U/bhlzpNEKB0zTm/fGW+dfiJSljkKsUasVBXnGeaRKec1r2OOJhuJYAr+fqHBco2ndne8FDQgiPSkhHWq1SaYD7Ygy+6htVtg9pyfOBWCujdosMamViLX2oMXIv7do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHjUAfAS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHjUAfAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7771F00893;
	Fri, 25 Sep 2026 06:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790317725;
	bh=G9IecVjniLrh8UCXrREXL/y28U3auIyM9cVRw//YQ0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FHjUAfAS9d/wKywJMRESCmIiKJjVfsJFuOGLW8DAjylU9JDgTwmxSFI9xUVY0ik85
	 AAAzR90FLJmjvOm/Xt9hfaATtiOEt1kwtT+/PN1kVOSLz93qHVkzTDFlyfcOtlpeWv
	 7pCFBOCU+ybk6f54VQ8FO7snb8bpqsu5/qpI+DnIYZmI4/M7dINY2bpTq76imRvniA
	 nqyRLJg92TSmmdYAkh4gRkqGVewi3yzKGOK+3l0ZmP3p6KCP4LnWZ9iVJAH/CRqSzP
	 piERAGZX4F25haX8nbHsLVUSF/IK9IBfyIqfjkGBV24Im3p5F0FVgpz/8iBQK9duX5
	 tHSQ8aTARPSkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: r9a08g046: Enable TSU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260925061617.127349-8-biju.das.jz@bp.renesas.com>
References: <20260925061617.127349-1-biju.das.jz@bp.renesas.com>
 <20260925061617.127349-8-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 06:28:44 +0000
Message-Id: <20260925062844.9E7771F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: r9a08g046: io-channels uses logical array index instead of =
hw channel id
--

commit d469fb6214e936db705b38d76e1e6de3a390e861
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Enable TSU

This commit adds cooling cells to the CPU nodes and describes the ADC1 and
TSU nodes. It sets up a CPU thermal zone using passive and critical trip
points for thermal mitigation.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index c63a857f0e5b0..a2f6718c0043a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
[ ... ]
> @@ -270,6 +274,37 @@ scif5: serial@1004e000 {
>  			status =3D "disabled";
>  		};
> =20
> +		adc1: adc@108c0000 {
> +			compatible =3D "renesas,r9a08g046-adc1";
> +			reg =3D <0 0x108c0000 0 0x10000>;
> +			interrupts =3D <GIC_SPI 378 IRQ_TYPE_EDGE_RISING>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_ADC1_ADCLK>,
> +				 <&cpg CPG_MOD R9A08G046_ADC1_PCLK>;
> +			clock-names =3D "adclk", "pclk";
> +			resets =3D <&cpg R9A08G046_ADC1_PRESETN>,
> +				 <&cpg R9A08G046_ADC1_ADRST_N>;
> +			reset-names =3D "presetn", "adrst-n";
> +			power-domains =3D <&cpg>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			#io-channel-cells =3D <1>;
> +
> +			channel@8 {
> +				reg =3D <8>;
> +			};
> +		};
> +
> +		tsu: thermal@108d0000 {
> +			compatible =3D "renesas,r9a08g046-tsu";
> +			reg =3D <0 0x108d0000 0 0x10000>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_TSU_PCLK>;
> +			resets =3D <&cpg R9A08G046_TSU_PRESETN>;
> +			power-domains =3D <&cpg>;
> +			#thermal-sensor-cells =3D <0>;
> +			io-channels =3D <&adc1 0>;

[Severity: Medium]
Does this io-channels assignment in the tsu node incorrectly use a logical
array index instead of the hardware channel ID?

The renesas,r9a08g046-adc1 ADC provides a temperature channel at hardware
index 8 (channel@8), but this configuration uses index 0. Because the
rzg2l_adc driver lacks a custom .fwnode_xlate callback, the IIO core falls
back to __fwnode_iio_simple_xlate(). This fallback bounds-checks the
requested channel against the allocated array length (which is 1 here),
meaning the correct hardware ID <&adc1 8> would fail with -EINVAL.

Using <&adc1 0> works around this driver limitation by matching the 0th
element, but it leaks the Linux kernel internal array layout into the
hardware description. If another channel is ever added to the device tree
in arch/arm64/boot/dts/renesas/r9a08g046.dtsi, the array indices will shift
and <&adc1 0> could silently bind the TSU to the wrong ADC channel.

> +			io-channel-names =3D "tsu";
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925061617.1273=
49-1-biju.das.jz@bp.renesas.com?part=3D7
