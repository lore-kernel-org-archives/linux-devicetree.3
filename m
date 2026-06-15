Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D02F3FA5F2;
	Mon, 15 Jun 2026 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533343; cv=none; b=lH8PrHX493sbWkpE1LMXbfYw1AdGnUr1r2Rb1UzsCcECqxlBrCiUSPN0/k3PR2zjyYC7poZljQBHwsV1W+TnPXieYCvpn3rxXETVDKZRzD1PJIeY+QZuIpFkfObpbMdIcb2VQ6qky6OGUVbIzSboBwocwD5me0+zC9usNLdL+Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533343; c=relaxed/simple;
	bh=a3sGvrgjmZKsKLeWu0H7wAq10WO2RWfTqn3cgNFJllI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0cQ2CcCyzgYWvdOTcVX2/2Uxix1gZUOADm1jsnBeJHOnkdnu63h92qwP/IICbdHYEVLKDi8MS8uYYUAtLpb6X1MeywKHwOVRRXmmqOVeFOOlk9VE79OWCOFiUTO9TJK7lBuI0hyo2xSciPGxYqaIPI2Q6OP7uMZIVhTiBTxFLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I74gtzpP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I74gtzpP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1041F00A3E;
	Mon, 15 Jun 2026 14:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781533340;
	bh=ESoden7egs3sU5sTrE7hB2PCSZyctgqgW+5rRoi8WGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I74gtzpP1Zl1R8bFf9/CEIpoqupHO4h9cXJ4DrO5DNnZD744OCWBSLX8GqQn3VQtO
	 W/xb7E7ById+f/dic61i1Fvo6elmYIbb1BAGGpaj9zKyAfTnqFo5vOMPnFsFLv5Uzw
	 +FoVEPMl/AI+huoSyyNby2kgBI39oida/2mGc8CLjah1mu5MsCJRO7fXZ3JeTYhzuE
	 ZapEkgrN0s9lz1MGWcVPMiOXhnLB2DaR8N+8dN13X8b9gmjww96IBBdGKGJf1iCF5s
	 pKD5eXGT67VO6gamwExS0gI6cYciaXCwZwXbJQC1pQHrC9PeaHWcHMKcQQO124jl+J
	 vB69VA82Svq0w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 15 Jun 2026 16:22:04 +0200
Subject: [PATCH 1/4] arm64: dts: qcom: sc8180x-primus: Rename regulator
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-8180_disp_power-v1-1-18d36b548c48@oss.qualcomm.com>
References: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
In-Reply-To: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781533332; l=1641;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=/yevCDfvSjiW3dJhcHjUzWgMlSqmBW+bPLn3gCeeGKA=;
 b=WeVgSvCDOjk9l7ytKzn6rF7NCvbujWz+mmhNMVcSXGWbzELdAJyt/7C394uaxLROwfamesZtt
 O7orUeQPbB4BeTwvr18dCgsLxh6rKGBGdcb9TeYpRBIPJJh24x7ox/+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The nodes would be sorted correctly, if their names started with
"regulator-" (which is the style used in the latest submissions).
Touch that up.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index aff398390eba..ffe7c45366ed 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -167,7 +167,7 @@ reserved-region@9a500000 {
 		};
 	};
 
-	vreg_nvme_0p9: nvme-0p9-regulator {
+	vreg_nvme_0p9: regulator-nvme-0p9 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_nvme_0p9";
 
@@ -177,7 +177,7 @@ vreg_nvme_0p9: nvme-0p9-regulator {
 		regulator-always-on;
 	};
 
-	vreg_nvme_3p3: nvme-3p3-regulator {
+	vreg_nvme_3p3: regulator-nvme-3p3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_nvme_3p3";
 
@@ -190,7 +190,7 @@ vreg_nvme_3p3: nvme-3p3-regulator {
 		regulator-always-on;
 	};
 
-	vdd_kb_tp_3v3: vdd-kb-tp-3v3-regulator {
+	vdd_kb_tp_3v3: regulator-vdd-kb-tp-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_kb_tp_3v3";
 		regulator-min-microvolt = <3300000>;
@@ -205,7 +205,7 @@ vdd_kb_tp_3v3: vdd-kb-tp-3v3-regulator {
 		pinctrl-0 = <&kb_tp_3v3_en_active_state>;
 	};
 
-	vph_pwr: vph-pwr-regulator {
+	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;

-- 
2.54.0

