Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BA1403AFD
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105304; cv=none; b=jRwWyZ8Q38kk4rqn/oV5woNWxvC25u0u9UrXp56jsY5GF4Ct+NKrAyrrW8A0SeEjH79EPrEaMlIr+lh/vZsOL/2bM5wNWforsP8gBXe/Xt7O/0sxsxV/hpNUgshFqCPWTu44sB6ZYwnlFG/kzio/+A3WgUn4J5NPWTanwWMHjhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105304; c=relaxed/simple;
	bh=Q1Wr7G5CL1bKjpuhk+kh8HHDgWE5aQ4DCtyG3m55WIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bElkUX6IZPnS4v9yqLY7Woj1ikYFOEMp6yEFq0heXA+cctSxHRJk2nJeMMXl/mhha4TN48tP65enxJtRii6ZD4rksjsp0DfBnarIdFZzMmGZ1oHKZz1F481rvF/bV3L/A1vaQzxLiaY5vqZaNFLi39mC0TrgnCvgo6L8uQw4Jfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7PS2NJC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7PS2NJC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837971F008A2;
	Wed, 10 Jun 2026 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105303;
	bh=3gl2RRiOnvwnZg2sTU04CssNnY3oqMoYFK93mtd05FY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h7PS2NJCjBt4rVyjx7vrXRFGhAnnNwcmtfDreufeVOFgs+QdQw3C87odO7D6Dfm+t
	 PGilWWB68KGCLFLY7KyVwsCPNGPf2J5nhzF82oHMp+ak7LRGpkUImpKV8mIZZVfR5h
	 j0NMT2zE5y4oB3WsZEtK9LXfO6QEQ/Y3El15Y99dYM9bDEUzbz83GrLGom+8JPWtFV
	 3PlXgy2AtzMWBcUKaLwndAbMOSgkQcKjhEUn3ppmEOnuorzfdAIAdLcEhPGxyHdJCO
	 2Y6S4Aj8maDTx1OlHnyHnKzgCJ5YZ2NZjVAnGbxGGUOQzGPy9BCwB8eU8/108wouV4
	 rsNO6PnZ8uYIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 08/13] net: ethernet: oa_tc6: Use the
 read_mms/write_mms functions for C45
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609-adin1140-driver-v4-8-0753e28ee004@analog.com>
References: <20260609-adin1140-driver-v4-8-0753e28ee004@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 15:28:22 +0000
Message-Id: <20260610152823.837971F008A2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The MDIO bus read callback incorrectly transforms negative I/O err=
or codes into a successful read of register value `1`, masking SPI communic=
ation or device errors.
--

commit 1a0bc4b5b89b86918a4916cb260bddd03f3d58c8
Author: Ciprian Regus <ciprian.regus@analog.com>
net: ethernet: oa_tc6: Use the read_mms/write_mms functions for C45

This commit replaces the formatting of register addresses in C45 reads and
writes with the new oa_tc6_read_register_mms() and=20
oa_tc6_write_register_mms() functions. It also renames the ret variable to=
=20
mms for storing the memory map returned by oa_tc6_get_phy_c45_mms().

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index d32a1a323d488..4fe4e41136c17 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c
> @@ -500,13 +500,14 @@ int oa_tc6_mdiobus_read_c45(struct mii_bus *bus, in=
t addr, int devnum,
>  {
>  	struct oa_tc6 *tc6 =3D bus->priv;
>  	u32 regval;
> +	int mms;
>  	int ret;
> =20
> -	ret =3D oa_tc6_get_phy_c45_mms(devnum);
> -	if (ret < 0)
> -		return ret;
> +	mms =3D oa_tc6_get_phy_c45_mms(devnum);
> +	if (mms < 0)
> +		return mms;
> =20
> -	ret =3D oa_tc6_read_register(tc6, (ret << 16) | regnum, &regval);
> +	ret =3D oa_tc6_read_register_mms(tc6, mms, regnum, &regval);
>  	if (ret)
>  		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the error
handling for MDIO reads here, I noticed an issue in the related standard re=
ad
function.

Does oa_tc6_mdiobus_read() incorrectly handle negative error codes?

In drivers/net/ethernet/oa_tc6.c:oa_tc6_mdiobus_read():

    bool ret;

    ret =3D oa_tc6_read_register(tc6, OA_TC6_PHY_STD_REG_ADDR_BASE |
                   (regnum & OA_TC6_PHY_STD_REG_ADDR_MASK),
                   &regval);
    if (ret)
        return ret;

When oa_tc6_read_register() fails and returns a negative error code (like
-ENODEV or -EIO), the bool cast converts it to 1 (true).

Returning 1 instead of the negative error code causes the PHY framework to
interpret the I/O error as a successful read of the value 1.

Could this lead to silent failures, incorrect PHY ID detection, or
misconfiguration of the MAC-PHY device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-adin1140-d=
river-v4-0-0753e28ee004@analog.com?part=3D8
