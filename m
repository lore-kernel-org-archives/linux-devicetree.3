Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ECD485CC7
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 19:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080331; cv=none; b=reIkVHd7v3Uxqz3xpWzWioEx2QzUcAf55VyJycfjkeyhUF7TW2Ez5idkTZwP5TMyCGbLfn1AJoyhlugHIXs/Mo4Ovra5y6p0ZyBwaHF5u7xig+85IjqTt07rshoxP7WmHcbLihlxuQV+lyLc2/Dy+LJs1geXRTez4k/x4tXhX/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080331; c=relaxed/simple;
	bh=rUex5+DlYbx03TzwHxSaWvqWq/vHsB1Li2LU5Sp4atU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XkcOtJP35suex1VsSH6IWOas7jXmoojFhbeCN/MnTeVMb09CpSmK/YLyJ+9QQPHR3wiEdDAmVsdwpFnNQVGeCFtWlbTKMWJMGORqYJcIV12nBlE9M+7FxnZ9FuLuRmo0Ny9apNQ7b3WJA9x5rsT1R4Ct6pbWfZiBDy7bUZ6R+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49557167508so2218575e9.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080327; x=1787685127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0MjCxxweOWbMxqY3PtSk4sO3PpZ21pT7dUMkgSduns=;
        b=dkCczpLJ0ynUmO7ZZnM7JTPMkRHE6Mh8K8lSBGQtwpB/817qIcqdYlSmGmYmmrPgcR
         vQv02BOClcPwJtE51iF9e8YBkxeZZ9/ZP4syT2++KPgmzAMxIChsFmDVkt4S0VhpN2ua
         UGivlAA5K437SYzf3FYebVfTKJCjgvhpDxGvlhPkQ+pjLQaUItUpEpBUoQM19nb3NT0p
         0e0rO9lq4BXf61bXiG9RKeeJDUA8lGqEsl8TM6bx4O+dyXtzWy7KgbutdL7+5gJocnVp
         kJZrfJPh6wBGpzLNgjN5rBhonHgj5kHS6+sij9uNnA/iFtQ1R+OTcpB/+o0z++CJDg6E
         BoGw==
X-Forwarded-Encrypted: i=1; AHgh+Rp61gbpPFXqE3kfSFhyLn08D+wQwcHoFofewErSUH0NIXTediMzJ5vTYim2IL9ShWuYbEgw0+S/Gv2o@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7iKz8GIDI6d+2T4aUBRh23RkQjF4/2yA5l6vXHLMvgL7HqCyE
	KJMbtYbnftH0cHOsz5rK4bcZPSYlf5cZ/HPMHUS+2H+/DnFrnyTh/xqV
X-Gm-Gg: AR+sD13cg3yFSgjLS5o+79kYau5nIpesH1DmUorOlcoi6sSANk78JQB9W5u895poXtU
	90dZCfQXPKGBTNq0WddObjgEGXaxQp+ZAh1njgehLopPoO8d8EYfsGzgQzO0CPRca/FY8NIsgok
	0WWw9AwjzTGfkYs5Iu2nOTp021fvcyDoQCESfgV5HsPjX7+MB6U1+IC7FPkPLCIOcc4u/XTkwXz
	Pdv5BvJAheT7VY5act2JyfVld+djtin0nMT2YNPSdGtsx+JdVV/Muuhr6tuNf/x9056L+GndwCK
	Ky2fWilMYgSnO3j3IWj1nzKcVMptrxLqv3msfVhFR+0w2daFf0SP8GC/d6Zx5ADSSE73uxk4TQ6
	i9BcLrRNJ7JSRdtfLOBQ9j0tCyCxWkImIQ3x4ax2HIA2urP3BI8yoqxmYnaAA2THxjXi4JZiiSP
	687hMv35MhWeylr5O1ETAhf26LbKttnINqEdzek2cfw8VnHM+QCPUMPWctgxA2kcmS5FF+jOpTq
	8pWna4c/NBIiKfPOjMip2jkidY=
X-Received: by 2002:a05:600c:3151:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499a9052a5amr2327525e9.15.1787080326827;
        Tue, 18 Aug 2026 12:12:06 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm14673154f8f.31.2026.08.18.12.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:12:06 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
Date: Tue, 18 Aug 2026 20:11:58 +0100
Message-ID: <20260818191159.11523-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818191159.11523-1-tanure@linux.com>
References: <20260818191159.11523-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uart_a lists the 24MHz crystal for all three of its clocks, because
the T7 clock controller driver did not exist when these boards were
added.

That leaves the real UART bus clock without a user, so the kernel
turns it off when it disables unused clocks at the end of boot, and
the board hangs.

Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
the placeholders from the two board files.

Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree")
Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
Signed-off-by: Lucas Tanure <tanure@linux.com>
Assisted-by: Claude:claude-fable-5
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
index cab2ee9ea0d3..dcbcd08a78b9 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
@@ -33,7 +33,5 @@ xtal: xtal-clk {
 };
 
 &uart_a {
-	clocks = <&xtal>, <&xtal>, <&xtal>;
-	clock-names = "xtal", "pclk", "baud";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index c41525a34b72..677069e58f30 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -266,6 +266,4 @@ &sd_emmc_c {
 
 &uart_a {
 	status = "okay";
-	clocks = <&xtal>, <&xtal>, <&xtal>;
-	clock-names = "xtal", "pclk", "baud";
 };
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index cc371fcd1896..7847582e77ed 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -587,6 +587,10 @@ uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
 				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>,
+					 <&clkc_periphs CLKID_SYS_UART_A>,
+					 <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
 
-- 
2.55.0

