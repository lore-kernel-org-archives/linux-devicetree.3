Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970121;
	b=UplS7aRRiWbMWWbFz1zT3M4fXgfD8m0tRMMi6+PKCNkYCy+zBLX4HsG9pcJdzfQqUbWr
	 ctNSa2oeyiO62Iosvf0eHTKpulfJG5+8nDuyfUxOQ1ucvg8w3jfGfrm+sEzOlnMiZHNxT
	 6rU526+RfmL9WrLTfz0bc6b9LqHbYPML4dmDof5unalvPUROWfKbhP2RxMsJmGeMcP7jJ
	 bOlgX0xwMDCJMwGOjqV+KaaIE/eqa0IJI6lzayrSI6iL1JXhdLwLlSu6M02LTD1nUWZox
	 Qg39NU2xmwIMaRCukGWsj+HLMFLGlrL4pyAL1zmA8zN+S64Oiu52xz7f+UoPSlQXg9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970121;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sZYfwG7vUcDbVbsp0sD16yCYKPe0n5IDbZGPWSXKi8Q=;
	b=G8Obc4PvaNxKuS7d66hAIARIkDrXSwhn9jX9vLsYTbnCOnhoQ6/yC0x4iFXFYAgeVNwt
	 pzBe+Fl0Zj2Gm+bOI5NROu3CrtlBiLRsoC0iHqOPdfvpYXPAwFgfNr8UnQicivgEgXAuU
	 sIlsfKbW9DdpMTGL6oUfYZA/rMTuJdJ8ILvh/CGnRSXWOUv7QVd5zZ0WhQXsdnUDfV0lR
	 tmhIW1BXhngqJ5Gjs/UAnR66AMZ4LwCCWvd1qmxZS5Y9NI4oyQ18uioEHQXogNynffenD
	 bEv8KHIo95tE6Csnczw+QZt4r8L5xczAFqEaiZhTKjag9RfS1XiCrIhFgdv8+xoO1KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NrtioeGm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B35A606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 02:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NrtioeGm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040871F000C5;
	Wed, 18 Nov 2026 02:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794970121;
	bh=sZYfwG7vUcDbVbsp0sD16yCYKPe0n5IDbZGPWSXKi8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NrtioeGmi7/vJEmHOQUDCbDNPurKW3Js2Xe97+kVX5oNA39l1BbDar0I7Buoly3eg
	 IaHS48H9nJbfMs4sWpbo8e5aEjF+JMZZBhkPLNC3xRwBa5ZUIGsIPerrCnuawJ7LUL
	 HNV+3mn9PDXkHCrJsnurGAGz12re2QiNl56cHly+qW4qCKxYjI0TxSNBXd3RC96Vy2
	 /GvuAkLj+es7zJd8sXohz7FPB/v3RE0CaP80h1GSXI1C6X7UUPlWR8VEu3imR91a6V
	 YZF5IdbnqxshDDtV1PQJsJ9daSAiohq8idGEPq+Ue1mclDlTnafj8yUz8rPqBKx/nt
	 NCnYqy6Tcnthg==
Message-ID: <sashiko-outbox-219984@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add Monaco Draco EVK board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faruque Ansari" <faruque.ansari@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-monaco-draco-v1-3-e42d1673148d@oss.qualcomm.com>
References: <20261117-monaco-draco-v1-0-e42d1673148d@oss.qualcomm.com>
 <20261117-monaco-draco-v1-3-e42d1673148d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 02:48:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] arm64: dts: qcom: non-routable hostname email in Signed-off-by
  trailer
- [High] arm64: dts: qcom: missing enable-active-high on vreg_dp0_pwr
  regulator
- [High] arm64: dts: qcom: misplaced PCIe PERST#/WAKE# GPIOs and wrong
  WAKE# polarity
- [High] arm64: dts: qcom: missing pciclass,0604 compatible on TC9563
  port pcie@1,0
