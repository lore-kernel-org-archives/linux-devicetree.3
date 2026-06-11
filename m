Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4E63537C8
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155449; cv=none; b=U/YNhV+XnWN2+tH3z6jtZqJoATpRIsK17NyirBrCMshZkkO6pTfB1KPqzohAX1k/H5C0kKDgCKboA0gSgVSyYdMPy7d94lcVt7SHkwLVyAS4Nv8knilQ6Ywku1Rll2Dd8VQ+mxc6QcjXeZ5TWGShwsDW2k9WWVwOudDwyWt3MdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155449; c=relaxed/simple;
	bh=RneMvmmVDJuIhbVM5rfm3ODQnRKO4xEiuVUi+14BHf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D9xeqfaIcftmxM6M6m83pkFOU/PZQ0Ig6k5Tkt4z1/mla30o0I7+iQj7t+mPDpCn/Vzty4bCbk0j1VuBzO48+06xA9FeP/BfPnB7DwqD9/ym0VFaCdOs2mPtJBLra8yJlKgNYqIpbEmTmm8mM8FTGLo/yNXwcFqhd8/lXhx3pTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H047UReR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H047UReR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910431F00898;
	Thu, 11 Jun 2026 05:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781155446;
	bh=K36JIFBgKLKe5Me88ZJXI2U9MiznfjR2cf4Ngaddi+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H047UReRh5DrA8gIf/7zElpb1s36zbYxdGDXjjJD4SltYwxss2wJCuofWPFLiSRRx
	 oik8QzuPg9pThXZx8Kbu6B2sCHWqW1aHAexFCgHoEz7HJK4S0HqIoD3SzoKMDmcECC
	 0Sd5vNKbKmPih06Ff8KgLGryPjd2ajD39iGftweQ5yx8udIpdXkD4++B57w7CYTNi1
	 n+59Lg1PMauwU45JTNvlbDhSkDCqJJ1Z9tD28drOLL0IEpIRzjZwuu7hH6NQpOi317
	 NjV7QgZ1/wrqXP4W5ilm4kZfkzhjNSrEg7SzlNNt+2sPuA0nwaPj4479WK6LsXI8c0
	 icFQ8xAeEKIJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 30/37] arm64: dts: qcom: sm8250: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-wake-v2-30-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-30-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:24:06 +0000
Message-Id: <20260611052406.910431F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message claims to move `phy-names` to the root port n=
odes, but the property is actually deleted and not added.
- [Medium] `wake-gpios` is moved to the root port child node, but it is not=
 permitted by the `qcom,pcie-common.yaml` schema for child nodes.

Pre-existing issues:
- [High] Missing `phy_exit()` on error paths in `qcom_pcie_parse_port()` an=
d `qcom_pcie_parse_legacy_binding()` leading to PHY resource leaks.
--

commit b2d52b29841e8c337d148f97ebcff12f728d5a5f
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sm8250: Move PCIe phy and GPIOs to root port node

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node.

> Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0 and pcie2_port0, allowing board-level overrides. Rename

[Severity: Medium]
The commit message explicitly states that phy-names is being moved to the
root port nodes. However, the diff shows it is being deleted from the parent
controller nodes but never added to the destination root port child nodes.

While omitting phy-names might be structurally correct according to the
bindings, does the implementation contradicting the stated intent in the
commit message represent a regression?

> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index eca66d1c1c5b7..a5e2a16f6213e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2198,12 +2198,6 @@ pcie0: pcie@1c00000 {
> =20
>  			power-domains =3D <&gcc PCIE_0_GDSC>;
> =20
> -			phys =3D <&pcie0_phy>;
> -			phy-names =3D "pciephy";
> -
> -			perst-gpios =3D <&tlmm 79 GPIO_ACTIVE_LOW>;
> -			wake-gpios =3D <&tlmm 81 GPIO_ACTIVE_LOW>;
> -
>  			pinctrl-names =3D "default";
>  			pinctrl-0 =3D <&pcie0_default_state>;
>  			dma-coherent;
> @@ -2218,6 +2212,10 @@ pcieport0: pcie@0 {
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				phys =3D <&pcie0_phy>;
> +				reset-gpios =3D <&tlmm 79 GPIO_ACTIVE_LOW>;
> +				wake-gpios =3D <&tlmm 81 GPIO_ACTIVE_LOW>;

[Severity: Medium]
Could moving wake-gpios to the pcie@0 child node introduce a schema
validation regression?

In Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml, the
patternProperties for ^pcie@ has unevaluatedProperties: false and only
explicitly permits reg and phys. If wake-gpios is not a standard property
defined in /schemas/pci/pci-pci-bridge.yaml#, might this fail
dt_binding_check?


[Severity: High]
This is a pre-existing issue, but missing phy_exit() on error paths in
qcom_pcie_parse_port() and qcom_pcie_parse_legacy_binding() appears to
lead to PHY resource leaks.

In qcom_pcie_parse_port():

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_port() {
    ...
	ret =3D phy_init(phy);
	if (ret)
		return ret;

	INIT_LIST_HEAD(&port->perst);

	ret =3D qcom_pcie_parse_perst(pcie, port, node);
	if (ret)
		return ret;
    ...
}

If qcom_pcie_parse_perst() fails (e.g., returning -EPROBE_DEFER when
failing to acquire the reset GPIO), the function returns the error
immediately without calling phy_exit(phy).

Because the newly allocated port has not yet been added to the pcie->ports
list, the error handling path in qcom_pcie_parse_ports() will not see this
PHY. Does this repeatedly leak clocks and regulators on probe deferral,
preventing power domains from collapsing?

The same pattern exists in qcom_pcie_parse_legacy_binding():

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_legacy_binding() {
    ...
	ret =3D phy_init(phy);
	if (ret)
		return ret;

	port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
	if (!port)
		return -ENOMEM;

	perst =3D devm_kzalloc(dev, sizeof(*perst), GFP_KERNEL);
	if (!perst)
		return -ENOMEM;
    ...
}

Could these devm_kzalloc() calls also fail and leak the initialized PHY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-wake-v2-0-=
2744251b1181@oss.qualcomm.com?part=3D30
