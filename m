Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778628;
	b=5lh3KvoHedjBpjmGfOyLQT5o9QiVnVqIAlekUO4JisGhkBar29u6N9142xcUBpqiCAo8
	 oyCbMNSxKIjgUKFbvvj+BGxc8lOho5LAdvfj3RUj9T8yNFlnE/HDHWOXCLEh2YZzekjM6
	 0cy0ctmxZv0WW4TxOLv2x43GDaXEh34TlKuRLr5DoQbICupLh6kmpg0zliNdVpoDHLYYM
	 IqBKusJ+IVCPm/4brtkH8ziigxsjSs7WSfMSmKWeKh7Dfnci+L1O3x1YMkkHl47+FYWIN
	 wqHbYVHGcovYRea0srpLyO0WrMYqBYNePouswCvewFS0YRxEF4r5zUPQMAx155aTp7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778628;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ehtqtF1mQlApcVvUtORZ0T73fEOYE9F7ECr38Eww7ic=;
	b=T5kRPGQJd8SMKkh4u53eBBvmGycf4ufpg6OPJH9VPA3VjVW7Xzc8sHTg8K0V7H8qOlRT
	 UCjKTQyPJ2vTf3tMnaf6cwx78qV7tWQ+Tg9w1THcD4j8e+iqtxcFOCNDOMjNWBP70LXrO
	 MMen2GPeB370VxuAY7CIGL14uVCA0RCrRpBR07/qPPIt4n7aGmcbzRYtBE84w8NkY++Rb
	 pZVqXfOk8gMPjNxT6BI2QPO3tlqr+iU3ZQIVFZIjt8YjQ5GoB80qj8Mw1CBlG5Jfku3pY
	 r6yfskM4lEKXdX1Sy2eccbsHozRcFJsv/ZyHAu1CrJ9qtDPZlpI+nhCeedxAF9ZC9tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80B1606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A80B1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso216524a91.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778627; x=1794383427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehtqtF1mQlApcVvUtORZ0T73fEOYE9F7ECr38Eww7ic=;
        b=XjcsA1XKf4+ghssB3PZTlATHl2KOaXmK4OMADvKW3bC7bvREF/5KP/M2QV1gG8dlmI
         NaLEcTirtQ8FIk0566M2TWYOIdTDFK3xqsx0ESX6msLPgtUFeakiblgouuTSWOYe4jrL
         KKH5e5XFD/KGecT1P1VhqNOSldpL435pcaO8AJxMgS3vt0cFKGCLfmIG8QpDSixtlYTx
         nTdvAOi9x1CjZZlCxMLVdcr90YczNq7XZ5eMs2u7GGF5v6hOMXz549EXFI8fL8/wG2qW
         Jhill12OZ9A2WBfi/yToy3P4WWshCcy4WKT5UrErwrK63R8JVwaYSItXYFlWTJYxL7w1
         aJ6g==
X-Forwarded-Encrypted: i=1; AKwUvByHUYZiynRbLWLsAaHzYR+hpl9uQgu3jVV5r/XEa4qkzmfsto0G5YKvZBYGvgDBqaxU3AMP6mW77eX4@vger.kernel.org
X-Gm-Message-State: APuU4Z/OWOkKeGvI2dRn2NSCuOfxqUk0XXG2xol74anSFLIniwagIVD+
	v3ytNgSinLflttAtrdXTexgacojeoyOX2q8dRoHF090rN38U98W5++b00vGkzCCx
