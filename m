Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19313EEAEF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417268; cv=none; b=poSGrKdnM67W+2Vjvaxc1Vt3VLh10z6PnnCiU86O6WzBODKM0FmSVxnQsKyR0vVtDlCoatCGa80tCBAtVNZT1W/sEv/igUqNu3VawKv9hm4UghK+XsHnkMEwDoqicHXzhfmESjK5EYwkit0SwXGz0B2OsW3cQhfvZ30HBDaE2QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417268; c=relaxed/simple;
	bh=4bJLvzQHi/ROWczRqWTJo3BQI1BcKYNW5zq5p6p7GPc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g9cVK2dS/6sWbXor9liJQK9aWJWVTbH8RsdvqBQryweXscXVGjSb5vB2EZkWAef47LU7uTHuu54NrdZc2a92FP4H7/LqmMYHMzf48t6vC0hvJDndZ2zotaRM9+XnUv3EvTkEOnlgVguMa38Frf2pKwlDo31zJ40fPPtPTLoBwN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIQa0gfW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIQa0gfW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BFA1F000E9;
	Thu,  3 Sep 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417264;
	bh=KCcsyr09v6sKfqrUb8h2WOcFODSh7wHf/CiWArGzID0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gIQa0gfW8L/dweULdsFNeIM2n7n1P/E7SNuGqBZpPzbI9ra4FVwBdjtpfVcsLnmyE
	 3YZqo2arbJnZdcIBwtlxaGnvPxjTLVVUQuRErkRya+w81tJNFdtQH0Frsl9R8VwqxN
	 z6OZaAt3SgwAZ8T/WhjEQhYxbL4d54d3w4cMqldBmjyxeOIUrIh7jmn1KbYiiOnNqm
	 qZtyEefSelM/QLx6YA0uFr5qxQLOjUacQn3X7XjgpXa2oa1VN/ZHSC+nJrRas6Tm0m
	 ZNfagVLIr3AM4RUcuKVbPdz9mSTtepYODR0bxh90y3wzQJBWBCTNfXzNQCuMlqY52E
	 gjS3dAYkP24Sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 1/8] i3c: master: Add APIs for I3C hub support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260903062108.2712296-2-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 06:34:23 +0000
Message-Id: <20260903063424.75BFA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Ignored return value of i3c_master_reattach_i3c_dev_locked leads t=
o dynamic address collision.
--

commit d579609388ce2e1b2127e5830b25d39229bf1664
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: master: Add APIs for I3C hub support

This commit adds CCC helpers, address slot helpers, and locking functions
to prepare for I3C hub support. It also enables registering virtual masters
with an explicit firmware node.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index afcd7a21a3e66..9ea4726495ff6 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -422,11 +434,18 @@ static void i3c_bus_set_addr_slot_status_mask(struc=
t i3c_bus *bus, u16 addr,
>  	*ptr |=3D ((unsigned long)status & mask) << (bitpos % BITS_PER_LONG);
>  }
> =20
> -static void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
> -					 enum i3c_addr_slot_status status)
> +/**
> + * i3c_bus_set_addr_slot_status() - Set I3C bus address slot status
> + * @bus: I3C bus.
> + * @addr: I3C address to update.
> + * @status: Address slot status to set.
> + */
> +void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
> +				  enum i3c_addr_slot_status status)
>  {
>  	i3c_bus_set_addr_slot_status_mask(bus, addr, status, I3C_ADDR_SLOT_STAT=
US_MASK);
>  }
> +EXPORT_SYMBOL_GPL(i3c_bus_set_addr_slot_status);

[Severity: High]
This is a pre-existing issue, but while reviewing this patch and how address
slots are managed, I noticed a logic flaw in __i3c_master_add_i3c_dev_locke=
d()=20
that could lead to dynamic address collisions.

If a device is expected to have a specific dynamic address, it attempts to
apply it:

	if (!ret) {
		old_dyn_addr =3D newdev->info.dyn_addr;
		newdev->info.dyn_addr =3D expected_dyn_addr;
		i3c_master_reattach_i3c_dev_locked(newdev, old_dyn_addr);
	} else {
		dev_err(&master->dev,
			"Failed to assign reserved/old address to device...");

The return value of i3c_master_reattach_i3c_dev_locked() is discarded here.=
=20
If reattachment fails, that function cleans up by releasing the addresses:

	if (master->ops->reattach_i3c_dev) {
		ret =3D master->ops->reattach_i3c_dev(dev, old_dyn_addr);
		if (ret) {
			i3c_master_put_i3c_addrs(dev);
			return ret;
		}
	}

This means the address is marked as I3C_ADDR_SLOT_FREE in the bus addrslots=
.=20
However, because the failure is ignored in __i3c_master_add_i3c_dev_locked(=
),
the device remains active in the bus list. A subsequently added device=20
(e.g., via hot-join) could then be assigned this exact same address, causin=
g=20
an electrical collision on the bus.

Should we be checking the return value of i3c_master_reattach_i3c_dev_locke=
d()
and detaching the device or reverting the address state if it fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903062108.2712=
296-1-lakshay.piplani@nxp.com?part=3D1
