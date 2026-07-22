Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052364315A;
	Wed, 22 Jul 2026 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708717; cv=none; b=iK2fYCXpCAxpuc2Xb+Hiz+HV6etowzquSmCV3H4t19K1Sbmr4YOlN7N/Au9GyGNwwFj+FMeQv96YOhuKDa7ONugMmRvstSqDwW07OQ8M21Fc2gGBcz3LHoeul8PQCUsWyZzeJ5n71EWJpWzyP1YSfYWKHoU5uZLXDob78RwlFZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708717; c=relaxed/simple;
	bh=hOn/ZeYFEt90v4SbNQ99qlDa7WKtJmwoKpXWMJ48EF4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ed5L3vwvACfn4S/r2JvdoIzc8CylR9TsBjvcFtbr17wasVS/L5/PMrEh7Dv0frtlT80uT0mk5zHzcszsDkMzIESJiG2Iyi8miDVKWiCPZQHSwFkAhpR0K3JPCyVHasZM3rjZWakv7JU0o4OcTpUPZaQ9H6qOS7qu2aAJKLskkac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=UTY9Lb+o; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="UTY9Lb+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784708713;
	bh=hOn/ZeYFEt90v4SbNQ99qlDa7WKtJmwoKpXWMJ48EF4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UTY9Lb+opA/KTpD+FrTRNA9espkHW7lHwQ4IJBGIF6dZXxjDtSEx4xaF0Xn0Wp2kh
	 mf//8iLI5IQhN2UYDR15PbRmZ1+ZJJXGPJhPNo3f/5XGUorFdn1n+89c8h7XbXIbH1
	 aaglcS9hDxERkqJo+cFupEkWqajKWDbB3sHiqZiNk931w14X2J/QVQlgU1LocJLjis
	 xwXKVnJLBlfmpemrtXhuyfRMzMabCFb3kn7nU+2Lo1ebCBb1XCeVVk/kjLTdMMPd+X
	 brVkTA+80u6931dzfivIJWirOmV9EM39fk/RfbVLd/hfnwKV2ElrAvYCq1GvYdU+YQ
	 Ckooh5WjeeEbA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2D7D3662E1;
	Wed, 22 Jul 2026 16:25:12 +0800 (AWST)
Message-ID: <3b6aa85161702da4322cc361e500a90c832af6a7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jacky Huang	
 <jackyhuang@nvidia.com>, joel@jms.id.au, robh@kernel.org,
 conor+dt@kernel.org, 	andrew@lunn.ch
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Date: Wed, 22 Jul 2026 17:55:11 +0930
In-Reply-To: <3523fefc-8ba8-4512-b088-7a94a2df73f8@oss.qualcomm.com>
References: <20260710054849.3178747-1-jackyhuang@nvidia.com>
	 <20260710054849.3178747-3-jackyhuang@nvidia.com>
	 <b707f061cbdfe52f8d72ccd33ec177113e20a5e5.camel@codeconstruct.com.au>
	 <3523fefc-8ba8-4512-b088-7a94a2df73f8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-22 at 10:21 +0200, Krzysztof Kozlowski wrote:
> On 22/07/2026 09:45, Andrew Jeffery wrote:
> > Hi Jacky,
> >=20
> > On Fri, 2026-07-10 at 14:46 +0900, Jacky Huang wrote:
> > > Add the device tree for the Aspeed AST2600 BMC for NVIDIA's Vera
> > > Rubin NVL compute platform.
> > >=20
> > > MAC0 uses phy-mode =3D "rgmii-id" because the on-board PHY supplies
> > > both RGMII internal delays.=C2=A0 The matching U-Boot device tree doe=
s not
> > > enable SoC-side MAC clock delays, leaving the MAC internal delay at
> > > zero so the PHY-provided delay is not doubled by the MAC controller.
> > >=20
> > > The corresponding U-Boot change has been submitted to openbmc/u-boot:
> > > Link: https://lore.kernel.org/all/20260629105202.1417679-1-jackyhuang=
@nvidia.com/
> > >=20
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > > Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> > > ---
> > > v3: reword the &mac0 comment per Andrew Lunn's feedback.
> > >=20
> > > =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0.../aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts=C2=A0=C2=A0 | 901 +=
+++++++++++++++++
> > > =C2=A02 files changed, 902 insertions(+)
> > > =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-v=
r-nvl-bmc.dts
> >=20
> > We now have scripts/dtc/dt-check-style, and going forward I'm asking
> > that all new devicetree submissions pass in strict mode.
>=20
> Thanks!
>=20
> >=20
> > Currently:
> >=20
> > =C2=A0=C2=A0 $ ../scripts/dtc/dt-check-style --mode strict ../arch/arm/=
boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts 2>&1 | wc -l
> > =C2=A0=C2=A0 152
> >=20
> > Can you please address those?
>=20
> Just a note: --strict might not be ready yet. It reports some false
> positives which need addressing (I have plans for this, but busy with
> other things...), so expectation currently is:
> 1. No warnings from standard mode
> 2. Review and investigate warnings from 'strict' mode, but do not fix
> them automatically without thinking

Understood.

Thanks,

Andrew
