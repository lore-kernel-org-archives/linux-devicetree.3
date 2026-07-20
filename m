Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EEF3E958F
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561867; cv=none; b=tzca86yxJb6o6bFA8fPVnMN5E0CtRIricwyIU0ZEvxOXgk7zbhH7H7EuGgrCv86wwavz43WlEfEI4VMeCebd7HKnSlHx0FLrAvRIvzQxbxdVZ6EiWegfBeo1adyThyYPOA3Fszg6sc4jrra9TZUSqcsZVmSJvrXB44HFMzqXL4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561867; c=relaxed/simple;
	bh=Fvc43XFCtpD+rWvjQhIUIEquultOOKHaHl0ql4CuykE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eie4x9BN66I5/UU2PpEq7Tss7Tp1cvXclZre5ypqZlYNNUDHks/5owswZ1rUzh47T6R5V/k6FHg4WqXjoT1RF7z2RDO87DKSgxrA63BrTxjxpQngNLf5FO/fPp2zPdl9CwQtVFRFYnouR/xM/PhaQezgKQQEdE7PGAGdIxOkRCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNfpy/03; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNfpy/03"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BC21F00A3F;
	Mon, 20 Jul 2026 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784561865;
	bh=uSnN0Ka5V0fkXt0oqtU6U2UjM2hgBBFpRlN4nOyEFkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LNfpy/03szprSLih2eTjVOy7quvwJ5r5bGBeW9D81uNGSCEwh1eO70iZlxfGL66Go
	 Lde2ck1z7uOuKriDvDZ4m78mGR17lc3qh2cY3cRI9HyQT7pcPSJD35hAw3FdHQQf+/
	 zpRfdEhDbAcPmqaRXIwrs3XWnDm5peO9BZKl6NgAqbkirsK36wK8+zY/FOP7r1Q3LJ
	 d8Skr52ulbewSn+dEutXD6juqwdrB7v1b577LHW7BfcGS/EfzekMqwe8Jbl1Tx/KH8
	 szX9/4Lu2c+m7d7Dx72o6S54DGZnMhQRntBAhbgbVav6FkPvb3IdBevzVCPC2lfVvd
	 OuiN6sWJmg2ng==
Date: Mon, 20 Jul 2026 16:37:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Leander Kieweg <kieweg.leander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: Add GlandaGPU binding
Message-ID: <20260720-caloric-lisp-67a55f4920d2@spud>
References: <20260714101146.200416-1-kieweg.leander@gmail.com>
 <20260714101146.200416-2-kieweg.leander@gmail.com>
 <20260716-decidable-tingle-175efaf36540@spud>
 <CAMwcS0hBc_ruk_r+F6cQHQzO+jZagi3M9_AHQ3fpT7cbSUqeOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PeB1kup6Wwr0UQKJ"
Content-Disposition: inline
In-Reply-To: <CAMwcS0hBc_ruk_r+F6cQHQzO+jZagi3M9_AHQ3fpT7cbSUqeOg@mail.gmail.com>

--PeB1kup6Wwr0UQKJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 12:39:19AM +0200, Leander Kieweg wrote:
> Hi Conor,
>=20
> Thanks for the review.
>=20
> > Sadly googling this device only shows up Phoronix and other copy-paste
> > reporting sites. I think it'd probably be good to include a link to your
> > project either here or in the commit message.
>=20
> Good point either way. The link was in the cover letter, but I agree
> it makes sense to have it directly in the description too, so it's
> not something you have to go dig up separately when looking at just
> this patch.
>=20
> > This clock sounds like it is actually required? Doubt the device works
> > without it!
> > pw-bot: changes-requested
>=20
> You're right, I'll move clocks into the required list.
>=20
> > Usually I would say do not include things if you don't have to, but I
> > would much rather you did if the alternative is an interrupts property
> > like this that doesn't resemble anything used in devicetrees.
>=20
> The example was actually taken from my DE10-Standard DTS, just
> shortened, since I understood examples are generally expected to be
> minimal. For v2 I'll add interrupt-parent back in and use the
> GIC_SPI/IRQ_TYPE_LEVEL_HIGH macros from
> dt-bindings/interrupt-controller/arm-gic.h instead of raw numbers:
>=20

All of this sounds good, thanks.

> #include <dt-bindings/interrupt-controller/arm-gic.h>
> gpu@c0000000 {
>     compatible =3D "glanda,gpu-1.0";
>     reg =3D <0xc0000000 0x1000000>;
>     interrupt-parent =3D <&intc>;
>     interrupts =3D <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>     clocks =3D <&osc1>;
> };
>=20
> Thanks again,
> Leander

--PeB1kup6Wwr0UQKJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCal5AwgAKCRB4tDGHoIJi
0jO6AP9uoWP0h3/12z0h3pmBr4+lbYgaZ11MRcd21hJwgOV+AgD8D6VOheNoRfNo
kBaQhujdBvCka3mIvad5/lH0gEirpQk=
=A0Tp
-----END PGP SIGNATURE-----

--PeB1kup6Wwr0UQKJ--
