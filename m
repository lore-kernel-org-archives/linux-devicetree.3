Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794852398;
	b=gx65+e2VSIjZg//U7A3sx1ngIkytDigfRnDPKJtDfA5Anxm5SEdaDTHLW5s3w4O6kacc
	 TnKvF1g1sSqRSrcAq2Z9VZX2otXWRijC5+L9iuIb1/j7oa6rW7uoUuFgrb1kV70aKXz1P
	 qdn8fPjC732NQ9/NCZpaIJSso05qfsANsCoAiRVXhTusvci3T0c3FUTvXzCbmoKGK7xdM
	 B31zEZ72FS9ndbsGJ87wlvQ3eoPx3oQANEyWFPBjKxcUJRE6wXKpX+UCWxiPOiXfC5dxt
	 lmVev6UQU6af/k9GNHY+UELibfaHPxJZEZD+cFZkT3i3EXuL/cxL1i4aXPdRivy1DGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
	b=g8oepjB/AQMtngCjxwV68JtTSepmTla9bs54KBKQ1EVsIpuS8dQw5GMYfzO1FZS/lI96
	 4/3yTBG7F9Zv1dYCHqsiLuvHSyYYZYqcdfeZqFCspYRht81y9CcvTxKW1MWXQUhLMosR6
	 9IVbmFwrF/ctVdnKptqpG+rGGGY3nrtdhxdQgarXqDbXNwxo0r64cw/pBg9Ugq5jnWtK5
	 mWMAzV7/JVJ/AlTYC/F3lTrplJw1o+jddKc3phHxqOXnhY/fNXopUVij7xmmmSPCsGwIZ
	 p3K1rZClYF8wv+4RyRvuVnKapLgqX2hv1mj9zdtE3NxHgpC1PyZwJINV8adGlG4h3Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kmfEtmJS;
	arc=fail smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FA1606A322
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 18:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98FA1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kmfEtmJS
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so4819913a12.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:06:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852396; cv=none;
        d=google.com; s=arc-20260327;
        b=WFy60SB5oxRjYMRsK0Aaavdhh/JW5MGeWEozM5KUuhtj9FIZNULU6dsY1QXrkeMQ9g
         AXCvVpGZRojSCxEXbb066otOQuVO8/UjfhRKyaUJCu3JCK4dxMlOBVGgpXIHsVwA5NgI
         fseFxTKi1fM9TW60uKquL6X2x6NT/uhlYGm8LmEH3kZcdigwVyci8Lstq1BJENs2xsW6
         tsPpeawC/lihZlQCsRr56n8mxbnTgkj7zzVbG41E3SK01YxkhmpQGKqWd0oRbZdCItft
         YRUc1J37MTOTxn6egfYZ7tuAOiAcqPn5FzSt2amM0GBiVEwZ3HUU31/zFQHkJl/mbk0c
         uqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        fh=iRTqkH4eyoyAJj8kEFo/0pxR8L5C8ouwbHbevjHkmuU=;
        b=HawW+Igl3VM1MlZyGS5uifDz+zq/1ja3+8x6hrZB/52BV9/lVpn87HDsBvE4LF9NQZ
         IKjEq8xbR+90WUH/3uiVq4D12CLaJdZmfhYEZhMooqx8/WBi1t9JfkMFw/b5kpJ3fcUa
         ffYqRorOptooZtLNp35zUOOjki2rcUNACnz8Ew7xPcE+8ubIgk1xzF9KdkLXyzHT5O7C
         P01WHI4oSsSVVG+CtK2II97XXMgtiRGIwFj++Lntu9mrP6zk68NDtxX3lYouALkuMkHx
         1U7r9tn0u38AiHsy2b9YSuTTsi+Od+QN/VzT6t+E1k9iZx9E5DeBgFprhf3kQWEIdntx
         y6sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794852396; x=1795457196; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        b=kmfEtmJSUQOj12O65RS6VbY1Mw683v1ljPvF36Xaq8xyWwxLcE7Rgpv+P0xUSOOzWS
         CBohX4JEJNdoeAcC6jydgpFDt1yU41+HXutDjQAdyI8vLLYBoI/h4Emm3DiFQfqcNQUR
         ypxdcXFHdYJd6ZaX146We7oygm0fSjC2yeM8PoUbco8QbD2GyNZxH/fdgbsFR/SwJvJ0
         YDxEGIMYJYTUooX4Xp5OmSdS+fQ41EkMyu65zgulLxKykbDLEkMOPCpoBmrMKZQrTqxO
         KU7rr9M7eUtWKa9Fv0ia4lwZPdGN45eJodeXwq8zBsEC1Ei5SPQXIPFCGxuJR4mijPDa
         g54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852396; x=1795457196;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        b=bmt6Wu6e+59UlLcbBwm7g6CL0wk/EGCUgm6ORx+F4SNElN5fZDqPa4QHXEh5/abBh3
         17aVP9AaukAEixQ+hH3FcyZ1WedlZwOsjfQ83HUKkTbkewW/jKkUSSlDP1+I9mVOOzgc
         p/nRgnxB1K1m1V4rSUwq0Bab8e95N1FwQSzQsgQ/KOpocgC/Ug4O1DwWf9aufCw3dHyT
         tZS6btzLKyJQyIPZ3+QiJYSkPk+PGKpWB9TCuI/EexGaXG2XyYuuTrmQHBKeEqVoxDuU
         vwF9pt1moHuE5X/47Fp9EqaB/v9ZdbdTYbPBzx0qsrj+QVNtsNdCj2kRUqpHdsAE2a+Y
         W3OQ==
