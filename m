Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177973;
	b=PpMRAKC1XA/ubmGB6CF+jFsvQx3ng75ynBya56qaUgc5RanX8/DTVYW9lrtfKra1ayih
	 x4d5eVtE/HhD+IQ0juiLigayGz9epGR58+exANCo2dXNY2i7+sVwTg4v7PTEqISY2E8CS
	 FfClL37oB+sgP2wXUwkVyduNeLsNiH05iaFa/f4N0ziNyN84mpCzyQF8W7NK1leKJobgc
	 ZpBVtrqUjmfE96lv4c/TaNw9L5t5bLeFf0nD9+q1mWbMVzVtCTTktbIq0BOP1VJ6FCS4h
	 B4R10szUsKsv/+hI5Q0eJ8Vr6OYEaRjl6SQvQjdM+HFxr/Ig84vFTPJ30AuwC3iaELA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AJXcbffl1Kij/wVcnvrgEoCXcFbDtnBB4PE3lMLxAVw=;
	b=cV07Xt91rD7wurvYUkOA1f9zCxg4A6tAyZx4uSBQk7RyolJ2SN7Rx3M8HQcNC2RB1lln
	 ncGbzb6fsv8be3GT3ryVpuHluxxB8uwP0Cs2Ul1sPL14XT/Fg/kMP3xNTnCvyKKdRul6k
	 ulCPtMWJlbPKova/pLiINCEcz5WsPhsC42XJG2ga9y3G+UWcSl5vZmpXoTWpbCWzK6HyW
	 kgaqigWWk0EtxgJboluQUJb2gwZZZBeXZlBW2ctWCbpuyncWIAxnxVpqEwege+NRqbLvI
	 SdcLTF3ES8FuSGlcyG34oBg2dolsa3fWj9QgCoeWvKzdHPQEsry8qRyn24JYXtZE6sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+ZWhWs2;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B23F606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B23F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+ZWhWs2
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so410377f8f.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795177972; x=1795782772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJXcbffl1Kij/wVcnvrgEoCXcFbDtnBB4PE3lMLxAVw=;
        b=W+ZWhWs2nQMXLG7qI2TrU56/xBz3sSeChLhRNo6VCoDD1Oma7vkSUGU2x4UuI3XuGI
         LcvPCd60P48gRJzEJB25ddwTxIPylvdsVrGjGnaIOPUqE3P3vwnUVLXvK6bNIpvscc7l
         kkS4UycoJca/fHUz1/sivWnZc9pryLK7qJXKZS/edTwpabQkFVcPvsZdO4ACbA3ZQkt+
         Sgf9PHkxlZ9Bz1NjgEoWV4Hha5ZmA2Myzjm8STkw4RAwhReFKuylACLfl74aDjtgrgHE
         cba0wN56zk2arT5ImPDKi/FhzqO4YDEYgi+uCBd7LxannUkBC7tVaXlQY1IMDVmAcqhy
         dY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795177972; x=1795782772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJXcbffl1Kij/wVcnvrgEoCXcFbDtnBB4PE3lMLxAVw=;
        b=DHsVYjuWuIxMegKcTaZ0BD4ro7mh3dYOMdrUIeGApdHbnrL7qhDIhSebFU432X7ROr
         9P4UC9Wv3M4MQcZlx2Wv2FXAY3tF0jhiHgbrL3vEoUb1ToZ5GUsqijGjyvIGjJ7uNFyc
         uVGzXA0KLtWe/AckWUmsaYyv+qD/b5cEzUCrmN3aYUhxkmp3GeEhDPyU2Q2e6yUboRsL
         nTx668zJJJbkukgDMeAst/BaOxWwRoSDc86tK/NK09j92nUo8Tj8h40tjO6/Aqfdw2Jd
         0RcfVZH08CMy/nnNa50VW49orxcPH5Doh8Ps/v608+zWOnWEXPm4Q72NrT7E82OtNB1k
         5cVg==
