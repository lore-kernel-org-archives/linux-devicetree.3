Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49AF3E5ECF
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 23:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785887352; cv=none; b=HAxvHypUVrI08NBr+BKEhQLV/+WdI8n55RDw7MFtBQIiuj/sFk9xAHhIGfrGpPLVkNOHsCirSfMs5nPA5mzn7JKwqC38KebTOMj3gmiG/dW3v/PDRqmHb3bWiS3ZlFwaGAUu5UA6TwMqvnk262twoFeFTx19IdhXjd8gqlKaViE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785887352; c=relaxed/simple;
	bh=5hpP7z86FFY8OXWHUhmNK0j7bqpXKUc6PTcv7+UYwN8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PrGuI7YyGEd2xbvpnnC1iCNJxVUG3/dfepKbyPpZ0BGHiq68QYWKb3mdnOQWD3c+EuzPl2GBxFBOAB3gfTNwB7KTLFQSPT+JTqLY5Xf3tWHHa9rgPsdGa26V/XrhUiSnp2oIfSrcVL+4gWpFP6SUfuzsB6sAAYwKxXRTmV2+rEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsIZixB0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsIZixB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5A21F00A3A;
	Tue,  4 Aug 2026 23:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785887349;
	bh=5hpP7z86FFY8OXWHUhmNK0j7bqpXKUc6PTcv7+UYwN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OsIZixB0xhxbCmUQBHv2IYU5VpVPHFiXhFAR22KNu1PX3jDjsmtitjHrBGUZ0XeJT
	 timt1WgceMtaSVATOA628iTMP2oqpZvAmnE8Lv1epbovEa5cgLVbBX0VzwtJQP2x+5
	 RQuX2bDswRrk7+gdBQKrbyD9G4jIT53SYFCTIu/2ZF7biA7HqINkAm1TPhSlkZPyS9
	 kfc1sT6t4onn02dD2WxsZF2hHHiQIu/658+1zMzoour8w6xqdviPGcyqP0OhbvEcmr
	 H0meMvFmVzWuXdsCbc4VrxVUXG61RFdp+r/gyX/GUNWepkhEffBKQP+YEux1Pm7C02
	 /EDopdv8E7HAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/3] net: mdio: make device map changes
 hotplug-safe
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-submit-mdio-of-dynamic-v2-v2-2-f8841f3124d7@gmail.com>
References: <20260803-submit-mdio-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com>
 <20260803-submit-mdio-of-dynamic-v2-v2-2-f8841f3124d7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 23:49:08 +0000
Message-Id: <20260804234909.7E5A21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] `mdiobus_remove_devices()` can race with concurrent non-dynamic de=
vice removals, leading to a double free of the device reference count.
- [Medium] The dynamic removal safety mechanisms introduced in the patch ar=
e dead code because `device_remove_dynamic` is never invoked.

Pre-existing issues:
- [High] Accessing `bus->owner` in `phy_detach()` and the error path of `ph=
y_attach_direct()` after potentially freeing the `bus`.
--

--- Patch [2]: [PATCH net-next v2 2/3] net: mdio: make device map changes h=
otplug-safe ---
Note: The format of this review has been altered to a free-form summary due
to recitation restrictions. A standard inline diff has been omitted.

commit 22975fc157973334c571ff5ec87c6baf39897f09
Author: James Hilliard <james.hilliard1@gmail.com>
Subject: net: mdio: make device map changes hotplug-safe

This commit adds serialization and safety mechanisms to MDIO device
registration and removal. It aims to protect the device map from concurrent
dynamic firmware changes and bus teardowns by pinning dynamically removed
devices.

[Severity: High]
Does mdiobus_remove_devices() have a race condition with concurrent
non-dynamic device removals?

Looking at mdiobus_remove_devices() in drivers/net/phy/mdio_bus_provider.c,
the loop reads the device pointer from the map and subsequently calls
device_free() without taking a reference or checking for a concurrent
removal's success.

If a concurrent thread performs a non-dynamic removal (like an SFP unplug)
calling phy_device_remove() on the same device, it could successfully
unpublish the device and call phy_device_free().

Then mdiobus_remove_devices() continues and calls
mdiodev->device_remove(mdiodev). This fails internally with -ENODEV in
mdiobus_begin_remove(). However, __phy_device_remove() and device_remove()
swallow this error and return early without indicating failure to the void
returning caller.

Because of this, mdiobus_remove_devices() unconditionally proceeds to call
mdiodev->device_free(mdiodev), resulting in a double free of the device
reference count.

[Severity: Medium]
Are the dynamic removal protections reachable in practice?

The patch introduces mdio_device_remove_dynamic() and
phy_mdio_device_remove_dynamic() intended to pass dynamic =3D true to the
removal routines.

However, the function pointer device_remove_dynamic declared in
include/linux/mdio.h is never invoked anywhere. The standard APIs continue
to call phy_device_remove() in drivers/net/phy/phy_device.c, which hardcodes
__phy_device_remove(phydev, false). This appears to leave the dynamic
removal safety mechanisms inactive.

[Severity: High]
This is a pre-existing issue, but can accessing bus->owner cause a
use-after-free?

In phy_detach() in drivers/net/phy/phy_device.c, the code calls
put_device(&phydev->mdio.dev) which drops the network driver's reference to
the PHY device.

If the MDIO bus is a separate device that was already unregistered and freed
by its driver, dropping the child PHY device removes the last reference to
the parent bus kobject, causing the bus structure to be freed immediately.

The very next line checks if (ndev_owner !=3D bus->owner), reading from
potentially freed memory.

The same sequence exists in the error_put_device path of
phy_attach_direct(), which calls put_device(d) followed by checking
bus->owner.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-submit-mdi=
o-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com?part=3D2
