Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BAC39B960
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778278511; cv=none; b=fmZ1+nHvTa1a5xCp4jIGH0wj+JecCKh8Q2gfFJbwe7tGK3ahpnRW41u9mVIF2TewQUyYMphLf8AP+HoH43I4LL+4SEqLvWahthAwRa2OhwlyCdURj1wCDIY/XTMtwuopVeIoEfs4/YUl70e2TMtC3+tkEASSW90MadLuJ5r2R60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778278511; c=relaxed/simple;
	bh=P9AK1TZvRaiAZB9DLjLLn8vkkVNiqkwbXu6jS6ek0Rk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IhUlNuvgM1OhBGte+4h5Jyddo2RvHdlKeuVp0QTAzljDv9zd1Zi7RyG/u3+pMK/VhBGW38Asc29zxIJ/1MWYv9ZLgvJO0UuSj4mafnq0koaSmXP2GBDvHYZ8gWFipgRoVd4DzpaOfIp4PF2I7KLBwraL6S9R8r+DD/NSe7WW+r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfFpZcEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfFpZcEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE480C2BCB0;
	Fri,  8 May 2026 22:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778278508;
	bh=P9AK1TZvRaiAZB9DLjLLn8vkkVNiqkwbXu6jS6ek0Rk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cfFpZcEbjU3nOEaJDvAfKCr7E56DFW5V7wUgn9MpMsFLBMr3BDlMTZm9pQiFwgoMO
	 xAEGdI2cNDAVGXixmH70ZxolFKU3LyHJu5A0jHLBrgajyNWlEbb43NKLsZPPErJqW0
	 h45nReEm5RLx/k5TS1q51AdzmuXvcjlyRgutxQasSKYPK80URfPtT8PAj0K/6hx18L
	 Rqw8DwdRwe2HR/FTDYdpOn8l/ghl1rA1Fjfe2bryviAXo2a/gDEJ58lQKqz7FWGgLr
	 rInmytoDw4+PbA2tCG+FQ2C8f61Mbw4zMbZprJzkvuNH8mq9VbKFcpVmU6ilqBPLXl
	 2UoVl1gnpNy7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] arm: dts: st: align node patterns with
 established convention
Reply-To: sashiko@lists.linux.dev
To: "Charan Pedumuru" <charan.pedumuru@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508-st-mmc-v3-1-81c329ed28e8@gmail.com>
References: <20260508-st-mmc-v3-1-81c329ed28e8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 22:15:08 +0000
Message-Id: <20260508221508.AE480C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Renaming `sdhci` nodes to `mmc` in `stih407-family.dtsi` breaks no=
de overrides in dependent device trees, causing MMC controllers to become n=
on-functional.
--

commit 874b7326db9041ff83194d41b493b257577ea261
Author: Charan Pedumuru <charan.pedumuru@gmail.com>

arm: dts: st: align node patterns with established convention

This commit updates the device tree node patterns for ST MMC controllers to
match established conventions by renaming the sdhci nodes to mmc.

> diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts=
/st/stih407-family.dtsi
> index 3e6a0542e3aea..08acba209c564 100644
> --- a/arch/arm/boot/dts/st/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/st/stih407-family.dtsi
> @@ -596,7 +596,7 @@ spi@9542000 {
>  			status =3D "disabled";
>  		};
> =20
> -		mmc0: sdhci@9060000 {
> +		mmc0: mmc@9060000 {

Does this rename break device tree overrides in dependent files like
stih418-b2199.dts and stih410-b2260.dts?

If dependent board files override properties by reopening the nodes using
their exact path and old names (e.g., soc { mmc0: sdhci@9060000 { ... }; }),
changing the base node name here to mmc@9060000 will cause the device tree
compiler to create a new parallel node instead of merging the properties.

The original mmc@9060000 node would remain disabled, and the newly created
sdhci@9060000 node would lack the required compatible, reg, and interrupts
properties, which could prevent the MMC driver from probing correctly.

>  			compatible =3D "st,sdhci-stih407", "st,sdhci";
>  			status =3D "disabled";
>  			reg =3D <0x09060000 0x7ff>, <0x9061008 0x20>;

[ ... ]

> -		mmc1: sdhci@9080000 {
> +		mmc1: mmc@9080000 {

Could this node rename also cause similar override failures for dependent
files that override mmc1?

>  			compatible =3D "st,sdhci-stih407", "st,sdhci";
>  			status =3D "disabled";
>  			reg =3D <0x09080000 0x7ff>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-st-mmc-v3-=
0-81c329ed28e8@gmail.com?part=3D1
