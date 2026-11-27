Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795813725;
	b=s09N5VSOb6OSZ4zea0wPR4HgZsVaqz4Xy5I7DhWyNsdftvNy7YhKYwRuwjTXLwTk6Ila
	 JuSa/w8+zQEW/e7heE4DmsIm/MFfmZXe6z2XZNM5hq7oLXdgFkziYFYxvF52ndqKecRAP
	 6u+1mhhQ9FSlq2r/raJmWJVWixd0va0+5xv2Q87WciRRfpEHaqKdey0svlOVdHzT5TX04
	 ElaHOEVf4n/BAhPMw4vrFJGjePHyL4kGYYpSk0Z/1cRF0G9wnvB1ybhxPr6tHDoEyKw+A
	 MC//4pBf08DQ5h8tX0pwGAw0OALeNmydH3FZCO5jQ8mo2ImkBkDQ+lu/o5NL6sAF1/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813725;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c4W7SUgkY80T/W6rva0H75utzY+o7vHBi6RFHWwkm0M=;
	b=tMbEozpE9FigfUO84X2N3hwGbTdWVjeAUjCPg+qMDmgw2FtjazB4XF5nDWhSa3rGZwOK
	 TQtHETuZn+Ed6lrmtCuZALq60zcr1K8OfGxZtLY46gaTD9flY0epv49QaDuNy1uqqIRbd
	 Dg5HOIM19p68rz5qCh+IliFAtjsQDLDqKaX5Y8i22ERIL17M6q4l92xQKi80hVLtotysy
	 1M1EM8OSVPxeYxAc/j6iWcG4NMW7o+DgZqh99QbRNIxfz+f5vRBqGqpM0BzYzxkUSkGlE
	 oMZgtY9P1lYtOcRQYQSYWtJimR7D9tuY+w6+JD3I0Od5//YtAtN/ywAt+hYyjjbWjlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hDC/X8mL";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C13606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 21:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hDC/X8mL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6F41F00893;
	Fri, 27 Nov 2026 21:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795813725;
	bh=c4W7SUgkY80T/W6rva0H75utzY+o7vHBi6RFHWwkm0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hDC/X8mLmSzPInDR/MWxkARIclB/Shu/1p4uaWDFm+bSszbbaBKYAecFVRvTYL/x0
	 0r5gm7zchh/MxodEG+C945WdAf7103AZmxU/HO/h6Ey5+u9ZXWdEONaIuYRgoUDDrQ
	 LwZGfLXRgJ3RV8hm0+Abk3BTOaTck29bfcS9vnoSj7CUWOxQBAQcTzayv43EF2YqYr
	 TVFkzjTAVEN1AGlvi4QROeZdFguz5TiKt37v3iYhdtQYdy7EsKFjLWpuBN+SQTKaf5
	 bg+G/OlwYQdyobEq9N56yHznN7Nr+WazdhhLfz3MxbLVHsZkpDCCCO1UWAZ1C1ST30
	 4p0yzgCCmVMvA==
Message-ID: <sashiko-outbox-238282@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: cortina: Describe CS7542 peripheral
 controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-b4-cs7542-peripherals-dts-v1-1-7ce24b842b3a@gmail.com>
References: <20261127-b4-cs7542-peripherals-dts-v1-0-7ce24b842b3a@gmail.com>
 <20261127-b4-cs7542-peripherals-dts-v1-1-7ce24b842b3a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 21:08:44 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ARM: dts: cortina: removing apb_clk from cs7542.dtsi breaks
  Almond+ DTB build
- [Low] ARM: dts: cortina: commit message inaccurately claims to
  describe watchdog
--

commit d07ba40aaacde20e83aa5aeeab7822915790b944
Author: Fil Dunsky <filipp.dunsky@gmail.com>

ARM: dts: cortina: Describe CS7542 peripheral controllers

This commit adds device tree nodes for the CS7542 SoC peripheral
controllers and switches existing clock consumers from the fixed APB clock
node to the global syscon clock provider.

> Describe the shared global clock and pin controllers, peripheral
> interrupt controller and GPIO banks, I2C, watchdog, RTC, TRNG, NAND PIO
> controller, MDIO, network engine and three PCIe root ports.

[Severity: Low]
Is listing watchdog here accurate?  Unlike the other controllers listed in
this paragraph, watchdog@f8000620 was already added in commit 626ef62af03f
("ARM: dts: cortina: Add CS7542 SoC and Securifi Almond+ board") and only
has its clocks phandle updated to <&global CS7542_CLK_APB> in this patch.

> diff --git a/arch/arm/boot/dts/cortina/cs7542.dtsi b/arch/arm/boot/dts/co=
rtina/cs7542.dtsi
> index 29b0b7da86670..3d827502c9b90 100644
> --- a/arch/arm/boot/dts/cortina/cs7542.dtsi
> +++ b/arch/arm/boot/dts/cortina/cs7542.dtsi
> @@ -10,11 +12,10 @@ / {
>  	#size-cells =3D <1>;
>  	interrupt-parent =3D <&gic>;
> =20
> -	/* Rate is selected by the boot strap pins, set by the board */
> -	apb_clk: clock-apb {
> +	ref24: clock-24mhz {
>  		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
> -		clock-output-names =3D "apb";
> +		clock-frequency =3D <24000000>;
>  	};

[Severity: High]
Does removing apb_clk here break building cs7542-securifi-almondplus.dtb at
this point in the series?

arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts includes
cs7542.dtsi and still references &apb_clk:

arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts:
    ...
    &apb_clk {
    	clock-frequency =3D <150000000>;
    };

Building DTBs with CONFIG_ARCH_CORTINA_ACCESS=3Dy fails in dtc with an
unresolved phandle reference at this commit, breaking bisection until the
later commit "ARM: dts: cortina: Enable Almond+ board peripherals" removes
the &apb_clk reference from the board DTS.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-b4-cs7542-=
peripherals-dts-v1-0-7ce24b842b3a@gmail.com?part=3D1
