Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AC24D7D34
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076982; cv=none; b=JK68Xr1OLLMWCpBzCO9M65ZgEOIdJDDIpmEidoLABG5aSfQrGlnMC0YV7PedgCdmu1dSWwgfXTHnENVdJ/fYxvMdjqo23jfb48obRRblqI4hJoy0scWupRXLlnqZDzpnnH+OhbTQ1n5jfOsNVkHkIp4hwr8VBy6ou55H3jHeStc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076982; c=relaxed/simple;
	bh=d2ujMj7C5JNVkzpQ3U1q4ldfEeoQO4EoFWB6gzvc6Ds=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SBArYd+a+iAsRzczdWxLMmkhUPh0ECU90DBI/0anYW2HUv3M8Mllxfwtrsn3EZn0ZPZzDZyMwPSnmGbgvdtgG4Zk9EBygcGXndfagIiuagWTCAEL+a3uMT7vX/x/n1GlW95uyHpdHiMdsPf169prHP0iR111eCzhqu9fxVs/qQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZtez0Nt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZtez0Nt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523591F000C4;
	Thu, 15 Oct 2026 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792076981;
	bh=xGcehrLxJqjlAkxdSHI6Z1+68gxTdemagEsIhVmjqpk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZtez0NtVC/NHk6GROa/acTGMs0YXaN9y0dbqVqL5et1Z4tL6hXaWymyHTT+NSZlu
	 IAeZ6Sv+4xYmQkRaRPniqhytZMRyhG9qGEuhspDj83jMosvIzEPifTXRYvKJzhd8hC
	 QnEhH7SZARwAVaUcWU/yFRtbMAHzO8jAHwb/RcyPgDEZVUOrh9roS3o7V8+hOczqoA
	 MR0CMv3P1wMUiUuvVi2pUUmpdM61e9Zfw1MPkKV47UkIUGIsQnsnWKIx8Y4xusoHoG
	 Ma1oI0sUoNNlQZJCc/yMJdDso2I8bi8cdjgLgJVa0pRdXLQedSIpF1JtW12ktPXMwn
	 DlzUPilO2lg7g==
Message-ID: <sashiko-outbox-173039@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/3] arm: dts: altera: add Draeger M48 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015145804.3632839-4-petko.manolov@konsulko.com>
References: <20261015145804.3632839-1-petko.manolov@konsulko.com>
 <20261015145804.3632839-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 15:09:40 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: stmmac: missing snps,dwmac-mdio compatible breaks MDIO regist=
ration
--

commit d908833e7bbbda78aeaec54305a0979e4a84551f
Author: Petko Manolov <petko.manolov@konsulko.com>

arm: dts: altera: add Draeger M48 CPU Module

M48 is a heterogeneous board made by Draeger that is based on two independe=
nt
cpus. This commit adds the device tree for the Altera SoCFPGA Cyclone 5 bas=
ed
CPU module of the Draeger M48.

> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48=
.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> new file mode 100644
> index 0000000000000..314930a52de58
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

[ ... ]

> +&gmac0 {
> +	status =3D "okay";
> +	phy-mode =3D "rgmii";
> +	phy-handle =3D <&ethphy>;
> +
> +	mdio0 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +

[Severity: High]
Does this node need a compatible string to ensure the MDIO bus is registere=
d?

Looking at stmmac_of_get_mdio(), it searches for the MDIO bus by checking if
the MAC is compatible with snps,dwc-qos-ethernet-4.10 or if the MDIO child
node has compatible =3D "snps,dwmac-mdio". Since neither condition is met,
stmmac_of_get_mdio() returns NULL.

Later in stmmac_mdio_setup(), because phy-handle is defined, the legacy_mdio
fallback evaluates to false and mdio_bus_data is left unallocated. This
causes stmmac_mdio_register() to return early without registering the bus.

Would adding compatible =3D "snps,dwmac-mdio" to this node prevent the ethe=
rnet
interface from failing to probe its PHY?

> +		ethphy: ethernet-phy@0 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015145804.3632=
839-1-petko.manolov@konsulko.com?part=3D3
