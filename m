Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74347279DCC
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791867887; cv=none; b=La86TT3J6A3UVtSKY0ohnZT6tsdv6HHa1EE3yguvDf7QaZrLe57qnmRf4qZluj647VvrXVxtr7eUiQ1Ec/sDZvFAUCRTeQ7zxEIOv5p7psijZfEyfFr6ea7J1rMWdoSj7pKCrP3PBrGjunST/z0uXi1yG9x4gy03Ns4fe1PtGsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791867887; c=relaxed/simple;
	bh=NxhMN+sOiXG0lxx/C+6YmMMicf2GQA/2t9zBRkveSRs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MGtjD4KEBBoyW8F/9Xw1tNYUzHYxLlGaCcltge6D64JF6zB1Vi5ZaUxHLj0m9qDSUSl0WxJwSEto/4zOMxkKtwibdifUAjvLKJUt6AN+o5xErAlWulkmk7aI1PZKR2eLj2aqzxZDZrnKdPuLq4J0QT9X3I3tBnMAJhdShD/O058=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiJ1CsRA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiJ1CsRA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDD71F000FF;
	Tue, 13 Oct 2026 05:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791867886;
	bh=F5TacoJtAFL51OeoHC0AKVymmi5T1fjqfP9ht2VQlOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UiJ1CsRATccLnfes44mxLW0l/AtG9UqUsumnFB7ngr2GbC7w0x0rB4I70Pgf89cws
	 2kRLJDW7r3PDBSjD7l9fqYzQxQfHOxJ255ccSjzCIp+hkLvY/1kzMuxuMdpUua7wYn
	 6rz+pkB1are+fkQ8NWy+qmbXH53GBHifHEoApLOZJscfs7baQfq0QUfVYKijdbfxSB
	 ZriIPHLllHsE563C3j7s4VCf5Aw+POf1qOZeMXiR7CUymThsxqojzmRGGUEaMPkPTE
	 PaxcHxZCTELGeQuAT850R0Xuvztk/ZaF/N6P7lTA+emYcPEiW3liVMTNeoP76zozEH
	 NsvHpHFIUlzgw==
Message-ID: <sashiko-outbox-168988@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and
 Bluetooth overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linghui Wu" <linghui.wu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013045527.56941-1-linghui.wu@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
 <20261013045527.56941-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:04:45 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dt: unresolved phandles in dtso cause overlay application failure
- [High] dt: missing status okay for i2c3 prevents child devices from probi=
ng
--

commit 20bd5cfd16cb2c55b562568723f33d895fa37020
Author: Linghui Wu <linghui.wu@oss.qualcomm.com>

arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay
   =20
Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on Qualcomm
Shikra IQS EVK. Describe the PCIe and UART connections through the
M.2 connector, the 3.3 V supply, the W_DISABLE signals and the PCIe
reset signal. Disable the onboard Wi-Fi and Bluetooth nodes when the
overlay is selected.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/ar=
ch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> new file mode 100644
> index 0000000000000..9496c6558eef6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
[ ... ]
> +&i2c3 {
> +	qps_gpio_expander: gpio@3c {
> +		compatible =3D "nxp,pca9534";
> +		reg =3D <0x3c>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +};

[Severity: High]
Does this overlay need to set status =3D "okay" for the i2c3 bus?

In the base device tree, the i2c3 bus has status =3D "disabled". Because the
parent I2C bus remains disabled, the child qps_gpio_expander will never pro=
be.
Consequently, the m2_keye_3p3 regulator, which relies on a GPIO from this
expander, will defer indefinitely, leaving the M.2 Wi-Fi/BT module unpowere=
d.

> +
> +&pcie {
> +	iommu-map =3D <0x0 &apps_smmu 0x0800 0x0 0x1>,
> +		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
> +	vddpe-3v3-supply =3D <&m2_keye_3p3>;
> +};

[Severity: High]
Do the &pcie, &pcie_port0, and &tc9563 labels exist in the upstream
platform code?

Applying this overlay at runtime or via the bootloader will fail due to
unresolvable symbols. None of these labels are defined in the upstream
platform code (shikra.dtsi, shikra-iqs-som.dtsi, or shikra-iqs-evk.dts).
Does this overlay rely on unmerged or out-of-tree patches that add PCIe
support to the Shikra platform?

> +
> +&pcie_port0 {
> +	compatible =3D "pciclass,0604";
> +	reset-gpios =3D <&tlmm 118 GPIO_ACTIVE_LOW>;
> +
> +	port {
> +		pcie_port0_ep: endpoint {
> +			remote-endpoint =3D <&m2_e_pcie_ep>;
> +		};
> +	};
> +};
> +
> +&tc9563 {
> +	reg =3D <0x1ff00 0x0 0x0 0x0 0x0>;
> +	status =3D "disabled";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013045527.5694=
1-1-linghui.wu@oss.qualcomm.com?part=3D1
