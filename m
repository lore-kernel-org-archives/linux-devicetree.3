Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035603F211A
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 20:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985307; cv=pass; b=OOnfMcM4oIaE++UgINQNlBmtfGfao8hLnxbYFbBuOQMRFLP30bxc9o311qsyXIiBZB0KRI/yUEaNZ17sZfQcsIA4yZw54GELjJfqQ5QuKoKS8olj9en0Xj4eo/qq18cwgXhyV06obQ/RZ9/FFDOWJCC/guiE8aW9f7X9KFtZ8OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985307; c=relaxed/simple;
	bh=0VHC4PV1n3kvmpJBB03kx86ZwKDGKzt09AXVkbRvG6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESvnRPg1h5ud/g58WwN+lOoVHaH/nPGq3Rtr1wIPmZG08CPIW3JXzb18uYz8r7nL555kkhzreyJuKp5Jhd1QEzfLFye0fIEHKxpxGd/zza6BACOaWwu+BQqqUDyUYzzSR34Fukslg4EkP9uOZ9dsS4cgSLlw2W7XO0qHlWCDG2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUIaaVuJ; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUIaaVuJ"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a309f92daaso52193211fa.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985296; cv=none;
        d=google.com; s=arc-20260327;
        b=QrgOhwbnbBPMbsRzlYtM9BMzhaGxskutz8WuV09MQ0/JUUTqBOyJYrn/efpjqT3Qby
         XQaMDZKzPUqpRAYCgHaboOYZcam4t2l4rk9QXQB2A2oLVd3DbPZGgnnAvEgxLIMrgX64
         6Wikji/ntxAhqjilukUXq6J0aqR7nTNn5II5fO27GThxR+xePSjek2fwSdI1u06dVq/n
         vjNrcJ4QrDKaXlGl8x7nfZuMC0GAVox0N+U1+lSzgwy4w9QZJ30/qkrTGHxMnMM2tuPP
         GOD4HCz4AhXzg38zlQp/XaYwpOlUUaufNCvAGOMWBi3pjM0l64bFU1T+zCTyP3nvLezT
         pDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        fh=UXxbL7SuS0/zZLsx/1J1ajsLOXkp/4/7Vh07a3p2D0A=;
        b=BLx86oX0s6mtA6itP74YZ0SOB3u9JmVR0PP3Op5XeO/wLdnwsXDQuKlHbhaeczpz6/
         j+Mz6RHHU21lhEi0PM73+4KenohBpvwFyH3Lzn/SYZHgR/dE2bEHREx2lKnjv+8j66Cf
         k7gmYoxULWsetwLYTK86unB+F8e9EbjJq3pFnpwDBHrHdD9T0/pAMQkJmEUu2Td9Jb8q
         Lal5OZVS+A3X07jJjceupsjuvTrMppN2F2DUoTkju7ggfTieucoGHAM3fYZeRm+0sZxX
         StQ4S57FKEPXvZ8g8kJmR3Fh85veklF2Md7GPpidTxOzZ+u+orb03ly1ryjbBtRtGvlU
         bJMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985296; x=1789590096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        b=LUIaaVuJod11/3g/t6MbNyyoSX0CGO7oms/3y74cxk2EqkM2BDpR1KUNdVBrhuAfA9
         bSMPndRxSTkcgUpnYqN9zDlJgMWyAIZ1UlS4m1CFX6RVka/csj2ljbMnaDf/WDF0xUDh
         p2RzP3hZ0yLqEloDhD4nDMUMHpuQiLu3xcB5SXR3tnbFjOiY3ZxDtdXHK9mR1nh+VEF4
         TTnh0U90Ta5H05+5Kn4Vu/aOoDSE/k82LatXfdQtFVmsxCKPCz6dRSa3x5X9sCT78Hxh
         Q/o0uo7WWnZte+3/JDYeSMruLATwmPWM3pOGCjLoBwn3RAf8UCyqjrKgQFa8QCOsHz5l
         zJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985296; x=1789590096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        b=gcucR3zYFK5L+tSZ03qDG2kvQiWkdSIllUK5gY7rgcA0sSARwgQxxRwquhUuKdt53W
         ujriM4UCOAI+ZYUx3Emyt9atCAIcy1lDQUFR1PFcYZt3mVZ8uBFQmysj+/K7V3DDsZvh
         pLoiau7f+St5MJjcP2IaZJFGiFqhb1ETQ9zuHCsyjobS4BFfO5DP6TkC0hCaHmxzHKtr
         Wjfgfz+t/xm7gXqR+fd3keRheU4aCl6wcWl/SlJQAEs5QE6o75MMaaKzTjrbkOutND3/
         Z9V8MPxojy08y3gpQW9Wz02/rnxRVzH5sL4OUFu4UoqaFrrLNUSHBxQ4zLU4gzLTUBp4
         HQ5A==
