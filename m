Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE3C232395
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032336; cv=none; b=UaecOU3v4zLArR87n57/gwm71xy5QpDLAIDChQ6Jef7LnXg5leugoTNTPHYZf4CPEXzRMiaABQVcG4yK8MGvG4t9jejdDoPrTVQsp+B9G6OQa/1+8NDHZNWhSQ4eHKf5ZNe8tpJ1/qJNBlMW8vpGL8Hp575MvLFNHE/6a1rJlx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032336; c=relaxed/simple;
	bh=aU13UtYQmqbkMovsLMhn8JQtngDN+NG44/XXI+L0+KA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QL0FzpbKtqXog9YlTc3ijpfYiIUzo6SsPiY/EMuF7g5huFRpMrsQbQK1/dJ2Hwz8rh95r7VvBQSS0lnCclIyJNZR0aZIvu9Zy+r15Mu5zgvUaZabQUd5P867e+rvM7JMaREceWnNQL/rLzILRYKjGnv135fCFTddyKG95F6AE4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4SFxAkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyHENPV+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4SFxAkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyHENPV+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx0tu1257767
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uarxEZ181AhXMYJNVhUDyvgT3mi3fM+LKZY
	zlempphY=; b=a4SFxAkYnRXBA5eEn4XRwAdzj5RRfotWJL8rKiCkKAPI/EnER38
	U7+P936x0k6Zxf3VOhlfBiR/qVFPiiYSJktZlmv+cKj3hnln94f80tMdBhPeNgIj
	yRRAatLrm65CWlpeKo1JIKl6O52iL0BQZrFJ70ANvtJQaVJcQOYOPTuj/SIubrUJ
	nU33y+/7AMAumNbWc/qXlQNzQwMdwzJrmNvPdoxezzSNwa1WQLeSkn/h/sGDzS2v
	MB8+K9jSShLfuc4oIhS7RANnWaeF0ewR1rOm+lXS1EbDgPClkwjbc+3Z3JP5Ns9z
	ULiv194s/ii4sQocZnWWvBECVFGe0WmnN6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgsgp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:38:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ffe24490bso13882161cf.1
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032332; x=1788637132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uarxEZ181AhXMYJNVhUDyvgT3mi3fM+LKZYzlempphY=;
        b=IyHENPV+c3XrC/gsgbrhDp7V0yYeWHKVbZovfGbUWfKktG+zBmiTPdmxEjAjYnk2zv
         YGHhA7AiMBS6SVxZzTsP5NIu6sZ83HMyD0GhNjZkbPdm5j3CfD+CF+/Ld7tOnI0GgLre
         7NHtFsANqL5AX5sPn/Ga3BU0uMi3C8TblCii/cLHKSq/KQtORmaOOPLCNrep2+jACIET
         hOkMNpzdUlLeREdRi0P+I2EifmKSwpy3R/n42i+yxGtg1hOD5wrrG/fGjVflvygYsAGI
         0kufOPpPghalH9kcrPmoKpN3TUGJxxfaLdJiCjhR3L7/64q3ZuX5zuo6dCtixcAJblSY
         kaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032332; x=1788637132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uarxEZ181AhXMYJNVhUDyvgT3mi3fM+LKZYzlempphY=;
        b=ghrKj6SfiCIlTxblDa6RXTlelSjm8HyKioYE6v+q5w9KcQxgDWY7eljCfKIpOW1ynu
         GlAqRZPIHCaFUTv0opInkcsn73qYY8DK9uEJb03A7/w9gkXdyBJ99n+QoB6BjsM0UnjC
         yQKz4TcSEwCiFWe1/VO0Fc2xWapVV5ImDHABQ3gN1lj5u7Fh8Q8OEJfhVJmE589dXgS3
         DnCTVJlPXV85nJdPsP5JtOnWlK4zx/t3z429DqVVCrfXEaOiOYT/mcqnb+X9pYsgEFxH
         FAAKWt9W09vJXCnsGca7eWY57/Pf9b5zyyC+ZhbRQ9LaZVkuhZ1Bd+fFNNT0vNPmbo8w
         rF6w==
X-Forwarded-Encrypted: i=1; AHgh+RrJetxmqWBZM3CsB76k17uB4i7rKMj5UHPDMkXjboY525/1VGqX1Vw6xGCZW38R/jFlj0jfrmlzZ11Q@vger.kernel.org
X-Gm-Message-State: AFuF++kYw3gIXDCnhC4yKKH+ZDlQKcdiqJ+Ud5sXsrsNp/uCp2SRXTbH
	pfOMUfn7VqB+Os1eLH5waASxbsfhYHMiWwlEa7m7nUAG0RTUfFQvKVKuJValusMjjHLiURc3qex
	jFJDo4Ol2qdA+QeMGnpjOFP7eTKRGlhSPaz9N75jyLtkg2alKAyK1AJRMl2e8Skj8
