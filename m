Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D35524336D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 23:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784937060; cv=pass; b=t5fESsQjOx5LiNrarAv7m2laLB9A90Q6X07QslE9uUngoieHSBizS+WGEwaHc56KkGcq3YG0Zj8gz1cCPAWBhlkE0xHc9Sd/cJiC9FnG5oaaz9H854v00C/a3N2WphV3vZYd1b7TLy0auyZx7DH3HD8ti5PxtyQbNpinFOBeLM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784937060; c=relaxed/simple;
	bh=c/uR5omiNa8rn9xWvDDs5uqV3qiNuYIX8EuBobbLLFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfz6aZB7LIh7LURfYLBMyIU/xZdLIqX8FLl6/pSDKrFbRwJgPnfm5Zq2P2G//OXMfD3AGz7qmXJq/AZ7Fcaq0yKIJlgt+4TAvvMhaZjKFx2pNz8dTsFQY02BgzdXqdeXHuKTCBdI7XOWhGKGCrUab+tWm9flwtMJPyv4sTzI8tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=EIRak2y0; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="EIRak2y0"
ARC-Seal: i=1; a=rsa-sha256; t=1784937034; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VULkOJigyteQLneQWwoudSLWqNQxvc42XI6rY4RN7QGqU519LVBA4Uw7Ks3avVw5CNeDNLXE5UvDymGboihvzl4OByi/14SUUrhdX1oHtX0R0T+6zOy8kX2tJAwgx9oKnmYzxmndEBxQVLo17GKhZChhb15orrrZzF+S/SNQyPc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784937034; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=z2QRsqk7daq3MztyIpPJjGa56JAZ8ivnXP3yG2EVpb0=; 
	b=QBEcf9IoFaYgMWeBVaI8whSbF/6CRmKn/XVeqGuV8oOTr1aKK86bW6/MQtkjK95tm7MxPKDnHxBKBYzmAgANRaRvqwskuCwAfALE6hSA/rSOJOaWecH/QkN2vCO4bl1qYS038JXIcuhZ028H2u/XOJ1L3APDTXEbO+U2Zt9fdGo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784937034;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=z2QRsqk7daq3MztyIpPJjGa56JAZ8ivnXP3yG2EVpb0=;
	b=EIRak2y0y+kYlUBbA+U/kkTGIE1HQRliglda0Ufu85x6P2yge8yk5T1vhxLcz74H
	RKCUV37fvapTHRIX1Sraa6uIo0t7gOHewTNMuaZ+dwFQrJ7dCya7tg18NrrUR+yvzwt
	cPCqJ0L1lz10e5/2sBrdRC3ljOaBMTS5WSqj6K3k=
Received: by mx.zohomail.com with SMTPS id 1784937031509923.2465304793352;
	Fri, 24 Jul 2026 16:50:31 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 2BE0B181F16; Sat, 25 Jul 2026 01:50:28 +0200 (CEST)
Date: Sat, 25 Jul 2026 01:50:27 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	xsf@rock-chips.com, heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V9 0/4] Add Anbernic RG Vita-Pro
Message-ID: <amP3nfQCPfmbN8WR@venus>
References: <20260722165806.161020-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e36kryrmn767kiiq"
Content-Disposition: inline
In-Reply-To: <20260722165806.161020-1-macroalpha82@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.919.37
X-ZohoMailClient: External


--e36kryrmn767kiiq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V9 0/4] Add Anbernic RG Vita-Pro
MIME-Version: 1.0

Hello Chris,

