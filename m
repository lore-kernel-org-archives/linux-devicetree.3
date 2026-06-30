Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE3F1A9FBD;
	Tue, 30 Jun 2026 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838913; cv=none; b=dgJxGNvNV79VoabuMCAFqyvVdASus12/r/W0KSpf0x/tM6yt/tbsCGfBWnLG3jTaF3XGMK8YbjlpFWlX1b35A8FUjN+XLJvW+HAcvTHsTxCZLU1SSplKl02yuxvOWZ6Sig/5FY0Y0lV8LgX8yn67wSA2KmvsKp7r8bq8xzcw36E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838913; c=relaxed/simple;
	bh=/mv4wVM6OFf8sEdIQXMPemskyZZTp/pXShw4YQV6bWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKRW2Qhb3ljHlY2v059HWVK0lPCIeFmv/p8d3E1dbMuizorPFM7Lwx3FfXCve9p8EBt1un224DzZ4mR4Nh36WaN0/BrRtmOAcq64FnvqBXGyuQR2z/dgXBVrp3bh4irFFdun48MS1JSvUNnGVtDxUCau2XEAfRQ4utz6y1UKg2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IquSNYx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IquSNYx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6FE1F00A3F;
	Tue, 30 Jun 2026 17:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782838912;
	bh=r1fPFrDZ9NhL5N/9RJ6igZAPje/KpsEjFsCfMVm5Oic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IquSNYx4CxMUC+vKE+lrEekfi8VHNUEUW0gQnl27gVgl7J6Z4CeupqbtYTtpw8FG0
	 DkKfZPdrUZBG0ghDfPk+Gpu9n+W7SCEsPCVi2f3z7X2T2hlN5bAbcZjHzZewapI1+2
	 tUP/ppMPb+9ousSo86UHxO9zvVSe6RNeeaWmGGw8djErdVP9d0YlSegLn6YG0wCQS5
	 5+2nIMhjqP+0DGrJxXokAq2Q6VebdrQhSqBJjkzwgInSgNGLgCC0QFr0ReyMxaGzbU
	 hFZJ+e3H8oZgrXpxqKT6xQ5cXBaebJNUbdPd5A3yAok7n4hDk9XRx1TTJDPAfW+ocY
	 2FLlVP1YusxkA==
Date: Tue, 30 Jun 2026 18:01:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
Message-ID: <20260630-galleria-monorail-bf3b4f6c7a25@spud>
References: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
 <20260626-rpi-tryboot-v1-2-490b1c4c4970@linutronix.de>
 <20260626-quaking-shove-fcc9d8057ae0@spud>
 <qgoblikagfbcmbqoryw4ajfa6qyx3wpj4qfeuuntima542qlkq@evebdvjaxern>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nr/V2KaeEBWBPf17"
Content-Disposition: inline
In-Reply-To: <qgoblikagfbcmbqoryw4ajfa6qyx3wpj4qfeuuntima542qlkq@evebdvjaxern>

--nr/V2KaeEBWBPf17
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 03:56:32PM +0200, Gregor Herburger wrote:
> Hi Conor,
>=20
> On Fri, Jun 26, 2026 at 04:57:35PM +0100, Conor Dooley wrote:
> > On Fri, Jun 26, 2026 at 09:35:05AM +0200, Gregor Herburger wrote:
> > > The Raspberry Pi firmware allows to set a reboot mode called tryboot
> > > that allows to try booting from a different partition to allow updati=
ng
> > > of the boot partition. Allow reboot mode properties by referencing the
> > > reboot-mode schema.
> > >=20
> > > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > > ---
> > >  .../devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml   =
 | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bc=
m2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi=
,bcm2835-firmware.yaml
> > > index 983ea80eaec97..30b490e0d9fb3 100644
> > > --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-f=
irmware.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-f=
irmware.yaml
> > > @@ -133,11 +133,14 @@ properties:
> > >      required:
> > >        - compatible
> > > =20
> > > +allOf:
> > > +  - $ref: /schemas/power/reset/reboot-mode.yaml#
> > > +
> > >  required:
> > >    - compatible
> > >    - mboxes
> > > =20
> > > -additionalProperties: false
> > > +unevaluatedProperties: false
> >=20
> > I think you should keep additionalProperties: false and add
> > mode-normal: true
> > mode-tryboot: true
> >=20
> > (I don't know if the latter works though, you may need to have a $ref to
> > uint32-array).
> >=20
> > What you've done permits freeform reboot modes, but I think only normal
> > and tryboot are valid?
>=20
> Ah yes good point. I do think it should be restricted to
> 'mode-{normal,tryboot}'.=20
>=20
> Sashiko also suggested to set maxItems to 1 and I think that is a good id=
ea as
> well, because afaik the firmware only accepts a 32bit value for the reboo=
t flag.
> The $ref to uin32 is not needed that is already enforced by the
> patternProperties "^mode-.*$": in reboot-mode.yaml.
>=20
> Therefore I will add the following (and keep additionalProperties: false):
>=20
> properties:
> ...
>=20
>   mode-normal:
>     maxItems: 1
>=20
>   mode-tryboot:
>     maxItems: 1
>=20
> allOf:
>   - $ref: /schemas/power/reset/reboot-mode.yaml#
>=20
>=20
> I will do some more testing and send a v2 later.

Cool, sounds good to me.

--nr/V2KaeEBWBPf17
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakP2ewAKCRB4tDGHoIJi
0tjSAP9JKMAbY3EfCZuyJTIoiA2kkQtFs91Hj5L7Qd2Ub1cFXwD7BAd+zepdemEz
lzDLgaPXEn4Kt442IPX7QNtBaROagQ0=
=aKzA
-----END PGP SIGNATURE-----

--nr/V2KaeEBWBPf17--
