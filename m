Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A743344C4E8
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266205; cv=none; b=AgBLyuKzs3c/NUPLZ3Qhhcz6Px6sW4Fa1XVJS9B9fA34Uhqon8C+u1Pg6TCXFmgnIE8SxpTHiAgysMeKcEwKRdkkcmV7b7tbWPwBsABQ3J+RKi/rcdpwcuo1A9Bz1X79XmKwDz7NtoxbGxUwFG46FloZxdelhhecdVQ8eMukxD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266205; c=relaxed/simple;
	bh=/lSEqJT5biFMGnkINBU/BO46+c2hEINB/RlKXqBI0Nw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T4Ys+tTNaIK4+1aaT4i2uYdbJZBTKCet3IAemTQTZ7xazyf4Td4NUvBuNmWm2OtJJONijZbvotBAd+KGuLvzSWOw5IfIM2ferBjv7TQFJWgXC3Ie0Cn78nIzLmpyLsCothLZ9eqqzcgT3DTIHKDk7xJrXF9caaSI2smt5bo4DO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEKKYMt9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEKKYMt9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C851F00A3D;
	Tue, 28 Jul 2026 19:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785266201;
	bh=98OFBWAotpk1ALpNAUDCP1z9d8piyBdpOOQiqnThnrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OEKKYMt9n/eD8DN4VHZJMdvFZFxpBF0MOjmun30OUDnAaG3sy6oxXKNLTZizI/hXe
	 IyCC7Fg3shrIWbWO5/uJj1/FiOjRxdN1etn0/gjo2RepLcGGZy9SSyHreYRzL5wk+m
	 0NqODLevfbCLkMyCB5BT/YMqshZ5kcrkICU9LGFlW0mZ5AtrYv0DRpk3CwpfFXHBLY
	 AzXB0/7JpFRXcrdfHe+D9SY5ZAMa/iWpGrFpFbr9icqkOTVArdK9/CnGO1slLIi+1N
	 XCdKygUZ7Jj3BsX0lF0HS7kMIkNo2AzvRteZH50UWoQjj13QF9lz9wchAHgQPVbRRP
	 n+z9JMR9s7uZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 6/9] net: mdio: realtek-rtl9300: Add page
 tracking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727191559.19617-7-markus.stockhausen@gmx.de>
References: <20260727191559.19617-1-markus.stockhausen@gmx.de>
 <20260727191559.19617-7-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:16:40 +0000
Message-Id: <20260728191641.48C851F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The software cache for the PHY page register (`priv->page[port]`) =
is not cleared when the PHY is detached and reset, leading to corrupted MDI=
O reads/writes on subsequent attachments.
- [Medium] Memory leak of `priv` when `otto_emdio_init_polling()` fails.
--

--- Patch [6]: [PATCH net-next v8 6/9] net: mdio: realtek-rtl9300: Add page=
 tracking ---
commit 97666ebf004388a052d7dc76edffdda3f1aad8d5
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

    net: mdio: realtek-rtl9300: Add page tracking
   =20
    The hardware polling unit of the Realtek switches has a very special
    handling for c22 PHY register 31 (aka Realtek page register) in place.

[ ... ]

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 0d5b9530e43b1..6986bed5258ab 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -356,7 +358,7 @@ static int otto_emdio_9300_read_c22(struct mii_bus *b=
us, int port, int regnum, u
>  	struct otto_emdio_cmd_regs cmd_data =3D {
>  		.c22_data	=3D FIELD_PREP(RTL9300_PHY_CTRL_REG_ADDR, regnum) |
>  				  FIELD_PREP(RTL9300_PHY_CTRL_PARK_PAGE, 0x1f) |
> -				  FIELD_PREP(RTL9300_PHY_CTRL_MAIN_PAGE, RAW_PAGE(priv)),
> +				  FIELD_PREP(RTL9300_PHY_CTRL_MAIN_PAGE, priv->page[port]),

[Severity: High]
Does the software cache for the PHY page register (priv->page[port]) need to
be cleared when the PHY is detached and reset?

If a PHY's page register was left non-zero (e.g. by userspace MDIO tools or
an interrupted PHY driver sequence), bringing the interface down detaches t=
he
PHY and asserts a physical reset. The hardware resets its internal page to =
0,
but the software cache retains the stale non-zero value.

When the interface is brought back up, the stale page cache is injected into
all subsequent MDIO accesses here. This can cause the PHY framework to
operate on the wrong register page, breaking PHY initialization and network
connectivity.

For example, in otto_emdio_notify_phy_detach():

static void otto_emdio_notify_phy_detach(struct phy_device *phydev)
{
...
	ret =3D otto_emdio_set_port_polling(priv, port, false);
	if (ret)
		dev_err(bus->parent, "failed to disable polling for port %d\n", port);
}

Should priv->page[port] be reset to 0 here to synchronize with the PHY's
physical reset?

>  		.io_data	=3D FIELD_PREP(RTL9300_PHY_CTRL_INDATA, port),
>  	};

[ ... ]

Also, unrelated to the diff hunks above, I noticed a potential issue in the
probe error path:

[Severity: Medium]
Does the failure path for otto_emdio_init_polling() in otto_emdio_probe()
leak the priv structure and its embedded mutex?

If otto_emdio_init_polling(priv) fails during driver probe:

	err =3D otto_emdio_init_polling(priv);
	if (err)
		return err;

This direct return bypasses the err_out label where kref_put() normally
cleans up priv and destroys its mutex, resulting in a memory leak.
Should this use goto err_out instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727191559.1961=
7-1-markus.stockhausen@gmx.de?part=3D6
