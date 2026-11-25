Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629993;
	b=1BUnQ5KaKHpjVtpJCWMWOEUHki5yMxw+zeF/LiSFQAKfiBBj8mJPKdMQRp96bWfXqoeM
	 S4QVvTgKtOyJBDov4s2CH991hOSwbKf83l4hGVrpBJYl4x5kaDvozIkaqDdmUvkQSynVs
	 tT567l3oZL3D5s2I/xOzRTkvPl25cs0DArm1K4SqjEWvHSV8F9v2ia+OHoYIdsW70UJA6
	 1TKvbWUtym2lohkqn44mNlIUhLRV8jus3ytDhB2atfXQATKrYSfgi15eBFeV//7Smyfjl
	 uCnK+UxmxFH2GodZNjBVmiRN9ddbosMtYIl9m+ZGM0wQcu4O6RnMwilU58k4WubQqGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629993;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=D5XbwBFll67YZe8Aeb4/L1Vh5a1XCowJmsBP1YYfyKs=;
	b=wCsHmBbdPzCpR9HXcEemoVeWedXKrYHMNdsM+EwzFnV8p8NYFqpynd4HD8T1Nurk3tZA
	 657A3TUzXI71nj/d1ZonK3IlswgXBC6Ish8XqwU95/QDmWtVc2AZyoMlaSU2utVT7B40f
	 dudmUoYkUMH7N0DFSMERtsG9Nvw1574lpn6fbslrqIsCTsMFjISiSsnxPPoJtF+WfAjV2
	 Kv+bel0KPNZTaonRorUNtfnlX4NeQML22tMvBzw0BVroPohIghEzbGv++7L1ATzNgNVHB
	 Gvt9XYue7GnM92Rv5FNbJCj26jDgmbIEPOMfFZSOhVOYjR+QlX8bE/1vzwwacIEjvvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sm27QWLM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A7606A693;
	Wed, 25 Nov 2026 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sm27QWLM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC411F00A01;
	Wed, 25 Nov 2026 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629992;
	bh=D5XbwBFll67YZe8Aeb4/L1Vh5a1XCowJmsBP1YYfyKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sm27QWLMo77o4X0LRAYLJSKN9Uv7DC0hm3FXm0MQkDe4CqW+7xDDOhKZoIjp8GbvS
	 2U6qqMXDaG9LhA/M73SSxpczn0yjgMLX4kadRY5AUKRldJ4wru77H0pVV63I6ZTLhg
	 TkzN55VGPU3ff4u+lSvNzBjVVSSOs5m+Ug2comc5EX6FyEMjacogwcXPhvZ6oiATfK
	 ZYqGRkEp7lQK4ch50G0jZAYxaowVcPXh+HmZKJCKTbPGduqHOr9CusRvlKt+oNKj+F
	 rbFV9xzd5qwfjeLCBp33OBCyKF+kRwk8FqZSmVunxOqObpV2bj1NjAAWkdklznGGQD
	 rkrJXThI5ay1Q==
Date: Wed, 25 Nov 2026 18:06:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Mason Huo <mason.huo@starfivetech.com>
Cc: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>
Subject: Re: [PATCH v1 1/2] dt-bindings: ipmi: Convert starfive,kcs-bmc to DT
 schema
Message-ID: <20261125-outbid-ritzy-705bdb883059@spud>
References: <20261118062526.1436893-1-mason.huo@starfivetech.com>
 <20261118062526.1436893-2-mason.huo@starfivetech.com>
 <20261118-repackage-backlight-1bdc5955a8d2@spud>
 <BJSPR01MB0577DD87B6BE14E93640FD3A85432@BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RwHjz7y9O6zqBr58"
Content-Disposition: inline
In-Reply-To: <BJSPR01MB0577DD87B6BE14E93640FD3A85432@BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn>

--RwHjz7y9O6zqBr58
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 01:07:46AM +0000, Mason Huo wrote:
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 2026=E5=B9=B411=E6=9C=8819=E6=97=A5 1:58
> > To: Mason Huo <mason.huo@starfivetech.com>
> > Cc: Corey Minyard <corey@minyard.net>; Rob Herring <robh@kernel.org>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; openipmi-developer@lists.sourceforge.net
> > Subject: Re: [PATCH v1 1/2] dt-bindings: ipmi: Convert starfive,kcs-bmc=
 to DT
> > schema
> >=20
> > On Wed, Nov 18, 2026 at 02:25:25PM +0800, Mason Huo wrote:
> > > Convert the starfive,kcs-bmc binding to DT schema format.
> >=20
> > This is not a conversion since you are not deleting anything?
> >=20
> Thanks for the correction, will update the commit message in v2.
>=20
> > >
> > > Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> > > ---
> > >  .../bindings/ipmi/starfive,kcs-bmc.yaml       | 53 +++++++++++++++++=
++
> > >  1 file changed, 53 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/ipmi/starfive,kcs-
> > bmc.yaml b/Documentation/devicetree/bindings/ipmi/starfive,kcs-
> > bmc.yaml
> > > new file mode 100644
> > > index 000000000000..2cb91d321a32
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
> > > @@ -0,0 +1,53 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/ipmi/starfive,kcs-bmc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: StarFive BMC KCS Devices
> > > +
> > > +maintainers:
> > > +  - Mason Huo <mason.huo@starfivetech.com>
> > > +
> > > +description:
> > > +  The StarFive BMC SoCs use Keyboard-Controller-Style (KCS) interfac=
es
> > on
> > > +  the eSPI bus for in-band IPMI communication with their host. The K=
CS
> > > +  channels are part of a Super I/O (SIO) block and each channel occu=
pies a
> > > +  0x100 byte register window, starting at offset 0x200 of the SIO re=
gister
> > > +  space. A channel is identified by its register offset and the
> > > +  "starfive,sio-id" of the parent SIO node.
> >=20
> > Where is the binding for the parent SIO node? Hard to review this
> > without that I think.
> >=20
> Sorry for missing the SIO node commit, will add it next version, and it l=
ooks like:
> +        superio@10582000 {
> +            compatible =3D "starfive,jhb100-sio", "simple-mfd", "syscon";
> +            reg =3D <0x0 0x10582000 0x0 0x1000>;
> +            #address-cells =3D <2>;
> +            #size-cells =3D <2>;
> +            ranges =3D <0x0 0x0 0x0 0x10582000 0x0 0x1000>;
> +            starfive,sio-id =3D <0>;
> +
> +            kcs@200 {
> +                compatible =3D "starfive,jhb100-kcs-bmc";
> +                reg =3D <0x0 0x200 0x0 0x100>;
> +                interrupts =3D <282>, <57>;
> +                interrupt-names =3D "kcs", "espi_rst";
> +            };
> +        };

Why can this ipmi device not just be part of the parent node?

--RwHjz7y9O6zqBr58
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawcjpQAKCRB4tDGHoIJi
0nBLAP9RwUwiZwQ6dquOrw1OA9DuPS0z7Xh62O3XVtrlg6vheAD5AQAAO138w07c
4VSIjM6xrYcYkrHDFnKeQkE4UjQi7QI=
=4ZnL
-----END PGP SIGNATURE-----

--RwHjz7y9O6zqBr58--
