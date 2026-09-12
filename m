Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E438E2D5C83
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 01:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789176586; cv=pass; b=HF7ex7uutkNVNakw8eC2YmGsGa20zLQ+QDvNKkBZDFvPpQz5YPjSHWER3N1J0eM+5RjH/CnEcY71Cz6+EVTCTSUBgdgsXKqZW/I6OSSP8UwtBPhcKeGUkkalbFAGzdxaxk/0wEKReoM+ouNzg03VK/3QWrQUuc+cjv5G90Q4Qxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789176586; c=relaxed/simple;
	bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obWk63JuHcJczXJv5yqv1IHbsm7EMlPChMQ7ry+l9fs0kNl4x7bCrzZ/RI5ImuYdjQTnFSr5kcK1icPabz8XhqC0vw9PXqfie+7iWCPltfzJp0iahxxYj78BASX8ZCk4+16kt4AKXWcBPAlVA8k1a0R2Qojb59Ou5Y32rbcAQZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=QAqLa2iA; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="QAqLa2iA"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f9bso4937855ad.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 18:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789176583; cv=none;
        d=google.com; s=arc-20260327;
        b=JY5JcF3pIH1eRHpewqH6mlaOXxotJYJ9rXaOSl8jm5AgTXcdmgc0rbl1dR4SsZOcPp
         CAdulMegaomN6mSaMMDMknvTGH1tlHmzpAQyzQHMOSo0owIg6sScFLjkrtr9InBmOzJs
         yzoq2TvMJvICuYTJNoPrmPNKTPfNtw59yfb6KDhkdyb8y0oPV3EroZSZDJABzWGM9/HU
         Kj47Sga0UomllCI0cgoV9ck0pdJ+DDM305Uw8d8f/nZO+Fo9o5gVJrPA0EShYS8/M9UT
         sgWSEJ2y1/NqKceMrmvxuKpTOJh3fSqThdDiojznIib/ERwkKUaR6LMtAluXTOsstIfs
         O0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
        fh=dOlmkjiYu8E0rZOxrHyxNlW5jv7ApZonWvm1m+bPBIU=;
        b=ioVfihojShjJDVu741rbUctxRpsjZ5WStnp7RGIjvsTLxuFBd2Qsx2PRUBdAYkgjn+
         kwNfxy0mQximofxOw1s2y1deBmt3cLY8J2ryJClUzCw7AvwGwuLqzjS4E86DW5rYhxff
         /7WHyZxlRfUNWahq/3zuQYst04yM7xDBjnYHxxAv4x6eNzIL306LqG/DI+wSoFmNAmDa
         ysfVMsPKyEmRLeN5zIXE23pbult1XBHMywCvhRikRg13QugpzfBA8esMtxcuXVq/B2gd
         LDNSMTCwOyMNorJUd9w+LMPnkoTl+1Zl/Ag093e50Aql4FbWWBaYcwlUDYKKhNAiNUc7
         teMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1789176583; x=1789781383; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
        b=QAqLa2iAbwvbRxmC6B/DPpQl65ZVNzEquWN6wGgAhav0o7h1rYsToOePhjX5FWfOwV
         2QVaUBzUttmd9Bo86TSJ6STiOqDzCq4lJcczZXWAE7fbGVZ3m8PWgwWu+anMzWklqRTP
         /wcfwddYmq2X1nPNtWMdy+IL2+QUWEynTsNoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789176583; x=1789781383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
        b=aKWc5j7hkyWO5BxGZFjvy58+UD9LuD84ra1i/pqTER1YJsbPyjwGK2AqiqagpQcaRA
         nBIFAXFIxCV4kUXoIgyxfaTJe3QsPvVa1Grcwa4lvG/7Y5T2OxlPHZPuwZ9afHz4Wjmu
         RaTEvH/8XC/m4ZQ5C28yjfUbcMFYq+5WyHlU5R6bBVshlK5mikIFlrrpBkLiXnDYUBjO
         JFYThaVClj+HGQGjnxA9nak3+JMZMTN0RNMaImpjGkJp/ph8chSbwQxbOgJUCUd7B89T
         cZIIqywOcuFQnOTsYbnXy+BoN74l3h6/wbxQu6Bk3uj5t+Z3hRsaU+IH0nxnGKBkoHbA
         lrxg==
