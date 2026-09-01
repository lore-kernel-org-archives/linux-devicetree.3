Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA8549481F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285791; cv=none; b=TDgDau29yCDZP2u6BVM+LAgT9g3z5vqkTejmZk+afBuRvgyEsQEX8fyWlEWSbH0m+T2sP5iiXQxCpSc8rgGq2jNSwq7CnDLT2jivkqeYd90rNSe0/oH+7pVL0sl/wz5tFo2qSzP1FBTMIO/HIt0ZXZZAJdxj/dxGHj7kN4QgrY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285791; c=relaxed/simple;
	bh=evr3/DQmU4KCyqKh25Q+se+CzVMOdZYSDsjlC/31ce4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qciXXvxUtRaIBvNC74NtdhhlpyKnq6M/cLxqciVEko1yUQfQcI5V+FWzpSKmHAiM+OSfN+KRrWw286r38boZEiGMlYUX/4ZON7UZ850SL1jrkHFcVCaUMf54kYhrOPpEFJRwXs8sEIgCcLwgqhMMgY08eS3umngUnYurvEce4ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrFvwuGT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrFvwuGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642271F000E9;
	Tue,  1 Sep 2026 18:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788285789;
	bh=nS0Yg4VjFDDBL0R0+8zu5K2H1nWszNnZSo3V7EDaGZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FrFvwuGTpFbfwkJz67kKpeIPlMsXOEXyMsG37syXZWjZE6a6m7GeGK3/Fx0KISIHo
	 ASZwku9kLi58W8WXThwpF3guMDylPv6NTbcLmqk9nbifb3Cqitrh6YTRJyPlvVAdGc
	 KoB717eLnIqIxlVaWpiWWKFvIqva4GxE5jg0RTkYibHExYSHbUKOEjvVc3iTs+XQ98
	 JdEI6ddIVEU5yrQj2orKmIRMXJHvOeUOCtOpQhZTkT4jnZVLGRUnDDtcgNHR+Q++DU
	 uVFR2lN9hgM9B4y8heJyBnwt5Rq60kWU58iLJHvD1puaf//UkS6GboIt3rlBWXQCg4
	 Xb6dIwU+jnFEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot:
 use dev for device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901172058.1512508-6-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-6-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 18:03:08 +0000
Message-Id: <20260901180309.642271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit claims that renaming PCIe endpoint nodes from `pcie@`=
 to `pci@` prevents them from being incorrectly treated as PCI buses by `of=
_bus_pci_match()`. However, this fix is logically flawed and entirely ineff=
ective because the endpoint nodes still contain the `device_type =3D "pci"`=
 property. `of_bus_pci_match()` checks `of_node_is_type(np, "pci")` before =
checking the node name via `of_node_is_pcie(np)`. Because the `device_type =
=3D "pci"` property is present on the nodes, the match short-circuits and e=
valuates to true unconditionally, bypassing the name check. As a result, th=
e endpoints will still be treated as PCI buses, failing to restore the desi=
red `default-flags` bus behavior.
--

commit 1271b9698d89ac8a7e9afe5810c933ffba016f7f
Author: Alex Elder <elder@riscstar.com>

arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: use dev for device nodes

This commit renames the PCIe endpoint nodes from "pcie@" to "pci@" in the
Thundercomm AI Mini PC G1 IoT devicetree. The goal is to prevent these
endpoints from being incorrectly treated as PCI buses by the parsing logic
in of_node_is_pcie().

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dt=
s b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> index 31bafa2cf51db..183ac59ca7d49 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> @@ -790,7 +790,7 @@ pcie@3,0 {
>  			ranges;
>  			bus-range =3D <0x5 0xff>;
> =20
> -			pcie@0,0 {
> +			pci@0,0 {
>  				reg =3D <0x50000 0x0 0x0 0x0 0x0>;
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;

[Severity: Medium]
Does this rename actually prevent the node from being treated as a PCI
bridge?

The commit message states that renaming the nodes to "pci@" stops them from
being treated as PCI bridges by bypassing of_node_is_pcie(). However, these
nodes still contain the property device_type =3D "pci" (visible just below
this diff context).

During devicetree address parsing, of_bus_pci_match() in
drivers/of/address.c checks the device type before it checks the node name:

drivers/of/address.c:of_bus_pci_match() {
	return of_node_is_type(np, "pci") || of_node_is_type(np, "pciex") ||
		of_node_is_type(np, "vci") || of_node_is_type(np, "ht") ||
		of_node_is_pcie(np);
}

Since of_node_is_type(np, "pci") evaluates to true, the match short-circuits
and succeeds unconditionally, bypassing the of_node_is_pcie() check entirel=
y.

Will these endpoints still be mistakenly treated as PCI buses despite the
name change?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901172058.1512=
508-1-elder@riscstar.com?part=3D5
