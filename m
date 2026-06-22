Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEFD19D092;
	Mon, 22 Jun 2026 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150637; cv=none; b=PhY6pCJYlQ+pd2UhWk2XlhFjdoZUdrN8z0WgGDStBXENUMtsH2Iclz0VuRp02uT8QJ5tEX/p3ZUgTB2MdXQ6J+/28cK+uPE+F7jfcXnhqie2PV8Y56At/hl/g9eB1Env5KFjNAz3X59OvImmELdjtERZBnGakPG7eAx+udVmE0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150637; c=relaxed/simple;
	bh=x2BT5vQQ7h+F/K3t1jpVqXe2IS0fjJTKXzOF+66Jf20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcVc8W9QUaZZlxGERphaVOxWt2hXnFZsPUawOLfTvthLaSQaoAAncBnqJvgQ3uTqU6ZZzsJj2AWddHYEQ0H/rlBmq0OXJu0csQm71QHpe7XXvtQR+IM3OHC8aIJS8pk37HDhogiPr3joAjdeNB7t8pqvlp6A0/OJft43tn5t93g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USVQOBbF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USVQOBbF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1055F1F000E9;
	Mon, 22 Jun 2026 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782150635;
	bh=Tcr6cQw8/+pYLroK7pmKi8A9D7PtjmruMLL8Vwwm7SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=USVQOBbF373jeaPO/1FUAeoX3ACGzL/DyUsgve6evHd+QPQHhIsj8EptbUEVZLuBO
	 GZG49R4R+jEXsvVqtz2y3HIJ2GYrqHGrKmsHe8m8rSTgTfDcwZhjx37aCsJdeJo3NY
	 YqtZke2K5kYFKvhi7yTpYcA3dC9CRiGLYa1qYsMWHjQ+aYIXb4ekq71MMe6yexxYgp
	 tQoZw+ACAKFLC8y6K8WQ4/XGmNzC9seB3YIqHO+JK+cy1ibbbmqx0n/lA+AnOCPpHW
	 KEZLFDDeNVRekAy8AYl58lsGpapCKkzVQGl+EONhjUeUfez/COcXtfKrR/9CAr98/o
	 UPz3f+ftsuG2g==
Date: Mon, 22 Jun 2026 18:50:28 +0100
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
Message-ID: <20260622-exemplary-navigate-88985b1444f5@spud>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-4-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B0xT/bCV5w9r0ZSK"
Content-Disposition: inline
In-Reply-To: <20260619105834.1277302-4-peter.lin@sifive.com>


--B0xT/bCV5w9r0ZSK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 06:58:34PM +0800, Yu-Chien Peter Lin wrote:
> Add DT binding for SiFive wgChecker2, a hardware firewall enforcing
> WID-based access control in RISC-V Worlds. Provides checker slots to
> program per-WID permissions for downstream resources, with optional
> sub-range partitioning.
>=20
> Link: https://github.com/riscvarchive/security/blob/main/papers/worldguar=
d%20proposal.pdf
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>  .../devicetree/bindings/riscv/worlds.yaml     |   9 +
>  .../bindings/sifive/sifive,wgchecker2.yaml    | 237 ++++++++++++++++++
>  2 files changed, 246 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgche=
cker2.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Docume=
ntation/devicetree/bindings/riscv/worlds.yaml
> index cc8b3747591e..c39a06c2dd8d 100644
> --- a/Documentation/devicetree/bindings/riscv/worlds.yaml
> +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> @@ -34,6 +34,14 @@ properties:
>      minimum: 2
>      maximum: 64
> =20
> +  sifive,trustedwid:

