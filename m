Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792638514;
	b=Py9ZZiFKLUNFAEK7lvDCNfrZIireLND5RfhF5wsrW9bmQXD+6tYc6TdbbdAcFtsceGmc
	 cAXIiHEH5Okw23eEsE7wmzxdEP458/lpSnWqlQ8YTP8ilQWmPt56UeaETkLPHQX+nmIQn
	 NgRUJ52oy5uShulbpDk3xNLsDL92zNRN5fCx5fQktcG8WY/wzD3qJBPyL6VPgNMVNTbhX
	 cIJHnax6PNuBMnlW2fxAENclgLsiY5BjORbHPbUZKqsQBNbr8iWvPY0fm+wlqn1jQ7Tmo
	 yBHImBO7KSR4sNkRk5GSJrNtPUrEa8iSKMVg1s4nRz5AV8AEKs9wSAkkJsSTtL2gYxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792638514;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TZLnrJvIVHep1yirZV3cGs4vHwcxgjz1i7Kd9FHEzUw=;
	b=u400Nlboiminv1TobON5lBCK2sVwAIZ9SHLlthgbe1GqKECd6RRFjaqv26s5nwg9SaDM
	 XCsWw5g8305dzegcpnL1tUE3Aa/ImWCNhFBv+jEM//wh0+lrxN9C6jPdv4ti2CT0U33I3
	 ZpTJPKOq0FtOwktEKA2keJtsPZktG4WDvvWMGvQIFOfkghaVcZPz5XTGW/Ds2Aq/9B1BO
	 HzhyMkoegzi3uyy+RwykMakWwkvbYo7V2aTaCcoTzBJyVe1nCsmohmnhJ/8/0mrkkSk3l
	 mEfPwPdloywDhgI24PlvotNB9Yzq3AAUpCdMRz6VZjnMlmG6OU8JcTeKihTBIjXZz/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oDIt+628;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F92606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oDIt+628
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7471F000C1;
	Thu, 22 Oct 2026 03:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792638513;
	bh=TZLnrJvIVHep1yirZV3cGs4vHwcxgjz1i7Kd9FHEzUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oDIt+628TPgJCtcwojjwktnROicdQet9MIl/BaKtuaLk8zKseut260OzO/rPsXlmJ
	 he+HrriH4N5oLCTbYQk4ZnJ4s83UsRCOCdMAEMVfvwQfxkvmeM/xyIrxbMK4azPNgG
	 q8KmroJVpdiTHTAP3bFzWAk3C+pktYB6TVEzjI0yctLlQ+/giRu5aoLNStZm0pu807
	 LpVAHs2wN9MOSR6kWuTG7PF1scT1HVWPyq+mPwEld2nwAqVQf0G79gyXHUucZ1R3bv
	 9jZqc793DgurT6Uk0jkZH8lWCp5UocZitF6okt5I+HnWuvwPkufjCs/Nqpw78DCwJL
	 y23cqjDMFN16w==
Message-ID: <sashiko-outbox-180897@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/3] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022025844.150320-2-coiaprant@gmail.com>
References: <20261022025844.150320-1-coiaprant@gmail.com>
 <20261022025844.150320-2-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 03:08:33 +0000
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
- [Medium] arm64: dts: rockchip: undocumented rockchip,rk3568-xpcs compatib=
le in rk3568.dtsi
--

commit b8b1e0bef5d9409b92ce95305440fbc54a7eeb87
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

This commit adds the Synopsys DesignWare xpcs node and two 125 MHz fixed-cl=
ock
nodes for the gmac interfaces to the rk3568 SoC device tree.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 2f42bf26fd9bf..b1ea84ba86e40 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi

[ ... ]

> @@ -110,6 +124,15 @@ sata0: sata@fc000000 {
>  		status =3D "disabled";
>  	};
> =20
> +	xpcs: ethernet-pcs@fda00000 {
> +		compatible =3D "rockchip,rk3568-xpcs";
> +		reg =3D <0x0 0xfda00000 0x0 0x200000>;
> +		clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +		clock-names =3D "csr", "eee";
> +		power-domains =3D <&power RK3568_PD_PIPE>;
> +		status =3D "disabled";
> +	};

[Severity: Medium]
Does adding the xpcs node (ethernet-pcs@fda00000) with compatible =3D
"rockchip,rk3568-xpcs" in arch/arm64/boot/dts/rockchip/rk3568.dtsi cause a
dtbs_check regression for rk3568 device trees?

While the commit message notes that dtbs_check skips required property chec=
ks
for disabled nodes, scripts/Makefile.dtbs invokes dt-validate with -m by
default:

scripts/Makefile.dtbs:
    DT_CHECKER ?=3D dt-validate
    DT_CHECKER_FLAGS ?=3D $(if $(DT_SCHEMA_FILES),-l $(DT_SCHEMA_FILES),-m)

When running dtbs_check on any rk3568 target, dt-validate checks compatible
strings on all nodes regardless of status =3D "disabled" and fails because
"rockchip,rk3568-xpcs" is not documented under
Documentation/devicetree/bindings/.

In addition, the upstream DesignWare xpcs binding in
Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml and platform
driver in drivers/net/pcs/pcs-xpcs-plat.c (xpcs_of_ids[]) only match the
snps,dw-xpcs* compatibles:

drivers/net/pcs/pcs-xpcs-plat.c:
    static const struct of_device_id xpcs_of_ids[] =3D {
        { .compatible =3D "snps,dw-xpcs", .data =3D &xpcs_generic },
        { .compatible =3D "snps,dw-xpcs-gen1-3g", .data =3D &xpcs_pma_gen1_=
3g },
        ...
    };

Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml also restricts
clock-names to "csr", "core", and "pad" (without "eee"), requires reg-names
("direct" or "indirect") for memory-mapped instances, sets
additionalProperties: false, and does not define power-domains or phys, nor
does drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c handle pcs-handle.

Should the "rockchip,rk3568-xpcs" binding schema and driver support be added
before introducing this node and enabling it on boards such as
rk3568-photonicat.dts?

> +
>  	pipe_phy_grf0: syscon@fdc70000 {
>  		compatible =3D "rockchip,rk3568-pipe-phy-grf", "syscon";
>  		reg =3D <0x0 0xfdc70000 0x0 0x1000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022025844.1503=
20-1-coiaprant@gmail.com?part=3D1
