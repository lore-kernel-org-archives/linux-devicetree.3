Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839185;
	b=x+ZnVZMHOnOqJtGoKUTtwQQ5TLk78Njkp6EXIQ7yi65ecuC8dfIBls4CrW+VYBkDxTcp
	 umZKtjKx+gJZk2IqelHa5MEXHh4H5DIECUc6hGkybV23uPpH6f6KWpE6Yeu9aINIQuqot
	 12OqDuv5+kRgpgBMYLXvBC/R0k02qLbGPYDI3WaY3EjDQ8V3oCHU2/9toUgcQs1bz+XLD
	 YRYFYtNNRP9H8ysGPi95NSX3bjsbioPR2zZ4mTbDG0Suk2SK8mDe49Efffl5PxQU4Qaz0
	 ZaaciyGtU22Gek6v2rXSykGzbNFoezYuV0MA6swkUlsyxdGJPEs7I7xcKgne9F3HMaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839185;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=GxOPm+285zQy6VsOAo+zo6AXQiUSUYodxFXi8M2wfms=;
	b=oue8oE/l7QrmiP2U2MhDzMCTqVwVTGpX1aePN7z150QZY+8P5ebLZsea/95ISpclaegp
	 +mewVCVkbwBLUKLRQpN9XBNdbtVVYjZvXRVVNg6IDk7DJna+xngaHfwaE3udbC/EilhOu
	 HM9HFiNEahxOc3EYMuGFyi7970+rYyGxW5x0Qa+DZDN5ZPiMTWoygMHWsUVAvUA9RCNln
	 BQ6PvrJbVtgx4PiRuWC6W03e0KY2QRRw9t5tARPATsU0ugBzW22huEzE4n/dIEyKTZRJS
	 LjH7nOVRYX+wHQJTasD0ewEXezr6K96djjh3lqUjOcdH/TqFDZesu7VKmaBpPcCflNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B866606A336
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 00:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B866606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9995ce866so10382665ad.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839185; x=1794443985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GxOPm+285zQy6VsOAo+zo6AXQiUSUYodxFXi8M2wfms=;
        b=dU47sve6wFbqYRffCSL8xOPCpIk6wfuOqqdu4YcfWvn34sk4YaRrYYv3XfpTibF4jV
         TlsY+YHbA+ul7kQ28TOxOnBiXEviuy5DbnW0OHo5FSmJTT0WzQBe73Tc8PnaGIRM/9sb
         LNNIawSWH/aXO2MYGGUfCmxqt1P3Z5NnZrX5dyFQsKrk5SWE32f2y9oEdzReh/qt1+72
         zXGwJFSE50Zhh0WWbZiENmGfHbu9MlOsHacdgTuYLnsfH0Pgv0OE+W1+r5J+rDkYK1+T
         QjlroMiMPOwSiC9MXWOa8UmAHt34u2/pCqfPVuPzY/F21QkL7D2WC7vGRLTuuUeKxwAU
         f8+A==
X-Forwarded-Encrypted: i=1; AKwUvBzbLLNpVQ4GceIeqFzxguaXrMReG+PmJjaJNK2rmL+76dbKrE30/RbYMtL37ye7ECnVBCRoXslILYdj@vger.kernel.org
X-Gm-Message-State: APuU4Z+jEmMNOIR/IarnS97PWSAMCACZajUZUeT796VaGxCMQy/yC7dY
	ZBKkuKgLga+NYctKYyw7iH6vr+AjFsrFXG8dorwLhFoFf1BEe1I40RZpwjKqhDvq