On Wed, Jul 22, 2026 at 11:58:02AM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add support for the Anbernic RG Vita-Pro, based on the Rockchip RK3576 So=
C.
>=20
> Changes Since V1:
>  - Updated documentation filename to matche compatible string.
>  - Corrected order of allocating IRQ in charger driver and switched
>    to using devm managed function to allocate work queue.
> Changes Since V2:
>  - Corrected issue with naming of panel binding document and added
>    fallback compatible string.
>  - Switched to devm helpers in panel driver. Note that
>    devm_drm_panel_add() is currently only in the drm-next branch.
>  - Optimized setting GPIOs for panel driver.
> Changes Since V3:
>  - Fixed numerous issues identifed by Sashiko bot, mainly relating
>    to unclamped or improperly clamped values from within the
>    charger driver.
>  - Corrected hard-coded values in the panel driver unprepare routine
>    as well as correcting an improperly checked return condition.
> Changes Since V4:
>  - Fixed errors identified by Sashiko bot on charger driver that could
>    result in an improper value being written to the registers.
>  - Corrected some error handling in the panel driver.
> Changes Since V5:
>  - Corrected minor errors in documentation and added default values.
>  - Further corrected clamping behavior in charger driver.
> Changes Since V6:
>  - Additional corrections as suggested by Sashiko bot to fix potential
>    edge cases during probe for sgm41542.
>  - Corrected an improperly shifted value being written to register for
>    sgm41542.
>  - Changed a MV value to UV in sgm41542 driver to simplify function.
> Changes Since V7:
>  - Added PM functions to sgm41542 driver per request from Sashiko,
>    which stops the hardware watchdog during suspend.
>  - Switched from device_init_wakeup() to devm_device_init_wakeup().
>  - Confirmed a state change in IRQ handler for sgm41542 to ensure we
>    don't update input current limit except when the vbus goes from
>    not okay to okay.
>  - Removed panel patches, which have already been accepted upstream.
>    Please note that this *may* cause an error about missing bindings.
>    See commit 0fd6ead8270270d859a28d0196a4b47e7d6845b8 in linux-next.
> Changes Since V8:
>  - Added linux/bitfield.h header to prevent compile errors on certain
>    platforms.
>  - Added regulator to Kconfig as a dependency.
>  - Added mutex to IRQ handling function.
>  - Added update to watchdog enable field in suspend routine to ensure
>    watchdog status "goes back to the way it was" after resume.
>  - Sashiko complains of an issue if userspace updates values after
>    devm_power_supply_register() is called but before the hardware
>    limits are set from the device tree. While this is possible the
>    threat of a problem should be very low given that the hardware
>    limits are set immediately afterward and would overwrite any
>    wrong values from userspace (should happen within a few
>    milliseconds). Unfortunately, given that the function to get these
>    limits requires the power supply be registered in order to read
>    the battery node, it's not something that can be easily fixed at
>    this time. Since it's an *extremely* unlikely edge case, I think
>    that's acceptable.

Looks like there is more sensible Sashiko feedback. Regarding this
one you can use this new functionality:

https://lore.kernel.org/linux-pm/20260721185904.40756-2-vincent.cloutier@ic=
loud.com/

It's not yet merged, because it needs a user and I had some feedback
on the follow-up max17042_battery patch using it. But I can take it
together with the first user, so it's not a blocker.

Greetings,

-- Sebastian

--e36kryrmn767kiiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpj+j8ACgkQ2O7X88g7
+pqplw/9GzDVjxDOFKYHWGpcjeavUnnv0Rf8DfITaRBPfPeuKlA7lHnLsUxByCL2
Kq7MrW2GzGVTTOnH0QFo7tKjhHkochlbshsRoYRwILjKslWMoYtaGwmV/Ldu2S/3
ObGTj9vPBTTBXs1gKuHDrhmRE2sCIXMhgmuuvCwCiXnaGrEnX2K4exe9iCwPmG1P
4luRYsljjrS34FCcyGcgRYwIwXx7P49a1ZrTISORs5Q5reBXK4JsS+OAEH6DPwXQ
A+OqaSW1yXMh6l6dqZeZ2/L9MpnXCFFBeaKRi/ySq7pmkAWRiEvooLkbDY6r1yJD
3vFa7Z9AI1axbT1PBq1xXy6qSkKydntcuAVzEkpXwEpHyYvF6Fje1pYA9IrR7doP
medaXyPyYxB0jKFi/fGMHcMjUNSGj96LCFDKBLPQDI7iKrZ1+kZyvV2UtJADo6lT
2+rO+Xg3SyEJFaLDyr+qGb2SApCLsorSjEcMzOgc4OT6zNHFNQOBl2bmoeskf24v
KxDOnfhr+pSCSNxOZBy8xnKQiz4L2B4rmoTRGoS9G9tXkOFzyZEDWfWlCDBxTp5u
a6XsTgzz946RjJwOtkQYw2vPyeJr5FoXYceiw0N7wxgVaFeHR1HWY+QztAPbLgoa
y18cklEp5A3C3TeMEeloHD4JC28rq4y1WABdLkQuj8F9cY9OQRs=
=Eoet
-----END PGP SIGNATURE-----

--e36kryrmn767kiiq--
