Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A328933F37A
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014579; cv=none; b=nxVhBh7tRDpP95vD5xTQWcs5p0rdJ0Y0B/yY0tMujgq7rbPbdAAAy6/BYEZ2gQILq8qjcn19GkV9bsA4NQSRfNl6MPOaykLRXnnlou9+tJW27cb3uX0hx6D709Zt2Jw0XUtIU8wGPt96X5Sva5q/17QGpA6VaV+K+HmjTbOT56s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014579; c=relaxed/simple;
	bh=5NAzrmk0t3lFiQOkyaweZdbL5CP++nCXPQytojjnAlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UwF7kAIKu89JpAFH7QRYL8sqXoVy3ofAjRBdUDhPeTeg9Q+RZv65Zb7Kjaw/go1UPwQMTs+AkCE1tLOsig80NuupgdOd5gjvlqBdPLlf81PdcFWlWrgMU/YWdmq88YONEguhf/elpPa5+rWjl8Iu1tlmv7ZeI8zZ+yuZ/Wt7Pw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZyB82S2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMz6uajl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZyB82S2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMz6uajl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClWrr2706188
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 14:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZtOi0P9k/7UK6+Jnm1HM9XkoMXP0zRVjIqr
	t1SxzwWw=; b=JZyB82S2qfYyBgAh1VAEvZlrJ6ay+KmSoSdXWHzQAVz+Dx27srs
	uRssyOVenjV9UXsPn9K4qt3xmzXgwKzFk2rLxBfNLKypqlinvmQ5dpcQ0TTqU2r/
	5omwnudHHX0OcThcCOg2A1Le//jrUzkSvZLOZQMRxQxp0hHYjaCt12fg044tvYYB
	Zvzv35NYKOEtivRrPNdVuMW8X5tUKYw+XLlQ+19tGeRSIQT3sfECi6SlvPGyod0V
	naKaTPHi68wXzlzKV2Ar604maAtl0+3tYaBlJxUQLQymqhingrBA211vcghagkye
	rgrwENvPSaoykIOEbyc3gh5hkrzf7vAt8zw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt1jnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 14:16:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304df51ff3eso5382956eec.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781014576; x=1781619376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtOi0P9k/7UK6+Jnm1HM9XkoMXP0zRVjIqrt1SxzwWw=;
        b=cMz6uajlo81vLzbg4QqJBpFKpaMmCXIJ2klaoest0sxi0ROKgeZC95CunMJ4Sdncq7
         4MYUQWrV2jBBjwH29YWrJVcwKbMcA4gObkhkXiZXNkkwJKB9KV2Z5mAZYBhHsMb4/PBp
         +37i+Y+hr/cglcJsQZTJUDvGvfxfrb1fz1suTZsROUYlyMzOERTOjgLo3fquMowjnt+2
         GI6l0DOSIshviUloC/patP+Gp8c9UU/ZuyaYy8N8VtPdrP4BpCndFkxGHynXTps/q62X
         Z0mSujri5R4/WBo2g9l/kMIxoUqEpYFSeSDz3eDSMhnBZGgv/QIDXQ6DzExcH0qiu6dq
         mSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014576; x=1781619376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtOi0P9k/7UK6+Jnm1HM9XkoMXP0zRVjIqrt1SxzwWw=;
        b=XPseePuZCDs5KxDdizCCNTNl7GT2V2iKbNtHGWGVHuXn9vb9dwDCcvYAIrQrf745ME
         fLY58JBGMZnCDNBSHolxz2HIyUsuwR5ppjE+3/JqU9CNcF9ywJxSTkYUc8ykV7XtDsba
         mCcKDVNb5ZiCp0ib9wd6lZ21utvaQlx+lrRXTjaykA62KHbckBdiG+fzvIq2aBLHVqAd
         Ye4pD+R9f5sx1x1/u3NdQp/WpcRYp3CzbM80ABKfanYskrzu2M9VxCjhC4IYhd2DoGrP
         G06zXbyIRoj9Pfrkn6tEmugIBGM8tQLFr0vuxEZS2k8qSzE73Y9QA/Qc216snAJ79iaM
         ZHRg==
