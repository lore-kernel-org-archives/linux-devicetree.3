Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3AE347C6
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018872; cv=none; b=ha0sTjiQBAiRQvkvuOl2K53aHi3mn+QbHkZD3CE98BQPF4e4W4/4QqBlXfaP1x6s+DY3qH0IR9ruokFEfQabZ/IorTtdGgkdqsTSN8O9q70ae8+hnPFL86obWG6f+4HxZPrbyS9vrWz8EKDCeZfKnoq4oVkQevGYBVXosFHaEqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018872; c=relaxed/simple;
	bh=278Oqrh95ZHdhSSPl/WfwNn34+VJTP/zfU6M4DO2BOM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cetl0OCL3K6LtGewQcW+pUqKAxcqOdT3jOfRlttwQYZn5eAruXVXI0ht8QP/5IGK0ifs/2lRhIMLuI8jGDLJjFZs+bKsEb9wJC/KvzukllpZRFSjlQvKsu3cIDtnWMD8dBpx5vDH6GpuhPbuv/lN0juVI93sSoD5eIROKaYRRug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=av8arzGZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="av8arzGZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CACA1F000E9;
	Thu,  6 Aug 2026 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786018870;
	bh=MbGo03OqzMjGAufgPRA8QpdanjEOWEP60yh4SGXPkhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=av8arzGZvyHr0w8lVYJiolUYNa4j4KSNFRW4fhzpxNMLbJQNtthtb8R+rxzc+PKvj
	 inoB4+cBPxrVemM8sT69PrhXDeuxQ0WzsWtnpMPHg5qJjNYtdVbBfQq3hSJ7V2tsC1
	 J8EgFu1AFw2CMs1DmBn88XcoKSYWVvfdbWTBLN1MAiO1dPEvIOzz9kVhb+eCeRlwcB
	 mIFbhV5cHeAQ7/M24zx0H3dG6a3fCpjBIFQwyy4TxtZlFe5VineJLdXSdT3CGtG66d
	 57y4CGYMQjpfSlg/0qV346hiOhxGR9xQksLwwVMewZjMx1zZD3TWbtUhkDfFkFiyVU
	 Ki29+qGj6UDkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Fix the BT clock-names on
 rk3399-hugsun-x99
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806121039.16967-1-festevam@gmail.com>
References: <20260806121039.16967-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 12:21:09 +0000
Message-Id: <20260806122110.5CACA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect DT clock-name misrepresents a 32.768kHz LPO clock as a hi=
gh-frequency txco clock, bypassing driver rate enforcement.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: rockchip: Fix the BT clock-names on =
rk3399-hugsun-x99 ---
commit 9f58538cc4607e21e187cba8faf882820a368c05
Author: Fabio Estevam <festevam@gmail.com>

arm64: dts: rockchip: Fix the BT clock-names on rk3399-hugsun-x99

This commit updates the clock-names property for the Bluetooth node on
the rk3399-hugsun-x99 board to fix a dt-schema warning. It changes the
name from ext_clock to txco.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/ar=
m64/boot/dts/rockchip/rk3399-hugsun-x99.dts
> --- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
> @@ -703,7 +703,7 @@ &uart0 {
>  	bluetooth {
>  		compatible =3D "brcm,bcm43438-bt";
>  		clocks =3D <&rk808 1>;
> -		clock-names =3D "ext_clock";
> +		clock-names =3D "txco";

[Severity: Low]
Should this clock be named lpo instead of txco?

The clock source <&rk808 1> is the PMIC's rtc_clko_wifi output, which
is a fixed 32.768kHz clock. According to the Bluetooth architecture and
brcm,bluetooth.yaml, a 32.768kHz clock represents the Low Power Oscillator
(lpo), while txco is typically reserved for high-frequency reference clocks
(like 26MHz or 37.4MHz).

If it is named txco, does the hci_bcm driver misclassify it and leave
its internal lpo_clk reference NULL? This would bypass the driver's
explicit 32kHz rate enforcement via clk_set_rate(dev->lpo_clk, 32768).

>  		device-wakeup-gpios =3D <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
>  		host-wakeup-gpios =3D <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
>  		shutdown-gpios =3D <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806121039.1696=
7-1-festevam@gmail.com?part=3D1
