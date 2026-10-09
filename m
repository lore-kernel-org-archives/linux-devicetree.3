Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28386277CA5
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 00:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791506681; cv=none; b=qwDUhUt6UkK+NVBjvsfnxrHh5aM3RFKAJvyKdDkaWAjUO78O5iHjlfTrcfdTfA7n4c29zM9GqRXj6lexJtBcXjuAX4Lmk8MB+VDlW3PlBhPWjY/oSX+Tws5/Wm5+okumBOhQLp2PfT35dgywt2HkKRAFLbPXk19XrdvqsjtpXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791506681; c=relaxed/simple;
	bh=eaRex/mZ8IevZZJmFGYhNIY21CPFyUzjgfZZefyym4w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WdKXkcJeYCAoht2B5w7O8yGFKCXa4cponiAbjn/0H/JZ7bWBlvnLWngwrk8t963YOeFrNsnFbqcHK3vTumJC4nsf0JkaixhISuAgSH4la++4507/6oA0u9s5bv1R0wiGJ6tpxibRkr+lBkXl3Jv48cNNDWx0/CLVQ4EcNjhgl0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFGBbrCP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFGBbrCP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897D91F000FF;
	Fri,  9 Oct 2026 00:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791506679;
	bh=3fkap40j+8zZppltPXZvILjzELWUapPHhXz0Dc8o+jg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XFGBbrCPZ3DQ5zud5nd2VxqbEtMU0YvKkYRvGtCNjX41CUcPLXhOwRr0lTQ6Fgp/+
	 7SyewB8s0BKidQapzRgEsyleK1ILoKhCOzDuwlUSgDTt4muXt1xZz+D6IhOs2w0XV9
	 twZ8Bk70TYW5xsstPw0WVFTF0zfl2Z21VUdVZkFbKL0zFpaxMJD4AzxfStIwLaSWSF
	 t1lahX13usFxv7q9GGutAnqjba6yuI5Npfxjq/v0ruzUaMtJpvWieR/C3e+uK3NzQa
	 qJyICwHhjAmSGWIbJ3qh73RvrMK6D8PrJMl3VaI1W+RK6m1jrdfz9wwfHlfr+w69Wp
	 hIB/NT/Hw4m0Q==
Message-ID: <sashiko-outbox-164681@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add the front panel LEDs to Kobol
 Helios64
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Velkov" <iav@iav.lv>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-helios64-leds-v1-1-6c58a66bf0c6@iav.lv>
References: <20261009-helios64-leds-v1-1-6c58a66bf0c6@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 00:44:39 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: undocumented SATA activity led-9 addition
--

commit 3279f02d863433a09e5dbd918d375fd5550e3671
Author: Igor Velkov <iav@iav.lv>

arm64: dts: rockchip: Add the front panel LEDs to Kobol Helios64

This commit adds definitions for the front panel LEDs to the Kobol Helios64
device tree. It maps the network, USB, and five SATA error LEDs to their
respective GPIO pins based on the hardware schematic.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arc=
h/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> index d146e5075b4f8..25f0ba5a47ac6 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts

[ ... ]

> @@ -120,6 +122,60 @@ led-1 {

[ ... ]

> +		led-8 {
> +			color =3D <LED_COLOR_ID_RED>;
> +			function =3D LED_FUNCTION_DISK_ERR;
> +			function-enumerator =3D <5>;
> +			gpios =3D <&gpio2 RK_PA6 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-9 {
> +			color =3D <LED_COLOR_ID_BLUE>;
> +			function =3D LED_FUNCTION_DISK_ACTIVITY;
> +			gpios =3D <&gpio4 RK_PD4 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "on";
> +		};
>  	};

[Severity: Medium]
The commit message lists a total of 7 LEDs being added (one network, one US=
B,
and five SATA error LEDs). However, this code block adds an 8th LED for SATA
activity on gpio4 RK_PD4.

Was this SATA activity LED intended to be included in this patch, and if so,
could the commit message be updated to mention it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-helios64-l=
eds-v1-1-6c58a66bf0c6@iav.lv?part=3D1
