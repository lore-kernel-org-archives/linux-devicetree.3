Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F933BE659
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273340; cv=none; b=k12FF/EWM/L+e3mRRmCuuz6YNR7xyEsMasqox/Y9l3L3PvaNi4ggBQIdRp4D/ZMjmrx+eAt0xfDB6wynqcCl0xLPPpi4mU3Jg342cfvBSGRhV2ZThz9eOY7zHP7J0eQwdJ5vay20GRyalfu8QOSBJOzVbRe0778cWJZ3931TBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273340; c=relaxed/simple;
	bh=Wkzs1rHlOQtexok00zLT2bhLqxopAC6vIkLX9EUbyc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NnDbd+Ayl7D9crRNMHOAInXA5OGYKrUzJpK+gFh9Yg4aUyD3PeGtejlGiCDVQmbrBOn2t3Iz3Td9oKx6257CY+gPbB0tO8deFcEXdSqiFJUAjahmnO3pK7Pc1bchGzjxMWK5QwZ35BVQtcaevMQ5vbsgF0ZUs2KrXbXuIkvfqQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bvw5YQFo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bvw5YQFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF5A1F000E9;
	Tue,  1 Sep 2026 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788273338;
	bh=97iyyjB0jDoHb/cp24/w1dT2URUTYSuCg6VCOoA1XRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bvw5YQFoJ9gbgqt2AEEWID5BcTQv88PT/8AxIvZs3Qg5UfyMXsz6rxdYv6BV3RPZH
	 Oo827Q7vtsx+U8gnCrmc8LbcbpbSDDN85VO5/9RGIdujb0CCSvNdhC5/yKpnxSNhzH
	 GayusXP7ifnSkRrJrTPu3STCHkCMSX7612qQ08MZRHKc/EDM6FixchDl3nDzzM+PV3
	 XsStzKwt19GXjd3fmtRXqJWTXthzRqIAAU2iGlny5Phr/bSaw7wjI3bJPCUuK1+/cB
	 sjCTW0IysYFgrVjxdMVwZrOfwVds+2Lc6zegYzImTmf2CKcLUQvNVtXm48nuVCYr1m
	 ltYmTSGURFoaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 10/13] net: mdio: realtek-rtl9300: Open up
 C22 and C45 space in parallel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260831143439.2404484-11-markus.stockhausen@gmx.de>
References: <20260831143439.2404484-1-markus.stockhausen@gmx.de>
 <20260831143439.2404484-11-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 14:35:38 +0000
Message-Id: <20260901143538.9FF5A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] MDIO bus read and write operations incorrectly return non-standard=
 error codes (-ENOENT for unmapped ports and -ENXIO on NACK), which causes =
the MDIO core to fatally abort bus scanning and registration.
--

commit be85adee2936e783b98939418cafee8c47a996b5
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Open up C22 and C45 space in parallel
   =20
Until now the MDIO driver supports either access to the C22 or to
the C45 address space of the PHYs. This is due to the fact that
the polling configuration favours one of the address spaces and
limits access to the other space. E.g. when polling is set to
C22 most of the C45 space can not be accessed.
   =20
There are however some exceptions from that. EEE register access
is allowed independently from the polling mode [1]. As the
downstream driver already allows parallel C22/C45 access [2] do
this in upstream too.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index ae7ba86e90b9a..b90972c1dc6a2 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
> @@ -688,13 +688,10 @@ static int otto_emdio_probe_one(struct device *dev,=
 struct otto_emdio_priv *priv
>  		return -ENOMEM;
> =20
>  	bus->name =3D "Realtek Switch MDIO Bus";
> -	if (priv->smi_bus_is_c45[mdio_bus]) {
> -		bus->read_c45 =3D otto_emdio_read_c45;
> -		bus->write_c45 =3D otto_emdio_write_c45;
> -	} else {
> -		bus->read =3D otto_emdio_read_c22;
> -		bus->write =3D otto_emdio_write_c22;
> -	}
> +	bus->read_c45 =3D otto_emdio_read_c45;
> +	bus->write_c45 =3D otto_emdio_write_c45;
> +	bus->read =3D otto_emdio_read_c22;
> +	bus->write =3D otto_emdio_write_c22;

[Severity: High]
This is a pre-existing issue, but I noticed that MDIO bus read and write
operations incorrectly return non-standard error codes (-ENOENT for unmapped
ports and -ENXIO on NACK), which causes the MDIO core to fatally abort bus
scanning and registration.

For example, when a PHY address is unmapped, -ENOENT is propagated to the M=
DIO
core during a C45 or C22 bus read:

drivers/net/mdio/mdio-realtek-rtl9300.c:otto_emdio_phy_to_port() {
    ...
    return -ENOENT;
}

drivers/net/mdio/mdio-realtek-rtl9300.c:otto_emdio_read_c45() {
    ...
    port =3D otto_emdio_phy_to_port(bus, phy_id);
    if (port < 0)
        return port;
    ...
}

And when the PHY NACKs the transaction, it returns -ENXIO instead of
successfully completing a read with 0xffff:

drivers/net/mdio/mdio-realtek-rtl9300.c:otto_emdio_run_cmd() {
    ...
    return cmdstate & info->cmd_fail ? -ENXIO : 0;
}

The get_phy_c22_id() and get_phy_c45_ids() core functions translate any unk=
nown
error (like -ENOENT or -ENXIO) to -EIO. This -EIO error propagates to
__of_mdiobus_parse_phys() and mdiobus_scan_bus_c22()/mdiobus_scan_bus_c45(),
which treat it as a fatal bus error, aborting the scanning and registration
process. Consequently, no PHYs on that bus will be functional.

To comply with the MDIO subsystem and allow fallback scanning to continue, =
read
functions must return 0xffff (simulating line pull-ups) or explicitly return
-ENODEV (or -EIO, which is safely translated to -ENODEV by the core) when a
device is missing or unmapped.

Should these functions be updated to return compliant error codes to preven=
t the
MDIO core from fatally aborting bus scanning?

>  	bus->parent =3D dev;
>  	bus->notify_phy_attach =3D otto_emdio_notify_phy_attach;
>  	bus->notify_phy_detach =3D otto_emdio_notify_phy_detach;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831143439.2404=
484-1-markus.stockhausen@gmx.de?part=3D10
