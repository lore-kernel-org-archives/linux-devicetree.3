Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3401848D882
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045763; cv=pass; b=OvYxMEqvfioZsa4XQuSAa7qPAC6Qz8iLmUhCTrV6CMq+I22MVmAyRJi1Jzk9qd4NWw0krKbUT6Od9wtk/xfS/DSTL7eR5pH6n9sRVCsssANmv89b12YjN+XFXsKKvzuzrHz+qKkj2rlVZ8Su0ug5p1JkNWpHkrvIvnlPt4CSepk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045763; c=relaxed/simple;
	bh=OK0YfBX92H6A0Epu2Kw2rNUmQkQOp+XxcafXxrqgWXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCVsi29qyBoLBZqSgb4Fb8fBqf8kqGReovwAakoGD4t1yhZ5LFtNx4ASdBA1G8H142Jv3N5EcQhMebR05BqET+WV+YhOt34s1AluX5XFLMYUClflf3Cb6iu6Y9Rnd0WFh8ppRez3AHfGRRWksK0ocviCpLuYUloZMcRn16hlxSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmc8Thfj; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmc8Thfj"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso17800675e9.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789045758; cv=none;
        d=google.com; s=arc-20260327;
        b=euTxmsdG4xsBfC4nfeW0j61JQsce7alhRfp1votBtQTE9NRU7vZIXOhY3HF7Wfbe4i
         t8BT2zc7yi2tkxuybPOSgYdNJi1ryyFYIoe8Es8TSV7jLxhs9ROWyC9dC0yvEPCXH6YO
         Yg8fel3gVyT4BxImY0+y0seIYMviQqiqOURI9eaEQZRn6bH0s6ZL4aR9L6tuzoxVAPf7
         MtT5pJTaUA/u1EzWV3ZL/b/DuSB0i4MBTq0y/rGoIQaPSkV2By9nBmTNcAKku83TQlXc
         l4vpxcomMfm1gqdi4GOB6pyDOmjarh6+eHdQ3WY+98KjfKVZ2jK+IszT5eN+9LaE8fgh
         8DtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        fh=O/l06h8uzkx97bb4+O5lw7mVuhoUdPOUUYKzeEc1IJY=;
        b=cgQ7F26xCjKtQy3GfxLCKeKN+Ek/pRt8gIAC9WG7Wbx+j8tnxONNgc4MzpGOXJgCBG
         ThwXBr7MOCrYZ9lGjjqU+N+ftbAaJi36bU3RYO01SqoZ/oULgi9IuxQYrpIHv978C392
         ceeZ33gDe5tDCJuZBQrPutZWWYpCnr/fpLCc1aUGZRrgdFfcdDIMpQ3DaXyg2Uy+DU3i
         CjpSAnZhNkUpao8wxkiFhB0y4hZFBviVGbFLwkxUcXZLhHfwHuma8XWYvtXWV2UYIhbq
         A+A8CHANZLESvEQ/aTwxJbH5Z3sE+bgjJSMXeOgFf115nwK08ZTOhWQ3c1sT5RCqKBE4
         U10g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045758; x=1789650558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        b=Nmc8ThfjVslSMqzrKT+riGIeqWXuIbbPKhuePOqXbEtive9B071Y2UmKWQ8xIFar0v
         vA/GpXEFTitK8UACRjGIY+bU+kd4zM5UNY97QSblVGvIrYfRJ0prOF7gpAAMohqvNCHw
         ADtOp2Cffsa9pyjg6w1EN3k8gJZVPkcLDY+VveKt4EHf1RVykK1+lvIc5UhcRlBf00CD
         lawTFbZgQNQm1Fvu/R2lpmTbI5fCTfEB0dlwHpnclaXnT3rxsVg5mXzxap4nBabS/Dmo
         e31sGhW4VwAzj1pm3vv+9atnWga8YADGgOYgvziJHOfkJkr3+BNMuMZZqefb7WfskKLk
         1M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045758; x=1789650558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        b=WW1bBDvMh/1qE2c54eSfUJlsgzUqSM1KdsL642EfVqljNpaSXguvCBmfoD5nCUNSfr
         wZOIHFszqCzdK2Cqm0wgQNSrneIKmeZq96+sgk+bmG1/xtpTTVRxUAo7h8KQAQjKSyr3
         qQs8hK/k1bofAOBkEl+XQqXnRzsY2BOfubjGAa3jit+7g6w6En65hZWeJ8GWN5695RpS
         0kX6xMXx9YFMdjtIEw9SChfP6C47hGLS5qMAvSfSW5/Kg1O7FaIlMdgRNptTKMf25TE1
         a3JQ7CPgo1N9X00YNRjerzeJrYzNESJhMlANwS7V7aIF8Qmt+PBiPnuv2WxEJA/vyCbe
         02Zw==
