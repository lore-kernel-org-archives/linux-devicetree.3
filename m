Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794156432;
	b=0GzxtHFaiQxYNqnFjMftzjkIJ2IL/H0w2SrvVXLDspMQMZIFfnaprXKe1A3zGvFxvJVq
	 Q1kWTXVxqHvXP74xoS8CRJWcWg5Gn4JRVF21HY7U/ZIhY5rAr7twZIxIg0G2IRQOoCMWk
	 5BAPMxAjIBTfGVH/XJ1ZxiJzRItdAzEFLaQLcqCaAbAIav0zkCcF0ngJRViUMItnRXN9Y
	 PuCCq6SNbIrVEtNRco8xYBt7juOszRYdMGmkNTxs3lVI06MwEXheUsvuyzd/RL7WAOFB0
	 GA0dhzfQ+TsAZzROd2mAFLr1JM2U077VNuBFhWZ+tR3yyZVnGveMfe4mKs/VbyrNQGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
	b=SZnLFGbjnJGIRLJgLhiXbkreCg6AHwf5Yfky7x2jyrYwlVbZOxKTE+BGDxaS+rA1e6gD
	 OjMQQPXJK01VmJAgCVVg+jalYQMeeDN3d0PZljYtc6vi9/M0zb64TLqv/kWAOTUBUqu7h
	 P8gZTH+EjnjFREmQcBDRPtuwS6mn8SEqaDcrzhkRFWwwz4zGTD7B618inBvXF8SfNOHYy
	 gcdxdEtahQRPElh/tQH/kefC6+umdIgxRLUZJ+eKFfiWs3HStj48dYVDWwYN5nPbG1c0t
	 GppCwmT39sU23I/mAhaFJjzFX2xQBY3FKtjzz1T8MXp4e2NE+JIUx5NpOV0OlDymZcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VslSLkPt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980AF606A322
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 16:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 980AF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VslSLkPt
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06c60065fso50118b3a.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 08:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794156431; cv=none;
        d=google.com; s=arc-20260327;
        b=NAqFrgwBM8kz3atxkJy5sssLmPFR9vCLghi9bOuFJ/2GUek6q/QtAGUb2SOyuzqcsS
         tlPEV0fIPcJ1eZR6gCViKTKBrZYze2kzn9OiEslZpxLpWluGjB0QEsdfjcKSKhxLTv25
         0A0v5Y0MCAV5mmQdc3XlUjX5t9EYjVkx0FAJ5ReIN7YMQ/+MfYTZeRaL8eVbRSPsMyoQ
         W6za/jEhBNcTn3rq4ZPeVdbkgz2vG9to0rsIdQhVw9S1hTNoNAvYsZtmUdgRCyn2h6j0
         yIfoDn3oBJlAOYYeUO1b0+DRj6PZGIxwrAEA7C4D1z/VKv+mGhSj0KjFQiSg2h29Ah0V
         HytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        fh=uy6xYNC6GDlw5796+26mQ8HGbRrmXzFKeYx3hewT3FM=;
        b=TJqlZttdJZF5ENl+FHwEnvqBzNW+lem0SxzsNj8i4u0PBg0AGEXmxi2KnK9yHUf9CD
         Po5+vwnvdBFrx45T5KqsJXCz88nEXIHy1m/V+mF/bakfZcN53CcEIQ5oW4evVUryMq0q
         5ciBQEtdC7CP7g0AXtk3a90WBOMXv/QGRxFQKUdyypqb9ZLJYzwTNvyIOKJRJkkgXNhb
         1gsgQDCnDbn9RnwVPHGWb9y+H/xDcqz0m9/tCza9jgQQLHAhnHfY1hZm3UybNbz14KIW
         SaWsOccSWWfcSfRFQqSZelgIaJV9S8N2noIRj3BAHN5qa58UiNc8lEmRYm4lmFXU65Gi
         ituw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794156431; x=1794761231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        b=VslSLkPt41g9hvB0sJB8LEaUD7FB2blU4ynOh4sgrwEMc/XfwMRdj+lcEBf+F3jAHD
         ef714OwL94V0cAlf0nY9MZTVAmaFN62NHFOC6YotOo0OR65idRY8SwGIFNjUlccMdBR/
         tssTM9SKa6Nt86FneUnN0RWQuTYrlC1iB3QoEsApkB6g3vJTETsb8uFIPjaDtcGRIGlD
         IxJdShtFrash7+wfHb4rgLKezkDkIrmqvxMRMG+AFOVmcvp0RWocsc0syXO1+sJ+nE79
         elwWb+u15oQpBooKO+bJe3rrrjNB5Z3HkNlXVPWhAH+IRgMBWGrufxRmxGBkfVGRF/Xg
         UGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156431; x=1794761231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        b=05jdKLKrN+i/fFRilQ6Anp03XOSrgwmPJrzLRXJykcOpgHyRK7m8rGNKhi3LmvmlEI
         SQvjjuKy8NtjLa+bm5tKNdBzVJRb49rv1JnVto5ivKPFVVA2OobCV4FytBb/J2gkhqTE
         aeS2mD/nuVT9VaxS2xAQQEQZ4dpOa8dj40JE1GLQnyHx/Hr5Nru3X0XbZdSRFbQfmjWR
         f5vCL7KEyf+4BpHQ7aQeFdCG/AoL94gw6PEYfB0OcH7/0+tmUAL6eKPrXJ/hasr/Mp/o
         JRn4KIZ2/3Aj6jLrFQufESvZDktwBt8ftOx6IrOQOu43TX+bDGYHGdGqfZiGCdCRaiof
         fOkQ==
