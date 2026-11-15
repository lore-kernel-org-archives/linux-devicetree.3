Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704334;
	b=N9oAFxXP4ZFsau3CShRez3IkEXi0SkO1k2gSKE82WoIE7YZHCOgo+i/NoUkkXagxeJi8
	 E/5aryeTrXtRr+jFB2+n4AHDcd9jp2jypx6sH0Zu6I7mtXwShY2kDLmU638kWkP9jr0tw
	 sK7A0EdXxQOW1uBrtd1uQXs9kpMEoBM4udeMjhbLagCjls7uaD1uCtoXlrCdUErKHI4eI
	 H5n/rTpxKjD9L3YRF42bsN3ccaB4Y1ZAX9Vdu+ptQyPp0o1XSyf81B36v6GKYaXTHynGb
	 LsUB2oeDO72XEGoyVarivNIIOzlB2FvH7UKA8RY4nSc76MOc16xQsKQxHfBfKE9uSBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=;
	b=C2NmLMsyT0QkjoW2dkFrZYH100ddveOIwcCd5GAY3l26ImLja1JwrDxfIQsjrGfyC+Kx
	 +2hlKMmequk0FtVG2OIDkwFFpTTV9kjFVeRUwUZJhkiQJi6eQQu95XYML8gADNiBtPmpW
	 QppQ0BDl9u6Ve3ShMW8NX43AtXRNGHvt9tGBD+IQ3sFeVi/bAeqc4Dsjuy/AU9I/zTgqr
	 jZo5bScUvkqtAVHyjSEK2t9zeDgv1gWyioTf7DyfgM6yvAr98Xhhy7x3HlUbgbyRhxdVx
	 RVfBD6wT5ng0POhVbt6hGW4x/CgC1279VFGk5PxO8wNyo3DHUr352nsJsXVeU7FXrxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVLoFXwq;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEEB606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FEEB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVLoFXwq
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2503924c88.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704333; x=1795309133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=;
        b=VVLoFXwqulWeucnw8PTyUoqoKo1n49Ix8VF4rvFKoBGKRxj3TB3ua9vgyrgU4nL2qi
         PmkoJxjWcOIms1fceHg+BzbYP5MEl2G9jm9hFUHK9J4QhiCX8Kqo8m67i3mnnhzTZLXu
         B7koqJKt5c7cKnQFC1prGlQO4bQiXQ5S76HBq9ky8BOQEcznfXKRoOE9o8dtxJKRVfR0
         jGKlG50HAOdRETaAeo9ct3E1rJju8j5wA5dFycvcn+bvJmkq1Jt0hWkrHPn7nj+pzTI/
         jt/0qZkh6VIukufGj8bLAWqdzfXdUBhON83OXlbaGjqI7UH1Etad5mwVsjEeyePuQ+u9
         OC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704333; x=1795309133;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=;
        b=njvje7uow4Na3aR2M9XrkyJUhISQcUIPWYllKw8UeKxGMToK/FWgdVPMYkurcCkNOm
         Jiw+uqJb+hw7PrZaL+cfDSUCAyFNrn3cwdItOi4QYc8G16CJ0h+BwmnOuaEHrHJDrPSH
         J9VQkF/8oWKdtvhqTGIfYjfA30I2baEVgNeiIEU9MappFfXtRjgjkMuM5729alJjXmo7
         0F6HfCRYUgXENOs1uUlxJMJxWtHmbvmOmAPc/C2GF3SmrNafvcqwOQ5Q8rlsL8WQRooM
         uVFsivfN0g6mjs6AKKwdtkECdJI2DJ4LF7ydFZzdTkmGNkb+3e51p2ey2PZCBUoXlLot
         DVzg==
X-Forwarded-Encrypted: i=1; AL+hErHwl26zf17jxu5BebGJKkAH4FNgizWnnH1ef0lbgjRLwgaU7XgciA5Jcc+E4XM/prJ4gjy9gOFlIA1d@vger.kernel.org
X-Gm-Message-State: APuU4Z9UchtPDLdv4YVUCk7D2d2fWRI+u5PtxFihLb2K7u0jHDvPDHYv
	jexQ2D2rlGEI0mM5eqPkUyRb7x67cxAE8Z5nH6lFnF3GCd8+KC4+hwKd
X-Gm-Gg: AYBFou0HZN+t4msu0WhagQGwHV+6POgiLXA0z1mlx/6WN6ldc5n6QdcE4iB6ryHGZCK
	pYmFHdSaDkiLjtDTkRBV6mcc5j+c16yOBomCTWS+2Lyw63fJNRnu8kqlfu5CVbv6Wakhe8584n2
	MlVrivPlZf32WWH/RaGKdD8+EoYvrX2OEZz/3XRIHKy3M6wXU+uLY2bTmJxxw0oq4GL6+BdrVCq
	TfJZzEAEBFxqY62u1dnfZKfMQGRyrpg4lp4ZqkpAmBSaem9ZOhDJ1fBmcJ/cGSwDKIAK7pc37ss
	q1ZyYWq4B4YQZ07/HJ7kfW8etNDy1R89/s9IrSNh5KT8Yfjr1Ila3v7ygg0i4zVAR6LIG48KsZI
	TuiNNvgTnHNV61NI7Yu8o0BHdhMaLClT5FSkac3okjpiqH46RCBG41I8RiEyUv349BHLY0DwKYt
	zaMdnU/W2RmNW+r0O5cYeGhPsMgBo5yNpu0Pmywy4HbNhF+4SydTVDnG/PnADvOIlHxqcS7005N
	UsBvEPaCiGqNs4Wv0+jxGJMUfBVUHYrBQ3ndmAnD/BGp24Lhld1UPijiT+iHYQQ2ECaGF6pznlb
	Vp7xfxyi0si7pjsxHNW7fuPsUGBgEO+1+Bwez0HoGiKejuoTnA9y46F9LVwWh5rdWYk=
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr7375931eec.8.1794704333340;
        Sat, 14 Nov 2026 16:58:53 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm35679526eec.21.2026.11.14.16.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:58:52 -0800 (PST)
Message-ID: <0f536451-9f7b-46f7-acca-e10e54dec37e@gmail.com>
Date: Sun, 15 Nov 2026 09:58:48 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: devfreq: event: rockchip,dfi: add
 rk3576
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
 <20260921-b4-rockchip-dfi-rk3576-support-v2-3-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-3-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 6:15 AM, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The RK3576 has DFI hardware for monitoring the DDR's bandwidth much
> like other rockchip SoCs do. Unlike the RK3588 however, it only has two
> memory channels, so only two per-channel pclks for DFI.
> 
> Add a compatible for this SoC's variant, and add it to the conditionals
> at the bottom of the bindings file.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/devfreq/event/rockchip,dfi.yaml          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> index 3450e28b4020..dcf3bbde3e8d 100644
> --- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> +++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - rockchip,rk3399-dfi
>        - rockchip,rk3568-dfi
> +      - rockchip,rk3576-dfi
>        - rockchip,rk3588-dfi
>  
>    clocks:
> @@ -64,6 +65,24 @@ allOf:
>          - clocks
>          - clock-names
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-dfi
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +      required:
> +        - clocks
> +        - clock-names
> +
>    - if:
>        properties:
>          compatible:
> 

When I applied it, there are some error.
Could you please resend it on latest commit?

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