- [Medium] arm64: dts: qcom: TC9563 Ethernet endpoints modeled as PCI
  bridges
- [Low] arm64: dts: qcom: commit message mismatch for uart2 and pcie1
  topology
--

commit 6997fa812fd3a9900d7e8a3fd80ef7fb41e46e05
Author: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

> arm64: dts: qcom: add Monaco Draco EVK board
>=20
> The Monaco Draco EVK pairs the Monaco Draco AC SoM with the Draco
> carrier board. Add its device tree, describing the board-specific
> peripherals layered on top of the SoM:
>=20
>  - I2C GPIO expanders: 4x KTS1622 on i2c14 and 2x TCA9538 on i2c15
>  - EEPROM with a MAC-address nvmem layout on i2c15
>  - Native DisplayPort output (DP0)
>  - Gigabit Ethernet (ethernet0, 2500base-x) over an HSGMII PHY, with
>    the MAC address sourced from the EEPROM
>  - Dual PCIe (pcie0/pcie1) behind an on-board TC9563 PCIe switch
>  - ST33HTPM TPM over spi10
>  - AMC6821 fan controller on i2c13
>  - M.2 E-key slot connector and carrier debug UART (uart2)
>=20
> Also hook the board dtb into the Makefile, together with an EL2
> overlay variant that boots the kernel at EL2 for KVM.
>=20
> Co-developed-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
> Signed-off-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
> Co-developed-by: Sravani Tella <tella@hu-tella-hyd.qualcomm.com>
> Signed-off-by: Sravani Tella <tella@hu-tella-hyd.qualcomm.com>
> Co-developed-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> Co-developed-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
> Signed-off-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

[Severity: High]
The Co-developed-by and Signed-off-by trailers for Sravani Tella use an
internal workstation hostname (tella@hu-tella-hyd.qualcomm.com) rather than
a routable email address.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts b/arch/arm64/b=
oot/dts/qcom/monaco-draco-evk.dts
> new file mode 100644
> index 0000000000000..ad416f586514f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
> @@ -0,0 +1,546 @@

[ ... ]

> +	vreg_dp0_pwr: regulator-dp0-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_DP0_PWR_3P3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&expander1 7 GPIO_ACTIVE_HIGH>;
> +	};

[Severity: High]
Is vreg_dp0_pwr missing enable-active-high?

For regulator-fixed nodes, of_gpio_quirk_polarity() ignores the phandle
flags in gpio and forces OF_GPIO_ACTIVE_LOW unless enable-active-high is
present, which will invert the DisplayPort 3.3V power enable line.

[ ... ]

> +&pcie0 {
> +	perst-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 0 GPIO_ACTIVE_HIGH>;
> +	pinctrl-0 =3D <&pcie0_default_state>;
> +	pinctrl-names =3D "default";
> +
> +	iommu-map =3D <0x0 &pcie_smmu 0x0 0x0 0x1>,
> +		    <0x100 &pcie_smmu 0x1 0x0 0x1>,
> +		    <0x208 &pcie_smmu 0x2 0x0 0x1>,
> +		    <0x210 &pcie_smmu 0x3 0x0 0x1>,
> +		    <0x218 &pcie_smmu 0x4 0x0 0x1>,
> +		    <0x300 &pcie_smmu 0x5 0x0 0x1>,
> +		    <0x400 &pcie_smmu 0x6 0x0 0x1>,
> +		    <0x500 &pcie_smmu 0x7 0x0 0x1>,
> +		    <0x501 &pcie_smmu 0x8 0x0 0x1>;
> +
> +	status =3D "okay";
> +};
> +
> +&pcie1 {
> +	perst-gpios =3D <&tlmm 23 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +	pinctrl-0 =3D <&pcie1_default_state>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};

[Severity: High]
Should reset-gpios and wake-gpios be placed on &pcieport0 and &pcieport1
with GPIO_ACTIVE_LOW for wake-gpios instead of on &pcie0 and &pcie1?

