Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C8048A8A6
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284382; cv=none; b=PHM4OwWzH7VQtBHhdPaLHwxIDpjEvVOWSMZWaarVBuquozqEExYup6um8z89pqw3OxGCVZGlaXmO1WipH8moGAk4TL0z+eIeSe94cP6SE7+lB3/nsSP93mczVsp1J16mcjyPM1NXnYMhwCdymx/WlsIJLWK9LEI14HtGRAmBZYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284382; c=relaxed/simple;
	bh=PuZ500aaEO9rjMR7xmLzWcZvQxxzGG/cp4p/AmoBlMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QMzAzVor8/MqhA3aCKZD1eiEcK0YzTKY4be/VPXRhxepw1KWvmFC++zVNsBpe/bjywqfSZRzNDotM04mxBtNf+ClPOXZY0CkbxTBdt6Mhm0BzK+0KGi0CfB36S0c1tvNXtf9TQ+fz3WGWbEsO0LbTPjPE8gteks5BsdGsakDcWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQ4T49uC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQ4T49uC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294E01F000E9;
	Tue,  1 Sep 2026 17:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788284381;
	bh=1AoVYjEFCIVvrgtak/C4e9BIgZfFKMgRCus3HAneAEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SQ4T49uCIOKjZhyI00F7C6EjplZDjyLE5+cH4Gnh+DM1OoNPyluuRY9NrIkAnCirl
	 nYfqjDd/75yn2lzO1TB4f4ClcLFdTb4BPSeLl4rHiG19TpHRxYQX5xA7AlZObpeVDr
	 Q/lLXuhhCdt9hJqFFEzcn174Cmh5OD13KmEsJVCVXVjhvbv9I/Z5k5CCkuuYeAoSwC
	 RuJbOE37vNnKCUg/KPBIJKvxNqXMXKkP5TYl82XcV46+pMFhes9lw33vqrbzpYVL5L
	 zbz67FXuGRDBXZUOaiiZUksZJObs6FbGP8qFbtyFDwvwUkO2xrwweGnIyb61HrMl7P
	 Vqwmn+zV/Xjpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: qcs6490-rb3gen2: use pci for
 device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901172058.1512508-2-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-2-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 17:39:40 +0000
Message-Id: <20260901173941.294E01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Conceptual Flaw / False Premise: Renaming the node does not prev=
ent it from being treated as a PCI bus because `device_type =3D "pci"` is s=
till present.
--

commit 3cd795cb2f33ffae376d5bceb9ba0da490602d05
Author: Alex Elder <elder@riscstar.com>

arm64: dts: qcom: qcs6490-rb3gen2: use pci for device nodes

This commit renames devicetree nodes from pcie@ to pci@ with the intent of
stopping the embedded PCIe endpoints from being treated as PCI buses by the
devicetree parsing code.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/bo=
ot/dts/qcom/qcs6490-rb3gen2.dts
> index a13315bf0fb07..99a985a177a61 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -954,7 +954,7 @@ pcie@3,0 {
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
Does this node rename actually prevent the devicetree parsing code from
treating it as a PCI bus?

The commit message indicates that renaming the node away from pcie@ will st=
op
of_node_is_pcie() from matching it. However, because this node explicitly
specifies device_type =3D "pci", of_bus_pci_match() in drivers/of/address.c
will still return true immediately.

When evaluating buses, of_bus_pci_match() checks:

    of_node_is_type(np, "pci") || of_node_is_pcie(np)

Since the device type is explicitly "pci", the match succeeds before
of_node_is_pcie() is evaluated. Should device_type =3D "pci" also be remove=
d to
actually prevent this endpoint from being treated as a PCI bridge?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901172058.1512=
508-1-elder@riscstar.com?part=3D1