X-Gm-Gg: AR+sD12pnS7cR0sVLBsHZC5oQ//d7WSRBMpCTOoeI4Hms0XONTdD3QzBn4PIQzS99p3
	lgJlxAT120T0DrCa+51f5pO4JQb1DF3UHDoG+w+3IQe9y5KctT6QtHjkQho2AP6Bv8pkX/NSCDP
	r4DIDYWqs5jGqT2jMLtxJPtixS/1UpD8NxSJr3fKzwZMDo+9uHN2uGq6kZShstp9y84G5xO3GeK
	EnmmJlZdwxZpSa3jheAF91TtqW/qJDAeGyoRP+/Ff8vDee2sWBfV1ZVSb6HvURcIjMPHAW0Ke0Y
	ApaQaaa7+FNxzeLEgBtpNJfogHyrH4/Vude0WX5BrD/bZBacmnI3gF1hiP/9XDn5Y02TTcXlq1c
	/wik0u7hO2JnsiBo=
X-Received: by 2002:a05:622a:3cd:b0:52f:a0b3:bcb9 with SMTP id d75a77b69052e-52fb941f705mr178454491cf.10.1788032332342;
        Sat, 29 Aug 2026 12:38:52 -0700 (PDT)
X-Received: by 2002:a05:622a:3cd:b0:52f:a0b3:bcb9 with SMTP id d75a77b69052e-52fb941f705mr178453911cf.10.1788032331627;
        Sat, 29 Aug 2026 12:38:51 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9266be71sm342408885e9.2.2026.08.29.12.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:38:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:38:40 +0200
Message-ID: <20260829193839.107040-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22544; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=aU13UtYQmqbkMovsLMhn8JQtngDN+NG44/XXI+L0+KA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzU/SWadp0nMGOnp8wQtCgeNh7c85Ri3ADL1P
 Zcj4ZR3E2iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1PwAKCRDBN2bmhouD
 1xD9D/9Eu9lfq4cXviZQIWSTcjwQZK151FOx5F+msJZskz1gC3v2scAk3dCqR11C1zZ8qnuGs2m
 rSR8AHl+Uq54F6nnvOlfliK+ydq9OVwPFtPMutg1VjlBY2+0VkRQ5HDh3fRDDrEs+NWkZ6zvx0p
 QSPmYLTV53/2tzlbX38Zy2BvQRuAI68oT0aqZNjFiSUIIpKRCKIytT0z9fTkMU11IOo3coJG2j9
 zMheD6UoJpSHVQPgbOzlgJPtCw/eticxGTQOTiyp/xO5gpTaTDSOtOS8fQjneYYuGP/XcW6Y/tH
 yVaylCmXBWfLyHjnN4E+b2D5fot41ORWXSANPnkwIU2pGxUStYImTQREFLkdwAKiAU401S7dWwf
 Gf7DsNLfeLQvfyWzYYdT0Z2c0UOLUSBvlXeumOngz1nL6Xef1gvnxcz9q1kvn++2Wk9WicGJA4q
 2qonU7SZFmFVuMZScF+MqPfbAX9WaaUJE3CFlaQ5+omsLnv8qHhvO1bd85m10baGtFFCjOnjOi7
 FFk6j6tkqTyYeGHMqDFb4QWqT3q7uzHcOHnpCfFLa78efbVIXDCaxNtZFLVhhrwHy+LKCSDFlrY
 MJKcVNS0a/0ZvDDjyHDm+o4VXOu12sqm7F5ecOb+h3kwoQ0/ZAXIGDXHsMeU1sUUjxdnC5/QpiU evHKq3kTPGEE6/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX8nwwZfWJ70Ej
 GR0NpjjIxj0GwXX9zFTnxN+il/2GIj4pBlRsdNfYQu5acx7GEZC4ii0O0Q5TPU6+vbNFedKqb9W
 vgufNpA5hzwe6IV5g+zCDqzQW0ZCAItCDdLXnT61O+1QUzHNOBE3Zvbl6eVm41XN3zqsbDH6c2g
 RTYNDPMBAi5vQaWqbD0xuKSxDJfhIrGXFjGuDXlsMDLav/iAkkUnA8ew79RldNHYjlD99eR53hu
 RNW1ajDf3K/JRYItzrNmXjEe5DkCWugKaLGxv6VuC9h3tJ1PeW3vRn+YczaDCClrg3E+v3Dwl8W
 o/LaJErHsl9ZYpgJcLsrujOf58oQ1cL/LqZZVAc3MekUWZSdssE8rTH+NNp3G7yZJBR/pGw4Aro
 Ok1g7FLjzNnlhK0AKqRE5GP/VHgq0l1qMZGLLyWO+bsL6Sysb3Y9b1WRua7gLUn8i9x/o1HlCfK
 LvOpA+6fJUnEBVTPOTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXzzmqARF/XdbQ
 QVZB67bVl1vcpDW4/LB8L4H7MrykTku4lTvXwFfpI6kOd15hEY6WlM64vFmugSSSO9Q66ovtZOG
 QkUddL6+wU0/MFgb/oEzu1wW8ThECXg=
