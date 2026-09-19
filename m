Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EFD342524
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827940; cv=none; b=fHmyDTEipUp2C1lA8V7xazF/8hJ5Cp7hwy5YI651AzbAAEfobvOBJqNZXcbnAIWKYaXpenGAphrLzvHeT1NDiVbnUhl+W9FcUG7Hm9GIu4hg1xZ5rAuwboILaI/7LumydhYnzRJ8TNawxBLHzvKcAthCsAA6N/9yAqHW9CkJtjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827940; c=relaxed/simple;
	bh=MXiWKKMga59CYgjF+JX/HuYbRMF4SIgIjBhzB9KdFlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNWvPWyxJabbCxBpRHhoaql5CZ3VuzvCCM8Pv6AthgRTqjezaaVw3wwtnevHVdwiaLVVWHDW3TwE+QtuRF8Yhxu6Be1wDBQLawI2NMEJoz1DXZnSNJFHJ7U8KkN6eWzfW0o4RbW7yNGvAgRuNLeA/D/0t1PBWShNzJaVTJGmx1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WUJOE8Yz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WUJOE8Yz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso12209525e9.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 07:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827937; x=1790432737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7shCbBzL3NxDtg4fCdmbNM7nlS/zl4e99x1q/nsZ2so=;
        b=WUJOE8YzyYqKoC0lgK1BYOOiRGFAVM6djLmzvzy4l65wej8x7yFTexCLN57n2qgfRd
         qzN6rjDEZuB0DAf1UXGMlWt1v0Gn9sBcF9qCgUXmJIWq36oS5Bcu3CsiTARMYK4dUWq+
         IKIrv0ekJV7nKA65Gy2xyBabd+dUwx3rTgplUTGLrcUHZyhVOklVjzSRgRX/sAIEk8A4
         1mQwIAB6vvlqD79OFH4aT+uI0XwPKRwNlYQAz0cxIqE+TL/wYUubgfXFsh3v9qTYYp7n
         42KZJKu5ns1lZp0rFJkAIxzNfFSD4rlPRlbXPWrwihkGksDJJreMkfv2Yr3lPnxPsxQc
         aQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827937; x=1790432737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7shCbBzL3NxDtg4fCdmbNM7nlS/zl4e99x1q/nsZ2so=;
        b=YyZSJI0neX90aaaOLCw2TSw/HZjCJGbMbZr5S05dWRAN5MBYCioRpiSTyRJgnza2H8
         EU2ZrRN3vDbXP6pqjilRHxLFfbFKKmmdyXnNfpX0qvOXuPSe9t3bKup9iEiqSe/reL4J
         XXsjlAQt05L6qFNsplmoIOMuMb/zBzUl19JjslsuccvIzg4G+aKNBLcbO7ntJGyIbA25
         fRzZoKL0Suel2kt1WuZLMzzhe3Oot1UiiDuTwtXYyv9aLW3avnsFMuxVDY8KA7FjUh/V
         ogo7H2YNFnhXPasjRZoVDHtB4yV2ZHgjo/QEcy2fl62JdmvoIsnlXOHCwX4a6djQLh7q
         JiAg==
X-Forwarded-Encrypted: i=1; AKwUvByTjtVEGai20NmoyWn1TG8rLe5nv/lgNzVa9vUD9TLEH5aKnYyRe+aTA3sa4gJHL328IaDK2rulTgPe@vger.kernel.org
X-Gm-Message-State: AFuF++k39PUEhjjeFlPoz7Nye1w1SZKYLHUq2ufcCtjGgsnagHuVvsHa
	ptmbfw7dQ/aAP4cEIDpiBnQD+Ckxav4B60+uNHB9Fgtkv0xoMXHGaWDfGm7MB9+TcIw=
X-Gm-Gg: AYBFou0ydngCSExtMgYM0eskw8IREYUQYxH0ltMxlLXb7el1iGUB3mhbR2sZi3ekc5+
	43DFL1W/InVsSvwbqmFbkxBX5qJrS0Wx+2jjDXaa1/VICmJICt+6+TK6hrbQqz5R9XIvwPpudX0
	ifdzbYi7roPI6aMq0JEEXuGDU0cPRzJqqVI9lX++bXsPFYPx35Qg5ufufcTq+gFLR5BQ5j66fC+
	EgpHTGs0pc3Hr4dk/wvHal7PavxiYN2X/54H2AuyA1mnWegFl6aToJ661HExJbs3viH78a7ydXx
	eCc0j0YV8hvnIqyLbVixykBm2QnKRydWVdLdh8zhp6xIKvLh49FbiNBWP6qxmhiVsGi7udQDaOL
	b8w+A9CwYJt23QacBBgkzyLRpymabfKn6Bc+DyrPoprT0KkHhOp1cAL2r/opjCh315HLuwEtAyn
	FGW+EanET04o/GHDsrDiVP7PqF7zp3P2zIgn8ZxRoM8u/icmRkdUUgAyV7jrrcR2DiJf9t6pbfs
	Rq0yIeBhvgJJ9XfybdHjld1gMe6br4zsIEL/qVWpyFUJv7H7zrVk16GCNaqmpemeA==
X-Received: by 2002:a05:600c:8b35:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-49fc572f15dmr69026285e9.19.1789827937433;
        Sat, 19 Sep 2026 07:25:37 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bc15esm53940005e9.1.2026.09.19.07.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:25:36 -0700 (PDT)
Message-ID: <c173168c-f3a1-4712-b093-b49b5f798e13@tuxon.dev>
Date: Sat, 19 Sep 2026 17:25:35 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
 <20260828-cpitchen-mainline_gfx2d-v8-5-378374559738@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260828-cpitchen-mainline_gfx2d-v8-5-378374559738@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/26 18:52, Cyrille Pitchen wrote:
> The GFX2D GPU is embedded in both SAM9X60 and SAM9X75; enable the
> driver to use it.
> 
> Acked-by: Nicolas Ferre<nicolas.ferre@microchip.com>
> Signed-off-by: Cyrille Pitchen<cyrille.pitchen@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
