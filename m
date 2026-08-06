Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2413347A88A
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019189; cv=none; b=i4yyehiLqgd7IgQED25OAaNjluD0aaeoc6tvMGfpV6ceckyEHZpLBnYRuQQ7ZnWIlHxYpS7ig/oXNrs4XQNDXpMj3zgCc5/rhiB+owHPY1BvGb9Jn8l5hvJ4GTALOlHVnOdmsVoYmd5xqE6NgaWTvsQNcvCd7a6YitUg7y0TSeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019189; c=relaxed/simple;
	bh=wVFN9oJ8i1e6Z1sOeKb6l1vuTG740GYcdW50MqMeedI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E22WdX2DNsSKoGCMSgQUJFYTqoL5ErevJf5L8rdoFCEJrMFY0E9jPhsb65w0e8h6zfhgxaFCumxU0/d5eE2KmbRDP31pjg6mP8lIR7d56+fiXxaeonfjWSAAOh3pU1fRnfiCpvaIAb7O/Wcqd8W+9u9kvCZRdtVvvM7BVwMvDOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OE4wezK2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OE4wezK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B511F000E9;
	Thu,  6 Aug 2026 12:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786019184;
	bh=5YFh8w+jhgr9+5pkACyVEkQ2OYMINEd8s3PBv/eK1ko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OE4wezK2EIqrS0glW67B02eKQP0+46ifxMIWRMaX+6aP3833+iFuZapk8RP4+tswQ
	 Zl/2eOYL9IkYWP8xjmOZBFZLylBJvCslvdcI7yamvS2pe3a9s2gCWK9jQv2no7YeW8
	 JxPjZZ2SENNmmF9q+xfkISQnq115WSJWOcefD8Icc9eIaKmFz5B9GrT86iwJ79xuky
	 3kogi10D87KhOAf4VGcxmKc/THneCeU5j5rw/Z4Mv06ilnUL2lcwu4EZLzUxuA5snQ
	 ESfBH1MQiPj6Bu2w8UBo2q/hWvybW3xVbS+Bl4d2dZ6eKhhY1R6c/3fyvomq4t6vsA
	 SlZKNbx9t/QmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Fix the BT clock-names on
 rk3399-leez-p710
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806121039.16967-2-festevam@gmail.com>
References: <20260806121039.16967-1-festevam@gmail.com>
 <20260806121039.16967-2-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 12:26:23 +0000
Message-Id: <20260806122624.57B511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect clock-name 'txco' used for a 32.768 kHz LPO clock.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: rockchip: Fix the BT clock-names on =
rk3399-leez-p710 ---
commit 6ad4dd81542316e95c763ba942c066130a8d8bba
Author: Fabio Estevam <festevam@gmail.com>

arm64: dts: rockchip: Fix the BT clock-names on rk3399-leez-p710

This commit changes the bluetooth clock-names property from ext_clock
to txco to resolve a dt-schema warning.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts b/arch/arm=
64/boot/dts/rockchip/rk3399-leez-p710.dts
> --- a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
> @@ -588,7 +588,7 @@ &uart0 {
>  	bluetooth {
>  		compatible =3D "brcm,bcm43438-bt";
>  		clocks =3D <&rk808 1>;
> -		clock-names =3D "ext_clock";
> +		clock-names =3D "txco";

[Severity: Low]
Should this be named lpo instead of txco?

The clock provided by <&rk808 1> corresponds to the RK808 PMIC's clkout2,
which is a fixed 32.768 kHz clock.

According to the brcm,bluetooth.yaml dt-bindings, an external low-power
32.768 kHz clock must be named lpo, whereas txco is reserved for
high-frequency reference clocks. Other boards with the exact same hardware
configuration correctly use lpo for <&rk808 1>.

>  		device-wakeup-gpios =3D <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
>  		host-wakeup-gpios =3D <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
>  		shutdown-gpios =3D <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806121039.1696=
7-1-festevam@gmail.com?part=3D2
