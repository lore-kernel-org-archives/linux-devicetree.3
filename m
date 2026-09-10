Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9493E49F12B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048006; cv=none; b=hKUh17oTMTL2cZ3i7mqfVYqCnQTVWPZlWuIvR3t6utzcBI3rHKEWdYHQoClRfj+ZiKyApAVvPJNbfX97cJ643+ZKjy+hdtx6zUOBWo3qpaBODBjb+CCRbGHd3PeZPzfGJBk8Xb2ftAKlIweqBAG93hq2wvhFrbwd/Vdc++K74TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048006; c=relaxed/simple;
	bh=3RI6yQ8vVKf2iZ96IVUivVrjzGaUSpDLahvxshI3mo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J427u50aJ2yJi/vazTeLgH89iZXflgXCw21yvQzee4SpBqLwErtNg328KZfa45f6jHhMKWH0VtZMMZ1ZZUOFEA4Aj6vjKFtjnvHCLG9eSWjQHVsg+LB6KBgYDxcVqQeYZyuDuKi87E9EeANSmIve4WbVdZ5esVxx9ebb2ZI8QWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+ikwNc7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+ikwNc7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58D71F000FF;
	Thu, 10 Sep 2026 13:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048005;
	bh=jkY4f14FSFgsWUuEOL04q5vhLYqAyuPrCfEQDR5l/AA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R+ikwNc73dEElNaH/I1gLzc5CgRJLBBQN1LJ8iCJtkd6bQOZc5J1LuMgtd8dJMxGa
	 mmEf0bs54WftS8lCA5kkXBGXHZPlGQZS1Px1qpqVe8sFltELt0NYsO5rFFk/pMss8S
	 nTC2xdzKE49bsNoPedsnsWHDHomneJ+sDAgAkN2/gPlGTyiE9LcLgZvXb5Co9H7Xu3
	 pkUsqLeyPOzXDLUHwANiVmipa2nIOYrBznC6s3vNviG6R1XsusJdK7o9P3yIsRmAfM
	 SAphBe8elbDBSO8kV1MvirlXJJD+n7bvVMxOFHMqyQCqVkCBtDlnS/9LM4+GosqHkh
	 6iXRIcSq7p38w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 23/34] arm64: dts: qcom: sar2130p: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-root_port-v1-23-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-23-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:46:44 +0000
Message-Id: <20260910134644.D58D71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message falsely claims that the `phy-names` property =
is moved to the root port nodes, but the implementation entirely deletes it.
--

commit 4afbaa887d3731fc2a6a1eaf2a71527f5f0835ef
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs to root port node

This commit moves the PCIe phy reference and the perst/wake GPIO properties
from the RC controller node to the root port node (pcie@0). The commit
message indicates that both phys and phy-names are being moved to allow
board-level overrides.

> diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts=
/qcom/sar2130p.dtsi
> index a2d93fd682997..678ecda1c99a3 100644
> --- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> @@ -1337,9 +1337,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> =20
>  			power-domains =3D <&gcc PCIE_0_GDSC>;
> =20
> -			phys =3D <&pcie0_phy>;
> -			phy-names =3D "pciephy";
> -
>  			status =3D "disabled";
> =20
>  			pcieport0: pcie@0 {
> @@ -1347,6 +1344,8 @@ pcieport0: pcie@0 {
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;
> =20
> +				phys =3D <&pcie0_phy>;
> +

[Severity: Medium]
The commit message states that both phys and phy-names are moved from the
controller to pcieport0. However, only the phys property is added here.
Was phy-names intentionally omitted, or should it be included to match the
commit message?

>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;

[ ... ]

> @@ -1464,16 +1463,15 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> =20
>  			power-domains =3D <&gcc PCIE_1_GDSC>;
> =20
> -			phys =3D <&pcie1_phy>;
> -			phy-names =3D "pciephy";
> -
>  			status =3D "disabled";
> =20
> -			pcie@0 {
> +			pcie1_port0: pcie@0 {
>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;
> =20
> +				phys =3D <&pcie1_phy>;
> +

[Severity: Medium]
Similarly for pcie1_port0, the phy-names property was removed from the
controller but not added here. Should phy-names also be added to this node
to remain consistent with the commit description?

>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D23
