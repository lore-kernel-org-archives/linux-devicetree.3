Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804605;
	b=TiQZLC6R966gIqTKHQTn+HndRuzGp6TcQhH4XnWpVJxxFK6UGVJKkJOFjMity7LMAP9D
	 Hrzmts/h70HPCFwtJPNMdzxZgwYm8XkvJ0DbJkxaD9lXIfULLHthItFzTZGeqG5isyvzQ
	 YmlGxbCm15uHl+AWtJpVAV8Q5uC5GtLehJxBuZEZk91YwfdN/hTOh7RrngGN6JsFwA/WY
	 R+jvnjaBz2nnhxqKCr17hXqLFcjHkIfIUmcA3nXI3V2ALuAdHNXvHkurGKoo1pyDjMEY9
	 ljEx0Z7gA+THShAfTqXGwTRXixECsV+mPKTZ6tCklPdPNdZ+7aoqnKhJH6VfsyvUZEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804605;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tA8Aa2jEbLtXL6FwWF9YXfWBQgC7Lngh2MOgaijaglg=;
	b=e2ZV/AiGNFHTQ7aRkt0qRiHJxgHNz8o48/4+HQeBVzWPCqK6DyM/FMyjiIgzG1qMBfOs
	 lmHUNiftnbPw7omcdJi8e5Lm8Bpo4DkE0QWTjO+aZaFxRQzCVGY9Iv7mvzHG3d2F6c14K
	 r2aAqm4v0wpOf6+uySwaamkXNaVodWDYUN6FMjNlaIT2N9Y3AdYwrkmvTlyLtA8kPI5UP
	 ID/FRaNJ0qYuZ+jU/rY3Nmq6F3ANw6QtFIK4shbK1EP6HuOgelMoZC17pilEYmow776vJ
	 qOXxWFd4kUW1EgnqsB9YayB6aOpRhdrHdW7vWSKx//vyqxInGhghHX2JAMlcYh7mF2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdPaOGGn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CCA606A327;
	Fri, 27 Nov 2026 18:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdPaOGGn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE1C1F00893;
	Fri, 27 Nov 2026 18:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804604;
	bh=tA8Aa2jEbLtXL6FwWF9YXfWBQgC7Lngh2MOgaijaglg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VdPaOGGn/6sH+6m+tO/URPTlIQ2FUq8PDf6jXvAyHSzeSjlTA1w3kSIkYoTpqY1sp
	 JcByLFZyK4K4wnqT/KT3RcK0MDJ5/pU3477M6lDyZNqC75vQX4ECNQ5cPMmz52tZnU
	 fu+yuJ7u/QjwwQjWXxKczIR15Wz2PyV02VUBEHFyK6RTUY/Oy8BvylpGx6NG//jbST
	 7HHjPx3xkNlA9xU5lvVpNcC3qf8EbtVOMYIf5fDG6c+lU/BOowratD9+lOWDwj1aiw
	 pieyIY3QamTGrAKVc3/Vt0QmN4YaXPORxOln+LENcJy1Ziq5tNHnffizId4Bu8D5PJ
	 cqX4ICnSk2vgg==
Date: Fri, 27 Nov 2026 18:36:39 +0000
From: Conor Dooley <conor@kernel.org>
To: marouene.boubakri@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] riscv: add OpenHW Group CVA6 APU on Digilent
 Genesys 2
Message-ID: <20261127-portal-sulfur-cf29c003666a@spud>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="ywVelhjtDLhaqdrs"
Content-Disposition: inline
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>

--ywVelhjtDLhaqdrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 05:46:24PM +0100, marouene.boubakri@oss.nxp.com wro=
te:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>=20
> This series adds support for the OpenHW Group CVA6 APU, the FPGA SoC
> built around the CVA6 core (https://github.com/openhwgroup/cva6,
> corev_apu/fpga, release v5.3.0), running on the Digilent Genesys 2.
>=20
> Both configurations of the core built for this board are covered: the
> 64-bit cv64a6 (rv64imafdc plus B, Zcb, Zicond and Zkn, Sv39, 1 GiB) and
> the 32-bit cv32a6 (rv32ima, Sv32, 128 MiB). The SoC description is
> shared in a dtsi and the two board .dts files only carry the core
> specific properties and the memory size.
>=20
> The peripherals use existing bindings: 8250 UART, Xilinx SPI with an
> mmc-spi-slot, Xilinx GPIO with gpio-leds, SiFive compatible CLINT and
> PLIC. Patches 1 to 5 add the vendor prefix and the compatible strings
> these bindings need, patch 6 the ARCH_OPENHWGROUP Kconfig option,
> patch 7 the device trees and the MAINTAINERS entry, patch 8 enables the
> platform in the defconfig.
>=20
> The lowRISC Ethernet controller and the PULP timer of the platform have
> no upstream bindings yet and are left out of the device trees.
>=20
> The bindings and the device trees have been validated with
> dt_binding_check and dtbs_check. The v1 device trees were booted with
> the cv64a6 configuration on the Genesys 2 from U-Boot 2026.10; the v2
> changes and the cv32a6 configuration are build tested.

I've applied this stuff, should appear in linux-next soonTM. No b4-ty
email, I cocked it up messing about with the new (to me) --resolve
option..

Cheers,
Conor.

--ywVelhjtDLhaqdrs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawnNtwAKCRB4tDGHoIJi
0gXhAQCn5D8IZ1KelVmP5Mr7HS/M1Ip5p/l/fFRJ75Q0PhB6tAEAp0FnuMPtu9h+
AuVc5fJ2EXtTVMSoSecjtjnCmVEaYw8=
=B3c7
-----END PGP SIGNATURE-----

--ywVelhjtDLhaqdrs--
