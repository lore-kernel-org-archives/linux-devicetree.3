Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953836;
	b=bq78cTY/ApKvd0Grn4rJjAphYJfhZGHAeCV8gcKJ7Z1OO2Ig27vrfyvKUc6QHhc8IXfM
	 kwf9m8G7NqnN8JUNQ49BZalNLWX0Ydzvxx80U0kq3WoqDVYdP8EJfnQhbw94Q3dAmcMei
	 iJacF87HSxnDj/y5noMibFnBQzpVYHw20c3HVI6mvToLZoTTeOQo41Ok/qFHuiYnHqQvu
	 zWi0CEzkDg3Xk5Era6x/sIV3hNBJr6MIOlqz4a/owdzJOfksCqyj9MRcej/Zb6iOvfre7
	 HXSdAxyW/ggN/gwuvs88+wvb+0WaIbVys4Jpl5o9gwstGzRVStgPd4/YNwtJlkE7VOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
	b=T+EUYOdBJ4k3pMcxf5LntkJ+iLkMlyT3N9OPOWdh1czs9fg3yE9zzPpGYND8hcWSF7zl
	 ZyXN5iWjCH/fQJSspvYpXcoGCqiDaMAzj5rIdpPCxsizsB5CZVJb8AE+WXCxn+iTDe+6o
	 ONZ5y6Av0fEL+c7VyieBZghKA2r2uQtnh80Xy3e4A02Zv+xAp1Fie3raiIcIK0L1cZtqO
	 h5nitLRwVh/44xC/TN1jC/7ToCY4Xpa+d18w6mBYKl4ixehn7pK90nuWJ/W6euId8BJE0
	 dek3B3LUFCF8eOzV8Vv1sJZirE5fmQZBtXrf0thKYaJSszWAt/WJ4l+WaY0SH4Zr5Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pPS7RQZ9;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B458606D808
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B458606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pPS7RQZ9
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49318428d98so103176f8f.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953834; x=1794558634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
        b=pPS7RQZ9YBzITvDyMolV1tUP/Z6xqvmB37nu+uq5cSyvHODwwotp31XxR2mfuDWi8Y
         RcPxx4nAKwRpth29Tam+Pzc87rAJ0xLSV5klykO1tlWzDJhJLd7hG9bjoZHEXYC8cr1b
         y+dxjfqb3fDdlqtMO9mE30hFh/KW06qlRHGgurVNTASuEZeSukhQEwzzXOGiOaKSsDyM
         b5/bj6VW1bMYdOH1IcM2ytAOVm7EY/1HHXD23XeYwBBnp9kDXzvPHRjopnTpH88NaVXh
         1G3kF0BzUlNiY7XVgKh3KbPLWNtc4gCyXTEIDFO19wbzbv5fKzsqIjx2IbaqPYW1lz5X
         4SDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953834; x=1794558634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
        b=2elpVQaUdz6Y8pBsQngj9a3t1mmQZ2cbZXJMBlZDbfZX2Grn2SduhK5X1OrC8D4AGW
         CNWHfOsPv0fM5Q18gU8aOhhhf1FT/WnJGsr8PZJVO/jV0+o+GK8IyUeMm8RTPFpCe9c4
         WXfdhnZC73MXzhytcB0Ep6zX+1JtYbrTspMGPESseBDPRZPSK/TQTiVT9YQ654PzRpE6
         8q9ug1SRbBFAXhp07JQpBffsClwkRm6g9P0AZfmT2By6wLqUKtL3veqwxo+poUqfTCqf
         GD/05KNPw5BJekxP0VuzGd0nsOI9TWpIZ2r83c91W3Ie/v1mS7dhixoD3db46GP81ZXy
         CfYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUcKSr+t//d+olYMrpacUTiROQH7UqOEvSB5U7XqFF1tYAXl8FU+O81tXFQXFKZ8PlHxo00uVmKX0Q@vger.kernel.org
X-Gm-Message-State: APuU4Z8kxCgLNk+dBcTgEljja5qz22u815FSAX+X5F/aAWUJNe/uNWl5
	UgDFkZN0h3KcDMH8KAp+YFUxLZh2xnpuqq6nEi0QZNZonSd/pkbDiuxcIYOtqh7YnfU=
X-Gm-Gg: AYBFou3XFsjLcSbYLbQCLN2ZmP8SEjHh5/BsxwWfKHB4qisOTfH7a7ZrNgoQ3EJFnWw
	sMVzQCyzDKhrdzPj/Gi1bHwg6h+RCW0Gv6HH3FX+P8Lz6fuTL8sfcEGeD6Trh07proVjVaqEROK
	YJLelH44Majg1jhp4aJUkToC1PULSvgmnlyjxZT+uwr7hGi5b6HJVg+krnEFBZJIz+kP8/K486Y
	aTmy9U9XvBPQrX605km4nHBU0p8ukNC10Hk+UXdztUD1ub77iEYaWIg+ohYoi5409X3td+fwRfn
	9tKkJr3qXbTCJlUt/e/2HR511qBRs+86iceIRiOjFutF/c3DqSWrHDmqWKZvECyGZByGkLrQaCR
	sV8ZfSGDWZtjl6MEUmIzUnHAL+eTozZ1mh/+nVszqCPh6sLR6jzCddMtEcMsL5fK4sq4peNjuta
	wXQs9aVh5iIOo5OfNse990ULSK3fuGrsF8UWaHrf7YYzdnDofRG3k+x0llIRkL8eSlusUiwZLB2
	PWGhvwx1CEKzCPjjOVgQ31NemdeLAq0BudaOZ2gvXi6vIfWYFWHolchS1bBSvJFMO7XH3092+q8
	myRfmQPxY0kSMxuID7cbvM1SlEgYzwUQRJXIilHydWRd3gjyx7wX/Iq1ML4VSym8xWhxRAn4mj0
	Ix9upAZsMjbFLtEYzY/uuXpCeMcfW3VKNvnN/4wER/R6Tfg==
X-Received: by 2002:a05:600c:34ca:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4b6deb5ff00mr24355375e9.22.1793953833711;
        Fri, 06 Nov 2026 00:30:33 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:33 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:24 +0100
Subject: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
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
Message-Id: <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The S7 firmware exposes clocks through SCMI, including sources needed
by the other clock controllers.

Define their identifiers so devicetree can reference these
firmware-provided clocks.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
new file mode 100644
index 000000000000..10d7caa5d1e2
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef __AMLOGIC_S7_SCMI_CLKC_H
+#define __AMLOGIC_S7_SCMI_CLKC_H
+
+#define CLKID_DDR_PHY_OSC			0
+#define CLKID_USB1_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_HDMI_PLL_OSC			3
+#define CLKID_USB0_PHY_PLL_OSC			4
+#define CLKID_USB1_PHY_PLL_OSC			5
+#define CLKID_USB0_PLL_OSC			6
+#define CLKID_ETH_PLL_OSC			7
+#define CLKID_ADC_PLL_OSC			8
+#define CLKID_CPU_CLK				9
+#define CLKID_DSU_CLK				10
+#define CLKID_GP1_PLL				11
+#define CLKID_ACLKM				12
+#define CLKID_PWM_G				13
+#define CLKID_PWM_H				14
+#define CLKID_PWM_I				15
+#define CLKID_PWM_J				16
+
+#endif /* __AMLOGIC_S7_SCMI_CLKC_H */

-- 
2.56.0

