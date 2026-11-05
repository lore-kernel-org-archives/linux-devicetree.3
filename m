Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887196;
	b=12zFx9h2PlfmBDstVd9C9zO94TbwPlDLLHZR13JZR76BN+Ib4N5bDAqP4Xa2IVc50hmU
	 jNqED49jukIZcm/2rqjfkbKB5p1UO8OOzL4zTytkFG+0CkOUVIVx/vjMms9zmIXkPXBH1
	 adanhdG9bcT6Dix6jMLn5AmKpt504K8g9Pv9F9GYjGPvIkO7CFbf7P5/npKuiYqWTvdNq
	 kanGD89rZ4vsryhMLGsJ5fFFFBhWwba3+6JTz72Hftd3m3qLTKPASa25wGdiPCaANR5GC
	 TSp8iBa5AH4eCybYTLQv201Z1dica2Lt9VOUYGo65e3u4yb8kOb6ANg1ishBfi7sShA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=;
	b=mVF7bcnOa6As4aNQUWY7kICWho2j8Ug9oFOXYE0tVZwzie1we6cCPIYypSZ+4Df9IU3o
	 iJR2NDAXiPOBVXY0ugBwdVD79iGTy5JBv0jzvygPAQTtHI2qXPU2QFwBjRuF/4n1nfbBz
	 e7t37vi4nGaz/jmgniMlZr5sPGWr6QASSk2c3P5tW4si3sestoN3oDk+1funpAB+rJ3g2
	 XDSmGZY5FmMizQC4SZcHvOg7/qFmiXHmHJPhqYqf4OznKSW0dYBe/2tcGld9P5bWcA5Ze
	 5/fieipeM1kvymMiTSFuWTPzpGT/wuDin/k9LexGiRtTyq1gJR3SHjkGsLvd/XJqO/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="SU8EB/5l";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5057606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5057606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SU8EB/5l
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so18335625e9.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887194; x=1794491994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=;
        b=SU8EB/5l1TjO4SR/ZHfVurcBTZbviwe8Nvokm+g3goN3ssYVBwEQd1KNYBghk+IBAn
         UPgYM/9MOmdy3MZFzi5hffeEWAoioYQmvG1eAggddRsJr8jpml5MMp1fiKg3poEuB4Op
         PsAUqk8Ee4I6Nq1jS4e9CNkIX9bRl8Ww3+m3TfE5LyxzdAXAFyzXytTwQnSixgCrZxtJ
         BbSj40LqKDs3RHuqIj6pJIEfXncRWmKOW8LujwPQd8dbB5OG/P5E/BzrM5xR0xfCrRm/
         m5eAxF4mvBYJy0ku96BAEmJJX4mGG/cr/w+eYHTpPCieMbwLOQknvWORhQKErWQOeQak
         aKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887194; x=1794491994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=;
        b=PwGh9kPD3y/LKkUlAxLqg/H/eAftNhGaY2IqhxKa9ghAs221PFGI49AUjX8seNV0TR
         XSv2BuT4quKnUqPizFD1oxKQlXH5E2clTnMaT8N21zY4Q0FJZ4QoWjTPAZUiY462nt8r
         V3dg7ubqcWrQ7kA1AVNbrcTBiU/t4uUkM8ASp0S9+CB8WrQZMahBcqLYIkKskf5Wrehq
         6GrxlfviEnpOYWzUVBukTS+BKFTprBFEEM/+Kb1zQBUe8LnhWFTVfHaQQJS9Gf4vPjES
         PMctXmNgHpM/JHAENBGiFf/T/2WkzM+7jsZkethLhCg3+mUMglDfZVkbYhK0Sg40uXM1
         x29A==
X-Forwarded-Encrypted: i=1; AKwUvBwxH90gYWwAo9x51ldcz5r3YAv8nOx0CVAgcmkO5f3BYbhEJg9ZV3eeW9zoe+bvDzYkP/TGJB+QFtz/@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hw00RwV5Fj1u97UX/r6Y77EIY2RDslN9E2cFpnm/gubKgNCps
	l9hk5B67m9aNF0wMiDf/rUU2W9NGhzNe7P9E4Pf2Kyg+45aV0jKGdG8SLMIwC5ZDYsQ=
