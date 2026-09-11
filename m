Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7FE3EB81D
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 03:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098288; cv=pass; b=XX1e59D+yM8NHd51mv4L29nVQiDnwPseIuFtMKoZ8raWUusPo0mZcTABcgRmShUjFmTVeAte0dmLAYW/yxZZTnO9ssxnKwMOg/UxVLYGqquFofF74uBL4LrGu8hE/or+159NmPFwLfTS6vSM/O2sOE+SvoBWr8xNHmRPsVagFv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098288; c=relaxed/simple;
	bh=9MUCzlT67j02Tdxv5MkPUdx0rDyVjNu0IwYTyNrltgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbFX36SfTi/z7uQmLWT9Av3Xb2O/hEhJpum8yGQIRtPLRmuoVXoDHoWHOB0gEJXleUobAl/NOb8OGVHzMHWWF61++5nSjKsS1BPOD0HgwCz9BuSTBLtcXvaXQaMjVqtyhg26yc3ZaASlYlu5XdpR+j51gHLCoinCVl6Kp2k8vdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2V24x4G; arc=pass smtp.client-ip=74.125.230.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2V24x4G"
Received: by mail-qk2-f3.google.com with SMTP id d75a77b69052e-51bfca7f85aso3859871cf.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 20:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789098286; cv=none;
        d=google.com; s=arc-20260327;
        b=ctpFcJsAzECZHUm6ng4ZOcBXb+ARxTzYuGwfdFUgJaCTrUIjLfhTinyPyFay+Mv9Dv
         u0HH64taKJ6gIhAzVbEqlR+yLp2OQ8aNn9mxSAHTUfbKoM5p4SPy4GTOtfadSKbVAB+K
         4Rapg7DgwfBBslLLUbBkhRzSs9LQaqYwdf8/TTWsI8+t+PrPSZcx2Bftki+UXA6aQWsQ
         8fPRlTD0PAVQuCay1+mWn5myZnw0s7cLDgcAtr7nM4PasX1P//SciQG3ycKj6zqUReyf
         QUHNa80Pa7Y1cLMiPEIXdUujeCECYEZkpp1wDMaRPIaGo1raOMgDMO56t220aMVnlBvz
         2cYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9MUCzlT67j02Tdxv5MkPUdx0rDyVjNu0IwYTyNrltgs=;
        fh=NTEVCDsQwAEitO51MnNyv/9QOmwDJCeKhQuIlnafdEE=;
        b=kaqqVOmawMPcj/ZQQGNMZ9qqwNAOgD7IvhJLS0dLyl3JNifAfBr6kAthOucJL5/9JP
         cvXD+24nozb4xYY+Ay4Re2f76PoqJt8xXjTU9dRkJ1ieGyY/BnOUXYDij2Lyus1csKlK
         6Q/vWs4eg8ne+MYcQ9qcQi9VR0BUp8csXJBegnwmdk462lfdfYf9bjVN6OO+2jSRE9if
         HrbM00KXZgxS5Q1HlUzAaI+Oh5/3kLmji6VwLbW/wX4lXrdLlENvtKEpd9wb+eVUyYY2
         lp3VwKAviIRN2qrXuLkVkD714QzGrxTY+JRcB8Sdld+aQzxntjyUnL6zK3uydn4eO28N
         qyjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789098286; x=1789703086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9MUCzlT67j02Tdxv5MkPUdx0rDyVjNu0IwYTyNrltgs=;
        b=G2V24x4GGyCwAd8LaJ2X8PGNbql6wdGj7itobGHv+DWtilwCENd20LNJWE0FPLHB3/
         0AjlkwMCGqs9CTmfIsOad/o7305l5dxeD1ZFHVPrHnNcoEDHmmOEkUoLBmMXN0uGF9mA
         NFt62u0bdoESjLGcIpLtJ0v7+FmJRxrD/o1lT5g+LldSZZhD3Og4hV+mUCCZhqbjd2JS
         rECTuLTUzPCSAjku7N+dnRXlt7UYkl6EGUg9xcf0TT9TiheCSHMZR1kposahxXE8JxLQ
         5XMF89T6zDhqWdtlqtNhZhEm9Fss7ApuSwbHeeM2sCdkBm+3v8htMXW4iBX0va4HMp+v
         aDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789098286; x=1789703086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MUCzlT67j02Tdxv5MkPUdx0rDyVjNu0IwYTyNrltgs=;
        b=TC53Mppxa5J9I1XvwBIuF3S0qSBVK56YrDkeuR98jEIe0/QOp2yxahwBGHosrhEZiE
         /I++vd64d6Cm2YGx5hkkh9nE5bLFd3mk6TU6B1wKqrtGhnuwc89c7ieTHFXF9kD8ZjaL
         6qbTKTzIU68Bp+UGLDBrV2FLoc4qZ84JgD66YEQ9BK8eGchkHxjOiKtO2+83Hkr4ZRhu
         k19izTTnFxb66w7fRu0DyU0AAFlUVklu02Lo4uwewn93VxQVDljqPfyji22aXfVD1Rea
         z4oALt9damKsBSv6/EUgGTKK73jjIB4DoBW/s/+ZC8nvadyOX+aKbeQtSjitp5DlGb9E
         gSyA==
