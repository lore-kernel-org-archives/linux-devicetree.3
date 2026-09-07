Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F077413796
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766797; cv=none; b=cDw7liEAlbmoDZjS31tVbuDBHSYM6eRtrhG02dz6JFwflui3Okrn+lYk3fXm0kXEnAyAD16Xgryh5UkT1RB9Z4K5dDV9mDToAsG2276eDEn0uzj/D2GDHb7BN/Nkhd0Rp66JJmC2PGfVadFQAAVxVSHeLi7UYCxt1tks56x+tAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766797; c=relaxed/simple;
	bh=ru1ZFuqDkbcn/gK4KCubqWUh50QI2XLEkfPyScuSWz0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r7Q1yeQCYw4F+37shUf4BXXCH6i0UTr0D9vKYNSm6pH4JvjzaM65/l80wdvdYtRYiugPdAoSPP92ejSNpcnfSeGd/9StLfc01UBfRk2+5qcl1lkI8yBgnUk0qiW7wK4w7ln/PLvczoQ9vpsjaIlaxwQE6Us6MA02bDXinLOX1Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeNTGrpK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeNTGrpK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A271F00A3A;
	Mon,  7 Sep 2026 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788766795;
	bh=+PdPWE7wu5gjtPD2XrWXHkN8XNhDvE8B6sUVC14sMAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MeNTGrpKH0zYx7jEHwPNhoD9yQpOLCjREAzn2SKYL8bXt0nTNlFJZ53Co3VqLEVzE
	 BGzJ+f51ZvilcOXxoWH9Rw427VK14n/lZIgDiXjrF533Ge+UbCrNvx/2Sszc59+JQd
	 rB/+b0HZ+CTD3KVYRSjOdKRa4KxxGBz3cJCfpedtCu7OS0MWsvGi0mlOMo9cxm0Afk
	 bdlgRkgbjxmm11ySneuzVwsJAUGWDappDNJCnUGMzmnFJIRX6dcPso1qEs+9Q5txmS
	 LRQ3JJn9gmOHkywLaGLdUAfFPBFoki733gv7hVsfL2Sn6VGTL0reulCtkZNPP9/9sc
	 7zpwuZegyP4dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: ipq5210: Add nodes for
 multiple peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-08-dts-v5-1-584e5ab50b40@oss.qualcomm.com>
References: <20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com>
 <20260907-08-dts-v5-1-584e5ab50b40@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 07:39:55 +0000
Message-Id: <20260907073955.93A271F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] PCIe interconnects are mapped backwards, swapping CNOC and SNOC.
- [High] The GCC (Global Clock Controller) node misses the linkage to the U=
SB3 PHY pipe clock, hardcoding it to <0> instead of using the newly added s=
sphy_0 node.
--

commit 0bc8b6a2ddf853ed819f7ab663b2d660520bbccc
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals

This commit describes common IPQ5210 SoC peripherals in the base DTSI. It
adds nodes for USB, PCIe, QPIC NAND/BAM, QFPROM, TSENS, and thermal zones,
along with the CPU OPP table and CPU cooling cells.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 2cdc10529c489..2e6f99d894aba 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
[ ... ]
> @@ -146,8 +359,8 @@ gcc: clock-controller@1800000 {
>  			reg =3D <0x0 0x01800000 0x0 0x40000>;
>  			clocks =3D <&xo_board>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
>  				 <0>,
>  				 <0>;

[Severity: High]
Is the 5th element (index 4) supposed to remain <0> here instead of linking=
 to
<&ssphy_0>?

The qcom,ipq5210-gcc clock controller expects the USB3 PHY pipe clock at in=
dex
4. Since this patch adds the ssphy_0 node which provides the "usb0_pipe_clk=
",
leaving this unlinked could leave the USB3 pipe clock as an orphan, breaking
USB3 SuperSpeed functionality.

[ ... ]
> +		pcie1: pcie@50000000 {
[ ... ]
> +			interconnects =3D <&gcc MASTER_CNOC_PCIE1 &gcc SLAVE_CNOC_PCIE1>,
> +					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
> +			interconnect-names =3D "pcie-mem", "cpu-pcie";

[Severity: High]
Are these interconnect mappings inverted?

The "pcie-mem" name (which corresponds to DMA traffic) maps to the first en=
try
(MASTER_CNOC_PCIE1), while "cpu-pcie" (CPU configuration traffic) maps to t=
he
second entry (MASTER_SNOC_PCIE1).

This seems to incorrectly map high-bandwidth DMA traffic to the low-speed
Configuration NOC (CNOC), and low-bandwidth CPU config traffic to the
high-speed System NOC (SNOC). Will this lead to incorrect bus speeds being
set and DMA bandwidth starvation?

[ ... ]
> +		pcie0: pcie@70000000 {
[ ... ]
> +			interconnects =3D <&gcc MASTER_CNOC_PCIE0 &gcc SLAVE_CNOC_PCIE0>,
> +					<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
> +			interconnect-names =3D "pcie-mem", "cpu-pcie";

[Severity: High]
This appears to duplicate the reversed interconnect mapping seen in pcie1,
mapping "pcie-mem" to CNOC and "cpu-pcie" to SNOC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-08-dts-v5-=
0-584e5ab50b40@oss.qualcomm.com?part=3D1
