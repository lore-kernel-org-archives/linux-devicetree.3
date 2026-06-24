Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C9361667
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 20:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782331250; cv=none; b=YcHcrClr2wS98DGszACi4ZHF+JsL23tXWjEWtUi44h/qZA7+BbrqaoKYe0mLkqNAOu6Vv7DGUDmWYAWGBj+V4V+U/LaNK9wn+oCtSuBDyR6ypWpMjsqiJhmRm+JO2i9ee9tgRBGJ0eZxXPPq7JuV4GVIbJAldMN5nrFNDMdPUPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782331250; c=relaxed/simple;
	bh=FWDkFxX3VbBclJHn0qziHUPLz4S00abKehaSLai0TFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RDyHULJ2ixEB6RitzUzvgPDSAOsqcTHY63EtyhgAhFgYKoJ3vwT8WQk6Xg6nYbraa+/tx1XDy1RaGgZlBvmysPUzkAj0DQjsCoOdUk1aRDhOMRD0UjDr5mh7o80JNIrv1VHUO5DJAyt8qIkJm5MYOhAEv7yEIG0Ixy02is0y2L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U97RBkx+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U97RBkx+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4626fdc829aso1177009f8f.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782331244; x=1782936044; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ou7sRiViO9r41tx6wwdMLvYt+1RgLBADg7cisaocX2c=;
        b=U97RBkx+tpuF8lLRW/oDBTM/uJs4kw/3Oa/+lEmLbwcgGQiTl7E5lkMCMxM2eSDF5I
         eFPe7R7tUUxjQFYs/AsibGahH3uTH064SYe8BbUu+mdKql5S4MT2xw8HwrX2HDcbLujh
         JL8sXaw1VD8UJsFbvb+UVb/aocPabD3uWBzph6QWdAtFee4FcgzJ+W099MzlKkT2bAfC
         91GgxXaOhorv4HZdRYi+FlGjDUWuEaWLhjJ4qQd+oO/Gwa1t6/pgiqng9JyAp/lssgz4
         Ed9ri2r/LrQCfT7JsoYwtkXeAOP5W//Z57qv1WhKPnhwGwsorfda8SNESHPT7ciceE+R
         AVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782331244; x=1782936044;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ou7sRiViO9r41tx6wwdMLvYt+1RgLBADg7cisaocX2c=;
        b=MxRU7bt6TSXcrdFV4b/ersaPcrBtSK3Ii89Bx9RZop+23AZxys+uQ0cZhsS0D7I1aJ
         IHBGCIYKiUCHDXdxxmoPeZ9ahkjGA96O+Go9cwOw2LSlK4ao2/OX3leizuni3rXjcGAl
         mOMtlpmzBoB9TwmcUruKcns4BjRY+zVXRDXfSE++ch3cQ3ZClev8SFU4OQ6tJksGvN15
         ih/1Lk+E53txOWx78xFvZTpc3gkNwtFL5aQLfxomAi+e3j27vW0H3YAai7qoTkdv2a2j
         dq15AnruJCVe9CqJPQ0FALrcMx9WZI1O7BGyZcNBp8T33MyXf8+REztRYxd30gDMvqe1
         POKA==
X-Forwarded-Encrypted: i=1; AFNElJ+Tj2gK5yhCuDYb/kSFmXodbYPWUkMVlBpuoKsd/JMb7ZrdK0QIuWUH9uQIGUqLCYh5NV8UMEfhSm1f@vger.kernel.org
X-Gm-Message-State: AOJu0YwXe9OF5P3W+vWdluv5x4BDZmQSEJ+mBsNSptUBJ8PM4rmQCAY/
	8W8ngm3GKR/5p/dwxTVMD8m8vszlq9Ujg5lVs0gp3W9GK0XHrW5dJikQ
X-Gm-Gg: AfdE7cmhyQ/1bX1X5QGeu06nxBtGXXdiOL2O4NCPDilexXNX9cRgGX2lIJ+0XAaARCa
	noZEQ1kv6TGzIwTnfK6Ybsjp1WXOaiL5G1WHmWjoz/8AL2mv1pLHqHNds6svz/9BTFhmkbZ2wJF
	+FDtyw0mMSXfo7MfAjWmUgEdzWdzOstkuyLfxV9zsk16aDTSVI5VnnlUj2ldXodDyIw3lRAqA1c
	e2LkZ8raTO/OR7UYAIf7NXPfnHj2s0p+QxvDn4e1YSeZFQVBgE1W8EwqYzzturiwCq6ssmVXtYu
	FHyVNV5Mm5Pxri7Qp5GODENJ1vB8J1k6TamKT7hr53KFFAW0yd+a6NzWyzVKJXWfaA8v3JhRyR6
	u7gvwcsydvimbHm1PXK5+S6Ib2FLhbjM5N9dVa2Gi957JtHAXrWK5/oVQzTHCzTj91FIBF0Dp0g
	6hon2iOf/yYjGjmPS0c1FSk1Xc2g==
