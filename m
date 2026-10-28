Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203587;
	b=h5Tfue9DxHOwOEjpDXHWeDJV4kgRB6L3EdpibdEPGI3IllM1C4NJaXcIlEFR6T0+wSOa
	 wgmXY0eKlr5gSTE4eKnl3IUkdbJxExN48Zxs1sDLR1PfDjcArAeTPXZtgMzhaWlWYErAz
	 kIFQX8v9bAfvlsYPSpeFwah8wcO9SN81D4ymt/t/TrMUZkvsNop3kGq0IizTjcDMxHSwL
	 esDXT11Nj8TrpRBTbI3Sq9HjlLLc9mBwmEAQAh69gf5toiJRdbMEiZP4S4JMD4kIneMn9
	 hgEHHNiuLOQ5CZLrp5rhM7ZnbtJBTx9AbXFDsSUt0r/cpyAUp2gp1pnnLu3mMo8N/Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3uI0MFbTtASjLF9hlBwhObgSemLAwBt6XCum0+3gyyM=;
	b=lFbGLk2jpB3EGXcGHcqY/VUvHaFObBdG+zPjlh2+6KX7K3iIe/J0J4WwfXZ54fuF6/qB
	 Hif93PCHDLPHcdx1Ts21imW4wG7iFTBaANOlHOFzKQ7NQTqYchC/AO8N+Y9nAQUDICn0j
	 z7huJcCxpiVEIjqpGytHlYdyfDFL1Y5lsRQ4CXPajT9oQlf3eMV4ULh1Vnsv/LLmJSRYY
	 I82ynOGdZwVbWGYEs+yjWmQDQQqumCvdg3oX1XRLbPBmzjstQncyETMkg/02qp4byJXyh
	 UU14569/5YaUF31zRbh/zCRE+ZiQxNXTeDZ/Qs38/crJlL6Y9DTAnYrUlrKuJFt4+9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tPvehUgC;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1027606AA7A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1027606AA7A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tPvehUgC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a215e64962so12846655e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203585; x=1793808385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uI0MFbTtASjLF9hlBwhObgSemLAwBt6XCum0+3gyyM=;
        b=tPvehUgC8iL6Bd9LkWwcRwzfEX8rc7sVMVUk8QFwp2gY4FNrJnoTueh2ceLQfpRH7y
         QoUfBWJh871NMwSy00RcdWY1Wa6P+dB/72P2hXY6bhPXbXBJgWe70vFfiIb0SgH2m2IB
         2kngo1rYQ4ULc+GmwhydYxO77x1Pq8xjCiAgPoxrWymWA7rfPziMYJ1BgRT9kk9a2f1D
         8W8+lRl9KTe2jUZGNUHH/CJ0j4cGSXChMxdiauei/crTabpSqOonVcuPrEFfoLBT5t5y
         WCTSZoGW1LPYezj22PqsptV4ADYnKDu9lMg097wYNBYxCx6qYdhFoyOa+HqLvEl+6/41
         lvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203585; x=1793808385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uI0MFbTtASjLF9hlBwhObgSemLAwBt6XCum0+3gyyM=;
        b=Cwk4CZzKI8uVNNcsrcMO1PU4p28w3U2ROQ6TI3HEnUxLyyTncXMZICYzb95UpVIZz6
         n+chS0pElWN/qRrDe1jEiDyAhIjWr5btwyynXl8W3ooSjJwy+bkugqIp5gIJVwTWYD7Y
         2rLUWDswEPVgq6Jv5SnpZ/l6312YUuJUdU3yM6wVpL2tpYmdMh5LflF6yzTW0QuJ5Nuo
         YLGxCq0JgaAQdfjL0SzpyP6/fmOc6lQZxIIovJ5/S6UVgUG2LSMyu1LCOeWEieosBBhT
         ImuGAYvWuc0FLVm6fKgpZ7Od/93swD5vwbwZmQtZ5QOGLNNMbID8nb3hLCOfrc7k+frn
         KkeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx33Ief1z0DzQPWfpIc6lqovpQf1R2lgVAEsVK1sqFv3QMjJ8s+NVzioucmFidzcQ510d8GUO8C3gmR@vger.kernel.org
