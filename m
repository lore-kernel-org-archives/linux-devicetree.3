Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB87383304
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778558557; cv=none; b=LetQLiuubR1cbv41dza5GrylI7kXAdP6BG8wJOfvqtSBZRhFeDKhNzeL+fLkPMKs192S4tBXVzx+jR5vonOqpuwCHY6NcBCW3e5QeOeiB/Kpb29Oo3bnDYOAudSlx/E9dbCv3qnZ7xdMD528EcOca3fO+eJeLZlks7NZrV4shNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778558557; c=relaxed/simple;
	bh=lDdA1Qq5kNrKnuXgc3yp27H/G+QedPZ8IvtLVcc7QWU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GvqLpLPTBKU7IeeoUrR7YMeD0jEpnqZ769wAMWfF2P8DXb0F3iEEMODh/xssxAzxMVNkX5trZT74ZwEo+zuIxFArQtik/L6gpS5q8YA9dEtV7qh3rwuaxvvCgUTx81yKugrDvf+dnMjy/z4KyRKGwcd8nAAM6i53C0UR/X6wT08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSJBHOWd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSJBHOWd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F46C2BCB0;
	Tue, 12 May 2026 04:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778558556;
	bh=lDdA1Qq5kNrKnuXgc3yp27H/G+QedPZ8IvtLVcc7QWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qSJBHOWdlNIrF7ljzjH/R7cnzz/1QLhOsWP24XdMGeG24qRYwZvt16UVO5WBcg2mn
	 cOmEH+CfXhY8Iyi4yd78iglEEizUVn7Lg3jU2mL/IRn0z8I2op1XcG1Yij0M4WeYvr
	 DKZec3NMHZipf89kzMnKntb3hKK43Ej4cNjqVWSbN7q67NAvwV7HdK3jYJPp49UiSV
	 mpe/f18o4jgvYyvP2xHcMhRGi4FiG/+DURljD66LaKB/9LonCsDucBIn9vu2JxuLpz
	 3cuy2J3eZ3M+u4QDbArQJQa9g39hOyfTdFUdQRttSi+wu3EIw+IBbp3OPjW7APQBln
	 tboLRVuYQXkpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe
 ports
Reply-To: sashiko@lists.linux.dev
To: "Andre Heider" <a.heider@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511111116.1109643-6-a.heider@gmail.com>
References: <20260511111116.1109643-6-a.heider@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 04:02:35 +0000
Message-Id: <20260512040236.96F46C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `vpcie3v3-supply` property is incorrectly assigned to the to=
p-level PCIe host controller nodes (`&pcie1` and `&pcie2`), which will caus=
e a `dtbs_check` schema validation failure.
- [Low] Grammar and phrasing errors in the commit message.
--

commit 2a8e8221b4fb4ddc072a4a8a753e3e9b7e8f1d06
Author: Andre Heider <a.heider@gmail.com>

riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports

This commit enables the two PCIe controllers and their PHYs for the
SpacemiT K1 MusePI Pro board. The PCIe ports are routed to the M.2 M-key
connector and the PCIe slot, and fixed regulators are provided for the
3.3V supplies.

> Enable the two PCIe controller along with and their associated PHYs. They
> are routed to the M.2 M-key connector and to the PCIe slot.

This isn't a bug, but there's a typo in the commit message. The word
"controller" should be plural, and there is an extra "and" after "with".

> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/=
boot/dts/spacemit/k1-musepi-pro.dts
> index 9c90c2817ecb7..2d3e30f0bd806 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts

[ ... ]

> +&pcie1_phy {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie1_3_cfg>;
> +	status =3D "okay";
> +};
> +
> +&pcie1_port {
> +	phys =3D <&pcie1_phy>;
> +	vpcie3v3-supply =3D <&pcie_vcc_3v3>;
> +};
> +
> +&pcie1 {
> +	vpcie3v3-supply =3D <&pcie_vcc_3v3>;

Does this cause a dtbs_check schema validation failure?

According to the SpacemiT PCIe device tree binding schema, the
vpcie3v3-supply property is strictly defined under the patternProperties
for the child PCI bridge node. The top-level host controller node
specifies unevaluatedProperties: false and does not define vpcie3v3-supply.

> +	status =3D "okay";
> +};
> +
> +&pcie2_phy {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_4_cfg>;
> +	status =3D "okay";
> +};
> +
> +&pcie2_port {
> +	phys =3D <&pcie2_phy>;
> +	vpcie3v3-supply =3D <&mpcie_vcc_3v3>;
> +};
> +
> +&pcie2 {
> +	vpcie3v3-supply =3D <&mpcie_vcc_3v3>;

Is this redundancy added to work around an existing issue in the SpacemiT
K1 PCIe driver?

The driver currently fetches the regulator from the root controller device
instead of the port node, but duplicating the property in the device tree
violates the bindings.

Should the driver be updated to parse the child node instead of duplicating
the property here in the root nodes?

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511111116.1109=
643-1-a.heider@gmail.com?part=3D5
