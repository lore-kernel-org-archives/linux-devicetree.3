Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123875;
	b=T+kCl4/8LKZNvOtk8D4n55cOBbrJukpSG1T0yPUTJjRaNzahsxweWvgsPM6Et87aXGfz
	 w9Ztr/EnOCOognzQN5PK7Pua1iGd4MkzINiGYW7JbYAQBi216LNXaEoUSWqmLT2Iwqw3l
	 ZMK6kELzGMtJKDbQApkHR9yDTeeEgbIcyQ2QzrQ2wiE/ad+dHYeyE/eVfT1qoHKQTz+Lq
	 ELKPhUUsJjS7TOqQX7Y1ml4Z2HX2dRs7JnDNWJBaB3e95IeEtqstiEfe8aEhpJ5WAaGe+
	 m4lwAHzaYBA4J392mosTQytFT9/KYAfzqvyDbQO+JjiLh2vUWcN8hV26mS5de+icmDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123875;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=hruHLRUy8gnh1Vnhks0wNz1gcOtf8ACiLDMpD5iWNyE=;
	b=BUlFyl8Di6E2Bcu9ujT98a/PXxYXfRkRSoNo738/gVSptyW7YMlTGrvqhFLwgQKe3tST
	 dSMhtJEclMXL0wUMbUZEZOFnjFrU5+9PqFNLnpaYoy+I1OkU0ktM9MEKj2hK9tv9VBPM0
	 T/4H+9KFJAlu4LRzhDOEya5Ij8P56iBe0sOUzV+9RPWfNyAc4Me2ziYvQgNhSqIP6VrKW
	 jfqP/WkT6bJ3U6mkmB+2aj5oabkErvdvtlTAOS1pE4v5tMK/n/UnaBZ8SDyUxX/3J/ddi
	 Wx/p0lkO0B5tt/hGpmUqueXw/EUR13JfqMuEjzZV5Z/EuVVw2u/ogZPB63zl2QLrbIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F54606A32C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 21:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F54606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f01f296937so1594265ad.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123875; x=1795728675;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hruHLRUy8gnh1Vnhks0wNz1gcOtf8ACiLDMpD5iWNyE=;
        b=yGHtjkY7qBokLHQxYMu+WjQjaJOmvFPSikx2M0L/Bj3+lmqSfHDtWKjXQt+kxZKBQ6
         a4SXuLQbnr22ZuclpCq9hB35C9xoa9H+Rb7TllNwn00Enn1e7XcwTyMJrMi1gljEyDF+
         roHwGAVH6AU6e1tLP03618yj0QAuzN7TGPrsaOONgFEhbB2x/l5EXCb7uJEqEchDTTEK
         77o6itJT82SWzLhw3ISMTxKQYxA6MEyl5SzBeJAsSeyN9whXWzck4EzJ3cs1mGQ/nuH5
         43zNU1h62Gv7zAdEOjpKZYBk8id6NjpDAdZYIbMgz7faGVh5ga+yKnMuWNu7XWiYDCEQ
         dlDA==
X-Forwarded-Encrypted: i=1; AL+hErHxD64ipCdSuSJb4zuy8rg2NO2egIbBtLo7Kg9BODAlbrQAqRVhIF3ipnT4iZo9UF2K3yINddnJ8J3H@vger.kernel.org
X-Gm-Message-State: APuU4Z9le57tnTjNHxP8NW+n42sI0ot6k40hG/2/xBY1OaFdJrr/RRya
	qunrxFxSkTdd9z2Ip24JjWVA2odfrYObTQjBT5FWiTwjLvBsQECGymzJK0M+jEuq
X-Gm-Gg: AZFdTZfOqEteHg8LgpurlY/Z+rVA4fDfWEV/iI2ZM3Z1MHMMipM5BYy7wP4MTr7B3gP
	2KGYVUqERhoLNBRD74ugF4FmlZgDm9GdIZ4S8+gghfjrWMDBJEXpqaP2pm0bjNPO0y0on2UC++X
	pW9GjSb3HtNe5F8M7H1YQtUEvrEu2SboxhHvF9wy8TLGxsqzMCylGJkC7BH2nUlEhl9kVn9axOY
	4cC++d5dokivUUyn5Hhn5lCN/NOHcFa/dkm5SJk48bI8/oYxWJliWhrnuWo8nCzzpxU1H1bTNr8
	Bw7Ni26evZiyZ9FkKops9ca3lYci7yiyOsuBRrKiqudt485i81yrUTuwXa014FJWRIoBRvM5dfr
	zQCKDVzoy+ZWkGZj0BJbNEIHFXqJ5QEzCY0HCxyYOCj20wrFWlTohueIIuUzmiVum4aafY6C+US
	qkIFsm/ewvccCH86p6ZcPut571f8GaALBhEjw9x2zICZoGUIqJuSfBUWorxescxZ9BVQMKqMOqC
	IrcfqCYt3mIF8tv6DNpzyJhGC6GVjZSJP4N6zP8YoCdToN4IzcbsbZ5I1xtlAHZHmP/ef8dBt5T
	6VPEVSMTECnnreoUGU9GOWYFQ7fTbcnmcLplac2c8VVai1ksjm2iaIIdeZoMpsnQx7yXLPXCm98
	I7T6ge9yfzkJ+ODY5dDnvqgQ7Sta2szp1LrskcrLJ
X-Received: by 2002:a17:903:19e7:b0:2ef:e8f2:ba28 with SMTP id d9443c01a7336-2f03f249c83mr10523205ad.36.1795123874868;
        Thu, 19 Nov 2026 13:31:14 -0800 (PST)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com. [74.125.82.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c184bsm4963335ad.14.2026.11.19.13.31.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:31:14 -0800 (PST)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3b4944abeso204478c88.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:31:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHwWS3WKAM+JQiWGsMaLOSF41USYM1ViI+SrG6Zyg37YK1CguCn7FalHKCt6PeLm9+h+acbBzJOLJal@vger.kernel.org
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id
 a92af1059eb24-1b55689fcb2mr692433c88.12.1795123873153; Thu, 19 Nov 2026
 13:31:13 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-sf19a2890-sysm-v3-0-b07bc7833a87@telaak.dev>
 <20261116-sf19a2890-sysm-v3-2-b07bc7833a87@telaak.dev> <179511480695.279474.4521829214953240997.b4-review@b4>
In-Reply-To: <179511480695.279474.4521829214953240997.b4-review@b4>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 19 Nov 2026 16:31:01 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6DjoKi9v3Bk0Pt7ePRW_yiNiUzfX1id7efK8i8cUWFaw@mail.gmail.com>
X-Gm-Features: AclHuK9xGZquR5VLNTlBltqHkPsM6MviyjZztqAp_KfvV7PyzlZVlXCSmeqvUUs
Message-ID: <CAPY4CJ6DjoKi9v3Bk0Pt7ePRW_yiNiUzfX1id7efK8i8cUWFaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: siflower: Add SF19A2890 clock manager driver
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 02:00:06PM -0500, Brian Masney wrote:
> Can this declared as a regular platform driver? We are trying to
> minimize the use of CLK_OF_DECLARE.

The MIPS GIC timer runs from CLK_MUXDIV_CPU, and it probes from
TIMER_OF_DECLARE in time_init(), before any platform driver. As a
platform driver, the clock would not exist yet when the timer calls
of_clk_get(), and with no clock-frequency to fall back on, the SoC would
have no clocksource. I'll say that in a comment above CLK_OF_DECLARE in
v4.

Joseph