X-Forwarded-Encrypted: i=1; AFNElJ+eIwKkrCg78uwIPrpwmPjACF1zQN+78NqvSbHINitvKCNNkKoTZ2WRsj3OrLpjHhf2bhI/ySdpYSOo@vger.kernel.org
X-Gm-Message-State: AOJu0YwMLabRXaMwSr3Sm5o1MsJfTVxyzG8d4nuGDYzgNPFj46NAfc8L
	WQ5vsz/HZJvJqMRxvGkZ6RKeuPqGwF1elnS5OsXZA3jHkx6phMYvk12vdnjmml6xNObPGi1B/Or
	FPMNKXLIbYOnfegu97fCHNmssd69l8sCuONTj2OxIUzdMHsDlptjLtDQTllwNM2mZ
X-Gm-Gg: Acq92OGNOpWw5WzIiC86GH1Q0jDepzyx3581CTAkjXHazlXXwydFkD1u3AzsbUBFKV8
	lL/kj5MvDSiNCEwb/b0vj4eklYEV4ACUlSUdeGbJJCactw3k6y/WC0X2ajt8ze1PIF9EHs91UXC
	odBRrrJKnebTxgZNMbgzjIA1fjxkV2K0fjNlYKw7DpcMcu1GWEWp+DYjK+k2e9yyq4gwT5TwfGI
	WIY0MIfnulP7V2I2nip6s6VOH37dw96lh+nufMS7+JelNlxK0KczJyt3b18YDaDXTsZB2pQFi3E
	FgIgDajMA+KyhZCBnA6ZN1h9SqwZyPGSdWw4m0vWyMPOKr463q4dbxv9uLdlgheSF5/NFgDH2SW
	j3jHEyAfGs2CMTGOy5gqsEC0sPYyhgbqXvzYh7HPYr/DAVgmP
X-Received: by 2002:a05:7300:fb87:b0:304:e587:5063 with SMTP id 5a478bee46e88-3077af54770mr12339012eec.12.1781014576017;
        Tue, 09 Jun 2026 07:16:16 -0700 (PDT)
X-Received: by 2002:a05:7300:fb87:b0:304:e587:5063 with SMTP id 5a478bee46e88-3077af54770mr12338969eec.12.1781014575460;
        Tue, 09 Jun 2026 07:16:15 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62623359f8f.20.2026.06.09.07.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:16:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
Date: Tue,  9 Jun 2026 16:16:09 +0200
Message-ID: <20260609141608.354186-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3193; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=5NAzrmk0t3lFiQOkyaweZdbL5CP++nCXPQytojjnAlQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKCAo0VUQRqE1Y2yyqjafHZUkvelh2+v3VGC5M
 dkDD2RIy3uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaiggKAAKCRDBN2bmhouD
 1/r0D/41cQyNYYHJom7eKQXugAGrxIBt9zlWZ1KZtP2QHvQ+SIxM/4l4xl11DYwoGs0OjXcx+75
 8YaJ+HhV+u3ytdwSY6udjnROZFUCHtAZmXUonrgU4NRpoNR/IfG9ZzlZTGmoRAm9OhVejQ2rUwC
 NMt+LK/9HN+Q4KruyySCrdLPIr/kk2mTX+9bRrK3K3grLoXJM0sV3xJW+katebt/S6EHetejaRy
 Ye3s7EJuy9lQjZbDAruUml3WWmo5Q9k3nPdeXYzqs+5Pwj70oTw3w0IMcCkukb4NK03WeaGnVqv
 28x0SJp1gxGIIoWxAj+PWs4qABhvgjN5L8/+5SPzDW7XGTeAZSbZfuoBTQdzoUw0gNmIPpbP6h6
 d5OGcT4dxME33zZbku1LrU/cZFF93Y0xLvHO7NBYv1Hxg0uVhKbYUQwS4Vck9w0HJl6fbtY7GzV
 DXGYEr39spgs1LKpxGgcesXPhNZU6zHu1QHYkCGI+SZMMZube5L/V56NTgaDupspWLqkodRnNTX
 pEvMScWDvrWArRFkmmLFv+Ry4sJLDD6oQ08mKmlYYcERTdMx982ZVLobX0o7cmwH/1H1bwkZsUR
 hYhlschWw91Bv4Kvq/Pv4BNTzNLyS7IQ1fYI3ABrlGiRdv1tfCZxvNBXUOpBdTbH7qLRTAzatG5 8SJ6vBlCMlCwArg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aOHeg_PCF8xHc_Eafop7VVL6tZ35ZKlo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzNiBTYWx0ZWRfXywKW7IcCcPcF
 f0xrOQ0k3nKc8GVx0mh8Lpy/A5gXvX8acNXJFZpKZTRGEiWEWamc+8Aa/b2PgEAP4F6djehaAES
 L31DrGyyysu0HvkUhApOe1cNZmvt7lP0jjxarS+UrX+NVsau8eD7fI13FNpgSrJ7Hz81dkJX3uL
 Jb88Jh9Kdk5Rk0MiW9kGLurlXlJAhcbXB8K1gOrQVwr04bwNeUwvztfPq5hr7cEgp7KfMDdiStA
 QkAyhkiUo+KW0bbytz9wh2Rqla02nOrQzzra3ur+aLjKam4BJrheDZS/0Ni1mGb3AW8kjYFQ3FH
 ZV/T713I0VpdgTZizpNzWn9WkyaI/vMATdjq6hBEr6K0mpviQNrwRjEuv6R4rmx2Y3RxPMr92I0
 7aC6b9k4t+uOvTmMb37LePJh3C+/H1+JbbDqyfJ+rUeuBRGzdBlCoHne9HuPsjnIZMnthahiftC
 3vZjYgkZ0kcSjvZI10g==
