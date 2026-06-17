Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2733E480DFC;
	Wed, 17 Jun 2026 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710615; cv=none; b=QMKmLh4xqg5en7Z1mGNVviIyBG0hjl4VpJkBUqUHe9/0bPDf+E8+8aOi1FfbccTJNNhqgKOR8mG0mVn/P56QKSTQRZB9mPX1MpDDf3mclcaWldBeVNJdWMGqqaENEPUx1UCSKZemkTfarKAHSiZe2LIEfNSAkpSB5tiqcjWqLwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710615; c=relaxed/simple;
	bh=xmTQicoQE2H+avHjC7/Sv4C1End6Qkz6wxBOkSkJ7CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSWjADSvW1DeIdDVuGMEQZMJmKB4e5QyX2S894cB8X9PSftPlwrNQLxfabsblxaPwx4tcC0McmsnJ4CKfne+YStuKMIvc/D2vyN0a23E0N7Yx8bhzjsWMG2PRlNQTmIDok+BAJoG87Ug7QLTU4CgFMs2bKI1gi+rWkt8jd7ziWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTBv0m4T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTBv0m4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C7F1F000E9;
	Wed, 17 Jun 2026 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781710603;
	bh=Y8g66KJwBPZsW4kGLX7IfuRshXZ2752vVmoP7Phu2tQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RTBv0m4T8qa5Yd4T0uGzFrpIFMTIF+TSExgcX4UX9l7jnHKehY1bNgsNCbHJ5s//I
	 niujBDjlpkhNXvjRIxuLpiEFNwXGNDWK/VQZLUtpf6b+9UDHp4Q8dsmaEGZZNG26bd
	 6VHER+fgvM4Cvu68scIvQdIZPwYMeSfGxie4eHfZbgz0GGVOaZDGHNvn5NSwLdgMmy
	 S+UL/REbSHx1okK8wISiWqza0qBcZ4oSLiuRBXjF3mzViEL+zDZnbnv4lUrRr5uRJn
	 VqxDByyxXB3LqJlb4gV/2cupqNeTz3aOqshTrByM47H6aTMEOuYWs9q9AyX8GDBBBw
	 7JmIMa0LB3eSQ==
Date: Wed, 17 Jun 2026 16:36:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Amit Barzilai <amit.barzilai22@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	airlied@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH v2] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
Message-ID: <20260617-reorder-impale-3d79d9ae6c8c@spud>
References: <20260615175620.88828-1-amit.barzilai22@gmail.com>
 <20260616-nautical-obstinate-a92fd80ef483@spud>
 <87a4suzc0c.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="krgfDnuULe9BxIWJ"
Content-Disposition: inline
In-Reply-To: <87a4suzc0c.fsf@ocarina.mail-host-address-is-not-set>


--krgfDnuULe9BxIWJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 06:27:31PM +0200, Javier Martinez Canillas wrote:
> Conor Dooley <conor@kernel.org> writes:
>=20
> Hello Conor,
>=20
> > On Mon, Jun 15, 2026 at 08:56:20PM +0300, Amit Barzilai wrote:
> >> Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
> >> RGB OLED display controller driven over a 4-wire SPI bus. The binding
> >> builds on the shared solomon,ssd-common.yaml properties already used by
> >> the other Solomon display controllers.
> >>=20
> >> Assisted-by: Claude:claude-opus-4-8
> >> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> >> ---
> >> Changes since v1:
> >> - Drop solomon,width / solomon,height: both are deducible from the
> >>   compatible and are already declared (as optional) by the referenced
> >>   solomon,ssd-common.yaml, so a local override is unnecessary.
> >> - Drop the rotation property: it has no consumer (rotation is being re=
moved from the driver).
> >> - Use dt-bindings/gpio/gpio.h flag defines in the example
> >>   (reset-gpios active-low, dc-gpios active-high).
> >
> > The user for this appears to be in staging. As far as I understand, the
> > policy is that we only add bindings for staging things when they move
> > out of staging.
> > Sure, this is straightforward but why should an exception be made here?
> > Are you working on moving this out of staging?
> >
>=20
>=20
> This DT binding was part of a series to add support for "solomon,ssd1351"
> to drivers/gpu/drm/solomon/ DRM driver. Amit only sent a v2 of the binding
> schema because he had some questions about the driver:
>=20
> https://lore.kernel.org/dri-devel/87cxxqzwxn.fsf@ocarina.mail-host-addres=
s-is-not-set/
>=20
> But yes, I agree that it would had been better for him to post this as a
> part of v2 (and I still expect him to do it), otherwise it is confusing.
>=20
> Specially since as you pointed out, there is an existing fbdev driver for
> the same device in staging.

Right, I'll expect this to reappear in a larger patchset then that
deals with the fbdev driver and adds the drm driver.

--krgfDnuULe9BxIWJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajK/BgAKCRB4tDGHoIJi
0r1zAP9f+sSGWQy6nGX3+0rvT7BTQZ5AedPyHULNyGMT5zpB5gEA8AJ7JTFTSP55
wNhtssW6Dw5KE7Mf4Ljmv4GYDS1e4gs=
=t6xE
-----END PGP SIGNATURE-----

--krgfDnuULe9BxIWJ--
