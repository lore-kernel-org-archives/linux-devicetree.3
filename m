Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C503A9D9C;
	Tue, 28 Jul 2026 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260096; cv=none; b=DQh9SxIuzQYRjaRtmXrTLYkMzUG9qc13p23HATkhgETQtbC6++K/1U/A+U5svt2SbxRR0pJEkCkdDcMUZ9SZ3Tlw8csdYagCYria22oMYBvU4RcHXPdN9Dv+nGaELicKEqn8iYK5bu57xZcVe76tQBCdHJOOfy2b+TM4F0wPuNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260096; c=relaxed/simple;
	bh=uT8CoFjhBbxbUrbFvUdZnU11ovbFveD5yIRYirPhxNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpSf84kH1gQomNgE0/w+LOuGLS1FkBxTUg2alAy8lqaC5z8BPwVaUJWLRPDNYLad8aaez1shkRkl2W0o+GrbItxkMe2Y6BqVQuWGHSR4mCPDS+bJf9Ak13RvXB/Ga3CBAWXU0Ln+nT1Djmo02CepO5ZVOSrVseki27dtnoHPRzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfvEm31d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfvEm31d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4027C1F000E9;
	Tue, 28 Jul 2026 17:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785260094;
	bh=VTi0opeA44KjxdLzAuemqzMHjDouRZJAsaT2ZQQVdpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DfvEm31dp/ZBGtLU+7SB7Vkwig2xW6nw/6gRIvspL3Qn32iXvrUBi6D3gla/zCW37
	 cG44ZabSSruUoeSSb6URVBou0fEL3iWy9Vy2JCY3owkcj+c8I9YedHiyIE2/g0fOD1
	 zt8uf6/02B4piY4wGinIgEBMQ1un29aV0wN7RHw/jCW9H3VLEDmCFIWaXF9xO4woH5
	 HwC+Jv6S+KvhiR1n5TzAI1RLGHFqd+UByCkrKfccTCymPhRu7o954R4UvxsLj7a2pJ
	 tcm9z0WoY7CiBbp6AeWUEptQ1kyJ7tHf9hdew4fSYcCLEHup5wIKX08QhAPhRrW8j0
	 Fo/w/rc91vfyA==
