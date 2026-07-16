Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4810F2F3C3E;
	Thu, 16 Jul 2026 18:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227358; cv=none; b=WvMsRdg+xaLALmRoAfiv6d1jgORYA1rjcaHVmLy/If0ivK8PuPChSHUWMmxTbkb2ZEYrmjmk5v6VD0v6H21itlfLE48R5KaeH91kfrSkqQxSSxAjCGf+fl4nZ97JpCNpOHd8QRUjIiYu+sNJBb3rRTm9dMJSGGU0imqM/WSWzpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227358; c=relaxed/simple;
	bh=0siYRT4+wjKLiZm/1kLnlefwuL9oV/Rsey9j/gBz9jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ribbkkxk79gYV6BuOoETHz9cI5yMOdq8Sqjy6wjkpL2tjwLF+tnY8Oz2rq7ah9LSsXLEkoaN2OAz5RUo9IzSPUje48zAQxLfcRE5g25Kmp+4EMJ/ELSe+sdV0ZEEUIdoWbo0lIurcxRa6i0pdNP4Lev6+0XoVG5UrSb1u7+8a8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=yW30b834; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="yW30b834"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dS7MQ9GjgYYlC4ZQk9Q4bZOhvViKnvGdrp25MRR4MdQ=; b=yW30b834kQXISkqSpGGts9DsCP
	sM6c+crhLEO5njaLdSNLyFD1PbydnQSCz7PQn4cf4yuS1LCg1zVDjosI5IZnI1ywsBZV03Gm4DrBk
	I/MwW6nqhNHN/BBE+8eA/75lqt1WGB6b2lRGObIRDWs43L4v/mSopocNX6kuMH+SPYScmiPp5UDg6
	DLs8mRx/QKJYKGjUzDcvXTqnZBAdFFIjrgdk0kG/DfeLLkmpe0wOTYCngBkhvktnm5xuEXknwUugm
	eAQp5kdswfFrzGA9oYmZFZfWBKAEWSUKgYjATbCKSPpdOWyGNy0E8D4/OBfOXPeF6hLhE9QHq7Q9p
	F7ytLbcA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/2] dt-bindings: nvmem: rockchip-efuse: add
 rockchip,efuse-write-enable property
Date: Thu, 16 Jul 2026 20:42:30 +0200
Message-ID: <1819181.QkHrqEjB74@phil>
In-Reply-To: <6gn64vxmeksjtrp7q7y5jwniszeqrmdurbp4l466tli63aixnz@i6nlxwdjhewh>
References:
 <20260715110107.409204-1-hrushirajg23@gmail.com> <2363663.KTMopqUuYO@diego>
 <6gn64vxmeksjtrp7q7y5jwniszeqrmdurbp4l466tli63aixnz@i6nlxwdjhewh>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 16. Juli 2026, 11:43:03 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Hrushiraj Gandhi:
> On Wed, Jul 15, 2026 at 01:42:56PM +0200, Heiko St=C3=BCbner wrote:
> > Am Mittwoch, 15. Juli 2026, 13:01:06 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Hrushiraj Gandhi:
> > > Add an optional boolean property to explicitly opt in to write (OTP
> > > programming) support. eFuse bits are one-time-programmable and
> > > permanently set once written; write support must therefore not be
> > > enabled by default on arbitrary boards.
> > >=20
> > > Boards that intend to use software-initiated eFuse programming (e.g.
> > > factory key provisioning) must declare this property and must ensure
> > > the required VQPS programming supply (1.8V to 1.98V per RK3399 TRM)
> > > is present and correctly sequenced during writes.
> > >=20
> > > Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> > > ---
> > >  .../devicetree/bindings/nvmem/rockchip-efuse.yaml     | 11 +++++++++=
++
> > >  1 file changed, 11 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.y=
aml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > > index b80fd8d1ae5b..8a7195245c84 100644
> > > --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > > +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > > @@ -46,6 +46,17 @@ properties:
> > >        this property is defined.
> > >      $ref: /schemas/types.yaml#/definitions/uint32
> > > =20
> > > +  rockchip,efuse-write-enable:
> > > +    type: boolean
> > > +    description:
> > > +      Enable write (programming) support for this eFuse block. eFuse=
 bits
> > > +      are one-time-programmable; setting a bit is permanent and cann=
ot be
> > > +      undone. This property must only be set on boards where irrever=
sible
> > > +      OTP programming from software is an intended use case (e.g. fa=
ctory
> > > +      provisioning), and where the required VQPS programming voltage
> > > +      (1.8V to 1.98V per RK3399 TRM) is guaranteed to be present and
> > > +      correctly sequenced by the board's power design during writes.
> >=20
> > Devicetree is not a configuration space, and I think this really does c=
ount
> > as configuration - as the efuse will be writeable on every board.
> >=20
> > You mention the VQPS voltage. If I'm reading schematics and application
> > notes correctly, this is a separate input used solely for writing efuses
> > and _needs_ to be 0V (off?) during reads.
> >=20
> > You mention "needs to be present and correctly sequenced", who is suppo=
sed
> > to turn on/off that regulator?
> >=20
> > So you very likely need to define that regulator and can even use its
> > absence as an indicator to disable writes.
> >=20
> >=20
> > Heiko
> >=20
> >=20
> You're right, the boolean property was the wrong approach - agreed
> that it's policy, not hardware description. I'll drop it.
>=20
> I was planning to model VQPS as a proper optional supply in the
> binding:
>=20
>   vqps-supply:
>     description:
>       Supply for the eFuse programming voltage (VQPS), required only
>       on boards where software-initiated OTP programming is intended.
>       Per RK3399 TRM section 21.6.1, table 21-3, VQPS must be 0V
>       during reads and 1.8V~1.98V during A_PGM mode writes. If this
>       supply is absent, the driver leaves the nvmem device read-only.

I don't think the description _in_ the binding needs to be this verbose.

  vqps-supply:
    description:
       Supply for the eFuse programming voltage (VQPS)
=2E...

The text you have above, would be great for the commit message of the
dt-binding patch.


> and in the driver, gate reg_write on whether
> devm_regulator_get_optional() actually finds it:
>=20
>   efuse->vqps =3D devm_regulator_get_optional(dev, "vqps");
>   if (!IS_ERR(efuse->vqps))
>       econfig.reg_write =3D soc_data->reg_write;

Or alternatively just error out _inside_ the reg_write callback.
But not having a hard preference. I guess nvmem-maintainer will
tell their preference, once that change appears :-) .


> The driver would own sequencing entirely inside
> rockchip_rk3399_efuse_write(): regulator_enable() immediately before
> the A_PGM STROBE loop, regulator_disable() right after - mirroring
> how efuse->clk is already handled around the same window. reg_read
> never touches the regulator, so VQPS stays at 0V for the entire read
> path.

Sounds reasonable


Heiko