X-Forwarded-Encrypted: i=1; AL+hErEgSiIzRuIzEJwmAMfBUr53jXXNFkeK0Z8ZsSfUvmc6qGWPYNK2fWihsIEOgt6tYd4XAKq5FQnd+aAz@vger.kernel.org
X-Gm-Message-State: APuU4Z+GRq7BccfyyPtJ/WOZxvYLrPvMVUnuAT5tju9bg+DlYgOgG1LJ
	VOJ/DOw8WGs3hf+l7bmOKzNmdN1AH1Tc4iMwvSZf8bbbTqDPs3maegA95VKrpX3Fn3/6JgrBOwR
	oZdT978RkX2kk2aCjHa49IJM2PC36jgU9n9vC3yeA1g==
X-Gm-Gg: AYBFou0Vp5xPJIHKrrdAEvhsJEKaXIwBvWIOdbyYpgWKC0sJFtY9K+2Wi94+jIX0TCe
	Fr+HSo0zAdiQQujJCh3sX8Uz7bBUOeFuIz9YaVaGspDC2ju5eRw5ZUV4LC95nqsydOKtWpyBgd0
	EM9PBeIgEkzArhyw3qOzqN1nKiglGFSPB6u4UWqVMEME4IhgZR8YvX8JB8YNq5kWxOD51SwcEOg
	APmkMUzCsvoi+UxIbqGcV3nUHeE9xc0DugXfvYCn2+7QUMcmHEd88c9yOlmwpwVU5IAlkqwyvsb
	/jpbkuaJnKOW+9ONbar2a2kJHOw0wyZAxinNYHNUC86leBaU20ohxMPOowXVOlAn5YaZOs4IXod
	jtlZw3jENL54Nv4EGCOmmEw98l5erkfETV8WxyiN2QHWhrzm6DZd6zgydG6BEfloi411fFWSf
X-Received: by 2002:a05:6402:1389:b0:6b7:d672:7834 with SMTP id
 4fb4d7f45d1cf-6b7d6727942mr5514347a12.36.1794852396101; Mon, 16 Nov 2026
 10:06:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104829epcas5p13695795bc337b89816b05eec610a0dba@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <a7b901f4-59d1-4671-bfed-0d11f9e505e2@kernel.org>
In-Reply-To: <a7b901f4-59d1-4671-bfed-0d11f9e505e2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 16 Nov 2026 18:06:24 +0000
X-Gm-Features: AclHuK-FFknY5syd2Sq_iB3mSD9v2WzoQZ6qZmiqFZ7TfMDgzML0F8GxXx83h_c
Message-ID: <CADrjBPpecGbRo2PhH_zqGfNf3L=bNf81q3SMXnSvD2n0Lx-cbA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14 RESEND] Add clock support for Exynos8855 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raghav Sharma <raghav.s@samsung.com>, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 16 Nov 2026 at 10:02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/11/2026 12:05, Raghav Sharma wrote:
> > This patch series adds clock support for below blocks
> > found in Exynos8855 SoC
> > TOP & PERIC
> > PERIS
> > HSI
> > USB
> > There are many other blocks, for which the support will be
> > added in a forthcoming patch series.
> > Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> > ---
>
>
> Thanks, entire set applied (even if b4 thank-you letters show partial).
> for-next will be updated later today after builds.
>

Just FYI, there were a couple of outstanding review points on this series.
https://lore.kernel.org/lkml/CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com/
https://lore.kernel.org/lkml/CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com/
https://lore.kernel.org/lkml/CADrjBPoAVMdxgU4P+shh+9O5rGJp+m3sRQMDd2c-7zbJ8qhiBQ@mail.gmail.com/

I guess the main thing that would be intrusive to fix in a follow up
patch was introducing a slightly different naming scheme (compared to
most existing Exynos SoCs). The clock names being
"gout_<IP-clock_name>-<block-name>" as opposed to
"gout_<block-name>_<IP-clock-name>" that we have for many SoCs. That
also applies to the dt-bindings header "CLK_GOUT_WDT0_PERIS" not
"CLK_GOUT_PERIS_WDT0" etc.

Thanks,

Peter
