Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB5139DBD6
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781436636; cv=none; b=PsO+G8hlZWkWaHhWjBL+3jF/YDoSU0p2HNC0BlNCgrAMea0lrXU9HEFzXbxP75g1XB8LseV/AnVH8ZhWpVuAhPyzMEjmrK8pyNsgjr1NXUXGldlrCBnz56zNbUNuh+W2B2ajBurg85fq/hNTNuuXZU3zgSCMXFMIpjF50/fXi9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781436636; c=relaxed/simple;
	bh=uQRv91HzIMTQ0dKzGFkbP51rV5V2seDYBiF2Udu0s7Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PB2CcnGoKTZ39uQM1hrDMB4uCWg/Ls111MAhgxC1qdwJLKQ6TI7MZQCHqLqiVKp1vRRnrzDXYYj06tk76O8iK2cUBTPSGYwb2mFvCzfE9jfgPeqzquqKRnWWNOioln5IAjDxDbSRuqLXfC6MgNBEfjl2zXZYGJPxmkfcrzFYTVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwQJQ98g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwQJQ98g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9509E1F00A3D;
	Sun, 14 Jun 2026 11:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781436634;
	bh=R3i7zgjSvDYZ6QJG5yq7IeYITLVpuh3HSzbR+MozMmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fwQJQ98gxJ5DxbFarP4Wfd2PcIElcqi3ysYoAx2P4KlYNkgFrwfPyk8yh2EiHiqs+
	 X2IjX82TaVG/TD56R1xcdZ4vgIp1xaXUwlbqH1tDcQPmQAq6qaba4AO7MBR0flSZDu
	 JLH5OFl5oCdyh/kxFW5C1Ts4D2+u3hLjpQ/ohMrclg9QuDUNr8t8u/0+jBATpaj5t6
	 lqWw5twFLyN2Lze34iirzoBKY5dIHNLjNUlLtCNUiWUBcxq2E7nmg0pq9ARxFSW7mp
	 WHiHVeOtUfy4Omos1QTQD8q1pj0xOd6NoJU4mKFWOsmembf9MxoqKDB/+Kv7v2i1sD
	 m32cRaNkz9Isw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 8/8] net: mdio: realtek-rtl9300: Add support
 for RTL839x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260613112946.1071411-9-markus.stockhausen@gmx.de>
References: <20260613112946.1071411-9-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 11:30:34 +0000
Message-Id: <20260614113034.9509E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing RTL8390_PHY_CTRL_PARK_PAGE initialization corrupts PHY BMCR
--

commit af49d45856a275a9bfebf688b76101516b5e946d
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Add support for RTL839x

The MDIO driver is prepared for multiple device support by adding
required bits for the RTL839x (aka cypress) series. The hardware
shares features with the RTL931x series, including 8192 pages and
7 MMIO registers.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index d9ff0b0aecbb1..2ab1aeb85eedb 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
[ ... ]
> @@ -457,6 +480,62 @@ static int otto_emdio_8380_write_c45(struct mii_bus =
*bus, int port,
>  	return otto_emdio_write_cmd(bus, RTL8380_PHY_CTRL_TYPE_C45, &cmd_data);
>  }
> =20
> +static int otto_emdio_8390_read_c22(struct mii_bus *bus, int port, int r=
egnum, u32 *value)
> +{
> +	struct otto_emdio_priv *priv =3D otto_emdio_bus_to_priv(bus);
> +	struct otto_emdio_cmd_regs cmd_data =3D {
> +		.c22_data	=3D FIELD_PREP(RTL8390_PHY_CTRL_REG_ADDR, regnum) |
> +				  FIELD_PREP(RTL8390_PHY_CTRL_MAIN_PAGE, priv->page[port]),

[Severity: High]
Does this code inadvertently omit the PARK_PAGE configuration?

Without setting FIELD_PREP(RTL8390_PHY_CTRL_PARK_PAGE, 0x1f), this field
implicitly defaults to 0. Would this cause the hardware polling engine
to write the PHY page value to register 0 (the Basic Mode Control Register)
instead of register 31?

If so, this could overwrite the BMCR on every C22 command and corrupt the
PHY's core configuration.

> +		.ext_page	=3D FIELD_PREP(RTL8390_PHY_CTRL_EXT_PAGE, 0x1ff),
> +		.io_data	=3D FIELD_PREP(RTL8390_PHY_CTRL_INDATA, port),
> +	};
> +
> +	return otto_emdio_read_cmd(bus, RTL8390_PHY_CTRL_TYPE_C22, &cmd_data,
> +				   RTL8390_PHY_CTRL_DATA, value);
> +}
> +
> +static int otto_emdio_8390_write_c22(struct mii_bus *bus, int port, int =
regnum, u16 value)
> +{
> +	struct otto_emdio_priv *priv =3D otto_emdio_bus_to_priv(bus);
> +	struct otto_emdio_cmd_regs cmd_data =3D {
> +		.c22_data	=3D FIELD_PREP(RTL8390_PHY_CTRL_REG_ADDR, regnum) |
> +				  FIELD_PREP(RTL8390_PHY_CTRL_MAIN_PAGE, priv->page[port]),

[Severity: High]
Are we missing the FIELD_PREP(RTL8390_PHY_CTRL_PARK_PAGE, 0x1f) configurati=
on
here as well?

> +		.ext_page	=3D FIELD_PREP(RTL8390_PHY_CTRL_EXT_PAGE, 0x1ff),
> +		.io_data	=3D FIELD_PREP(RTL8390_PHY_CTRL_INDATA, value),
> +		.port_mask_high	=3D (u32)(BIT_ULL(port) >> 32),
> +		.port_mask_low	=3D (u32)(BIT_ULL(port)),
> +	};
> +
> +	return otto_emdio_write_cmd(bus, RTL8390_PHY_CTRL_TYPE_C22, &cmd_data);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613112946.1071=
411-1-markus.stockhausen@gmx.de?part=3D8
