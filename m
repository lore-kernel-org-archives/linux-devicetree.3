Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3653A33C198
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048317; cv=none; b=mlM54sRCrzvj5q3E+nDCkVPqqxjFUtebJOhRCf+28JZ929tLF56+UPuDUwOzV6TKLlcBSt08QQ272HwCk5GoryemZD3hslT2UB9Z977Wp5wXMWCrSheR28327y8PyQA5xBdm7ll5KDSAMIv5sqUnBJFpsWp6zKZayXFZRkjij9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048317; c=relaxed/simple;
	bh=0y5Jjt+5nSUYlI3yVJzfwtNcln4P7dD9yk/nGUQ/oNI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mYXwh5e6WkZgzz5WYroUjUVXpEuPT9c80p6fh6CexgvhkQsoSwkYarXvoY7ueFxN9LEGaX2LbvfKC/bKXTJ3VAP18RRHtGFZCAaMy00z/TohKRIum9MWFqoga3xrTOBsl45bIUTI4EArGOQABBfL/diIBVYa2RfunbsFLAGrCJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gioqRQxN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gioqRQxN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7984A1F000FF;
	Thu, 10 Sep 2026 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048315;
	bh=IjlU1nCia0x9PvV8GFM7OB9ZRC7zWCIOVS+oMiXBR9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gioqRQxN2WC2QXGX0jCshT/nHmY7y3Ub7qBThQoQbEU23Hi+XHtHs8BszzpxSPSu2
	 2v8p++8RuNZZ7pgDmfBkUjfyobFiexIf78FkW4nurPg0nNQStePU+iRvfn7mMf0WRu
	 g205W7TdFfywQEqXNXMFt/QSYCPv2n2QpDdRVh5+Xag8aS26ucdbuY4pvuKKu1iwzv
	 93LmF2o2voGeEmah1LBQkZ1w90mMfErsfyWVaNIlx3kB1a3pirXh1IL3bsc4DC5NpM
	 Kw4F7t8DF8nWj+fjAmx0OWOxXNbw5BbEsG/Tw9AWlxWcSMotlxbsqldPzYi+LdKssP
	 lw8l7KSyF6Yfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 26/34] arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs
 to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-root_port-v1-26-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-26-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:51:55 +0000
Message-Id: <20260910135155.7984A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message explicitly claims that `phy-names` is moved t=
o the root port nodes, but it is only removed from the controller nodes and=
 never added to the new locations.
--

commit b066c836beffb04b20d0daeb1e52c04c33f8e062
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs to root port node

This commit moves the PCIe PHY and perst/wake GPIO properties from the root
complex node to the root port node for sm8150. It also renames perst-gpios
to reset-gpios to match root port bindings.

> Move phys, phy-names, perst-gpios, and wake-gpios from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow board-=
level
> overrides, and renaming perst-gpios to reset-gpios to match the binding u=
sed
> in the root port context.

[Severity: Medium]
The commit message states that phy-names is moved to the pcie0_port0 and
pcie1_port0 nodes, but the property appears to only be removed from the
parent nodes and never added back. Could this omission cause a regression
during initialization if the driver or PHY framework strictly expects this
property to be present?

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 74df5cd86f04f..d75f714632872 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi

[ ... ]

> @@ -1901,22 +1901,20 @@ pcie0: pcie@1c00000 {
> =20
>  			power-domains =3D <&gcc PCIE_0_GDSC>;
> =20
> -			phys =3D <&pcie0_phy>;
> -			phy-names =3D "pciephy";
> -
> -			perst-gpios =3D <&tlmm 35 GPIO_ACTIVE_HIGH>;
> -			wake-gpios =3D <&tlmm 37 GPIO_ACTIVE_LOW>;
> -

[ ... ]

> -			pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;
> =20
> +				phys =3D <&pcie0_phy>;
> +				reset-gpios =3D <&tlmm 35 GPIO_ACTIVE_HIGH>;
> +				wake-gpios =3D <&tlmm 37 GPIO_ACTIVE_LOW>;
> +

[Severity: Medium]
Should phy-names =3D "pciephy" be added here for pcie0_port0, as indicated =
by
the commit message?

>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;

[ ... ]

> @@ -2019,10 +2017,6 @@ pcie1: pcie@1c08000 {
> =20
>  			power-domains =3D <&gcc PCIE_1_GDSC>;
> =20
> -			phys =3D <&pcie1_phy>;
> -			phy-names =3D "pciephy";
> -
> -			perst-gpios =3D <&tlmm 102 GPIO_ACTIVE_HIGH>;
>  			enable-gpio =3D <&tlmm 104 GPIO_ACTIVE_HIGH>;

[ ... ]

> -			pcie@0 {
> +			pcie1_port0: pcie@0 {
>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;
> =20
> +				phys =3D <&pcie1_phy>;
> +				reset-gpios =3D <&tlmm 102 GPIO_ACTIVE_HIGH>;
> +

[Severity: Medium]
Similarly for pcie1_port0, was the phy-names property accidentally dropped
during the move?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D26
