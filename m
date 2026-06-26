Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5932A3DA7F2;
	Fri, 26 Jun 2026 07:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782457671; cv=none; b=PL5oEb7OpDyKSJgCSUm/MHU+mPaXowtyz9ru3PJDNbAp0ULxkflVQ6OExbWUa38iOkvzNWJturJiLHWUsgVa8NLEOMzJta6C3xzaeUkLBfnEVeng0FsMrz7spIx0jm8KCoUldR5fz7/G1BrYC8piNIRfZfWpQgxTr5XB65WvEsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782457671; c=relaxed/simple;
	bh=Q6TSkhAwHbrRrlVeKLvyFK7kis+EXROzBuAhwrXsm1A=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDazaVCkSkHMB+p4r6+QMvOoLWVCFIzn7gNxHab3AN1Ysjm7FIr/8Aw0O4waggV6XsIMAzVIvcc6kMJBXZaSBT5JhOaZQZf7RHGm0cf4NKrJuWNn00Y7R+QyCitQncgISYyDTQSq8t9rYJ8/G2CJObhuItuueAMg8knyq4h3lBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=pT6NGpQ6; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pT6NGpQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782457670; x=1813993670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q6TSkhAwHbrRrlVeKLvyFK7kis+EXROzBuAhwrXsm1A=;
  b=pT6NGpQ6iCmeFoRK44bgZyHX+nIJOaQk6o3zd36iTbE6PDAkLsC4At7T
   dNgpihKLQQaSNFhwDNQeqj9HNTON4P40yB0srsCBM4+xw0DkpSJZpCSqv
   o/6p1SF0HDRisLrXjGaZwfglKHHsLZp3xTPDpuBGZ+B/gSQFITwHb1Rjj
   VCs8yu+s7FvWGIb22Lb3ELoXcTwejLJMfbDJCI3jSXQDvyiARIZADv9AT
   Qv4O0kZ4FtfQFQZ2hVRLL1T5IuEHwrQK0V6pxls3NyMrUpkGxpQNV0Gs6
   Efhbvrtp2rjTRtipiD8Y+royN8GreGUNJ2Tgac7i7xRT98qCOOUbV3sRC
   A==;
X-CSE-ConnectionGUID: /GQ3EulbTj6IbgSDqeCoXg==
X-CSE-MsgGUID: 3MEMN4EYT4qabeMmfoBJEQ==
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="asc'?scan'208";a="68924617"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jun 2026 00:06:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 26 Jun 2026 00:06:41 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 26 Jun 2026 00:06:37 -0700
Date: Fri, 26 Jun 2026 08:05:47 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yulin Lu <luyulin@eswincomputing.com>
CC: Conor Dooley <conor@kernel.org>, Pinkesh Vaghela
	<pinkesh.vaghela@einfochips.com>, Lee Jones <lee@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Min Lin
	<linmin@eswincomputing.com>, Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>, Pritesh Patel
	<pritesh.patel@einfochips.com>
Subject: Re: Re: [PATCH 3/7] riscv: dts: eswin: eic7700: add pinctrl support
Message-ID: <20260626-headway-rewind-93c9239bd865@wendy>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-4-pinkesh.vaghela@einfochips.com>
 <20260615-that-scarf-e048ef152676@spud>
 <55962658.7bea.19f02850fe2.Coremail.luyulin@eswincomputing.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aDbbMfndEwAtqwoN"
Content-Disposition: inline
In-Reply-To: <55962658.7bea.19f02850fe2.Coremail.luyulin@eswincomputing.com>

