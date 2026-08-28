Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA225376A16
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 18:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787943285; cv=none; b=m3twrjxjyFx9W2BPMCQWj2KxgVq1/U+XSp63eYWR5WI1gykvmMUdgigW69vsQhzK37jQYfpXujStuUqONhkEI/t402zukeNwu/Mlj72UoPddI1GlCc4H3YqsCIeLbTbfRm7FDkFtcAixFvPTry4A6sZR+Pr4NCOGGE5V1jRFvnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787943285; c=relaxed/simple;
	bh=w2l7myDNFr3pEJ3DAOfN+O21WWHDoCwubKkV5uS/nIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CKUabuRWaXdV+Y0QbnXykxxMdZI7LaJ64fj2SrxQmbaECJ0ld8NLcSSJQuxC2XfNWYhN3ehN0wYgxc/zs+2AajNOgMZTNAW37Wlb1BPn9A2Z0cdUN/KZz0ety/2THBATMnJnKxTlrtGBujrP1hbNSuXzpwh3fdLmj7uqV6eM/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YInM9m5c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YInM9m5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33681F000E9;
	Fri, 28 Aug 2026 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787943280;
	bh=FpiFr1IEbaqKYIOVUt8sHL9QP/avHxBHtWdmlBvDWAM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YInM9m5c0vDggDC3gDPNrUJWb0dk4r8qvOtkdeZHLtQvmbuTkTCqGhq3gX/Sfl3tv
	 88KZyhMjiFm6vUBTBfGDyBqGfjWIABt2i8iukjaEr4Ti6Cv43Hz/Qrxc0xzO1obT+R
	 Ek+opgtKcAQjDn+/ALO3GRC1ZBONvVBLVSH6ns04ZnmgDqCH7ezK+a9dJfi02bGxbn
	 /GJc1yiup52F767kZu6YLm4/a3mlrjrcsI1fH013guDzp1UDii1EoAV3lGHh0Utehh
	 gSnHZBrpa/K8NjCHYnDEztyPqBi9lTWh3fsn6y8Zc8xRDcrhoNok5wMkZtViuNpsCT
	 IRDdXxbcszbqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: samsung: exynos4210-i9100: Fix Bluetooth node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Cercueil" <paul@crapouillou.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260828184331.655804-1-paul@crapouillou.net>
References: <20260828184331.655804-1-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 18:54:39 +0000
Message-Id: <20260828185439.F33681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Baud rate mismatch between Bluetooth controller and host UART due =
to driver clamping.
--

commit cb253c8ef9aaafc70357be54516beee25ad6e5a6
Author: Paul Cercueil <paul@crapouillou.net>

ARM: dts: samsung: exynos4210-i9100: Fix Bluetooth node

This commit adds the uart-has-rtscts property to the bluetooth node and
configures the max-speed property to 4000000 (4 Mbps) to fix choppy audio
issues on the Galaxy S2.

> diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/bo=
ot/dts/samsung/exynos4210-i9100.dts
> --- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> +++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> @@ -875,11 +875,14 @@ &serial_0 {
>  	status =3D "okay";
> =20
>  	pinctrl-names =3D "default";
> +	uart-has-rtscts;
>  	pinctrl-0 =3D <&bt_en>, <&bt_res>, <&uart0_data>, <&uart0_fctl>;
> =20
>  	bluetooth {
>  		compatible =3D "brcm,bcm4330-bt";
> =20
> +		max-speed =3D <4000000>;

[Severity: High]
Does this configuration cause a baud rate mismatch between the Bluetooth
controller and the host UART?

When bcm_setup() configures the Broadcom controller to 4,000,000 bps, it th=
en
calls host_set_baudrate() to configure the host Exynos UART to match.

However, the request propagates to the Exynos UART driver in
drivers/tty/serial/samsung_tty.c, which enforces a hardcoded maximum baud r=
ate
of 3,000,000 via s3c24xx_serial_set_termios():

    baud =3D uart_get_baud_rate(port, termios, old, 0, 3000000);

Because 4,000,000 exceeds this limit, uart_get_baud_rate() falls back to ma=
x - 1,
returning 2,999,999.

This creates a baud rate mismatch that introduces framing errors and breaks
subsequent HCI communication.

> +
>  		shutdown-gpios =3D <&gpl0 4 GPIO_ACTIVE_HIGH>;
>  		reset-gpios =3D <&gpl1 0 GPIO_ACTIVE_LOW>;
>  		device-wakeup-gpios =3D <&gpx3 1 GPIO_ACTIVE_HIGH>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828184331.6558=
04-1-paul@crapouillou.net?part=3D1
