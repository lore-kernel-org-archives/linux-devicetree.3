Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443018;
	b=pwrSIIKw9QW5ULdApuijf/xj1NuXBuVbEdRcxlEXtA8i5fLTqbUmN7PAFG27NJjhrbiZ
	 3npMV/7KyQy4wK6bp1caCg4meprVvDXngjhrGiRPon/HdiedS02rAEzveagKDYG4UA2r8
	 XCntgt5wdBBSC9QNmWxPHOkaJVMD237YBbFuBBrRh6UMbMgW72YhC18CyCpGO00NEmDCm
	 KfnL95XOELkPbBsKpwX5Axawm3+V+7/ajM5+y28tAedzqfTaGthruLrNNr88cFaJTelHY
	 m37R73Vk1a2b5Kpt1Vy0GoDpfnPZV+mhuqZhN2AgPfOEm/VVFNyaR2WAr+dw9qtsFww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=bJEOq1+L8/8GmBV4uj6XcrIU9Gh8W1k/LOiRCQoroC4=;
	b=RMUD0BpQa1hqqDodI2oWISi4UKLpeu5SbNNKqOPkdAvDLxlGJpamA/wMx5zkxBVvw7Mv
	 9ofx+AGUv0mh3u2gGqivN8S8IT//oo1T4pYKTB6zLZlN4h23vGtxv8pv+5tynbo4IWvYN
	 nH+2mGkSmm1gnjeyZZzcIKvGnQd3DHyAbsEfdRhzQneKu6cuIydSn706Jm9J5zu1sFmNH
	 JZBODTRZ5o0aol/S1jiL7meR0qFQ2dcgj2UaIORkzE4dFS8ECBjuiM0SyKh+YDBCzuON5
	 W82i0w4ZH/iyHQrBmXhRUZaU5METBs19eiRe/KYeOlnawMiKtz6caXJc2M4UkyoTO7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=2bbGAwqh;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCD1606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CCD1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=2bbGAwqh
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so4315641a12.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795443015; x=1796047815; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bJEOq1+L8/8GmBV4uj6XcrIU9Gh8W1k/LOiRCQoroC4=;
        b=2bbGAwqhdzuGf+FVyo0WrVGiNbhzUFbxDmRTwCbxGrqvysTsd6BkVJ6ajpeejEeG7j
         u0QLPJBZoEAlEg7JVV0+QGXxRKNPqvrv9NFjhojcpq24aFVkJjRg5MeIKi71fNeYIZxF
         AlewsNe7MJJbc8SPuUkmQ9oWO8dPAzB/0ScS0AMt9vVlF3pTNpsTYcM4Yj8nTHIOm2/j
         je3Cf48jgPfJkHMajtQVkS+KaL3cDbpZRN352bDSACw9iyewnXlfhHQOiX9SI+kop7/v
         StvbsF3DbxaDkD5uOiSHgeGYAcivxd/kTt0NqzK79ZTKimZMBuSpgjxKwQibsnFObOPm
         ia+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443015; x=1796047815;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJEOq1+L8/8GmBV4uj6XcrIU9Gh8W1k/LOiRCQoroC4=;
        b=UOdL39c/JpFsKMQcVwLRWewBoQ/BqFoWPkJTHBBYKt/Ldmx3/9+1Grsaj/VncquPad
         zi7NMQ9UIDG+s6X5vyy99jXhKwJ3BCKEOuGBBrTqeyBqmk3cmEkJhuxObK9WoG0aHK/F
         xJp24nymA+W/O2DvD/OlTAfCOLyawd+sfH0Gbl1liDgKBA7Ah0C0bkmG5amz4ZX8U+m8
         bPdhhv8I3FpiU5PBZS9u9ZJAp6gWnGfaCBQasbsOJDHfk12mSA0PJDERy+SWV1cy3/xg
         1OCVAsija4DBZcHA0a+vMUbmISfcD6xxdRFAgbuB8CQDlvptskOhFsWCbJuVWtHcmQZj
         uNnA==
X-Gm-Message-State: APuU4Z/FScXWKhi+6YMRyAnzFoFfffjq8N7dfiHTUhrtMMaCvlUgVO9O
	GMPICxbcFqAs38cYnX4jK3wwr0F3UbyrE3+adT3dygPEeyvu+BmgeK2NmJDPM3zUd/E=
