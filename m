Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058A48CD61
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285286; cv=none; b=UPSijAQmcCia0GxMziQ3L9iaee7eT495fPanWEoRvnZfvtc6s1Wa0R8/jWN+NVrGTOlyUjzhMHWD7gh1V/tMpc0AW31yNTBHFCA2loPhpgJIKFmt2foj9Q28/xYtGsfIyd7tJ9u6+owC/7LW2HuAhZoFiwjnsx4SzyeINTj+QXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285286; c=relaxed/simple;
	bh=uLrR/f5oAb0vRs6T755GRgwAQRzw/jQ+P/8y01j/HZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P+3BIoWRhS0E5MDjJMbh8xkw/pNcbIKW8/QdL9wOBb4sn2Y5TdcaLOshh3F+96gi9SjIBHUf41J7Dx7hYsDDG+lr9R3q9Y3Doq+tLMWbT4NqEYJE9JhDdDhIEqH5dqM8rtukkBfnj6BjqQAtWCB5oBWwnKYATmxhpyMUC6/FaQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeUSwD+C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeUSwD+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0142A1F000E9;
	Tue,  1 Sep 2026 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788285285;
	bh=X3U0IAgQVr7ayyXSOX1k2TChCtL8hjXTPV+jCfrfcs4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aeUSwD+CeAGCapumPyG9ApQbYkkFq6CQxokD2nJk5M/XUuz3TCmSqcFPb/Obt1DQp
	 2Vp1FoACAxU1A8CPlDYhuAZAqNCIgd3MD0SFf5k/GxJL/2ueykzvv2UkXkzFqDMyb1
	 TfvzoIRoa/NAByRSAHIOHqcXzuwdkVscWCcS+YpIm3BDZHrMZmhkJNyT8Ng1AAzVfS
	 Rj569rNfG48c0ti4evZJd59ZV7vO2hl9PYPsqe9rLi77vjIc54hbK8iV8Pxd1uGK4A
	 yUQZ9fIIxfICnyqPZwXtiktfX3iR0AZSUV0AN2eoCHWBoVPle9Nq4lfTRsUU7QrFGw
	 PZpzF5n7IEygg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: monaco-evk-ifp-mezzanine: use dev
 for device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260901172058.1512508-5-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-5-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 17:54:44 +0000
Message-Id: <20260901175445.0142A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Mismatch between the commit title and the patch implementation r=
egarding the new node name.

Pre-existing issues:
- [High] Renaming the endpoint nodes from 'pcie@' to 'pci@' will not preven=
t them from being treated as PCI buses, because the `device_type =3D "pci"`=
 property is retained.
--

commit c206fa07d8c746582b6a4894fa608acb472261eb
Author: Alex Elder <elder@riscstar.com>

> arm64: dts: qcom: monaco-evk-ifp-mezzanine: use dev for device nodes

[Severity: Medium]
Does the commit title match the implementation? The title explicitly mentio=
ns
using "dev for device nodes", but the patch renames the nodes to "pci@",
not "dev@".

This patch aims to fix an issue where embedded PCIe endpoints were
incorrectly treated as PCI buses after being renamed to pcie@. It
renames the nodes to pci@ to restore previous behavior and avoid
them being mistaken for bridge nodes.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arc=
h/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> index ca5bf0fe5ec6e..a6e57ec8a1e14 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
[ ... ]
> @@ -117,7 +117,7 @@ pcie@3,0 {
>  			ranges;
>  			bus-range =3D <0x5 0xff>;
> =20
> -			pcie@0,0 {
> +			pci@0,0 {
>  				reg =3D <0x50000 0x0 0x0 0x0 0x0>;
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				device_type =3D "pci";

[Severity: High]
This is a pre-existing issue, but does renaming the node to "pci@" actually
prevent it from being treated as a PCI bus?

The node pci@0,0 retains the device_type =3D "pci" property. When the devic=
etree
address parser matches buses, of_bus_pci_match() in drivers/of/address.c
evaluates the type before checking the node name:

drivers/of/address.c:of_bus_pci_match() {
        ...
        return of_node_is_type(np, "pci") || of_node_is_type(np, "pciex") ||
                of_node_is_type(np, "vci") || of_node_is_type(np, "ht") ||
                of_node_is_pcie(np);
}

Because device_type =3D "pci" remains present in the endpoint node,
of_node_is_type() will still evaluate to true. Will this cause the node to
always be matched as a PCI bus unconditionally, rendering the rename
ineffective at restoring the default-flags bus behavior?

This same question applies to the pci@0,1 node modified later in the file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901172058.1512=
508-1-elder@riscstar.com?part=3D4
