Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BC9231832
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102131; cv=none; b=huIvqLnVeXuUq3mrsa48QNC+AIUqkUsr0yaSCk11sWb6nePTyWwj/kbxBKa5zchinKlbgV4Sa+0MywjPaBfscyjFUt0Kiw5u0EpidfwSCswixg4QfJ+wFUIaNxP9cZXA6YXNjv7+kySBF6cB04iGvgmI8/VrG0N6eU2ZUCgQmEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102131; c=relaxed/simple;
	bh=VQ8DAfrLK3H4zd/UoRvdff07TTuQ61eROWyyHcjo7Tk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i4aeyHd+nuISeu03K5HHw9f12aCeYl3wC92esfd4pnRN+P3DF5jgpqAJsewQj98vOnn9jafTzDmgZOJCKd2KwBO1Q7+E5PwjnyiAZ8zRl1Y6WuYnkZ4bcu2M3l1v56mWzgJfeYTCsQRA5G19Smibq4Boy8tNuM0KVI2J7Z5VfT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKO4clhh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKO4clhh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53181F00899;
	Sat, 30 May 2026 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102130;
	bh=6pPNRXrDXh4NeWeQ8OrYZawP4VkfOiA9Tila6JyMQzo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GKO4clhhrtdbNuCaIOoHW8p/izlNJfd+lsEQ+ArOwUBxEHgOrNQJEjHpw6hQXmlEN
	 GykGg7t/2lZlh3ui2PqFdhtFIAMnPiZtSc2L6D+Zl7NZKdKqAHuJlt0gJRyDOd6T4n
	 M8Qn9Hv9U9BS1/MQra9GVYHUjHZelh6hTtFTWkY7vYQp40sNOpRhN2hbTFi0WkeF+e
	 OFIqBxE5MpirFTKv3U8hbiSs8VnRx9NEcqLxlm4BYXhyLoA1zjR9tTwrPlhxHswWA/
	 77tA3SO0tFsW5B1rkAuBNzUuLWj0mgxL/6a2tGkvu7v7bUsT9kjV6xNiSNsQ7SQ5jp
	 KSP4MsXWESJSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 6/6] net: phy: air_an8801: ensure maximum
 available speed link use
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-add-airoha-an8801-support-v5-6-01aea8dee69b@collabora.com>
References: <20260526-add-airoha-an8801-support-v5-6-01aea8dee69b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:48:49 +0000
Message-Id: <20260530004849.D53181F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] If the MDIO register write in `an8801r_read_status()` fails, the=
 software state (`phydev->speed`) is left updated while the hardware is not=
 configured for the new speed. This prevents subsequent retries and permane=
ntly misconfigures the PHY datapath until the link drops again.
--

commit 755d222adefc1329362882564596b829427a8bc6
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: phy: air_an8801: ensure maximum available speed link use

This commit configures the function mode of the Airoha AN8801R PHY for 1G
or 100M/10M operation after link detection. It implements a custom
read_status callback that writes to the link mode register based on the
detected speed.

> diff --git a/drivers/net/phy/air_an8801.c b/drivers/net/phy/air_an8801.c
> index aa24bb182d645..f97c78e430237 100644
> --- a/drivers/net/phy/air_an8801.c
> +++ b/drivers/net/phy/air_an8801.c

[ ... ]

> +static int an8801r_read_status(struct phy_device *phydev)
> +{
> +	int prev_speed, ret;
> +	u32 val;
> +
> +	prev_speed =3D phydev->speed;
> +
> +	ret =3D genphy_read_status(phydev);
> +	if (ret)
> +		return ret;
> +
> +	if (!phydev->link) {
> +		phydev->speed =3D SPEED_UNKNOWN;
> +		return 0;
> +	}
> +
> +	if (prev_speed !=3D phydev->speed) {
> +		/* Ensure that PHY switches to 1G speed when available,
> +		 * by configuring the function mode for either 1G or 100M/10M
> +		 * operation.
> +		 * Therefore, set the link mode register, after read_status
> +		 * determines the link speed.
> +		 */
> +		val =3D phydev->speed =3D=3D SPEED_1000 ?
> +		      AN8801_BPBUS_LINK_MODE_1000 : 0;
> +
> +		return an8801_buckpbus_reg_rmw(phydev,
> +					       AN8801_BPBUS_REG_LINK_MODE,
> +					       AN8801_BPBUS_LINK_MODE_1000,
> +					       val);

[Severity: Medium]
If the MDIO register write fails, does this leave the PHY state permanently
misconfigured until the link drops again?

genphy_read_status() successfully updates phydev->speed, but if
an8801_buckpbus_reg_rmw() fails, it returns an error. On the next polling
interval, prev_speed will now match phydev->speed, making the condition
check evaluate to false.

This means the register write will be skipped on subsequent retries,
leaving the MAC thinking the link is up at the new speed while the PHY
hardware remains physically in the incorrect mode.

Could the error path revert phydev->speed to prev_speed on failure, or
could the hardware register state be re-evaluated instead of relying on
the software state transition?

> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-add-airoha=
-an8801-support-v5-0-01aea8dee69b@collabora.com?part=3D6