X-Gm-Gg: AZFdTZf6r38PckLGsK21j129CwG5CMJcZkuHWrZJXpqszVvYe7xagoD4NjpBTSMn5HZ
	84JQzTHBiD8Ej31sD5icMke6bkxYxpnBQN0IMTdI4NYDA9W2q6dmwuwoDy4iJ0UjgQ+rEFz4ug7
	ayq6RmcsiiGlycTWisHqUHyMkXCFr+agPC6h/iarP5TrtvehYyEl7KMc0Wz5uqwAF4ZwLu0Z0GU
	yNobmcJWf/uULmMmLfQE7XTpVGQgzeUpOZmWhYgTec5RYfwOkX9uluAKnRGoVf/J2zbMFxsMxLO
	aAmZP40Tj0CcNLCLnabzqhN4ho682vD6/dGLJPXXjXpgwWp/J98MI78t18bod3PuXqP4vzRkr5x
	w/FwaMacf/h/Eks/PvaTy+1Xj3+zpeP6UZ5qbvMu3M9qxvI63ofoYC9V+NKc0ZqcPT7gYCtClTh
	cOKyCGgiPGkWAVH9aBVUuI1x3lAL1m4GNy8+XT4jmyoXD4VaWoLNPrY6rEJdiZIVyv/rPatOZNT
	UBiPjyxoQXIlRZ/RoGF6DDBoKUhd9rppTyOI69RewcgXQAAKGlP6iIMMlEVSJ4qhDZep8mHq9nI
	HxxBhfZF4SUpC1fN5XshjkxCrTPIWP3O9s/8HAiRYBvDJUTHw/+UEThgDGsQLvFugslNHngVwg=
	=
X-Received: by 2002:a17:906:f8d2:b0:c50:bf14:8eb1 with SMTP id a640c23a62f3a-c513a84d84emr736801066b.14.1795443015398;
        Mon, 23 Nov 2026 06:10:15 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6780esm424259066b.17.2026.11.23.06.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:10:15 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 15:10:14 +0100
Message-Id: <DN2NFI28DGN5.OX9A1W6IO927@fairphone.com>
Cc: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <kernel@pengutronix.de>
Subject: Re: [PATCH v4 3/3] drm/panel: add LXD M9189A panel driver
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Michael Tretter" <m.tretter@pengutronix.de>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Rouven Czerwinski"
 <r.czerwinski@pengutronix.de>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260218-drm-panel-ek79007ad3-v4-0-8ec448bf3ede@pengutronix.de>
 <20260218-drm-panel-ek79007ad3-v4-3-8ec448bf3ede@pengutronix.de>
In-Reply-To: <20260218-drm-panel-ek79007ad3-v4-3-8ec448bf3ede@pengutronix.de>

Hi Michael,

On Wed Feb 18, 2026 at 10:12 AM CET, Michael Tretter wrote:
> From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
>
> The LXD M9189A panel is based on the EK79007AD3 DSI display controller.
> It currently supports only 4 lane operation.
>
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changes in v4:
> - Fix typo in driver name ("panel-lxa-m9189a")
>
> Changes in v3:
> - Change maintainer to Michael Tretter <m.tretter@pengutronix.de>
> - Fix error code if regulator is missing
> - Request power-supply instead of vdd-supply
>
> v2:
> - use _multi functions
> - remove unnecessary dcs_nop function
> - calculate pixelclock with timings
> suggested by Dmitry Baryshkov
>
> - rename functions to m9189_ prefix
> - rename struct and c file to use m9189
> - fix commit title to mention m9189
> ---
>  MAINTAINERS                              |   6 +
>  drivers/gpu/drm/panel/Kconfig            |   9 ++
>  drivers/gpu/drm/panel/Makefile           |   1 +
>  drivers/gpu/drm/panel/panel-lxd-m9189a.c | 243 +++++++++++++++++++++++++=
++++++
>  4 files changed, 259 insertions(+)

<snip>

> diff --git a/drivers/gpu/drm/panel/panel-lxd-m9189a.c b/drivers/gpu/drm/p=
anel/panel-lxd-m9189a.c
> new file mode 100644
> index 000000000000..68019e1e43a9
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-lxd-m9189a.c
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor devi=
ce tree.
> + * Copyright (c) 2024 Luca Weiss <luca.weiss@fairphone.com>

I was just randomly linked this driver, how come my name appears here?
I've had no part in this? I don't even know which device this panel is
for.

If the driver was actually generated with
linux-mdss-dsi-panel-driver-generator from a Qualcomm dtb, then this
copyright header wouldn't appear, so I assume Rouven just copied some
panel driver (that I generated + slightly adjusted) and adjusted it for
this panel?

Regards
Luca
