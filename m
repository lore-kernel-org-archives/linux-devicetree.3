Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765740;
	b=DKht9xib7HHqvhCx6auY6BZDyTUcESyngVC6ID5s1jq7JB6v7oKVt4TYxeYdNXzr4R1h
	 xX4IvuFUplZ8szgqfLDXoFDWNrfMG/dewG9Cn0uId8N3UL9jK/9cJrV6+0DojQ8ia7snH
	 2IIKee9rCXlcnfgWKgBPzQmvnrp2XyzlkgCPVQlnxQYgvasVqPpH/8f7hy3j2b3qc0ZWJ
	 Le16JF0zrJ2M2MHaaJvf7HzbniVcaZ2Oa+O+77l9CXZhy0MGsoYGuEAkhPrhLZyd2QUHG
	 Kc1enMXos8OlOIIw+h8tHAglpN2hKLgsqcurHx571wokd+GA4vfy7+5mVp9onHNlCTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
	b=1cOuFAf5FDWtnRPGY0DjJ0Y3WAgsl9Ri7yCUz+e+RyFrNrF49EMaEhh7sDW3ZQgV2yRh
	 1cxDKO0kSagilq0UGBKYuzs9n3ToRYPeVVl4sWB7EAGb1wbYw+Q0pheUVUMkKgBZFN63Z
	 p32BmN5/7bvJD2kMFipjtUEIiDzkTQfPp62scxnnyfyvibslK3eWkpKjD8WbpzDfXDKdy
	 zWET9xS1ZckJ6DY1r4GQN7OSmlB6dzzKHRm/GXVntIFAi1slCp+LjWTxSsr7jnAK2x/fd
	 v89Dnj9ZrucUXzi+qNn98sQIy5wD9brV4TLhfdT/dTKVEejTnsRy4jviGrruTfOOEmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=trcjy1Js;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD3B606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD3B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=trcjy1Js
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67583c777abso2735213d50.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:02:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765739; cv=none;
        d=google.com; s=arc-20260327;
        b=dgwAZnwAgUrssbaivxwv7Im8Y9CJ7NSWTuzBDOlXeauhtzk2D7ayVGDQtzQeeVQH+t
         yVZvi6Avrq/ay5l/4sFiGuqVhhKQwm/k4QK3C+KnJFHNgVIlYPrrKZCo7n6hwmX941c1
         ZY/b5q02Dx6uLtxIl0UKt+4/336tLhISuy5bOj2nGiMVVt3ohf1BMLWAQUZ1gZIj1hFq
         tkpMq3a0q6nW/mzCLHNmsDbAdbkHRitBaP1Fblw3SoiOLhTDSmcd3Xyc7+e0aq5KzDFU
         uyLihMOJhj96eK+WoyeCrc+2Ub0h7tfB1vh7HDo37N+/k/E5yLOwjnlfDZNBSZRFUOLs
         8Haw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        fh=uRfTLLd/ibQgAbUh2h0PWVRaxz0Ynf192VoHGYtvlYM=;
        b=J+ywsOMHuAXIf+o7IMEZhgiLFJcfufw7d2UMyFaqW2rlfCANSOj0luuBx7Vq64aPzt
         qf7BUqT1WR4TgZLeQFPW0RhOa6KvcibxVARJY3RKUw/8dlvb3EkWsYRJ0jxdicTOoc7W
         3LuhBqa38jHq7kXachW8wdlV7zyZ1ZzW7cFDvniEXKsUhqXIpo4mGLg8X56D0kdjMIJ2
         FU7Y4OHeb/mxopvOM/wSeOzuIqXWYAou8VQqYNsN80w/hzsUXxdGL7J5ZI5ASQXrxUX2
         RVGMVbitk5NCQHeoNrNG/x0xRl0LpTIsvzLEycsJu/KP140ifOSkbUIMnHbYF86kMrHg
         o7pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765739; x=1795370539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        b=trcjy1Jsu6uraAxeRq1k2El7wn6wlXZF2ZLBh9CCWP5wataRKIvera4oeEeA9Z1su2
         s9rEizFFkNLrERo4aaXhfnjn9AWhTpvcK1Yv9W0dwusaSCKr1DmtYB4pptoKFiiVgmtB
         7hGbZtwRP+sl5/0vR4DNalGHry3ANAx1LFtAl7jvxdJbXSEuMHW8hiy13yP8hv9Xt/Cv
         CPD6SmiUfnDj9w2N5G5lbCdciKToWR/8X2PQEb2Hc/GXJJ4Yxrt8NzSvaMVaXY9adj0r
         kQLWGvZTOyb6rns6/kjEKSUdPkshaXES9quCICOwsSJfLfP+Gk90Je4Ts65VttVf4grr
         oFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765739; x=1795370539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        b=NrGzU1sjTV7wo6txceB3w6R/ggd7qirw/tB/GlAGtKLEE93KEo2dD4rvkcRGcI0Yr3
         wbUmln/F2ii47ZSyBL2oZjwvTDFNfmHItULR3vfinqR7BDr5Jc7+YKkYmmaRivP3iGsN
         hAYXT8dC9vRfK/dYX4s986EyVVA0uCoAF/xMs83bMw9tD3TC94kQ4L+/R7219hTGm9g6
         qoJdPVyEEr4dRyjDDDf7VrTz0AvbMIRkby2TWV0U0x5D3EUR7ymR52dXTKDEw1pik0ZI
         4+WKeB3aBxWQ0JpfHYlh4d/TFrQd+BU4yxYdpQinCtvNbMelyk8QIDZ53UFtFrjPwX+y
         bhmg==
