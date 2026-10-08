Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291364C4F41
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473820; cv=none; b=s1lqjftsJN927QWauxrPKjV+B7Vw4BCyUVUO0LvwUfSlGNur4YyQ2k6gp1IRXtSVlKoIfXC1JodB4qcoT941y+mUNSrJ89ELtFu8z/48l/imyhpYBH38R9MEPrOH1zXIR3ATwqt2MF0l12sJVvOtXG5zYNTTxM3/vPNJkz4hl/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473820; c=relaxed/simple;
	bh=M34RpNu85eWYou4MHB1z0mjdW9jlDQqaminQuSj4T/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TIs6VCR4O9Wg9Ij0zAV57gOzRQc7SgZmTr6IMpFM1V49zVo87iuq+iGVzPNnClMlcuXD8QzJH2L14UL0K671bem4gZJAIwp3qkxkC+UGcok449k6ummo1QdszxmTqNtxhVIFHRqfDDAxKaP3I0OvAED6BXxyX8ScUV7tTpZQYyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJDmFSsv; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJDmFSsv"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1556091a12.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473818; x=1792078618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0g5RUJYsTuTINK7t/PSk6wKRYNvtbwpJDwV+1FAvsQ=;
        b=TJDmFSsvPBLPZq/6uZCoJeRVubaC/WS41L+j9ToouZZPzyvMs5kn3K0ePXX8hMk66c
         8JV8K1i58eZOH4kKpjYj9plLtFcgEwKdxJM0WYjYHxBrMOBxAl4jHhpGlaQ8U0GBUgt/
         Klg/f4D6GTAKJdKDqT8pKIRtIouaSd09l7qz9pyV/fXc/CXH5KVUmFJZCkDuUTfG+1D5
         uQFtb4TVXxBjcRuCUC75ZwImid3B+9nFyV7ezcjvW2ahGdrCmYBxBPWpeyCmjmtYr49X
         sNMT7xwIPQTVzB3ek0ssy1QMi77dNkWWhhn8GaL9H2eNELc2MlWmulzkS1npHkn8o3eJ
         i+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473818; x=1792078618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0g5RUJYsTuTINK7t/PSk6wKRYNvtbwpJDwV+1FAvsQ=;
        b=fI2J9CBkUlwLjkDJuZiq38tQ0wnz/im9V/D+p8PqeXmxkgy2sU5hBbYxQsXnLEzH2H
         ukUOchkyUtLbsAcHxKQskZSMZCMfvVGlGKblHWWBOsDQwX3shLHZGWy9vL85gIQLEZdK
         J/Hhhqq/x5CjRMMUSicDVf0CkSFPCCpg0r3ndBKWPYx9hkkyaBOSYIVFV9CLr0Pw5TWQ
         Id2N0G9a3BC6neGL/y2D6lc6UxkbnszyAn6RMyKz70dnRqxSf280APRsaAlCViE34h98
         QqwG14yFEIzAtwqV35mrtgWuUQp+EsBNRjYn7HzXWsWmO1dRULV2n3gtlz8rxrTP3NoU
         pOHw==
X-Forwarded-Encrypted: i=1; AKwUvByx5E/BHF4xHZLmFsBlvyJqt0Fuhf2VwCxM/kf7WImc4fbG+V4DhFk7gKpfGJp5N0XpXIODyt4SlMF5@vger.kernel.org
X-Gm-Message-State: AFuF++k56D+mg0v0Enh5bIHQPPxPwh7E1P7oDV0cY9t/hVEF7vYmeg91
	QbgRkMt9+1Oi7jJPlQ5h0C987bYWzLMsp7JpMYj7OzaB7oEwk5Q1d0KAEwWhLQ==
X-Gm-Gg: AYBFou0yKBZzZZrrYOPqF+XiH5BHtqv7wyIBmeS5jb6GbnpeODXx3ME9KNLlpWE/54Y
	9fLx1VdRuZ/QUawwT19s+8VWTPnXEskMNVe5zO9VT0lByd3Oca4MbtKulso0m0nBbTNegZZlo3r
	eaCGE94m8SnjXFLZJzzK0vd0fdXeeb/j99ksZIrCLdNarhFbe/eqL9cHtIPP833fOp+z7kk2cQN
	EN1IrTZuOGH9DTF0Os98b7NJexSXanLnJIBzFs9c0fsHfx19EMA4v7puWwjFvF5BpDMSl9TuO7Y
	Ms0DOzQ1G+47my8UJJAQvDaGRWsPQq0ndK8rpyD7rIvSt9qT5TfH0scUQz+vrz4vqncDktncyUo
	mwAjS2t4U8ZAKugvIHWq5IFVpi+67PG9GidzjhuVvgLLFlZz8Q12e7FD1NL9Rfyfzn9Xijy0eMw
	wgQNT3ctSMu9/uAqhwhv9FV4l+DQjHLq2B4MnR/0nHUe6t0/q3hCDy9PC5VUKO6i0qkMCMy50vv
	WjdHJcuqyEOFOgrDQ==
X-Received: by 2002:a05:6a21:608a:b0:3dd:85a8:4c57 with SMTP id adf61e73a8af0-3e1340542b4mr4754282637.30.1791473818297;
        Thu, 08 Oct 2026 08:36:58 -0700 (PDT)
Received: from arch.localdomain ([161.33.202.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd35736f232sm263479a12.26.2026.10.08.08.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:36:57 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add dma-names to RK356x UART nodes
Date: Thu,  8 Oct 2026 23:36:16 +0800
Message-ID: <20261008153620.238580-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK356x UART nodes define a dmas property but omit the matching
dma-names property, so the 8250 driver fails to request a DMA channel
and falls back to PIO, logging:

  of_dma_request_slave_channel: dma-names property of node
  '/serial@fe650000' missing or empty

Add the missing dma-names = "tx", "rx" to uart0 through uart9,
matching other Rockchip SoCs such as the RK3308.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd39..098493c04ecc 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -443,6 +443,7 @@ uart0: serial@fdd50000 {
 		clocks = <&pmucru SCLK_UART0>, <&pmucru PCLK_UART0>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 0>, <&dmac0 1>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1449,6 +1450,7 @@ uart1: serial@fe650000 {
 		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 2>, <&dmac0 3>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart1m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1463,6 +1465,7 @@ uart2: serial@fe660000 {
 		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 4>, <&dmac0 5>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart2m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1477,6 +1480,7 @@ uart3: serial@fe670000 {
 		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 6>, <&dmac0 7>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart3m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1491,6 +1495,7 @@ uart4: serial@fe680000 {
 		clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 8>, <&dmac0 9>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart4m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1505,6 +1510,7 @@ uart5: serial@fe690000 {
 		clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 10>, <&dmac0 11>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart5m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1519,6 +1525,7 @@ uart6: serial@fe6a0000 {
 		clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 12>, <&dmac0 13>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart6m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1533,6 +1540,7 @@ uart7: serial@fe6b0000 {
 		clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 14>, <&dmac0 15>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart7m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1547,6 +1555,7 @@ uart8: serial@fe6c0000 {
 		clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 16>, <&dmac0 17>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart8m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1561,6 +1570,7 @@ uart9: serial@fe6d0000 {
 		clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 18>, <&dmac0 19>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart9m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
-- 
2.56.0

