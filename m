Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678184;
	b=F+V14Ssf5rIG2fbmnNfVY37OIxEJpAYiozaiQ4mMbx7aq+ZtXpJOhjAXvNkfb3OImOUP
	 Aj4Usfw0O6oaBkDqNMMIqT0evgAwmYQf90HYhh0XfvAMp0G2M3rO0vjGqZ1wGHm/A5+sp
	 vZUG+iSBM8KbFTslE8muKagU5Ef5IuHGfpVOQtD/AbeUquTZmeD0cKjIQtpHxJcxv3HDa
	 lHS7ggUKMY6s6AV/U5OW9IxGLzcstKJvWRs5/y7+PKH8U4cnT/hLVluld0JD5tSnc5E+G
	 WRh8nRBbUX7mWExvcw+kVZhYov4iB7ofASjvLnWuIEHc37lIVBqodxeef3M/c41WxSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=;
	b=H1CqM5+rnfqy9CxbiKUcRPrFmyVnhy50QKT9KlPyB/oD+3JmjlUm5yM+zdhnpXfOHnTA
	 fe/LXr2MJhwRBxCcBTxYC85gRSW9w61atay59Ru2LqP5bITAL9RaMCHjA6OcIHVleexyH
	 C6Ms+ebQE93Kw4+ZisBOfyAfqyxbwHBCr6TBsLzI+hY3Do4rzaXmvE76Og4a5DZEcV6Mx
	 j0L2b0hSy8VC28ph7ZeOUiylxTfhKueZy0BH+3rsIBi8JcBF9yOPfzTXdUVzYYS8Gh2k3
	 Fe9sifNQg/mVrQbRmGTK8qP432UG+td6Ggah0rIJMf+dUvZugStGfURDqJCkzTSBgow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ap8eKDCw;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2596C60A2610
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2596C60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ap8eKDCw
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1170061f8f.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678181; x=1793282981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=;
        b=ap8eKDCwU4nZPTGpvVf827HSfvCK7MI9h+uMzadRRVgoK8rWRJajijtlT1ESIUGKvF
         EdkLAbQPKI6OZHnFujZM4Z99yGlD8wKOBN0myvhhzXdSsNhRRRI0uUv4aEp4a+gkc87Q
         W/ZdiRENF4pqFMPMrA8EZnruxwhLyw0+nXSuvlCK2/KP3UoytY3DRlZ1cpPzcVk3Ol1s
         gqw4yuim40lyaa1+fMHALDdjexyf0AuNSugG1EIu47rPqzZwxZP9ezJx58auP22LDaL1
         YkDP0Tu/rwYClioywk13cJuoSJdBfJHB28OCzFXrrt7d5e6se3wD8cIuRoOFHVWyslhX
         Sc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678181; x=1793282981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=;
        b=P6Bu8Foj8BccJWsayStBiAZptXKZgWFFx7DuT99aM7tNeM/u9j6oX6zqbgjq/X8K07
         kJYc4hv4xUL+R8IgDOrPy0upXeQ0IhIhe7KkFiZz2e84S4nFbePv6VBCrlrpTI2GslSP
         uWHbmWh3Gvl+ISJl3LmBO6WURuUc3kRzTqWNbYGPQGmIWFYaCCd2IB2lYXSyMfCiMK30
         455t5M6glXr2CeSyItnNmMCq+hfTnyK5LrI8rVjIrKv97tiY+mMRR6IPENQ77ecCJ51T
         gmbtdsD3ucz5rWvzdR5qR7xfnvw/3gRqbPkP6HXfI9cTt819+MamlWcNaB5nIKD8X96r
         P63g==
X-Forwarded-Encrypted: i=1; AKwUvBxMBwAJjgzEfYMM73oB141VwX0DUhehIXbZmHRkaDCYnKz4H04CRlLyr9WMLhaXLM6I9f3OeMh6f26q@vger.kernel.org
X-Gm-Message-State: AFq9FYJVHkaq7VeMZGWZn8YWm4mX1jfWciu/GDeo345YjL0v3R0cRGj5
	EVPIiY/LGgdv3QrSvvQcOMOA3IYc22djj85WUok1BXhCNJC3lUcgMg0Q
X-Gm-Gg: AYBFou3c3vj4TeENhwzd8EhPZFG7xgsQ30I8v7rTnMMOVm4uqXCD0tJT/+IhQi/JOiP
	VMlwd28uAclttwdalqzh2Dd6+9L6QH7It10+QOe6UWqLjj8h1pkJP2ByBW5JFXc7WDAmI2fXpu7
	FiMpT9Xf83JhsHxLqHwTsRRMxIf6yYXsAK/7DLBUiWq5NODLPq8dqalDIRuMAp+iP9PjFyTy8Fr
	hk258J8aXLv+JeKmONIGa+5Y/OfNrX8yb3nrU9k9sJszPeHAsHntODMWexM1eb/f4Cl1Hbrqoje
	0155S0Fs7ofm5u0HJVnw1V0BH0HxV9CtsVT6klp3FPTDyMuImJVS7bf2Qag94K6jIjGPkQmta+5
	+5/OceLJAtrVtS02l3MeWnlWTKOC6lTgXKFOCKFJ90yiMwHrAzNtbH0QpQJCxEna1MTLLPjBwU7
	VnGZWJ7tc7M11S2IYHHLkB84z7RZyWg37wzhd1pWRWn6EbKs5U5hb0ON5PMp3Qj9N/jCUA+b4Xx
	43XzvTrQeWRlAQ3KZBBKLhIHHNJ9aM3y1nb1oSQuqj+VafF5IO8ZG/XftMbqTg//A445gaS1hmt
	RRCtLnQ9AkOtDS5AbAazr6icSuIvo6AXMqNJSI+BA+pk++3KdGVGYF8M8j41BmMNCiYYKAQOfSo
	g
X-Received: by 2002:a05:600c:1c19:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a1fdd74b84mr137319755e9.35.1792678181416;
        Thu, 22 Oct 2026 07:09:41 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:34 +0200
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 UART_4 overlay
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
Message-Id: <20261022-v1-imx95-overlays-v2-2-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Verdin iMX8M Plus Development Board device tree to
provide a ready-to-use DTB for the non-WiFi SoM variant. UART_4 carries
Bluetooth on WiFi SoMs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile           | 3 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a40bcbe4876d..5ee9fa583515 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -732,6 +732,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
@@ -744,6 +745,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..7c9b21a041c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -857,7 +857,7 @@ &uart3 {
 };
 
 /* Verdin UART_4, used for Bluetooth on Wi-Fi/Bluetooth SKUs */
-&uart4 {
+uart_mcu: &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
 };

-- 
2.43.0