X-Gm-Message-State: APuU4Z/rz6fXQ6t9wId0eTd/Jcf9Wmcd5+c4OcHbAjYzdJVRul6BkC53
	JapMfAFXPTmwReHnh8CwCmSSozW7so7EBlzdrnqAAxH95xqJRq2YjRvovqMspHhpIzvPnUdaZcw
	/Cgy2jEjXw6wD01MDEejOxgr8+f41ylE=
X-Gm-Gg: AYBFou3QlEvwrCTAVGezHJoBy4L3wnnz+zMYCP03C0ws7+dZiowMNm4UuCA8v1Av7y0
	6sm4dmKJSjHwnwfgjZAPvTtA8FRjaFuN0XV6dmp2P2FIW6Tr0LVAbWO00i5XVvdEqkeujWGhkuv
	zSlGFM41DTA9KeGsut1X0rclvQ56/8bZoOiYV0ZbUGB+mMl98UvUeW0SCmMF8Do42b63KInvNpc
	I6XUbDujW5hSGaQ0oznxfClmhGcrL0wKrF8NhApDJ/nSO5jp4irZqwKlnO17ZNPDrRJdfiZgcia
	bUNiQ0vMyGfKw15+vQQY4T7hjugYzpM1R4/Vu6tOOKeuuvUQfwzNDKFtMkLeGKb2vIwVUSPLRFm
	bIc+vgLKMLzmGpvOuy8NF2wkLtn0SJKffvfq1A68QeGkJZNuQrELZ
X-Received: by 2002:a05:6a21:7907:b0:3e1:29b:bb35 with SMTP id
 adf61e73a8af0-3eed59db277mr1575456637.88.1794156430631; Sun, 08 Nov 2026
 08:47:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108155702.361022-1-pmazzini@gmail.com> <20261108155702.361022-2-pmazzini@gmail.com>
 <sashiko-outbox-203873@kernel.org>
In-Reply-To: <sashiko-outbox-203873@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 8 Nov 2026 16:46:46 +0000
X-Gm-Features: AclHuK8Aes8U3tn1e6jW8hKMbpOMmvpbiNePg-NqNlB0EoDX7OzrjxLvUYhO9U4
Message-ID: <CAAxh=jt9_hsJkEuaWsdAcLMS6mSS0O7PYQj_p6-oWOsQ5B9Shg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:11 PM <sashiko-bot@kernel.org> wrote:
> Could these macro names be aligned between the clock and reset headers an=
d
> with existing sunxi-ng CCU bindings before they become ABI?

Yes, I'll use the names the other sunxi-ng bindings use in v2.

