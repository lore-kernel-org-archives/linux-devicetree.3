Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E81A4A385A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458038; cv=none; b=WKMQgCO2fPZLWBB2Z/a6axTw62RrHcgIQla/AHowHEIqhmmdxHcLpHvMb3YMhV82zhdRWcnxQbnj3nGWYV8fFGQr3gRyQsFDTBaLUQZXo5WfuRq32IkDrWsOGIGovXqZ4qPMzzWYlJyxFOMBRNCQtA7edNnjeMFb72XsnCOmzy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458038; c=relaxed/simple;
	bh=C3u6THSn+oA7S9D/vln7Cs7WRyrwd9MS3OEC+8FS5wM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TRcZTqCU0K6U8KByt801NWb0kiBMCF5E9yxYsTArMGggqECMRZRPHnbfoK9fiQ2BVa+9mMMGkFPvE6qCUbfUIGLOydzhkn3N/JO1ltDiytncZW3N8YXVTFj/WiaJHe7qcILYqRMPr+Fc6TVbMVLiMEkZvGGdIuOGW0xB9JU7ddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwxIe5Fa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwxIe5Fa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1461F000E9;
	Thu,  3 Sep 2026 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788458037;
	bh=FRwGEmfWAV0QZWn1KCT9Vrav9u4C1zGxJfwvLiKe84I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FwxIe5Fan24a1wBaKb/bqbiOCGNvwkMkZGaJ4fAFaCvGF6iCkM3G1BEscO/xJ6jte
	 hv1mehvG/d43iKpiJbr85MvbwWAXXluR1skK5mQUYjdQh7FKd7uKNmpwtW4vkgcmOo
	 DgFEiWJSXj6uZ/mq9FPUlU22UoJA47Sx5XnlB93zsQNx2+/KOV3WStPznkUT43iZiI
	 s9bg/AC6D0M/MUnoOSItgyWbUSR4PQLZJ7/D0XHqCEAwWBin1Ne7H1FFcWIE00i8JD
	 NLqfM6cjZbuUZ3ijL6A082nptJKsE91sqm2q2iWUCBGVV0M7M6hFKvYWJsRFDuzg0V
	 8qo8vJ/qP2+ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: socfpga: agilex5: replace clocks
 reference with clock-frequency for dw-apb-timer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <6317aa2675ab36ec1dfd881ae7e95d1f3378aed0.1788457041.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788457041.git.adrian.ho.yin.ng@altera.com>
 <6317aa2675ab36ec1dfd881ae7e95d1f3378aed0.1788457041.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 17:53:56 +0000
Message-Id: <20260903175356.BF1461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Replacing 'clocks' with 'clock-frequency' to work around Linux d=
river initialization ordering is a Devicetree anti-pattern.
--

commit bdc3d28e7cc7c5d8502d6fe42848d2feefd3bf47
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

arm64: dts: socfpga: agilex5: replace clocks reference with clock-frequency=
 for dw-apb-timer

This patch replaces the dynamic clock reference for the Agilex5 timers with=
 a
hardcoded clock frequency. This is done to bypass a driver initialization
ordering issue where the clock manager probes later than the timer.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index f54767d1526e1..f5bc37fa85832 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -429,32 +429,28 @@ timer0: timer0@10c03000 {
>  			compatible =3D "snps,dw-apb-timer";
>  			reg =3D <0x10c03000 0x100>;
>  			interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks =3D <&clkmgr AGILEX5_L4_SP_CLK>;
> -			clock-names =3D "timer";
> +			clock-frequency =3D <100000000>;

[Severity: Medium]
Is it appropriate to encode an OS-specific probe-order workaround directly
into the hardware description?

Devicetree is designed to describe hardware topology rather than provide
workarounds for Linux driver initialization sequences. By replacing the clo=
cks
reference to the Agilex5 clock manager with a hardcoded clock-frequency, the
correct physical clock association is lost.

If the bootloader changes the L4_SP clock rate in the future, wouldn't the
hardcoded 100 MHz value lead to incorrect kernel timekeeping since it no lo=
nger
queries the actual clock manager?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788457041.gi=
t.adrian.ho.yin.ng@altera.com?part=3D1
