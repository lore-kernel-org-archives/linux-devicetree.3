Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCAB4746C8
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946776; cv=none; b=kEp1PK28z4yH+GI2tp0dmgSdt0xBEd/scTN1D5t73qOHMxuGPKn/RAfwiOTbuynr1AZR3lPUtJudPW1hHdfXjsYCzv+GK4uOtZ2al8tlZ+XATma8CZYBOFH+X08QXMQaffKi0Xu9rAJOLbhhyiEIZr/vXbG/qb5lPy8tABipToI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946776; c=relaxed/simple;
	bh=WfSh723IgOE52o7CHNSvigpy9iuFcpeA0mntw3E+BIY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NvyB0ppUHI/R2zhCs9gCBrCVqd5xqwJR3yXp8CgOQsNWlwkZYKWyTpgiQ3glZrNLWljZ6X+HXxUcRv1Q802RHCGAdMk/eIxk7hs5GE9mDW2JHR8a1po2KSkdNtvB+Cg9aPEVJFvnCi8e6boL89T3idGilzA3XbE22eGwXYgB908=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAu0NWXw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAu0NWXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591C51F00ADB;
	Wed,  9 Sep 2026 09:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788946767;
	bh=i6R8K37Ubosv3Ny4PfSBQA6qx77b+sDeNqGeUGweSqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mAu0NWXwv8DvoAtJYnYgypbNALxZOkCPTOvH0UtYFNdvz49qiPosYHCqdjCXLI9FY
	 y7xrsakipQpbX0/nV1BgMyxiVtWoL5CzBGBYuJjSeS2zna1pGiTqYzqGmSOQO3SW8o
	 a5yMc8ChhRG9d11Wn9M2jl7UOnPJ8D/EAL1xf7l1/dhi/d8AcgVsT0YY9yPwhF1REC
	 SxoRhq7lCuHtaEjEpVwzEAZgWBfL5VS41Tn6cnfqE2vO/32MeiJkkT2Izc+2c03ZKQ
	 1ZLOiLR8VjiGabCN3nAuP3+EU+MjItP6zyI9sZ8vEuy4GNS44nOyuOaDoApUEn6Tjw
	 l+EVGa/1B+zuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 3/4] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-ks8995-to-ksz8-v10-3-7379239eb65f@kernel.org>
References: <20260908-ks8995-to-ksz8-v10-0-7379239eb65f@kernel.org>
 <20260908-ks8995-to-ksz8-v10-3-7379239eb65f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:39:26 +0000
Message-Id: <20260909093927.591C51F00ADB@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware initialization failure: polling PHY soft reset on MAC-o=
nly CPU port may cause timeout.
--

commit e3efbaeb1bd18a981cfc0bd58667bbdba4d7252e
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA

This commit adds support for the Microchip KSZ8995XA switch to the KSZ
driver. It includes a custom reset routine that iterates over the switch
ports to issue a self-clearing PHY soft reset.

> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip=
/ksz8.c
> index 941ae9f66f70b..40d7d0eaf1cee 100644
> --- a/drivers/net/dsa/microchip/ksz8.c
> +++ b/drivers/net/dsa/microchip/ksz8.c
[ ... ]
> @@ -253,7 +255,31 @@ static int ksz8463_reset_switch(struct ksz_device *d=
ev)
> =20
>  static int ksz8_reset_switch(struct ksz_device *dev)
>  {
> -	if (ksz_is_ksz88x3(dev)) {
> +	if (ksz_is_ksz8995xa(dev)) {
> +		unsigned int port, reg, val;
> +		int ret;
> +
> +		/* The KSZ8995XA switch itself cannot be reset by software, but
> +		 * often boot loaders have fun with ports, so reset them. This
> +		 * reset bit is self-clearing.
> +		 */
> +		for (port =3D 0; port < dev->info->port_cnt; port++)
> +			ksz_port_cfg(dev, port, REG_PORT_STATUS_3,
> +				     PORT_PHY_SOFT_RESET, true);
> +
> +		/* IEEE 802.3 allows up to 500 ms for a PHY reset. */
> +		for (port =3D 0; port < dev->info->port_cnt; port++) {
> +			reg =3D dev->dev_ops->get_port_addr(port, REG_PORT_STATUS_3);
> +			ret =3D regmap_read_poll_timeout(ksz_regmap_8(dev), reg, val,
> +						       !(val & PORT_PHY_SOFT_RESET),
> +						       1000, 600000);
> +			if (ret)
> +				return ret;
> +		}

[Severity: Medium]
Could this polling loop timeout and abort the switch probe when checking the
CPU port?

In ksz8_reset_switch(), the loop iterates up to dev->info->port_cnt, which
includes the MAC-only CPU port. Since the CPU port does not have an internal
PHY, writing the PORT_PHY_SOFT_RESET bit to it might not self-clear dependi=
ng
on the hardware register implementation.

If the bit acts as a regular R/W bit on the CPU port rather than being
hardwired to 0, regmap_read_poll_timeout() will poll for 600ms and ultimate=
ly
return -ETIMEDOUT. Should this loop iterate up to dev->phy_port_cnt instead,
or explicitly skip the CPU port?

> +
> +		/* Some PHYs need additional settling time after reset. */
> +		usleep_range(1000, 2000);
> +	} else if (ksz_is_ksz88x3(dev)) {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-ks8995-to-=
ksz8-v10-0-7379239eb65f@kernel.org?part=3D3
