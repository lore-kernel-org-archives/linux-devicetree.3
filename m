Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899ED4218AF
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462076; cv=none; b=AuvzV9n1DfubXmoNgANkNc3yplrwYGKOaYVODXxp60UC0EukOMB6JWFFuZLsnJvH2TD9W8VN2Ip4wxz2tvP1F9vKH9L2v5LnASrUn9YbB1HlRWo/lFtHyBvBD15XYc0+fSeABSgpJL4bpMCL3FcqTAvwAisrMxjGvz3grOGlc6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462076; c=relaxed/simple;
	bh=4jcpeoXLPiOxiHalfAjuvYT2yGFc2c9p3Rs4rW0U/Ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SSZIzBViqMoAD9Ftf1UVHaBRbFI5IjZxRFzi6lA77ZZc1oUWpcQ2pvbAqwjPzU5tLEdcha5fyRxu0pBXzz9I47e37c0+WvUjyU+yEKyMHBtE4PMXnAcQ4JJa7d1ChN1y/rtdam/os6SzGL89xPnpJav/e4feE4Q6JiuCed+h0xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rg3CnNqC; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rg3CnNqC"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2addb31945aso877255ad.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462074; x=1775066874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+mOTnwT88rG+TLvmnzsj95Rl2YZE5vhiJFWZaB3EQE=;
        b=rg3CnNqCqo4TbLmH4nqVWi+2sac5TNqWk4+rZBu2G6KqgZOFXDwFbY0X38X3PuYl8T
         CTyM4j6rtsquyshphPvMIyDXjIsSg762Z8dZr7SSYwTtD06o2ioRivA+zqnpHrZxmo2T
         NhEt5JqtxyCVzDppAVYkzjonaBgYZNvW83GFdauYFDiCBSG8veHHscuMbEnN7nun6bcW
         C3iO2bgwZvZKvNAvYdsjc0EJBvXAaB/hlQLl7x1t7dlEBcfg9/tPMuT1qmhKyPIvuDfj
         gBGwB+ph4DgBWaH3nJFS1p5EMoLeZoUsJfanE10D2GhiCUVxgk8PQtJPiQ3YSP/mtnom
         IwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462074; x=1775066874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A+mOTnwT88rG+TLvmnzsj95Rl2YZE5vhiJFWZaB3EQE=;
        b=WUkmb3tq5tPucqFzr8GVkhDw/nHeV/V0hAJHxMUTBvcTXwXCDQZIncffrBs34VPW51
         ReUTrMKa9kfZS5QLzzNilscaK1kvnHlYspoPkPp54bj8XJIfQ5WoYqLFcP6ymQoCEUoP
         q30nQYbs+5Bvq8Ox07HgiB7uVtuTUjydxEPZ8s1s013wzw4lNgvrhktx+J4kLx+r3JWY
         l27JRBN/5TSsRjXm/c8LSn0kXE3UHehieXNsobTQYvNlEdQV/laM1olqtBIMfk6xm766
         aNpXLN3K19Yj2cnd63J6bx0/yO5fXiiui88yXKQpKYnNHY/L5RXp5O0bvL2tQDMEcRgv
         iTzg==
X-Forwarded-Encrypted: i=1; AJvYcCXpxr/CNHEpWfcNs5eOan6nJalUXDQzVnn5TiZriX1/VZ5PjROSDj+K4r0zZGdHxke9jEC5m6khAxTT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1+JKs/t5GqFBoF16g9FaeERP/gIjobqkCpOpQ43mKyvwl6r54
	UO2I/8EjXYPYRDDQxe0JRe3OlXETwblxskIL2bFkHyTqal+9Uu086h/4
X-Gm-Gg: ATEYQzys+LU6/QsAIqwcoF2XGlACjf7MLql8tF08TMf3VM/67Ont5kiLu2MymemD6Mz
	6ob4d+Quj0kuoaiagTDPAAEDWFnu+mYgaw9nD3jKX5x4LArndqL1bdB9exBPHU/JXMlek0xWPNx
	3TcNywk2Qr+8DM4GkiJq3DKF5E7k77Py3Bc8hpv9BwuhkxyiEu9SL4T6AYld30KUnoqT4ylE/9H
	9cCW2sY1sdvTfup8HNewZ7+HhQCKtowg0/PeWTiUel4xOnIDe9p2LO5iMjCtElilUhPRS5o/4Bn
	KpYgjxUiMZ8qqiz/Vda+w9VZke8oM/XEj9hR7Nxf953RLSmCKTBiHOmLZ7WuJ3131xlxU+bY3WI
	f72Oxp5EPHx7M2mc4F8ljmZEexV5j9rQX8CCz9g76zvtPUjHlU5rqFvbta8JcCWtvRZgGH1kjhw
	UAvY0zN5JGlCg8RYFZFEtSySB1ZYIZ
X-Received: by 2002:a17:902:ea0e:b0:2b0:afad:7ab8 with SMTP id d9443c01a7336-2b0b0ad2382mr51898775ad.29.1774462073914;
        Wed, 25 Mar 2026 11:07:53 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:53 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:26 +0000
Subject: [PATCH 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-3-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=1268;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=4jcpeoXLPiOxiHalfAjuvYT2yGFc2c9p3Rs4rW0U/Ds=;
 b=Rb1tdZWGQx6hFZr4eESwpKU4K5eOaB1lL5/HKB0tRnFVmA0mXAdsiwXnXAu3WdUAlnwWvnqE+
 PNBv5qA8IpBBPJQtzrzD1uIjANQwg3/048MKk8LX+Hya2EFjYmmWf17
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The USB-C port is used for powering external devices and transfer
data from/to them.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 88691f1fa3a..f66ff5f7693 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -116,6 +116,33 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		port {
+			pmi632_hs_in: endpoint {
+				remote-endpoint = <&usb_dwc3_hs>;
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1000000>;
+	status = "okay";
+};
+
 &pmi632_vib {
 	status = "okay";
 };
@@ -316,3 +343,7 @@ &uart4 {
 &usb3 {
 	status = "okay";
 };
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};

-- 
2.53.0