X-Forwarded-Encrypted: i=1; AKwUvBwI058x06D84FycQxcaxL4pWJuJnBCLN/YRMIylmhUHLYyN/MK47/k+uNEGZifRAgVX2RNJlxL/IvTN@vger.kernel.org
X-Gm-Message-State: AFuF++m+qzc2B7vPpBLZBNORjfITl4FR95K7vS7MoX8hci5GNetSxU7t
	8bedbhyxle1trovrAzgbtwLl7CKbj/IDaT+DcfI5dPoed5QG9BEV57K5MoSvBoQx4v9le9toYQc
	w4Ul+5wyLOqWEDnosMsaczSJ//dM7/7c=
X-Gm-Gg: AYBFou0sKCsWGXyV0VQceh9piazfyFN4+Q4c1Yv+N+8hTzF5JVHMjLbdLpkpfzo46Di
	13RcDFOcIq1I98IEhS3wVz57F2CZBUpb9U/tiVnRsUZmIoSHPZWzjAH1bfuy+FzRpm4we9Nm42j
	HqEOHMsikMYg+oc60Aqhcj2LjsT0ZtXAn/aoywXMJKl5ZdmjUwYLBb0m9cuDfYMASt8lY5H6zqc
	j77+SOmc9z99f17A47Fw4pBvGNKiAB4Mkg+HN0j7gCaT/Hh/vrNv6Q/oWxBIbn8lc3gKKjHyPMa
	aYCon7o6XWKRsoWxCQQQaJuvNuW7FDvKqZbHGA5I2icyje57bbMM6D2Wasyxk2/1pgWqdDZOy+x
	DB2ESi5B01hw/R05OS9Q0f1U7pCl4I2sbUihLbnvY1xiN
X-Received: by 2002:a05:651c:b0f:b0:3a3:749e:31a4 with SMTP id
 38308e7fff4ca-3a58d92c643mr3500071fa.24.1788985296110; Wed, 09 Sep 2026
 13:21:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-9-arnd@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 9 Sep 2026 17:21:24 -0300
X-Gm-Features: AcwNN1XhCWWR_p45edJ2cAUvnO6YnDwGtKUGW17Fe3LwHfhT5TU0cNccQ42bU4E
Message-ID: <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Arnd Bergmann <arnd@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
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

On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The i.MX platform has grown support for three separate product
> lines using Cortex-M based microcontrollers over the years:
>
>  - i.MX RT1050, a high-end microcontroller
>  - Vybrid vf610 suppors running Linux on either the Cortex-A5
>    CPU or the Cortex-M4 MCU
>  - i.MX7D similarly can run Linux on the Cortex-A7 or the
>    Cortex-M4
>
> There are no known upstream users of any of those three, so
> drop support and simplify the platform to assume that an MMU
> is present.
>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
>  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
>  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------
>  arch/arm/boot/dts/nxp/vf/Makefile             |    2 -
>  arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts  |   61 -
>  arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts   |   88 -
>  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi         |   61 -
>  arch/arm/configs/imxrt_defconfig              |   35 -
>  arch/arm/configs/vf610m4_defconfig            |   39 -
>  arch/arm/mach-imx/Kconfig                     |   27 +-
>  arch/arm/mach-imx/Makefile                    |    3 -
>  arch/arm/mach-imx/mach-imx7d-cm4.c            |   18 -
>  arch/arm/mach-imx/mach-imxrt.c                |   19 -

The imxrt1050-evk dts is used in U-Boot.

Adding Jesse and Giulio, who use this platform in U-Boot.
