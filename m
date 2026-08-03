Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C492F39A812
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785811; cv=none; b=JnfchP8/6J0zS23Bd4iZmRK2VZMMog4hwPsVmba8AzukjnMi7pB5GerL/uP+9/rHu+ORssZPo5QnXBq9Qp/ra8rWzUyl5XMsCvs8j+C+kDYPPytWt3dVoHRDeDBHc1gNAwkTsD6GE42nJlotT5hrArBcsY4fTIEudF4Hx51lZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785811; c=relaxed/simple;
	bh=mKTKOZ5cuBfYGvTMNvwI1UUefmn4Rq6vF3toZ33J6ck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TuwgoMNdLeF9DH6EGxM59SgWwqvn0mVRjmmtLAkckF0ihYWg/RLWmYJ49xMg1n0sIq26RFsgcnbM59QnD8Yk6lQx+GJQ3Iks8CuDEmUnhgoFDebjDPiiPZM2ySGoT9prRefdb7YP31yHX/sigsP04eS8+Z5Xw+fCqjgjcLjIG+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUEKBFTj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUEKBFTj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5A71F000E9;
	Mon,  3 Aug 2026 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785785810;
	bh=TkqzEoQPmuaapHUpeTmgf/QK8U3d7McZYbTDe2ACdeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUEKBFTjWXKLyblykOAkca8eZwuxfxncNrZXhW+BV92K3c1UlyctUl3fgjd112sG3
	 qTq9LJKpzV9hA98YuUs8EzWQGgDWfBsR/7JvoMJHLTKBCF46WXoHmEzPqSm+MA0ISS
	 /0fkH1gSIXVVFvwjSQgz7U7OzfStm2xKlE7uKuuKV3tvjJZwEHCvavOCSBkWV1pxfk
	 AVHN5CtM/NRQ1o+9+C4q8IPGYXVHexnOnllzpCSb8qyNeTL1i1RoTk48PbafFrLpxB
	 DIgN6mEq9kCcAzfq9QrHpKESonGoaUdPjymsXl873HcPGJONfAsMiJBovjGII1VGRV
	 etzlDsE9MNH0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy:
 add named voltage rails and deprecate phy-supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-1-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-1-c4bc688177dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:36:49 +0000
Message-Id: <20260803193650.3D5A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The device tree binding deprecates `phy-supply` in favor of new na=
med regulators `vdda-0p9-supply` and `vdda-1p2-supply`, but the driver (`ph=
y-qcom-sgmii-eth.c`) was not updated to request or enable them. When device=
 trees are updated to follow the new binding and drop the deprecated `phy-s=
upply`, the PHY subsystem core (`phy-core.c`) will no longer find and enabl=
e the generic `phy` regulator, leaving the PHY unpowered.
--

--- Patch [1]: [PATCH v2 1/6] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-ph=
y: add named voltage rails and deprecate phy-supply ---
commit 3cc6ac4d3b35571e8657dd8e304e3f7c33b822ec
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add named voltage rails and=
 deprecate phy-supply

The Qualcomm SGMII SerDes PHY has two distinct voltage supply rails. This
commit deprecates the generic 'phy-supply' property and instead adds two
specific named supply properties.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgm=
ii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmi=
i-phy.yaml
> index 90fc8c039219c..e573abcb937df 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.=
yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.=
yaml
> @@ -35,6 +35,17 @@ properties:
>    phy-supply:
>      description:
>        Phandle to a regulator that provides power to the PHY.
> +    deprecated: true
> +
> +  vdda-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to the PHY, which draws a peak
> +      current of 46 mA.
> +
> +  vdda-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to the PHY, which draws a peak
> +      current of 15 mA.

[Severity: High]
Does this change cause a functional regression when device trees are updated
to follow the new binding?

When device tree authors update their nodes to use vdda-0p9-supply and
vdda-1p2-supply instead of the deprecated phy-supply, it appears the
regulators will remain unpowered.

The PHY subsystem core (phy-core.c) looks for the generic phy-supply during
phy_create(). If it is missing from the device tree, the core will not
enable it.

At the same time, the corresponding driver does not seem to have been
updated to fetch and enable these new specific regulators:

drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:qcom_dwmac_sgmii_phy_probe()

Should qcom_dwmac_sgmii_phy_probe() be updated alongside this binding to
request the new regulators (for example, using devm_regulator_bulk_get()),
so the PHY doesn't fail to initialize when phy-supply is omitted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-b4-sgmiiet=
h_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com?part=3D1