X-Forwarded-Encrypted: i=1; AKwUvBwHaPcEAjFUbge7UUEnM3385xqsDGUWxnXGk8Q91qazh14smxqpQJUoOcEVHjciT/3ZpeJRM2xMXwyD@vger.kernel.org
X-Gm-Message-State: AFuF++khcTxULa/cyhcGY6UUC6gMXjDgfY37dfEa0my0AzI8BM7VsJST
	LE723kn+Ni6tfWbl/HgNr5uEYeGetQa5KSEwN+1mYBs+8Uw4jbDF0dwFOIcBk5eKkJl6MO/1LZb
	0czhRfbPlWRxLBJF0SpZ6YVY/wYHiKKc=
X-Gm-Gg: AYBFou30N9A6JDsjrFgzgRq0isdDahCXpQhP5apUVh7Q1F4t3AjtL8XCC85O3z7WxET
	YUBEv8CQfAMxGev0as8cFjnvZ6rMNJ0m8HzrLzAOc86WWzoqBpdRscJ9GAWQRNr2ma8zRVLNUJ5
	vMrSjtB0AzOqnZxh60AGpIFLeSOlFRt7Vm6e6s50G0D6O0J/unVBgksuLZGKo4fFBj1dI7Of3En
	6VdJtubfLsGcdENc3znb0fUNP9NBxtvBDScc5GqgUIFFY+pjkZXGqrqTFRssqPYuA6e8ytV1CbL
	T190qZpr0gI2i2aZ74hIFfRqavndi9JypaLj5TdDmBrbb8AT0I0Qzx/goGMKezy0OygEg7qssrA
	4masJRsD//sY+
X-Received: by 2002:a05:600c:6c07:b0:49d:1cc7:5ec3 with SMTP id
 5b1f17b1804b1-49d259138abmr111164355e9.9.1789045757952; Thu, 10 Sep 2026
 06:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
 <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
In-Reply-To: <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Thu, 10 Sep 2026 09:08:41 -0400
X-Gm-Features: AcwNN1UEFdvIck3fXBUKab0LkOKuiFOwC71vVQo2jwIoxCjaBOCf3NRiYyhyIhY
Message-ID: <CAJFTR8RYajZ+Az9JvemMCApvUEGG3pDLq1KVkKyAsA6Luw-0BA@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Fabio Estevam <festevam@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 4:21=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> w=
rote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The i.MX platform has grown support for three separate product
> > lines using Cortex-M based microcontrollers over the years:
> >
> >  - i.MX RT1050, a high-end microcontroller
> >  - Vybrid vf610 suppors running Linux on either the Cortex-A5
> >    CPU or the Cortex-M4 MCU
> >  - i.MX7D similarly can run Linux on the Cortex-A7 or the
> >    Cortex-M4
> >
> > There are no known upstream users of any of those three,
There is both a u-boot and buildroot config for i.MX RT1050,
I also do basic regression testing on this platform. I understand the
need to depreciate no-MMU, but it's sad to see them go.

If it helps at all to remove i.MX RT1050 there are only 11 commits
adding it that are from Giulio Benetti and I.
For i.MX RT1170 only 3 commits by me which only got partially
added. See
Commit: fff65226b229 ("pinctrl: freescale: Add i.MXRT1170 pinctrl
driver support")

I also occasionally test the stm32f429-disco as I have one.

> > so
> > drop support and simplify the platform to assume that an MMU
> > is present.
> >
> > Cc: Frank Li <Frank.Li@nxp.com>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Vladimir Zapolskiy <vz@mleia.com>
> > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
> >  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
> >  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
> >  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
> >  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------
> >  arch/arm/boot/dts/nxp/vf/Makefile             |    2 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts  |   61 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts   |   88 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi         |   61 -
> >  arch/arm/configs/imxrt_defconfig              |   35 -
> >  arch/arm/configs/vf610m4_defconfig            |   39 -
> >  arch/arm/mach-imx/Kconfig                     |   27 +-
> >  arch/arm/mach-imx/Makefile                    |    3 -
> >  arch/arm/mach-imx/mach-imx7d-cm4.c            |   18 -
> >  arch/arm/mach-imx/mach-imxrt.c                |   19 -
>
> The imxrt1050-evk dts is used in U-Boot.
>
> Adding Jesse and Giulio, who use this platform in U-Boot.

Thanks for the CC,
Jesse Taube
