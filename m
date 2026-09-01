Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1C943C7C4
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284054; cv=none; b=e446D1nPvzeLdgpLK92Nmosl3DM29HgEq7BujGUBHOwc1xIRsv3e9ZE0DcGfgKw5YpqFBAjHr3BxtC/t73jd3ie+pZ4Y/ouJcJmmmOSoZxUr3GYqHkbZSp5KQIWtgyuXG7alTNdP0NoqSLbZwzLy0ugc5Y2MHwOxAZn3Fmls8l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284054; c=relaxed/simple;
	bh=9Ycks8xv9vWrZVeBoY18PWTXJdv74c4xmUYzzLqVZpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=efk40DYo1cGmLcrvtcWqjg1XGgq6NEFyScPWWrlCEXzbqvit78crmDla5hxOmeXh08K2YJ3BWt+NpkHpOWgsQl2MJaoFBiCfUKqaK4E4RN7+Qp12YVUpW/ZX7c+21TAEXBbM277yvwM/aW5MkArDxCA6I2ScwYI6YBR2+GZHcMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMPPhnHF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMPPhnHF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239581F000E9;
	Tue,  1 Sep 2026 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788284052;
	bh=nlNOxe7SghCRrGFgqnurQXRDhNEuvjIYNsScRKT0YhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fMPPhnHFccJWzW9Hwobu5IVzvZLCfXJfOXTNMgPcbiOmRPbeLAWEauDGLXTbCB3kR
	 kASo7W9mp4X6u38pHQwBz2Lsc7guILmCK98TsIDCVnb5v83TT1hq4Rrco9iI2skwSB
	 i1bZ41JWnGHHBbRXm9ijE9RCE7VVMLLqwpjCQKby1z5SDEtjiU2b0DS5G6UFhb2wIi
	 w6upuuXEX2tTte5IiVORQyIt/k9UvciNbz6z7LaQbTbVh6ClGaBfuMTdvnoVCAMdtu
	 Uts+QiKpzZAXtW6m1OYuJsPY9i/G2N6aO7mXcSuxhBKzexiSkGCAUo0+z6CcinGeGi
	 LsyJJkuI8402Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: use pci for device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901172058.1512508-3-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-3-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 17:34:11 +0000
Message-Id: <20260901173412.239581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch claims to fix PCIe endpoints being incorrectly treated a=
s PCI bridges by renaming them from `pcie@` back to `pci@`. However, this i=
s a placebo fix that fails to resolve the issue because the nodes still ret=
ain the `device_type =3D "pci"` property.
--

commit 8f05438af7136e29082530fe0089fb496985289a
Author: Alex Elder <elder@riscstar.com>

arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: use pci for device =
nodes

This commit renames embedded PCIe endpoint nodes on the TC9564 SoCs from
pcie@ back to pci@ to prevent them from being incorrectly treated as PCI
bridges. The commit message states that the previous name pcie@ caused
of_node_is_pcie() to match them as bridge nodes.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanin=
e.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> index 46bb52c667a4d..14c64439ae1e6 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
[ ... ]
> @@ -130,7 +130,7 @@ pcie@3,0 {
>  			ranges;
>  			bus-range =3D <0x5 0xff>;
> =20
> -			pcie@0,0 {
> +			pci@0,0 {
>  				reg =3D <0x50000 0x0 0x0 0x0 0x0>;
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;

[Severity: High]
This is a pre-existing issue, but does this rename actually resolve the
problem of endpoints being treated as PCI bridges?

Looking at drivers/of/address.c, the devicetree match logic in
of_bus_pci_match() is evaluated as:

    return of_node_is_type(np, "pci") || of_node_is_type(np, "pciex") ||
           of_node_is_type(np, "vci") || of_node_is_type(np, "ht") ||
           of_node_is_pcie(np);

Since the endpoint node retains the device_type =3D "pci" property just bel=
ow
these cells, of_node_is_type(np, "pci") evaluates to true. This short-circu=
its
the condition before the of_node_is_pcie(np) name check is ever reached.

Because of this property, will the nodes continue to be matched as PCI buses
even with the name changed to pci@0,0, making this a placebo fix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901172058.1512=
508-1-elder@riscstar.com?part=3D2