X-Received: by 2002:a05:600c:528b:b0:492:58d6:2565 with SMTP id 5b1f17b1804b1-4925b3801c4mr125691855e9.25.1782331244005;
        Wed, 24 Jun 2026 13:00:44 -0700 (PDT)
Received: from strix.localnet ([197.250.227.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49264011d5fsm17039315e9.1.2026.06.24.13.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 13:00:41 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Wed, 24 Jun 2026 23:00:04 +0300
Message-ID: <7_XKp5ZWTJeJfxJieymOJA@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
References:
 <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-10-ca994bd22e9d@gmail.com>
 <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParthVt_moD_RiKok0jux0DKSA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextParthVt_moD_RiKok0jux0DKSA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Wed, 24 Jun 2026 23:00:04 +0300
Message-ID: <7_XKp5ZWTJeJfxJieymOJA@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
MIME-Version: 1.0

Hi Philipp,

Am Donnerstag, 18. Juni 2026, 12:24:26 Ostafrikanische Zeit schrieb Philipp 
Zabel:

> > +	[ZX297520V3_UART0_RESET]     = { .reg = 0x78,  .mask = BIT(6)  | 
BIT(7) 
> > },
> Is this a single reset line controlled by two bits (do you know what
> they are)? Or might these actually be two different reset controls that
> are just always set together?

I suppose I could expose both bits as separate reset controls in the binding. 
The lower bit is usually the one that actually resets the device, while the 
higher one works similarly to PCLK - it disconnects the device from the bus, 
if asserted. Depending on the device it may or may not leave any residual 
effect behind after deassert.

The stumbling block is the dwc2 USB driver. It only takes one reset, so I'd 
have to add another one (or abuse the dwc2-ecc reset) and presumably add a PHY 
driver for the 3rd reset or add a dwc2-phy reset.

The AMBA bus already takes an array of resets, so the pl011 UARTs are fine 
either way. For stmmac I need a glue driver for other reasons anyway. the 
dwc,mmc2 controller on this board seems to have only one reset, so no need to 
extend the driver here.

--nextParthVt_moD_RiKok0jux0DKSA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmo8N0QbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiEogP/R8cmmFdsmQf1KC8sEpC
FHs5LDtbqZiDlTBbyS30EkcQvlrgJiE+Nw4ooyuaXdp/yAsXGx6+PcJa+ts3U7n9
zq47YLFyEbK/eIOiZUL11INgY7fvX+rjmIjUycP/e+QDjZWWwnCylBPS49sy527A
eL8/Rc9Sh2c1YqqqPrdWXEPCYyex16JFem9/dW8rmBJ+wXtHSZpL4Pp0bnnWEFbB
pmFzhiVb9YI4/+zDV91/utODGohYddgEqjrpdqnFnp4PQ3NKlLL+IJPOVWOk2gxf
AWsdTFzbH9KqSeQnCxWw28tUhRdv9FNmL0TLNWzwUIssCxS26glrCoeXAP0G9qzd
08VmDofaWsbFRaDA2JncmPzJmb94sae4luwRCx611c2DfkgQjfT6r9U+jVKMKXIB
ys7km03W9hFCIv4oSqZDDzRXhD1h5m3CJA/OfqswLDTvNzUyQPCq9ofGg/O0Xr5+
7hqx5VO2owAQ1LvQfPuRrjzXdrhFF54Tm8zNxCEszhiJZwBQJ+muvqRtg6Om8KDd
SZ92FKvcPWcKdA1CAra4b9nPJuGviEvaXQpYh+6ja+Nubcfyf2EUIlidSU2EhaVC
192zUu5x+IC1lfvdMXBulb9LgPz6yi9S+71ytaYp+Mhn4I3X+gn0n/sLGEmL75VU
VTD9frYuMZXmnW5169uuFcAU
=/taJ
-----END PGP SIGNATURE-----

--nextParthVt_moD_RiKok0jux0DKSA--



