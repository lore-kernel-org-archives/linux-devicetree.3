Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6B32737F9
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102143; cv=none; b=KgBG+KEuY76tN032HOBLH+wbikAddkyvrVPYab/wNJE6QgbuppJZUDLg3IR4L3ajv8KZfPmtmwFBkUIlwnJZVav0WW9mnmCiUJ6tJ/lVZydKHjHt0fq5BKgDL3lgnMnxMkVE35wJ9ELX/ErbE9MKPPI+KwBFtTBfQi301FIVyLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102143; c=relaxed/simple;
	bh=06iXdapGIZkqCv0XwQZubq0W9hkk4wp5HTY4tjaqFlQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bxlxlENCaXgdIOaQKnO1NwSmzuOCZUSPfoN5IZAuI98sK9oA0+5ecjLfL+lDV+D0N26T0bUywPIi0VTCJAUQDj6MaS+WMCTv98b0bOm/dNkD6ud1ljSLBfty2jQwYa6HWJQMIfzebKCFRjgEAjdKtLO3FSRQeCNwR+suCc1ekQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Loc22R2U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Loc22R2U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23501F00893;
	Sat, 30 May 2026 00:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102142;
	bh=Pbc7Z+mEI3p5qPEJBeGvuwyJKoRpaeVzV4N88psSDfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Loc22R2UtYmLmB2WXWsTL7a138jx1ljzUCdksEOdDt26dK3AKp04RcJe4Rb8GOUNG
	 QBSKddlQj68cyyaqy7YI0IrddjYU99aKkyESTdMQCcSeQMLHP6WCUfu84y0vWN7ZtQ
	 mGEU/BZuV9YZbRDbwoDyV7ctvPBoCGy7ELZ2ZSSMVLFCXuVneHVP7pu6+1pg1YMoqS
	 nQeO2hCWZL1hNVB+wT1+oBJUQLK2DkydAM1483sXDi9siYOrQ6yDquj/AtWH32UJ9z
	 5D3LoxvzobxfZEe2iwxomC8oI0Q9VgxVzoIulbDUePpo7eXMLVHFbIJXimFEm8AlXw
	 tcF29ffPf9KTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 4/5] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260526-ks8995-to-ksz8-v3-4-c530f651989f@kernel.org>
References: <20260526-ks8995-to-ksz8-v3-4-c530f651989f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:49:01 +0000
Message-Id: <20260530004901.F23501F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The KSZ8995XA PHY register emulation incorrectly maps and overwrit=
es fundamental port control bits, disabling RX/TX and MAC learning.
--

commit 2e706ae441971159b4241c28e24cf8f143178ad5
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA

This adds support for the Microchip KSZ8995XA also known as the
Micrel KS8995XA switch to the KSZ driver.

> diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/mic=
rochip/ksz_common.c
> index 57c8abfe0147d..ac27beb3054bd 100644
> --- a/drivers/net/dsa/microchip/ksz_common.c
> +++ b/drivers/net/dsa/microchip/ksz_common.c
[ ... ]
> @@ -554,6 +554,20 @@ static const u8 ksz8895_shifts[] =3D {
>  	[DYNAMIC_MAC_SRC_PORT]		=3D 24,
>  };
> =20
> +static const u16 ksz8995xa_regs[] =3D {
> +	[REG_SW_MAC_ADDR]		=3D 0x68,
> +	[P_FORCE_CTRL]			=3D 0x0C,
> +	[P_LINK_STATUS]			=3D 0x0E,
> +	[P_LOCAL_CTRL]			=3D 0x0C,
> +	[P_NEG_RESTART_CTRL]		=3D 0x0D,

[Severity: High]
Will this register mapping inadvertently disable RX/TX and MAC learning?

The newly introduced ksz8995xa_regs array maps P_LOCAL_CTRL and P_FORCE_CTRL
to 0x0C, and P_NEG_RESTART_CTRL to 0x0D. The driver's PHY emulation
functions (ksz8_w_phy and ksz8_w_phy_bmcr) apply KSZ8795-specific bitmasks
to these offsets.

On the KSZ8995XA, offset 0x0C resolves to Port Control 12 (e.g., 0x1C for
Port 1), where BIT 4 is Receive Enable and BIT 3 is Transmit Enable. When
updating MII_ADVERTISE, the emulation applies PORT_AUTO_NEG_SYM_PAUSE (BIT =
4)
and PORT_AUTO_NEG_100BTX_FD (BIT 3). Clearing these advertisement bits
appears to inadvertently disable RX and TX on the port.

Similarly, setting PORT_FORCE_FULL_DUPLEX (BIT 5) via MII_BMCR sets Learning
Disable. When phylink automatically configures the PHY on startup, these
writes could execute and completely break the switch port's network
functionality.

> +	[P_REMOTE_STATUS]		=3D 0x0E,
> +	[P_SPEED_STATUS]		=3D 0x09,
> +	[P_STP_CTRL]			=3D 0x02,
> +	[S_START_CTRL]			=3D 0x01,
> +	[S_BROADCAST_CTRL]		=3D 0x06,
> +	[S_MULTICAST_CTRL]		=3D 0x04,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-ks8995-to-=
ksz8-v3-0-c530f651989f@kernel.org?part=3D4
