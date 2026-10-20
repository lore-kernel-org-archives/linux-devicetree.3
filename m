Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460455;
	b=az3x9F11LDm9iQb4kc3xsn6uGpUuWIB6wjqipvG1CKSWoloM4uw/jRPBf4ozl0HkYAwl
	 qTxo7vkb6hT3RNBFMXVyp62VnpF9VBQaW6q+5ufj3Ap27JekR0H1GJSWYArygx5yKKxUz
	 dKx1qX8BNMlul+a1IrZtZttaUrdzvDCZmYqPULMSdbOojZmZcboEMlT27FuS1flW8kFtJ
	 VztZF1hthgBJRBCsEnZXhaEA4oswfdQ/9JjKo2HHOHd/EnHAjHGi6utjAhQgEoXDOvesB
	 Bl7CD9dwUfmyrs4Hkjk5/L67fAyUxl6hNQsGxq0HbPgk7kvbOh/nnB9J82EVc/jkSZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=;
	b=kByM2JBOp0I0kSwk9W6bgJ76Svk+8auc7n+oFN2M9WBE11hvCh9S33YzU2SCqOmevfGn
	 eoeSdDOAZmFQwJixbCbren54pjL8+8gNhINwntb6YXHZ3ngMyMvoJnGMQPNus4tcZIgpc
	 EC28yzguwvfJSfc4wq+B4B3sVHboW7AyIv/N3h2BXXaYakwEUXw8E8Ij8zFsPocY9aC97
	 A4vZ89n4WbBsoeH9aYPwPYCPc9JwNvELG9tr1ir9dy9BidWMXgNZSkxjfzY612e5NvABC
	 Z7vF0NPuOwhX8u6HceQTwe9cvIaHy16NEOtjjR1XkkUpn4UueWl6SSaahImZfN9ZQrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yw62Pw4s;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521E7606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 521E7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yw62Pw4s
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3514b90bb89so7153584eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460449; x=1793065249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=;
        b=Yw62Pw4sArCsnM4IdWA5utZbwB57JnrIB/2ksf13OnirkbBAHxX5H6BkW38Rzv38V9
         Jin482MenoCD03jbOZlXql3n0wYe8AzMAabGsmL3kspaZexEQrB1Z/FIIjVVaOLNSFMV
         REXeQKHygLmkr1iDNCPmH/vWXmy40RIxqgHqjWwBfnqAJ+tVBjH2Cza0VX9bb6OubqNu
         J+VoR4I5sGLm1KHMh8iKnS+aFN3TOnDt7AkFQRiqD9Uc5+gRF0fKtaaTiVl2T8hQycA/
         EkdF6tf9SBJreYCotdl8RwOB+iUxY01relrAtgBZBt8B21DI3/sXa9ZG4QOUg6yiKNDS
         E0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460449; x=1793065249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=;
        b=ThmS5Zj+ZYP8klGlSrRa6csYARQTKuUCEpPkrQo0pLHM0Q1+ozIIOZypIJXjfmSxSS
         X5NQtSDh9MeXYRBF65hj4Y7YIkC6EtB9wMxSLgm1YhKzqXvaVag9ktyOxc0J61N/C5LM
         XCAfRE9MiV1oAB8UmeCAbNyB5CkIspsDLTFltF5m+KjRknhLm+w/WA1Dd30AX/eDAQlf
         ESh8z/3v5bQe++oMAmwnKnxkle0XELLo3N9+kZpeE1CpJWQTl+v4Jx/EPCVhoaCs7dNv
         X5+xCa6Y/4s0hYKqRc1XCSKYrNo0TKRYsFCsjV2WXOkShfq/kJqEQN3ectDgT/1y7iV6
         TYFw==
X-Forwarded-Encrypted: i=1; AKwUvBxAX7pXqKdOVOCaijHhFjnWYAwVJa5NjVntEbuMG407mLn9AAMxTt2mVfQgZCRxnF47G1qw83xP6cz4@vger.kernel.org
X-Gm-Message-State: AFq9FYKBmNJHAftUh09HAeQ8sweEG2cMimMkGnty2AhIJEEUijh1LY7/
	cW5u5Q1zOYhEoAkMaHTjJRqvC1n9L0UIgeJ5QYwAI9FP+oxw+DKvXcwt
X-Gm-Gg: AYBFou3+tq+qUeSHaAdAoxkYD2ka11/4eA5DreKloLwgvfFmIdi9VyNtgcvB1yHYlFN
	DpkzbeqLAvnuXwgQI/RY/klH2xuIaUiOXbQZF1jAc2FfZR6DxnDEAApYNVUmh/oIimpkCNr+k2d
	fmkFfZTbAUAPv2Affz85kixnIuQcdLE+8Pi0HHrg/884KTlmSOyswNkQHtbsFr02O844Kx4pdiH
	GQixgn0aF8ycTspHGo0xnnRE1JY4m5QadvDF25S2ptABRsdzr/Xx1s3Scaz06Cb681/IZDnheqq
	CqM5Uqb0hT9T+08JZXSq0QPvty19MWkxjHuEFTgQuIwumN6l/HGhEgVdNscdyARVA4GGpMan37v
	0Tf5N8NHP0LZN78gpBP3S9UVOiFRhgFjNRzrdbNTs0DOvuO9uLTtaYaw5GfA6dDhI2TGMDnBDTz
	q+HS3UTAyyZXAjMVrX4IpO0fnT7POo5Sh6GfZOd3XdIcClPsEcWVitPAQMxOnmrI///Q0C/N6BV
	Moogb67AMOb
X-Received: by 2002:a05:693c:810f:b0:353:7d17:9a86 with SMTP id 5a478bee46e88-361a2549c60mr14463175eec.26.1792460449367;
        Mon, 19 Oct 2026 18:40:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608219f838sm36078733eec.19.2026.10.19.18.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:40:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:40:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: watchdog: mediatek,mtk-wdt: Add MT8163
Message-ID: <efbbf24a-59ec-44c7-8738-13242c7cd90c@roeck-us.net>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-5-f2462b2d2437@protonmail.ch>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-5-f2462b2d2437@protonmail.ch>

On Mon, Oct 19, 2026 at 01:40:01AM +0100, Ben Grisdale wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add a compatible string for the Top Reset Generation Unit (TOPRGU) and
> watchdog timer on the MediaTek MT8163 SoC, along with a header defining
> the reset IDs it provides.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
