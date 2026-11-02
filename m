Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649214;
	b=GY+miCFyury1B8P6w4BRuwjbF0WLqh16a0vr7RaNegRKLslQ0k47RctSi8FCbbQX6NQy
	 XOS75rkGP4PHkyy6D3NPjCSDJA3ZvIKO9CLSXTPn9BgPx2+GEZDtvR3ECFlfdFADSZ/Ku
	 kRST8nmRduKq79zZwWNgpPCwboNCIUqYa5N4AmV2M0IqGSJzXt5N7Lg97kbziJxZWbIEW
	 9lZ3yT9TumMs3fV4d9R9oa/jZx4zxw0bEBBi25d6ir1KUvVMALa57BekZ90g0k/D+Ngag
	 QgrM33kX/pz4A+y9qjGPOmN6f396lnAYMn8KlwQz7g+c5UOz9SrLFvRYfPrEeEX8S1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=y5G5Oi9tmTaDaaDivZDz2djuyaQ/VmV0KNWnT/BwMm0=;
	b=dXq7gHjlm2OXAr85RGEffCszQFUg/iaJFp1tOnOfTWjDntYiFTryORjoLA565O5OELnD
	 UIrC/+ID94vuDQKe5zIk0XpAu+yNuqRXDwhwg0MIwUkyPvqkovcHrgg+vrykMB+hzn+I0
	 MCM3t0Lma7L6tHAznhj8W/dvdnFIv0fmSnSdHXGbQaziM1jGL3qkOoOMdH6VIhtOSxz+q
	 5PknFoAQQufxieLaG0sCRqBNX8QaoUTQ/Lwu50OL1/XJAgf65pO9eHt4Jq5trJDcCACPS
	 Vy5znXyl6Y3WvR7jTXPDILGtCTvYjZG+6Xy62cByz6N+y4oLmh7equxICC3MLYxmclw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="TjzApD/u";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D71606D821
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D71606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TjzApD/u
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so1908285f8f.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649213; x=1794254013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5G5Oi9tmTaDaaDivZDz2djuyaQ/VmV0KNWnT/BwMm0=;
        b=TjzApD/uGH3hLZ884dtVle7ojDH/UHexKG7gL2q0/x0OSigv9NZuk/xIQWnVXqUiML
         OxyK9LHFrK1kZUHBEyMZGb5I8kCabObeWH0EG2mJctbmhJOgOndJDEWr51hppTHsAsU5
         bOMxwqXhiyjqSGMRKFaSDWN9HCoA7VFQqDdbJ0CAwlulm1YuWBGGhGK0kZlhm1SUKRzp
         boeatkcvd3qpZ0dkrLBxcy2Wgeti5JmX3TT2lq6n/nc3E4ILdu0yBgRKkRV6VSF6h7mr
         QTqMxAyMoS3akennWqbvfcqLYS2yKrS/zQvXFfIJPbrrWLQLCvYadq4DG5e9mscvpiVa
         XF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649213; x=1794254013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5G5Oi9tmTaDaaDivZDz2djuyaQ/VmV0KNWnT/BwMm0=;
        b=GieCw5pRlJrVdZAx6hWYisR/29UNFZi7yJJbRHozsS7ahwseNsJwd+vSJiXir8iezF
         7jVZDYaEhisgBhiP847dGIrYA+HRSRglZddRgnOLyVL2zbqMs/UHRxjYlAk/WQE0/krI
         Ih9LOs2vb3KqSLB3F7eeoy+xxatG++Dwk7AvOyIVHazuGisfCyEFXkP7I+cJ7MHVALzk
         ts2JUKmSwe3coZsZwvlvMFNI8wUWqQulQYDGCPJJ56d93eGXyrdose2WZhjLPQWUs38R
         U0Ml57aFE83IzqrZ9fgHQay4+NZ5grSvTTSRg4ZokGtPelPwXXvjJo9iK8ZIi3YTp2rF
         wEfg==
X-Forwarded-Encrypted: i=1; AKwUvBxO2GPibK8xEQ1kWorDWMR5iBoSCDiNIDRzTG2W7H7hF47E7W9usYrRks4VO4e481pGmhCP/6QF/Lrf@vger.kernel.org
X-Gm-Message-State: APuU4Z/cruLLDDd+qGNxmGwH+pfR+GZzQgrKZWuEfWEStAQ5BL5uDwk5
	2NY2KwpS37zj6w29iyCGGo7kr2KnP1vqDGuPjFywZluYWOpsC/hJzxW7GEXQctD0ek0=
X-Gm-Gg: AYBFou1WAP68VgsIalibefr5jUqqLOz6vUxQVlcVr2ENeZ3l7+bbP4CbIYPuWc07wc3
	mvF4YH1FZfdDKYFpZ5Ih4uUljuhdGrfGl6WoUEGoh+mE0VdOC+1p0iw6jTsiSr+WX7gAFkJZort
	dQLPyvBppYWvLFi5JTZ1H+NZNfHXYgyRauSy8S7MuZA646kFpWlNR4rxlvVePToZ4rsq6250cQc
	ixzLeQ41MYrJFs2R1zTPTSgAF1ha6A5e9WUoDJgUmi8m2JGBXRSqu7jl0vrEbdTUshJyzOHeq+M
	btCgyE65IlrPlbQQMFuRFLw+C5+XILtvVYvu0m8wrRG64+SsSLJ3HqSvNu2tXNue+R52fiP2Pbc
	czd64Gj54dXbTzvEbwsV01BuyXcVDIzZdotxTRlwdzzvRJYLfoFnCclRa+YUWeRoPkXGTXd2vgP
	ONA0PLJI8hUKnT46ZIUwQpZyCTGwKFlBolCxato0lVUFbVpK1vdLLTBpLlryfvId3fL5/B2eUeR
	yU4iTRfIrJb7zw6D4dEcqe9eDEKYDTDdp8xv+wu1BPNFu48C4TueBWE4QaGw8hMcR5DBJbykT7o
	eoG6a06GWRAxZ0XVrQcAH7EFDEICKkwbWjkmHuk1fiRT6cFn0crmU/YAFFIcF1fVpgwE//TsXbg
	wnkewcShQ/SoyWcl3kW+7HGIjdQ==
X-Received: by 2002:a05:6000:4013:b0:48e:6264:c388 with SMTP id ffacd0b85a97d-48e6e2ff911mr23181536f8f.23.1793649212689;
        Mon, 02 Nov 2026 11:53:32 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:32 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:49 +0100
Subject: [PATCH v3 3/9] ARM: dts: omap: dm816x: Fix pinctrl range
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-3-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1269;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=P0EUDiEV5xVvoAc15r04teIU1ur9dww1Y4noU9iuuEY=;
 b=hWsGqtoEWoqx9qzruR2/klCLZ1d2o0pZzDW9WAI4o5XM6uZIewzua0xt5k33Uxf/kYfLHjJI4
 6ez87CXChQXDvHN4LYW/ZD4wk7GvPZYihUn2fr+m9G2qHv0+6+iOc83
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The range of addresses accessed for the pinctrl module needs to be
extended to take account of the fixing of the size of the pinctrl
register to be 32 bits instead of 16 bits. So in order to allow the
final pin control register the address range must end on a 32 bit
boundary, not a 16 bit one.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 261ebca8863d..fc124f9ecfa1 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -90,7 +90,7 @@ scrm: scrm@48140000 {
 
 			dm816x_pinmux: pinmux@800 {
 				compatible = "pinctrl-single";
-				reg = <0x800 0x50a>;
+				reg = <0x800 0x50c>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				#pinctrl-cells = <1>;

-- 
2.56.0