Date: Tue, 28 Jul 2026 18:34:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com
Subject: Re: [RFC PATCH 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <20260728-sash-reenter-a46eb414288d@spud>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-4-peter.lin@sifive.com>
 <20260622-exemplary-navigate-88985b1444f5@spud>
 <amcOTrafvWgdT7zL@plin-1878>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yYRQkNVl6fzrW+Bo"
Content-Disposition: inline
In-Reply-To: <amcOTrafvWgdT7zL@plin-1878>

--yYRQkNVl6fzrW+Bo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 03:52:46PM +0800, Yu-Chien Peter Lin wrote:
> Hi Conor,
>=20
> On Mon, Jun 22, 2026 at 06:50:28PM +0100, Conor Dooley wrote:
> > On Fri, Jun 19, 2026 at 06:58:34PM +0800, Yu-Chien Peter Lin wrote:
> > > Add DT binding for SiFive wgChecker2, a hardware firewall enforcing
> > > WID-based access control in RISC-V Worlds. Provides checker slots to
> > > program per-WID permissions for downstream resources, with optional
> > > sub-range partitioning.
> > >=20
> > > Link: https://github.com/riscvarchive/security/blob/main/papers/world=
guard%20proposal.pdf
> > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > Reviewed-by: Zong Li <zong.li@sifive.com>
> > > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > > ---
> > >  .../devicetree/bindings/riscv/worlds.yaml     |   9 +
> > >  .../bindings/sifive/sifive,wgchecker2.yaml    | 237 ++++++++++++++++=
++
> > >  2 files changed, 246 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive,w=
gchecker2.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Do=
cumentation/devicetree/bindings/riscv/worlds.yaml
> > > index cc8b3747591e..c39a06c2dd8d 100644
> > > --- a/Documentation/devicetree/bindings/riscv/worlds.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > > @@ -34,6 +34,14 @@ properties:
> > >      minimum: 2
> > >      maximum: 64
> > > =20
> > > +  sifive,trustedwid:
> >=20
> > What's sifive specific about this? Wouldn't other vendors also have
> > trusted worlds?
>=20
> The property is intended to identify the trusted WID, i.e. the
> trusted agent authorized for programming WorldGuard components
> such as wgChecker according to the policy specified in the device
> tree (see sifive,partition-rule below).
>=20
> wgChecker is a proprietary Worlds-aware firewall and is not part of
> the RISC-V ISA specification, so the Worlds extension itself does
> not define a corresponding concept of a trusted world for this.

I'm just worried that I am going to see 15 different versions of this
property when 14 other vendors also decide to create support for having
a trusted world.

>=20
> >=20
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    maximum: 31
> > > +    description: |
> > > +      The World ID (WID) designated as the trusted WID for this plat=
form.
> > > +      Transactions tagged with this WID are authorized to access and=
 configure
> > > +      WorldGuard blocks, including wgCheckers and wgMarkers.
> > > +
> > >  additionalProperties: true
> > > =20
> > >  examples:
> > > @@ -44,6 +52,7 @@ examples:
> > >          #size-cells =3D <0>;
> > >          timebase-frequency =3D <1000000>;
> > >          riscv,nworlds =3D <4>;
> > > +        sifive,trustedwid =3D <3>;
> > > =20
> > >          cpu@0 {
> > >              device_type =3D "cpu";
> > > diff --git a/Documentation/devicetree/bindings/sifive/sifive,wgchecke=
r2.yaml b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > > new file mode 100644
> > > index 000000000000..043c748385ed
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > > @@ -0,0 +1,237 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +# Copyright (C) 2026 SiFive, Inc.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sifive/sifive,wgchecker2.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SiFive WorldGuard Checker
> > > +
> > > +maintainers:
> > > +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > +
> > > +description: |
> > > +  The RISC-V Worlds ISA extension defines World IDs (WIDs) as archit=
ectural
> > > +  identifiers that tag each system transaction with its originating =
context.
> > > +  System integrators assign WIDs to execution contexts such as privi=
lege modes,
> > > +  trusted execution environments, or other isolation boundaries.
> > > +
> > > +  The SiFive WorldGuard Checker is a hardware firewall positioned in=
 the
> > > +  system interconnect fabric. It inspects every transaction, evaluat=
ing the
> > > +  WID against access control policies encoded in checker slots for e=
ach
> > > +  protected resource. Transactions from unauthorized WIDs are blocke=
d and
> > > +  reported as bus errors, interrupts, or both.
> > > +
> > > +  This enables spatial partitioning of memory regions and memory-map=
ped devices
> > > +  across execution contexts. Different address ranges can enforce di=
stinct
> > > +  policies, allowing isolated workloads to coexist with hardware-enf=
orced
> > > +  protection.
> > > +
> > > +  The wgChecker acts as an access-controller provider as defined in =
the
> > > +  access-controllers framework. Protected devices are consumers that=
 declare
> > > +  their access policy via the access-controllers property. The hardw=
are
> > > +  supports up to 32 World IDs.
> > > +
> > > +  The World ID authorized to configure WorldGuard blocks is specifie=
d by the
> > > +  sifive,trustedwid property in the /cpus node.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/access-controllers/access-controllers.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sifive,wgchecker2
> >=20
> > Missing device specific compatibles.
>=20
> We will test on qemu, can I add "qemu,wgchecker2" here?

Sure, with a fallback to the sifive,wgchecker2 compatible.

> > > +  reg:
> > > +    maxItems: 1
> > > +    description:
> > > +      Base address and size of the wgChecker memory-mapped I/O regis=
ters.
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +    description:
> > > +      Interrupt line asserted when a WID access violation is detecte=
d and
> > > +      interrupt reporting is enabled in the slot configuration (IR o=
r IW
> > > +      bits set).
> > > +
> > > +  '#access-controller-cells':
> > > +    const: 7
> > > +    description: |
> > > +      Specifier for one access-control rule, encoded as seven u32 ce=
lls:
> > > +        <addr-hi addr-lo size-hi size-lo perm-hi perm-lo config>
> > > +
> > > +      where:
> > > +        - addr-hi, addr-lo: 64-bit base address of the protected reg=
ion.
> > > +        - size-hi, size-lo: 64-bit size of the protected region in b=
ytes.
> >=20
> > These two cells effectively just duplicate the reg property.
>=20
> Agreed, will drop this region encoding.
>=20
> >=20
> > > +        - perm-hi: Permission bitmap for WIDs 16..31. Two bits per W=
ID:
> > > +                     bit 2*(WID-16)   =3D Read  permission
> > > +                     bit 2*(WID-16)+1 =3D Write permission
> > > +                   Set bits grant access. Use 0x0 for systems with
> > > +                   riscv,nworlds <=3D 16.
> > > +        - perm-lo: Permission bitmap for WIDs 0..15. Two bits per WI=
D:
> > > +                     bit 2*WID   =3D Read  permission
> > > +                     bit 2*WID+1 =3D Write permission
> > > +                   Set bits grant access.
> >=20
> > And these two look like a layering violation to me. Why does the
> > consumer contain its own configuration information? If firmware provides
> > this to s-mode, it is either useless (because firmware has already done
> > the configuration) or it makes the access control pointless because
> > s-mode is expected to program its own access.
>=20
> Yes =E2=80=94 DT only describes the access rules. The wgChecker slots are=
 programmed
> by M-mode firmware (OpenSBI), which holds the trusted WID.
>=20
> riscv,pmwid =3D <3>;
> sifive,trustedwid =3D <3>
> M-mode  : WID3 (sets mlwid to 0)
> S/U-mode: WID0
>=20
> It's fine for Linux to see the access rule, because WID0 is not the trust=
ed
> WID and therefore cannot program the wgChecker configuration registers.
> For denied accesses, reads return zero data and writes are ignored.

I think you misunderstood, I don't mind linux seeing it, I think having
the configuration information in the consumer node is the problem.
Your example below goes away from that, which I approve of.

>=20
> > With that in mind, the first 4 cells can probably just be transmuted to
> > a single cell with platform-specific unique identifiers.
>=20
> Good point, for memory partition use case, I plan to update the
> encoding to:
>=20
>   ddr: memory@80000000 {
>       device_type =3D "memory";
>       reg =3D <0x0 0x80000000 0x0 0x80000000>;
>       access-controllers =3D <&wgchecker2 0>, // partition ID: 0
>                            <&wgchecker2 1>, // partition ID: 1
>                            <&wgchecker2 2>; // partition ID: 2
>   };
>  =20
>   wgchecker2: wgchecker@40000000 {
>       compatible =3D "sifive,wgchecker2";
>       reg =3D <0x0 0x40000000 0x0 0x1000>;
>       #access-controller-cells =3D <1>;
>       #address-cells =3D <2>;
>       #size-cells =3D <2>;
>       interrupts =3D <82 IRQ_TYPE_LEVEL_HIGH>;
>       interrupt-parent =3D <&aplic_m>;
>  =20
>       partition@0 {
>               reg =3D <0x0 0x80000000 0x0 0x40000000>;
>               sifive,partition-id =3D <0>;

You're gonna cause issues with this because the node address matches
your "partition id" property when it needs to match reg.
Matching "partition id" rather than what you have as "reg" actually
makes more sense though, so I would retain that.
I'd be include to move sifive,partition-id to reg and then rework your
reg property to some new name, because it doesn't describe a register
region belonging to this device.
Possibly I would split what's currently called reg into separate size
and address properties and split partition-rule too.

Does the final "config" bit of partition-rule provide any value to
consumers? The answer is no, right? Cos the interrupts are going to be
reported to m-mode rather than s-mode.

>               /* (perm_hi, perm_lo, config) */
>               sifive,partition-rule =3D <0x0 0x000000cf 0x0f>;
>       };
>  =20
>       partition@1 {
>               reg =3D <0x0 0xc0000000 0x0 0x01000000>;
>               sifive,partition-id =3D <1>;
>               /* (perm_hi, perm_lo, config) */
>               sifive,partition-rule =3D <0x0 0x000000cc 0x0f>;
>       };
>  =20
>       partition@2 {
>               reg =3D <0x0 0xc1000000 0x0 0x3f000000>;
>               sifive,partition-id =3D <2>;
>               /* (perm_hi, perm_lo, config) */
>               sifive,partition-rule =3D <0x0 0x000000cf 0x0f>;
>       };
>   };
>=20
> I hope this work for you.
>=20
> > Surely the ecall involved with actually requesting access needs
> > something like that anyway?
>=20
> In this initial support, there is no such interface for S-mode
> to request reconfiguration -- wgCheckers are programmed once at
> boot-time.

Right, but we need to consider what the final support will look like
when writing the binding!

> > The only value I can see in this is if some worlds that a bit of
> > software is running on can access a peripheral (or part thereof) and
> > others can't? Though platforms like that might benefit more from being
> > reworked to have homogeneous access! I've got no idea how a Linux driver
> > etc would handle the only some CPUs being permitted to access a register
> > region.
>=20
> One use case is APLIC, which naturally has separate root-domain
> and child-domain regions and should be controlled by M-mode and
> S-mode respectively. A wgChecker can protect these regions
> with different access permissions, for example M-mode-only access
> for the root domain and M/S-mode access for the child domain.
>=20
> The same mechanism can also support multiple supervisor domains
> e.g. for a TEE. As shown in third example, a DRAM sub-region may
> be carved out exclusively for the TEE.
>=20
> >=20
> > > +        - config:  Slot configuration bits:
> > > +                     Bit 0 (ER): Report read  violations as bus erro=
rs
> > > +                     Bit 1 (EW): Report write violations as bus erro=
rs
> > > +                     Bit 2 (IR): Report read  violations via interru=
pt
> > > +                     Bit 3 (IW): Report write violations via interru=
pt
> > > +                     Bit 4 (L):  Lock bit - prevents further modific=
ation
> > > +                   Bits 5..31 are reserved and must be zero.
> >=20
> > For the next revision of this, I really would like to see the access
> > controller driver.
>=20
> Sure, the fdt driver will be added to OpenSBI. (Not in the kernel which
> runs untrusted WID).

Whether or not you are trusted, does it not make sense to be able to
request that the firmware give you access to a peripheral? Ultimately
opensbi will be making the configuration edits, but I don't think the
kernel being untrusted precludes it having an access controller driver,
as that driver will just use an ecall rather than manipulate directly.

That said, I will not expect you to provide that driver now, but unless
reconfiguration at runtime is not supported by hardware this needs to
be considered.

Cheers,
Conor.

>=20
> >=20
> > > +
> > > +      Multiple entries may be listed to apply different policies to
> > > +      different address ranges, including sub-ranges within a single
> > > +      physical resource.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - '#access-controller-cells'
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    // Example 1: Single device protection
> > > +    // WID 0 and WID 3 have RW access to UART; errors and IRQs repor=
ted.
> > > +
> > > +    cpus {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +        timebase-frequency =3D <1000000>;
> > > +        riscv,nworlds =3D <4>;
> > > +        sifive,trustedwid =3D <3>;
> > > +
> > > +        cpu@0 {
> > > +            device_type =3D "cpu";
> > > +            reg =3D <0>;
> > > +            compatible =3D "riscv";
> > > +            riscv,isa =3D "rv64imac";
> > > +        };
> > > +    };
> > > +
> > > +    soc {
> > > +        #address-cells =3D <2>;
> > > +        #size-cells =3D <2>;
> > > +
> > > +        uart: uart@1c1000 {
> > > +            compatible =3D "ns16550a";
> > > +            reg =3D <0x0 0x001c1000 0x0 0x1000>;
> > > +            reg-names =3D "control";
> > > +            interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH>;
> > > +            // WID 0,3 RW; report errors+IRQs
> > > +            access-controllers =3D <&wgchecker0
> > > +                                  0x0 0x001c1000 0x0 0x00001000
> > > +                                  0x0 0x000000c3 0x0f>;
> > > +        };
> > > +
> > > +        wgchecker0: wgchecker@1c2000 {
> >=20
> > I think this should be access-controller@
>=20
> Will update.
>=20
> Thanks,
> Peter Lin

--yYRQkNVl6fzrW+Bo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamjoNQAKCRB4tDGHoIJi
0tZVAQDMt+tI0KmTPFrpZq7qAfLzFFeAgfnbiXg7T1EeHMriwQD+Jin25rVPxP1U
nTQz5UGCM/Dez/z1gpWAGYIcTK3TVQg=
=U/fR
-----END PGP SIGNATURE-----

--yYRQkNVl6fzrW+Bo--