--aDbbMfndEwAtqwoN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 02:01:42PM +0800, Yulin Lu wrote:
> Hi, Conor. Thanks for your review.
>=20
> > On Mon, Jun 15, 2026 at 05:50:12PM +0530, Pinkesh Vaghela wrote:
> > > From: Yulin Lu <luyulin@eswincomputing.com>
> > >=20
> > > Add pinctrl node and related pin configuration for EIC7700 SoC
> > >=20
> > > Co-developed-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > > Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> > > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > > ---
> > >  .../dts/eswin/eic7700-hifive-premier-p550.dts | 109 +++
> > >  .../riscv/boot/dts/eswin/eic7700-pinctrl.dtsi | 888 ++++++++++++++++=
++
> > >  arch/riscv/boot/dts/eswin/eic7700.dtsi        |   5 +
> > >  3 files changed, 1002 insertions(+)
> > >  create mode 100644 arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > >=20
> > > diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dt=
s b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > > index 1fb92f0e7c55..e7bb96e14958 100644
> > > --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > > +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > > @@ -6,6 +6,7 @@
> > >  /dts-v1/;
> > > =20
> > >  #include "eic7700.dtsi"
> > > +#include "eic7700-pinctrl.dtsi"
> > > =20
>=20
> ...
>=20
> > > +&gpio79_pins {
> > > +	bias-disable;
> > > +	input-disable;
> > > +};
> > > +
> > > +&gpio80_pins {
> > > +	bias-pull-up;
> > > +	input-disable;
> > > +};
> > > +
> > > +&gpio82_pins {
> > > +	bias-pull-up;
> > > +	input-disable;
> > > +};
> > > +
> > > +&gpio84_pins {
> > > +	bias-disable;
> > > +	input-disable;
> > > +};
> > > +
> > > +&gpio85_pins {
> > > +	bias-pull-up;
> > > +	input-disable;
> > > +};
> > > +
> > > +&gpio94_pins {
> > > +	bias-disable;
> > > +	input-disable;
> > > +};
> > > +
> > > +&gpio106_pins {
> > > +	bias-disable;
> > > +	input-disable;
> > > +};
> > > +
> > > +&gpio111_pins {
> > > +	bias-disable;
> > > +	input-disable;
> > > +};
> > > +
> > > +&pinctrl {
> > > +	vrgmii-supply =3D <&vcc_1v8>;
> > > +};
> > > +
> > >  &uart0 {
> > >  	status =3D "okay";
> > >  };
> > > diff --git a/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi b/arch/ri=
scv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > > new file mode 100644
> > > index 000000000000..7293df146aa7
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > > @@ -0,0 +1,888 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright (c) 2025 Beijing ESWIN Computing Technology Co., Ltd.
> > > + *
> > > + * ESWIN's EIC7700 SoC pin-mux and pin-config options are listed as
> > > + * device tree nodes in this file.
> > > + *
> > > + * Authors: Yulin Lu <luyulin@eswincomputing.com>
> > > + */
> > > +
> >=20
> > I don't really understand the groups here. I think you should make more
> > effort to put more pins in each group.
> >=20
> > > +		gpio1_pins: gpio1-pins {
> > > +			pins =3D "jtag0_tck";
> > > +			function =3D "gpio";
> > > +		};
> > > +
> > > +		gpio2_pins: gpio2-pins {
> > > +			pins =3D "jtag0_tms";
> > > +			function =3D "gpio";
> > > +		};
> > > +
> > > +		gpio3_pins: gpio3-pins {
> > > +			pins =3D "jtag0_tdi";
> > > +			function =3D "gpio";
> > > +		};
> > > +
> > > +		gpio4_pins: gpio4-pins {
> > > +			pins =3D "jtag0_tdo";
> > > +			function =3D "gpio";
> > > +		};
> >=20
> > Like these 4 for example, why not group these?
>=20
> The 'group' is used to correspond to the '-grp' tag in the YAML file and
> has no practical significance.
> Different board designs have different requirements for pin multiplexing.
> Therefore, eic7700-pinctrl.dtsi only provides pins for the board-level DT=
S.
> Pins are combined and used in the board-level DTS via pinctrl-0 property.

These 4 pins in the driver are represented as:
	EIC7700_PIN(14,  "jtag0_tck",		[0] =3D F_JTAG, [1] =3D F_SPI, [2] =3D F_GP=
IO),
	EIC7700_PIN(15,  "jtag0_tms",		[0] =3D F_JTAG, [1] =3D F_SPI, [2] =3D F_GP=
IO),
	EIC7700_PIN(16,  "jtag0_tdi",		[0] =3D F_JTAG, [1] =3D F_SPI, [2] =3D F_GP=
IO),
	EIC7700_PIN(17,  "jtag0_tdo",		[0] =3D F_JTAG, [1] =3D F_SPI, [2] =3D F_GP=
IO),

	EIC7700_PIN(18,  "gpio5",		[0] =3D F_GPIO, [1] =3D F_SPI),

There is no reason to ever partially use these as GPIO. Either they will
be all jtag, all spi or all gpio. pin 18 on the other than makes sense to h=
ave
in a dedicated group.

--aDbbMfndEwAtqwoN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj4kxgAKCRB4tDGHoIJi
0uWgAP9MLg+ojETD3FuiTsRUkk5ATP6ZfKsZAJ4QcHiN+Tf9gQD/TVUs2J/JJ6AD
cXNfjBYkM36WAGLQJQjJlWUPsvF2vg0=
=PeyA
-----END PGP SIGNATURE-----

--aDbbMfndEwAtqwoN--