X-Proofpoint-ORIG-GUID: 4gX4Yu9jW2GHxVXSsgtQhO_BQMvqMSeN
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a93354d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=fnx6s23kiMKLFbbzCq8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 4gX4Yu9jW2GHxVXSsgtQhO_BQMvqMSeN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi    |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi  |  24 ++---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 116 ++++++++++++-------------
 arch/arm64/boot/dts/qcom/sdm630.dtsi   |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi   |   6 +-
 5 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 142591b9f588..724714abc827 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3702,7 +3702,7 @@ pcie4: pcie@1c08000 {
 			      <0 0x7c100000 0 0x100000>,
 			      <0 0x01c0b000 0 0x1000>;
 			reg-names = "parf",
-			            "dbi",
+				    "dbi",
 				    "elbi",
 				    "atu",
 				    "config",
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 818e5660df91..81c853da4e29 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2504,18 +2504,18 @@ lpass_q6_smmu: iommu@1600000 {
 
 			#global-interrupts = <1>;
 			interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
-		                <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>,
 				 <&gcc GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fbcfd3883bbb..1f371824d19d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -917,8 +917,8 @@ i2c16: i2c@880000 {
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
@@ -939,8 +939,8 @@ spi16: spi@880000 {
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
@@ -961,8 +961,8 @@ i2c17: i2c@884000 {
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
@@ -983,8 +983,8 @@ spi17: spi@884000 {
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
@@ -1019,8 +1019,8 @@ i2c18: i2c@888000 {
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
@@ -1041,8 +1041,8 @@ spi18: spi@888000 {
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
@@ -1081,8 +1081,8 @@ i2c19: i2c@88c000 {
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
@@ -1103,8 +1103,8 @@ spi19: spi@88c000 {
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
@@ -1125,8 +1125,8 @@ i2c20: i2c@890000 {
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
@@ -1147,8 +1147,8 @@ spi20: spi@890000 {
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
@@ -1191,8 +1191,8 @@ spi21: spi@894000 {
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
@@ -1235,8 +1235,8 @@ spi22: spi@898000 {
 				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
@@ -1279,8 +1279,8 @@ spi23: spi@89c000 {
 				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
-				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
@@ -1750,8 +1750,8 @@ i2c8: i2c@a80000 {
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
@@ -1772,8 +1772,8 @@ spi8: spi@a80000 {
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
@@ -1794,8 +1794,8 @@ i2c9: i2c@a84000 {
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
@@ -1816,8 +1816,8 @@ spi9: spi@a84000 {
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
@@ -1838,8 +1838,8 @@ i2c10: i2c@a88000 {
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
@@ -1860,8 +1860,8 @@ spi10: spi@a88000 {
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
@@ -1882,8 +1882,8 @@ i2c11: i2c@a8c000 {
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
@@ -1904,8 +1904,8 @@ spi11: spi@a8c000 {
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
@@ -1926,8 +1926,8 @@ i2c12: i2c@a90000 {
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
@@ -1948,8 +1948,8 @@ spi12: spi@a90000 {
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
@@ -1970,8 +1970,8 @@ i2c13: i2c@a94000 {
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
@@ -1992,8 +1992,8 @@ spi13: spi@a94000 {
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
@@ -2014,8 +2014,8 @@ i2c14: i2c@a98000 {
 				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
@@ -2036,8 +2036,8 @@ spi14: spi@a98000 {
 				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
@@ -2058,8 +2058,8 @@ i2c15: i2c@a9c000 {
 				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
@@ -2080,8 +2080,8 @@ spi15: spi@a9c000 {
 				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
-				                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
-				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
 				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index a41ba0da380b..e785854e2e83 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1195,7 +1195,7 @@ kgsl_smmu: iommu@5040000 {
 				 <&gcc GCC_BIMC_GFX_CLK>,
 				 <&gcc GCC_GPU_BIMC_GFX_CLK>;
 			clock-names = "iface",
-			              "mem",
+				      "mem",
 				      "mem_iface";
 			#global-interrupts = <2>;
 			#iommu-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b1f6782a3ad9..5993f264ffc4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4626,7 +4626,7 @@ mdss: display-subsystem@ae00000 {
 			interconnect-names = "mdp0-mem", "mdp1-mem";
 
 			iommus = <&apps_smmu 0x880 0x8>,
-			         <&apps_smmu 0xc80 0x8>;
+				 <&apps_smmu 0xc80 0x8>;
 
 			status = "disabled";
 
@@ -5031,7 +5031,7 @@ adreno_smmu: iommu@5040000 {
 				     <GIC_SPI 370 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 371 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
-			         <&gcc GCC_GPU_CFG_AHB_CLK>;
+				 <&gcc GCC_GPU_CFG_AHB_CLK>;
 			clock-names = "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
@@ -5050,7 +5050,7 @@ gmu: gmu@506a000 {
 			interrupt-names = "hfi", "gmu";
 
 			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
-			         <&gpucc GPU_CC_CXO_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
 				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
 				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
 			clock-names = "gmu", "cxo", "axi", "memnoc";
-- 
2.53.0

