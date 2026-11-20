Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174558;
	b=AOtTeM1uBB4SePl3vq9lM+ilS/02VydRCEASg04yeUEYj2w8wHQLKW47vFsjWMbR5Y7B
	 0MLePQSDRWYkq/ZlpazpsV0sL45S1ZkvUAH6Vv5zUoAbk7S9WIe8jxPs7P5iqLe5hmfOE
	 TCiDQel7hmS8J9SA61S4LCortQ5XFSuydySjWrYb6WGevCjYgV1NV8kZzjhFHc+Mi0zBF
	 /qrr5KU5RxGPsni0dzovOGjrHYL1xPTmbG/Vc03Rxrkcnb8bZPBme0Y6B6TbR0McTHWR1
	 vfjgO/As6R2qCsS/cJycHcZbMTVnBeNbfKexL1uDasYF7qTFtiLYxW9YkxJQ6jZOadA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5rrMQra0cZM9+1upaJuZrzcLt5QpE789pWlJu6nut9k=;
	b=AJDieBSi7oLvZPWAEzwqT24I7WUf1pLlbJ5KYY9n0S60xs/bJo3GKB8jChw+epMulKF2
	 VlJU2unMsAHAtec2o9yyWY6UJ6oygrg0kdggyLw17a7A8T+T5wlkq2fR6rx2oVENIeFxm
	 WJjTMoNqrgpdsehEqbBFN+8TcUcTk+UV66xbaOoSO6CgQOehng089VIhXo3RId76Uy6Rr
	 Iko+9tIHH5SsFfe2bid0HTwjkIS23DYCvvkteYszCNjbukZVF076DajGhoNXEft1Ap3j+
	 +tk7F4+a+/ujFaon9J7doI3slA8rldu8f36goX/vLAw5OhclJZMAMNgvAndy8r4toXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6ec8YVt;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A9A606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A9A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6ec8YVt
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so544742f8f.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174556; x=1795779356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5rrMQra0cZM9+1upaJuZrzcLt5QpE789pWlJu6nut9k=;
        b=d6ec8YVtCgtyVNacfmQ7jNus8ctY4Ei8C7WgRaZXfkKbZ4PUHfIGnkTdUgzosVaaLE
         5MuqNefMZP+8w3G3sfRiDbnNC8y06/+965Q6DhkPGW4A5S6EIvMC1WwNNc8bZIx7jir6
         pjibdsR1QjkGeZNPevmSyTPS8pd0lvAHSsNcJ0ElQMN/1+F2r3n7H6XLCJADUYm+9KZ1
         0qxi0vcrrWD9QeLstlZQRDFH4X74YApkfvwo6+jJFNsJWCcrByCJgOBrP3HvdB8Pv5TF
         Q5S8po+ZNXIR+9wY3U0Uzal+FS69vHH0uSeavGTW3J9OmLs5s2wJZ9qPjtbYbZMqYwyU
         sYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174556; x=1795779356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rrMQra0cZM9+1upaJuZrzcLt5QpE789pWlJu6nut9k=;
        b=ZIB2bOzam2P5zcLGbac0lRUx6l80MOEhyK040D7uVgoFmS6jMuzzM3ASKhVYeOiwxK
         o00luVdL4DT3Zte3pKi5fhBs8h6PDEr1BBlRtQgHg3paOcGuzEqmZCDVE3xGaCC1o1qC
         8i3Aywi2N7t2ctdHnQfX52udzH+BSko11VbY+JZxcuUn9ugabE/ii74A64SH7hcA1jqv
         4D5AQdDN21Rebl02P2VZ9frB1Od1fPKhYHP3E7bQD/rPRhl0wTrbd3MA4WbVMNvSDNOW
         msl3N32XHVDKPMzhLGqhjDSF8n477LzWO8lhpHpxOuozu+UZB85azVdnf6mFClSvDAPO
         xlPQ==
X-Gm-Message-State: APuU4Z9JALY17ocSBCbXB+kibPgmdldKtSNIuGtageR/3WUilfS2ZgyD
	TMIzwR79ZgdKyVB8UM1uLtjFpYcxNygsxXhf7yMvNnFAy1j8pKdXWeRY
X-Gm-Gg: AZFdTZcsOTVUwF5Ko8QDpHTFnuKLgHVyh5dTjr+j5jYHl9oS/mTCjD5sI8kb3ls8X1e
	jW8u1TtgREWP9ef50RfpgmvKicCWdBzR0ba8cW2fkPozWP37/IDn5saYxZufvxLqShoaPPKMQml
	iHEAg9Q755fqIg2AvXhhtCVEqvHqMa3IYtk3Rdy3eShn8MdwZcC7sdrHchSubQqlZeg+79pFEeN
	9Nx6VRkDLjXiLvqTzawqQ9Kbwq+Lq3UZ6OT8FVvekhvxAquAMLvvWEGpyFmEr2pwfAF6ZbxDDbU
	QAQUOzG0wRmDJuFfYuBu+jE0BJ30/pA1ntsQx1d7Sjxn/qOpAC5IwuUVpb0QFSczooy/7c5CCKz
	bdgwg8De7ZK9YW+MZK/nM+BQ3d8mWOnPo2WTD3F490UyDkhHw+DZQq8U5X4jOaR0eDpv6eVAvhj
	WvSx63DTV+VolpKetG/YpvYg1Aq2K9h7iMy4mfS+GnoOFGIfM/hgtajCRbQ4h1GRj6TEbeVSBKL
	W5sdAvck3YiDlZGlaTNt0eNwWRFa5RxhItdQ4te73/JvElCaVM0dX5FOu2uR6wKAxvuWwn3lcvB
	EJW2u4ShpE84XYfri89XPAVLTyl+W5XFaKhtOGD7qyuoKrsN5wCqZDyIrHflfkr28Y1ISfgrYHM
	=
X-Received: by 2002:a05:6000:46cb:b0:48e:4300:c6d8 with SMTP id ffacd0b85a97d-4abb3d2bf37mr4464668f8f.35.1795174556179;
        Fri, 20 Nov 2026 03:35:56 -0800 (PST)
Received: from debian.tailb81abf.ts.net ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm4735728f8f.25.2026.11.20.03.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:35:55 -0800 (PST)
From: MidG971 <midgy971@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: rk3568-rock-3b: describe the Ethernet PHY LEDs
Date: Fri, 20 Nov 2026 12:35:55 +0100
Message-Id: <20261120113555.1402132-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
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
Signed-off-by remains with the human author per the DCO.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 9eef59ef7d07..8ffd393cbfb6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -605,6 +607,22 @@ rgmii_phy0: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <50000>;
 		reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_LAN;
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+		};
+	};
 	};
 };
 
@@ -615,6 +633,22 @@ rgmii_phy1: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <50000>;
 		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_LAN;
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+		};
+	};
 	};
 };
 
