Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B653B47FC
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692193; cv=none; b=EROI13JUFmFwB+95DobpiMtnbKSVp7qlsSmznIc5to4zbl6Yep3y2+BKO32V/oltH4oKYVtoEOwN1oY7cVb1Dbuph2a5TggohVrLVPbjZnUir9uCGHFKDv1Z+DSvGlIM7UzwXwBI3/N1NiIIaCixt/sfh54Fv+awhWLwU19Iqws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692193; c=relaxed/simple;
	bh=7fK/nJBDBKr8gQ/ZQZIfX6ZcYqbkWgAeRG2NCe02sJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=epFmYgEO8QM2BLbBxW7PQMLqty4na1+u0glVEeKVyw+G5shejahCdeuxW5CcrgI0FarIVAXWrbScfGDasXnN0g/Yg99K0UaeTw63vBEl6gvP649j5krvzm2BeQ3bDplX/K8UzaOeV+t8MlZ9xM+5/LI3wNqnFC+BOdH2u2wGB0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcNXDeB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeRuIfCC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcNXDeB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeRuIfCC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K91Rg02281691
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ejj/uRB4+uasiKUqyUjnwU1BaXr20Z3LDpH
	r6AeJKXk=; b=EcNXDeB2VzFWRVeutC5wSfwWSePHjbPeP+qFko05O7Sda2K6mmj
	5C1Nwo5E5Nfyunh9Woy22YXgFdwqU3qGIXO5gm6Tv7SZNjOYPO0s+EqxqFcFQORW
	3F70i4mqcBojy2Z5/Wcy0WPomCgU+lRHuEpU7EOjisbpKf3jF+EsT14cfm29Gusy
	ZnMhMLeyysBp8rVO0XDb3yZ2uyMD9Rifz8D+yBJC9k+6Ddh3H1sGO3vRbzL0egql
	oV1u8mqjQ8Tfb6K8WrlFBeulkE1QEhohLGp3J3AuYSf9LNNho8M9dINSUpzVuNLa
	P1k6t8Txsw3t0kRvwmazcJDfUpkzgFY+1CA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh598xn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:36:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50df4c130dbso36980451cf.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776692190; x=1777296990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ejj/uRB4+uasiKUqyUjnwU1BaXr20Z3LDpHr6AeJKXk=;
        b=TeRuIfCCUY2JLUg+7Cq4QHz4GvEkyeGlqdpSD7g/g4jwON2n5h5DcIzIXO8SSGpb+R
         haJGUfHEbjihcJYVR0FcX9NuqGpJRqvN9WxCYLVsNT0dn4voWfn6ZwZJ6eiO/5qBkm+p
         XYRgggP4t4QdfCGDqRwygDVeyU/+YhEX689SuELrX5LTQOuOLChgCA01r3ywiS5uj9jK
         IK9Y6IAP+PIw3ngeShHpVszKeexPBDln7nYX6nYmdtSCagJh1rD8gNekoTRh/3cG7XlV
         7p9n3MLhy7InggdT4FPIfJdJ+Px61HCfsydy9Mir6CT+ZnQ+An6aDZNJ6rD3G8lFOK7I
         xYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776692190; x=1777296990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ejj/uRB4+uasiKUqyUjnwU1BaXr20Z3LDpHr6AeJKXk=;
        b=FnyqdihgfWT2eiVeM0VGm71MPkEidUsIvB7a52CvVvkMjNaO0SVB26L0ZCZ19Dc/5p
         VlJdcfpmZI/EXhcvSlkdxseNF1RixHgmfW2kCNTPl4v383VxJg6H7v7byO9VMljuhD7R
         bNAA7wiTDmSDvxuMzHOAVLbQGoxa541a5qUeqb48p4sXQbhVNavMT4HCgxB9wL7OQB5W
         lG0jEWbIqZrE4fzn6RXO4Aim5UlhtqGTEVH9+mSh/CraoRI+Va8usXk5A0v7MZSU5OYx
         CrF2VqqsRB0f2+wO+5i1O229IXhJKOtU8ecPCoK1fRzTNgIRQz+/4yKEJxUMCTNkHJzU
         +e4g==
X-Forwarded-Encrypted: i=1; AFNElJ8ikSxl1A9bqAwDwiDOTVNmHEOFWOYjJT2AxY5Ov1VmRpdJXWsUfzPLPnMT8pleHA4+typ5yI6axxWk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz18z+Rjd7kQfm/r6JSd+64j2LZ/yOkxiPQhLiH5vY3/7XLhC3
	QOS/W9MzqVdaxy4YmXdHpLiF2DKsryH9Df5+ogSGcIRjX6NkvtltQ/r2Mk3wXd2HeDSS8dDZCZ3
	oD43bHzuLXkJsG1/F1DsTiJpPOTQg04YVdZwTmjVQhNd/ELBaW8uIXFgTMZlqIwDD
X-Gm-Gg: AeBDietzWynLcmyWQYxzrE6QbUTfPmliBgcm62IjcW0nf34pKBD3Cflp5w63EDCwV2j
	LCLo1j9CFV7MgwFRpO4nRJFY7ilIRDSSIcFBTk2WmDonli8T+o/4saUsTxa6jAPRROJ7dF8NY8u
	gVo2nL3djRuxYOA4LU1siiceBSHKzO7qY4aGS00v6Lfs6lnXFEzn2+tHmw8yPq0aOJRo/wEdY4a
	QpxOSfK322tuwP0NzuVPtwHtVT3AZkf5omrppc8dBVfYj5XcXR96dtayRyXARLJy+NPf4s++xaG
	kPRANRGG4UEBguz9yxoJe4r/pePf2Uhqe2NXaeKBMXW5JfXqMSb5HZ2EV5bXN1BWys2NWf3/vTG
	Mnnf2akwBm5rlUwZYsZqNpCZzyH5Lt/DOBR7jo6GdplcsAno=
