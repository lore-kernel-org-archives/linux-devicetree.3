Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5B52D6E64
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240646; cv=none; b=jKZuLHF1WpMsyfk/RhvK10NYD7gx9k1mPCoAMucXLlOojgOZtVM3G/EOk3jvKDWl34wTDpZOdaUfrZDx/ZGV+GMOCFmOFM/WgM9nRwjYxnZ15KtZI2oYGGfqcJSDbblNGzkMgMz10SIMyGm0dTGzgl3UGAepqUImursu9JQcR4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240646; c=relaxed/simple;
	bh=Wo2tr705mrDU8Nn9MECvnoetbnC+Edcu8XuNYUVThE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=URJpUnrYWjrG8Pw84j+OajI0MQPr1B7ciRpzXJ2bRhCbG03RLklIMz7LIFhSlNmnbnmap7CXUYX1tzadFHVia/Ss4MC8i2hFhG/qwR9zWBMqu9XZHvL6kDSBSGxHnVgFn87PT9fEV2KWOGSeWLkHLE+fbkbgF2KK7Ew5SUL/Ctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEW61f+B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEW61f+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E491F000FF;
	Mon,  5 Oct 2026 22:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791240645;
	bh=FaVoiu5O72EdIEV4wf6c0hf6TczSD9voh+00V2dj3sY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mEW61f+BC0BUZ8NR+vB50z3N8mLZ2E2P5M8YHzzr4veKk2wWnaJuQvbAvPvFPCFDb
	 98TYK72L8rXcauDNn4/0Zufb9RoUOnC7cYFW+M/oK2xCAVFjCiJVBOmlx0h8pUBlrD
	 LZZC6EQ9JtRsRbF5hrFm767y9Og7lxbl7Suj6zlLKLUrgUxyLwHbVhf8suBORfWXOe
	 +lkZSAc0WV72rxGuAFDMc7zzSU0ov6J5wkZa5jI7m7bWV43OCNvUzzV/HSSrxvUl0w
	 MYfKW8Z/tmYjyTZfxaC5Sutugv9Z303e6EF/nr7z+pxo3Ej/1ugPp2ZJTvYR8buqBk
	 NkR7Gh5IvDiJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261005224008.1140250-2-coiaprant@gmail.com>
References: <20261005224008.1140250-1-coiaprant@gmail.com>
 <20261005224008.1140250-2-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 22:50:44 +0000
Message-Id: <20261005225045.11E491F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: rk3568-xpcs compatible and sub-nodes break driver pro=
be
--

commit 14866edde455974144845fb966151f552d75c4c8
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
interfaces via its four MII ports. Add the XPCS device node and
its pcs-mii sub-nodes to the SoC device tree.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..2cea108b31a4e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
[ ... ]
> @@ -110,6 +124,37 @@ sata0: sata@fc000000 {
>  		status =3D "disabled";
>  	};
> =20
> +	xpcs: ethernet-pcs@fda00000 {
> +		compatible =3D "rockchip,rk3568-xpcs";

[Severity: High]
Will this compatible string prevent the platform driver from binding?

The rockchip,rk3568-xpcs compatible string lacks a generic fallback to
snps,dw-xpcs. Without it, the platform driver (pcs-xpcs-plat.c) will not bi=
nd,
causing the stmmac MAC driver to fail to probe (stuck in -EPROBE_DEFER)
since it cannot resolve the pcs-handle.

> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		reg =3D <0x0 0xfda00000 0x0 0x200000>;
> +		clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +		clock-names =3D "csr", "eee";

[Severity: High]
Is the eee clock undocumented in the binding schema?

Including the undocumented eee clock will cause dt_binding_check validation
failures against the snps,dw-xpcs.yaml schema constraints.

> +		power-domains =3D <&power RK3568_PD_PIPE>;
> +		status =3D "disabled";
> +
> +		xpcs_mii0: ethernet-pcs-mii@0 {
> +			reg =3D <0>;
> +			status =3D "disabled";
> +		};

[Severity: High]
Will this sub-node topology break xpcs_create_fwnode() resolution?

The upstream driver registers its single MDIO device using the parent node's
fwnode. If pcs-handle references this sub-node, fwnode_mdio_find_device()
will return NULL, preventing the MAC driver from resolving the pcs-handle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005224008.1140=
250-1-coiaprant@gmail.com?part=3D1