X-Forwarded-Encrypted: i=1; AL+hErGixYbEC0RqqroUOqvxn9pWKO6Aq2QSbmTxUuedXEsHllBf8Pe9YS4gMUJszi9i/c0C5XRcaOwE84OL@vger.kernel.org
X-Gm-Message-State: APuU4Z85/FLPbc781TMpldE3hTJ6uA7HDLRA4m71Fn6ymYo+k+evfskM
	epfSQ4xbEsrxuDBDpsTaNly6Svsu99gPXfV9NGAjFOETIcD/0UT2CPBCDpjp6MXjDUuGPrLMeiq
	R+5hhKCdTfiion/kAWTl3CxiZFceOq9w=
X-Gm-Gg: AYBFou1UDn4DBpJRlh+I2L1KxBlrZEUwbw71bkkXxHHBSHz2CLFu6pj5pUMrcLL6sOc
	em1V2Sog2DPzBa7DA6mXskwldsMRVCa9EoYIdP/yEpI3UpIGClA91W6FpujgxtUTz2Iz/082BHm
	OfBQNs+UslQ6t21/gUwPGdwADzMgYNxLp2NhAnjWv5htfAzmUgCOThdM31Vd2ZyD0xUvtYGQLwc
	P2QTgpIFgyySI5HN6c/HD9kt/mKcExZ3D7VlIG8iF8kcL1yZT0JS8tqtQuhe9iBHknGb15I0a/m
	n3/eMrC084+06aBE8mjRSV/4ke3DKQrZ/1dmTUs2stk5ZwtqbR1X3GIa14t9FcGmQJIVxDRNcy1
	2DMXgK8xJz5ReJvoQ42/wHV7d4m+KJJJWEdPywRelX3EOLewfaeB74jG84h+ckN9G27eu4Q==
X-Received: by 2002:a05:690e:c8b:b0:67d:9fef:d62e with SMTP id
 956f58d0204a3-67d9fefe0ebmr2566936d50.6.1794765738737; Sun, 15 Nov 2026
 10:02:18 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-7-tanure@linux.com>
In-Reply-To: <20261113121852.334604-7-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 19:02:07 +0100
X-Gm-Features: AclHuK982JSfMQyLz3Nt-omny5MSefKP7dqRCWJKkI82T-Lx69OJ3UT6uTKWWOc
Message-ID: <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
[...]
> +                       eth_phy: mdio-multiplexer@28000 {
> +                               compatible =3D "amlogic,g12a-mdio-mux";
I think this has to get a T7 specific compatible string (dt-bindings
only, no driver change needed):
  compatible =3D "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";

If we find differences in T7's mdio-mux compared to G12A then we'll be
able to manage them.