X-Proofpoint-GUID: aOHeg_PCF8xHc_Eafop7VVL6tZ35ZKlo
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a282031 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6vJ1rGMNMJ1YGqXfLoAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090136

According to user manual / programming guide there is no separate PCIe
phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
4-lane blocks.  This is also visible in memory map, where the 0xf00000
is marked as the main block with additional sub blocks for each 4-lane
phys.

Describing the sub phys without the rest is not correct from hardware
description, even if it works.

Link: https://lore.kernel.org/r/20260420-optimistic-unnatural-stingray-80da35@quoll/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Rebase (context)
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  5 ---
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 39 +-----------------------
 2 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..6e2e06ae6c8a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -451,11 +451,6 @@ &pcie3b {
 	pinctrl-names = "default";
 };
 
-&pcie3b_phy {
-	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
-	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
-};
-
 &pcie3b_port0 {
 	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..0ecf1fcd700e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -770,7 +770,7 @@ gcc: clock-controller@100000 {
 				 <0>,				/* USB 2 Phy PIPEGMUX */
 				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
 				 <0>,				/* PCIe 3a */
-				 <&pcie3b_phy>,			/* PCIe 3b */
+				 <0>,				/* PCIe 3b */
 				 <&pcie4_phy>,			/* PCIe 4 */
 				 <&pcie5_phy>,			/* PCIe 5 */
 				 <&pcie6_phy>,			/* PCIe 6 */
@@ -3659,49 +3659,12 @@ pcie3b_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
-				phys = <&pcie3b_phy>;
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
 			};
 		};
 
-		pcie3b_phy: phy@f10000 {
-			compatible = "qcom,glymur-qmp-gen5x4-pcie-phy";
-			reg = <0x0 0x00f10000 0x0 0x10000>;
-
-			clocks = <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
-				 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
-				 <&tcsr TCSR_PCIE_3_CLKREF_EN>,
-				 <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
-				 <&gcc GCC_PCIE_3B_PIPE_CLK>,
-				 <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
-			clock-names = "aux",
-				      "cfg_ahb",
-				      "ref",
-				      "rchng",
-				      "pipe",
-				      "pipediv2";
-
-			resets = <&gcc GCC_PCIE_3B_PHY_BCR>,
-				 <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
-			reset-names = "phy",
-				      "phy_nocsr";
-
-			assigned-clocks = <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
-			assigned-clock-rates = <100000000>;
-
-			power-domains = <&gcc GCC_PCIE_3B_PHY_GDSC>;
-
-			#clock-cells = <0>;
-			clock-output-names = "pcie3b_pipe_clk";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
-- 
2.53.0

