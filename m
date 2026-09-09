Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89237408623
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 20:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985085; cv=pass; b=E5Uv5EysyBQMTLGHz3YZrPfO4WFue+vo05Y7fuTrdUcK+EJ/YbiJmFWCPtrsK0aWGeDLcugrb11o1Lt8231AN29Cmr4zytSIhDRQorUAk4OK/snsRwNS6OalF4nMtBsPNQfdzVOWCKtKFDXZ7u969DIQloIOuPEPlOl2zQbCkXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985085; c=relaxed/simple;
	bh=r0SYPe6/MLvVhiIoMkAkIXOuQ6dRGOznaSyuFqfT4PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1/BDRcXlXuDUH2K7pHL4JTkBs8OTav2ufxYzP5Ce9qpJSYNuX7znNQkvTnIX/D2DvZMwHvMf1RpdB+7pGa/GnjmJF1eUYfhYqqgvPSkT+kOa4rVxsv3ofUD6RelZuSEOmF6sK7mpo/gLyx0jynCO3U5tmSKu/eZ4emlMhQG8+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smJQALHJ; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smJQALHJ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b6188a2c0eso262380e87.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985078; cv=none;
        d=google.com; s=arc-20260327;
        b=OhKBBW/0fihFR/l9IWxAm8ly/q3YBzkSAzQNB8as30lcJJHydC3fBVDGtt8mjzBAJk
         qyzDHNyZBcqc9Kzad3XkvpxiZwVEJk6hs3PvaXJ5MXQU8KWQB/r6YmqU9keRhG78O1XC
         tktkdxSt03dCHZFh023o4ym1GD0ZqZOcJRdX1v6tRKtrn2aOvXboWDjLFA3FL9GL9vWq
         pBz79ryLBED9LmHblyRzQFXgGVpFPqBwsetZD6+A4noqXWvA+xBw9Yd278G1fuhisHJp
         pMT9KaUjdjKeVor89iJjWi6YZvhNSLTa68H1R6omBayaPZ2Hg1E0z7+zlDCQVn7zXGsc
         v8Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        fh=jc1wbe30wMHIALcsMLmkSe4b6eixkCxuGCdFkmDjb/s=;
        b=Bn4HaCLTqKFMbEX9PySa+5zRBZ70lJJFRWteqZqB+HJJdSFD6tqM+FyrSmBKeMs+iu
         VhuN7t2gU6cTbDpDeg3P647lFWGCEg87Cel2NIhai1ynGSgF1mG1kAgDlrefFVjpWcFS
         vswcGYHLUw+8Adm6sG91iqo+em8x8ZzpoKhxnkEOO5KL3L2J3RRyVWdfuh2DONntgDsg
         6lHnvTeawrwpJkg/bqHC21nUEc5Qpq4WbgGtMjwaHuBnbwltPT+vZ0LS3mAsmNPnILXr
         qa3rx+Nbk9CdvSqsyc6aJ+tpS/mAzL6qVzfqR5YT6/MviaZ46+5H80BrCb9JZaucWlP+
         VoEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985078; x=1789589878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        b=smJQALHJEKLggOAUE3JHMc4GrHnhEz7kBOpoYZ+TN9qx1gucc9icC6ZGkjkY25N0Hc
         hwOKnXbTnOmQlCMiX8WY7Wbjwvsib1tfB2qyB6MqkouZEUe5OjkyThv3qA5myAKF01PX
         BmLKDkjM5hOjVkYHLAanr63ETq0E9LC2GSoZqoox6EZvrQR6uYEu/UVdyTXh2zgSk1V2
         M024205Bv8hrlzM4HVPzmnPrUR/+dlNMyqZLhQMLQvjtwdq7uJLqGI2km027Yh8QgtFu
         7WIf3RmVmKLsaxk6qGoIS24SCB7zbMPTLBu8TI43Ok91YY3/KlWDJj6JYoMwuHjkDq5x
         NhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985078; x=1789589878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        b=kSBUqU/gpJLAmqiS3vaoBxU8Beb7uOJXOHKV4qJcpKzK1qQn67cZbCGvH6XIgqi8GW
         DqNVzB2fOPALIn+/KKRPslqGp8nmXsE8eiuxMKC2jAXWiOvEdwHKQvnv/ENGszy5Lj1v
         RukLcXg8fFppmrY/8v1SfS7cNDBPKTmJTmj2SdTZOj2SpcuyAYXFK8uIHe69n7XnfLgA
         SUKPadofGQIXEXcJQk1B1x5ysU1L+EAczya2KAakkCvtaz1Qv1MA8PzK71rGtAc0gdW7
         LONkAYlhsd9W90X3HXwKMJwRxef9YLz9yrsQkqpVSGijdGrvROkHPjidSec8KI+SEvha
         +Ayg==
X-Forwarded-Encrypted: i=1; AKwUvBwZBHpsuYTpg8/pqdxqrOvU0Tta6t/2RNTf9DH7tGwjMzOxPkrM0wex5cTY3GaB39uMlkU+57LW+XMS@vger.kernel.org
X-Gm-Message-State: AFuF++mBQUUS9/lj7pE8YPX0X31SOlZIL2w6JqQXh6Elqsy/kEhtO2i5
	Qtj/DphgAbrYeHsOXCkBX+ZCzt9Ae7OVi+DAomfIP8pZXle9jG1u+wC77RbMgfwVY83eOZ/eyzW
	/6+7UrKECzOLtkgF+P13HJ1nsAltjEGk=
X-Gm-Gg: AYBFou2BWpy36KlE915yFxKE13zApoSzwyRF+cexpQdnPEDoLhfsaJJCx8TXy9HI4Wh
	vogJi/C0iGRXEEoiStzPzEwAVRcwagHxSQkUkLmyyAAheY+dIh+kU384yLHqh5vmmYgL2TPSdHd
	OXk6c2Vju3kkTFGkq7bBJXiBs+JNpgt+XJBylzPEwjLRkCaA6ZPNCD9DLyLsnSNEegFI8KAu/BN
	H1rcF8yduAsmDe14ND5gRgH+cRxjsM/c5cMMYoflsKDZYrtt2McaMF9TTXJimrt0cp756M8YCBa
	qmVymbVeGhE8cy8CnaHeqhxRmYDk5klPg+yn8NEL61i9gGk7o6dDTaT+6XAaIUB+742PxQL2MZn
	FYLy7cLZosIKt6Qpb5DW2oT+18TZXcd2+3TfSSUHOuNE9
X-Received: by 2002:a05:6512:acd:b0:5b6:1a7c:fd86 with SMTP id
 2adb3069b0e04-5b61a7cfdb9mr6159278e87.44.1788985077633; Wed, 09 Sep 2026
 13:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-9-arnd@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 9 Sep 2026 17:17:46 -0300
X-Gm-Features: AcwNN1WKZQyaGADU6lkE-GsXnisq5MVghkNUlNC3CqrQiDAXJmgIgXPSi_5sivU
Message-ID: <CAOMZO5B4q01XRGRfK_LoR1SWkvdP-_fbSHrE4BYq7gVf7k0Xwg@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Arnd Bergmann <arnd@kernel.org>
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>
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
