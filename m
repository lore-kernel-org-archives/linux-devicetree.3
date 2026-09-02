Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E0D449B1A
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355362; cv=none; b=C4wiB3diw5heMXk0bRrP6kIJ0uSdpb0x8+L2l+nq8gq1EIEebg0stWLdvYva3jZSS+Oy/yZucMuq4rTzgNL/yDsZCU9hroo/SuNhzj8iNH4hFSV/LxMLEfdq4s+OOCUZoKF7mmegJOnjV49fR5SOEkg4UtDXv9AgE6l4oAZBHtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355362; c=relaxed/simple;
	bh=j3CWAWUl8j20gvrMWzwPLAHuKWnZJAop7WNcGJxwH2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1EQdNrZuHizt3S6JXp2AKV/6IRU6xijEZ5qQM4eAyUOa4njEd/Sgdwq+HAeZ0tjsLd703qHuZyjkILaot+WMs44m80w1oorG/P1JE0ES/uG/KKnNqgU54jMTct/6fujsEjpdsCzLUId2ttq2QXn/dO7M43NgNevUfZUyd2E1qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlOUo5pv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlOUo5pv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so11531305e9.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355359; x=1788960159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkZh/ve/cgf20umwfOvUdi7ulchyjCFeGzRhN//m5sY=;
        b=XlOUo5pvEgZRxWjg6eGKlL38RroPslxpcansirBoJgD5zDrWh28Onyo2SA+ybYyGRY
         rcUloOqEQRUW8gXlHojcR2Rq4pSRNyQFUZsKun0H16HkZOR6oJkVsX+b3XVhSi9yMDBP
         J88NMP3DgGRjD3yTho6mBlQXpAKp8KC3QJR+4oirvKbpe+C9icsTE39N26YdR68E/vYJ
         cCXps2+y2lyYPditnT8x7tZ7XYxkz+7W+VwFisy5kuAA0P6iN6w/P6uwz4mtoNvDsfhA
         2DbPuQX/Y0Ls9fyQfccAIIyd166/Rj5f4jqFyHwblO7MyMZxAkPa9pxRIZ17eTrZm3S4
         07vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355359; x=1788960159;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkZh/ve/cgf20umwfOvUdi7ulchyjCFeGzRhN//m5sY=;
        b=IJbs4Nyy5U7JYYsISWRmxDAoS5Yr+5aapI1osebGgtS9SsS4HMSh3C2rA3go6DMaZa
         itxl72ctI7s4i4kAluEtle4UrEyzhqL66sAWr70cUiSBO5jRFRDshWfpEczgo0E5Eeok
         LUmgAjcZ0iPgS2J27mytJu9hF8t57k/PjosHbrQaER5+RhrzQfLaPAlNgfy2F+g8dMq0
         /Sjs3pJBa+L+uvWx6bwGW0XRJlNO89IrjMSv4MqD94zZF5NMheVj9NagRvPb9HUfj270
         nhYJ9Y20T2wsO8n5t1I+wXjhcr7cV4QL2fKBiO6xrX4hWHPQqwPUxbtciR9RWJjekuzb
         CvcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLWSNsPIYTKLn5fcOZKEotRCBZ00z4caLgPnmJ8KJzYwoo3tcRAIExoDx9cFgmYXwA3wAAzQ0o00qn@vger.kernel.org
X-Gm-Message-State: AFuF++kreV6vgro27VXyjmvmlErKessKDwdYRnmcp0/vXMKaGLuZHws1
	3it8V2xFsyMwwt5UiM1BUSuZllSe0x3a+e2bUjVycAf40gInClB4VGXfJhG4KZHT
X-Gm-Gg: AR+sD11zRCFeUVSaUMDBFATmfbE3Jga71w9FWWzlLVJvjl3BKDJovkIOESuQjI076kZ
	dFCZBgYT/eSVgBnBUEaw7mSnDXp5pG5UmqayD2C424VopF9aOt2YfRTjH+kmDOvnIAZe/8joA7z
	p+rjd0vScq1aHupZSJJULdp0CEQj/C0D0K2KePWgMBg9lAfwP9M1wVrfYZ9GeFCzoueNN8x7jbQ
	NPKGpZtHxW5BbJovjSms6VQW7GYqPc7ova4DkazPfBc4h3KZMOOBHCQONSt6qMP7pPTedXEAwEy
	dJ1oiGqrQ13lmV8JQxgXUV19Uwd0sg5Tkdmsa1urbdZ5TFe8zBAKLbqucVrEqk3Dew9+2zvlqN6
	NJS8ZN6Vq/zXexlxoQHaJrWkvA0ZAWUx57wcelIpBn3MbRsCoqXPkooVxlkCr/cw+EFsWAt0DrA
	vvzWhy71iu0rOXs1I2nf4UODrk1XBBjNqTxnOWMX8dSNDtxY9M0AugRh12PAd9MxtvIDgANSQK0
	IrRlY4cft0RUMJI9ZfrKKtbIPRkxxfQ064E1fcRsH3U4BqG0ybSOxwPS5Z2VX89