X-Forwarded-Encrypted: i=1; AKwUvBzDvZK0fnRpGPr1hQRNgDX2c7XkhhWHK5ZAxn582lWnmsVyrapN7+1B1yYLl7NA4IRV7pLr6SnSkkfC@vger.kernel.org
X-Gm-Message-State: AFuF++kizYY51H5RclInjHTgM41JHwHypNkEWoIS8+eCYtL30+LzD55l
	JtoHXks1r/nBWhXk3uuLtk1eBaUqmgvJyMfr2MHy71rjZxrL9b0o/Hu4d9w74FgEz5hTpzyK27Y
	FbvBcjdWnTERXZJf77mE//3srip1+gq4=
X-Gm-Gg: AYBFou3NwP2VhkujIgum2SwmtGUySndxizAmVX0MRyrAzfW4ROjl6SU87yctOeH0TNb
	4zT5LFv7uy4Nq2zWztXYQAdG6MzWmUdbct/Xo+OhlcrXxbxkeZ9VyPLGhMageCAQMQNTMguV4s+
	ZZrSwWyDbrPRuz3jxFNM9ckx3NkmgBezXeC+QM2iA2sq4JjEMGXD72W9Fdt/ADsCPBJh4Dg85Ui
	j7izFzWFJsNzMEkSawAvs4GcbqAyUNipKoSpEtakVWRPNKiA2WxgDhw05bus4LRr2DLlOWpCrQc
	IYi0JUH/VRv+Z8+95tQRSdwlpCfQYtIbzJjeweH/4vcFo6tFvBTrh3eupszqH+L3l58kbgZp0Ar
	ZYv+To/ygEVTOLi5wCqvDtqQAhvyk4N8AF6HxrDKe
X-Received: by 2002:a05:622a:5987:b0:52d:918b:92e1 with SMTP id
 d75a77b69052e-530c84f326bmr40390581cf.5.1789098285727; Thu, 10 Sep 2026
 20:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-4-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Thu, 10 Sep 2026 20:44:34 -0700
X-Gm-Features: AcwNN1V1fOC0jmd_i5r-nVHD_ZWN_P0KCiZNA7MUoO0nuGcjQ9okMtkGALkOIWk
Message-ID: <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, everyone,

On Tue, Sep 8, 2026 at 8:29=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> The main limitation here is the CPU bus that does not allow 16-bit
> wide data transfers and hence requires the kernel to be built with the
> -march=3Darmv3 compiler option that was discontinued in gcc-9.
>
> As gcc-8 is barely supported for compiling the kernel, this one
> will not see another LTS kernel release, so remove it now.

Because I think it's cool that the kernel still supports actual Acorn
hardware, I patched gcc 16.2 to restore ARMv3m support:
https://github.com/EthanNelson-Moore/gcc-arm-retro

This ended up being surprisingly straightforward - only a couple
hundred lines changed - and it would be even fewer lines had I not
reverted a commit that adds a use of ldrh instead of fixing it.

It is able to compile a kernel successfully (once you update the GCC
version check to check for -march=3Darmv3m support instead - I can send
my patch). I haven't tested it, but I am fairly confident that it
would run, because the assembler will reject code the compiler
generates with unsupported instructions - this is how I found the
commit I needed to revert.

I am working on a clocksource driver, which uses both timers (to
hopefully fix the awful time drift), and removes the dependency on
LEGACY_TIMER_TICK.

I also have patches for several cleanups to Risc PC-related code.

I am aware that this has no actual use case, but it was fun. No LLM
was used for any part of the work.

Ethan
