Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6569B33C1BE
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 02:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511275; cv=none; b=CAor5vqPHKX4vasMWlFqY2JDEMP770M9T7ijW6BB2zBSh8BDJQQigU2B32u0ogiAIoexQMj6kdeYGh0k9lIltIovVgmyvvpuRbrwHwMfIbz4eeWRM3mVSN5PE6vaF6l3+ri4Z+YK5VAheNQtL7dxoHFNxmpP3BBuCPJPMkd+lBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511275; c=relaxed/simple;
	bh=BF39Imc0aPpJB6sjFuVtuEzAu8i/MJ+OvJYj+kpDXRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fw7y2LWOzgliOY2TOJhfefCfn45eriMXDZ5tgPQF4ZDQv7Ovb9mwc28+l4ZFO73rSO77/B7p+GRvebbL+HVQU9Ifb7o1sPenp7Rib64z4+TUQ7SvUo9O08k8FHoTEqrIoiAB16mM8X9zbsdopmolN9GXV0UuN3tuVUPaDUHMoJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VijgIgw9; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VijgIgw9"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a706146559so2745647a91.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 19:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791511271; x=1792116071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2fDuH5AqlzghdgOw85VEEM3nScrcIHTb70P6L+D1SRk=;
        b=VijgIgw99PNAoM+VIWgJDLrm8xwBJ4zYVDz3+JjLF62ebs8jVIqNx15Mnyv13FqKok
         zXdQdO7ve7Bvho5/9YFqpK5NQ1N4+EMs0JrJwIYnL4pS/4kfw/Ugze9KVpH9BvGojYQ7
         x2nPe5eiBOYv6lM6PdMBTys/SmdPaUCRoxW34yfhsQqCuV1smWrrPdblMoecRw9LUUjo
         yWSHFdX5YWa7U1/EIgQHJ3Yx3ufZdTbmLKaMPRquHkTzLXtAg9F8zaQ0zNaO8NZEIhG6
         4E7TG73rV+kr/DMDA4h6neYwCi8NsDFqofhrkFSX9DTCRDgeTelm3rwRNgtDtwpuqnXv
         tk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511271; x=1792116071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fDuH5AqlzghdgOw85VEEM3nScrcIHTb70P6L+D1SRk=;
        b=pTD0OBn37gRtPoDB+JSA1P9bwBu7H91lwPloUms2+DxlveOdHEGhj5EQ+VFhJPnWqN
         Hhd3ug4t3L6OeCqnCkKiM18KmZGYTevWU3JlIFVkRvgeRX+kN89dlR7ehlcK3mT0kdZJ
         UlWlE/ZSI3Z8BIoyhQoMnS7IJU5x8/DUuH6bH60yXyf8HmZNEqdQk4W8Hd2yAwa4TSLy
         bPBc1Uh7DAEnqnv6ED6agC0foDnJpDRR26koBpVlmFf4q5hROjayjLLdHsz0JpPNR7qY
         yevwGDshB3eifWlkzRgJFyxmMOn1Gi/ZYnRlCXaSCcSJBdUen4ZdKQxRpalghlVGciPN
         HbzA==
X-Forwarded-Encrypted: i=1; AKwUvBxSeNPa5AhdzVoQgDYuKjO0w8MWGPMsrKz5dgdIZhRV16MCDPeSU/Zox/r81/rGrCSmP9WJDt9YTTHi@vger.kernel.org
X-Gm-Message-State: AFq9FYJeZ61XakAwDmf2skdcjrVUShokENHsBn/jxlB9gxxWpAaZC7gc
	EFwYoJKiQj1zz8W7N+NcgGXMu1EVRZXqczz/7HDD2rVtpHjzdI3Iyb/O
X-Gm-Gg: AYBFou1YH+y1hWHj7cGDh9+4AJuHLn58+AANh31IxujlfZkTadkoICt9yk/9X2ekT8C
	PtyWibFCi/shUW2g/aGq2xDrOHfJlKRWFkUZHWqM7mryE1r47HAHNyI6Sy+Wt+GPqUGSPw/vqtK
	aLSxWuCMkxq1h7hJxTWhHk22GkOwT+f50a4X4vpaSiGQo8ZpMxSoke+1k4gI/UFKuFCDjl8zPso
	0GY2sMMDyCQJIPtQ6eEoxyAfs4miLVGE0t7CqVV+jhAcJdRg7cG72mhJ2K/cRxOt0+tk2gFd35K
	aZYH2iE66EPRC6RjDWC7wLfCMQuKh8jEqZF9fIqMdr6Jtz8sPhFiI+cPbw5v+giyyM4pbeg91h+
	vrPq3g2bmysUChj4tRgh6NvXdMKDrd5nZjqhEjJQFmEI/GG5eu+xyIF7qKza4ra2eX9APi34u6j
	TBuPlWAzoHe6jILT++ZEv/8IqeMPLNOdXEaRYz89qvzLJ1uheCIBXJZXh024sNxvxriTdg8MX6I
	n5exEU=
X-Received: by 2002:a17:90a:e707:b0:3a8:796e:ca18 with SMTP id 98e67ed59e1d1-3ab3ace27f1mr572130a91.59.1791511271485;
        Thu, 08 Oct 2026 19:01:11 -0700 (PDT)
Received: from arch.localdomain ([161.33.202.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm1095770a91.13.2026.10.08.19.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:01:11 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liang Chen <cl@rock-chips.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: Add dma-names to RK356x UART nodes
Date: Fri,  9 Oct 2026 10:01:02 +0800
Message-ID: <20261009020103.364498-1-jerrysteve1101@gmail.com>
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
matching other Rockchip SoCs such as the RK3588.

Fixes: a3adc0b9071d ("arm64: dts: rockchip: add core dtsi for RK3568 SoC")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
Changes in v2:
  - Add Fixes tag for the commit that introduced the dmas property.

v1: https://lore.kernel.org/all/20261008153620.238580-1-jerrysteve1101@gmail.com/

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

