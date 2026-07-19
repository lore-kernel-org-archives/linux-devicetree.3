Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A6E573
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 05:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784439261; cv=none; b=osTUormDC33sYUcODawr8n3bWS1av7AxhwyS3iLTwGDAqBr3n5SBFDXzGvRIfXgFJQpfqCLddCalmwn/1ghEPKaRKCaTwkK7DP07QnxBYa/6dPyT6KXTKej9D+Kg82tSRVelvMRORYtS/E/Xhbqz5Qt724ZlF4SbxItWi/KkLeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784439261; c=relaxed/simple;
	bh=C6kHWkhZCuRERuqVHFQkKmJUxXj9UN8T958zur83IBk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pHhcaxBrcvGkkkfCGKGuSlts9t0jTUWmPGYviKrCJSsy1K04EZSoMPFybBgESxUP9eGGhKW/VOFrZ95H0Logct1jsrlPuRiH4i9byZOdc8/xdO5zsujAXzp7cYQC6ZjQ5jTHSh6KEmBC4rqoOQT+HxeFHjQQMVmx2rXQqtTfOzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJhfH2/j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJhfH2/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D041F000E9;
	Sun, 19 Jul 2026 05:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784439260;
	bh=DoApnejNm7bpyQmqPi0euRCqtmz7fjUrUUHNqh2OFcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jJhfH2/jy2dQmakavTOzQDFpJBgONVBOiiQCWuqduea9kT4Ytls+swmFaDlq0FNKG
	 48KNiDPqiJRHt8irHNyB2foVp5JlLFKxlNQUl4e1F+CTZcLDbK3BhdsmjJio9IXV8W
	 tBtC3YOj9xS+2a3O6z1mDbpmfBy0wRNrhIq9TQuHsQ5NbEy0NYQfXqz+F6IkHjbnTV
	 O9HcD6KOVDOjB5P4W6Bw4SBJZ9Wkrr2WB1y0ADoDMiczgqGIlL8p5vkQWLxKLuxKEk
	 8yq7IHfkQ3KjsL5q80TOVSQ64njjx7sLmdAdZ4TcIJcWLsYiMDD64fVu1zUXaKd6ay
	 t7gpvkeTYfhtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] powerpc/dts: mpc5121: Move GPIO controller
 properties to SoC dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260718-ads7846-pdm360ng-v1-1-f318f85cda57@gmail.com>
References: <20260718-ads7846-pdm360ng-v1-0-f318f85cda57@gmail.com>
 <20260718-ads7846-pdm360ng-v1-1-f318f85cda57@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 05:34:20 +0000
Message-Id: <20260719053420.59D041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The ads7846 touchscreen driver and gpio-mpc8xxx driver both claim =
IPIC IRQ 78, leading to an IRQ request conflict and masked interrupts.
--

--- Patch [1]: [PATCH 1/3] powerpc/dts: mpc5121: Move GPIO controller prope=
rties to SoC dtsi ---
commit 9f0c3f1fd5a726a9eddf4e07512d2ccf88203d01
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

powerpc/dts: mpc5121: Move GPIO controller properties to SoC dtsi

Define gpio@1100 with label gpio_pic as a GPIO controller and
interrupt controller directly in mpc5121.dtsi so all MPC5121 boards
inherit the correct controller capabilities.

> diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/m=
pc5121.dtsi
> index a278fb7b9e711..9c5dacb94b924 100644
> --- a/arch/powerpc/boot/dts/mpc5121.dtsi
> +++ b/arch/powerpc/boot/dts/mpc5121.dtsi

[ ... ]

> @@ -146,10 +146,14 @@ pmc@1000 {
>  			interrupts =3D <83 0x8>;
>  		};
> =20
> -		gpio@1100 {
> +		gpio_pic: gpio@1100 {
>  			compatible =3D "fsl,mpc5121-gpio";
>  			reg =3D <0x1100 0x100>;
>  			interrupts =3D <78 0x8>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;

[Severity: High]
This is a pre-existing issue, but does centralizing this interrupt controll=
er
declaration leave an unresolved IRQ request conflict on the pdm360ng board?

In arch/powerpc/boot/dts/pdm360ng.dts, the touchscreen node directly claims
IPIC IRQ 78 instead of routing through the GPIO controller:

ts@0 {
        ...
        interrupts =3D <78 0x8>;
};

Additionally, in arch/powerpc/platforms/512x/pdm360ng.c,
pdm360ng_penirq_init() directly manipulates the GPIO controller's IMR
register:

setbits32(pdm360ng_gpio_base + 0x10, 0x40);

When both the ads7846 touchscreen driver and gpio-mpc8xxx driver try to
claim IRQ 78, could the request fail with -EBUSY?=20

Even if they could share the IRQ, the gpio-mpc8xxx driver clears the GPIO
IMR register on probe, which would silently overwrite the earlier setup
done by pdm360ng_penirq_init() and mask the touchscreen's interrupt.

Could this cause a permanent loss of touch input on boot for the pdm360ng
when both drivers are enabled?

>  		};
> =20
>  		can@1300 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-ads7846-pd=
m360ng-v1-0-f318f85cda57@gmail.com?part=3D1