On Sun, Nov 8, 2026 at 4:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: clock: sun8i-b288-ccu: inconsistent clock and reset
>   macro names
> --
>
> commit fb1a7b2f6dc03665d0714b13f4a0587e1bb34467
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
>
> This commit adds the Allwinner B288 CCU compatible string to the
> sun4i-a10-ccu binding schema and introduces the clock and reset DT bindin=
g
> headers for the SoC.
>
> > diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bi=
ndings/clock/sun8i-b288-ccu.h
> > new file mode 100644
> > index 0000000000000..c9b9eaf979ad0
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
> > @@ -0,0 +1,82 @@
>
> [ ... ]
>
> > +#define CLK_NAND     18
> > +#define CLK_MMC0     19
> > +#define CLK_MMC1     20
> > +#define CLK_MMC2     21
> > +#define CLK_MMC3     22
> > +#define CLK_SPI0     23
> > +#define CLK_SPI1     24
> > +#define CLK_SPI2     25
> > +#define CLK_DRAM     26
>
> [ ... ]
>
> > +#define CLK_BUS_THS  32
> > +#define CLK_BUS_NAND 33
> > +#define CLK_BUS_SDMMC0_BUS   34
> > +#define CLK_BUS_SDMMC1_BUS   35
> > +#define CLK_BUS_SDMMC2_BUS   36
> > +#define CLK_BUS_SDMMC3_BUS   37
>
> [ ... ]
>
> > +#define CLK_BUS_USBOHCI0     46
> > +#define CLK_BUS_USBEHCI0     47
> > +#define CLK_BUS_USBOTG       48
> > +#define CLK_BUS_DE   49
> > +#define CLK_BUS_EE   50
> > +#define CLK_BUS_TCON0        51
> > +#define CLK_BUS_CSI  52
> > +#define CLK_BUS_ADDA 53
> > +#define CLK_BUS_SDRAM        54
>
> [ ... ]
>
> > +#define CLK_BUS_TWI0 63
> > +#define CLK_BUS_TWI1 64
> > +#define CLK_BUS_TWI2 65
>
> [ ... ]
>
> > diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bi=
ndings/reset/sun8i-b288-ccu.h
> > new file mode 100644
> > index 0000000000000..6751456545487
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
> > @@ -0,0 +1,45 @@
>
> [ ... ]
>
> > +#define RST_BUS_MMC0 2
> > +#define RST_BUS_MMC1 3
> > +#define RST_BUS_MMC2 4
> > +#define RST_BUS_MMC3 5
>
> [ ... ]
>
> > +#define RST_USBPHY0  14
> > +#define RST_BUS_OHCI0        15
> > +#define RST_BUS_EHCI0        16
> > +#define RST_BUS_OTG  17
>
> [ ... ]
>
> > +#define RST_BUS_DRAM 25
>
> [ ... ]
>
> > +#define RST_BUS_I2C0 34
> > +#define RST_BUS_I2C1 35
> > +#define RST_BUS_I2C2 36
>
> [Severity: Low]
> Could these macro names be aligned between the clock and reset headers an=
d
> with existing sunxi-ng CCU bindings before they become ABI?
>
> Specifically:
> - CLK_BUS_SDMMC0_BUS..CLK_BUS_SDMMC3_BUS vs. CLK_BUS_MMC0..CLK_BUS_MMC3
>   (matching CLK_MMC0..3 and RST_BUS_MMC0..3, without the redundant _BUS
>   suffix)
> - CLK_BUS_USBOHCI0, CLK_BUS_USBEHCI0, and CLK_BUS_USBOTG vs.
>   CLK_BUS_OHCI0, CLK_BUS_EHCI0, and CLK_BUS_OTG (matching RST_BUS_OHCI0,
>   RST_BUS_EHCI0, and RST_BUS_OTG)
> - CLK_BUS_SDRAM vs. CLK_BUS_DRAM (matching CLK_DRAM and RST_BUS_DRAM)
> - CLK_BUS_TWI0..CLK_BUS_TWI2 vs. CLK_BUS_I2C0..CLK_BUS_I2C2 (matching
>   RST_BUS_I2C0..2)
> - RST_USBPHY0 vs. RST_USB_PHY0 (matching other Allwinner CCU reset header=
s)
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108155702.36=
1022-1-pmazzini@gmail.com?part=3D1
