Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0612F616A
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155303; cv=none; b=AR+iDssEkmfmzQSyR8cO3wFfqBvMIqkpt3uhHhsyNNfINBHsaha/d9kSsZyMC03+Ro6dxl2z0v6IZg+F27JCRT2rTCJKG71gmw75uq8sopEOxzLIXdEFVxr29DyDCbIhyM/SPoTsYsDz5KiOUPqv6jbN4cc2aV0J7YBwPIhjRwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155303; c=relaxed/simple;
	bh=PtzTVhWNJvdHYW8wDEK4UuM00DBp/7V2GZzOk6vII7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rTAoTIJ/4BTuHvN+NpYWAeP2F3F5Bf/KLXm/gkxGAENzPjgtbwdvvATwuHF/LzMx4pXaFFERBSLKBtqPM5oG0cUOCwmiyXpvE0gxkrJi01I1HmtFQ5m67IE8FexFc2w1lvIgloAbkKMUoFDVKRb25jwIsjauDQYfEFUeh09AHWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=od68VVYQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="od68VVYQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA74A1F00893;
	Thu, 11 Jun 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781155301;
	bh=nVYnF+5GcruiUgrIAZGYtX9Nkhc95uDqRyXmJmHZbBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=od68VVYQcTcjFi7WOyAR6mMlXQqUPicvhS+SYw1+2CY366b6GpnFLDCG+qdRC0VtL
	 IDlzDzRgn9PHdCTwsEyAuiPE3aZ/rzQe9p8uJHFkAZnPfPUzdvnJBu2M2oiOpxxODs
	 V5Xrji8GL1JHANbtFcQqohj3wV6EKeNdcruBsERBUDRRFdsJBlXJ9x8mvyRnX2342L
	 A3m0rgUt9VSB3/jST0D+x0bKkDuB3zbSmaTUmPoBhxCJEp3wFbtT0kcUFvSFyKTzW5
	 iVxZf0gMwDCs8XhEJGPdt9zwEi2BoXnRzv5JYxFYrlssMUAXWXiroT7r3TjyaPCBP+
	 TsPUH3iaN5i0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 31/37] arm64: dts: qcom: sm8350: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-wake-v2-31-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-31-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:21:40 +0000
Message-Id: <20260611052140.BA74A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message explicitly claims to move `phy-names` to the =
port nodes, but the property was completely removed.

Pre-existing issues:
- [High] qcom_pcie_phy_power_on() blindly calls qcom_pcie_phy_power_off() o=
n error, leading to unbalanced regulator disables.
--

commit 8e84d69b909c92cf7a61c9817d6f72fae667daff
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs to root port node

This commit moves the PCIe PHY references and perst/wake GPIO properties
from the root complex controller nodes to their respective root port nodes.
It also renames the perst-gpios property to reset-gpios to conform with
the root port bindings.

> Move phys and phy-names from the controller to pcie0_port0 and pcie1_port=
0, adding labels to these nodes to allow board-level overrides.

[Severity: Medium]
It appears "phy-names" was only deleted from the parent controller nodes and
never added back to the port nodes.

Was the intention to drop "phy-names" entirely, or should it be added to
pcie0_port0 and pcie1_port0?

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/q=
com/sm8350.dtsi
> index c830953156ec6..4515a1ccb930b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1583,12 +1583,9 @@ pcie0: pcie@1c00000 {
> =20
>  			power-domains =3D <&gcc PCIE_0_GDSC>;
> =20
> -			phys =3D <&pcie0_phy>;
> -			phy-names =3D "pciephy";
> -
>  			status =3D "disabled";
> =20
> -			pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;
> @@ -1596,6 +1593,8 @@ pcie@0 {
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				phys =3D <&pcie0_phy>;

[Severity: Medium]
Should phy-names =3D "pciephy" be added here to match the commit message?

[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed a potential flaw in the driver's
error handling path that could lead to unbalanced regulator disables.

If phy_power_on() fails in drivers/pci/controller/dwc/pcie-qcom.c, the error
handling blindly calls qcom_pcie_phy_power_off():

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_phy_power_on() {
    ...
    if (ret)
        qcom_pcie_phy_power_off(pcie);
    ...
}

This unconditionally iterates over all parsed ports to call phy_power_off():

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_phy_power_off() {
    ...
    list_for_each_entry(port, &pcie->ports, list)
        phy_power_off(port->phy);
    ...
}

This includes the port that just failed to power on (where power_count is 0)
as well as any subsequent ports in the list that haven't been attempted.

Calling phy_power_off() on an unpowered PHY decrements its power_count to -1
and unconditionally calls phy_pm_runtime_put() and regulator_disable().

Could this trigger a warning in the core regulator framework and inadverten=
tly
cut power to other devices sharing the regulator?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-wake-v2-0-=
2744251b1181@oss.qualcomm.com?part=3D31
