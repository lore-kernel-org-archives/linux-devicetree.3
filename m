Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C86A41A4E4
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048737; cv=none; b=t66xH38cNPIY4HuzDjv8MwtXK02IwwV6WL6Cg9l34NvkiRcC7cBQpzy5GWtlSRip2Wr+Dhbf4mOzDbGHJjLcvfZJu3thQP8OU1ro4yuJxD7MNSCE64sRemNurVopTNL1gVdSu2/cbcCnAjUyLFF5nmyOCxFOO7QJcQ0KN2q1HO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048737; c=relaxed/simple;
	bh=7VeLJRhgG0JRMUO3g/TnISnoJmz+ulN9yD/6m5blcrw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mA0jtcQY9KT2ZZovrcnpLfOsQGaRrvwJLDNJkjkbma9qmhtDRyCJ7PJAZVKA3wUExsJeLEmqM/pw0zVhczGOjJ/5zIY3q7Gig8Rbkn4OT7D1t1AnMb6XiRY5R9+i2AdCBO2RpqX6ZpuSgM25UfKhXKQIwivoYH8oZx9dRKNiOR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYZjPoJR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYZjPoJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBB31F000FF;
	Thu, 10 Sep 2026 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048735;
	bh=VQQvg4EHgulNGhJ87Zve9DiwmcJ+rzLlhhxCe+wEwu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CYZjPoJR1q896xI6X60VDKUgwPlWGSmKXNsg20pmv3W4n/41VVV5tR4opKk8vL1ID
	 Zz3JCF6+GkFo0NHhXgNL54qEt859HxW4d7qjL7uODeO8kcdQvu0xaGfn1FHB9R6vY5
	 KE4EqTftDWAty4LzffDgnvxLUlMHSgxUZzV2f6OukTAaLDKvkuSK3+eh1drZu7750m
	 HWfw/1luvrX7/tzA/zTI44sXjaZhpqk9nQIP8LJGfamK1hDM+HRazWAijf2T36lqJZ
	 d6NzxlqMslM+mgnIH9A2VI9M5OQ6nBjuXNlzHRxp3l4fttTdSyqY2MmiEaGBQEX8eK
	 3xLUPcAQjcS5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 32/34] arm64: dts: qcom: msm8996: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910-root_port-v1-32-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-32-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:58:54 +0000
Message-Id: <20260910135855.5BBB31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] Removing `phys`, `phy-names`, `perst-gpios`, and `wake-gpios` =
from the PCIe root complex (controller) node breaks device tree backwards c=
ompatibility with older kernels.
- [Medium] The commit message falsely claims to move `phy-names` to the roo=
t port nodes, but the property is completely omitted.

Pre-existing issues:
- [High] Missing `phy_exit()` cleanup on error paths leads to unbalanced PH=
Y initialization.
--

commit eb9552cbeaad8284f5ba99a861cad696426a8167
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: msm8996: Move PCIe phy and GPIOs to root port node

This commit updates the device tree bindings for the MSM8996 PCIe controlle=
rs
by moving the PHY references and PERST/WAKE GPIO properties from the Root
Complex nodes into the child port nodes. It also renames the perst-gpios
property to reset-gpios to match the binding used in the root port context.

> Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, and pcie2_port0, adding labels to these

[Severity: Medium]
The commit message claims that phy-names is moved to the pcieX_port0 nodes,
but it appears to be completely omitted in the changes below. Is the commit
message inaccurate, or was the property accidentally dropped?

[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/bo=
ot/dts/qcom/apq8096-db820c.dtsi
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> @@ -458,23 +458,32 @@ hdmi_ddc_suspend: hdmi-ddc-suspend-state {
> =20
>  &pcie0 {
>  	status =3D "okay";
> -	perst-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;
>  	vddpe-3v3-supply =3D <&wlan_en>;
>  	vdda-supply =3D <&vreg_l28a_0p925>;
>  };

[Severity: Critical]
Does removing the legacy perst-gpios property from the pcie0 controller
override cause a device tree backwards compatibility regression?

Older kernels booting with this updated device tree might fail to initialize
the PCIe controller because they cannot find the reset GPIOs on the Root
Complex node.

[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/=
qcom/msm8996.dtsi
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1924,9 +1924,6 @@ pcie0: pcie@600000 {
>  				      <0x0c100000 0x100000>;
>  				reg-names =3D "parf", "dbi", "elbi","config";
> =20
> -				phys =3D <&pciephy_0>;
> -				phy-names =3D "pciephy";

[Severity: Critical]
Will removing these PHY bindings from the pcie0 controller node cause older
kernel versions to fail to initialize the PCIe controller, since they may n=
ot
scan the child port nodes for the PHY properties?

>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges =3D <0x01000000 0x0 0x00000000 0x0c200000 0x0 0x100000>,
> @@ -1975,11 +1972,13 @@ pcie0: pcie@600000 {
>  						"bus_master",
>  						"bus_slave";
> =20
> -				pcie@0 {
> +				pcie0_port0: pcie@0 {
>  					device_type =3D "pci";
>  					reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  					bus-range =3D <0x01 0xff>;
> =20
> +					phys =3D <&pciephy_0>;
> +

[Severity: Medium]
Should phy-names =3D "pciephy" be added here, as described in the commit
message?

[ ... ]

[Severity: High]
This is a pre-existing issue, but while reviewing the driver handling for
these ports, is there a missing phy_exit() cleanup on error paths in
drivers/pci/controller/dwc/pcie-qcom.c?

If probe defers due to GPIOs not being ready, the unbalanced PHY enable cou=
nts
will accumulate. In qcom_pcie_parse_port():

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_port() {
	...
	ret =3D qcom_pcie_parse_perst(pcie, port, node);
	if (ret)
		return ret;
	...
}

This early return bypasses PHY cleanup since the port is not yet added to t=
he
global list. Similarly, in qcom_pcie_parse_legacy_binding():

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_legacy_binding() {
	...
	port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
	if (!port)
		return -ENOMEM;
	...
}

Could these early returns cause resource leaks of the PHY state initialized
earlier?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D32
