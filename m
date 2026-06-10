Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90F8301465;
	Wed, 10 Jun 2026 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096651; cv=none; b=tblAinLLG3571T1nOUWUH2PirKnL5p8myAHRndanvk+hTlNPf1t5COOhcMBWnMqyyhhG+h9sE1QrRlKMcUy7bFEcygHtgyPIbjrsq/UpK8rZAwwKGpGNem8DTZE6+r7wk7vB1Pb8vtCVtAL2HtJoFyeBz5lsFBFYg52BGr65Jwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096651; c=relaxed/simple;
	bh=r4dMD/100adzbPgTxMBB6l472MWU6Q0VLNNG94IBX1k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=juQSwxvWNn+TAI5qAy4G79On7ZmAUttg9ySt94De7ba2s/+MRU+K/AGPkf4xnVbuhh0ZIhjHw6uf+85cJXvLH94dqyHbidkgQpEa72voSOyLHOl+GPjfjhlyK+NfdvV/OVr4JaGzlEHe/9jsrSVSJ/3wMJIJiABJrUw4to3pH3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=WwLjIBF3; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="WwLjIBF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781096647;
	bh=r4dMD/100adzbPgTxMBB6l472MWU6Q0VLNNG94IBX1k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WwLjIBF3WAGB9EPSY9fK0KbP0DJmiznjNWC4PyX5rswzSu4aXDjSvRgRLoHqm2SbO
	 J6hJ5kSFNTQ17zvsM9Po4EqTmStCuPRnbbQbPL3uSkNNJ+i1Je7VOGe8Xm1qHvbeHA
	 1zUST1r9/+/ughClIxibXG5j731EfFCXf6ZkIxNPdWOD2eYiqNtjeBF7FDTMbo56rO
	 9dKH0lWpy1OJZMon8TAkyAeYe7vfYJDiRbVcBFYmuWZItTShfySgM8YGmwlbYeMf4c
	 6ofLl43QtXmKi4cTRuOv9cTyxd57cWzBM0YyiCZD6VwVuln+3VafLFxJjm4TOUkyUf
	 un6ojGE3Gwoog==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7E2DA60921;
	Wed, 10 Jun 2026 21:04:06 +0800 (AWST)
Message-ID: <2d1095b342fe0f4b1b4b99b22bb3af410d9aa60e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/9] ARM: dts: aspeed: anacapa: restructure
 devicetree for development-phase
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: u8813345@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	colin.huang2@amd.com, Carl Lee <carl.lee@amd.com>, Rex Fu
 <rex.fu.amd@gmail.com>,  Andy Chung <Andy.Chung@amd.com>, Peter Shen
 <peter.shen@amd.com>
Date: Wed, 10 Jun 2026 22:34:05 +0930
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
References: 
	<20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-06-02 at 21:24 +0800, Colin Huang via B4 Relay wrote:
> This series refactors the Anacapa BMC devicetree layout to better support
> development-phase hardware revisions (EVT1/EVT2/DVT) while keeping a plat=
form
> entrypoint.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
> Changes in v3:
> - Restructure the EVT2 devicetree to inherit from the EVT1 devicetree, ma=
king it incremental rather than standalone.
> - Add the DVT devicetree, inheriting from the EVT2 devicetree.
> - Enable MCTP and FRU support for the NIC.
> - Align PDB fan GPIO numbering.
> - Add an EEPROM device node for the NFC adaptor board.
> - Add an additional EEPROM device node for the SCM.
> - Add shunt resistor values for HSC monitors
> - Link to v2: https://lore.kernel.org/r/20260409-anacapa-devlop-phase-dev=
icetree-v2-0-68f328671653@gmail.com
>=20

So just to check, the changes in patches 5-8 inclusive are applicable
to all of EVT1, EVT2 and DVT (given the way you've structured the
includes)?

> Changes in v2:
> - Fix dtbs_check fail.
> =C2=A0 Validated by following command:
> =C2=A0=C2=A0=C2=A0 make dt_binding_check DT_SCHEMA_FILES=3Darm/aspeed/asp=
eed.yaml
> =C2=A0=C2=A0=C2=A0 make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspee=
d.yaml aspeed/aspeed-bmc-facebook-anacapa.dtb
> =C2=A0=C2=A0=C2=A0 make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspee=
d.yaml aspeed/aspeed-bmc-facebook-anacapa-evt1.dtb
> =C2=A0=C2=A0=C2=A0 make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspee=
d.yaml aspeed/aspeed-bmc-facebook-anacapa-evt2.dtb
> - Link to v1: https://lore.kernel.org/r/20260407-anacapa-devlop-phase-dev=
icetree-v1-0-97b96367cac3@gmail.com
>=20
> ---
> Andy Chung (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: Enable MCTP and=
 FRU for NIC
>=20
> Carl Lee (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: Add eeprom devi=
ce node for NFC adaptor board
>=20
> Colin Huang (5):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: arm: aspeed: add Anacapa EVT1=
 EVT2 DVT board
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add EVT1 device=
tree and point wrapper to it
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add EVT2 device=
tree inheriting EVT1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add DVT devicet=
ree inheriting EVT2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add additional =
EEPROM node for SCM

If you need to respin this series for some reason, can you please
capitalise the first word of the short description (the bit after the
last ':') for the commits above and the one below?

>=20
> Peter Shen (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: evt2: add shunt=
 resistor values for HSC monitors
>=20
> Rex Fu (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: Align PDB fan G=
PIO numbering
>=20
> =C2=A0.../devicetree/bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 3 +
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts |=C2=A0 178 +++
> =C2=A0.../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts=C2=A0=C2=A0=C2=A0 |=
 1179 ++++++++++++++++++++
> =C2=A0.../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0 228 ++++
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-anacapa.dts=C2=A0=C2=A0=C2=A0=C2=
=A0 | 1077 +-----------------
> =C2=A05 files changed, 1589 insertions(+), 1076 deletions(-)
> ---
> base-commit: 7ca1caf017d34396397b19fb4de9ecef256f4acc
> change-id: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0
>=20
> Best regards,

Andrew