X-Gm-Gg: AYBFou2/6lbPTFlknsQ8PWAnAF/aBXIhGDuJduXtv7ltDrqVQCNgpHS9SpS0qD23Idz
	eqd6h9EslMRoq8nOvD5mvGerWXsUsTrqyss8I1wF+ySPEJZ5fe6JZ5tvi9GrRF9305MK8MZdW4J
	gBYAjPSU+zGn93wsS8NQvRnNEXznq3ChOVj7D9j2FQBTngYXQAq6LqFrgxzdeWF1hMwGgZXARBO
	HEkDjuoR53mdhKeDKE5n8+Y2VTkQ0ZOm4fAwCH2f30aIzBtiJpUoNzfA/C6Mjpktyn6eOLW+Nz2
	mfWqxFAk8twTVJk35S7R8wGQDrLxiFFd+tzyQKGaU/7bnL0QzGWlaPTj9QrXO0RgirB8Kv6nJRd
	UWZuafU5/4Mz6kKB2Cek3ufq+mN73uHGt27TP/0ronbGg6B/+rQtPG4bL6z2xD9S+WH79xKa2/a
	n0wb166l75io1YeBquO8xzzU5QoN5pa/qeRQEUmumbXG/ZnwfZJkLwNC2qctxpelo7pkOPcVIFg
	c4PxTdRWPjT41lMpxl37qsAPvMFg0MsvKLjZmV2HhyzWjzWGNmX9oSsvZyK5xrSMMuhvvuuhC9/
	NijXoEfSq20x9NX4ChtyvkzM28PtkQXVrooDlW1UYu8SFbjKNrBUDw1eP+79O5lxO1lIRz16a85
	gegpRX8QyO3gsMgaHPaGJ4hx9nAv6FMLIQMs0AIi8lrvUZXP5BsLmx1REW507u0mt
X-Received: by 2002:a17:903:2ecc:b0:2e9:8505:5471 with SMTP id d9443c01a7336-2eb36405027mr174311215ad.7.1793839184893;
        Wed, 04 Nov 2026 16:39:44 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091f3473sm11962585ad.70.2026.11.04.16.39.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:39:44 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso1735942eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByJof+RkZlcTQ3HlbP37D5okXdPYCf7mZfJpMdNOGJuHTfOhQymV6L1qxTbegbZ152HZXVUQwNnZw8i@vger.kernel.org
X-Received: by 2002:a05:7300:7f95:b0:35d:eafd:5737 with SMTP id
 5a478bee46e88-36a423bec77mr38131346eec.22.1793839183442; Wed, 04 Nov 2026
 16:39:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
 <20261104-sf19a2890-usb-phy-v1-1-db0cad937614@telaak.dev> <20261104-unscented-armory-4dc756ab95cb@spud>
In-Reply-To: <20261104-unscented-armory-4dc756ab95cb@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:39:32 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5g+e4iu8p5s+Vf7XmEjB9cYX9xYyzHd0Fz8GEbmFm4hw@mail.gmail.com>
X-Gm-Features: AclHuK9Sx3shGebCfLzax5r8eL6ok4wMG4whrKpB9TRpvY4T3TEbHPr-vy2WL-g
Message-ID: <CAPY4CJ5g+e4iu8p5s+Vf7XmEjB9cYX9xYyzHd0Fz8GEbmFm4hw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Siflower SF19A2890 USB 2.0 PHY
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +        reg = <0x19e0c040 0x60>;
>
> That's a weird offset and size.
> What lies in the regions around this device?

It sits in the 1 KiB from 0x19e0c000 up to the next block at
0x19e0c400. At 0x0, 0x4 and 0xc are the reset, clock gate and bus output
enable registers of the USB clock and reset manager, which the clk
series describes as siflower,sf19a2890-usb-crm; 0x8 holds a value I
have no documentation for. The OpenWrt port gives the PHY 0x40-0x9f,
and its driver only uses 0x44, the PHY's sleep control. Read from
U-Boot, registers between 0x40 and 0x8f hold non-zero values I have no
documentation for either, and the rest reads as 0. The GMAC's
configuration registers sit the same way, at 0x40 past its clock and
reset manager at 0x19e04400.

If you'd prefer one node for the whole region, providing the clocks,
resets and the PHY, I'll restructure it that way for v2.
