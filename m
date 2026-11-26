Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717112;
	b=m70bW2TGcm65Kl+8wNFUmdbIdCRL2LLyYpVdDwAhNq2ZagdL6kT7z/JYstwsPiTpjabs
	 1dfW7YHHIx/FiKyg2H/6A4uYHOGGGEbfXsbczfN5DskMaALkcEqA+FpC/zChMvMk39C5v
	 Nx2Rhf9Mn/IAGxJRjEwD0yzJcYItAfxXcUO2ruMiqyTthAnWYA88eDrPLUWQGuXj0vVEd
	 a3qAtT7B7oNLonNMOg083jeLF7RySXB8CM5e2mkhx0kOqRsdh0DOiRQiowVHXZkVlNJUY
	 rJ1hQ/AY2DzjILoYnC/vfNyrjTwQrWXb3+nMajvmwj9aBPXlRFkx6nPa9AFXLnLdwDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717112;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8BpNljI0zI6NieikM1u8FAzIyioCzm5SAmcdeEaqao0=;
	b=z75X5fRqh27vdqMM+LRJ/QOOb1A6st9aPobSvUItXgzpHpwQBA47nDrutBdNv1yDlcQ3
	 9bbADHZg9Atl2PCP/eP0cAIsr0gcSyTrELY5P1iAxOnDacpKx7zxecqYlECQVML6E9xFC
	 iqktwUIQVue5iNhKt6Uioh1UOthk9r6ohEfr+jrgPWjLm0SZOlx5L2H5fFqtmFq+DoAoI
	 dEdQ1gDSKdITQU/M4UlOhOp94lcdUn3Pnmfz8zbkgk12B0kUxIKoN3IodrJnaycKLta+0
	 nlwIiXCF4Fm+ELA2oKYwN6k2bcFSvKUfiVdNAc1XMA6pYH7qqY0OZdWn9bzRG/ghFXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="binv/XfO";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FFD606A31C;
	Thu, 26 Nov 2026 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=binv/XfO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0021F000CA;
	Thu, 26 Nov 2026 18:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795717111;
	bh=8BpNljI0zI6NieikM1u8FAzIyioCzm5SAmcdeEaqao0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=binv/XfOVgWaSbFVNP3Pk5b3czxF7w4BQrcYpRQMB0U2PKzjII/uFnXO2OGQQYBVy
	 pyEbEFZOTnRly7X3dCrpYSg4d1CI4siHZtjDLD0FaZs2+nwUrOwFlr4x4NiovDOzeW
	 EFXpFzPQZO+i028UCad2FXTqNVv0K0+ypBfpYyKMFOBMEEZSH8LijE0UPRajC6Cthh
	 DEYaG0jVofHc38I0+An/WZF8HYm4UBL3diSAgLRf50VFCx9e2+j5h8tLAvpDqzt0kI
	 siV5A0Og8033+uVIDchZn8BdDSmEyqC9FmWRKIo76U4gJ4g06oYqKQIaF+ZKA2FVoR
	 eQrgolndqW0vg==
Date: Thu, 26 Nov 2026 18:18:28 +0000
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
Message-ID: <20261126-exclude-roundish-2cf1cf4874a9@spud>
References: <20261118062526.1436893-1-mason.huo@starfivetech.com>
 <20261118062526.1436893-2-mason.huo@starfivetech.com>
 <20261118-repackage-backlight-1bdc5955a8d2@spud>
 <BJSPR01MB0577DD87B6BE14E93640FD3A85432@BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn>
 <20261125-outbid-ritzy-705bdb883059@spud>
 <BJSPR01MB05775189EDBFDD5307F1003585422@BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn>
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
	protocol="application/pgp-signature"; boundary="Y8su6ZsrkyLLCRBR"
Content-Disposition: inline
In-Reply-To: <BJSPR01MB05775189EDBFDD5307F1003585422@BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn>

--Y8su6ZsrkyLLCRBR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:39:02AM +0000, Mason Huo wrote:
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 2026=E5=B9=B411=E6=9C=8826=E6=97=A5 2:06
> > To: Mason Huo <mason.huo@starfivetech.com>
> > Cc: Corey Minyard <corey@minyard.net>; Rob Herring <robh@kernel.org>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; openipmi-developer@lists.sourceforge.net
> > Subject: Re: [PATCH v1 1/2] dt-bindings: ipmi: Convert starfive,kcs-bmc=
 to DT
