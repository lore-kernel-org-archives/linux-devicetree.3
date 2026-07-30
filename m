Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E15449B22
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427413; cv=none; b=Rz6Zvfn5Aemhz/nlUeTHpwS/FvCSQTV/vcFUAgNUP1TlOhClgLv5vwiWJ0SdmAy2lOd7hf9esG9b9s8vUL52g9MEiAHaScFPO9R98VR98eKXR/H+SpXRm3p11cBqkoVDYk1P773p0MleyvxVWhDlGYrqUPRUD5HIUPISPE1Ybg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427413; c=relaxed/simple;
	bh=h39G5hCxeaT0rDAjrHooDyofHjU4Vxm4Gdal5UuzUfI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UBra1Bfp62YNui+YI2sq9nOaKG+AhQ4kHlma1NY8HNf19WlXuPqOuK0ZRqUuP62K/KDMsmVhnCKzYFK2z5qdTEhhczv1CjVmykEbrYSTJY5CwWFhN4Evvw9BQB74Jpnn51A7UnpMvhNGrxSW/Mbh5YjduPB9eZIl0loyM07KUHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+szlB/D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+szlB/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4101F00A3D;
	Thu, 30 Jul 2026 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785427412;
	bh=SLt2wMWrl+RPq4EyE/35zDGWZgPEBWvSADx/AMPJ9pI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y+szlB/DlukCDZ+7GdpyyOltVMuXb6uVsCJ7b91yrqZGiV9HtJnndgJZvjseEuYYs
	 q5ZVy4QJgkjj7g12k4kixAGweCNTHPeUJBwhqz2Ln+q1gaM1Yb7vVM9PFNmX/ItYfJ
	 2RW6jZ+eVNCH754fj64XAFDoGI8LjdA5eJiOyBamCm0YSksut4wYmsSqLKcPPTf2sy
	 dMn89V3xWAWV2BOQr51sVILWrCeOoqAeyimNTmdnt94nRJGygGsOI2qdY/nSyA+8Mu
	 7UvJE9yXO2MmBfA9fIAvrUittYzIJ3rRPtgv1jOOHxobKAZRYVTVQL4tlI7QbdZc3t
	 QyUJ9HtMi5xPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 5/9] net: mdio: realtek-rtl9300: Configure
 hardware polling during probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729160227.155613-6-markus.stockhausen@gmx.de>
References: <20260729160227.155613-1-markus.stockhausen@gmx.de>
 <20260729160227.155613-6-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 16:03:31 +0000
Message-Id: <20260730160331.CF4101F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware polling is not disabled during system suspend/resume, a=
llowing it to race with and break PHY firmware loading during `phy_init_hw(=
)` on resume.
--

--- Patch [5]: [PATCH net-next v8 5/9] net: mdio: realtek-rtl9300: Configur=
e hardware polling during probing ---
commit c01be295c733b6b22769f54cba9a0edc13200b00
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Configure hardware polling during probing

This commit configures hardware polling on Realtek Otto switches to avoid
interfering with PHY configuration. It disables polling for all ports on
startup, enables it upon PHY attachment, and disables it before detachment.

Link: https://github.com/openwrt/openwrt/blob/main/target/linux/realtek/fil=
es-6.18/drivers/net/mdio/mdio-realtek-otto.c#L818
Link: https://lore.kernel.org/netdev/680696024a8648535ce6dee771fe4de67802e0=
e8.1769053496.git.daniel@makrotopia.org/

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 3b99978a2511e..aca0a9448bb0c 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
[ ... ]
> @@ -584,6 +593,32 @@ static int otto_emdio_9310_setup_controller(struct o=
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
> +
> +	return otto_emdio_set_port_polling(priv, port, true);
> +}

[Severity: Medium]
Does this leave hardware polling active during system suspend and resume?

When the system resumes, the phy_device PM operations invoke
mdio_bus_phy_resume(), which calls phy_init_hw(). Since the platform
driver lacks PM hooks to pause and resume the polling unit, could the
active hardware polling race with and break PHY firmware loading during
this resume sequence?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729160227.1556=
13-1-markus.stockhausen@gmx.de?part=3D5
