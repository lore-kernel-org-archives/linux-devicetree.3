Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F098648A2D1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329338; cv=none; b=uEACu1ctcbbl14pDhMQSGSbN9pKBCOIG+GoH66mACweR0LsjHxK42jMMheVbHFbHQ8HBb3HsZkO5QyEwU2ik2f2KtD6x5hgB/wpFvE6ZS4Gx7UFfPnLezsIuOfTa5Xi17l3TJbyJrtKNXSN8NtOJhlKyw1LMSI3XyDvH1d0NVqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329338; c=relaxed/simple;
	bh=YYXBhszfUr1JhliGkjK/e/qiP2GmFVYlWneGxF8txDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TeSQce+CYVM5fNRZ9GDkAHYe56yzn1YGOYjC+7vAtr2ff8ErRQEccdlvW2ORWLQX2/4fJVz1ex1st9SCg8DxIFpeiuhA9uZy+PzSaU1vrmcmhURh5S+306FaY9VkFSF6vlOJWi5xz8lQo2iNr2glg4crbXUZ43LAkevmHKDsKqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsteSed1; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsteSed1"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-845c92bc464so1877607b3a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783329329; x=1783934129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEbrn8nkx2n3q4opZ/ye+YyaLjCnYU6NuTNhw5Plk0U=;
        b=hsteSed1NgmxKfN9Pf3ke4jrCWaiDpXVQzb8VtEyqdGu0JKZXdcbsRF7bzN+NkYsWL
         uK9pnfPyq9PTU/o0DoDZWYF1PUwQiZe1d7BttAQafNOwOsdylMi5nV1GDnEJPwYobPzC
         yyPbMiQiEczTCelj8rdWSZdRMsdjKg927rWWORGEhk+vR0BC4HcDY1VYjjkOZb23zIqx
         3L3orZP2B8lE1bJMTC2quc4cBYUlpzmpqlXjp35GBe2dkFyq8xxflXkgof8uLNuc3WYw
         4ngV07ui9Y3Ccmtsz6PqGa7fVCDIH1gvnEaKpZyA2CB8nIdBqNyJDI+vrpuBXS/2CPcg
         k9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329329; x=1783934129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEbrn8nkx2n3q4opZ/ye+YyaLjCnYU6NuTNhw5Plk0U=;
        b=URujz0gs2si4NP4aoKjcDQSNOPYpUumG0PcNPK14wIpHL99IX5PBJ9jIW1/IdfP5fB
         t0MPWKXTV5tyRsDFACvq8sVGDHpH158S8Low53H/HOtw/rjnod7bKIW6nmYU2S0Deabf
         qkbSli/0zn6GmJSKA8+3xyaXEDkxE830UJmBn6561+YLYJRDjKRhbtNO/aNfy67MkEmv
         IMc9LuDCmbnCr9ZbLx5lmf2sXTcNTUMGvNpMNjuY+mtIfNEfhC7PraR9mewv5qf0fyT9
         mHUylln3A8LQCaK7CR3DNEChSG7qERKwPybU0YSoKH+vqwuE/Re7ktGYfeJK0Yb9dkzc
         uCWg==
X-Gm-Message-State: AOJu0Yy/Wco5RCxbmHlS/4AzcfosPuZAdGYQN3MsbBeBiIX/MjRy+GeQ
	ZFbpsqkeViii8gkJu3N2YbgfThrmo43gqy9S4C0MlfTOJpqlCEU6fzgP
X-Gm-Gg: AfdE7cl2MU4BHICyQ4NUlXG/RnCpymA9QsKRxldRE7Dy1AZA23JbbpqRqE8Yz66TZmd
	VTNN3hdb9MIPJ9VygemcTtQ/bwzqDFgobOIOXhrunAK6dMgBAJYcd6u5nIKR3eWF+Wz8J0qFy+g
	pFaQ7P5dK7kE/3rZkN0PjOUx8MiRt+ZmgFERtoZBYqFhxtsuyf57gagW98kDbd5BpgaxHgnYWrj
	lgJf2e2pHyUUlMo4cO1S45skckXwaWzpQUVkq3WApFZztIMG9/AmNUoTSJ19MZBPjtQgyuNZHvu
	HC2WppInkbHSuQk0drFe2gWLghHMnNnK4zG9XGyyny8SBnniuwEUHREmkw68aQVvDWXrbYPRMJ7
	9sQsPNJzQIpS2tWOqmfvH0b9Qo8NErdBAG9iLJ1jPNdBaRKL33lCdiGvBiPbKmmul+dKFJp1LoL
	sr/2rKqymzTBvBKeYn9WExZRdl
X-Received: by 2002:a05:6a00:32ce:b0:847:438f:500c with SMTP id d2e1a72fcca58-847f6fcd568mr8517078b3a.60.1783329329369;
        Mon, 06 Jul 2026 02:15:29 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm3445963b3a.53.2026.07.06.02.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:15:28 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Mon, 06 Jul 2026 17:14:44 +0800
Subject: [PATCH v2 4/5] ARM: dts: rockchip: Add RV1126 I2C5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-rv1126-alientek-dlrv1126-v2-4-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783329287; l=2080;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=YYXBhszfUr1JhliGkjK/e/qiP2GmFVYlWneGxF8txDo=;
 b=YGf9TKEH3HthXKT99UhNu8l/oEBNF6pz0GwXaT72VY1OxJvp6qbSl8vzB/x98CgnlkQqZBtmd
 olvuTvIueVWBLVJh6ktacMSkePgvqDmIUYV1dVFhk9rWAWwM2WNlyT2
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=

The controller is present in the SoC and can be used by boards for
external peripherals, such as an RTC on the Alientek DLRV1126 carrier
board.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi | 10 ++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi         | 15 +++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
index 35ef6732281f..1d883b80aed4 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
@@ -123,6 +123,16 @@ i2c3m2_xfer: i2c3m2-xfer {
 				<1 RK_PD7 3 &pcfg_pull_none>;
 		};
 	};
+	i2c5 {
+		/omit-if-no-ref/
+		i2c5m0_xfer: i2c5m0-xfer {
+			rockchip,pins =
+				/* i2c5_scl_m0 */
+				<2 RK_PA5 7 &pcfg_pull_none_drv_level_0_smt>,
+				/* i2c5_sda_m0 */
+				<2 RK_PB3 7 &pcfg_pull_none_drv_level_0_smt>;
+		};
+	};
 	i2s0 {
 		i2s0m0_lrck_tx: i2s0m0-lrck-tx {
 			rockchip,pins =
diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index d6e8b63daa42..d0cdc5f74212 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -23,6 +23,7 @@ aliases {
 		i2c0 = &i2c0;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		i2c5 = &i2c5;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -400,6 +401,20 @@ i2c3: i2c@ff520000 {
 		status = "disabled";
 	};
 
+	i2c5: i2c@ff540000 {
+		compatible = "rockchip,rv1126-i2c", "rockchip,rk3399-i2c";
+		reg = <0xff540000 0x1000>;
+		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
+		clock-names = "i2c", "pclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c5m0_xfer>;
+		rockchip,grf = <&pmugrf>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	pwm8: pwm@ff550000 {
 		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
 		reg = <0xff550000 0x10>;

-- 
2.54.0

