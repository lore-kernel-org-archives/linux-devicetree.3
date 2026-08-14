Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F823EDE68
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691672; cv=none; b=nhoCTQMtbPCMJnQcUgcoO7TC6juMJSYPJVkIQJIAhAEFxnmQtm+0FiX4i+OhFApQIDUtiO9m59c/TmEPIhD6UlsaCmivp2w0QXzcTn3Z/uTx/vv+atzq9K5vZY8qmQbuuWZtcfzf8jXnKCFBF01yEUnhz3fY14AoUITSs+rv0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691672; c=relaxed/simple;
	bh=Zan0XVs1zUvspbph2jdChopwri0PiSn3SCV+2iMH3js=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R3SQ2s/dj6mnq6qh2GLxU8J0b1yj8G6kQtC7s/vN14mRNfjnlatedspOmp6l0nH+WuFj46d5zypIQUmQqJ/L/JUI1FG+KmdSh8X+u5NMZ3Lq39tEh8HuvD1IcutB+5OXDWIHtqVqIPtGReJXNmOzDmifkfcO1WBPDsIRlN/j2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWXVY6rv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWXVY6rv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D0F1F000E9;
	Fri, 14 Aug 2026 07:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786691669;
	bh=9u8qt8G7iy9o/dUZGz/zazvAGfGw2W0wwOVnR4qHx84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QWXVY6rvth16mW9zpUB7tS0R61ARPrH5OqrO7RSgzl8ZoaBWcnt7D3Nc1FLxFgCSd
	 DH5lS14feWX8GTiKnhsntI1XY4bwg6M7X80FvmlHcx0urKrk0LXi4GlCRNuMI2OxzU
	 kUit9Y1AzuYxPSLkabpIKpbSAjoKnke3bFhDW7rQlFMgmGo7ZsnM7RDlRNJpDDW8tq
	 2/g5q+krGmbgLX9mtXnqDIjcPwMavSedRHK09HrTKfpKTAX4n2hOXiQ0i9rFjtBV29
	 gYeb1JhZIdjIQ5SvpCjQBDKMoZCE8X/GUhfGqPX4rS1a9LQAQfrRxJnLnWB78CzYQ+
	 DWD0g0LAiXLmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] riscv: dts: eswin: add watchdog support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260814070007.1662455-8-pinkesh.vaghela@einfochips.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-8-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:14:28 +0000
Message-Id: <20260814071429.62D0F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The watchdog device tree nodes map the APB bus clock to the watchd=
og timer reference clock, ignoring the dedicated Watchdog Reference clock.
--

--- Patch [7]: [PATCH v4 7/7] riscv: dts: eswin: add watchdog support ---
commit 8bb5be57363c57f6d3977083d5441f186e416e96
Author: Pritesh Patel <pritesh.patel@einfochips.com>

riscv: dts: eswin: add watchdog support

Add watchdog node for ESWIN EIC7700 SoC and enable them for HiFive
Premier P550 board

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index c13432d145042..f873e9eeb9290 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -265,6 +265,46 @@ syscon: syscon@50440000 {
>  			};
>  		};
> =20
> +		wdt0: watchdog@50800000 {
> +			compatible =3D "snps,dw-wdt";
> +			reg =3D <0x0 0x50800000 0x0 0x4000>;
> +			interrupts =3D <87>;
> +			clocks =3D <&clk EIC7700_CLK_GATE_LSP_WDT0_PCLK>;
> +			clock-names =3D "tclk";

[Severity: High]
Is this node missing the dedicated watchdog reference clock?

The DesignWare APB Watchdog driver uses the frequency of tclk to calculate
watchdog timeout durations. Because only the APB bus clock
(EIC7700_CLK_GATE_LSP_WDT0_PCLK) is provided here, it appears the driver
will use the higher frequency of the APB clock for timeout calculations,
resulting in incorrectly calculated timeout values.

Additionally, if the dedicated watchdog reference clock
(EIC7700_CLK_GATE_NOC_WDREF) is omitted from the device tree entirely,
will the clock subsystem consider it unused and automatically disable it
during late boot?=20

If the hardware is synthesized in asynchronous dual-clock mode, stopping the
reference clock might silently prevent the watchdog hardware from counting
altogether.

Should both the timer reference clock and the APB interface clock be
provided in the clocks list?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814070007.1662=
455-1-pinkesh.vaghela@einfochips.com?part=3D7
