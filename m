Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6043C1412
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147288; cv=none; b=OvRaP9mbekGiwJv+iggIcXTHV02Cbnem6ElX0YcF9Ju5VAltHJaoJ7C5OKzSm9pBTJ2qTSZsC+eYOXYml5h0jBjWFtRlk9I92oSVGrQz76zIyzqO5TJV/+vFdPe2yX4SQVZkgrk4VkX3CBlarNrQz/Vr7Pn6IMiKuc0acnLjT4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147288; c=relaxed/simple;
	bh=pSwEgzQQ0lOgWtoTAXe8ZaoIjVKXXl/Ntq2e4DmsgmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QQ07ff6cV8BZXk8nQvM2gR4+qjg8WNh+bHV3blAphG9NUDyXPJQOeIEAiPbLyGWIPeHpONgaVU+Tl3J23VCgbcIhjQSmOzkORr2rNQb80YwtKzQUt9s0+HKU9B8Sjyab7T00L110JkeYmOuN36yzThcOi7FGu6G7pGuon8A6PZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C49CpAlJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C49CpAlJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BFE1F00A3A;
	Mon, 27 Jul 2026 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147286;
	bh=WcHoWj5fHJE4t7xz+rjiQpYJ+/a3yQO4f9809/ChVD8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C49CpAlJuiXKwII/V7iXBMgUdfwEHWTfaWsjHqAeUu3OR/g+X8TBXk1BUwM2GNg8j
	 YaiJxa65TCXpoHMwEXufjFneqe8eJ3cBja9lo5eibvopHelQXBrDiI2vC3tx4tXecz
	 +02vm1uZnJNGfXqxbXSJLXNHHDHMyzGb9BJVC4sUITogtEgMlxRqnRn7wGvmCAggEU
	 MzASxErNdX7b4MlJaZuUAkMK8+P/5PcL+jMgLkevJ/GvuGU+YFl89PpvZroJJne8Ve
	 RDBFECh13XbdFi1+/9+aHkkZxzHEH7OWwItclQz4D5o10q9iEKAn1XEfCUM2gzqwmn
	 UBQGyQ0L0uL3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727094726.890179-3-inochiama@gmail.com>
References: <20260727094726.890179-1-inochiama@gmail.com>
 <20260727094726.890179-3-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 10:14:45 +0000
Message-Id: <20260727101446.57BFE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The PCIe host controller nodes lack the required 'interrupts' prop=
erty for native host controller events and legacy INTx IRQ routing properti=
es.
- [High] Incorrect device tree mapping for PCI I/O address ranges.
- [High] Hardware lane configuration mismatch in pcie0_rc specifies 4 lanes=
 but only provisions 2 PHYs.
- [Medium] The 'spacemit,k3-pcie' compatible string is undocumented and its=
 nodes violate established schema constraints.
- [Medium] Inconsistent property placement for 'bus-range' between host con=
trollers.
--

--- Patch [2]: [PATCH v2 2/2] riscv: dts: spacemit: k3: Add PCIe device nod=
e ---
commit 6adf11d50db9bcfba7141ad15e1666cad3b96e91
Author: Inochi Amaoto <inochiama@gmail.com>

riscv: dts: spacemit: k3: Add PCIe device node

