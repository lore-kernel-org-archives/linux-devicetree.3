Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793889383;
	b=Jxwe8S6UzOck/qs+FJ6eupsAtWuNDF9UYKFAFGHRA/2+2xLAoIkbxaQ8QbFYx9iAhLJr
	 1DLMQqV6wOiXpQpw2z8vt29SSUEYp3MsSj9teFJ6Dl6zm9F7FMGxhCuIFwzyW49w2lZg4
	 9MKsYUvgR+WgjOOFSl4ofefz5DzILKUsZr2VTckWvo4ONgvjxuXNIHnVxtCLAgs9Dv98w
	 ShMd0F+O1LRBf25SpbEYztqNB/eIuSieG+IJf1AN8G43TLxnMwk5GsAKfJZXbQACas+09
	 UlH0MTaUSn4bAfEhzF0K1L7tYZWFTNb4HaWhDU3xZWBnfW5pB3YYJr0UGDEcjR7T2VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=;
	b=U0wkPQ7THlxWfn51mQkPBeJWGxzhfhMbHgOmgq7gvKOFcIEmgmuxiOHOcuXR/OSHemqN
	 zLxwbSBuxnBv5oswaHdltzC4kCOWNWngXOP+i/UKnd3TKQXg5ZSR2BuxdX1Xv1tNTbWWA
	 5u9Ut70f/e5o1b4TeRgUmCOVHl1HV7WBkEcoq3EHO3Fu5qMbliUmmPS43xaaS7asknkqG
	 aQMBAgNyD7FjBWlXWnDUFHfgdfuE448k1UMwBlqvfNKcDlIPgkCFzMSPodRCffis6IP5S
	 UvBx7cciwKM6Y/7krDIJdzzF/pJeHWOquw5Tbz4yaiEACKNIiBlJIzxdTW88hpG8cOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=EAXbRDD8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF2A606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF2A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=EAXbRDD8
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1977810c88.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:36:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889382; cv=none;
        d=google.com; s=arc-20260327;
        b=cHZsRRihxBsHiFqoqb6NNPrngaCSzjDFzsyGSdoKI/VDRJuUVSJGG1rjwD1Z/XG+px
         2ZltBquDD/hQ/Th6dQLJjXUTGV58qrJBzPaZvD6362kygrXaz3IPqQm2bMPyaLlHkVof
         OPMYHF1PBgtEEQjq94UMdCwMisYIUzd+ttCqhFO9XPbO7b9FK9r/eBLFt/xsPe2h8NVh
         m3tn9T+JqZsA6/mADiCx+JbXVsl1OSWdShCXHBU7jxPvJXpQNgRSZ3FowVamDvmvwmhu
         2qJU5KDsN4Q+GAQNl2iYkJAel1kjTXGdA+VLkrd/Pxbej/uPqxq4XBaUN9xJnlwKGK3o
         517Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=;
        fh=n2BopuZxKVr+zn58gz2BYsk8gWssYI18b8C8xcc9Sjs=;
        b=OTxWSkTvILZoZqPuE6PNlvRmMvtzZXpghWmmlagMwotZcND6h++hKYjUdw4YUjXlvc
         U6pzyr9RUy9x7gy8W7ZyTd/zwY+P22CJEDAIx0WqxI5i4AxJt/78ZT42cGZIszMrXZan
         LpbqgZ5YVXhIsRYIJLBNG8BWJzGaeRy7FuwTpGdntVFulUdWoSYa3kjbB2jYDWASlu+N
         9M5jz35EZ9xPkM7kVyMd4UI3Cb79V5rcLA2lFTGz9Veorxn1D3I/iwkTTPGjqd7DbVVt
         R/DyGZw/mns3MFPoAHZUOmeWZp8ZiB0hCKVdKnNjy4LrDpTzL821EJmkyUQ6sWJq9K13
         1oVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889382; x=1794494182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=;
        b=EAXbRDD8sPltHa6XBhqWXbkrc/ZC+i4CS8Ku8plXQaYf9QBBBm8zCzj3beJ+iJb2M6
         RzFCTpcS26U+H7+lm7nBXNGZv997OUq3zjfI0F8WpsKODOSx1VtIXWh5/X7ZpcFRrEZ1
         620xnHa0XpczouAPiQKw6Rk0Xbl8qs46GMJH6i29KDAF0o4qzMclxnWoNqlG/FaJGir+
         RVDs3YH8D0jXXC030fdhFYRHjR8f/FBoCXn3qo4W5adV4fP9YTB7aqu7/kxNqVXjzx/r
         b2NDGAEUono/OKX+iSNxKYgZPf/pVrsqDl1u//0+il3RYD/eZ9BbnkEvsG87ZeDylPH2
         A5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889382; x=1794494182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=;
        b=ZXQei+LV9NQgE2HJ415g2HoSm60T5ro++lKFFxrRLi8q71rqN5M4YrnUPZkr97OxNn
         X8sFEp6rkQKZ/N9QPrX+LHfhSuM3SMuf6a5Ux1pBxIpc2gYQv0ijo5MjXwJZDH7h9iLE
         iCB0U0G9tzdRGBfYv/6jkPVNSH2djo0FQdJEje2ZSWKAgUC8DXX33Wy6vu2U3cvdmdyQ
         Eje99CllWS5Yx8snKTGPwAYXwb7vZXQjkmxr188Fb4KhE1DKhw6bqqCqkR+AS/lP+Id3
         uMTgaM349eebYOtuMvxF0fiY1Olbfyx2/vnz57yge5/psnC7wzK9dFF1pZSbxb1ZpvHx
         xstA==