X-Received: by 2002:a05:622a:a955:10b0:50e:4241:ec47 with SMTP id d75a77b69052e-50e4241f0efmr88547401cf.40.1776692190021;
        Mon, 20 Apr 2026 06:36:30 -0700 (PDT)
X-Received: by 2002:a05:622a:a955:10b0:50e:4241:ec47 with SMTP id d75a77b69052e-50e4241f0efmr88546901cf.40.1776692189418;
        Mon, 20 Apr 2026 06:36:29 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc100162sm310383925e9.5.2026.04.20.06.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:36:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
Date: Mon, 20 Apr 2026 15:36:17 +0200
Message-ID: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3121; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7fK/nJBDBKr8gQ/ZQZIfX6ZcYqbkWgAeRG2NCe02sJM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp5ivQ/aUChFY0PKkUjcjMNJuav9qZLjk75JVxn
 6Ljc3ZIXoiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeYr0AAKCRDBN2bmhouD
 16UGEACS48d85D19VTfVaBcMmnO5x0ALRyEEIH0gbY62H9pywmTNxx35cuhLLsnR6JI3LwQDcEk
 Gk1xxLpZuMkWHdau0FR8NnFVN6R5bQC53zB39P/GqTmKsZ3QglcETU+PLt22N/+zglC6hQjgM+2
 NTg6jxNVjyFnLMO07kQavv1uQO66GuSKyjFHYOme/aWd/Ig8WbdAw/a8hAYtyq2ckNEQoLA8qWf
 od8AZJYXGT1jHWWRhxS1PGmV3G7i0M2w7IyhCIc7P075/Fxd6QU8ybaAAni0KTVWl3SJZpJvcFT
 pH0QpB58UW7IgxIv2bTfprlsmIzvlDzpC4KWyOqJ2aFhzOhT20OrvJboKwOnxfmX3xP9jkSkLzj
 YeUjd9juzWjxPad/7V6k3g197dbTbfqCiBoLWXQZN4C44nBfbA282SKUDfS1SBmuKkv8WMMYY2/
 wZQ1I37i2pg51Sk/Dow7lftPs9OaxHtfJJTZ5GomZ8IsZJw0fjmWhHGzHCpjkOiL+RcRSG7mzkS
 VP0x7i8U7kQ/7Kn54aftDdav7Wd0S+PnuxVRZv6ZoP2yVHLCpc6sWJBUvJRYzCKbdz4H1zK9qeG
 aoS2Pw/iWyweag0MwHxS+RVDWKAlA5XlhIs3cJdENyadMoQmDMjV+e6725jLvoQk+ujof9N51UN kRYfxLVNMp4HAtQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4qTcEvi39cyWFasFyKc4ocHS5D_o2UH3
X-Proofpoint-GUID: 4qTcEvi39cyWFasFyKc4ocHS5D_o2UH3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzMiBTYWx0ZWRfX5mAmr+bQyxbE
 wlr5wRdAVdZjbs4Uj7JJJix74IvJHEu5RNBiKkBTYKMd2NsQMcnI7T6nbvR16oG72a5B2vLHAdR
 aVobPyFxATKJLfJVVEAevBQjzuYhVlYo0XJCdYCgr942Q3TmxwGj2YqyL6Zre0X3N8+Hx8h14CC
 eYYeMg/tstrmbfEWORUJkpD0Y1SFt/0c9kUI/v8ycUmxDvcTxKj94c4FbgByCKH9AE537p38rJA
 Oasp41our/o39t2VJLUiLUOtZ3eUnKE/QXsl6BsHJhkMkl/XDmKB24TOdRqnV/7WgL99fzjQt71
 pcJmM3mqYncaKG5TCadq0RUV6hOu1n6TCgyT1JaUsw4LjeXNTYr0jK5cgjUpkU9seO3zvCVFHii
 Dv7DT3V1dbfSqHp439LruJJtFrwZOqaxlMva3EtowZhMx7bnw+3LOoNhkPt40zSwT1eHF4y7r1j
 EYTwchFq89SENjLY3zg==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e62bde cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6vJ1rGMNMJ1YGqXfLoAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200132

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
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  5 ---
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 39 +-----------------------
 2 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2852d257ac8c..647e934f4edc 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -440,11 +440,6 @@ &pcie3b {
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
index f23cf81ddb77..d5408bd3a389 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -737,7 +737,7 @@ gcc: clock-controller@100000 {
 				 <0>,				/* USB 2 Phy PIPEGMUX */
 				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
 				 <0>,				/* PCIe 3a */
-				 <&pcie3b_phy>,			/* PCIe 3b */
+				 <0>,				/* PCIe 3b */
 				 <&pcie4_phy>,			/* PCIe 4 */
 				 <&pcie5_phy>,			/* PCIe 5 */
 				 <&pcie6_phy>,			/* PCIe 6 */
@@ -3632,49 +3632,12 @@ pcie3b_port0: pcie@0 {
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
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;
-- 
2.51.0

