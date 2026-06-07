Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F064071DA
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 05:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780811336; cv=none; b=COotbPmupdDitYaEtYuoRINtQo4XEmP24M9gXjV2LUOFLQb2jP1x6gV/OGB379y3xsdXcsJ82b5AgBWwEUsRuxr6godb8xXyouJhjc1QqjQhiP1/GAdM5pnsnyT6hft2F8lmYGEYGEKtI6ZE6PUT7d+ekqBAFMOGAd/AfEW+J+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780811336; c=relaxed/simple;
	bh=DzqjKiYEYQB4Upfl3uZOrxkara/BMVMwUQHlr7Q21O4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u22u6OrYxFBQ7uJ5ZByJtLXj019oZWyOHfOpIusVSb532iFu199Eva5mF2w8RldtJS1Un0DzKmFfNnnLeaBC/w6Y4+xkrAF4xbCsabVx7iNEBunnwfVOdcST6g8S0T2GiD1f9v9VT/IOBdcIZ0A4riev2BT68yMYvAGQQ1NIymQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6wIUGCR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6wIUGCR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705991F00893;
	Sun,  7 Jun 2026 05:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780811334;
	bh=Mw+H6imj3GcwiH5T3i4UM1Fz9Tx1d9mb8EmuXH0gxzk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U6wIUGCRBz6qt177VgEijN0sw18TtCLPPXN8mFQ+4chPYKDSNwKZC2ji23K4AldYT
	 UtQyhY1nPCW6+2CmW4W4mIl5giLEgZToaLqXCeOd/ozwRBX81yEl4fOQuPIooyyKnw
	 4/Ub/4d1WAMWNAnCJsMnk65GIZb/ff361UwThVhFNkGPS57O66KIyGxCQBEGfeg0ui
	 7Wnt96SpUSJXWGa5KkEV790sw+K4GoitTJ7G8ubVc/QqTQ5ZqWx5QavjKfpoTd+9KG
	 16p7A5fkpUn1Lw7yJurWm9c+76FyCC7Eg9AKE36Ig1f9xC1brpGQXs7Ti8HkTON/NY
	 2WVX7gFXPFP0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: Move PCIe GPIOs and PHYs
 to root ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@thundersoft.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
References: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:48:54 +0000
Message-Id: <20260607054854.705991F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing bug in the legacy fallback parsing of the Qualcomm PC=
Ie driver where a devm-managed GPIO request causes an -EBUSY failure.
--

commit a43564541de23d343c5f9c38e89cac6a69d3e6e1
Author: Hongyang Zhao <hongyang.zhao@thundersoft.com>

arm64: dts: qcom: kodiak: Move PCIe GPIOs and PHYs to root ports

This commit moves the PCIe PHY and GPIO references from the host bridge to
the root ports for Kodiak devices. It aligns the device trees with the new
Qualcomm PCIe bindings where perst-gpios becomes reset-gpios on the root
port.

> The Qualcomm PCIe binding deprecates perst-gpios and wake-gpios
> on the host bridge and expects board reset and wake GPIOs to be
> described on the root port. PERST# is described there as
> reset-gpios.
>=20
> Move the PCIe PHY references in kodiak.dtsi to the PCIe0 and PCIe1
> root port nodes, and move the board-specific PCIe reset and wake
> GPIOs in the Kodiak DTs to the corresponding root ports.
>=20
> Keep the PHY and GPIO resources on the same root port nodes so the
> Qualcomm PCIe driver can parse the root port binding instead of
> falling back to the legacy host bridge GPIO parsing.

[Severity: High]
This isn't a bug introduced by this patch, but looking at the fallback
to the legacy host bridge GPIO parsing mentioned here, is there a
resource leak in the driver's fallback mechanics?

In drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_ports(), the
driver requests the perst GPIO exclusively:

qcom_pcie_parse_ports() {
    ...
    pcie->reset =3D devm_gpiod_get_optional(dev, "perst",
                                          GPIOD_OUT_HIGH);
    ...
}

If it fails to parse the child port nodes, it returns -ENODEV and jumps
to err_port_del:

err_port_del:
    list_for_each_entry_safe(port, tmp_port, &pcie->ports, list) {
        ...
       =20
However, it does not free the devm-allocated perst GPIO before returning.

When probe catches the -ENODEV and falls back to
qcom_pcie_parse_legacy_binding(), it tries to acquire the exact same GPIO:

qcom_pcie_parse_legacy_binding() {
    ...
    reset =3D devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
    if (IS_ERR(reset))
        return PTR_ERR(reset);
    ...
}

Will this second request fail with -EBUSY and cause a regression for
existing boards running legacy device trees?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607-rubikpi-bu=
gfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com?part=3D1
