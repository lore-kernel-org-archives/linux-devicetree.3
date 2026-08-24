Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AB336B90D;
	Mon, 24 Aug 2026 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587100; cv=none; b=A9lh/GKmYcN4dNOrbdxHx6JeouDQbUJ4f0AKzfWmzHR2FHefANlZgSm4aydIYdDEDAFm588s0YdAyazNUouhC4niKbReDx7Zw7QWfK7rEtewAf0uVuc/Bxroi+t0jdWWz4jDK7vhOqG7Z1bEC5hmsFblLcUfXGSnLLiyW+//HQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587100; c=relaxed/simple;
	bh=cVcXeRHvyslsmVLBqXrHui+InlEMoXZKZNk1lqcn9nI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyVGci+B/FaBgjL3t4AIb5hXvq0/0iGdgF3P6Y5xxpRqhYb5REnIN8hJvekej06xoQ7WzaJj9JItrmxyGgqFwNL/XXWRSD8cczMXC2U7XMeeEhS2uX4zPLseZABc+6KjNycQLiVVGnr68fXvRNcpKJmhwPxNKoAuhwUQOOa24ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HR36P9pW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HR36P9pW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45DD2C2BCFD;
	Mon, 24 Aug 2026 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787587100;
	bh=cVcXeRHvyslsmVLBqXrHui+InlEMoXZKZNk1lqcn9nI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HR36P9pWKR6bnEJ7xKy1/Ps/TI2LDxdMLGGNhd2l/Ys767/S7n8jpFgTAH9VpZJ6l
	 5zvI9sxt4qnvJBa8Nfr4ifZ3uUnHxlCXaOSfLM+7Nd0eeKfMGsbUjjK86BpayewGVT
	 vGhuHpUhcFPaZ9xNvxqF7LxkmreMb1JmYYMF5mQL6qcQ4o2H9647+6sY4KTMsY9UId
	 CiGQuyQ0bLJcUQy2QZZd6KfQTgmciXpimmQg8ko/OsnvTN2LlwHlcgWxwtxtRLANFP
	 9unfLVvFT2L43borojZ17AhPBTKk5u6xnYZl6IfC/nJpt+SWpnn0803U+nGZbbZZ8j
	 08MTKxuCFeKgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BE7C5DF9D;
	Mon, 24 Aug 2026 15:58:20 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Mon, 24 Aug 2026 22:58:20 +0700
Subject: [PATCH v6 2/4] arm64: dts: qcom: sm8550: add UART11 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-pocketds-v6-2-370161574ca2@gmail.com>
References: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
In-Reply-To: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787587098; l=2426;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=bgD+PrI79dJjgXNyHtVvqjOSMwAriVi0aLaIJ0M+CjY=;
 b=D83NbHj8TQM0MlVZxW7RHVWrzmpq/WuIYmglphVyDsoWsvqN/+A4pEgL+djffodIpqr4Y7bg4
 7A0mir3rJ+sArQZOtMn51tMa2G+YbrfDudkjYU9l8H8ah5sdgHcjQ5k
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

Add the QUPv3_2 SE3 UART (UART11) controller node and its default
pinctrl state to sm8550.dtsi, so boards with a peripheral wired to
that serial engine can enable it through &uart11.

The serial engine at 0x88c000 is already described as i2c11 and spi11,
so the UART node takes the same qup_opp_table_120mhz they use: it is
the same block behind the same GCC_QUPV3_WRAP2_S3_CLK, and its core
clock tops out at 120 MHz rather than the 100 MHz the other table
allows. TX and RX are biased pull-up, matching qup_uart14_default, so
the lines idle high on boards that do not fit external pull-ups.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..fcbcf22ff951 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1442,6 +1442,24 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				status = "disabled";
 			};
 
+			uart11: serial@88c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x0088c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart11_default>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core", "qup-config";
+				operating-points-v2 = <&qup_opp_table_120mhz>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				status = "disabled";
+			};
+
 			i2c12: i2c@890000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00890000 0 0x4000>;
@@ -5478,6 +5496,14 @@ qup_uart7_default: qup-uart7-default-state {
 				bias-disable;
 			};
 
+			qup_uart11_default: qup-uart11-default-state {
+				/* TX, RX */
+				pins = "gpio70", "gpio71";
+				function = "qup2_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_uart14_default: qup-uart14-default-state {
 				/* TX, RX */
 				pins = "gpio78", "gpio79";

-- 
2.55.0