X-Gm-Message-State: AFq9FYLwPNUMBdUlSufyCEnfikDTC3SuhWLilE8i3Qs+GZMnSRUQdYup
	VSat4p7zIsZP9febvfN1C7buZuFgpCUZY7DAqUMR4IIZyvqCxDl60D7y9ev5Zo9j1/fRxmLJwy3
	oPJwYU7YEoA==
X-Gm-Gg: AYBFou0nlaIyv10Psn8pfWsni0VkT5akpF7wHNyyD0eyeKJATmcOvi9xzgEpONp41Py
	lt9U620Q+F3iJVtrtowL3a2dZaZDXjeW5KflY40IBWu2tVCnm46ttbpGmwdAsfxfKNzIhALHWvd
	TEQVVZeQ87kdNk4i2LWw+L3EX8tU3/DFm/qmPjC8AAKyFkJhJSU1HqoKWbIcavPIyan+bPs3Lbv
	HGewTmLOzVg5KF5kRi0BZsJdasdG+ZThPSTOcbfggMiNYvW1ItOCWQPRgo7AHUaLj4qzaL7A6oF
	sp/JwDIUw6usb6ei7l3bNWVvvEAL3lWDzbN8xubZu8zzBUntHX+PhGoYNVuhu5nkb13WpgRuEhh
	+RStI0VIlBrTih6AXNrg1rp4Utv2rjoAtons6C7ITM91QQg+SaAbMGWxFrnJwBS7nJUxjgcJdKe
	w2QCtjeX7aV8GmBkoIl9v3N/qwaYEQTUoBWNctVeNy41y89E46Ppurz8YpMr1nrx9XC6xeneA+9
	eRaEA3l1y0hISnbPvLnjifIlGDVLtdNWZ2CN95foVcUfMNXJfau3FKj54G+5Q+s9ZeRXsLgu21o
	ANpFq27rU8mac+oDyUwe34JO8Nr2esiwsWLMq/jkcJfmkUp07/L27P+r3C89eML87NogQNLTkd5
	XTnai9XVi2SVeO2CgzcUkPw4UTwwE33ktMR7qcpSW6tmcYwUB
X-Received: by 2002:a05:600c:4e42:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a9678c276dmr60643465e9.30.1793203585194;
        Wed, 28 Oct 2026 09:06:25 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:24 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:02 +0100
Subject: [PATCH v2 1/9] ARM: dts: omap: dm816x: Add specific pinctrl config
 defines
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-1-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
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
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1034;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=hmVSe81lrJ4EvLkYlczyhL6zv7IwzxLZV9wv/8nR9Ag=;
 b=LTKHuS4ke5N8E/7u8UBcMaws7grXO2Ccr8ynEVKSNxQOMV5oIM2lSk9PHFNQu6TahHNKaLFkw
 0Gq9UnU3vJnA2IHmEV5Itg5FF1w42ztMv/0Oa5jHnoCCzbkIUYNsqWA
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

Add pinctrl config defines for TI DM816x SoC pinctrl configuration.
Using same definition as OMAP2/3 except pullup/down enable macros, which
are inverted for this SoC.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h b/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h
new file mode 100644
index 000000000000..b93f971cbe95
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This header provides constants specific to DM816X pinctrl defines.
+ */
+
+#ifndef _PINCTRL_DM816X_H
+#define _PINCTRL_DM816X_H
+
+#include <dt-bindings/pinctrl/omap.h>
+
+#undef PULL_UP
+#undef PULL_ENA
+
+/* DM816x mux bit defines */
+#define PULL_ENA		(0 << 3)
+#define PULL_DIS		(1 << 3)
+#define PULL_DN			(0 << 4)
+#define PULL_UP			(1 << 4)
+
+#endif

-- 
2.56.0

