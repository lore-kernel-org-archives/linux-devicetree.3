Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF6C3B3BF5
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082333; cv=none; b=e/VfGvJ8z4P8T8KV9gvVVxS8ER90x+hWtafSlpuLdMLIbt6roGyu7cEZl7qlEa5UZnrZh2lACfwtKncVuJpKE12XcmTqTr7iHWt6JcvY6IHV48hFou4WpLOjszZW1AgWle478VuFijY8HVMzHYAKUeBWafAdJAYW++/R4+QJ+yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082333; c=relaxed/simple;
	bh=iKSN6wtrKK1cpabYdgAWe860HbupnqNuo7vZde2kn6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q08KcxrM1GCQdb05Zl65PHvnctKoIX95w7K+1J6i/6lM3ucWFo0LfrTBrvnwBZDqY7Ou62AdtSQQ6Iaq90p42jfn4NBH6dDyoMY3gq22h6Wq05PpYea5MjB6nIsLM12/rJ0XHm2rMjeIKsP4Gdw2YxWPqimzIFWr8NbxkU/sX7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPrgSp2A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPrgSp2A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99511F00893;
	Wed, 10 Jun 2026 09:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082332;
	bh=FQ+zh/2sOTD+ifv/sBafdttjA6zEHJ2bZXvOmZtKUCc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZPrgSp2A15XAwK6V8NlaXbxs0IWJLZzwUI1iViXxnxx7nnbskl/hezFfR/eiYjmdd
	 TErOVoHAO8OgrwXavbDRkDiSXs47WrX7S9//jO2pUtj2KqFAQHtehn1x0jVfgVeBrq
	 kt0fUSXCRB7ln34hgG45nxPhK5x6K0TId9Ygb2mrQfv2J0wbqxP3vbuVH/cPmQaWy2
	 aOQboDoK3fyu/+b3ewAQ9hgT1jBb6DpkJVzq335j+iPDIqik1NIC9ttfBsZPJjLkJJ
	 JkTg2SLc+UaQGqAVUE2UoVNNUiOGpVUlCrZu8aRcwoWLHOl7E4byyWL4gVIWTgLjj4
	 MYo9qo1t1PmfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "William Bright" <william.bright@imd-tec.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
References: <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 09:05:31 +0000
Message-Id: <20260610090531.E99511F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Encoding downstream device resets and straps into the PCIe host =
controller's pinctrl to control boot sequencing.
- [Low] Dangling `enable-active-high` property in `regulator-gpio` without =
`enable-gpios`.
--

commit 69cdd29642da9fee5fcb6d62c3df7354abac11dc
Author: William Bright <william.bright@imd-tec.com>

arm64: dts: qcom: Add IMDT QCS8550 SBC

This commit adds device tree support for the IMDT QCS8550 SBC. It enables
various peripherals including regulators, UART, UFS, PCIe, USB, and Etherne=
t.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts b/arch/arm64/b=
oot/dts/qcom/qcs8550-imdt-sbc.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts

[ ... ]

> +	sdhci_2_vqmmc: regulator-sdhci-2-vqmmc {
> +		compatible =3D "regulator-gpio";
> +
> +		regulator-name =3D "sdhci_2_vqmmc";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-type =3D "voltage";
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&sd_vset_default>;
> +
> +		gpios =3D <&tlmm 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;

[Severity: Low]
Is this enable-active-high property needed here?

This regulator uses regulator-gpio and defines the gpios array for voltage
state selection, but it does not specify an enable-gpios property. Since the
property is dangling, will this trigger a dtbs_check validation warning?

> +
> +		gpios-states =3D <0>;
> +		states =3D <3300000 0>,
> +			 <1800000 1>;

[ ... ]

> +&pcie0 {
> +	wake-gpios =3D <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +	perst-gpios =3D <&tlmm 94 GPIO_ACTIVE_LOW>;
> +
> +	/*
> +	 * pcie0 hosts the M.2 Key-E slot. Apply the SDIO
> +	 * reset de-assert here so any module's chip enable is settled
> +	 * before pcie0 trains its link.
> +	 */
> +	pinctrl-0 =3D <&pcie0_default_state>, <&m2e_sdio_resetn_default>;

[Severity: Medium]
Is it correct to encode downstream device resets into the PCIe host
controller's pinctrl?

Tying board-level reset pins like the SDIO reset to the PCIe host
controller's pinctrl tightly couples peripheral initialization to the host
driver's state machine.

Should these downstream devices be modeled using PCI child nodes with their
own reset properties or standard power sequencing mechanisms instead, to
avoid unintended GPIO toggling during PCIe suspend and resume?

> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};

[ ... ]

> +&pcie1 {
> +	wake-gpios =3D <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +	perst-gpios =3D <&tlmm 97 GPIO_ACTIVE_LOW>;
> +
> +	/*
> +	 * pcie_switch_sel_default and gbe_reset_default are board-init
> +	 * lines that must be stable before pcie1 trains its link: the
> +	 * PCIe switch needs its mode-select strap settled, and the
> +	 * downstream LAN743x must be out of reset to enumerate.
> +	 * Applying them via pcie1's pinctrl-0 fires them during
> +	 * qcom-pcie probe, before bus enumeration.
> +	 */
> +	pinctrl-0 =3D <&pcie1_default_state>,
> +		    <&pcie_switch_sel_default>,
> +		    <&gbe_reset_default>;

[Severity: Medium]
Does assigning the PCIe switch strap and downstream GbE PHY reset to the pc=
ie1
pinctrl violate device tree abstractions?

Similar to pcie0, this couples downstream device initialization directly to
the host controller. Modeling this hardware topology through proper PCI chi=
ld
nodes might be safer than relying on host driver sequencing.

> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-imdt-qcs85=
50-sbc-rfc-v4-0-358e71d606bc@imd-tec.com?part=3D4
