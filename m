Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733767;
	b=bNQdFmhxWW0eq6BHo0BP4IrLZ+f1vtoKUk59nBJ0C4iUEs/kk7SeGkX4fPjygZ24PAdi
	 yf4bzi+qQ7r9Zx1Z/dL7vZI1eOIbf1xN1OltplxFcQ22aRifAmpD79zaU3I0BwddV369q
	 WB8wmVKJdQVlQkfGiOsYljOt9zlWFkX4LU9WSKGmZgIZulnfHRx8f7GahkHjp/QtSWpo1
	 NOrFDfs8B7YyMrWiIhQscISHGMw6OkKWmbMYJg1QMXNLtDjA6E/knc5QGYUpwpNLEzCui
	 jbDVm7AM96W380PnMww3lE/TXYht5gxoSUkeKm6x2hFEt3Bme4+0YRs7GK9WYxqrJqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
	b=u0PyLaQDr9JRhLWqwpD/AnO8ZOYtw1ob54sYPycHABAeJV58mS09ZVv/F2SORIymvQLF
	 QxzziUCqPUq7ciEKB0VBLE1K9x5WXPqFkxGdx/cDfCdbcp3fpjDJZMGWq8jUrcHRmo+IY
	 Yl3uhAjqciUmycj2MrQC3YLG/rJpR5mRq7MFRN8ekGRknLISh9arY8Dy8luzgP0h/AQ3t
	 hRJ2zoy4WnZ0QBXXOZLcmiRnS8//s6lL6evqDdO+t2GwGZQPpPDYfoFL2Epph0jwsQAEd
	 5cWPOYPe6JkDY7ebM3N9f2VX88f5OCPB/hLXJ2oZIBxNt7rlJJGSl2leep9vS913dUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AIZG0qFW;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D582606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D582606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AIZG0qFW
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso509475eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 22:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792733766; x=1793338566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=AIZG0qFWjHkwIT0wrIs1eXiT5qA6l99euh43yGRBqOXU7/NTInvWaTKsiy2xRCs5LI
         C8Jd4zg3juytoiQrIv++0jgsl0aBNLbZOTEQvQAUi/eqzdw12q6Y37Qa5F+J0nSL1Z5e
         QXxMSpX8Kw9Q+ivTqOSNbr5dj4WQpuvM0qT866pEk+x5EmFID9d0siylZskjpI8am7ML
         FPf4MGAo15GnmvDGxzWLJL4NClFKycrYhapLpFM3h/bQmP8J+EdtCiW9VRolA2RTZSHI
         711AAEwf7vBxdxtAcS+38gZwaIOjy/oz9pYiDDXc5GbarvvdkK+3Bl5328ykIbKN0lW0
         14bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733766; x=1793338566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=z3iowiDleHWnCUA8/WdMbf8tv8WIVOZlCz7kQW7X1apQt/NTl9SrE/u+LuDpIEQi9O
         t46DGJzxTRJQVxvBFvNOTG9NiLm2OPeyhQLK6Om14kD/QmlA743W2/0KoeGo6Ao0cH0v
         4xOzlUW1FIN4AFFRmSfISSqKXkzp8uK3BD2A0kaLQdidqAlqI/Jr3vN5hjd9HrRPEbul
         W5xHa5t3d6ZHKRyW4qJ/XjyRbgTF4C+qTo1UTpNbGyEAUYfGkBqPBIloz/BU8Qx/2oS7
         X7SIfrRQyDXb+jaUSDlr0y19Etq/pCQMAn26cuQUc/AwM7Vmu1FXRkr+N6c/lXQsxCU9
         tupQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBixTU3hFIlbNSLyzHb00FeN3ybEqfGnugglhtaIXTTnSToUsvI/WMpewTWffXm73mVY7/Nty0LFi+@vger.kernel.org
X-Gm-Message-State: AFq9FYLM7TTD0jIuP5Et3htEHqdXLo/+BzndgDSawQ96HJTGlPE9xcEw
	yqTginsw9EzGWp6RltfWcAqsxd8EzFR9998HiArfJ1L0FMDQhzNks+Pt
X-Gm-Gg: AYBFou3sfs+ZwA6/wRd6bko+fePYy/VElp72ZcC/akYF+Ws0jh0YDpGmC/3rXXjn1lX
	Hdce488DlPOiaauGNx5ak19jhk2JWbxENgsS/Px1dvsKsBeYRb5oX9UEcVgwwGubL9OGjEJQoya
	lHKbUJNBtqVBv0VUu8QzPKn1wRiOKoeAf4d7D3g5f/3pVPV0OVvtOG5htwd11AH1otcGYkmNEEb
	/F/3cJfo96DdotBQfnnSlTegCALHQd88PVKg+J0b9eMmuAlqJRlyh+Mnw4yiaAw0L0UrCp59+EX
	/sMBa7IoTdjN/gYUm1yDqUxJfC85usZqx1/BaWegjuONPIOsWlOMsaS4zx8Kh7HxFW0tcyM+rPB
	Wm0YsdXqC3L+GHI3cRhLslBmj+Pmo5dy/N0BE6yZbUKwMCW+r5VIaPb3eV23+0dObX1o1I54Tw3
	dV9hTBUJbAgI6O/qpByrcXg4nBPn4Lq0O2/vscaZo1P1p0+QRyY707f16xTWfPOzbppc5KzK58c
	6pn6enhEqmGRPJjLSjBuN8CcPJFuYU60DDdEzccnava1MyE0xlGKg==
X-Received: by 2002:a05:7022:b043:10b0:16e:6e3:9a9f with SMTP id a92af1059eb24-195a065903bmr2116014c88.34.1792733766053;
        Thu, 22 Oct 2026 22:36:06 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm3542480eec.3.2026.10.22.22.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:36:05 -0700 (PDT)
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
Subject: [PATCH v12 2/3] arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
Date: Fri, 23 Oct 2026 13:35:47 +0800
Message-ID: <20261023053548.1595033-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023053548.1595033-1-coiaprant@gmail.com>
References: <20261023053548.1595033-1-coiaprant@gmail.com>
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

