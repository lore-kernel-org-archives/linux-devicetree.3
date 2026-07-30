Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8570738BF81;
	Thu, 30 Jul 2026 17:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785432996; cv=none; b=fPKaSvxrB+CVEt9AAWDIcerzl/wTVb46fWYeA2O6oAL9y6uQLuoTj3rs6V2mDlKfhxkKLIIKtOfQusSodSLH2YoNEw9ypE8qMLgjwmLBR7SQS39CC3hi6Grk2xqHVHSdNHfeF7riaBDeUbE4i04so7q8wKWt/07mBJJ4yCAde+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785432996; c=relaxed/simple;
	bh=v0V/ZjIWO7h+qmHMCVvrEAUvWPRxMtTQbw63DUxaglk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7F+dEpi3msYXXSs0iwK4RHcsoKKhP2ZnG8GeFLAtgU+rbpjm3Zl/+bLuF0bSRe/G9LFI+d8mJhliVIhIEE9Gp4WDzqOMho0Hfcq1Y+BD3ExGvVV63Hv+ZK602EpniecWzWECB7HMKsBF2yMEKipQBaJMOedc8nc8vhCL0QCBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjYQr3Ev; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjYQr3Ev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632C61F000E9;
	Thu, 30 Jul 2026 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785432995;
	bh=G5N2M9ts2TJDTBWqs3Txx171CrTwFynnWbrFmo7/RPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HjYQr3EvxzJljYB64jSSrsAYZoMDOKXYlJAc5dVBGeU0I2HTlGiFu7rsNngDxI8Pq
	 +uHMl4ZSq/stuyU8CkQLGnFo9R1Th+m/kXDcvRVfeJCAegW3UE8RY5pFHeSiAr0GCu
	 2ho1kxh2eGmXYGrVb4QD5NkSECyNQ6Sj0KAIZCip33jYUoiRfIwcD7I5h/hdI9rwVH
	 GH+jnxldDX08t5mH/Zf+Wk5tGuzHPVt/XqDKDJQIspU9KuqNUxik6zkqHZVf8Xe0rY
	 YaGRU6ETpzT0xXpR22PYN7/ccGsOBgg5FYJ4iAlzVgZ57N9mq2ggMqdj00vqA4q9Qz
	 9BcVZN7gYtKjw==
Date: Thu, 30 Jul 2026 18:36:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yu-Chien Peter Lin <peter.lin@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, samuel.holland@sifive.com, dlan@kernel.org,
	guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <20260730-component-wake-80840a196f8d@spud>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-4-peter.lin@sifive.com>
 <20260730-towering-modest-horse-ccbdcc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IWgYDhvHWKCgUhK2"
Content-Disposition: inline
In-Reply-To: <20260730-towering-modest-horse-ccbdcc@quoll>

--IWgYDhvHWKCgUhK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 09:35:02AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 30, 2026 at 12:39:08AM +0800, Yu-Chien Peter Lin wrote:
> > Add YAML binding schema for the SiFive wgChecker, a programmable
>=20
> There is no "YAML" binding schema.
>=20
> > access controller integrated in the interconnect fabric of RISC-V
> > Worlds-capable SoCs.
> >=20
> > wgChecker enforces World ID (WID) based access control on downstream
> > bus transactions. Each checker slot encodes a 2-bit permission field
> > per WID (read/write), enabling fine-grained memory partitioning and
> > device isolation between execution contexts. Violations are reported
> > via bus errors, interrupts, or both, selectable and lockable per slot.
> >=20
> > The binding registers wgChecker as an access-controllers provider.
> > Consumers (i.e. its protected device) reference it via the standard
> > access-controllers phandle to declare their access requirements.
> >=20
> > Also document the sifive,trustedwid property for the /cpus node,
> > identifying the privileged WID authorized to configure all checkers
> > on the platform.
> >=20
> > Link: https://github.com/riscvarchive/security/blob/main/papers/worldgu=
ard%20proposal.pdf
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > Reviewed-by: Zong Li <zong.li@sifive.com>
> > Reviewed-by: Jim Shu <jim.shu@sifive.com>
>=20
> What exactly these reviews pointed out?
>=20
> > ---
> >  .../devicetree/bindings/riscv/worlds.yaml     |   9 +
> >  .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
> >  2 files changed, 365 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgc=
hecker2.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Docu=
mentation/devicetree/bindings/riscv/worlds.yaml
> > index cc8b3747591e..c39a06c2dd8d 100644
> > --- a/Documentation/devicetree/bindings/riscv/worlds.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > @@ -34,6 +34,14 @@ properties:
> >      minimum: 2
> >      maximum: 64
> > =20
> > +  sifive,trustedwid:
>=20
> No, for the same reasons.

