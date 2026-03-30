Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B522C191F98
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884333; cv=none; b=s7fRGwMP6ZenwaayFtk9zPxrb61DRts3iDY2EJF+RuW4losVWUqo0w906dc9Cnnpl1Yoq9kkfaivpZMblSn8HtPI6uVeKHcLbuYLuUs4GLluCzAyXg4+gNUgt9C4n2kuPn20O+VhOLulfkRa9QiNZSK9KlUWFEXZcbxOYdBcLs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884333; c=relaxed/simple;
	bh=ybEcQezd4bQp+2AiFiCgTO5IRunvGahWXK82YP2l8LM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PqArWq6TI90x3TOQQ/MPg6oW572ZFtONBpSCTNQbWwpVISxk30cmTcRL5DNXbf82xoZae5DAkKw9RIKQ8Ai3XTGAh7TfNecDUwZEPTsk4CHzNaawXwS5nwd0yVdeHsDyowsszRa1Np54DEujdNX3GZleIR886zsS1+xnoCHhB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGCt7QO/; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGCt7QO/"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b979d16dd0cso815261666b.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774884328; x=1775489128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dnhAgVDW8iuPSVs9uJHLaTkCl9UflKkR8DioSBXExQ=;
        b=SGCt7QO/F5WbfrEr58URjDbA2gT5Iwf17EwRFKeDy5X704wfhSBDGiVsicCplVDHJL
         ZWIXByhRxoV3B+Eiq3zHc9/t6OC41+6WcsBIpcluf3Rcss9Xbju+ECqEZKWppCvEcU8V
         zhWw2eL26H3+IhtN1Gl2JPhZI1fUz4J4pNEnz+O0IrJUT4BJ2zISLScdVP1vpCLFYwZO
         +3kTJTBk808WaWIp0GS+ISOMWO3+FSVhEjRmAjevFiYVASl12TPM7JSmWdY2qR+56FJo
         TBel8GC6XjZVdoW8hb6lG22E9P/ptjM1dLlV80IA7DHQzacASqOvqbjgXpy1CkTqIG1D
         F12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774884328; x=1775489128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8dnhAgVDW8iuPSVs9uJHLaTkCl9UflKkR8DioSBXExQ=;
        b=LEG0LZlf40JnqtvMepVzAaf73h99zDthTH4Vm6kLmhqL+uZd5KxFey2CQ77FFwt5yB
         I7HkFWDVDInF24PSD1yJ1D0sP4wIe9Xa2OB/h3OQD1ilody93Er4pa9Qk3r9NKVLY5MF
         YZbostnq0CWleIjSinZf9AxHHqdEk7OzlIATw2TrgJPAbde1D5Jb3ujJtwLgu5VLlOsm
         fmkiuuV6SLaTnRVavmQjbWv8aD1JxFqDI0wBbQWB71qa/H67+jh+P7sEXiL17BVBGELp
         n36tsgqq9f0dIjBawR8BFEqaLS4YxhRrDtr/ofcZbQvtd9kN9i9DXt4/48Q/th9VWoH9
         AXhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWdsTiDtoOVY2a6MXyTmtp7h/Q6S2IeKFAqe0jnpEAHVMZiKv5Lnn0wHfvKHKqsO9EptZDK8M7yrxL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx29RSfSUvK1S57k8XjVr/YCQ1OgLfUjHmLHHgwCaSkIVlq/e3I
	b3VqAZjQhG9b71zCcWTEC87Ov8+P1zt0PU8TlGb3T9NvBOz6YNIzmdss
X-Gm-Gg: ATEYQzzs2KxcE6rbZvGzqMPOIEQ4dGEX6AYjkMsNQnYLiAcsyQADDFkP95zaShRKjPN
	LQIcR4Y1gWQMzF32RtBGgP4Bcg1/ur/lMFh0eurzpnrnPGsea2qzgcLYehwFVNs9+6E4D4l3ySv
	6rycxLEkwTn0ICctwLrtI5KNaeTIxOoqQIU5jNv8jNKIyaylT6tuOjFBYYPH7yLoMKtMXhWikIF
	twpBXvgG0bKbfY3hb8GxDJiW8iBUN/riyAFRwcZuBLStkDN6BuqKgNzn72kDcXHZOmXVPZHJF0A
	Pv0BLDacw611PnP3Q1rTFtVq1F65YI3hsatWOgC04Zn51972W08gWzH9tzJYEUwlA5XIYDnAkAg
	ATtwQLlczGL/auraZnE2yUPCbgrcYUbaFLL74EjQNYGySrCD0C6Fd59WGIvmoOr/m+sLMJ4KXFh
	HvEC4tt/zZQBwOqL011vwYA8U1Qws4QhRzNhFiFQrl0V3FQxihUtzR
X-Received: by 2002:a17:907:1c9e:b0:b98:40f3:47fc with SMTP id a640c23a62f3a-b9b50169017mr811597866b.1.1774884327882;
        Mon, 30 Mar 2026 08:25:27 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b9b7b1e33c0sm301058566b.49.2026.03.30.08.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:25:27 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 30 Mar 2026 17:25:16 +0200
Subject: [PATCH 1/2] arm64: dts: marvell: armada-37xx: use 'usb2-phy' in
 USB3 controller's phy-names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-armada-37xx-usb3-phy-cleanup-v1-1-34d77f1a1784@gmail.com>
References: <20260330-armada-37xx-usb3-phy-cleanup-v1-0-34d77f1a1784@gmail.com>
In-Reply-To: <20260330-armada-37xx-usb3-phy-cleanup-v1-0-34d77f1a1784@gmail.com>
To: Gregory Clement <gregory.clement@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Robert Marko <robert.marko@sartura.hr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Stanley Chang <stanley_chang@realtek.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Instead of the generic 'usb2-phy' name, the Armada 37xx device trees
are using a custom 'usb2-utmi-otg-phy' name for the USB2 PHY in the USB3
controller node. Since commit 53a2d95df836 ("usb: core: add phy notify
connect and disconnect"), this triggers a bug [1] in the USB core which
causes double use of the USB3 PHY.

Change the PHY name to 'usb2-phy' in the SoC and in the uDPU specific
dtsi files in order to avoid triggering the bug and also to keep the
names in line with the ones used by other platforms.

Link: https://lore.kernel.org/r/20260330-usb-avoid-usb3-phy-double-use-v1-1-d2113aecb535@gmail.com # [1]
Fixes: 53a2d95df836 ("usb: core: add phy notify connect and disconnect")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi | 2 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
index cd856c0aba71e6f6fd3db8fb386ad607912e7577..12deacb741ccbea684d905f246f26a4399fc8cd8 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
@@ -161,7 +161,7 @@ &eth1 {
 &usb3 {
 	status = "okay";
 	phys = <&usb2_utmi_otg_phy>;
-	phy-names = "usb2-utmi-otg-phy";
+	phy-names = "usb2-phy";
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 44c47409f8793ae1266303607812ef481edbfbc5..7470d504a41081b32bee45368028189a13ea7087 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -372,7 +372,7 @@ usb3: usb@58000 {
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&sb_periph_clk 12>;
 				phys = <&comphy0 0>, <&usb2_utmi_otg_phy>;
-				phy-names = "usb3-phy", "usb2-utmi-otg-phy";
+				phy-names = "usb3-phy", "usb2-phy";
 				status = "disabled";
 			};
 

-- 
2.53.0