pci_configure_of_wake_gpio() looks up wake-gpios on the Root Port PCI
device node rather than the host bridge node, so wake-gpios on &pcie0 and
&pcie1 is never read; in addition, the pulled-up PCIe WAKE# line is
active-low (see 04bc4263d8b7 ("arm64: dts: qcom: monaco: Fix PCIe WAKE#
GPIO polarity")), so GPIO_ACTIVE_HIGH would configure a level-high
interrupt on a line that idles high.  Placing perst-gpios on the host
bridge node when Root Port child nodes exist also triggers a warning in
qcom_pcie_parse_perst() and registers duplicate PERST# descriptors for
each child PCI bridge node.

> +
> +&pcieport0 {
> +	#address-cells =3D <3>;
> +	#size-cells =3D <2>;
> +
> +	pcie@0,0 {

[ ... ]

> +		pcie@1,0 {
> +			reg =3D <0x20800 0x0 0x0 0x0 0x0>;
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			device_type =3D "pci";
> +			ranges;
> +			bus-range =3D <0x3 0xff>;
> +
> +			port {
> +				tc9563_pcie1_ep: endpoint {
> +					remote-endpoint =3D <&m2_e_pcie_ep>;
> +				};
> +			};
> +		};

[Severity: High]
Does pcie@1,0 need compatible =3D "pciclass,0604"?

pci_pwrctrl_is_required() returns false for any bridge node without a
compatible string starting with "pci", and slot_pwrctrl_driver matches
"pciclass,0604".  Without it, no pwrctrl device is created for pcie@1,0 and
the M.2 Key E connector's PCIe power sequence (enabling vpcie3v3-supply) is
never run before PCIe enumeration.

> +
> +		pcie@2,0 {
> +			reg =3D <0x21000 0x0 0x0 0x0 0x0>;
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			device_type =3D "pci";
> +			ranges;
> +			bus-range =3D <0x4 0xff>;
> +		};
> +
> +		pcie@3,0 {
> +			reg =3D <0x21800 0x0 0x0 0x0 0x0>;
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			device_type =3D "pci";
> +			ranges;
> +			bus-range =3D <0x5 0xff>;
> +
> +			pcie@0,0 {
> +				reg =3D <0x50000 0x0 0x0 0x0 0x0>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				device_type =3D "pci";
> +				ranges;
> +			};
> +
> +			pcie@0,1 {
> +				reg =3D <0x50100 0x0 0x0 0x0 0x0>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				device_type =3D "pci";
> +				ranges;
> +			};
> +		};

[Severity: Medium]
Should the two child nodes under pcie@3,0 be ethernet@0,0 and ethernet@0,1
endpoint nodes rather than PCI bridges?

Under toshiba,tc9563.yaml, pcie@3,0 only permits ^ethernet@0,[0-1]$ child
nodes for the switch's integrated Ethernet MAC endpoints.  Defining them
as pcie@0,0 and pcie@0,1 with device_type =3D "pci", #address-cells,
#size-cells, and ranges fails dtbs_check and causes PCI bridge walkers
such as qcom_pcie_parse_perst() to treat the endpoints as PCI-to-PCI
bridges.

[ ... ]

> +&uart2 {
> +	status =3D "okay";
> +
> +	port {
> +		uart2_ep: endpoint {
> +			remote-endpoint =3D <&m2_e_uart_ep>;
> +		};
> +	};
> +};

[Severity: Low]
The commit message describes uart2 as the "carrier debug UART (uart2)",
whereas here uart2 is wired to the Bluetooth UART port (port@3) of
wifi-bt-connector (and debug console is uart7 in monaco-draco-ac-som.dtsi).
Similarly, the commit message says "Dual PCIe (pcie0/pcie1) behind an
on-board TC9563 PCIe switch", while only pcie0 is connected to the TC9563
switch.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-monaco-dra=
co-v1-0-e42d1673148d@oss.qualcomm.com?part=3D3