I am not entirely sure that this is defined by the platform compatible,
if you've got something like a FPGA with lots of configurability then it
may be needed. Then again, yeah maybe it can just come from the platform
compatible unlike a device shows up that actually needs it.
This is especially true if the consumer of the property is the SBI
firmware.

(that's assuming "same reason" follows on from your comment on the
prior binding)

>=20
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    maximum: 31
> > +    description: |
> > +      The World ID (WID) designated as the trusted WID for this platfo=
rm.
> > +      Transactions tagged with this WID are authorized to access and c=
onfigure
> > +      WorldGuard blocks, including wgCheckers and wgMarkers.
> > +
> >  additionalProperties: true
> > =20
> >  examples:
> > @@ -44,6 +52,7 @@ examples:
> >          #size-cells =3D <0>;
> >          timebase-frequency =3D <1000000>;
> >          riscv,nworlds =3D <4>;
> > +        sifive,trustedwid =3D <3>;
> > =20
> >          cpu@0 {
> >              device_type =3D "cpu";
> > diff --git a/Documentation/devicetree/bindings/sifive/sifive,wgchecker2=
=2Eyaml b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > new file mode 100644
> > index 000000000000..c025a4765cb3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
>=20
> No, you do not get per vendor directory. NAK.
>=20
> Do you see Qcom? Or TI? Or NXP?
>=20
> Place it in appropriate directory matching the hardware.

Which would be access-controllers.

>=20
>=20
> > @@ -0,0 +1,356 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2026 SiFive, Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sifive/sifive,wgchecker2.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SiFive WorldGuard Checker
> > +
> > +maintainers:
> > +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> > +
> > +description: |
> > +  The RISC-V Worlds ISA extension defines World IDs (WIDs) as architec=
tural
> > +  identifiers that tag each system transaction with its originating co=
ntext.
> > +  System integrators assign WIDs to execution contexts such as privile=
ge modes,
> > +  trusted execution environments, or other isolation boundaries.
> > +
> > +  The SiFive WorldGuard Checker is a hardware firewall positioned in t=
he
> > +  system interconnect fabric. It inspects every transaction, evaluatin=
g the
> > +  WID against access control policies encoded in checker slots for each
> > +  protected resource. Transactions from unauthorized WIDs are blocked =
and
> > +  reported as bus errors, interrupts, or both.
> > +
> > +  This enables spatial partitioning of memory regions and memory-mappe=
d devices
> > +  across execution contexts. Different address ranges can enforce dist=
inct
> > +  policies, allowing isolated workloads to coexist with hardware-enfor=
ced
> > +  protection.
> > +
> > +  The wgChecker acts as an access-controller provider as defined in the
> > +  access-controllers framework. Protected devices are consumers that d=
eclare
> > +  their access policy via the access-controllers property. The hardware
> > +  supports up to 32 World IDs.
> > +
> > +  The World ID authorized to configure WorldGuard blocks is specified =
by the
> > +  sifive,trustedwid property in the /cpus node.
> > +
> > +allOf:
> > +  - $ref: /schemas/access-controllers/access-controllers.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: qemu,wgchecker2
> > +          - const: sifive,wgchecker2
> > +      - const: sifive,wgchecker2
>=20
> You need soc specific compatibles.
>=20
> I do not believe the two review tags did any actual real review. They
> would tell you to read writing bindings document, wouldn't they?

I did okay the qemu compatible FWIW, the standalone sifive one though I
did not.


--IWgYDhvHWKCgUhK2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamuLmwAKCRB4tDGHoIJi
0sbyAQDQO5jGKNXxvfcLYlj8WTRy61IS4cHNIJ0RysdjVYOA0wEA5MvlcYB3Kugh
0Na4V6sle17yOIH2Zwdkv6HLWtyFRgI=
=/dkV
-----END PGP SIGNATURE-----

--IWgYDhvHWKCgUhK2--
