Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453081;
	b=MuEpIYxqHXUU7fLIMOp4rU2Bwbx0y1W+7KxyajBaSL8p3E+iuJQd4+D/ZB2JJOwN56ce
	 020nKtdohJ/0ug3/7izJ5Gl+mzj4zwfF/k0KlIfdFbU9kFAgiqbnOIUvh3hxMTN+K9iQs
	 fGu3EUu7by9T7RYOKQftN8fVXRto6omGyf/+fU+3jNU4Pfa1fo/2wtPkcBYbW2C19HT0P
	 MeOTcphpuBVKg2YJ46xDP9+BZ9MeJg+3NEtxCfGqRZISEeclk0eST0X8IdzR0ov74SLQ4
	 vSUPRthNeFjlZcttEJ2TIm6NCSxR3xVaVuy7ho5YbxSn15ggmPaHdeylk0mtj+DI4rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KrFGWAp7BWRf3gdxkQzLizSlPFj0AMgOjQiOaX8cNIY=;
	b=Ltal1S32jl9VTMZuB3wt1Nmq3KHaY9qNsvi7UKDmStpqmmzKat5w6eMThZ88vbZSFbq/
	 kjwxPI4rYNCqSm4ab92ACQvYXd74cqSVOz9oy9ieYvvsWAAuWr2x+7QaWSGAwTKsweevg
	 vEpVERTe/L7i6HtpoC9g19kl6YZqHeTPY5ZLI07X/d1gPelFHtdJ3HCYyVKr5s07WEEPk
	 hKNFnQhxX7WixHn5m+V6ldxOLrN9U3CCS6AILso58++fOqg9U1EjK8bEzKbEq6ELK2UUP
	 yWN0UctsxLe1wrdVKjNF5Cj2XJYRcWZwGa7xN/Zr9HbRINF3swJ6oAIWPbwRyWNSsMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CO+BcMqD;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5461606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5461606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CO+BcMqD
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so4223865eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453080; x=1796057880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KrFGWAp7BWRf3gdxkQzLizSlPFj0AMgOjQiOaX8cNIY=;
        b=CO+BcMqDsfUzF+3YSV8mwk7M/AAEu6rnJRRl/VGoeXmHMYuErvaO8UxFD8WdHafgk5
         bmnqcVAr7IhcHh+rp9noq2OFwWAtrw0nziyJSTd3Hi2BxljTCyFCRA6n2s46TwYink4O
         D/0e37JAxI7Wxu2FM/Fa3vtZtEw4IneJIa6JMo4VE7vR/vu6PJOLSOurWI4O3byVwUCE
         zBEpkkwz0LTajkUb48TGe3rmFHtGDlgFJkUd7Oh/o88uYy6uL8FS7VOo7VNdEcbkiR2u
         teF0SIBz2a2X9YJdc5Sfxly99F0VsliwPEawSpoUydPsbs/he1G3KitoiKTbEV7BscEa
         bnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453080; x=1796057880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KrFGWAp7BWRf3gdxkQzLizSlPFj0AMgOjQiOaX8cNIY=;
        b=m/YXQxl7/x22tZQp5SUq9V/+q1pLwCtUHh8vB67hioTw/LMf+1jMek4KmBEFZT4qX4
         5nziztaRRgY4fQG9qutRSs65DnzoQfehNHJZexvimS0pEpAjmCwu7ebWs1Py/O7jGHVK
         wfWP6wxObcvE5OizcPeUcc1wIyZPuwBZJC4xOglLwElayBueekxb+3oSVYIfsWZLSlVJ
         IK0PTQvNJlgWxB27a+Hdsy/jx8myVS8bAiIMdGqp+uNmu2rETIWsGMEOTAed5MfJUKLJ
         YEl/wXFs1CyMcV++Q+jywDmQ9gVgec2HGwYvVpt+ZjCVDDuRztB3AbqOEioz2FGDNd2y
         b1nA==
X-Forwarded-Encrypted: i=1; AL+hErEVjN1qkbLxMMd9DD1EZ2CBUMUITG6dV1C+yadrh+SyiWCyOJED0c+gf995diyXiTu8eRRDg0w3d/KZ@vger.kernel.org
X-Gm-Message-State: APuU4Z83yTTnU98DZVoalTcAuic6QiwqpXZXEFdJkHaCnAErPfSis1kC
	8P3TeFTpUdVp/EqZoMc4nmuBQSHn1iN53HzSkyeZp3/ZdvlMRKnPHkSb
X-Gm-Gg: AZFdTZfla6PftVcH2pYfbUTz2n3cD1k7I5A35S2LkxLS5n8fscPyG6BjI5WIVoHPEYk
	82GqyzSZpntRIen+VjCxEPdM6GeTP/2PvxEmkhe2XbqVMZ1uDrPzspyIDAmxla2oHnPwhiQmFgJ
	lusRa1Q812ZLUXE76CTtJFs4TFPUBuiDu6myaWZSQqu9wYIdyFrJNk4EYHp++TJLyGoyUtVvQjr
	OilrLGbK81OtSiR53ln4geVBZNstI1JQOsGrchZzPVLMQKYX4QEX9xhk8vGduc4/fPtSHDUEXNO
	PAh9wsZe5RqFjXyzWy0mBXxLMRoXDsuKbhhXly4fsqMXvALkWLrFgqnRRAMcUE9eXHUvk9ytoEZ
	baVRNGrzXM01HoJ+moBHxChCEzHJ7FVZVvKd0MwiHH9hCxZcx5Nvvb0SjD2LH/AEe6MII/7jTqQ
	vkC5QSlkb/RTz+QG23mDCGNTwD9oA5uT9xI8M/+pXIKXwohjhS+upbSmxDNWq3t5CM9d91Aak0D
	/SFtKvlWLa0hH1HXb5URvBkHk5wkdg4RalsJEotLVPJ0m+JZCwKVhoCxL2GxOpDAOnfeghXLniE
	P+laywtkKKfSvRDgGmpwPK0G2an5966n5vRb4eM4m+fKMCLg7jqniXFin4co9qjAjFwvfk9Jth3
	0Qva8
X-Received: by 2002:a05:7300:339a:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3856fd5bf6bmr12682498eec.11.1795453080055;
        Mon, 23 Nov 2026 08:58:00 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm13315280eec.0.2026.11.23.08.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:57:59 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 2/3] arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
Date: Tue, 24 Nov 2026 00:57:02 +0800
Message-ID: <20261123165703.667564-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123165703.667564-1-coiaprant@gmail.com>
References: <20261123165703.667564-1-coiaprant@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Motorcomm YT8521SC RGMII PHY on the Ariaboard Photonicat has two
front-panel LEDs wired to it. Describe them in the device tree so that
userspace can control and monitor them through the LED class.

Both LEDs use the "keep" default state, so the PHY's built-in LED
behaviour is preserved until userspace overrides the trigger.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 983cf3d0a135..3cc05f08f429 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -391,6 +392,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
-- 
2.47.3