X-Forwarded-Encrypted: i=1; AKwUvBykKjEvw3c/FWangHMF6YiuV0Hmyiv76F69yuYvLL4gkU0JTg2DXLKCM/FGH2cUR71REwAWEK8I6XzZ@vger.kernel.org
X-Gm-Message-State: AFuF++k2Ak4Lo6ZVmMeP/R5GM9sdZ8H3q6sqwD2EMGLt0Kwb/1vVBsbz
	G35YkrNDRETBbBkFusCXLPunowh4isMxj+NqxtwaZBqEcOKqXQYlmmAsYnfcyPT1mPSMVGnsgbY
	oc7Tj2XbzqGh2RWAdn7czMfvkyn+ZLJwkKi1LAJsFFA==
X-Gm-Gg: AYBFou2yXnsWk+sf5x8XKZ3ev7Jh18XAkjHWZavn9jImpX2lkHkEmjS+T4PwgL0gY9u
	/7/LjLsM8eJz66aM5zIDa4TP1phIIIUCODJVR3IEsdFxhA0bVK9rNDBfi8aakf4Y5zmzEgAYAxp
	QBrGfGT5WGF2B4Su2PEFf+6FFKsqVkpXiEhq4367RfQ54m9EEIwH2symxA5NuryM9EykApV115M
	xtS7uD77O2d5/R4tisGVZN4UVbXijVvjcRw15LoIgdgUza3IUDGIKz2f7f9NvMNnN6Q3xTvDPpK
	Y4EOo/zimnMNvYHM2c4/pMCKUzJd1C6bBYNeoykdJn548VJjgHM0Tg==
X-Received: by 2002:a17:90b:4fc2:b0:381:6c5:3f63 with SMTP id
 98e67ed59e1d1-39d9bc42d1bmr12376403a91.6.1789176583130; Fri, 11 Sep 2026
 18:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>
 <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
 <CAFr9PX=_FmMdR4TeP+tqURZdZCTjw8UYxAxeszs_vcpTbX+_aw@mail.gmail.com> <CAD++jL=zaF1zcTv6Mta5Xw69WeLC30NRcH0_pkSkLJJ0UtnZHQ@mail.gmail.com>
In-Reply-To: <CAD++jL=zaF1zcTv6Mta5Xw69WeLC30NRcH0_pkSkLJJ0UtnZHQ@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 12 Sep 2026 10:29:30 +0900
X-Gm-Features: AcwNN1UYIuhyU3FVES8GlXYNI9phDxlCK3dBrZsiSwUakZtphqfaiRPyo96Awf4
Message-ID: <CAFr9PX=tVOzqGU4k0zSzXheuU5z5LZi4LSGdUvjChrSTrbyjJg@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Linus Walleij <linusw@kernel.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
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

Hi Linus,

On Sat, 12 Sept 2026 at 03:15, Linus Walleij <linusw@kernel.org> wrote:
> I would say using generic entry would be a prerequisite for
> doing m68k SMP so we don't introduce *more* entry
> oddities, but after that I'm game.

I have started this for one part of the m68k tree (68000), but it's
one of those things that is hard/frustrating to test on real hardware.
For the last few weeks I've had claude create a QEMU that can boot all
of the m68k supported machines to Linux, Netbsd and their original OS.
It already found this:
https://lore.kernel.org/linux-m68k/20260828094940.3882602-1-daniel@0x0f.com/

> As SoC maintainer I see that m68k has a lot of technical debt
> like drivers under arch/m68k and no proper hardware description
> (such as device tree)

I have m68k machines using devicetree... :)

> There are things like
> amiints.c, cia.c, ataints.c, q40ints.c etc that should be in
> drivers/irqchip. So many time.c that should be in
> drivers/clocksource/* and many other unmodern things.

Would be easier with devicetree. But is anyone crazy enough to go
through the pain of merging the devicetree support and then arguing
about devicetree bindings for each of those drivers only to be told
m68k should just be removed?

> Albeit I think actually going and fixing that can't be super-hard
> in the age of LLMs. So listing things like this likely will just make
> someone go and do it. :D

Once you have an emulator that the LLM can operate it can do the
change/build/test/debug cycle all on its own.
With a test harness it can even test the changes work on the real hardware.
But I don't think that's enough to convince people the changes are
worth reviewing/merging.

Cheers,

Daniel
