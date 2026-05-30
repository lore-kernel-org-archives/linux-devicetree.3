Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4DA1A9FAB
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101940; cv=none; b=emXwzAaqaq0/IBdvava6vf/dhRrlrBoe6NxCwzgJwVxBfZBMsKv/C8Ep+HfOnZq1gv9f0P3c39xbY4qWbkRyYz698i+ZMdtYjzzySiaae82GNVl6tIwekHjnmT2HO9TQglAj0vwTb5NawHtRaOe6UIWlV1XnVGOEVXOWpZQHJ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101940; c=relaxed/simple;
	bh=x5r3Hz4XXyCv0CZ7QNb3eYf1qzrdutl5enAWM6Ecw4I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eQo7Juil8nunTdkR+zkZLQPOtuXDcvS9M/UZUThYmMAG4eBentakfBtzgjViaY2JDLRglzC4WT8Me90//2BUD3bsxr+KuxhxXzSm/r/ogtQStmn/5F9ak/4jZ8/3xeXrzLQZ1ZYs3hfTpD87DjS78jXZlTJtNfwegyx/5ZLJvfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJLudQKg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJLudQKg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316AF1F00893;
	Sat, 30 May 2026 00:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101939;
	bh=PwAecUvaFrhTZHUxwcbc+v9/rJkCXUrsJx1U0EPpemA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJLudQKgCcCPu7CcMCTqnfC/eJEbkQfbqzRbkLs4f24lUDufm4JQnbqPBCQbksvT1
	 9Lcj72RNRb3gERRcQ30yC1/3GnGNy0oC4rrhWF0tyeVss+UZm9QAyPmH6UdWFGfTZ5
	 N/JRvOUbQcJf9tGecaUUVVc2c+zw3eqt4FLfm0ntgSyZ/E8C/IrIXEKjd2p8L1IpiU
	 1KTiC9CK1+JN0SfvLgN1YxxCLXAV5zTR6AraqFWbg+zhYrpvu1WOxN2FXINpKwBQEO
	 znoz3A2zL0/L7DyregT8CROeuvmiy7M1ZaaHwMAlcvKmIGMHoFZSwmZD9ycadml5sR
	 q43NSDl30lTYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 6/6] net: phy: air_an8801: ensure maximum
 available speed link use
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260521-add-airoha-an8801-support-v4-6-1e4837d30ef4@collabora.com>
References: <20260521-add-airoha-an8801-support-v4-6-1e4837d30ef4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:38 +0000
Message-Id: <20260530004539.316AF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Returning an error from the `read_status` callback halts the PHY s=
tate machine instead of triggering a retry, and the fallback state restorat=
ion is fundamentally flawed.
--

commit 32e383d76ce14ad1627b69049f0a1d86c192aa5b
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: phy: air_an8801: ensure maximum available speed link use

This commit implements a custom read_status callback for the Airoha AN8801R
PHY. After link detection, it configures the function mode for either 1G or
100M/10M operation to ensure the PHY uses the maximum available link speed.

> diff --git a/drivers/net/phy/air_an8801.c b/drivers/net/phy/air_an8801.c
> index 73f94e84da07f..c64fa153b7385 100644
> --- a/drivers/net/phy/air_an8801.c
> +++ b/drivers/net/phy/air_an8801.c
[ ... ]
> @@ -977,6 +977,48 @@ static int an8801r_config_init(struct phy_device *ph=
ydev)
>  	return 0;
>  }
> =20
> +static int an8801r_read_status(struct phy_device *phydev)
> +{
[ ... ]
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
> +		ret =3D an8801_buckpbus_reg_rmw(phydev,
> +					      AN8801_BPBUS_REG_LINK_MODE,
> +					      AN8801_BPBUS_LINK_MODE_1000,
> +					      val);
> +		if (ret) {
> +			/* Restore previous speed on failure to ensure this
> +			 * register setting is retried on the next poll
> +			 */
> +			phydev->speed =3D prev_speed;
> +			return ret;

[Severity: High]
Does returning an error here halt the PHY state machine instead of triggeri=
ng
a retry?

When a read_status callback returns an error, the error propagates up to
phy_state_machine() in the PHY core. This triggers phy_error(phydev), which
transitions the PHY into the PHY_ERROR state. This brings the link down
permanently and completely stops all state machine polling.

Consequently, there will be no next poll, and the interface will be dead
until manually brought down and up by the user.

Additionally, is the retry logic structurally sound? Even if the driver
swallowed the error instead of returning it, restoring phydev->speed to
prev_speed (which is SPEED_UNKNOWN when coming from a link-down state) with=
out
clearing phydev->link would cause a permanent failure.

On the next poll, genphy_read_status() would see that both old_link and
phydev->link are up and short-circuit:

drivers/net/phy/phy_device.c:genphy_read_status() {
	...
	/* why bother the PHY if nothing can have changed */
	if (phydev->autoneg =3D=3D AUTONEG_ENABLE && old_link && phydev->link)
		return 0;
	...
}

As a result, phydev->speed would be left permanently at SPEED_UNKNOWN, the
condition (prev_speed !=3D phydev->speed) would remain false, and the regis=
ter
write would be skipped forever.

> +		}
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-add-airoha=
-an8801-support-v4-0-1e4837d30ef4@collabora.com?part=3D6
