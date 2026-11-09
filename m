Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252588;
	b=tiR43sXM0oQyLQ6tIEXe6B3lap/OPKlFSeweaiRJtKP7sQ6vBPmTlzG05dWY/FDgXkU1
	 0GOqJHe8HRQOQ1xmWkQTbmkfFTncNMIsSujNv1GdJke6WsDfQf/rT2dyd1/DR6mG3y5Ks
	 RvYVLVmj8y9/f+ejSlq2XHtsXJVLGQsVY5YBhXwkj+08xBuz9x6ROAmk6nbUoPhD5B5P/
	 ZDBOFiKTeZxOqBFstOie3BdYtFWhqsfMkO5UUPP9J+hpYK7MFYmIadMja+QhWZJazMQ6e
	 gKmlPj6sHGHPMxnNmnOWrxfgWmCdnN8jIaV2dMIiAVsHEv8/9rX60qHGJbvHiAG8IzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252588;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zRlOU8GVu92n94UxeGUsYcNmS4w8IyE+noAKkzyeHpE=;
	b=m9cNU3J4BoQQYIRZeUvsEXKbC3xgwp3E4X8n4XXOMZKwgAkqeJiTJjNg9Z2At4c5bNp4
	 6ffbz/xfQVPewMiR5Bzqp2SOsuovJCkVbEJh3UiwVasP2rN9L+xHJqylmphPvVv/Qx6lI
	 cVCVF+Rtub44Vdq3rV3O1evY69njcTBog72wNtnzYXihKK95iP7mILsONRD3yUEVjtgFs
	 pvNwnwcONbNgTDEKXg7AOuJxcJ3sfJcsFd/1KDsUUtdBQZ2ubI4N5J2KS2cEGjyrY8Mp5
	 GK14NkVEjJVBUYpGYzryTb3UUVw8utYzGoFByixJWuDNP1Wr0SnKmQxut2tbzYlYjsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lY/kWVz9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA79F606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 19:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lY/kWVz9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826B51F0089F;
	Mon,  9 Nov 2026 19:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794252587;
	bh=zRlOU8GVu92n94UxeGUsYcNmS4w8IyE+noAKkzyeHpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lY/kWVz9u6vhfm6c2oKjoB63tHZOSsgHWzuwxWR0YIioIkP1x9yI1X1d9DCVirO/5
	 tFmhBd3iq4iar/t2UOD8wHRzbvXPVo5NGuOT1fuTiecGd1961rk79S8MwEXUAB5WSn
	 UrPYTrg3InMfUC+HL3xA8opW9bOE4yvSzOTYJkC5uHDCnsJVnp1tT4QUk9hs+N33Rx
	 FvMgrF/U1aKs7ZmG6Cp/D+MAXw/qQNQ0H4ODFDzgTRZrk+pNfx8dj4/UvLjaJCieT9
	 HzMlTkyceBZRu1uzEyRf3JDctGyQdRCF/hqLcbO2gyzBedNkV7/aDdpKDfzUElgmgb
	 8z0U30O6fwbbQ==
Date: Mon, 9 Nov 2026 19:29:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Message-ID: <20261109-jester-zestfully-a664203cfbd1@spud>
References: <20261109051050.105623-1-joel@jms.id.au>
 <20261109051050.105623-5-joel@jms.id.au>
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
	protocol="application/pgp-signature"; boundary="ROffTAJo3Tr2dYQf"
Content-Disposition: inline
In-Reply-To: <20261109051050.105623-5-joel@jms.id.au>

--ROffTAJo3Tr2dYQf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 03:40:44PM +1030, Joel Stanley wrote:
> Document the RISC-V ACLINT mtimer and mtimecmp hardware, as described
> by the riscv-aclint specification, commit 4e570bfd3201f2 [2].
>=20
> Multiple vendors are shipping silicon with the hardware as described
> by the specification, which was abandoned[1] as a standalone spec at
> v1.0-rc4.  As we have multiple instances of hardware that implement
> the spec, the widespread implementation of the spec is de facto
> ratification, providing a stationary target for the bindings to document
> and an exception to the policy of not accepting things that are
> pre-ratification.
>=20
> [1] https://lists.riscv.org/g/tech-aia/topic/connections_between_aia_and/=
107177435
> [2] https://github.com/riscvarchive/riscv-aclint/blob/4e570bfd3201f2c09e5=
afd290b5091526b0f099a/riscv-aclint.adoc
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3:
>   - Rework commit message following discussion at LPC

Since I was one of the folks involved in that chat, I am okay with this
obviously. I was convinced to change my mind about the use of the riscv
vendor prefix because of the widespread adoption.

>   - Add reg-names, rework description, fix example
> ---
>  MAINTAINERS                                   |  1 +
>  .../bindings/timer/riscv,aclint-mtimer.yaml   | 56 +++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-=
mtimer.yaml
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..403875d5932e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24185,6 +24185,7 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.g=
it
>  F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcp=
u.yaml
>  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml

> +F:	Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml


>  F:	arch/riscv/boot/dts/tenstorrent/
>  F:	drivers/clk/tenstorrent/
>  F:	drivers/reset/reset-tenstorrent-atlantis.c
> diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.=
yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> new file mode 100644
> index 000000000000..e6f3d08d4f93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Advanced Core Local Interruptor (ACLINT) timer
> +
> +maintainers:
> +  - Joel Stanley <jms@oss.tenstorrent.com>
> +
> +description:
> +  The RISC-V ACLINT specification defines a set of memory mapped devices=
 which
> +  provide timer functionality for each hart on a multi-hart RISC-V platf=
orm.
> +  The mtimer device has a single mtime register and one mtimecmp registe=
r per
> +  hart. The specification is at https://github.com/riscvarchive/riscv-ac=
lint/
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - tenstorrent,atlantis-aclint-mtimer
> +      - const: riscv,aclint-mtimer

So, what are we doing about thead,c900-aclint-mtimer.yaml?

> +
> +  reg:
> +    items:
> +      - description: mtime register
> +      - description: mtimecmp registers

For example, I note that you have mtime and mtimecmp in the opposite
order to how the mips folks have had to add the mtime region to that
file:
https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.=
com/

> +
> +  reg-names:
> +    items:
> +      - const: mtime
> +      - const: mtimecmp
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +required:
> +  - compatible
> +  - reg

You've also not made reg-names or interrupts-extended required.

I think we should swap the regs around and make these two required at a
minimum, but also "initialise" this file by renaming the existing file.

My ~assumption~hope is that all of the devices in that file have
implemented the aclint spec at the -rc1 revision that we're citing here.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@a2180000 {
> +      compatible =3D "tenstorrent,atlantis-aclint-mtimer", "riscv,aclint=
-mtimer";
> +      reg =3D <0xa2180000 0x8000>, <0xa2188000 0x8000>;
> +      reg-names =3D "mtime", "mtimecmp";
> +      interrupts-extended =3D <&cpu1intc 7>,
> +                            <&cpu2intc 7>,
> +                            <&cpu3intc 7>,
> +                            <&cpu4intc 7>;
> +    };
> +...
> --=20
> 2.47.3
>=20
>=20

--ROffTAJo3Tr2dYQf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavIfJQAKCRB4tDGHoIJi
0hv1AQDfbmEsbI31dpUvI3ppRGEfGl0CGBNpMUoNLm1nMTABNgEA5aUv/9ON73FR
m25UqEo6sP3ryaV7ULX1uPeOXGv32QU=
=Sw3H
-----END PGP SIGNATURE-----

--ROffTAJo3Tr2dYQf--
