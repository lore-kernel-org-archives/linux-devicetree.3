Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757400;
	b=2h6mdP/3fbeZ59lF+KnnYkJsNzRhNlmYL9zQrSDCm7P9WDtuzOIsImobpFN8LqqIPIGr
	 uMsXBT4nZuvmyMuv2K8KArdPVMAVZ3ROg0Y5X5w4lu2Ph28+ojWKhITd7xsYIxMBlpz6V
	 pKUEpuj61KjjFCpZEFtc+YOdjdpobN8kkZZ2D+z+kUXOUlLmdgTniID0Jko9koIZFEZet
	 8+L4H8iUgqGeJZjeZb3xJHDQKY1C1r3zhsU1UObOtHuu/VP4+3jbm+iKxdv7+eOU5v3Wy
	 H1nEU1bpcnOSk7sRzxCr4j7YCH38OE0ke0wPObo4JPjUKu1poXDb/jWSTmZ1pzXgfbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
	b=LMz9yNi4mp/6SahEeumWqaTc0+YLZEvs087OmHbZxlLrJPNf+NdmmmcAqTwxPtRkls7O
	 SQS2cyxHz6A2ntMh+S6a8UZ4PGi7lVsTU90Po/EZafH3x0N2fabJLvAz+ABZn/9PerfHT
	 CDLwzvUfYavaLGRV9EXSeJSttC7cgxCBwM3dEaUqJYQR0Res8WaVUipWXjJcdA5f5ttBi
	 ocSNxZyR+UUvUE8YNkowFr+kY3fUPuAroMRxKKbLml/rJJpqZIOip+A4Z7oIAxK5dVE06
	 Odtx0lPAA0aQobkarJTwjDlv6ixhtrLOtg//ZgH5LwqGs4ckeHy/gvwJagudL1eZDKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBYr2ghe;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86824606A883
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 15:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86824606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBYr2ghe
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so11973245e9.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757399; x=1795362199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=HBYr2gheQUl7c26Y3yfqksOaTOYrIFYUyEUzlZUZhWSZy+HAESqRcXZrP+TZZhM8z9
         75y4g55klpFlA/Qulr9Yg7kYDWq1+w93Piu62izk5f8edZNdPTqmw53yQIcVZJ8POpjR
         FCFDGpFCG+XXUQSOtyP6WZHieYuBpqKKanKZ3wnDH3I4OGAaLXxf7XH2XvGb65akJdzr
         QUEsYnB0UF1WTP5FCzRnWQED5TK5P0HAm0HJ7Hpeq/wgtIM84HN+PLhoAeYrZah9RjSs
         zqZK2w+ADZMGUpKyIfEL5w7Zfqyz1Z40uP2rSoJOgyF58OsUuKjbbaFJV/9eOLQrvgqB
         Q1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757399; x=1795362199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=kogh7b9u2G3DgqMNPRAHI1kbcnGVl7TaIjjnVLb6xYdhfxZlMEPo/MrqPFrfRaMvGd
         YDPtC7jjTeikBOy8swSYsb49VXEoz3HlW0BlWmM4CQ/QZ29hDM91/WojimJ0nrkrNUrA
         qWIzL3i4hXwI3vKeuZFrIQqtpaJVL7QPbojUMvsQ3ju1IGG4qqktwWMNotbd2ObARgJ4
         c1LA09a8UDOx6v34z40qM38t6ysGKN1UUc0dT6FRvaKaXkCrNQluDHRy1p+lPbDJvrTC
         7MYBg/urHm4xy/5pAPobnXtoBzqlLa3VpPXV4FqvoFt9IrZC57It3coBHej87qzGrfDz
         UJ/Q==
X-Forwarded-Encrypted: i=1; AL+hErFFopA5Ka3ZMIR/xex+MJ7G5MVtFUcR9ODiD1InqfO8F5OK25EKRQB3vT+9/Adj6A0Va/bD+3rlUXQq@vger.kernel.org
X-Gm-Message-State: APuU4Z+B8Di7gE4hlA6tMwcIVkFFioTMKiKHT/mgI3nU5Jci43OEcRLK
	/ZLvPqbhYxuBEm5Fvy9pGtiFIG7ndEElF68xoG7S9KIiY179rrS7P3pENmENo9vQbLk=
X-Gm-Gg: AYBFou2jVeiSs1H7THq3B0R56u2lfhGb1mq/O5l4g4AKX0LuUoaAMtUJQspNBgo5r/a
	PZlM7Pjctz9HJ1ZQvP/qXOAyW8wNqGI6R44++IyA9HaTbxbQt6vqMGBKyhK0AlSgE4q6py2QtRq
	YL5bPQabH9igNo2iJVDEk3dnrdsFflNZZuAAuj1WnVmZta6lEiLRgWRPybKhIVSyyGooZ5ZFVoG
	1z5sWIYnnW+wxPqv2N/A65JDfs5YdBTHFsDLl7lCN3SreL4eTL/zg4t8jPeXi4pubaQDCKbjDQz
	eY0nl8N4xeDaAumcSIefH1ocTaRqa2BNTKldaL9ZzFq/H7g1qFNiQ0PdAfURTfZlOEKF94e/8KT
	yQB9Bwxo23ziWJmeibC7jGqZHw6UTrNc+D7vJu8UMGdEuLoxHVdu3OcGLHsbvmPCloqGAW9jYDd
	l9k9iq8y8XgbSL9S/arzkVddP8PncuQPdDJTZmJPe+UO4nrRBZJzpUQpynLPwosiu5BgeTnoyn9
	wXcWbr8oadoz3vcPsO6oMQq87WiwOTvV0nnX/iH3P5bwclX7M8sTG/n44yz/viXBH+R2k0u58Hs
	sgyGj4kzfVePa7sEkGJxW7Z6LzsT8h/fa+2M5qlcFGYii5yqtL3BlKmq
X-Received: by 2002:a05:600c:608c:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb680f0a64mr77590835e9.2.1794757398894;
        Sun, 15 Nov 2026 07:43:18 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb68c00b10sm52646085e9.0.2026.11.15.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:43:17 -0800 (PST)
Date: Sun, 15 Nov 2026 16:43:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
Message-ID: <avnSl53KHJWGrBcE@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nd4yu7xpyaelhc7q"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>


--nd4yu7xpyaelhc7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
MIME-Version: 1.0

Same feedback as for patch #14: Don't include <linux/mod_devicetable.h>
and please fix the spacing in the of_device_id array.

Best regards
Uwe

--nd4yu7xpyaelhc7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50xEACgkQj4D7WH0S
/k7FQQf9GMWHvRPfVzE3vnOHAT8nN1+INki1D4kL4uwlHr3JU4yutcwFkaHKLsQU
b4DbnyStL4d7i466zTUN7GaSuTfs5LByLE0hKNibeGI5Wa+bHdhPXZw6poTITVON
f2BwjcuK+Zq5YQKqimrjo/4tbchvvRaJ2tX4FrpWxIYNSEVPVDu3Ku1FTeQTjQiW
q3iSJsE9FH4VZAUg2tViVg4jIzTIj6ncm2+HvaOFr/vv8gwncEBYp0IlMVPyqH3A
a+UAaIoEVNFvPPDDjTGrnHlPAjkkKoP4p3OAxBnC1l6qyEx0qCChV2gqtkPof0ba
XuoM97TKUIIJOGjYertizBLa8GJ32A==
=5u67
-----END PGP SIGNATURE-----

--nd4yu7xpyaelhc7q--
