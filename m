Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9C1D514E
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284957; cv=none; b=fYNSeSP4fQIu2ZzqrYSIFUkR/1cmrKbYM3xXgzBoMhWgI2auD1tlabi4XimuQLMYC/yWVBC9B50qxNGodYsNcrcYiKc+EpyYOtzhJdw7u3rqmGThW2o+0SowiMlWOfweNvZEzUwXPkUf9oRCDWyhl3B/49odjIU+6d7YWCE5b7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284957; c=relaxed/simple;
	bh=pbNv1uBSenGi8AbVnZDxpWAjeu4LLKPxeT074sFJ3VQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DH/rd84QtOywX7pFqIVpANXjcLzQ2yCtdS9HfQO9JPNQQXXsnmy7j4jR4oUFjhq3CaOBsa486O05Vyl+f8u2Epm6tvRDLDVEYX8oxTHGJEafZw2FFoOuJK82uWKf3BOMxPDOMzMwp5nisfXTE5I6DsCy7ASQ+hN9teRnL66WiWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDlFPLER; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDlFPLER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2641F000E9;
	Tue,  1 Sep 2026 17:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788284956;
	bh=w3GTn2ImUbF82qm4IPmVnKjJT/QDdgXylAyiQWKuRH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dDlFPLERM9KF8DTwurOGmqBzFhzrPIoejOXTgkJMujIhpdVMJA76WJ54iIlsFe/+U
	 YaRVaij0Czfdz10vVIwk1QKUe7EaA2+y+L6z3yVKhG7RmdfDOq6Yrq/UDq4u1Lbrbc
	 AApKpYun9dWBqovtpYfruSjJidzyDk398hMRsupPgtb09yzSgRT0/kH4fE6PxVnfnd
	 m597DvMXDK4pk8LIwZ94Mj9UsrGPitYfY+mNUy7+6hE+kGf/rm/BwXAyB6gKrUj9h5
	 1R7G5sb8V0X53iLDfhXd6vfF+ciWaEfGgx5iXA9Z8TeC1ti/uNChGrKIIjTg9/Cm5D
	 FM8YAFTlCknqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: lemans-evk-ifp-mezzanine: use pci
 for device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901172058.1512508-4-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-4-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 17:49:15 +0000
Message-Id: <20260901174915.BC2641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Ineffective Bug Fix / Logic Flaw: renaming nodes fails to preven=
t them from being parsed as PCI bridges
--

commit a26d89db10179b360a293aeb14a12f49b7daf216
Author: Alex Elder <elder@riscstar.com>

arm64: dts: qcom: lemans-evk-ifp-mezzanine: use pci for device nodes

This patch renames the PCIe endpoint nodes from "pcie@" to "pci@" in the
Lemans EVK IFP mezzanine devicetree. The goal is to prevent the devicetree
parsing code from incorrectly treating these endpoint nodes as PCI bridge
nodes.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arc=
h/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
> index 6cfa0bc1440e9..22c975628ed79 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
> @@ -271,7 +271,7 @@ pcie@3,0 {
>  			ranges;
>  			bus-range =3D <0x5 0xff>;
> =20
> -			pcie@0,0 {
> +			pci@0,0 {
>  				reg =3D <0x50000 0x0 0x0 0x0 0x0>;
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				device_type =3D "pci";

[Severity: Medium]
Will this rename successfully prevent the node from being matched as a PCI
bridge?

When the devicetree address parser matches the bus type, it iterates of_bus=
ses
and calls of_bus_pci_match() which checks:

of_bus_pci_match() {
    return of_node_is_type(np, "pci") || ... || of_node_is_pcie(np);
}

Since this node still retains the device_type =3D "pci" property,
of_node_is_type(np, "pci") will evaluate to true immediately.

Does this mean the of_node_is_pcie() check is completely bypassed, leaving =
the
node still incorrectly matched as a PCI bus? Should the device_type =3D "pc=
i"
property be removed from these endpoint nodes instead, as required by the
devicetree specification?

>  				ranges;
>  			};
> =20
> -			pcie@0,1 {
> +			pci@0,1 {
>  				reg =3D <0x50100 0x0 0x0 0x0 0x0>;
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				device_type =3D "pci";

[Severity: Medium]
Does the same logic flaw apply to this node as well?

Because the device_type =3D "pci" property is also still present here, it
appears this node will also unconditionally match as a PCI bus in
of_bus_pci_match() regardless of the rename.

>  				ranges;
>  			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901172058.1512=
508-1-elder@riscstar.com?part=3D3