> > schema
> >=20
> > On Wed, Nov 25, 2026 at 01:07:46AM +0000, Mason Huo wrote:
> > > > From: Conor Dooley <conor@kernel.org>
> > > > Sent: 2026=E5=B9=B411=E6=9C=8819=E6=97=A5 1:58
> > > > To: Mason Huo <mason.huo@starfivetech.com>
> > > > Cc: Corey Minyard <corey@minyard.net>; Rob Herring
> > <robh@kernel.org>;
> > > > Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > > > <conor+dt@kernel.org>; linux-kernel@vger.kernel.org;
> > > > devicetree@vger.kernel.org; openipmi-developer@lists.sourceforge.net
> > > > Subject: Re: [PATCH v1 1/2] dt-bindings: ipmi: Convert starfive,kcs=
-bmc to
> > DT
> > > > schema
> > > >
> > > > On Wed, Nov 18, 2026 at 02:25:25PM +0800, Mason Huo wrote:
> > > > > Convert the starfive,kcs-bmc binding to DT schema format.
> > > >
> > > > This is not a conversion since you are not deleting anything?
> > > >
> > > Thanks for the correction, will update the commit message in v2.
> > >
> > > > >
> > > > > Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> > > > > ---
> > > > >  .../bindings/ipmi/starfive,kcs-bmc.yaml       | 53
> > +++++++++++++++++++
> > > > >  1 file changed, 53 insertions(+)
> > > > >  create mode 100644
> > > > Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/ipmi/starfive,kcs-
> > > > bmc.yaml b/Documentation/devicetree/bindings/ipmi/starfive,kcs-
> > > > bmc.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..2cb91d321a32
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
> > > > > @@ -0,0 +1,53 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/ipmi/starfive,kcs-bmc.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: StarFive BMC KCS Devices
> > > > > +
> > > > > +maintainers:
> > > > > +  - Mason Huo <mason.huo@starfivetech.com>
> > > > > +
> > > > > +description:
> > > > > +  The StarFive BMC SoCs use Keyboard-Controller-Style (KCS)
> > interfaces
> > > > on
> > > > > +  the eSPI bus for in-band IPMI communication with their host. T=
he
> > KCS
> > > > > +  channels are part of a Super I/O (SIO) block and each channel
> > occupies a
> > > > > +  0x100 byte register window, starting at offset 0x200 of the SIO
> > register
> > > > > +  space. A channel is identified by its register offset and the
> > > > > +  "starfive,sio-id" of the parent SIO node.
> > > >
> > > > Where is the binding for the parent SIO node? Hard to review this
> > > > without that I think.
> > > >
> > > Sorry for missing the SIO node commit, will add it next version, and =
it looks
> > like:
> > > +        superio@10582000 {
> > > +            compatible =3D "starfive,jhb100-sio", "simple-mfd", "sys=
con";
> > > +            reg =3D <0x0 0x10582000 0x0 0x1000>;
> > > +            #address-cells =3D <2>;
> > > +            #size-cells =3D <2>;
> > > +            ranges =3D <0x0 0x0 0x0 0x10582000 0x0 0x1000>;
> > > +            starfive,sio-id =3D <0>;
> > > +
> > > +            kcs@200 {
> > > +                compatible =3D "starfive,jhb100-kcs-bmc";
> > > +                reg =3D <0x0 0x200 0x0 0x100>;
> > > +                interrupts =3D <282>, <57>;
> > > +                interrupt-names =3D "kcs", "espi_rst";
> > > +            };
> > > +        };
> >=20
> > Why can this ipmi device not just be part of the parent node?
>=20
> Including kcs, there are 5 kinds of super-io devices(kcs, bt ...) with di=
fferent drivers
> in JHB100 SoC. For each super-io device, has its own 0x100 register window
> and dedicated Interrupt line.

I don't see how that is a blocker to simply having the parent node.
A driver for the parent node could register all of the children?

--Y8su6ZsrkyLLCRBR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawh38wAKCRB4tDGHoIJi
0vFGAQD/M4y07Anw+Cq0XkrsMPoXS4/alrR0x+IECxZziDRhHAD/UwaslRRTc+K9
+Th/9X4ePSm2pAMK27LGfQfDGaoiMgM=
=QRgQ
-----END PGP SIGNATURE-----

--Y8su6ZsrkyLLCRBR--
