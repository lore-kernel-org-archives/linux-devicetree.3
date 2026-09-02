Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782A5420E8F
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341913; cv=none; b=CQARoSOD4CQAMJ3bEw+2qQ7Z2Q0WnbftOejlN2upX4SReCJzx/Qj5hL9+QsVzQDeRiP8QJO+FdYpoWTn0UauHCO9PzzKWpaIclhZZClL2smn7wEr8xas4cQSfRr5ksN/gQmcjifHtwH7vu/N09gruS0+KdbpvJPXSGa8hGQWwSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341913; c=relaxed/simple;
	bh=hBNAqaKKjKO/RViPyEB4/4yyAuHvZirwBXswvwJDxhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NXe40rC/cLtFvT0iSj8AQgN6BpjSmcbSPMyLOPq5JwpEMuToYGS3M0k8Q7hc4yMImQDDnNQ/jNCB7boOfZUwBpr425r5jLAh1LiQ+9Kwi3BfPiXeaD2GNPe2OwR0CbXw6gGM8myrBB0E1oxa0abCD+97ykkaFq/XueqKopD1lNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wt4tJAjX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wt4tJAjX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14331F000E9;
	Wed,  2 Sep 2026 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341911;
	bh=QhU8tO72hUxdJ4MOhH25mr70/X1tjvJF+xcCgDimJXU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wt4tJAjXDz9g4Z5e1qjWJlitxZKQPPunsFs+Ru+I2YatTwmmfcau9uadlvV7RQe2K
	 J12/Y32X6wfx13+7AJ5B//ZZeSpq7SuhttRA7hjLniE4rJqwTYseuCvf4rUxyRIauy
	 Na58U6anvShn7rjdxdfbnsWh5GPQIPTXVIivojW639eQbry9N2lBV+vswgRNU7Du6B
	 +30iBE/k+w9oRLdBvHz2vPwUxv763RohG2SGp8SZfdUpe+nanSl5i5VW2QfLu02EK0
	 6G7mF6oWLOPTrikJjkyG61OioE37WIlpo6mEEs80+xitsvIZUcoQIpDaMkSH6u+qGA
	 kGD8XRM+3AbYg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/2] arm64: dts: socfpga: agilex5: add support for
 the ECC manager
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260902092551.488203-3-dinguyen@kernel.org>
References: <20260902092551.488203-1-dinguyen@kernel.org>
 <20260902092551.488203-3-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 09:38:31 +0000
Message-Id: <20260902093831.A14331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Bitwise overflow and value truncation when unmasking double-bit =
error (DBE) interrupts.
--

commit a5d17bd160094d90efa7211d9c744f1d3da55629
Author: Dinh Nguyen <dinguyen@kernel.org>
Subject: arm64: dts: socfpga: agilex5: add support for the ECC manager

This commit adds the EDAC device and ECC manager nodes to the base Agilex5
platform. It introduces OCRAM and Ethernet ECC device support to the device
tree.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index b06c6d5d60eed..64e8bffd69df7 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
[ ... ]
> +	eccmgr {
> +		compatible =3D "altr,socfpga-agilex5-ecc-manager",
> +			     "altr,socfpga-a10-ecc-manager";
> +		altr,sysmgr-syscon =3D <&sysmgr>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 95 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names =3D "global_sbe", "global_dbe", "io96b0" , "io96b1",
> +				  "sdm_qspi_sbe", "sdm_qspi_dbe", "sdm_seu";
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +		ranges =3D <0 0 0 0xffffffff>;
> +
> +		ocram-ecc@108cc000 {
> +			compatible =3D "altr,socfpga-a10-ocram-ecc";
> +			reg =3D <0x108cc000 0x100>;
> +			interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>, <33 IRQ_TYPE_LEVEL_HIGH>;
> +		};

[Severity: Medium]
This is a pre-existing issue, but introducing interrupts with values >=3D 32
triggers a bitwise overflow and truncation bug in the altera_edac driver.

When the EDAC driver sets up DBE interrupts, it calls a10_eccmgr_irq_unmask=
()
with hwirq >=3D 32. The BIT(d->hwirq) macro computes 1UL << 33 (and up to 41
for the emac nodes).

drivers/edac/altera_edac.c:a10_eccmgr_irq_unmask() {
    ...
    regmap_write(edac->ecc_mgr_map, A10_SYSMGR_ECC_INTMASK_CLR_OFST,
                 BIT(d->hwirq));
    ...
}

Does this shift result in undefined behavior or truncation? On 64-bit
systems, this yields a 64-bit value which is silently truncated to 0 when
passed to regmap_write()'s 32-bit val parameter. On 32-bit systems, this
shift exceeds the width of unsigned long, typically yielding 0 at runtime.

The masking function a10_eccmgr_irq_mask() shares the exact same bitwise
overflow and truncation issue:

drivers/edac/altera_edac.c:a10_eccmgr_irq_mask() {
    ...
    regmap_write(edac->ecc_mgr_map, A10_SYSMGR_ECC_INTMASK_SET_OFST,
                 BIT(d->hwirq));
    ...
}

While the DBE interrupts may inadvertently remain unmasked because they
share the same hardware mask bit as single-bit errors, the specific
masking logic for DBE appears to fail because the computed mask evaluates
to 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902092551.4882=
03-1-dinguyen@kernel.org?part=3D2
