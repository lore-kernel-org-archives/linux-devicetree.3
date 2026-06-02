Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B75384CEC
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419163; cv=none; b=ULDlvRoIFAXjjzqTOewTViKfloUCIf2C33+4JoKtzYbCXWlLAm3dYK8rHaTaoLnebRfH4p9vYuHYUKOcwSl1DkmDnV2KsJiSyMGGovXqnzeugcHpOxQvwS9sBxzJDFi9UD7+9lvMJzY0Zsj4WPwSD8Q5ua3nZnz10eGdNT9Tp3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419163; c=relaxed/simple;
	bh=E3/XLNGhhZ+B9PSFxTDv1xtISeB418fs10roFY31efI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N2habp1SbGuvF5ezcI4UbhcNdRIVLFPSwz3iaAlF0MxZMJepTzRaxSKoKC2mcZ2Lzlg6rbb1m0YZhu/c715YyKC+usxXOEwhHq0iuM8PUEcJlcLBOkXDncX2bz4YkerdRcU4GhgAIEdVy0XGPyoVJJRdfGisGDXCZLcZP3BYntg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXWOAFfy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXWOAFfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8821F00898;
	Tue,  2 Jun 2026 16:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419162;
	bh=kV/U9dvZGpRojDmlblB60y8ZruC209hHfHok4hE4dIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MXWOAFfyMNNGkQWvPEmSIqnbsbiG2F/rZngZuxDABHLoVjYxxxO8lyqCEfxBL63Kg
	 qBkACLcCgj6rU32xMCXxGoL/63PKdRLBTpmfTHEMgUa2gRQ5H7Me2NrE7Q74PJxHt3
	 xLPO9SeXuhfFAwsxqAoYscIOk5djFhBByU0wehnZ/VO3sU/yAtyffUHT8SLIsh4l1n
	 G+cEfdXW3mIlT2OX7INs6Y4WpNCjO8WropmjvQb3UWv8amK2coovNBlZhPWWallXO5
	 6/ay+eaclmYyHJ5/jp7kiFb9DmzfK5xPRUIIcmnBThHt2m1iXvgbmw2d8qKjpIaDCu
	 B3/uElW9DtZFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5424: Move PHYs and PERST# to
 Root Port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260602-move_perst_to_rp-v1-2-8ee5b80316da@oss.qualcomm.com>
References: <20260602-move_perst_to_rp-v1-2-8ee5b80316da@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 16:52:40 +0000
Message-Id: <20260602165241.5D8821F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Legacy device trees fail to probe with -EBUSY because the 'per=
st' GPIO descriptor is requested twice without being released.
--

commit f286f42842ba6bb45e869489bbe2830fdd9be93c
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq5424: Move PHYs and PERST# to Root Port node

This commit updates the device tree to define PHYs and the PERST#=20
(reset-gpios) under the PCIe Root Port node instead of the main controller=
=20
node. This aligns with the new binding style.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boo=
t/dts/qcom/ipq5424-rdp466.dts
> index de71b72ae6dcc..be8657239c46b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -86,8 +86,6 @@ &pcie2 {
>  	pinctrl-0 =3D <&pcie2_default_state>;
>  	pinctrl-names =3D "default";
> =20
> -	perst-gpios =3D <&tlmm 31 GPIO_ACTIVE_LOW>;
> -

[Severity: Critical]
This is a pre-existing issue, but does moving these properties expose a
probe failure on legacy device trees?

When parsing a legacy DT, qcom_pcie_parse_ports() successfully requests the
"perst" GPIO:

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_ports() {
...
	pcie->reset =3D devm_gpiod_get_optional(dev, "perst",
					      GPIOD_OUT_HIGH);
	if (IS_ERR(pcie->reset))
		return PTR_ERR(pcie->reset);
...
}

But it then returns -ENODEV due to the lack of a "phys" property on the chi=
ld
node. The probe function then falls back to qcom_pcie_parse_legacy_binding(=
),
which attempts to request the same "perst" GPIO again:

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_legacy_binding() {
...
	reset =3D devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
	if (IS_ERR(reset))
		return PTR_ERR(reset);
...
}

Because the first request was never released using devm_gpiod_put(), will
the second devm_gpiod_get_optional() fail with -EBUSY and fatally abort the
probe, breaking backwards compatibility for older platforms?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-move_perst=
_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com?part=3D2
