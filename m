Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9FA476067
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785864015; cv=none; b=TPsyo7upxEaxYMyumiMV7s+108FTD6sCh8KkxSG15Hsr3W8kYNxsehEY8PbOR0f0Pa5kSL5a5/baUxRo4Dn9FF+YQ6DN7SifMRMJfL0FCfT10XH3W9Z0+ZR/u9WQO7fCJN+yzt5A3k7F9D8WdNFNRUOzAYeCk08WZVafFQTz5Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785864015; c=relaxed/simple;
	bh=Z1xhaQP7TlVytHmKlY+Vr+kppy0K4EtEOvhjh7NXr1Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pZvvsWTW/s2iHMfCui/Jg2T/qGy6cWnFx+EoCxlwlhb19Lrgf04SPROzt0cGB3hXx2xeEppTmFcm9rd2Q7t5I7KpeDCyZfIo/qoIITBKBrquFQ/IcXYlY3wXB93cLCczqMbO78A30Vmkt6z7H7T8OXvFnRYCY2o3b3wMkNDFvsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iqe40Uxy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iqe40Uxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57D01F00A3A;
	Tue,  4 Aug 2026 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785863999;
	bh=Y3PoCRdBk3TzPftRwQqEMwpyFoXR8whPC4Z03872MeE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iqe40UxyAcIvil3PZYXbXXNtqsKlj7SPIqMT3t2VOwt3p5bnwxm8WipJ2grLXE6dQ
	 7/4BdX7P/aBwP7mWkTqZpq+R4PRsEzslVycUeHuHoAoVgrAcvxxd80oxoGfgdcXjRI
	 VvhgIbRA8Cmhb3n4woGE2KvYS8vVcmadVQDG11IGXAU1tImys/BRzo+HEhCrDzllz/
	 CtFjRF94FHnClGJaplOGlfu95lmgImh62iG5o5UcGFLwvxmPSsnZJn5XNNYb526jBR
	 gjZsOiYhLUS2I5nnOI58t4Bsm76XXdUp54LGp3Jodh9mRJ7F6iI3uzMBlirZP/Ce2g
	 QlSB8qVgX7uuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 05/11] net: mdio: realtek-rtl9300:
 Configure hardware polling during probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803171853.507506-6-markus.stockhausen@gmx.de>
References: <20260803171853.507506-1-markus.stockhausen@gmx.de>
 <20260803171853.507506-6-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 17:19:58 +0000
Message-Id: <20260804171958.E57D01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] notify_phy_attach aborts phy_attach_direct() for PHYs unmapped to =
switch ports

Pre-existing issues:
- [High] Hardware polling corrupts software C45-over-C22 MMD access sequenc=
es at runtime
--

--- Patch [5]: [PATCH net-next v12 05/11] net: mdio: realtek-rtl9300: Confi=
gure hardware polling during probing ---
commit b348a1eaa3ac89042c8633ae18e01b3be6294f9d
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Configure hardware polling during probing

During PHY probing and configuration complex configuration sequences
might be issued and firmware might be loaded. Hardware polling can
interfere badly with that. This patch disables polling for all ports
when the MDIO driver starts, reenables it after the PHY has been
attached, and disables it just before the PHY is detached.

Link: https://github.com/openwrt/openwrt/blob/main/target/linux/realtek/fil=
es-6.18/drivers/net/mdio/mdio-realtek-otto.c#L818
Link: https://lore.kernel.org/netdev/680696024a8648535ce6dee771fe4de67802e0=
e8.1769053496.git.daniel@makrotopia.org/

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 1873928b362dd..210e570c09732 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -582,6 +591,33 @@ static int otto_emdio_9310_setup_controller(struct o=
tto_emdio_priv *priv)
>  	return 0;
>  }
> =20
> +static int otto_emdio_notify_phy_attach(struct phy_device *phydev)
> +{
> +	struct otto_emdio_priv *priv =3D otto_emdio_bus_to_priv(phydev->mdio.bu=
s);
> +	int port =3D otto_emdio_phy_to_port(phydev->mdio.bus, phydev->mdio.addr=
);
> +
> +	if (port < 0)
> +		return port;

[Severity: High]
Are PHYs unmapped to switch ports handled correctly here?

By returning a negative error code (e.g., -ENOENT) instead of 0 here, it
looks like it will cause the generic phylib attachment sequence to abort.
A MAC driver calling phy_connect() for an unmapped PHY on the bus will
hit this when otto_emdio_phy_to_port() returns -ENOENT, leading
phy_attach_direct() to fatally abort the attachment and fail to bring up
the network interface.

Should this return 0 instead to allow non-switch PHYs to attach properly?

> +
> +	return otto_emdio_set_port_polling(priv, port, true);
> +}

[ ... ]

> @@ -611,6 +647,9 @@ static int otto_emdio_probe_one(struct device *dev, s=
truct otto_emdio_priv *priv
>  		bus->write =3D otto_emdio_write_c22;

[Severity: High]
This is a pre-existing issue, but can the hardware polling engine corrupt
software C45-over-C22 MMD access sequences at runtime?

Since this patch re-enables hardware polling for a C22 PHY in
notify_phy_attach(), the unpaused hardware polling engine can interleave
with the 4-step software C45-over-C22 sequence used when phylib falls back
to standard C22 writes. This could overwrite the MMD address/data registers
(13 and 14).

Would it be safer to temporarily disable the hardware polling engine across
multi-register C45-over-C22 transactions in otto_emdio_write_c22() and
otto_emdio_read_c22() to prevent race conditions?

>  	}
>  	bus->parent =3D dev;
> +	bus->notify_phy_attach =3D otto_emdio_notify_phy_attach;
> +	bus->notify_phy_detach =3D otto_emdio_notify_phy_detach;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803171853.5075=
06-1-markus.stockhausen@gmx.de?part=3D5