X-Received: by 2002:a05:600c:1395:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49ce5812c52mr74768615e9.10.1788355358736;
        Wed, 02 Sep 2026 06:22:38 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm149528255e9.5.2026.09.02.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:22:37 -0700 (PDT)
Date: Wed, 2 Sep 2026 15:22:36 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Linus Walleij <linusw@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Leonardo Costa <leonardo.costa@toradex.com>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] of: property: fw_devlink: Follow GPIO nexus maps
Message-ID: <qg2nemg4mlxpancg7az2vsnjkfc4anxkieozoxh3mj3zgkyifd@b5b6yiz4uew3>
References: <20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com>
 <20260902-fw-devlink-nexus-ready-v1-1-68fe1996e78a@toradex.com>
 <CAMRc=MfN73=K1nZrqUbhrMSijjpzhF_z_U9JU4_H163W0vRpqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfN73=K1nZrqUbhrMSijjpzhF_z_U9JU4_H163W0vRpqA@mail.gmail.com>

On Wed, Sep 02, 2026 at 05:30:19AM -0700, Bartosz Golaszewski wrote:
> On Wed, 2 Sep 2026 13:41:39 +0200, Ernest Van Hoecke
> <ernestvanhoecke@gmail.com> said:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > GPIO consumers use of_parse_phandle_with_args_map() to resolve specifiers
> > through gpio-map properties. fw_devlink instead parses GPIO properties as
> 
> Unlike PWM, there's no such thing as "gpio-map" properties.
> 
Hi Bartosz,

bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a
nexus node") added support for nexus nodes, and then c11e6f0f04db ("gpio:
Support gpio nexus dt bindings") added support for "gpio-map".

Herve later added support for pwm nexus dt bindings modeled on the GPIO
support in e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings").

Please let me know if I misunderstood something.

> > direct phandle references, so it records the nexus node as the supplier
> > rather than the mapped GPIO provider.
> >
> 
> Can you point me to an example? I'm not sure what a nexus node is in the
> context of GPIO.

Stephen gave an example usage in his commit message implementing
of_parse_phandle_with_args_map():
	soc {
	        soc_gpio1: gpio-controller1 {
	                #gpio-cells = <2>;
	        };
	
	        soc_gpio2: gpio-controller2 {
	                #gpio-cells = <2>;
	        };
	};

	connector: connector {
	        #gpio-cells = <2>;
	        gpio-map = <0 0 &soc_gpio1 1 0>,
	                   <1 0 &soc_gpio2 4 0>,
	                   <2 0 &soc_gpio1 3 0>,
	                   <3 0 &soc_gpio2 2 0>;
	        gpio-map-mask = <0xf 0x0>;
        	gpio-map-pass-thru = <0x0 0x1>
	};

	expansion_device {
        	reset-gpios = <&connector 2 GPIO_ACTIVE_LOW>;
	};

Admittedly, this hasn't seen much (any?) actual use in the device trees
yet.

We (Toradex) would like to use it to specify a LVDS connector on our
boards. This connector appears on different carrier boards that all mate
with the same display and have the same pinout. The only potential
difference is which PWMs and GPIOs are connected to the connector.

There, specifying the LVDS connector as a nexus node on the relevant
carrier board DTS/DTSI would allow us to reuse the same display overlay.
That example usage is given by Leonardo Costa here:
https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/
Note how we have the connector on imx8mp-verdin-dev.dtsi but could also
add it to other boards, i.e: imx8mp-verdin-mallow.dtsi

Note that in that example we used the "tdx,verdin-lvds-connector"
compatible for the connector. Since this is a nexus node and just a
dumb connector without driver, not having a compatible would make sense.
In a final implementation we could specify a compatible + binding if
that specifies the ABI better. It is not entirely clear to me what is
preferred at the moment, but that is disconnected from this patch
series.

> 
> > A nexus is a translation node, not the GPIO provider, and need not be
> > populated as a device. The resulting fwnode link can therefore remain
> > unresolved and indefinitely defer the consumer while
> > device_links_check_suppliers() waits for the nexus.
> >
> > Use the map-aware parser for all supported GPIO property spellings. This
> > makes fw_devlink resolve the same provider as the GPIO consumer API. Direct
> > GPIO references continue to work because the map-aware parser returns the
> > original provider when no gpio-map property is present.
> >
> > Add OF unittest coverage for mapped and direct GPIO suppliers, including
> > the deprecated singular and unprefixed property spellings.
> >
> 
> Since this is a fix that we may want to backport, the unit tests should go in
> a separate, follow-up commit.
> 
> Bart

Thanks for the feedback, if we want to go with the direction proposed
here I'll make sure to split it off in future series, I was unsure about
that.

Since usage of this nexus system seems limited, I'm also not sure if we
need to backport but it technically is a fix.

Kind regards,
Ernest
