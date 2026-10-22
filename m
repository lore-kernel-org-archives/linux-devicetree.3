Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682972;
	b=M8yTLbQXzTFWYOsC/fEOSHz3Rg6Y3sGoE0z9sB6ySx+SQ7TuI1onGTi2fD4Qn6x7MXyw
	 LCJvWpedMKwyhvvgc6gtu1uQBCUBEkMwRDPRwXV3keeX2HnSgvML4drEACDtr/tYnTTh/
	 g6Lokthn1qz8UDYYXC+Tpv1UYQAKdTWkC56aoc4diE5LQzKZB2n27e4eVgliC3PG9fpeJ
	 Lk7GqxNtqXA3RnnrOntwVP+Kqa1E+UvDowOBsvqeVUVCcLDF7PKQQrA7cMxq2WJjpBs7x
	 Z0FUL1TDvGeJezIoSqAyGpkf8m7X5PO71I6hutENs0GGhMdxgsOIIcNtoBLz/WmqZMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=;
	b=EtWIgilPf7Bkvefuum8KhMAlvU/k0mfRFTV5JmIsIhyVTHsdmCpUS53WMK3L+Mt4uid5
	 GPPM/PvEMLWHWl+2ls1YNWU9xS/Byv43JE7dYFe4V52kWJOfuyfGCpiE6q0+2EH3pz6F6
	 6QkJfe+QTdq0COIfvH1AU7deDCnLq74NS1vGmoUQcbgX4Gc07sjZxpVkvufPYQ4SS6xvY
	 QYQCqztEaKh1hs3V8VPVWswfiNdT1ExSBhAy6WXOoDP0TxyOhdvIyt0nAan0hiHAIkRwM
	 AVD73+CT9S+qjNzU/L9jyiuqtpZXeqfdLUWNr0q2FTO9KhbOD8qvs5nGI6iEXSQ/RPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QpJis2sL;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295E4606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 295E4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QpJis2sL
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so6003405e9.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792682970; x=1793287770; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=;
        b=QpJis2sLxK5hhv2ZYmKxn0Z9+ZS5AS6kmVGUr9nC5CC1eoXNJouRCPyReQA0DRNM5o
         POTICEpdU36CEbd9PNahL2LQbmDQsD9jCOHEQwYyJvq5532A22K/WFaUkqVeBCUk7tSH
         sl9tVjNA9B8F/8UhHYYFXE1d8i/yP5uGWRZuihO4B1JGZ4pPnflpvFB0yFkhFw87IPzm
         qmqvnMZsEd8UCKYGVEN7K6RVEHA8wUkGILf/Gv6S6zaXsAsAd0kIUNdEtFM+XKqvD7jf
         qJ9KY73vEkgLeP1V9SjhnQuwoZNvv1rySfnr/PnBPNrm4rWMEyxwgflEW3u/Z1zWjhJO
         RzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682970; x=1793287770;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDlAEt4y4tSaN1HUhuY/PGYkg3Qd4cTO/TkXeJAfzWw=;
        b=cnZCJtC2J34Gmova8Uxl0FiIFtQg38vdhHVTbrMYc8WFd2Wby9fG8WKcdbHAJgNxkv
         l8QslGvTg984gktV0UninztpIR1uqXfNJ6Ju2jn23p9hpgkrZ6Sm4xLmuczm/H80Ci5/
         U3zkjF7pWco4OvM3tvMhhBe76CBHN1BuugMJMcooAKvQrazA7IOC0+B4IdG+nJjZvGPg
         guyu81UWzR8ir4SfI7xf3cA0YAf3jfdrNutlk8HAF/a8h1eghISawijYNeJyIkWR0NAh
         YXERblc5LEjHEGCf8VP2TcdfQInYJlyqLpi6Mu/vpi3ItfBloiB2CUj25qvOEkHsPNWh
         mTWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZ7e1UHnkUKMpDk0AaWlvQZCo4bK3tvRv7NA0lTpKO4erB9IZhu8ap/A6TLlZpjqgugIy+/oO4Hnga@vger.kernel.org
X-Gm-Message-State: AFq9FYKmkRhRdV2AbuXJpLaitBxPjVfwC/QY96Y2R28+V2pPfuGzdn6D
	ZMRzSttSJZEUKZBNsptXUxTM+HGXXSqK9+ebpKuFIu7u/cbKD7vjEkEKN2FGlBi+AbI=
X-Gm-Gg: AYBFou3xlx//9WP8mfo/rTK9CFtr//33vAZM0qrEdX4Jhf7N+7bm3D126GoXE8froG1
	CFTAa/MAACryQ0XLOfZJZqR9NPAtL5lbRkLwAvyI5Ce5lU2dcyggMTEIjSw5pcT+XIISWqDS8NG
	rQWXsFCNO3eQi3Xa0/y+L+2oL8g5Jk6qYijBVix1r8wI+lo5DmxLpQqyYm+Y3q0w15kECGan7aB
	I7kcI6k6RRjbb8J6phI92LUXhRknbfvNFKqFbJSHBYOxzunygzJvGMkQemzB4DeNycAXinivsBM
	XX63SzEBPA9z01eJQhvh9JIlt/Q36h0Qrn8ffLcMZm/0k/La4rSbvk2fnON+1fiV47vUWqbEk48
	xv8kUCiG8fmmGtWDhtmZWJeIwcEF+xa/KHP8odicfwRg6XsVUM+oqonpFlwGobhC/Wzr5oNgDtK
	AVLTpvVobObRxpx9/Ucbl0t1GS7hSxbv2Ry+qIV/otHfz6Ut0y9ILzh+UwiUXWRbz7ZRRQlQOE7
	RKKoFziqNnEkgs6Dsy4oopJokihaV7SwA/vjciq/muck3klval4Pn7ZlnQG/RDeqr0vmllAFAeg
	l5n9/ddODCO4W8G2EE9R2E5UnM8v8tStu/9otCnHznyDZA==
X-Received: by 2002:a05:600c:1d0e:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a1fdd44ff6mr114656205e9.24.1792682970343;
        Thu, 22 Oct 2026 08:29:30 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:41d2:e95a:b320:711e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210361ad6sm3270335e9.7.2026.10.22.08.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 08:29:28 -0700 (PDT)
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
Date: Thu, 22 Oct 2026 16:29:27 +0100
Message-Id: <DMBH2Q4ZU6KI.18MV6V6TMVBNN@linaro.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: Drop deprecated regmap from reboot
 node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.20.0
References: <20261015040601.30049-1-semen.protsenko@linaro.org>
In-Reply-To: <20261015040601.30049-1-semen.protsenko@linaro.org>

On Thu Oct 15, 2026 at 5:06 AM BST, Sam Protsenko wrote:
> The 'regmap' property was deprecated in "syscon-reboot" compatible and
> not needed. Remove it to keep the device tree clean.
>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 911643008b9f..30ae952083cc 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -236,7 +236,6 @@ poweroff: syscon-poweroff {
> =20
>  			reboot: syscon-reboot {
>  				compatible =3D "syscon-reboot";
> -				regmap =3D <&pmu_system_controller>;

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

BR,
Alexey
