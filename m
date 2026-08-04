Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6104446FD
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840026; cv=none; b=dLz+N84Xv7VIWz2k8IIhyZhCjCTvC3qCHbsA9ickXEQNU4QrEGZA+HS43F8iguo4fwu7JjOF0ImIVMU3ZxyDPggX0HbeDjvSPntYdIcNcqueg/zHH0tHliEtt4W4IF0PypBr99LhlMpEUyYEQ3nyfbMGqhoCnjwofCol3vE3W18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840026; c=relaxed/simple;
	bh=XjqEhMzVyJidAYNTgfZuzibV+vw4kgTP4iUjr/Y8zwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BH9Dh8Z8MqoqPF9511V7KeDGNuLxiI5lYkGzzeWZ6imi7KgcLHD4NNy4bH5IqaQB707FZ4NOXrR1CeOrBNoPhxSe+eBmoVcJelhoymPSq819rg9DcTKsW+hzvvBfmHPk6lnNsUEO3ULzyXnMsiCVUu3SeMuniA1rduEunhcdY48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0+z8yth; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0+z8yth"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caed617615so60329255ad.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785840024; x=1786444824; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezaCKY+/GsZkbyZqG8Ty7NTbyuHDDYUEigB5GN8nxr4=;
        b=S0+z8ythkAsmZhiqnI6RBEugt9JZ8TpO2f0cqRjmimIwpJER2v4ntX+I5zXarp3sV3
         pfjzQg/uabrlb/ZZyRR9FaYmjxFo7cyvUFI++Z0iQVLIY7tgMhfdzU1Fjv7c3EpCIXp1
         72hz+iugC2vHWs7pjSJhRXKiD/BA3y0K81x//7QfZeaT5xkLm8kPh7pxF4lWvG5XDpwj
         PJRzn9ewafTab5glON0W8dlQFNR/YnKyfCI0+o4UMrfSMi/7S2ygRpFyiGmzb/EtoDN9
         wNpZPt40pPTKqyddge3NUxJYEtnDJm1ToJuQqUaHYm8lkVfzd9fL3f4qZlciuBAboGdP
         xdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785840024; x=1786444824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ezaCKY+/GsZkbyZqG8Ty7NTbyuHDDYUEigB5GN8nxr4=;
        b=lZj3BSAsSjqmt57OGVaq2DIb3pyHOeF25VFnpN++rD36nbvZT/k/oph2Y0yob8rf8o
         D9SbLmXD43Z7OIA2Et1/BXywcehoqaFbCd+YH4iEkD+1xPkcxONwn2GjDJv2bcdjBTpu
         s47GMwHJNlQuxfKpgq4q5sw3wJ45gwWymamJd4JKtUtoXQAuQbrwYrMRfbx2tHUJPNlS
         irhidCzL+WRv70SZAtgMQgEjjFSayK4CTM61nbdnS42NjMsdk9pf8ujz4UZ22iE/5+P/
         WKOcKUpWgfDf/7Elb+mUzEu7BUSlNNfyvjMd1F3RX7wPBDDciVIdFQD6glhX1nOfrD0B
         4e7A==
X-Gm-Message-State: AOJu0YyCFvvDIlyNy1Y63ZuVkrJgykzsOIcwzlfVn89VhcuwGaE55ib6
	reL1Vw+nPTX7zB3Vd0po6+fO6lLTD6uJ7BOqgLahGLHSpI5xla0oJt9LSCgo4BP1
X-Gm-Gg: AR+sD11GzeyCxggqZhym4kKIKYo8gFKGcVP7jca7uGCBTJ52vgK1LTF5QWpNiNi/Api
	rWiV2AdbWGABZpt4KlxGXl7oIH3CuqlAMbx9A6pVAr/6AfLjjpIX9PQlfnt+7oMUk+lrwaxyq8p
	q/4zQOdf5HeVvBCs+j83Ko6blUO9eTrgLAW2mDRMGZhzfwVo78m3xIq4e73lY60xU0bWE2YuXdL
	4tP+lmUmIkloyPIQOvr1NnOm+zMef7acyY18T09KTpS5eTn8+pwX6EAKOV4tY8vdwDSgMj6sJfu
	XVNU9PtKHDcIK86UM5/qhTTcdRPHUTq8JYUgpPJ26brM4u1NI0b0eqxKNmiOcTD7LqFx1Dcv1Gm
	qaA2qgl/z9cki8WaFl2e5TXfpFV6Z4G0zraDVQvoah0MOPCD7g+IU3aIXVF+t2SLZR1h0pYwjd/
	Rdu3w6j/u2oenZQDVQezicIXSD/RrymUdtrsuMVdcJmNeAwVIfTpxVSAEl5xTDGK4W/xw=
X-Received: by 2002:a17:903:37c8:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2d0521ed7afmr130801125ad.12.1785840024104;
        Tue, 04 Aug 2026 03:40:24 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f9371asm4888905ad.13.2026.08.04.03.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 03:40:23 -0700 (PDT)
Date: Tue, 4 Aug 2026 07:40:19 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
Message-ID: <ho2mdxntgkxp6uwdosqkazgcl7t524bwrz3vr5vprhbh35xemh@zsfccaotx4q5>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
 <20260803173705.2268792-2-leoreis.costa@gmail.com>
 <20260803175122.2C37F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803175122.2C37F1F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 05:51:21PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The compatible string 'ilitek,ili251x' is not documented in any device tree binding schema.
> --
> 
> --- Patch [1]: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10.1" V2 display ---
> commit 73e2dedf7bdfd04739a496a9f0ff1282f074c0ec
> Author: Leonardo Costa <leonardo.costa@toradex.com>
> 
> arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
> 
> Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 panel with an
> ILITEK ILI251x capacitive touch controller.
> 
> Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> 
> [ ... ]
> 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
> > new file mode 100644
> > index 0000000000000..834f23e75cbc3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
> 
> [ ... ]
> 
> > +&i2c_dsi_0 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> 
> [ ... ]
> 
> > +	touchscreen@41 {
> > +		compatible = "ilitek,ili251x";
> 
> [Severity: Low]
> Is this compatible string documented in a device tree binding schema? 
> 
> It appears that "ilitek,ili251x" is missing from the binding documentation,
> which causes dtbs_check warnings during the build.
> 
> > +		reg = <0x41>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_gpio_17_dsi_1>, <&pinctrl_gpio_18_dsi_1>;
> > +		/* Aquila GPIO_17_DSI_1 (AQUILA B42) */
> > +		interrupt-parent = <&main_gpio0>;
> > +		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
> > +		/* Aquila GPIO_18_DSI_1 (AQUILA B43) */
> > +		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
> > +	};
> > +};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260803173705.2268792-2-leoreis.costa@gmail.com?part=1

Hello,

To me this seems like a false negative. The binding is present at
Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml:

    properties:
      compatible:
        enum:
          - ilitek,ili210x
          - ilitek,ili2117
          - ilitek,ili2120
          - ilitek,ili251x <--------

Running 'make dtbs_check' also gave me no warnings for this overlay.
