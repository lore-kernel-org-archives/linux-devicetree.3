Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6133DD871
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556897; cv=none; b=hdIfX9luwBBL1LlebSGURY6eRFvhre5sTJtpQfVwDJ4xUEISybcuZ+hOXv1EvLejyuy5wOZVXhqmDrYWNWysY70aHTJXolMtNgU2VTqWzjbQwcvf3LBBsSMzR57YM+o8cXoTqvw0x28u5BiyfmjtXNy3lTFKPze8uK6qZ4kszA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556897; c=relaxed/simple;
	bh=1dvu/0LLTLR90O0gqLSPoOmo08aBaWTNMO5iUwIC680=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XhXocnVBm/BaCYk8aCx6h2qdkTgKGszyWzurKsC1gOJZR27PrW/TidE6CxTbNldrM7eCU0ywTectDSjE4yy3HUE1o6gmYsjgNK+gCuTZMASq0i4x4b+3bghF4Aj68cB1q05hA4h4LHJknVpWdcGR+zFQ4NgIS2Wzhc1gJmlknjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZTWob//; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZTWob//"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257491F00893;
	Thu,  4 Jun 2026 07:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780556896;
	bh=+zLSbGogwb064Eke+QTyFLFklQEMGuOqWVZhHbCaSOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZTWob//31KDNMPemQIHComreNaNKy5xTmSX2PMdlT/Nq8ChNSu43RfqKQeg+Da36
	 OqRfP+IlvsjA/54C1Q9ugTrupEEzfp6Fr0gzUhMSiW+jlH8/1dtLTw/AphUh4yGQzr
	 MZ9q2JU0bWpnrALzV0pJ8Xr+XGNMeldTAVhXQs/rHB/WtCBT9DaRDvJOnnS6DoMEaw
	 FiVzRAEhyHsWTVusLXvyCvIsWVuomMH/SlFdXgirB0VywvSE2+WySrVryUjsn6Zmmf
	 XrPPzvnvqxxUGXPaCQSB2rZStLsOlR0kC32k+RSrGstXxoxGclNmkoO4wIV6/epcME
	 UHE2tumzSAy/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 07/10] ARM: tegra: tf701t: Fix BCM4334 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604065556.137614-8-clamor95@gmail.com>
References: <20260604065556.137614-8-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:08:15 +0000
Message-Id: <20260604070816.257491F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch silently changes the WiFi node's compatible string to =
include 'brcm,bcm43340-fmac', which contradicts the commit message stating =
it fixes 'BCM4334' configuration.
--

commit e6b9085d18e1ff9ab5d22d698abaaba30676ee22
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: tf701t: Fix BCM4334 configuration

This commit removes the reset GPIO from the Bluetooth node and adds the
lpo clock to both the WiFi and Bluetooth nodes to fix configuration.

> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index 73276f2aa7fe4..e3e0b4ba7eb86 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts

[ ... ]

> @@ -2382,9 +2382,12 @@ mmc@78000000 {
>  		vqmmc-supply =3D <&vdd_1v8_vio>;
> =20
>  		wifi@1 {
> -			compatible =3D "brcm,bcm4329-fmac";
> +			compatible =3D "brcm,bcm43340-fmac", "brcm,bcm4329-fmac";

[Severity: Medium]
The commit message notes this fixes BCM4334 configuration, and explicitly
mentions dropping a GPIO and adding an lpo clock, but it does not mention
modifying the compatible string.

Could the commit message be updated to document this change? Also, is
brcm,bcm43340-fmac the correct value here, or is it a typo for
brcm,bcm4334-fmac, given the commit title and the Bluetooth node both
specify BCM4334?

>  			reg =3D <1>;
> =20
> +			clocks =3D <&palmas_clk32k>;
> +			clock-names =3D "lpo";
> +
>  			interrupt-parent =3D <&gpio>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604065556.1376=
14-1-clamor95@gmail.com?part=3D7
