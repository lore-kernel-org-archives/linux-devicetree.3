Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2BC2DECA3
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782689236; cv=none; b=JoWWKfcmzobMmPVWNzv3syJXfFQZ8nL/xvStUhVSBI6Sbnxr/pc9PV8dpBjN8P2qZjx9sYVJryWP4kkTnN7tFpkyLkNao3DTT71AVi5mddttxDJWL5sqMtz/YKV7G8oa1vNzJ+T/xuanq0hshtp3urJRWI2iaUP737A++o/n72o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782689236; c=relaxed/simple;
	bh=xj9nPLoeNSjJuC5CqFSp6+Sswn28XO7ZTdp9VxYkrZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jAt87f0LYD1JKO2V+2ZrkCKww+zAlgbhxGQqMdINh3jklyVZXIQI23UM/DZfpQjLPGT8H1pbO5+dp+IaxotwLV/TrFy/OD3UcfNqP+bQq5UnlQ3MVM3Xu1zVKemnZL1Qv1BRxSzo8k8dT+ouJtSyCz7bGxQ8u3zF8oc4GQPO0j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNzC/5Wd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNzC/5Wd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9581F000E9;
	Sun, 28 Jun 2026 23:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782689235;
	bh=UkwZgBDZdPHJqmo70MZ5WWOKiI7qMUR92zLh8zYtHus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JNzC/5WdwIUKAJsKpJIxIlk2JVyKUqUHW72kRONEy8RO+37O0AAmI1Vuua0a04FTY
	 tASf7kJZ9qn637yj2CZ8jZQrbmapcIOJ585nO1dKNfW+kGZxpGmMzUnV6HwX3DEpOC
	 rqQMvvUh+zdNSuMxbjrUp5WjpGuAG7MeH1j/efISAY3xvxKpysJi5+Zvwq0BeOn+1N
	 DxRvtDoeSPKW+t+OrvovJexYtHZrFy/ssGG/hL8jtbNknQ+x7uxeTkbDVRaEQlErUp
	 fWct0xpJPlMoJaYXXLIR2w7OiIefmceNiZwgL2+PRWz6jekHg+5uHxRp3wbi03B8oF
	 5TSgcRK+kC2Qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that
 break PCIe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260628231156.1254012-1-rosenp@gmail.com>
References: <20260628231156.1254012-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 23:27:14 +0000
Message-Id: <20260628232714.BD9581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing the PCI memory ranges from the parent `axi@18000000` bus =
breaks outbound PCIe memory mapping because the child `pcie` nodes can no l=
onger translate their addresses to CPU physical addresses.
--

commit 4f061464281d4964ce46dab60d36a09328f14862
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe

This commit removes extra AXI bus ranges that overlap with DRAM on
BCM5301X/BCM470X SoCs. The intention is to restore the original
single-entry mapping and fix PCIe routing issues.

> diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/b=
roadcom/bcm-ns.dtsi
> index 392a257136696..a1062245e5a01 100644
> --- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> @@ -95,10 +95,7 @@ L2: cache-controller@22000 {
>  	axi@18000000 {
>  		compatible =3D "brcm,bus-axi";
>  		reg =3D <0x18000000 0x1000>;
> -		ranges =3D <0x00000000 0x18000000 0x00100000>,
> -			 <0x08000000 0x08000000 0x08000000>,
> -			 <0x20000000 0x20000000 0x08000000>,
> -			 <0x28000000 0x28000000 0x08000000>;
> +		ranges =3D <0x00000000 0x18000000 0x00100000>;

[Severity: High]
Does removing these PCI memory ranges from the parent axi@18000000 bus break
outbound PCIe memory mapping?

During system boot, when the PCI core calls
devm_of_pci_get_host_bridge_resources() to parse the pcie child node's rang=
es
property, it translates the PCI memory addresses to CPU physical addresses =
using
of_translate_address().

Since the pcie nodes are children of the axi@18000000 bus, the translation
must pass through the parent's ranges property. Without the mappings for
0x08000000, 0x20000000, and 0x28000000, the translation fails.

This would cause the PCI core to drop these memory windows, resulting in
pci_assign_unassigned_root_bus_resources() failing to allocate memory BARs,
and endpoint drivers failing at pci_enable_device_mem().

>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628231156.1254=
012-1-rosenp@gmail.com?part=3D1
