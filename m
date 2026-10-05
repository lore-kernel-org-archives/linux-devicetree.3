Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A106374A0E
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240575; cv=none; b=HjhwiQvj1sndT4vIUE+FwEFa/o+s33ctWJ/PURefb/DLUKS0CfLTcdi+o6qsPnij/zqInXIm6nnNxTbhVhw1N9t4b1lutGWcLvg4bbvZjBQJUZJukrmXvL9pZ/xqMvOiRV8HEzO8eiK1TaPadGcH8l4pTbey3Prp9h/RSSztp+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240575; c=relaxed/simple;
	bh=aXs0SIufecLRTf6oJn1cR3MHBqW97dW0NoQPr/8ogYs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l3wp4kuu5m349uWzCpF1dsb83TZvjC/sbbRMJxUtUAnDAkxajrubDlBLwQ+QVAvO2Q7/JzjcZzMDqTJZB3812g01oxJO5XLux94LpNgDKblFIePzCSqpS+MJIETbx4OK1FeRCeeIp+fHCxbrltb/bBf+mOrHIfZvG3EyCrQHfvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1WiWOWh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1WiWOWh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EA21F000FF;
	Mon,  5 Oct 2026 22:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791240574;
	bh=OEsaQgomoiRlVSi2UxUUwKZkE5b8cqwms6U7UYp0PqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J1WiWOWhiCvl60hYjjM2A5gTaC3C83NlQWmfVMjZxQR/ZNzzuPLwrisgRcTsrmoHk
	 WSxZGaftjLhuCLJWxJaEdTHhj6e19iDLgb7w321qwJ05nmZZqltRtl9DfIm6Ibp9bS
	 wi6iKe2vHONX41r77COJ2FrVmAJvh9tjkLvnS1yZwAp6cBhP5VYMTxH4n0XxxblSzQ
	 9Z+HU3974L342UHeFN4pTAk3gqnUD5bK5ZU0YpvsbiA5/j8OP5/IP/GRT5ZGMKskjy
	 1g+bcqlsvBJtuFtI5yXXx20KgQ6tG7Nalc2KNE/7gHcdK+iR5O6M37+3o8sxr722HN
	 oG1ZlyEJQD3NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] arm64: dts: rockchip: rk3568-photonicat: enable
 SGMII LAN port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005224008.1140250-3-coiaprant@gmail.com>
References: <20261005224008.1140250-1-coiaprant@gmail.com>
 <20261005224008.1140250-3-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 22:49:33 +0000
Message-Id: <20261005224934.26EA21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: stmmac: infinite probe deferral due to unsupported XPCS compa=
tible
- [Low] dts: undocumented and unparsed property rockchip,sgmii-mac-sel
--

commit 3f0b676bf5c1cf7b3503051c6c41df786bf6f4a2
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

This commit enables the Motorcomm YT8521SC Gigabit Ethernet PHY connected
to GMAC0 via XPCS SGMII on the Ariaboard Photonicat. It adds MDIO
configuration, enables the XPCS nodes, and configures combphy2.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/ar=
m64/boot/dts/rockchip/rk3568-photonicat.dts
> index 58c1052ba8ef3..fdaa4a2a4328b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
[ ... ]
> @@ -241,6 +242,7 @@ &combphy1 {
>  };
> =20
>  &combphy2 {
> +	rockchip,sgmii-mac-sel =3D <0>;

[Severity: Low]
Is this rockchip,sgmii-mac-sel property properly documented and supported?

When running make dtbs_check, this property appears to trigger a validation
failure because it is not defined in any mainline binding (such as
phy-rockchip-naneng-combphy.yaml).

Since there is currently no mainline driver that parses this property, could
this just act as dead code that breaks device tree validation?

>  	status =3D "okay";
>  };
> =20
[ ... ]
> -/* Motorcomm YT8521SC LAN port (require SGMII) */
> +/* Motorcomm YT8521SC LAN port */
>  &gmac0 {
> -	status =3D "disabled";
> +	assigned-clocks =3D <&cru SCLK_GMAC0_RX_TX>;
> +	assigned-clock-parents =3D <&clk_gmac0_xpcs_mii>;
> +	managed =3D "in-band-status";
> +	pcs-handle =3D <&xpcs_mii0>;

[Severity: High]
Will this hard dependency cause an infinite probe deferral for the gmac0
interface at boot time?

Because the xpcs_mii0 fwnode is a child of the xpcs node, it relies on the
rockchip,rk3568-xpcs compatible string. However, since there is no platform
driver in the mainline kernel that matches this compatible string, the MDIO
bus and devices for the XPCS node might never be instantiated.

When stmmac_dvr_probe() attempts to configure the MDIO bus and calls
xpcs_create_fwnode(), fwnode_mdio_find_device() will fail to find the
MDIO device for xpcs_mii0 and return -EPROBE_DEFER indefinitely.

> +	phy-handle =3D <&sgmii_phy>;
> +	phy-mode =3D "sgmii";
> +	phy-supply =3D <&vcc_3v3>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gmac0_miim>;
> +	status =3D "okay";
>  };
[ ... ]
> +&xpcs_mii0 {
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005224008.1140=
250-1-coiaprant@gmail.com?part=3D2