X-Gm-Gg: AYBFou0wC8fkBk7hdyMxIFyvV35avV3VHPMOc5W32wqM/BSn2mGhbphU0Ae/UuSC/a9
	Enc8FQ7cympdMIZQ/Yoy0mKIfAMXDWfucwOSID6PJPm772DPU4YCFBKdi2/Z1w9O/hXfbkUCEGH
	Oopczd+kro2rQC47FK/5pe9PuHulKYHW3M/deNW6Q8H/+jCqpLLdR5KwpsO6lA6uL5kw+Dslqd3
	vatUacgK7qcsOnn1x2TRlj75pMUBsjYA6Iesx3QTTN0wHGrzjvc7nzsD429KQ2HZMnskniBiQkp
	WqV17xbfoLKnf+PapGQ72fPMWjDKyO+tg3dNPm46Ta9g+0y8zQA3TosF3KOo4Tw7mf5owBi6jwC
	JR3lywoj3VS75FGJE8TnM/I7O2t/jjHV717jDkJfPuw5P2hmyNpOzHOAG2D4IPPxuF1UK+T56M6
	mLtJ+3NOjGI7DsV5NO5fAmeRKhB4bTUKIzLUYdfkbfrWXl87KqG551rihURI+A+e4tWqLnP415E
	WiPJySuELn9bSYW4JuLZoHyMfzWpoRS9IEvLytl8DkMIZfXvvDCvPNFr8QJnddoIHE/KvHbvi9L
	mni/l01dZVcnsiY8l3VLGr3PzSThQDtuPrex2RehMEyIIh+rxBkB2L8TA9J9oOQWC5Hgc8DCtqZ
	dNEyYQ2LAxNfecKWLpYG6xPnoZUGimD2c8rjDMgEczTg=
X-Received: by 2002:a17:90b:5824:b0:3ac:9785:4c32 with SMTP id 98e67ed59e1d1-3ae89736447mr11770906a91.30.1793778627014;
        Tue, 03 Nov 2026 23:50:27 -0800 (PST)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com. [74.125.82.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm8387288a91.15.2026.11.03.23.50.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:50:25 -0800 (PST)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36cad25b8b0so559498eec.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:50:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz5lwk5D2KVDObViOoR6FIBlPYIrJv+L/vn8imvxM+iy2fnPYWhmi7x69ByVEor392J3AypYUzoZCYQ@vger.kernel.org
X-Received: by 2002:a05:7300:5626:b0:36d:3c0f:cc85 with SMTP id
 5a478bee46e88-36d3c0fd4ddmr336931eec.5.1793778624811; Tue, 03 Nov 2026
 23:50:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-mxl-gsw1xx-reset-v1-0-53839bf5c88e@telaak.dev>
 <20261104-mxl-gsw1xx-reset-v1-2-53839bf5c88e@telaak.dev> <aurg9vX3_i_ewWur@makrotopia.org>
In-Reply-To: <aurg9vX3_i_ewWur@makrotopia.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 02:50:12 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ60av3BuwZLLd0hPrBwoG3pkn9F8UkC+_R955eR-hSgRg@mail.gmail.com>
X-Gm-Features: AclHuK8ba1AdAyiGMIqLrEIrq97_7kEVXJoVGnwsPAzijK50SZ_tiUWACXQK9rY
Message-ID: <CAPY4CJ60av3BuwZLLd0hPrBwoG3pkn9F8UkC+_R955eR-hSgRg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
To: Daniel Golle <daniel@makrotopia.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 07:38:30AM +0000, Daniel Golle wrote:
> Any good reason to open-code this instead of using reset-gpio
> (CONFIG_RESET_GPIO)?

Thanks for pointing that out. v2 will use the reset controller API, so
reset-gpios is handled by reset-gpio.

On Wed, Nov 4, 2026 at 2:38=E2=80=AFAM Daniel Golle <daniel@makrotopia.org>=
 wrote:
>
> On Wed, Nov 04, 2026 at 02:15:48AM -0500, Joseph Telaak via B4 Relay wrot=
e:
> > From: Joseph Telaak <joseph@telaak.dev>
> >
> > The switch keeps the configuration the bootloader left in it, and the
> > driver never resets it. The MDIO core asserts and releases reset-gpios
> > only for PHY devices, so a reset line described on the switch node has
> > no effect either.
> >
> > On the GL.iNet GL-SFT1200 the bootloader leaves each internal PHY of
> > the GSW150 one MDIO address above its port. Port 0 then fails with
> > "failed to connect to PHY: -ENODEV", and the PHY that answers at a
> > port's address belongs to the neighbouring port. After a hardware reset
> > every PHY is back at its port's address and all ports work.
> >
> > Request the reset GPIO in the driver and pulse it before the first
> > register access. The timing follows the vendor driver: asserted for
> > 2 ms, then 100 ms before the switch is accessed.
>
> Any good reason to open-code this instead of using reset-gpio
> (CONFIG_RESET_GPIO)?
>
