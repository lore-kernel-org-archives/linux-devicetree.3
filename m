Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C64147987F;
	Thu, 23 Jul 2026 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813041; cv=none; b=ToqhwfqB6+xHgbFQSH/5FwSQFdOSZQujloB1JNiVD9R0mVXRrM5J355DBKeW3je6bq+7uPVgBF3RabhoZTwkSlMTE8QQb648L1UcucwTOKnYnezh1nicbQbPv0r4ZYfcMZczVmhzS2OQglW+dpm9PCSg5qGcG8SxOkUutbpfzwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813041; c=relaxed/simple;
	bh=pFrNQ+vXwn2SVn0jpMivPcgXgNhBFkuVJxH9gKNMncQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5JP8JBgf/pvCYmqTWRspkh4y+6GGDsrAFgCGEP30uUMDvRn5sxDf7KleJVIlH0xSrNza74I5YnbQK4xp1FO970ajGSkxepvwME3QC0tuRhuUWTxzVVhu1XrRA+gsaO7ApmmU3UNuconhJ3A6egAGW5FOJRWpaJ4Lxsa1eovh1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFKpYkYG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFKpYkYG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0E39C2BCFA;
	Thu, 23 Jul 2026 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784813040;
	bh=pFrNQ+vXwn2SVn0jpMivPcgXgNhBFkuVJxH9gKNMncQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SFKpYkYGMaihSknIOT7v8cRkyHCCHycPHbIt6jhN0mEu3+SxY8/F7Qbd42GCGyUrA
	 wv00Z4K/RjZfna9f9jIZKta7BOTrfeCYsMOmMChguV2HrUvtR4JwzZQu0cMU1uID27
	 b+nYttheZacoFBL5S0qDfo2Gb8W0J3WRhs70Lm/TaB4hoBR5iSO5waaVD0qMBfXeg1
	 1m5uuKSgPyfMfQP1X6Id2bfNtD/+5dQ7EJGM5x61gl3LaRueIAjjlfVEKGCFxX9yN6
	 Y4htzUXPbv2bFd3RbI6X5/gAj8K6T69lb2D81O5IcxWxTXOI1G4+y7Z8mcwHTKsuWo
	 0rHkwbjRD/8+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B80C531D1;
	Thu, 23 Jul 2026 13:24:00 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Thu, 23 Jul 2026 20:24:00 +0700
Subject: [PATCH v5 2/3] arm64: dts: qcom: sm8550: add UART11 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-pocketds-v5-2-74508388c716@gmail.com>
References: <20260723-pocketds-v5-0-74508388c716@gmail.com>
In-Reply-To: <20260723-pocketds-v5-0-74508388c716@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784813038; l=2426;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=UsTWpRDwbdpHTBDdFtzyoL0z7QNs2yHTYuBRh3JZWP0=;
 b=yLFGt/SwyhDRjBpgFNCTH2PiDpQlgEc/SbBJLwml8X1cifJUvYba8vpc4F4xm6QNC0rHkmekv
 1/WQ8lsAi2bB5wqW/tKmoWXId0ufhrya9EPRv12SMJgnmER36laKc+J
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
index 912525e9bca6..165c0248da53 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1084,6 +1084,24 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
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
@@ -5102,6 +5120,14 @@ qup_uart7_default: qup-uart7-default-state {
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


