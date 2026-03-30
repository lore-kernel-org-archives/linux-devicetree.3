Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88F9376BDE;
	Mon, 30 Mar 2026 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887378; cv=none; b=JXQA0KTnZwGFq0jfZMkkHUiI0vYeNTq56jUWJ5IKCWGmpP5oYu+zpTFFo2M/aeUOKt0S4YrxkpJSFSZnVnioLUheapna6bsH7fbzRZ1Kp4WpYC9mHwOZxvPOgnE3Ty1hK95adgm5bn4aOT80rqTgb4gMRK3dPjtgODP5yZiqpl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887378; c=relaxed/simple;
	bh=RNuQc1FXJX0gJoQdRCwM4KulnZVJtsA3YzsnFaTWbis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NM5gl7eZIF5crqntjTLR5/lfmDykRyG75orPNPpP4XJEZQ8GQb4ey0vB4ix9LtfcTtV/FHjzOfbnWpQ0sffwezN80FknXI749CvloUA/dZKZ+mJnGmk+/s5JO4amyCEcIDjea+RPKjptjdqn9HuoK3fEmDV7SskxcGaZ+37VJNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlOfYQHG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlOfYQHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3848C4CEF7;
	Mon, 30 Mar 2026 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774887378;
	bh=RNuQc1FXJX0gJoQdRCwM4KulnZVJtsA3YzsnFaTWbis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlOfYQHGvmyl+YASSPWeBu0+faicc1SdY23zADSiBarF8FLIkq/3nvTAfzS6RMqA/
	 UNO6MK+76XjCh353k+DyDZiUSDbIdpZJO1NKn2BehuNr7ndrDL1GwG06N+iyU25zBi
	 sbA04h0rmNiS18tfAFCGaelOPfdg6gqLZuwQ2fFYMEhjp20yVKlF+9p7cRPlHSe6kJ
	 Amr3FaucncVV4iaMMlWg91Itd+GRDVf+S5Adi7hgKpEC42PhhzmUeP5HQMhq5UnR6K
	 SKE3FdVZmPmKwXd4Ygar15vG3DXagjguCYgddHTQSUGwNddXcswSW5YMqKs3F28d8x
	 LJgKh3ZTkiTbw==
Date: Mon, 30 Mar 2026 17:16:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Charles Perry <charles.perry@microchip.com>
Cc: Nick Hu <nick.hu@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <20260330-relative-hardened-5ce35fe1ef57@spud>
References: <20250321083507.25298-1-nick.hu@sifive.com>
 <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j4xEBCRS2Ch7EH1t"
Content-Disposition: inline
In-Reply-To: <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>


--j4xEBCRS2Ch7EH1t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 01:55:38PM -0700, Charles Perry wrote:
> On Fri, Mar 21, 2025 at 04:35:06PM +0800, Nick Hu wrote:
> > Add compatible string and property for the SiFive CLINT v2. The SiFive
> > CLINT v2 is incompatible with the SiFive CLINT v0 due to differences
> > in their control methods.
>=20
> Hello Nick,
>=20
> Can you help me understand what is this different control method? I've
> found that both OpenSBI [1] and U-Boot [2] use the same match data in the=
ir
> clint driver which would indicate that they are compatible.

Hmm, good point. I didn't see that the drivers were not doing anything
different. I guess really the clintv2 should fall back to the clintv0,
and the difference in hardware should be elaborated on.

I think I also dropped the ball on sifive,fine-ctr-bits, and that should
be removed and the counter width determined from the compatible.
There's no users for that yet I think, and there's no valid users of the
clintv2 compatible /at all/ so maybe it can just get culled.

>=20
> Also, do you know if there's an easy way to tell if a sifive clint is a v0
> or v2?
>=20
> Thanks,
> Charles
>=20
> [1]: https://elixir.bootlin.com/opensbi/v1.8.1/source/lib/utils/timer/fdt=
_timer_mtimer.c#L163
> [2]: https://elixir.bootlin.com/u-boot/v2026.01/source/drivers/timer/risc=
v_aclint_timer.c#L86
>=20
> >=20
> > Signed-off-by: Nick Hu <nick.hu@sifive.com>
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> > - v3 changes:
> >   - Add the reason for the incompatibility between sifive,clint2 and
> >     sifive,clint0.
> > - v2 changes:
> >   - Don't allow sifive,clint2 by itself. Add '-{}' to the first entry
> >   - Mark the sifive,fine-ctr-bits as the required property when
> >     the compatible includes the sifive,clint2
> >=20
> >  .../bindings/timer/sifive,clint.yaml          | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml =
b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > index 76d83aea4e2b..34684cda8b15 100644
> > --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > @@ -36,6 +36,12 @@ properties:
> >                - starfive,jh7110-clint   # StarFive JH7110
> >                - starfive,jh8100-clint   # StarFive JH8100
> >            - const: sifive,clint0        # SiFive CLINT v0 IP block
> > +      - items:
> > +          - {}
> > +          - const: sifive,clint2        # SiFive CLINT v2 IP block
> > +        description:
> > +          SiFive CLINT v2 is the HRT that supports the Zicntr. The con=
trol of sifive,clint2
> > +          differs from that of sifive,clint0, making them incompatible.
> >        - items:
> >            - enum:
> >                - allwinner,sun20i-d1-clint
> > @@ -62,6 +68,22 @@ properties:
> >      minItems: 1
> >      maxItems: 4095
> > =20
> > +  sifive,fine-ctr-bits:
> > +    maximum: 15
> > +    description: The width in bits of the fine counter.
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: sifive,clint2
> > +then:
> > +  required:
> > +    - sifive,fine-ctr-bits
> > +else:
> > +  properties:
> > +    sifive,fine-ctr-bits: false
> > +
> >  additionalProperties: false
> > =20
> >  required:
> > --=20
> > 2.17.1
> >=20
> >=20

--j4xEBCRS2Ch7EH1t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqhzQAKCRB4tDGHoIJi
0pKhAQCapYKXxoh7wLs86sKi36P+NYNvUj+JVTLeJMg/NjRWRQD/beEA2e9dqea5
uOIwS0m2yYSUNtMrp2iaJ77+8nu8Kww=
=jl1X
-----END PGP SIGNATURE-----

--j4xEBCRS2Ch7EH1t--
