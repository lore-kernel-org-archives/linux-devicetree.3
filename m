Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738626;
	b=lljkQUiW7WPg0Ee+LGeqOmZCAk7AEQOxd4IVcQ8/1jvlmCf6lkwpES0HUGALoMnOEYRE
	 KKXZ72d2A228D7hL51v2XKST6zybPHGnP2iThPmbFNwLyhU7Hw+BPPQ8TUYKrzGGDwxeu
	 9kiGX2VXCf1Kp3HnxMylpSipFB5I7q+4aprgejT/7A6ibakG0H/gZ4ZfwKnqtr5H2is/t
	 ChPm2hBPYVdN+0pVNa2cbyjeN4vdO/Kepm0Y7lVsE0eBoOQpMC6yoWxtNA6XqXFD/Zqv/
	 lc8/z1qen6GtBjgKHqNngfMstGXC5OJ0gcujkDVuXVXq5IuzfeqYBXowRD8pLd/9TwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738626;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k73WObciCibEL0dFPLpwFEkVxUaMsw6Ku04tVagi3ME=;
	b=P9qSD6i13C9FESr8EFGdZ9ur4V5vsA8erAI7zPESfwvU8Uwd6CGYYUYkD4dqzaR6GJSP
	 cWLeKG9/MTf5Mt4Yd0eAH1cSeeJ6ZxUPmM6x83HykwLsiJ30o2S1dHMQUYb3jF6ShOpVq
	 +TWUQ1jKO5cM3XTxvMVRF7G3zmQKe30vhhUSJ+no/T1KdHJrWpg9EeVtDDdaDGPRRckVc
	 23yRS3DnlQEbx1EkyJlR7p3ZRyYk9GMeVpiIALNlbNFAqtrBTn5d5V07drXtsDItyM/XM
	 UN+ca1hm7nbWmgxcgjw7F034wOe15GSHLyzBeo2jdWPERfhCFWbJ2Ta9oGrg1oCnpYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvN9rQp2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99299606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvN9rQp2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3B41F000C1;
	Tue,  3 Nov 2026 20:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793738626;
	bh=k73WObciCibEL0dFPLpwFEkVxUaMsw6Ku04tVagi3ME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YvN9rQp2MKvTsgzOIN44P2kmifkPOxCE9BVDgnMV+CPHzqM4pI20DpnuoMFIALnH3
	 /+QuoK0KlyIplUMKFb6d9mBHs5td4BKSuo6QSvsaD+9ZPhH4SKdnwDA/Yhn90uTgrz
	 be4S00H5W4V3XvojsmH75hnMkJKUfS2Y4zoLPoOAUCBOxocyG8i9idUqrn3qppZSAL
	 Qq8fcCliGzfAn8AxYQ1SDSVpG3+bXeyspZqnn6Q7OYPx7wwgIlioRHjW+d4r+CUBaa
	 zmF+Q2CFU4VbNk9/e/av2uhh7vI92TXYpkgqhs8rvvs+Nd6IVWphHG7SqEKlc20Mig
	 GL71oO1fGmu1A==
Message-ID: <sashiko-outbox-196007@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] ARM: dts: aspeed: x570d4u: Give unique names to MAC
 address nvmem cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Renze Nicolai" <renze@rnplus.nl>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103203308.54789-4-renze@rnplus.nl>
References: <20261103203308.54789-1-renze@rnplus.nl>
 <20261103203308.54789-4-renze@rnplus.nl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 20:43:45 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ARM: dts: aspeed: x570d4u: invalid underscores in nvmem cell node n=
ames
--

commit 48dfc9aa6b8fe87b8ac64b7c75b8d6bd5fea2a5f
Author: Renze Nicolai <renze@rnplus.nl>

ARM: dts: aspeed: x570d4u: Give unique names to MAC address nvmem cells

This commit renames the two MAC address nvmem-layout child nodes in
aspeed-bmc-asrock-x570d4u.dts from macaddress@3f80 and macaddress@3f88 to
eth0_macaddress@3f80 and eth1_macaddress@3f88.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
> index 6e7e3e7ec1019..fca14320829e1 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
> @@ -233,11 +233,11 @@ nvmem-layout {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> =20
> -			eth0_macaddress: macaddress@3f80 {
> +			eth0_macaddress: eth0_macaddress@3f80 {
>  				reg =3D <0x3f80 6>;
>  			};
> =20
> -			eth1_macaddress: macaddress@3f88 {
> +			eth1_macaddress: eth1_macaddress@3f88 {

[Severity: Low]
Does renaming these nodes in nvmem-layout to use underscores introduce dtc
W=3D2 warnings and violate the Devicetree coding style?

Per Documentation/devicetree/bindings/dts-coding-style.rst, node names shou=
ld
use lowercase letters, digits, and hyphens (-), whereas underscores (_) are
only meant for Devicetree labels. When building DTBs with W=3D2
(-Wnode_name_chars_strict), check_node_name_chars_strict() in
scripts/dtc/checks.c rejects underscores in node basenames:

	if (n < node->basenamelen)
		FAIL(c, dti, node, "Character '%c' not recommended in node name",
		     node->name[n]);

Also, does the name collision described in the commit message actually occur
for DT-defined cells? In drivers/nvmem/core.c, DT consumers resolve
nvmem-cells phandles via of_nvmem_cell_get(), which matches by device_node
pointer rather than cell->name:

	cell_entry =3D nvmem_find_cell_entry_by_node(nvmem, cell_np);

And in sysfs, nvmem_populate_sysfs_cells() includes the offset and bit_offs=
et
in the attribute filename, producing macaddress@3f80,0 and macaddress@3f88,=
0:

		attrs[i].attr.name =3D devm_kasprintf(&nvmem->dev, GFP_KERNEL,
						    "%s@%x,%x", entry->name,
						    entry->offset,
						    entry->bit_offset);

If distinct node basenames are still desired here, should hyphens be used
instead (such as eth0-macaddress@3f80 and eth1-macaddress@3f88)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103203308.5478=
9-1-renze@rnplus.nl?part=3D3
