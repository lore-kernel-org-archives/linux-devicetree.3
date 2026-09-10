Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ECC490BED
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048114; cv=none; b=gbvN257xpFzv3UyUt4kAYWVNwoVGJclRDZ1L6cdD/idfY2BspyWlvbNeS3hze8THx9UXzcPDEid7qJRlME0rpVUPcOfFb2pzfkCavKFMRtmB3s/15IOf0WnKnN5h8kCUb5F/lStWij7FTtGYD0wC8HsePWBwEOsBjF8+ys8ji7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048114; c=relaxed/simple;
	bh=R6+MsLqtAHUYXV3aJ/qVJg+bhpaAk4c5UrQmfsv9Hrw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bJZrhcbIlGv+KbmaK0h6XaVenixSg3M3rIUxmf2zL7UREWG3zkKsHxbTKOTNJN6dDfj8pPWAtIY+tlKG9fpoB7HM595WyROGD9wq9OXC6iuu14T0cM0nR0JRNtelSueGjFoosAWdsOywMw46klJijRE6luCSOD49fneyu59rmGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jw3Y9sU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jw3Y9sU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8211F000FF;
	Thu, 10 Sep 2026 13:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048112;
	bh=gByiNwbYyHciSrIM5Nz45rbSrCJcLq09d0DpYTPU6wI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jw3Y9sU2kFImtMTGKais0wyz3HCF385PqWtohl4tUi26lLv/vSP7ikE2vVHAENglL
	 D6lxNlKLrCWIYSlPIXR3ngVrW0oH/M2TvzuEowlGYQ987YiwcKRIyuAtZpQmUgSW3M
	 IvjxzGcKEn+1i1aQy0Eb7S2dvTbWqlVM3mOGcpNU11LE1GM4EiKTMbwREr92oosK5T
	 Kfkl1Nu0Z21Q0FYVvcWjVve0XSG7jpLam+SEr6MsKCBUyvOO+4EaFmzVAaYs9wCRNq
	 vzWUNDDL0Ofi0yzcHjU2TkVR5X87BjWaaAwlE4A0yu2yEbQI3apHyr9CkhH7vAMxK1
	 E78ofI7cih/XQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 24/34] arm64: dts: qcom: sc8180x: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-root_port-v1-24-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-24-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:48:31 +0000
Message-Id: <20260910134831.AE8211F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to move both `phys` and `phy-names` to=
 the root port nodes, but `phy-names` is deleted entirely instead of being =
moved.
--

commit fb102e85b305ac3a25a018843f8ea1cc8f87f980
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs to root port node

This commit moves PCIe phy references and GPIO properties from the RC
controller node to the root port node. It drops phys and phy-names
from the controller node and adds phys to the root port node.

> arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs to root port node
>
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding

[Severity: Medium]
The commit message claims to move both phys and phy-names to the root port
nodes, but phy-names is deleted entirely instead of being moved.

While dropping phy-names is technically correct and safe (the
qcom,pcie-common.yaml DT binding marks phy-names as deprecated and
explicitly states it is not required in the root port node), the commit mes=
sage
is factually inaccurate.

Could the commit message be updated to document the intentional removal of =
the
deprecated property rather than claiming it was moved?

> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/=
qcom/sc8180x.dtsi
> index de1b72b64d960..a85e3211958d1 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -1779,17 +1779,17 @@ pcie0: pcie@1c00000 {
>  					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
>  			interconnect-names =3D "pcie-mem", "cpu-pcie";
> =20
> -			phys =3D <&pcie0_phy>;
> -			phy-names =3D "pciephy";
>  			dma-coherent;
> =20
>  			status =3D "disabled";
> =20
> -			pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;
> =20
> +				phys =3D <&pcie0_phy>;
> +
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;

[Severity: Medium]
As noted above, phys is moved to the pcie0_port0 node in
arch/arm64/boot/dts/qcom/sc8180x.dtsi, but phy-names is conspicuously missi=
ng,
contradicting the commit message.

[ ... ]

> @@ -1898,17 +1898,17 @@ pcie3: pcie@1c08000 {
>  					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_3 0>;
>  			interconnect-names =3D "pcie-mem", "cpu-pcie";
> =20
> -			phys =3D <&pcie3_phy>;
> -			phy-names =3D "pciephy";
>  			dma-coherent;
> =20
>  			status =3D "disabled";
> =20
> -			pcie@0 {
> +			pcie3_port0: pcie@0 {
>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;
> =20
> +				phys =3D <&pcie3_phy>;
> +
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;

[Severity: Medium]
The same discrepancy applies to pcie3_port0, where phy-names is also omitte=
d.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D24
