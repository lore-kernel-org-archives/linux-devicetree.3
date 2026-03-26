Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301BB39DBF9;
	Thu, 26 Mar 2026 05:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774503313; cv=none; b=Hr+RYvbnx1o45HTD7mk8Ko4/Be/NPV7sKnWzvT3sjmyWG5r/YjkM3ihNxcSTmfTqXEnaLcDHsS5cwS70JhgEKenG1HDtFobdi7mxp6SYTM+FU7WLBgDwt7Z7THGCgflUN5u8l6IJi8njGYYTxLGa2IGYTTQDIiGwmpkRCqLn3Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774503313; c=relaxed/simple;
	bh=fwEW/s/WlFG/QGbFNbp3U09gnsylxQg1DmuHUmprEuc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J31ocftgtAsIXp+6FINR/8a7LipAcGe8jW0CIK3V7wSdZIq7b9+06Uo1DZBWCsjgZdItO60RWG001GaDPU9uy+4ULgLCtTesU6MGaqrnsoSArcCwT2CiwPTdOleEGz40TbD+/yGt9f9mdcv2vDtI2Vj4wWcLByQcX7Hia/C9LOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=VTgnUmto; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="VTgnUmto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774503310;
	bh=il3g8uMgmZyxfuqxE59MMwiS51z8GXa/F/F4aoMlsVI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VTgnUmtoXWYE/vqR1G5jvE2cATbzQoH4Hd2dA7qzwHED0B/nhEVKPMpync81pfwRD
	 YGVzk7eBFgXMKfxap7NLscIG3TqecNGwQT2lPFb3oANLMo5vvooG0/qtkMEfggLU9Q
	 ObR7/76IWqPu8RLy11UNVj6lNpKi60h0AoA036fP98yvsw4SejcHUkngf46h0z7xM7
	 hjJhNMJI7kQU/AmLVhhaR8j3UHxBfYqjkZ1Oe3LaU5LDcs56w/w3R0bGoGdWu2fM+X
	 5gpPBUmv3t4BlxNNCqtzJGLZEgj3NXHuW64Ya+KxthZ8cRsP7jydqXMPwBmzrByRV4
	 O0b98Y6M9glCQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 81DEC6597C;
	Thu, 26 Mar 2026 13:35:09 +0800 (AWST)
Message-ID: <ec13c056cf74b4c7741e6f14cf9c49c159066f36.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: yosemite5: Add MP5998 power monitor
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Daniel Hsu <d486250@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Daniel Hsu
	 <Daniel-Hsu@quantatw.com>
Date: Thu, 26 Mar 2026 16:05:09 +1030
In-Reply-To: <20260305084650.24511-1-Daniel-Hsu@quantatw.com>
References: <20260305084650.24511-1-Daniel-Hsu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Daniel,

On Thu, 2026-03-05 at 16:46 +0800, Daniel Hsu wrote:
> Add the MP5998 power monitor device on I2C bus with address 0x46
> for the Yosemite5 platform.

I would rather you describe the purpose of the power monitoring. Why is
this instance of an MP5998 necessary in the system design? The address
of the sensor is evident from the details in the patch and isn't
necessary to describe here.

>=20
> This allows the hwmon driver to probe the device and expose the
> power monitoring telemetry to userspace.

I would prefer you reword or remove this sentence. The purpose of the
devicetree is to describe the hardware. What the firmware/kernel
chooses to do with that information is a separate problem.

Andrew

>=20
> Signed-off-by: Daniel Hsu <Daniel-Hsu@quantatw.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 5 ++++=
+
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-
> yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-
> yosemite5.dts
> index 2486981f3d6b..6287f80d70d9 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> @@ -422,6 +422,11 @@ power-sensor@45 {
> =C2=A0		shunt-resistor =3D <1000>;
> =C2=A0	};
> =C2=A0
> +	power-monitor@46 {
> +		compatible =3D "mps,mp5998";
> +		reg =3D <0x46>;
> +	};
> +
> =C2=A0	power-monitor@47 {
> =C2=A0		compatible =3D "ti,tps25990";
> =C2=A0		reg =3D <0x47>;
