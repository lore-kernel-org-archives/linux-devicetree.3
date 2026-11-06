Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951080;
	b=hBtyFuzNe5S+5FYS4ZeSusTHQ9Dk03Y43iPs34HYoX+LU5RzcWrvDDI/AkTZ551WWQX0
	 GAfIBLJzqKbo9sSqWm3F2+Zy6yj+a0AA06FpvFz6h1Vzrwf4uLnds2fIUaoGLlLdqCbkd
	 pxKdh9sBUmWngSGDj1vk2HtNGJr1FyMqeByqui9hNW8kEr+xbGdE5YpMpLXqbZJRak5b+
	 Ncu1ZAI55/FP3STrhmXwwLHkJ3vBSNaVbK2LmDMPR9ulheW9k2+pbVEYqTZupyGDfWrky
	 S6cmOt+osVpTRQBsEg2GFj6j6g0b/j4zBzgtvcnLmRAGpQLgFBWR575A3jQtMscbbBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951080;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SjVSzXWCLx+Jjtey5wy5TTeQi34u7lMXmhE20s/yWMM=;
	b=dB+CL6Klyp6QifLGNP6q05Dhlf1456Sb0/G4rDWXYPBeQOE1KVgynWSQnWJmvJJlK6EJ
	 UrKXZc5N8lgL2KDUYRkDfrVVedBcu8ijEbgJFiYuKF5UGkEa/9oqL3My0pUREs3suxBSI
	 qcTXRNBDlux1gjo6mIYEKu7bmBNPorY+keV8Rg7rIdvWzRXgVQnmclaiCIgp6Baql6lDB
	 XYfg5OfgZ9+ZAVQRa6C5mhpKZMpyAG3C/1qgDk920/bZmV8l5400KsU02t1FJwdNTpqkZ
	 rAYFU8aulyTyvf8G1Z3qVT17TJPw66L4mb2zZr7SCKieKKjVWIm5IqCzLVYjwW8AP5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNn8gBxI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4235606A32E
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 07:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNn8gBxI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599361F0089F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793951079;
	bh=SjVSzXWCLx+Jjtey5wy5TTeQi34u7lMXmhE20s/yWMM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jNn8gBxICYDAbumbHASNtUJNAGZaLnMzXaQakplDv1+8hPEpLanYzmowHaqYIGsdI
	 1z1PkWmAUzIT8ZLe52KxnaXhQCarXpC7D/sJrZDPQ68Vnz7BZb8CigcFC4Wp6DNuWe
	 bMOFNB1d9g1e4rKUYE1Tj/tEZ/dEP6n0iTcQI4+3YMxYi2B5+c3cBMIZDn1dLPJQa3
	 mgw9ut8GdEr7gD3oPWoi9t+M5eaPAryKofexTfas+Wh0lRBnEcWJcc4a2aBcMWopZi
	 8y8C1MKmgn1dKlZUoO/LFE1FUoJ4l5bG+QzbEB6cYCbG6mS7mkXZyqp137Ga4SfoEi
	 By8LfhrBTlYHw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so340191e87.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 23:44:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByv0LogUE7pFvLHMA8PE+JCSCroyFz6dTykwxI1hu6lfdAi7BMh9wWiUCV6gEPjipPwPn0ejzJpaFW4@vger.kernel.org
X-Gm-Message-State: APuU4Z+REgQ9MGTzjwSB0ylyM/KB6pcQWIqUjqbka0XEqYbBi7xCccGg
	yNp63WQgS+PtaiTd3FkjqLDEr0bzS3w0mWkiPYPZcFQEANjNJIR5YrFb85QclA6F563riEjUSYa
	uxyFqOKfVNP1zr/zbF/OKSkvMhQH5rDc=
X-Received: by 2002:a05:6512:12c9:b0:5bf:b603:365d with SMTP id
 2adb3069b0e04-5c003a8ded4mr513982e87.10.1793951078173; Thu, 05 Nov 2026
 23:44:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-6-455fe9eed5ee@kernel.org> <b65ef6c6-cbcf-4793-9ba1-7c5cb270f574@roeck-us.net>
In-Reply-To: <b65ef6c6-cbcf-4793-9ba1-7c5cb270f574@roeck-us.net>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 08:44:26 +0100
X-Gmail-Original-Message-ID: <CAD++jLm0patDC0Vh7sh3Mr214zaF3HFDoc8y=dHVs-gQePHa3g@mail.gmail.com>
X-Gm-Features: AclHuK-ug9wMfHMkul6is-bHRohYb321IdFcWEC09gms_v_lOAueeEGxhDLccag
Message-ID: <CAD++jLm0patDC0Vh7sh3Mr214zaF3HFDoc8y=dHVs-gQePHa3g@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] hwmon: Add Broadcom PMB PVTMON monitoring
To: Guenter Roeck <linux@roeck-us.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 4:06=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
> On 11/1/26 14:14, Linus Walleij wrote:

> > Expose the BCM6846 die temperature and seven voltage inputs through
> > hwmon using the shared Processor Monitor Bus (PMB) regmap.
> >
> > Register the temperature channel with the thermal framework so
> > existing zero-cell device-tree thermal sensor references work.
> >
> > Poll for valid samples with a bounded timeout, releasing the PMB lock
> > between reads. Report temperature in millidegrees Celsius, including
> > negative values, and voltages in millivolts.
> >
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> Please let me know if you want me to take this patch through
> the hwmon subsystem.

Thanks G=C3=BCnther!

I think it's best to take all through an MFD immutable branch as
is custom with these all-or-nothing drivers.

Yours,
Linus Walleij
