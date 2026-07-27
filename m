Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062AF18C2C;
	Mon, 27 Jul 2026 01:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785114207; cv=none; b=AUdKO/0zfKeNes62ga3spMHmMl6LhySaYdo3Mpg9pdPp01QElsD7QXaKMEaED0x4c09Djx5HVdv7FVVLsjURFXBhxbbeM6OJbkel5/UoFLHbSr/wjSOZWIZvE3rYDKKbzG+0z7bogJcukZObSkJvA0mhUq3GINZI3vWC30rEubs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785114207; c=relaxed/simple;
	bh=B7xwk8bkofSoOCbb/Y0lzrdZi6QnX81MLwC2X54AVCo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PxIDezmCcynrwOv/QNsyn92mMPL+AwIgLqbHUaQHfE9GLw+PN54IFj0gwjyKv+1i6SW4GMfEb2XxJbdx6YBbGp+rH9AuRBQxRH+IKoBjglLycWPbqHZCf4vB7aZd/wpy4cad7bfxnGIjgC58gGazyAsNeF2CnHEIBh2BZ7EJgYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Gpcv1fUx; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Gpcv1fUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785114203;
	bh=B7xwk8bkofSoOCbb/Y0lzrdZi6QnX81MLwC2X54AVCo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Gpcv1fUx1dQpgaLv2/ylGmzL11KKwB8+aZj1UVHoHzsW12u7dyBTA0zwniMV3chHs
	 wx+79Fo2H2ZEmvsxikEiZgOMbzNVhVnr0SapZI1oR1ntxsNvM7LtMxLk2kfdxanrtQ
	 Nm0DUJI2vMxQoy2B2ex0ATbPiIrSGWP1GiqD+/aubMAfBOKoSLs29VF06l536xKq/l
	 J/A9/16HKUrq105km+eyBNTHX4kxY6HZ2d7PVGHBVBQ2bO1uKcORTn8Wc+xhJpHrNE
	 g4stI0JzeaNimAQX5CfZUrNXF53LIVc/lE91MP+2m3HEM3A6oSyVZrVMZc5WHqfQ19
	 rstIY9+NTO5Mw==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1C18A608E3;
	Mon, 27 Jul 2026 09:03:22 +0800 (AWST)
Message-ID: <ad836298ba3d0cf78d8b2a89692d81ad1caaba33.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	corey@minyard.net, devicetree@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 10:33:22 +0930
In-Reply-To: <CAFi2wKbNCVqZzApbG_xcDzyrN6yt_Wc01PVVqtPROcjVnp8hRg@mail.gmail.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
	 <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
	 <afa321db51d5e6cc8e0c15badc7204faa0925251.camel@codeconstruct.com.au>
	 <CAFi2wKbNCVqZzApbG_xcDzyrN6yt_Wc01PVVqtPROcjVnp8hRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Gr=C3=A9goire,

On Thu, 2026-07-23 at 09:56 +0200, Gr=C3=A9goire Layet wrote:
> Hi Andrew,
>=20
> > > =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 7 +++++++
> > > =C2=A01 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/=
dts/aspeed/aspeed-g6.dtsi
> > > index 56bb3b0444f7..a93fa4cf5d8f 100644
> > > --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > > +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > > @@ -617,6 +617,13 @@ kcs4: kcs@114 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 status =3D "disabled";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcie_kcs4: kcs@914 {
> >=20
> > Nodes need to be ordered by ascending address:
>=20
> The existing kcs4 node is already not in ascending order of address.
>=20
> 'kcs4: kcs@114' is before 'lpc_ctrl: lpc-ctrl@80'
>=20
> pcie_kcs4 has been placed here to have ascending addresses locally on
> the kcs nodes and still
> having all the kcs nodes next to each other. This matches the kcs4
> node ordering.

Understood, however:

>=20
> If ascending address is still preferred, I'll change pcie_kcs4 order of c=
ourse.

My preference is that we don't add further style problems on top of
those we already have :)

Thanks,

Andrew
