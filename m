Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE9B34DB46
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780591424; cv=none; b=rv9p9wrSixJS/vk/+e/voHvnujdizUDUhpoxq8JiiRCBCx3/QgmO3/EtsVtuOw8Z3GGPyuS5HHJqa3YZNr6jim34aihd6aNIaOdJtGVgSONt5vwHwslKBqbxPVazJfQU+npuKbKIDCYnrjsQjoNZozGVRfypMPyEblAIpBtEmuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780591424; c=relaxed/simple;
	bh=dlrSghPK1tw4KHZayLxIOYiqxVABFq0RbqOVGbZ/sgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rk86yEDQxr/2IQcf/qJEBf/ZPwnqtuYYD+rGDiV3rKMFR3Kb9ycj4BdjGtK/qqTVEi2e81UNAHsZQqRk95L+MgBixBNuqmM3yg/cJD2OEvSuCeDi4Xc8Awbb6NE+7oNB+N17SdysY2BFN5W+fggdI4LQIT3dTq8RuuMEntwRgHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqoVroeq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqoVroeq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279021F00893;
	Thu,  4 Jun 2026 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591422;
	bh=HLCWcs/na7YJynx39JPn6MJEQr7kg0k6sXWmzUfmZ58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CqoVroeqkoPZXwFvExF3urqgSSPcEenmAjd1Zmtfr7/t1rg3sYsSKMW8NWWKiG6tX
	 syAd1uEaKqNJlwoTe5OOV1AYnA2mWb9mYf07EXl1S4z+u8Rlsx3kjSGQMlKw/i3Wjr
	 CG4EqSnjLVR3DKZzT2jD8PvNKgENVS6xgI65RK+yoxHwn7ZyiHgwInRcY3r02dFMQe
	 VnYyFclxZwUAe0i3LcKFkecfiDQkq1E6qYWL1ZCgWWXwbSEdUtZOFh2+PNAiJOWLi+
	 mdwwZ+zPnpT9cuyVA0DPOSfL0DEw7lGzzV13VDsTNhywMGqav/WpCfRi/m2Gz26dti
	 eadTKkPXD3oqg==
Date: Thu, 4 Jun 2026 17:43:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Message-ID: <20260604-refill-atonable-efa4867a6e89@spud>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-5-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sy7c6x+d+Pr/tvI9"
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-5-joel@jms.id.au>


--Sy7c6x+d+Pr/tvI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 12:09:50AM +0930, Joel Stanley wrote:
> The mtimer hardware is described in The RISC-V Instruction Set Manual,
> Volume II Privileged Architecture, 3.2.1. Machine Timer (mtime and
> mtimecmp) Registers.
>=20
> The ACLINT was a standalone spec that made it to v1.0-rc4, but was never
> ratified. As explained by Anup:
>=20
> > Only the timer defined by ACLINT specification is relevant but the
> > RISC-V privileged specification already provides a high-level
> > definition of mtime and mtimecmp MMIO registers (see section "Machine
> > Timer (mtime and mtimecmp) Registers").
> >
> > Due to the above reasons, we dropped our plans to ratify ACLINT
> > specification in-favor of AIA IMSIC and RISC-V Privileged
> > specification.
>=20
> Link: https://lists.riscv.org/g/tech-aia/topic/connections_between_aia_an=
d/107177435
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  - Use priv spec as reference
>  - Add soc name to tenstorrent compatible
>  - Fix reg property description
> ---
>  MAINTAINERS                                   |  1 +
>  .../bindings/timer/riscv,aclint-mtimer.yaml   | 56 +++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-=
mtimer.yaml
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..43dd9873bbc5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23005,6 +23005,7 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/tenstorrent/linux.git
> +F:	Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
>  F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcp=
u.yaml
>  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
> diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.=
yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> new file mode 100644
> index 000000000000..1d645570b191
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Advanced Core Local Interruptor (ACLINT) Machine-level Tim=
er
> +
> +maintainers:
> +  - Joel Stanley <jms@oss.tenstorrent.com>
> +
> +description:
> +  The RISC-V machine-level timer exposes the memory-mapped mtime and per=
-hart
> +  mtimecmp registers defined in The RISC-V Instruction Set Manual, Volum=
e II
> +  Privileged Architecture, 3.2.1. Machine Timer (mtime and mtimecmp) Reg=
isters.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - tenstorrent,atlantis-aclint-mtimer
> +          - qemu,aclint-mtimer
> +      - const: riscv,aclint-mtimer

Guess your v3 beat my reply to v2, but what I didn't want was the
riscv,aclint-mtimer compatible not the reference to the spec that you
actually implemented.
pw-bot: changes-requested

And that reminded me, there's a thead,c900-aclint-mtimer binding already
in the kernel, can't you piggy-back off that file instead of making a
new one?

Cheers,
Conor.

> +
> +  reg:
> +    items:
> +      - description: MTIMECMP registers, one per hart
> +      - description: MTIME register
> +
> +  reg-names:
> +    items:
> +      - const: mtimecmp
> +      - const: mtime
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    timer@ac000000 {
> +      compatible =3D "tenstorrent,atlantis-aclint-mtimer", "riscv,aclint=
-mtimer";
> +      reg =3D <0xac000000 0x8000>, <0xac008000 0x8000>;
> +      reg-names =3D "mtimecmp", "mtime";
> +      interrupts-extended =3D <&cpu1intc 7>,
> +                            <&cpu2intc 7>,
> +                            <&cpu3intc 7>,
> +                            <&cpu4intc 7>;
> +    };
> +...
> --=20
> 2.47.3
>=20

--Sy7c6x+d+Pr/tvI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGrOgAKCRB4tDGHoIJi
0n3DAQDqwd8w6WYcGP265FQJmzgpRZ/y83mWE+vmPMWn9v/aJwD/aR5rzrRqco27
ymXGgzNkkU0EUvOsIzhr+EAV1+MpKws=
=kAHu
-----END PGP SIGNATURE-----

--Sy7c6x+d+Pr/tvI9--