This commit adds PCIe device nodes for the Spacemit K3 SoC. It includes
pinctrl configurations and board-level properties for the Pico-ITX board.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/bo=
ot/dts/spacemit/k3-pico-itx.dts
> index 2a6d35a64d5ce..1eb5abbc61f97 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
[ ... ]
> @@ -205,6 +205,44 @@ phy0: phy@1 {
>  	};
>  };
> =20
> +&pcie0_rc {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie0_0_cfg>;
> +	num-lanes =3D <4>;
> +	status =3D "okay";
> +
> +	pcie@0 {
> +		vpcie3v3-supply =3D <&reg_aux_vcc3v3>;
> +		phys =3D <&combophy 0 PHY_TYPE_PCIE>,
> +		       <&combophy 1 PHY_TYPE_PCIE>;

[Severity: High]
Does this lane configuration match the provisioned PHYs? This controller
specifies 4 lanes via num-lanes, but only 2 PHYs are provided here. Could
this cause link training failures or PHY framework errors if the driver exp=
ects
4 PHYs, especially given lanes 2 and 3 are assigned to pcie2_rc elsewhere?

[Severity: Medium]
Since the phys array contains multiple items, shouldn't there be a
corresponding phy-names array? Omitting it violates standard constraints
for unnamed PHYs in port nodes.

> +	};
> +};
[ ... ]
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index 7863ab7dd308c..314dea88b4a4a 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
[ ... ]
> @@ -439,6 +439,201 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
> =20
> +		pcie0_rc: pcie@80000000 {
> +			compatible =3D "spacemit,k3-pcie";

[Severity: Medium]
Is this compatible string documented? I couldn't find a device tree binding
schema for spacemit,k3-pcie.

[Severity: High]
Are there missing interrupt properties here? The host controller lacks an
interrupts property for native host controller events like AER, PME, or
link state changes.

Furthermore, is legacy INTx routing supported? Omitting #interrupt-cells,
interrupt-map, and interrupt-map-mask will prevent the PCI subsystem from
routing INTA/B/C/D interrupts for downstream devices.

> +			reg =3D <0x0 0x80000000 0x0 0x00001000>,
> +			      <0x0 0x80300000 0x0 0x00003f20>,
> +			      <0x11 0x00000000 0x0 0x00010000>,
> +			      <0x0 0x82900000 0x0 0x00001000>,
> +			      <0x0 0x80100000 0x0 0x00001000>;
> +			reg-names =3D "dbi", "atu", "config", "link", "dbi2";

[Severity: Medium]
Will this pass dt_binding_check validation? The node introduces a fifth
register region named dbi2, which exceeds the typical 4-item limit seen
in similar bindings like spacemit,k1-pcie-host.yaml.

> +			device_type =3D "pci";
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			clocks =3D <&syscon_apmu CLK_APMU_PCIE_PORTA_DBI>,
> +				 <&syscon_apmu CLK_APMU_PCIE_PORTA_MSTE>,
> +				 <&syscon_apmu CLK_APMU_PCIE_PORTA_SLV>;
> +			clock-names =3D "dbi", "mstr", "slv";
> +			msi-parent =3D <&simsic>;
> +			ranges =3D <0x01000000 0x00 0x00010000 0x11 0x00010000 0x0 0x00100000=
>,

[Severity: High]
Does this map the I/O window correctly? Mapping the I/O window to start at
a PCI address of 0x00010000 skips the critical first 64KB.

Will this prevent the PCI subsystem from assigning valid I/O BARs for legacy
PCIe cards that expect 16-bit I/O space starting at 0x0000? I notice that
pcie2_rc correctly starts its mapping at 0x00000000.

> +				 <0x02000000 0x0 0x00110000 0x11 0x00110000 0x0 0x7fef0000>,
> +				 <0x43000000 0x18 0x00000000 0x18 0x00000000 0x1 0x00000000>;
[ ... ]
> +		pcie3_rc: pcie@80c00000 {
[ ... ]
> +			linux,pci-domain =3D <3>;
> +			bus-range =3D <0x00 0xff>;

[Severity: Medium]
Is the placement of the bus-range property correct here? For the other host
controllers, bus-range is located in the child port node (pcie@0).

Placing it in the parent node instead might cause subsystem enumeration iss=
ues
for this bridge.

> +			max-link-speed =3D <3>;
> +			spacemit,apmu =3D <&syscon_apmu 0x1e0>;
> +			status =3D "disabled";
> +
> +			pcie3_port: pcie@0 {
> +				device_type =3D "pci";
> +				compatible =3D "pciclass,0604";
> +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				ranges;
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727094726.8901=
79-1-inochiama@gmail.com?part=3D2