X-Gm-Gg: AYBFou1pmYRYcfkDrcIOhWBUXTWhxx0feOku5GC9sxk1dSh5T1QIZzepC0oji9XsJkb
	5s2IHJdFgWQt9i7VBaZCTi412UqtYevh6w4BpMjKm3RJUO7wOJwqE8QfCIcWjCJeFtMJSDq40+u
	retmjPTFNgyiHS9JrbqXO2dV52j35FUs1oZzcvsnjCcL/oHyBeykh73ji+rRrAi2YD9VxkljKIW
	IKkO5PtStPYy6JdbRKKnwOT707kG1HbuhXv0lz44A1txOAfygKnRjuMUq8zwe86yQmtlAzveoUB
	Afq/YdCEfFjr0rOtKy9868Ao3ef3XVWdBWNE9WTXIfaw8rc7Cu5uT/vNcwoZCt4HLKlyov1Tvq8
	XccIuLj48VhhYpyL0LFWNc3sCQmH8nNFuyTj6k65N8yIm2kyNM3pRD0PG0dYt4m2qNuuU3/dcZ/
	kBR6Sjg83V6v2J/P8cI66X3kVGnd10mwdUdjtLGnYup+icZHfmA1tV89hgtP02PKhAkYbFHd/vU
	bkjBjfDHTYU+BFf19de5yp/ZZAbd82g/+j6n99en4/GO5GPBARoOmWJwmBxQnnlqLer/Bke69aM
	mgOoLge2ZrAKliP5WV5Au0RZAvA=
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr259029715e9.35.1793887194037;
        Thu, 05 Nov 2026 05:59:54 -0800 (PST)
Received: from localhost ([194.213.108.9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56e2ae73csm69855805e9.1.2026.11.05.05.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:59:53 -0800 (PST)
Date: Thu, 5 Nov 2026 14:59:49 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tim Michals <tcmichals@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] remoteproc: sunxi: Add Allwinner A523 XuanTie
 E906 driver
Message-ID: <auyLnRhPv0jz1roG@monoceros>
References: <20261101185735.762559-1-tcmichals@gmail.com>
 <20261101185735.762559-5-tcmichals@gmail.com>
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
	protocol="application/pgp-signature"; boundary="bvyb3kuhcvop66ue"
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-5-tcmichals@gmail.com>


--bvyb3kuhcvop66ue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 4/7] remoteproc: sunxi: Add Allwinner A523 XuanTie
 E906 driver
MIME-Version: 1.0

Hello,

On Sun, Nov 01, 2026 at 12:57:32PM -0600, Tim Michals wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

As for patch 2: Please don't use <linux/mod_devicetable.h> and rely on
<linux/platform_device.h> to provide of_device_id.

Best regards
Uwe

--bvyb3kuhcvop66ue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsi9IACgkQj4D7WH0S
/k5Wggf/YfIQ7WHmvvey+xjJQnqBBC6pD6WMGs1N8zOjBs47xKTlmoiTy704ncA/
SHYjg0IkCpwOICXXvfiXJZFK8h5M7+y5jrB6VR4gKwnHKcUzaD8baV2tzCTRxFzk
q7fKaeI3n7fNH1aRrXWMimidD77eQ9VgIocGQaE05rZOFLWYznwN1IejorHjVYp/
vlaPrjtYabWXJydNPSHUrC4QQNwhhpon6qjxkgmEXkcW4zWORnfjI58d7MJv7jNd
i46zZKPpVOXafx2kCKmbSiggE5i1cPr6O3e+3Muw64B0kJenSgxjkPD0kzt1TMDL
MrWyYaGIU8+0pgKPYFIeJQiOoD98Ww==
=7Net
-----END PGP SIGNATURE-----

--bvyb3kuhcvop66ue--