X-Gm-Message-State: APuU4Z8NcX3T/w3MFyLKHL36PF0NqpSfjZl2f0m17quCGsr2TmLrDSEh
	+BBdSVxVCpQAvS/SSWadH5a7HbmhT0UCOc0B+YUeZULG9FrEqKeQbYJa
X-Gm-Gg: AZFdTZffOy3YQkOnfNmIIHOmS0h4DGN9/D1kTn5rnUKCftjjT5QDFWzcCuksiGVs1Hu
	XllmVIpodOPCAfPwmQDqtnY5pi4Qy8ZSAEvRM6KYPV0N7DPtTY6pdsTwQMnLqehM/1MzPqfYT+6
	8buDco0uF5CeG1ziBPixMxp/qLJ5rSZc89Ti3YYUq3KWuZDcUkLMu6+RdR40UnvwAqGKYwJzcj3
	m5Qy3+QGYhg+PScZKMF31R0bVJ7+HqjolRaupltW4AjNH1GbNVKl6Qkl0JHGwrDBr+sm/HxcEv6
	Mlov/IRNqpRgZneAj6KUsoFGOnpWgyYqx1qjik7DRTonGQImYbU5yW7ZEaUDeOVLvcZ4MMJrYg0
	Ysfb8DI+mFbSfURQD7wr0Nq8btew7RbL7XowDLnbuTjq8Mk41QEKdKLobGXkRkJlzkoeU6yhFuq
	6fwi+oWp6yRVR+kMpclXdhgchYbOmjU+1V6REwaRAkKTWw2i43v7w/aHv4poJGbegV1w9D/yFtW
	jVlMhxcb1FCtZ6hFKJ6IM1TqN+2PHaJWihOIDn0DUVYYO8khvR7eW2Vg/XSBZJ3gDojszvCEB4x
	/DGDDXMnMGxPvNZuCrvBVslIgK4JXpx+jF2Tj6kzn+3O9ziQEI+P0RS6IBdQyp8+FucMMPnuqWH
	t
X-Received: by 2002:a05:6000:258a:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-4abaab633d2mr6296799f8f.5.1795177971631;
        Fri, 20 Nov 2026 04:32:51 -0800 (PST)
Received: from debian.tailb81abf.ts.net ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61ddsm4968496f8f.12.2026.11.20.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:32:51 -0800 (PST)
From: MidG971 <midgy971@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: rk3568-rock-3b: describe the Ethernet PHY LEDs
Date: Fri, 20 Nov 2026 13:32:50 +0100
Message-Id: <20261120123250.1417061-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120113555.1402132-1-midgy971@gmail.com>
References: <20261120113555.1402132-1-midgy971@gmail.com>
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

From: Midgy BALON <midgy971@gmail.com>

The ROCK 3B RJ45 jack carries two LEDs wired to the RTL8211F PHY LED
pins.  Describe them in the PHY nodes' "leds" subnode (binding:
Documentation/devicetree/bindings/net/ethernet-phy.yaml) so that
PHYLIB_LEDS instantiates one LED classdev per pin; the RTL8211F
driver drives them in hardware via led_hw_control_set (e.g. the
netdev trigger with link / rx+tx modes: amber = link, green =
activity).

Tooling disclosure (per Documentation/process/generated-content.rst):
the DT hunks in this patch were drafted with AI assistance (Mistral
Vibe), then reviewed by the author and verified on a ROCK 3B board:
the two PHY LEDs appear as stmmac-*:amber:lan / stmmac-*:green:lan
LED classdevs and drive the RJ45 jack LEDs via the netdev trigger
(amber = link, green = rx/tx activity, HW-offloaded to the PHY).


Changes in v2:
- Fix leds subnode indentation (align with the enclosing PHY node)
  and add the blank line after reset-gpios, per the Sashiko AI review
  and Documentation/devicetree/bindings/dts-coding-style.rst.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 9eef59ef7d07..9303242d20cf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -605,6 +607,23 @@ rgmii_phy0: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <50000>;
 		reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+			};
+		};
 	};
 };
 
@@ -615,6 +634,23 @@ rgmii_phy1: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <50000>;
 		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+			};
+		};
 	};
 };
 
