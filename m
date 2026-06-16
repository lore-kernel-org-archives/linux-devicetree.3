Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCCB3B42E0;
	Tue, 16 Jun 2026 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600941; cv=none; b=TjF/vviWrge/ZB6r4Ni6tivniVxXtFvXrYILOLnzgU/Ua1dRIHuVZboSr6lrJZ8CHhooFnG7AHrVpCFgavsznS8uKZ/hZpjWMJNipaKRZpU0s2Fbp9texjxyEciM8aVXpuDPjle7F8KpnqcnkeXAQEJCwUiNGAX8jIxeNy9Mhyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600941; c=relaxed/simple;
	bh=zhGCKp5AVqdmNqSbpWtLWEt6rsWVDkbB9uzEdQP5xVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nFTMZFR+Xhcl7MjhflLEX871kK2Ky2vhV/vfpFLaNCCZTrulE/6o94xfVqyf001pPp/7IpMdmfqXYYi/x84EtMTd8Km9JhaI+Aa2I2aVqQzcRGxAwcfmmRcY+ObOikvvxpKrxKyFIkR6SqjUzbtraP4cazZS7jU0zq1C0riX+QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFXXoYju; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFXXoYju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC3E1F00A3A;
	Tue, 16 Jun 2026 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781600940;
	bh=kSHyiCgp5d6eVqHZyPNjJsy+a5aJhBNneo0LUB6QoqU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XFXXoYjutJSSKq4VKOS2u5cxXz8ItPCKmC0HUBIz3LTnz18l640oSX21rFhiHo2c3
	 kPoZ+v78peWiWAfT/czCk38/qc+ORKA9bhFI6Fzo+UuwG09Tgb2QdmN+3ZHzyLqvkL
	 sGn4G/GuBEiFgJiW7zn9Q1rrrOxnvVxJRRIk1RUdp7XhctjWIq55mfMc3VVKFN9hjo
	 iFjmcUuFtY8fAiB8TUL4RZWxAMBSvMg4kliT5jImKHqb6vZJmzRhNwnF3ya+bj6+Jz
	 9rEyVL0tG7IqVjAF0UEPE6ntSJ52YN5TPKIxyBLSupzJYOvw39qwNCM5Dg7CHPUSo1
	 0KW/Peg6V0RjA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 16 Jun 2026 11:08:49 +0200
Subject: [PATCH v2 1/4] arm64: dts: qcom: sc8180x-primus: Rename regulator
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-topic-8180_disp_power-v2-1-167785993231@oss.qualcomm.com>
References: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
In-Reply-To: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781600932; l=1708;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=qPdaNciSliS3qTLHCjZfNv5rbyKrWCLVH53Z2F6YASc=;
 b=b1Nq5TQQLOMTKwSaXbqsxSRv7ab4a5lTTjDycZ6NeHnQ9SOaKCdNxgh1vLH8rAK8+B2iVJbtT
 6pLmJhIDZ45AdM4XDtJw8hmiexSAXZS8Sgb56izfigxb0yWyq2ZZi22
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The nodes would be sorted correctly, if their names started with
"regulator-" (which is the style used in the latest submissions).
Touch that up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

