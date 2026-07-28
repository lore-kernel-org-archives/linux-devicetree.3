Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633B247255D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266214; cv=none; b=Xp/QC7ydbTKW21XddL+zVojTxW3/rN8wi+h8uj0PBHHkLgw+CWBzAUCYrDt394SpF0rHuszrWrB6kIi7SvWPB/khCL2omgYrtEl4cyp+SQvcOlFTYejItgEXa2glGJq54ME7XXj9nimTslFWOQa9GvMtovMd5FEDgzMNNywnyP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266214; c=relaxed/simple;
	bh=AKLYMfX5T87x/0X22pQuk4bjva2UFKZI3gpmzo/F688=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ptm3zVlzbOIyeohYxDDGRNHva4rBrD8Lcl1ZO2v56oK7ubKdm4MOCA2Ee4W0NHKmDAPqUmPrlEjV3brY6daVXjDIeKwpj4An7edYMUDDiJb1GxHlQZEJQrrrowGC97ZxcVyUKMyIx4Or4+H2rXEfBfd7eJ3OxUoyEOBga2X99hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPIJa2og; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPIJa2og"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6781F00A3A;
	Tue, 28 Jul 2026 19:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785266205;
	bh=X/AiDJdxgyHTlitQ0N/mPEYKCvujYOR5BVLNuB0vf6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cPIJa2og075W12PkgZNWf+gD7pkoeNzavRoG8D+NLPKZ5MrZD43EA9Smt5hJ42M1a
	 boFfo2iXMT2o4CZOCIY1Nz54T+qRpT044By4Y4soRBy+ONlmpm7Rw47sw+7+behdHd
	 r23nGzujfWYk5eW/29Xk+XlGUAihIK17Cb3lQ49uYRBVtvTlX3npXNZxwWtrW7vb8A
	 6Jl6CkIjSP2q5/QtPfHl8VAEikaXONl0RZ9A4eYXGQ8SSg36fYyS7Z1riMc1DHBNll
	 Mg6z01mYhZF1XQzAV4lFTECxvNRPmpSF2zpBqRidj8Z2MODcY5g+/yIRb36uY15QjD
	 zGpgfbgQeqU+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 3/9] net: phy: add
 (*notify_phy_attach/detach)() hooks to struct mii_bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727191559.19617-4-markus.stockhausen@gmx.de>
References: <20260727191559.19617-1-markus.stockhausen@gmx.de>
 <20260727191559.19617-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:16:45 +0000
Message-Id: <20260728191645.7C6781F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling `phy_attach_direct` on an already attached PHY destructive=
ly tears down the existing legitimate attachment and causes module refcount=
 imbalances.
--

--- Patch [3]: [PATCH net-next v8 3/9] net: phy: add (*notify_phy_attach/de=
tach)() hooks to struct mii_bus ---
commit 93555b251005e09563b58618551521a23eeca40d
Author: Daniel Golle <daniel@makrotopia.org>

net: phy: add (*notify_phy_attach/detach)() hooks to struct mii_bus

This commit introduces notify_phy_attach() and notify_phy_detach() hooks
to struct mii_bus for MDIO bus drivers. It also relocates code from
phy_detach() into a new __phy_detach() helper to ensure symmetrical bus
notification during PHY attach and detach phases.

Link: https://github.com/openwrt/openwrt/pull/21515#discussion_r2714069716
Link: https://lore.kernel.org/netdev/cover.1769053496.git.daniel@makrotopia=
.org/

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 94b2e85e00a37..233622e9ba61f 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -1890,8 +1986,8 @@ int phy_attach_direct(struct net_device *dev, struc=
t phy_device *phydev,
>  	return err;
> =20
>  error:
> -	/* phy_detach() does all of the cleanup below */
> -	phy_detach(phydev);
> +	/* cleanup without bus notification */
> +	__phy_detach(phydev, false);

[Severity: High]
This is a pre-existing issue, but since the error path is being modified he=
re,
I wanted to ask about how we handle failures when a PHY is already attached.

If phy_attach_direct() is called on a PHY that is already attached to anoth=
er
device, it returns -EBUSY and jumps to the error label:

	if (phydev->attached_dev) {
		dev_err(&dev->dev, "PHY already attached\n");
		err =3D -EBUSY;
		goto error;
	}

Because this error path unconditionally calls __phy_detach(), and=20
__phy_detach() uses the current phydev->attached_dev as its target,=20
does this perform a full teardown on the existing active connection?

static void __phy_detach(struct phy_device *phydev, bool notify_bus)
{
	struct net_device *dev =3D phydev->attached_dev;
...
		phydev->attached_dev->phydev =3D NULL;
		phydev->attached_dev =3D NULL;


Could this break the live attachment and cause module refcount imbalances,=
=20
since the original MAC driver is completely unaware its PHY was detached an=
d=20
its dev->phydev pointer was set to NULL?

Should the error path cleanly roll back only the references taken for the=20
new failed attachment instead of destroying the pre-existing state?

>  	return err;
> =20
>  error_module_put:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727191559.1961=
7-1-markus.stockhausen@gmx.de?part=3D3