What's sifive specific about this? Wouldn't other vendors also have
trusted worlds?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 31
> +    description: |
> +      The World ID (WID) designated as the trusted WID for this platform.
> +      Transactions tagged with this WID are authorized to access and con=
figure
> +      WorldGuard blocks, including wgCheckers and wgMarkers.
> +
>  additionalProperties: true
> =20
>  examples:
> @@ -44,6 +52,7 @@ examples:
>          #size-cells =3D <0>;
>          timebase-frequency =3D <1000000>;
>          riscv,nworlds =3D <4>;
> +        sifive,trustedwid =3D <3>;
> =20
>          cpu@0 {
>              device_type =3D "cpu";
> diff --git a/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.y=
aml b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> new file mode 100644
> index 000000000000..043c748385ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> @@ -0,0 +1,237 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2026 SiFive, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sifive/sifive,wgchecker2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive WorldGuard Checker
> +
> +maintainers:
> +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> +
> +description: |
> +  The RISC-V Worlds ISA extension defines World IDs (WIDs) as architectu=
ral
> +  identifiers that tag each system transaction with its originating cont=
ext.
> +  System integrators assign WIDs to execution contexts such as privilege=
 modes,
> +  trusted execution environments, or other isolation boundaries.
> +
> +  The SiFive WorldGuard Checker is a hardware firewall positioned in the
> +  system interconnect fabric. It inspects every transaction, evaluating =
the
> +  WID against access control policies encoded in checker slots for each
> +  protected resource. Transactions from unauthorized WIDs are blocked and
> +  reported as bus errors, interrupts, or both.
> +
> +  This enables spatial partitioning of memory regions and memory-mapped =
devices
> +  across execution contexts. Different address ranges can enforce distin=
ct
> +  policies, allowing isolated workloads to coexist with hardware-enforced
> +  protection.
> +
> +  The wgChecker acts as an access-controller provider as defined in the
> +  access-controllers framework. Protected devices are consumers that dec=
lare
> +  their access policy via the access-controllers property. The hardware
> +  supports up to 32 World IDs.
> +
> +  The World ID authorized to configure WorldGuard blocks is specified by=
 the
> +  sifive,trustedwid property in the /cpus node.
> +
> +allOf:
> +  - $ref: /schemas/access-controllers/access-controllers.yaml#
> +
> +properties:
> +  compatible:
> +    const: sifive,wgchecker2

Missing device specific compatibles.

> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Base address and size of the wgChecker memory-mapped I/O registers.
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Interrupt line asserted when a WID access violation is detected and
> +      interrupt reporting is enabled in the slot configuration (IR or IW
> +      bits set).
> +
> +  '#access-controller-cells':
> +    const: 7
> +    description: |
> +      Specifier for one access-control rule, encoded as seven u32 cells:
> +        <addr-hi addr-lo size-hi size-lo perm-hi perm-lo config>
> +
> +      where:
> +        - addr-hi, addr-lo: 64-bit base address of the protected region.
> +        - size-hi, size-lo: 64-bit size of the protected region in bytes.

These two cells effectively just duplicate the reg property.

> +        - perm-hi: Permission bitmap for WIDs 16..31. Two bits per WID:
> +                     bit 2*(WID-16)   =3D Read  permission
> +                     bit 2*(WID-16)+1 =3D Write permission
> +                   Set bits grant access. Use 0x0 for systems with
> +                   riscv,nworlds <=3D 16.
> +        - perm-lo: Permission bitmap for WIDs 0..15. Two bits per WID:
> +                     bit 2*WID   =3D Read  permission
> +                     bit 2*WID+1 =3D Write permission
> +                   Set bits grant access.

And these two look like a layering violation to me. Why does the
consumer contain its own configuration information? If firmware provides
this to s-mode, it is either useless (because firmware has already done
the configuration) or it makes the access control pointless because
s-mode is expected to program its own access.
With that in mind, the first 4 cells can probably just be transmuted to
a single cell with platform-specific unique identifiers.
Surely the ecall involved with actually requesting access needs
something like that anyway?

The only value I can see in this is if some worlds that a bit of
software is running on can access a peripheral (or part thereof) and
others can't? Though platforms like that might benefit more from being
reworked to have homogeneous access! I've got no idea how a Linux driver
etc would handle the only some CPUs being permitted to access a register
region.

> +        - config:  Slot configuration bits:
> +                     Bit 0 (ER): Report read  violations as bus errors
> +                     Bit 1 (EW): Report write violations as bus errors
> +                     Bit 2 (IR): Report read  violations via interrupt
> +                     Bit 3 (IW): Report write violations via interrupt
> +                     Bit 4 (L):  Lock bit - prevents further modification
> +                   Bits 5..31 are reserved and must be zero.

For the next revision of this, I really would like to see the access
controller driver.

> +
> +      Multiple entries may be listed to apply different policies to
> +      different address ranges, including sub-ranges within a single
> +      physical resource.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#access-controller-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    // Example 1: Single device protection
> +    // WID 0 and WID 3 have RW access to UART; errors and IRQs reported.
> +
> +    cpus {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        timebase-frequency =3D <1000000>;
> +        riscv,nworlds =3D <4>;
> +        sifive,trustedwid =3D <3>;
> +
> +        cpu@0 {
> +            device_type =3D "cpu";
> +            reg =3D <0>;
> +            compatible =3D "riscv";
> +            riscv,isa =3D "rv64imac";
> +        };
> +    };
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        uart: uart@1c1000 {
> +            compatible =3D "ns16550a";
> +            reg =3D <0x0 0x001c1000 0x0 0x1000>;
> +            reg-names =3D "control";
> +            interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH>;
> +            // WID 0,3 RW; report errors+IRQs
> +            access-controllers =3D <&wgchecker0
> +                                  0x0 0x001c1000 0x0 0x00001000
> +                                  0x0 0x000000c3 0x0f>;
> +        };
> +
> +        wgchecker0: wgchecker@1c2000 {

I think this should be access-controller@

> +            compatible =3D "sifive,wgchecker2";
> +            reg =3D <0x0 0x001c2000 0x0 0x1000>;
> +            #access-controller-cells =3D <7>;
> +            interrupts =3D <80 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-parent =3D <&aplic_m>;
> +        };
> +    };

--B0xT/bCV5w9r0ZSK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajl14wAKCRB4tDGHoIJi
0vOoAQDGW5uVP7SsX3EThY+cslZwqoZM4OygPKIeEcEnV1ndagEAuE6wHtRin61E
7yZJ3AdpefPnIn7ERObXGjkJM2xyfw8=
=wQ6v
-----END PGP SIGNATURE-----

--B0xT/bCV5w9r0ZSK--
