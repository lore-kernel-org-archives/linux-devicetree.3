Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E6243E9F9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031528; cv=none; b=CzgA7E1TCGzzqLflVoDPfDlGFBEdMEYzbY2HOuRsZaZyKcBAdEXadJ9piM60sbGzLrkeq5LjfE2mnlNy4vwtqgxUwsp1fLY7j6tTUuHhi9+KJThY2RivdL6zxyV6n5zyjPJYVblOCilQavpiQCJSQH3ZlC3Ef6D8pm6wMCX9Yik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031528; c=relaxed/simple;
	bh=BTLiOR+mmWKvWOeGuRO/oJXKs3JjsDfGqdQB2B/2KdE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uBnmughy1IYo4XklX+3cPTeu4deMf35wxaiu3bvm+GFEQcuJt57Z2uVUwUHiZ1qd+EAWMkfjXbHyQwxTRm6kAt3MyJASSgb4wHoD1E6CmoTByqgMFyeFGKH3Nv3j/sLrwmFoe6eNgeJ2eZ6bvbKowogWAF9MvWJ4pLZ4BxS/XG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVdezo/A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVdezo/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8A11F000E9;
	Tue, 14 Jul 2026 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784031526;
	bh=n1ojTPV7eAj2hBnYnsUIVpSGYo2Gc8Bo9auy9TdwXJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EVdezo/A95JlnL5Dx0+880xp54sEbtfzg+sKPANqlStEJP+5bRSHwjio7O5bYuTt1
	 GmRkshsRsnurgydX2VB30GUEmgV5gOZ6wgOkedNgt9LNamZBJ5j0HuYsHyW9BbSA+3
	 8XUxPRuLIFNu5eXIBtPuxXPOQvDNAwYwCPlP3ErnjZvwZ13RxbuWpnas6fn628XCmf
	 Pp4oW8vNLiGt/Obmpjn9eftDmEPZryt/chJjBVrLUDmYbWJ4FwE6F8yEs3DDenJOUK
	 akMpcJpmOaHzvf7LuNRcLz1cg+HcpehNN7VnoYphIpYJ6qbbk2yc7m9tLys+uiQaFn
	 HcY3LMAl5Gjzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: bletchley: Add second source
 ISL1208 RTC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmo Chou" <chou.cosmo@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714120816.1504058-2-chou.cosmo@gmail.com>
References: <20260714120816.1504058-1-chou.cosmo@gmail.com>
 <20260714120816.1504058-2-chou.cosmo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 12:18:44 +0000
Message-Id: <20260714121845.EF8A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new `rtc@6f` node is deliberately inserted out of numerical =
order (before `rtc@51`) to manipulate probe order. This acts as a brittle w=
orkaround for a driver bug in `rtc-pcf85363.c` (which unconditionally regis=
ters a phantom RTC even when the hardware is absent).
--

--- Patch [1]: [PATCH 1/2] ARM: dts: aspeed: bletchley: Add second source I=
SL1208 RTC ---
commit e443fe47105505ac961ac3a866a76ec1173a5817
Author: Cosmo Chou <chou.cosmo@gmail.com>

ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC

This commit adds an alternative ISL1208 RTC at address 0x6f to support
boards populated with it instead of the primary PCF85263 at 0x51.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> index d1a04b63df9e0..a966be69ff27d 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> @@ -865,6 +865,11 @@ eeprom@56 {
>  		reg =3D <0x56>;
>  	};
> =20
> +	rtc@6f {
> +		compatible =3D "isil,isl1208";
> +		reg =3D <0x6f>;
> +	};
> +
>  	rtc@51 {

[Severity: Medium]
Are these device tree nodes intentionally placed out of numerical order?

Typically, device tree nodes are sorted by their unit address, meaning rtc@=
51
would normally appear before rtc@6f.

If this out-of-order placement is intended to force rtc@6f to probe first
as a workaround for a driver issue in rtc-pcf85363.c (which unconditionally
registers a phantom RTC even when the hardware is absent), could this create
a brittle dependency?

If a developer later sorts these nodes by unit address during a routine
cleanup, the probe order would change. This could allow the phantom PCF85263
device to probe first and claim /dev/rtc0, which might silently break system
timekeeping on ISL1208 boards.

>  		/* in-chip rtc disabled, use external rtc (battery-backed) */
>  		compatible =3D "nxp,pcf85263";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714120816.1504=
058-1-chou.cosmo@gmail.com?part=3D1
