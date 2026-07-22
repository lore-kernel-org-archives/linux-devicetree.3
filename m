Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD32337EFF3;
	Wed, 22 Jul 2026 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722043; cv=none; b=dX2gC5PmMA4LF3aQuZRfQ/Xal9LZHf9bxTW+B9YgSUxAxcQz4jCNuYkLG8QMHOUfF8hdiU5vMJO8zXtYlSjUImHvnh5YNh9mqWNe3+J/CwAYOSYEF1exblHQlUwgvmqGdd/Y0apnCoL3IKObKK3X3y1NkCIfhPb/Vy8OwR3+ZZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722043; c=relaxed/simple;
	bh=oKoAmz78JGx6wHxAa5zDyXXmX0hT/pV7TOrb2IzWMtU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jBDClw/soYGnrC0qiISM9KmL1lNXhHaW5OHPPkwhI+m42GOX0p4/Pgd4E+P6MJdxEFGArJuia4xoYmbhZOc22PPWJY2hjUBW2IL0ffvkWnK4/SxN7kuTyB9DWz6C5x3D2lz/fz9Vr+NmYzezWlQeKH6C/NHUid0px6zXvvdjTE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=XR/mvfMp; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="XR/mvfMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784722034;
	bh=4g4coC2IuMxL3aYFyteOm3c4yfrMMiVwCHmdodsx/Qo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XR/mvfMpKCG8tmi7pzG43sBGfvGNOaGpo9M2PY/Jcv3U75dFMchC+rlKSmXi6PhSJ
	 M4KoIjsMDaXmz8Wbj5MWoUX3rViUcKK0RafgyCrZrbqM08GyyPXPdxqxV8x2yFbjzH
	 VeMQeChy5advnbHSjAg02Zvi/hNdeVql/W/+q3qvf+XP/LkAznuexaIQOitO2b8aju
	 UvqaF4UWs3JNzF+cJJJ84YuEKo8FkM2f4io65cLQfM3ucx5XvEwdAiB8BFO5lGdvmU
	 dr6h0bZlff2Ey3/k752UzEXhV3xtnncVUYBSVH5SZN345tkjHRCNE+kleFDK4WKagk
	 a4qz4RzHMLf+Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EA69A662E1;
	Wed, 22 Jul 2026 20:07:13 +0800 (AWST)
Message-ID: <831a8c9b383d3e765a49fa35e1e36d75504fee1d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: sanmiguel: add current-range
 property for PDB HSC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Mike Hsieh <mike.quanta.115@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, Mik Lin
	 <mik.lin@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>
Date: Wed, 22 Jul 2026 21:37:13 +0930
In-Reply-To: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-2-cccf959c9b78@gmail.com>
References: 
	<20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
	 <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-2-cccf959c9b78@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-06-18 at 15:41 +0800, Mike Hsieh wrote:
> Configure the ti,current-range property for the four TI LM5066i
> hot-swap controllers on PDB board.
>=20
> This defines the hardware current limit operating mode (low/high)
> for each sensor to match the physical board design.
>=20
> Specific configurations:
> - HSC1 (0x11): low
> - HSC2 (0x13): high
> - HSC3 (0x15): high
> - HSC4 (0x17): low
>=20
> Signed-off-by: Mike Hsieh <mike.quanta.115@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> index 3faac0925a79..e518e3fc1c97 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> @@ -451,6 +451,7 @@ pdb_ti_hsc1: power-monitor@11 {
> =C2=A0		compatible =3D "ti,lm5066i";
> =C2=A0		reg =3D <0x11>;
> =C2=A0		shunt-resistor-micro-ohms =3D <1000>;
> +		ti,current-range =3D "low";
> =C2=A0	};
> =C2=A0
> =C2=A0	pdb_mps_hsc2: power-monitor@12 {
> @@ -462,6 +463,7 @@ pdb_ti_hsc2: power-monitor@13 {
> =C2=A0		compatible =3D "ti,lm5066i";
> =C2=A0		reg =3D <0x13>;
> =C2=A0		shunt-resistor-micro-ohms =3D <321>;
> +		ti,current-range =3D "high";
> =C2=A0	};
> =C2=A0
> =C2=A0	pdb_mps_hsc3: power-monitor@14 {
> @@ -473,6 +475,7 @@ pdb_ti_hsc3: power-monitor@15 {
> =C2=A0		compatible =3D "ti,lm5066i";
> =C2=A0		reg =3D <0x15>;
> =C2=A0		shunt-resistor-micro-ohms =3D <321>;
> +		ti,current-range =3D "high";
> =C2=A0	};
> =C2=A0
> =C2=A0	pdb_mps_hsc4: power-monitor@16 {
> @@ -484,6 +487,7 @@ pdb_ti_hsc4: power-monitor@17 {
> =C2=A0		compatible =3D "ti,lm5066i";
> =C2=A0		reg =3D <0x17>;
> =C2=A0		shunt-resistor-micro-ohms =3D <500>;
> +		ti,current-range =3D "low";
> =C2=A0	};
> =C2=A0
> =C2=A0	pdb_ioexp_20: gpio@20 {

The property isn't inspected by the associated driver, nor is it
allowed by the binding:

   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dtb: power-monito=
r@11 (ti,lm5066i): Unevaluated properties are not allowed ('ti,current-rang=
e' was unexpected)
           from schema $id: http://devicetree.org/schemas/hwmon/pmbus/ti,lm=
25066.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dtb: power-monito=
r@13 (ti,lm5066i): Unevaluated properties are not allowed ('ti,current-rang=
e' was unexpected)
           from schema $id: http://devicetree.org/schemas/hwmon/pmbus/ti,lm=
25066.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dtb: power-monito=
r@15 (ti,lm5066i): Unevaluated properties are not allowed ('ti,current-rang=
e' was unexpected)
           from schema $id: http://devicetree.org/schemas/hwmon/pmbus/ti,lm=
25066.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dtb: power-monito=
r@17 (ti,lm5066i): Unevaluated properties are not allowed ('ti,current-rang=
e' was unexpected)
           from schema $id: http://devicetree.org/schemas/hwmon/pmbus/ti,lm=
25066.yaml

Andrew