X-Forwarded-Encrypted: i=1; AKwUvBxceHxpq+uumby7atKLSwPRJOk+Z3egvn53mm88xb11kKFvyZascQrsLhIdtfSMZPjMmkYlNE3La82U@vger.kernel.org
X-Gm-Message-State: APuU4Z8gO0EOHdlwOUAt9ylA61TL5TDYiXZntSVb3BM0pHyI9N/Md20L
	pLdEN3TOtsAt3z8L9eKngmy7/virjUBhf6dgT9+QbWDZ6zno+/ELQqIiOGaqzbo++xdv5nIq5SC
	GcUkZ2EnsVAxQqzr5Va0785zQa6u3fdqL9Yl/pR6tGA==
X-Gm-Gg: AYBFou2yGlJwxKwRLbDq9ZWF8PvRCw/zm8KHwsm7DtMKTURso7DHpYmxNWSLW50BvCu
	x6+zqTL2+BVcP8tRzm/Wpq3AFYFX/P9+sjkGsUsmEN+ObLlCOOEVzg13CPAAxZUKfGINRa2hVb1
	MymgSBvW21H4LyjIBg0tKOgBJ/bNSEsf9SxPMIYDkSM0D9SXJJoWDjuLNtd9SNc78bse5reWLok
	rpzOhiWby7VUkRSLSoM4g8W3d2BKyZ4Blykucild5qKuNHpW+f2W2lL4drY4zEODcxa9vTvnFVU
	XlHgleJaMuv6t+QJ2KT80eobtTBGgrSI8eByziFXz2MosvJxEf4sQqP9bQQsio9S6n2SMkZyjrP
	F+evJCMVg8/eZGP6smrLb1AcxPJWpdWXIY9Wc
X-Received: by 2002:a05:701b:454d:20b0:1b2:3b5b:b80b with SMTP id
 a92af1059eb24-1b23b5bb847mr12680614c88.8.1793889382405; Thu, 05 Nov 2026
 06:36:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com>
 <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com> <34506010.aRNtrjHk3s@diego>
In-Reply-To: <34506010.aRNtrjHk3s@diego>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:36:10 +0000
X-Gm-Features: AclHuK-P65od5HCTUxTkNtF8XI9WRdmLEVnuoZ_IAiO-y4WkOrppI1hKYcCtIdc
Message-ID: <CAPj87rMyMB05OTMDLSPe+oDZJYUW=oHF9E-f2LaTPCsBrKAAhQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color
 format on DW HDMI QP
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Sashiko <sashiko-bot@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 13:22, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> except patch 9 of 15, or mail hasn't turned up yet :-)
>
> It does look fine to me, but if someone has an eye to spare ...

Nah, I just forgot to send the mail / was waiting to send until the
dclk reset thing was fixed (I forget which).

Either way, it's done now!

Cheers,
Daniel
