Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944122;
	b=gk7WuwCguk5Lt4h/Ghj3jYhw+zgrAPtDmC924UyGMKeJBDYWN+N2OisddEC3+YkT+Ik6
	 wEv75ybaK0lDrebtKCcBqnwWG6mICeKWZ6Qkno+rR7FKxLRT6RI++nsJ0xoidZ46O0Fdp
	 VUWUjbFoRXx+4NiFkTrejo7dUlQIl51ks5XXA/K1yEbNAa6Js3GsU0aC2B5bGLb/g/WGU
	 JLBhkv/Z710HZrL/tNvMOmls7MCBuhjjNSc6m+3qs2teDnLpw+xfiQYDhuhGjWssYy6ru
	 TdyQRPYoYQdSwJ+WN9IGTmWftzoAztJs3uZzebMy54YHBkstS+qNewW0YtdPnqwd7ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944122;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=zZ7VovX7jN4uYMkhQWyK3ov4JdFyFshspRex+aWFMm0=;
	b=lJ5HLWYtke/2cdeWQQLpxWylYS1DEJqWH9Kz97BBop6IO2lDh2I3v5hEegp4dALSiGrY
	 y1OGMHSPTY2T6XVwWFbtokKv3UeHYUI6LqrHGb3v8fw/La5CYdg+3RYIClLguyEZSKE9K
	 5YAJPfndUZzOMqMPHgb1uO9QERT8yF5F9VLflWbg4SbZ1myZLI2sPOIycTYYIpjRv63Ki
	 MMuSzEsvoFyPBaska/59zw+fNym05gI7rmRSlIO+F9JrUyZ9+6tmzUyilJ6qa2tBghsii
	 eABwvBBvnCt2YMsiultluqLFb8bQ0qz7Xkbt2F+utmiySVmByZpzhShHaeEeNilT2sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6C8606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A6C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso34170a91.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944121; x=1795548921;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zZ7VovX7jN4uYMkhQWyK3ov4JdFyFshspRex+aWFMm0=;
        b=syVyEg/HnXBC0QzEjOZv3KnkkL0wN6icXxkeVux5Cnh9u33lz4fJ0/LyT/6lz4saWM
         fK2QdX6Xmn7m3uUY6v9krbdJzHqDHlvh1bofjiqUB4qLg5N6iR9WgDkDYoO4OSThrvo2
         sf6Np8Zw7FkXUTnfbmZPL/RZV7136sI7j/L6fqrE99zFYe9x3pngk21tbNHKAUn3mtC7
         WZB2VHmiJ0SkxUgYSLOKgmGpulGpATO171HpAojKMB0gmwOngscNwHA582uczWZBAkxa
         AbF3aC9W4jnCEWvEkNjndU2IJcySSVM41Ayu5jFQnTeeCxxyzYESmYkJt/5cV7aqcTP8
         CAeA==
X-Forwarded-Encrypted: i=1; AL+hErHym0qP3OfKSJRIqeKoJWcKzB2jEjUMLjUQ/xyj2YI1130mGYIhbFEOw7ZbSosrDOxop63faVQSkw0u@vger.kernel.org
X-Gm-Message-State: APuU4Z9f9itAOfPEi9hHDKTP6SDsCdGRp651fUfbZ9guBkN9UxiMyuzb
	QZUX7SBZ5XGKVrXH9ijNEI/xgopE53VXCKSSDYWB8g8Zx8CJMSZ5BY0giZ46nBXn
X-Gm-Gg: AZFdTZd66k9b5fK61Bm18S8WR/GNOGyyhE7fhV1zOjVGdGs8yE1kEC5msrMCzK6GKcj
	/2a20xIBSiwT758LnDplJC99M28sooZEnSb2MYBd/DE3rRn1WkQB80Tp2tk2FsUCKDjugIBhPBI
	NEIFqtgWwbMndAStX+ERvgY+H1vrCWpu0XjSRhn6xErg76DmBUQden/IQaf76NqjHiwyZmS81Pm
	eVq5+RpZlFYkHMTCKjo/M6ajMXS5SE40QHFPaUwNPjaCZwboH3x/Yv1I8VSqZGMaVSepNo/cIfv
	ESwBaNWPh8mUxXC8sAQu8w6bmm33EjgUtdkcxfkO1in1FO3fpPREQehzTdzGo47CdaR/pTq1nQE
	1FNxAnEuCj2G4UExGF21IQchy+XgO/6TgwFKgE3LbTrnt/qQo6/jl++ZPm+ec05/jHj03ntkxui
	VsWXtMkGPnDBU4UMHycXdvdKEqLnSokzimAsbU3xRlR4NdcK68k2vJdhnHMFvYw017KUZ9HW2lf
	ZG1kKTdeXzwWZm5u7TSKd8hLJOsgb52mkwuZDmDw+32Oa/1En6M01tmKkf/rzNFJZaWduiG4uUM
	/Zwy3GjFI3bPOcse7n5SC9yaMqgVxM/5d8/J+VBgzArFGpSEZlny/rIIt1kiVjKe/YV5Q+I7ZGZ
	/QYaEcMfFs7V20jMe9TcYpAHPkw6gfz30faXiSElq
X-Received: by 2002:a17:90b:4b05:b0:3b0:968f:fdee with SMTP id 98e67ed59e1d1-3b3d07ca11emr441511a91.55.1794944121438;
        Tue, 17 Nov 2026 11:35:21 -0800 (PST)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com. [74.125.82.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac6016c3sm5425126a91.15.2026.11.17.11.35.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:35:21 -0800 (PST)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3acec6677so327088c88.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:35:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH3s+GvgJ8ggdyJDxGCO+IOgF9ATlD6rStM+1kmiSJY0hoK28v47WKmQnRdFvDbEH7eVFt78Al48+YC@vger.kernel.org
X-Received: by 2002:a05:693c:42c9:b0:381:4b4b:f96c with SMTP id
 5a478bee46e88-382827a7dfcmr296117eec.34.1794944120695; Tue, 17 Nov 2026
 11:35:20 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
 <20261116-iio-ad5246-v1-2-ef6b7c06d4b0@telaak.dev> <avwMpV3sCvMQNA0b@ashevche-desk.local>
In-Reply-To: <avwMpV3sCvMQNA0b@ashevche-desk.local>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 14:35:09 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7d4uZepoBqEJVcSb466fP=ZuRs=zREAcb3DzjvDA8Bjw@mail.gmail.com>
X-Gm-Features: Aa3M54pMmKLdjA0jFJLnsDDkzCIUJ6YpdPFI8j8vMI3OjOODp7f3IahMKvJGlo8
Message-ID: <CAPY4CJ7d4uZepoBqEJVcSb466fP=ZuRs=zREAcb3DzjvDA8Bjw@mail.gmail.com>
Subject: Re: [PATCH 2/5] iio: potentiometer: mcp4018: Report the available
 wiper positions
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026, Andy Shevchenko wrote:
> Take a chance to add missing headers at the same time, id est
> + array_size.h // ARRAY_SIZE()
> + bits.h // BIT()

Will do in v2.
