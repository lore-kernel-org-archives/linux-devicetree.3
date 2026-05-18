Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6199A35F199;
	Mon, 18 May 2026 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104091; cv=none; b=mSUY0m64/WreCI6ntpEXbDtaNpy0cyTL9RTj9bxGwAlsvjJ5QB0RiQ2KhSQM5IBRQHmCGCnYhm2hi0Lfuhy0kSZmaRvhrsQYZTT082pVj6Rq9aCRAgBR809BamZCNO4chq6B39zDoHK8TaJ9+XWoOZblGzdBnYS+RQ2hYKFC0ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104091; c=relaxed/simple;
	bh=GDhJSGWnbOlWh6rBw+wx7DZ4aVfA1kCmO8wPZifp7Yw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=slWkp6PCZzvfN0LF2aOqVr1D1EwhUItI77qhmg/++dXbN+i9kur7Od1xcmJgkjd5hQGdRxDoRG2/R65o7AOEAJfkbh/ZLKeZABSTV9kjWi38BuMp2rYUj7WeOsFyOFxujgQIhAqHmEEyIfeQbtwenogYDFYx/sX8mRriV4qDMPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=GPMPfB7w; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="GPMPfB7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779104081;
	bh=REqrAQY4uKlWtuT6Rjt1VuMQRCebk3yBOhWbO+UCL2E=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=GPMPfB7wp23Hpil/z8xfSFoOpHRkAS89KniFB1Qm8LAc55RA2/mOH+Ml0vgY0Rzqa
	 MpGRWJqivCpy/NgcrDDRXAhnji4mrEtMcdZtp/Ck2wW6/xtIfOVB60P7pQVcKRZnho
	 wkIE3wv7SfE8TvNJPXwPSe3rXCJOT940liRpEMJDnEs9XCOgtRGi3reo6suvy28U1w
	 +ce5kkr0ybrEYdLuxl1DtArMQhNdWcwM6KzLPeBtmMKPWhRn2bkFjRYiLE6cc+9nRH
	 8uMvJJz8qv9kgzVv176PxqOuCvNO+nlmCpraVOmBSP2c/jDy/4Totf5hrB6Pjqb6uE
	 izsQ1G5TOXa4w==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 381E36024D;
	Mon, 18 May 2026 19:34:41 +0800 (AWST)
Message-ID: <642d8a490626d4e62473baa37bef04ce85bddb96.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 7/7] ARM: dts: aspeed: system1: DTS updates
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, eajames@linux.ibm.com,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 21:04:40 +0930
In-Reply-To: <20260421224551.1611818-8-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
	 <20260421224551.1611818-8-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ninad,

On Tue, 2026-04-21 at 17:45 -0500, Ninad Palsule wrote:
> - Removed SGPIO node as not in use anymore.
> - Updated chassis power related pins as per the new hardware design

Can you please take a look at the discussion in the thread linked
below, and consider some of the approaches outlined there?

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

I'd like to avoid a stream of backwards-incompatible changes due to
platform design changes where we can.

Andrew

>=20
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 10 ++--------
> =C2=A01 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index 91c317267d6b..d7a934fe5860 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -424,7 +424,7 @@ &pinctrl_gpiol6_unbiased
> =C2=A0	/*E0-E7*/	"","","","","","","","",
> =C2=A0	/*F0-F7*/	"","","","","","","","",
> =C2=A0	/*G0-G7*/	"","","","","","","","",
> -	/*H0-H7*/	"","","","","","","","",
> +	/*H0-H7*/	"power-chassis-good","power-chassis-reboot","","","","","",""=
,
> =C2=A0	/*I0-I7*/	"","","","","","","","",
> =C2=A0	/*J0-J7*/	"","","","","","","","",
> =C2=A0	/*K0-K7*/	"","","","","","","","",
> @@ -440,7 +440,7 @@ &pinctrl_gpiol6_unbiased
> =C2=A0	/*U0-U7*/	"","","","","","","","",
> =C2=A0	/*V0-V7*/	"","rtc-battery-voltage-read-enable","","power-chassis-c=
ontrol","","","","",
> =C2=A0	/*W0-W7*/	"","","","","","","","",
> -	/*X0-X7*/	"fpga-pgood","power-chassis-good","pch-pgood","","","","","",
> +	/*X0-X7*/	"fpga-pgood","","pch-pgood","","","","","",
> =C2=A0	/*Y0-Y7*/	"","","","","","","","",
> =C2=A0	/*Z0-Z7*/	"","","","","","","","";
> =C2=A0
> @@ -486,12 +486,6 @@ &emmc {
> =C2=A0	clk-phase-mmc-hs200 =3D <180>, <180>;
> =C2=A0};
> =C2=A0
> -&sgpiom0 {
> -	status =3D "okay";
> -	ngpios =3D <128>;
> -	bus-frequency =3D <500000>;
> -};
> -
> =C2=A0&ibt {
> =C2=A0	status =3D "okay";
> =C2=A0};
