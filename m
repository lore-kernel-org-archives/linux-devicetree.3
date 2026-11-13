Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586457;
	b=iVb1eNVdUV2P2WKmWWzWuqt1dmmOF0U3f7891slYZIpYqRJMfTMNpZm4BvQjpWlFys3j
	 9A2p9NbassSssqH8SgEWNFg24arkgg8y6ucvbCjBCOaAyL/slix401jdPRR2nH2H+ptQy
	 +eL+Y4sqVErt91Tifyw2qrpHJ2EpwlNnZRfmElx9DU4KkjuKmU4HYTjzhhcKwk5x5uRRt
	 uLRnarA9pZnXml/lc8UOiD8L7mVweOxXAb5+ZPvF6ZNQo7efjFiGgY34sP9pVOLy6MLB0
	 U8YOTUzyz+yla1nY97jIsnZFotuWTfaFKPbKjQZ0QDztqEZjFicy5GMN5dj9T8rYeow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dNTZCO6CVD9uiA7Rqib0iVTPKHOWhKLny7CTKnD008c=;
	b=y4xhSTS4vcbP0kg4jA98SdvULZyZzCVVeKv16mIDZitOMdNTJ9CnT0P5sCpCOAqoq9GL
	 nXaRLpeI/e9I3DkkoQ4gh5ib8Yvg/V5VyCGnw0p185WGPc+AsmNaZFmJ48dNCev30cQO+
	 zFmHTlTXoG7evVK/O5GpYlXhaaws21xYkrYIV4cISpvmThRsOnd5CswekjGAFKHqe2ST6
	 2+HnJaUlbBtdDe0ITdjejM1trkhCPrPFgYtraZydRown9TbzZBfsndbbh9wn2m7Tu+K3H
	 0PH+Wr4xSIBqPJHdLCvBv3cTFDIjo5Af56m/VtRdhyCyAHaIgdKerZs1n06fN14CBoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9aEphJh;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47DF606A896
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47DF606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9aEphJh
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-860f8b7b943so448617a34.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586454; x=1795191254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNTZCO6CVD9uiA7Rqib0iVTPKHOWhKLny7CTKnD008c=;
        b=w9aEphJhxN7KRplF0AemXK6zfCEpZm7MqmDAaYAKTs1SrfzT5ugoss90iRafy9F9OD
         hR92TRyq5NjVfe4DDgIGkXrwOVztZGdvedhTy75XiVPMkt2+LVuahYxekXX1kzdRWCw9
         PWALAVHUS4ZEjxxsDiq3DFc9Yhhw3BxyWXjX+rPSdNklIfwQXmd9sFK9OxwrDOEDZQyn
         Nv7BkWcz7Gdc1Pph9fcj7zW33bbZdF6cYaZnELCjV5lLleY6fQxt4SmZ2RrExyoXq7/W
         z7w2hVUfxwkJwW2GjWkxA3asMKrhe3iGF39F0rgYowhRDYWcm9gyWGVn/bxZVMeh7ikb
         o3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586454; x=1795191254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNTZCO6CVD9uiA7Rqib0iVTPKHOWhKLny7CTKnD008c=;
        b=c/S0V0zNJFt3F/QdZ2M5wngscXku7zZDcQQjqwpS2BCbiunfpAiMsFCj+PC6T7OgYz
         nc/aUSNjKqRb1m95p05yuaKsBqsZMaERIouHnNNLxJnm9rwUFsDHnPY9M7q52TrvYYXI
         iBXmzMRFmFcQbKoP8llcg9yBscLz3e+fkY31P5o7qltnAzP9h0D32Hz8rW7JU1DDAoHt
         F7PQWhx9aliCr5zKQXmsoyUMdG3GnxJnefOE1QB0Pn1M5Dir+PUxuYwP0cqUAAeGZ+DG
         C4ok3Pdr5O1Nd9C+5+tbaHncXArXp0U+DQKi4jUsIG9U2ABmAlGmhIxbYfFt27AjqIfj
         XDrQ==
X-Forwarded-Encrypted: i=1; AL+hErHwBeN82WitZEL3F7JxnZ5X67WBSh13t2GVfZ1LVdMhg708+6MWRGEE2vM4Bvy7gzHLy+AsOVh4PbTz@vger.kernel.org
X-Gm-Message-State: APuU4Z8GaA4mwMX4pL8F/1JtgHPcn3484in4rLqtajbPUrI3WKRfQhKI
	HkR/dNGcYLFKLic19Drubvc9zTKnSyeL9xr/3VVWiK9InjJ+nsyhhymz
