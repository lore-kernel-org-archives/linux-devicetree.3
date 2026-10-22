Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637945;
	b=35s52jjWZKG+xtG+oqBRXD5AYmJd7gV1PlJOgIKWhuXPNcX0u6Q7kJTG/UCHkhbyfgn1
	 gUIWHYZUPVotrAgXyNZnD94xG1+8arBQHmKlWv3YdnCJ9FoKNmU0q4Jf3Z3TI7KWWr35U
	 ssdIIdm0LOdD54Zy+W6GgL+RnSCewmDBEYBifbSgF7pnP41VgAD1k994iYt7vis9SKIQg
	 lZjAkiQ9LjM0NTDZnFQH7znQEj9LKKUtz5jUsL3q/GVZrOnJ656Ek2KwojUAMjEK846hl
	 enpWZStWeN49MWu80xecWR1rk2gUb+xCEE7r7Yc31IdOF5JYGExIylJrriJQqRDuiDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
	b=MVHRIJ+y7fxhrcydrYVAjYDQhOkyX9J5yE7tcEp3Cd0TqQCOU596mdpOVitw1M9i/Fzr
	 Mds6qijUbzVQaaMCDOLzAl0M8RmaxaKj++nHovUmUWw2NXCaqZL/RftYbHIVZYNuvkFVT
	 VUPQzgLMz5pDfYEwSUV1OXEvdQrayx7veeYydtlx9JIJGnD/RZMChmzozRx25pDXROSge
	 T3PYZm/ybgyoDC6yfUrk33YlF3UsK3ozkAaIAI8nm1eHIiFayVzQvTW8I0LpNeZWSCyyy
	 F+S7xqvS4MewympdegonxR39G1lBVrm0wKKHk/pzft6iPL6+nntH+kF8xrlrCFLFRCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BRijOCqW;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147E4606A31F
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 147E4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BRijOCqW
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35e37b4a43cso210649eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 19:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637944; x=1793242744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=BRijOCqWNTAQhCurFBM+4UdZQ3pn7848eM7rNcVr2mlVVSEQOwC2dciFrFG7S/RTja
         z1i8J/nd3ZhSAe/ZWHVy7hOKWtVl0KMcI1oBEeNV4dW+6iuecKJD00luv8EnLP7PGl+w
         rbiw4+07ZuXf7btIAcTQg0SXaLuS1qvkRzZX7Huxtu82Uzafl3HswnJCAulsyqkJ8F0/
         +yDopz73Xdvhf7lBaa5h3M+HFiXWiCmjO+WTPVY0BYXM74gYEe8Tz4d0OWdkKkxeBrBT
         N9NV8EpaWMbbZB/Sg/E0tZBOUr36DuAmgh7sJ7MdBFVkofkgI/HB+HFz7PucP8bF2i4K
         FtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637944; x=1793242744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=0EW+unwmfXoMCR5L7gqFFtVBU+83z64G6gKXhyz0qvbbGyDvYprmJJ+Uw6Z5wCDFDY
         KM5cAdJU/nKDV4fd6G3R7DlZ17VRYl9ZLTzYZr5InvrZfCiEAwZjSl+/kKDLI9eb7tAX
         L/0BGMqp0z4OzfPOaGWF6taiYmM63IzdWHPbR3gcHoend5jfkr7J0Le/PaVHVG9RcBmj
         siM6Z184dL9PUoW+PLozXIgymBAwJxbTPw0PLQWR5XHvLd0E3E/JuqFzrtirX9ae0LPA
         k+Fvm8fhw2yu39MNssoN2pT7IvgGzokWSs86Os1Ze1CD6xCr7JITb5zsYYZxH/IuGfGd
         8S8w==
X-Forwarded-Encrypted: i=1; AKwUvBwfximXOd0guhCbdTxOXpCOHXKTKrjxDruzbBXx9vbhYgJjs2kjpuRFx9wvXC1y2dQ6qlxsWTXwObRk@vger.kernel.org
X-Gm-Message-State: AFq9FYKbXE6OwAKOoNd4OsFFDCeJBUizEQK+Ui01lNWkKqtKtpGX4UwX
	3NwO2wBn3wI3dQuS32NLbVt/HNDCuqUb5f4jiOn4j9++8WLGrjGf65l4w9DYm0UVL5ls8g==
X-Gm-Gg: AYBFou0GIJ4A7cmkZpwXMnGg3eEFm/8LSN3mNK1aHwZYA8Q8yxHnVVtykYSsND6YTgR
	q8bS5+ct0b6jLclXzMeqvcz5E7U+4IXpHKW7BaM/oE1JlNspUYT/Bs/2Jd3aNDM/AWogHMAdCZA
	D6RDPsu2GUfhMnS8k08SFhIXz/PrasS5LSMN9rtpl7tv64W+e33AV++Sx3wyM9UaeI/kipKvhWx
	xQ5RU5xIRG+hQIf5LhmoAhRwojlYeYpFdZUufjjMJvZGsPYvXJPOO3UBZpgYRAdeC37OQUbE50R
	CBGiwJEZpTXG3pK9IzvAiODCn1W9vN9i2HgWZKV08O1+Ani+8Js+jv3+VLWrm+y6wg/+f9bMbzg
	Oc9SP+CcypOXK+EurExVmVlA0AhKJm2Qou9N4jyxkdF8dQ5CHrkP5YwfA0qxpGATcNXPf1nVf9L
	5+kKwXCjL8livQmlHEfARv4S3SAYMk1IANfhDW/3sj5afBYaetjvwTnb+ozoxjkqrX9GKj0JAXU
	aHTzuenFS3j2jt/riAh0PhfY4IULRoyVOvBz1x/in3PN6Bd1yHVDw==
X-Received: by 2002:a05:7301:2b5:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-368af4a36bcmr1633520eec.10.1792637944031;
        Wed, 21 Oct 2026 19:59:04 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm13029572eec.12.2026.10.21.19.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:59:03 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v11 2/3] arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
Date: Thu, 22 Oct 2026 10:58:43 +0800
Message-ID: <20261022025844.150320-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022025844.150320-1-coiaprant@gmail.com>
References: <20261022025844.150320-1-coiaprant@gmail.com>
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
index 58c1052ba8ef3..12ae9159bea87 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -350,6 +351,25 @@ rgmii_phy: ethernet-phy@3 {
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

