Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4603B0AD0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651910; cv=none; b=T/vAyxede0gvgYUqo2MbFDUTzp5igR/6b8pyzkq++h8mSlGUlzt8bWG+1ywmpM/rh0QykZr5v0LlkUDXRGqXcY4dDvvUt8IWbZraGy69fCIlkj5AfnkaaZqteCeHo+hVF+FacptUQR/bqskl3P2OBE5/rOL711HEWQjYGe9KDM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651910; c=relaxed/simple;
	bh=azL9uGYJKcTBMD0Q079W30CNuZ6TrpD+ic2eJIkgQwI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I4vVNjEQhtRMV3hPuxs8k40+rbJc/OkkK9M0JbAgbZ8Dwd0bAsRK/hbz2mLR33kKKWrxLgUj+kGhiHa/+jR2puVl4T6/UmUW7zyCBSpjdgYKgnaKB94dY6rR9axUtLUiYpWofbgkSEW2FdzRBRjeBZ87QFsKoxkFYf/QVAi+Fu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lc1QpKI2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lc1QpKI2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201A7C2BCB7;
	Wed, 13 May 2026 05:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778651910;
	bh=azL9uGYJKcTBMD0Q079W30CNuZ6TrpD+ic2eJIkgQwI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Lc1QpKI2RHYyrNLY+JO4g5JeGnFOBvjG336YB3QIbQuMNDtRENc1AscU/tq1jotoL
	 IGoHqbwkvpKhhxqD/9V7ly3U2dYtjMkx7ZwBJGTLTD0/fOGzVEPQ8i7sIHv481bF2y
	 DgnSLr3bneXXuuRunHZZGWR9uUkXGGzn6HUpx7zHhQycZncUZk5D4jzRRv4shQKQBT
	 O2Qht4I7D9X7EeAqs7yHjy6nhrJGxOz0r78k9K0cVfU0YcviKV1uovE+StfUFqTFiW
	 qKIBuVzxKMVoPNf46thiYbwxN1hw+aoug9X011BUZY5e6QDi51QXbjjduVs+fMVlp7
	 2cVn9MoZ4o2vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 6/6] net: phy: air_an8801: ensure maximum
 available speed link use
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512-add-airoha-an8801-support-v3-6-1edb34e363ae@collabora.com>
References: <20260512-add-airoha-an8801-support-v3-6-1edb34e363ae@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 05:58:29 +0000
Message-Id: <20260513055830.201A7C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Hardware link mode configuration is permanently bypassed when auto=
negotiation is disabled or during rapid link flaps.
- [High] Hardware and software state permanently desynchronize on an MDIO w=
rite error.
--

commit 21302fcf08bdf185bc4b77e3f3a5329b1531d7b0
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: phy: air_an8801: ensure maximum available speed link use

This commit implements a custom read_status callback for the Airoha AN8801R
PHY to configure the function mode register for 1Gbps or 100M/10M operation
after link speed detection.

> diff --git a/drivers/net/phy/air_an8801.c b/drivers/net/phy/air_an8801.c
> index a0f164cbf92bc..af46951b1a33d 100644
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
> +	if (phydev->link && prev_speed !=3D phydev->speed) {

Will the hardware link mode configuration be bypassed when autonegotiation
is disabled or during rapid link flaps?

In forced speed mode (AUTONEG_DISABLE), genphy_read_status() delegates to
genphy_read_status_fixed(), which unconditionally sets phydev->speed to the
forced speed even while the link is physically down.

While the cable is unplugged, the state machine polls read_status, and
prev_speed captures the forced speed. When the link finally comes up,
phydev->link becomes true, but prev_speed already matches phydev->speed.
The check evaluates to false, and the register write is bypassed.

Similarly, if the PHY loses hardware state but the link quickly comes back
before the state machine detects a link-down event, phydev->speed remains
unchanged in memory, and the configuration write is skipped.

Should the driver track link state transitions independently by capturing
the old link state before the call (e.g., old_link =3D phydev->link) and
checking if the link just came up?

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

Can the hardware and software states permanently desynchronize if the
MDIO write fails?

If an8801_buckpbus_reg_rmw() returns an error, phydev->speed has already
been mutated by genphy_read_status(). During the next execution of the
PHY state machine polling cycle, prev_speed will be assigned this
already-updated speed.

Consequently, the prev_speed !=3D phydev->speed condition will evaluate to
false, and the failed hardware update will never be retried, leaving the
PHY hardware permanently misconfigured for the current speed.

Does the driver need to restore phydev->speed =3D prev_speed on failure to
ensure a retry on the next poll?

> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-add-airoha=
-an8801-support-v3-0-1edb34e363ae@collabora.com?part=3D6
