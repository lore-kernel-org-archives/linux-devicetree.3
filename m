Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413A93F1650;
	Mon, 18 May 2026 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100396; cv=none; b=NQHRvq2+Z/Ch7wf+JKwOlK9dgRksYKkCtOc+YK0FjAQcD7+DMr/lsxDg7bGvZugOw3A3MKNzPHbQE5iHadBBE0XhliUhmv+7mO78Wtwg/bwPXOOO4SeMTT/1NuM9hOGSg61bTNf8PhkvznQnOdkAbBMMhIJp75nF4wOtYdJ3rHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100396; c=relaxed/simple;
	bh=Ni9fQvmbrgzkq9Jn7zqHNgRT1E+F5kIfL7a6vKy9HWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kP+DA6OBKHyy5dOFQVb0vGIqrRyz3zHLGgfdRwROg/LJ7SZ5J6O+m5lqHJVM356jihiWiMA4B7OGP27pnoko+S9VFTuPSXBR3rvQ+0t0Y2NaTN0xKMwl6q5vvmDoQA0nvA9rvoL0ut004UMsWViOTXH6YrTA6WFSjJBDOd8cxCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qzl36VC6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qzl36VC6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5A1C2BCB8;
	Mon, 18 May 2026 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779100394;
	bh=Ni9fQvmbrgzkq9Jn7zqHNgRT1E+F5kIfL7a6vKy9HWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qzl36VC6NQ+H2cueH7saMlIS4JGN5VwNcEuWdJLeeR7LDspbnwNZ48rC5OiBceJxe
	 XwUxzN07D6+I1xOeE1ulP0weOLX1JbzI3uRW7NB0nQ7wEnALshZlwYmD3dCZ4RyFY5
	 hTvYdTJ6AoSKwutNSHaN0FXoijti04gTcP+BxuSTCm33d/KQ+APECDQNA+xgHh4jqo
	 tZGJcjKboq8JqOuRUzQCgKo5BmYlagGt4XhatrGjaHnFpXA9bRZY7SQ3bm9vyDCeE/
	 xTPGuC+ME3ROq7FJckU/0qMwCAEzE7e17++w1SV4LUeC5BPX/4hFYb8rAibE0QQL/x
	 ym/H7BPR6z2yA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 18 May 2026 12:29:52 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY description for
 USB4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-topic-usb4phy-v1-5-71d827c49dca@oss.qualcomm.com>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
In-Reply-To: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779100365; l=2122;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=NxiWYOiKuL7FnNRrsrEKfegkS+O2u9GgOYEUAAJlDz4=;
 b=AOd7m6fqje/mnmm+RIuJqH2HF80M35P0IB4uPwFUCtSdk5scTkiVAPGoC3VAMSt99DCRVXM+P
 clIMsnFuvXTCJXktngrxtMdT4ipwtiD7YJKsCL8EDjQDc14ltb9ndMY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The USB4 part of the QMPPHY requires that one more GCC clock (P2RR2P -
PHY-to-Router, Router-to-PHY) is enabled for the PHY to initialize
successfully. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..63430f49ba2a 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2883,11 +2883,13 @@ usb_1_ss0_qmpphy: phy@fd5000 {
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_0_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			power-domains = <&gcc GCC_USB_0_PHY_GDSC>;
 
@@ -2954,11 +2956,13 @@ usb_1_ss1_qmpphy: phy@fda000 {
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
 				 <&tcsr TCSR_USB4_1_CLKREF_EN>,
 				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_1_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			power-domains = <&gcc GCC_USB_1_PHY_GDSC>;
 
@@ -3025,11 +3029,13 @@ usb_1_ss2_qmpphy: phy@fdf000 {
 			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
 				 <&tcsr TCSR_USB4_2_CLKREF_EN>,
 				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_2_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			power-domains = <&gcc GCC_USB_2_PHY_GDSC>;
 

-- 
2.54.0

