Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172162;
	b=LyLwoUBcXTKuwlYuRTrFIr0q/TTxbHp0zaJyXHD1yf/mBLD8R0sD9eLWyvbUuRXHJlrb
	 pTVFxukgB/D8DZdT+y7pVwt3WvT3PuBEre2jgUIVYLIm2B0L2sZJvfcaOkiUGTlJoXgB5
	 pl2lg0rQjLkvlbI/dvx6j+7ndD0jEcTDSJKSb+HKdhxjIZBBDvGXxTD1It/a+pe428zLW
	 yFPiJZu9uvlli+ZSjLOT6MGPKsc+jBxc3OsEFTcpKs6yKNWnRUpmbNoJmGniq3HOhRKWY
	 jHzsBB6XSkkTdTyRdz+7XC9rU6ri0/MuPr8PisLE0RwsrOsm6RjGEptaGH3EVeqjJkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172162;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+7tbN9MuaCmBqXPur4Ml/M1YRKZhdD2ZO+fo0Nusx9o=;
	b=uGvvGscbnaMrc+2mN5cLH/WrwwteY8xEH6uhW7D1Q4I+5zOcxbt+IVr2xMxIXQtOaAi2
	 FwKQRuhA5dtYqqqFApe9D84VsuoYJ5o07J+wUum3XHu29FO/G08SeczYl1ReaHp1JIJ8D
	 XjEAoDGWsH7UXdAEWe9Pr656J6J501CrX0M0OGOpw9EHqlEFKAgIcBNzwEoPMC33xQquc
	 SjD/EtZw/9gi94WtDn91yrtX3GeHUj4ma42jS+/xgBSgArQZWRShBgSwMYANw+ZeN+8BR
	 o7dHTpRmgF8OvdFpkYxSKMa5vZuDsoc44NCs1xKKvQ3yCR6mVffGq+YBg08f3fAJL5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k4ck+hVE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3F0606A337
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k4ck+hVE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F74B1F000C6;
	Fri, 20 Nov 2026 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795172161;
	bh=+7tbN9MuaCmBqXPur4Ml/M1YRKZhdD2ZO+fo0Nusx9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k4ck+hVEF5tUM8rELbF7T8TDfHHU+pLsiZ1IX+JFXoGQUzDZJVAwY/O7nUX+4o8Oo
	 M3cXwy/q61z4crYDe5FqH+WbDPId2z5Q2YFjxVtMACgz7PU0eOGjMCJhhYj4P2XVR6
	 XYBDERK94EWFL4hvoWo3bI459xjx9eJ5KBxk/xl2wif7i0PrZleguN+ZwZ3mw1THJb
	 czqLM7bdNyoLu0LsX+WhacbtWiNHrV/G11ni3SsMBcJWq3egu5b1UxV6/rqawV4et1
	 CG9w6RNlur4ZKpf4XdDMkL88OLq9c/rfpFe5mCXEqsBraojubmSQLfpY+a1fmCR1gY
	 8S9W1NJdrH1CQ==
Message-ID: <sashiko-outbox-224974@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: rockchip: Describe Sige5 Ethernet PHYs
 by their ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-rk3576-phys-v1-2-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
 <20261120-rk3576-phys-v1-2-6382cd14e3dc@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 10:56:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: rockchip: Fixes tag cites board addition instead of
  63136c6fecf4
--

commit 5dc14b4c5e3f94d0bf427bf2ff5dad981d4f435e
Author: Alexey Charkov <alchark@flipper.net>

> arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by their ID
>
> Both Sige5 GMACs connect to an RTL8211F PHY (ID 0x001cc916) with its
> reset line in the PHY node. With only the generic C22 compatible, an OS
> has to read the PHY ID registers before it can bind a driver, and only
> that driver releases the reset line. Unless an earlier boot stage has
> already released it, the PHY stays in reset, never answers on MDIO, and
> neither Ethernet port comes up. Booting straight from U-Boot SPL in
> Falcon mode hits exactly that.
>
> Name the PHY by its ID, so it binds without the ID read and comes out of
> reset as it does. Name the node ethernet-phy@1 as well, as the Realtek
> PHY binding the ID compatible selects requires.
>
> Fixes: 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 board=
")
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

[Severity: Low]
In 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 board"),
the PHY reset lines were described via snps,reset-gpio on the gmac0 and
gmac1 nodes, which stmmac_mdio_reset() deasserts before probing the MDIO
bus for PHY IDs.  Commit 63136c6fecf4 ("arm64: dts: rockchip: Use standard
PHY reset properties for RK3576 ArmSoM Sige5") moved those reset lines into
reset-gpios on rgmii_phy0 and rgmii_phy1 while keeping the generic C22
compatible.

Should the Fixes tag instead be:

  Fixes: 63136c6fecf4 ("arm64: dts: rockchip: Use standard PHY reset proper=
ties for RK3576 ArmSoM Sige5")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-rk3576-phy=
s-v1-0-6382cd14e3dc@flipper.net?part=3D2
