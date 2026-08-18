Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2643A1D14
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070448; cv=none; b=WO6wMv6Jy0ZyM6UDafgGCaevnxt4oaR1/JqDjKG78eQ520RoasgogC4YKf0NWxNg5GEnJjMx3P/tkDBnqQXNgMWC5t8LnvwvTLkUClCfpGUE9/MU9OSmfngjtaAVxPH9qSyrXK6gXQhz5AyKR95qp63GQMIGbn/YTpFOxyMqC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070448; c=relaxed/simple;
	bh=1R7OCSXeK9j7BnLseI/1huYsZo6dfmlIxDJEYnI7+fY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U9wan527CRsEgl8RlCK1gRvfkw/YEhJqrinvNtbpaRKK14vqOXZfnLAhmVm/y4OfFKP3WyDLKwWzLcqPg3iQObkL9cKenhOZBmK0yvNPO61SHv91aicph8Da9miOnlpgJxF8i4kJLzfS6ukxKF6JPgnZPo0uKjBeCyJWgbdC8uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xl2lDUll; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xl2lDUll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0392E1F000E9;
	Tue, 18 Aug 2026 16:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787070447;
	bh=Op8I0ol/gNzuQMvRCHyOdPomRtu1KjfQnhTPwHDFFcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xl2lDUllCwD4tAlZB5eqZiXT2Jgp0r602+vQ+ln65fpNnaNDX8uqlTnQl25JSNIsu
	 gvE12VUTb4CbCJYRZJ85WS7ipq1DUSmW9MmabGAw91x49WK6iDhBut0q9ino2O4vPL
	 I4VZTklBEMdZawP2g/KgWv3twkt2oEkt1NGvXOVJ0zEto0jU7hUudIJnIVbohce9Am
	 HEwOx5l3eSF2T7wwrJ1bBlCQNLAGmNeKIL+wscwQxFyphFDtGQ88LbywoOwyg5LCd0
	 IJXX4djCX9BKJMBdmuX6qufxd/xaOvTqpzKzUygBU/7XS3iFv6lfNlO1AKvI6zbEeq
	 B2JVIxV28G7ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 03/13] net: mdio: realtek-rtl9300: deny C45
 over C22 access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817162632.1208891-4-markus.stockhausen@gmx.de>
References: <20260817162632.1208891-1-markus.stockhausen@gmx.de>
 <20260817162632.1208891-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 16:27:26 +0000
Message-Id: <20260818162727.0392E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Using `dev_WARN_ONCE` for an unsupported hardware operation trigge=
rs kernel stack traces and potential panics, creating a local denial of ser=
vice vector.
- [Medium] Returning the internal `-ENOTSUPP` error code instead of the sta=
ndard `-EOPNOTSUPP` breaks error handling and leaks internal kernel error c=
odes to user-space.
--

--- Patch [3]: [PATCH net-next v14 03/13] net: mdio: realtek-rtl9300: deny =
C45 over C22 access ---
commit d6cd33a68aefd1fa8ff00c7952b513cfe5a1bda8
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: deny C45 over C22 access

Hardware polling breaks C45 over C22 PHY access. This patch adds checks
to the read and write paths to deny these accesses, return an error, and
give a one-time warning message.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -453,6 +454,10 @@ static int otto_emdio_read_c22(struct mii_bus *bus, =
int phy_id, int regnum)
>  	int ret, port;
>  	u32 value;
> =20
> +	if (dev_WARN_ONCE(&bus->dev, regnum =3D=3D MII_MMD_CTRL || regnum =3D=
=3D MII_MMD_DATA,
> +			  "C45 over C22 read access broken due to polling\n"))

[Severity: High]
Is it intentional to use dev_WARN_ONCE() here instead of dev_warn_once()?

The generic PHY framework routinely uses C45-over-C22 to probe capabilities=
=20
like Energy Efficient Ethernet (EEE) via mmd_phy_indirect(), which triggers
access to MII_MMD_CTRL.

Since standard ethtool commands like '--show-eee' can trigger this path,
using a WARN macro allows local users to trigger a kernel stack dump. If
panic_on_warn is enabled, this could be used to cause a system crash.

> +		return -ENOTSUPP;

[Severity: Medium]
Should this return -EOPNOTSUPP instead?

-ENOTSUPP is an internal NFS error code (524) that isn't recognized by
userspace, which can lead to unrecognized error messages (like
"Unknown error 524") when leaked through netlink or ioctls.

Also, the PHY subsystem typically relies on the standard -EOPNOTSUPP code
to gracefully handle unsupported operations and fall back to alternatives.
Does the same suggestion apply to otto_emdio_write_c22() as well?

> +
>  	port =3D otto_emdio_phy_to_port(bus, phy_id);
>  	if (port < 0)
>  		return port;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817162632.1208=
891-1-markus.stockhausen@gmx.de?part=3D3