X-Gm-Gg: AYBFou39AFKZOKQd32PnUEsh0VOMtZOGg5Cr6t7tfdAT4LcQOc6RIleJdGAp4n4W4Xt
	STbFG/cgJYJ2g7j219/B9wO45+6NhRXcS5VBeFyWeF3JocyxVDD9JM//Mql0nSqBiZOCObB5Wxb
	5ejktTG9gLlrfy3XPzMXQW1VTNnBW2k4Y3Fipo8ZmHsJKUcMZCZO8YtZI4SatS8qmBSKHZ5An+i
	ee12u/I012ole8BcmcGSqDcs0KFpemZp+41mJrdsCEuaEsmm7q+vxkpTAeMxn2H9uIvrsmdXuKx
	by3/lYouXTqUsv8IG/IAfWMV1oC/yuJz5Y/FI7vs9c/PnT0L0ybGG+G4xgTgdfNGl6iBy2V9Dmu
	A+4eZTqi8QL4kLsNjbOlHMvVUGn27Ld7AG6IFRZkq5+ykarfR/gggE1djJiNkpZ/5YTd1xp7pJx
	CZdLPqOHejm05nNssqqEZ3X9kQFVVE6+LjjOjhWdWNE2kGIkJErCgUK3alo/MvUFXuylCO5rTVN
	WPoAPp9u/ci9Y4wM5xyHDH4M4WBlBUoI43R4A4OFfp5gzZh+iK9FwmORhZcOJwScPfBtyErD1KS
	rgnfDhv7MbGm8jRYZS11gaA9OWTHUxRCBzNi93H5auTSqLToSbVenKm/8Fq7Q8iMb1qPvROGRx/
	6xz0Gfz6WNGO5b/JNF+Q=
X-Received: by 2002:a05:6830:3491:b0:85d:6045:52cf with SMTP id 46e09a7af769-862898c8b4dmr2468232a34.12.1794586454518;
        Fri, 13 Nov 2026 08:14:14 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628813346esm2668473a34.17.2026.11.13.08.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 08:14:14 -0800 (PST)
Message-ID: <36b0b778-a5bb-4b85-b36d-d4408c3ca6fa@gmail.com>
Date: Fri, 13 Nov 2026 10:14:10 -0600
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: display: panel: Make DSI panels port
 optional
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
 Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Cristian Cozzolino <cristian_ci@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Nickolay Goppen <setotau@mainlining.org>,
 Robert Chiras <robert.chiras@nxp.com>, Alexander Koskovich
 <akoskovich@pm.me>, Marijn Suijten <marijn.suijten@somainline.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chris Morgan <macromorgan@hotmail.com>,
 Barnabas Czeman <barnabas.czeman@mainlining.org>,
 Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>,
 Arpit Saini <arpit.saini@oss.qualcomm.com>, Michael Walle
 <mwalle@kernel.org>, Ritesh Kumar <quic_riteshk@quicinc.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Svyatoslav Ryhel
 <clamor95@gmail.com>, Danila Tikhonov <danila@mainlining.org>,
 Jens Reidel <adrian@travitia.xyz>, Michael Srba <Michael.Srba@seznam.cz>,
 Shawn Guo <shawn.guo@linaro.org>, Alexandre Mergnat <amergnat@baylibre.com>,
 Alexander Baransky <sanyapilot496@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Cc: Romain TISSERAND <romain.tisserand@gmail.com>
References: <20261113084236.53336-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261113084236.53336-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 2:42 AM, Krzysztof Kozlowski wrote:
> DSI panels can be placed under DSI bus directly and some of the Linux DRM
> drivers will work fine with it: mipi_dsi_host_register() adds device for
> such panel and DRM driver does not use OF graph to configure lanes.
> Examples are Samsung Exynos and Allwinner DRM drivers.
>
> The Linux panel drivers affected here do not use OF graph, either.
>
> Requiring graph port for such panels is tying the binding to one
> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
> requires the port.  That's a mistake, because:
> 1. It prevents usage of such panel in DTS for other platforms,
> 2. Places the constraint (port requirement) in wrong domain - the DSI
>     host needs the port, not the panel.
>
> The port is not needed for the panel hardware to operate thus it should
> be optional.
>
> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
> Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com> # renesas r61307 and r69328
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Ryan Brue <ryanbrue.dev@gmail.com> # novatek,nt51021

Thanks,
Ryan Brue
