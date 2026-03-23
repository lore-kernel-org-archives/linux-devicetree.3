Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920D35AC36
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293818; cv=none; b=u2YLjLZNjp0V+Mpm43z4JXSvHiv6s+Rmsi31g3kM7m5JL3DX5UPKyLDgK/yqYKYE+OW2aYeqqnNfmHaOM6DctHTzXwlD+nGC78ZZvK0z901MjgFgceaOS4HwwvkHe6evQZ2oM0AonOK+9pdOAa9lmyVH1yoUQFoFQs036qdIQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293818; c=relaxed/simple;
	bh=Y4z/NOxoMOA+uoK+Mdtn8e/Ss4Ul6SrWeTnGOfO7grQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWF30fZD8buyq7NkbmY2sbQiR9TlrUaQz/IKBolxKkju9p+PP/zBEqDjp/cGGWNkXBu/51vZN9nMJN91d/ItCD1IGXomN6H88bCDn1nTPnfngmNh08/4QdBkJW3Nvj5pNJ+gSer7trxwpZSWRhjxCcHPrsGNCcltuMcTLwy1rKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTDE0Z1v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LgTIWoWC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTDE0Z1v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgTIWoWC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXJ3362509
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PNH6+q+/5IqFBWaPQfLwdi9ZOrTXVnnc7HP2Fh+Ytwk=; b=QTDE0Z1vH8G48URD
	twwx+6X4olq3JYvxDYkXupY8+2/7s9KxxwaHmZew2BIQK8gXC9ILaPwUWHncgWpq
	OIPKQSJIuItDSY/ZAzMXRGSLugEKmnlB77oejd10uHp3HcX4P5fUeykSN7HkX+gE
	dABsX2zBKT4UWFzlpkc/F+eWyGaMT3AL/TQ19PMbBCiWj7MpU/3IV61aiSv2mF3r
	KCib2y2JGzbd6LgXibamTB7Wfsh36F7pUpk3QRytsqTgRf1Hrl16IKgc0s7Cs5vD
	M02h7L5R/2XYIReDLzcw9k4HXSOmYPGuigJ7bi1bzc4vz/L/w/njQMmiBi7GY3z2
	VpjqSg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k31w3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50939597b85so224719691cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293815; x=1774898615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNH6+q+/5IqFBWaPQfLwdi9ZOrTXVnnc7HP2Fh+Ytwk=;
        b=LgTIWoWCRsh85yy8M+yzwvOWotka1YIus8YDle3DOP5hESGE//mYfyYDykMkLofTFN
         qfOOUknfQjAVXTRA31tPoN8ArFZHFmYaCtsMy/yQQ+bCtqwJ1LQolhDqatFDVZK1K6am
         rVgAJZkU7pGth2PhyCQTRMqF4ANILHCuQe1R9GPlaUFkpi/1rYNZbNAL423uOed0B3Mw
         TRQ4CEMTO3RdPMTaNjo7mRiBXHs73bymUnxVADhFfEH/6PZzFndUnIHGWqE0dIrfnPQz
         70bV2CAgofhPlYRsyjs/EpNZ5/VPEXiLoFDtny7nE2Gadvrwqe3I23dT6/PBJJeVED7x
         gQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293815; x=1774898615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PNH6+q+/5IqFBWaPQfLwdi9ZOrTXVnnc7HP2Fh+Ytwk=;
        b=o9MQ3qSR2YAGFEd4B989ckYDxAKieOUk6Cum9DX9RXaHkxkBZViLZIF0gE2hYBK6yB
         KXQQxCV3UPCycqAbt/4ssDo9vm2R9ZJaSdb0mPse7rrsYoNjW5eDkBSfNwahV68ir/8L
         BkmwZLPTpBBXE9OoogANJzE9MzHF5J+laIKcsM76OOI38GPO48EQFfislUEDWZJN9fgU
         dC1+wPzTg08gXvhkDL7AdTe1V8hgA6IHvyEmgCw8zWi30ysjJ/gcxrvr6clay8TzZdNe
         wzsnRINNSm1jQq9kfKxfhWxAkbBZn/q16krqOlJpgK1fdNyHAJsaCxwOI1FucXP/6vmy
         9c8g==
X-Forwarded-Encrypted: i=1; AJvYcCXFVXGl2MTq7f5UUMFNOuICBvCyvjZXApVXO0Hv/NxlHtvGkv8LMQvou4P9eExKL/rx0A1L4IYQ7vkN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4HSpwjmRz1R8faRridiUNXKFiTbHsMOSPEZc5CNKb+2D7kB65
	cqKVbrme3quXcjzYEg3ygi2kVzVeYorru1SM/9UbzVaKbSDiYnZYzbtfh6319gAA+uuNiQGIB3F
	2MxBUITv33hlzZOTjycHxc5X3ly5ln+RvHZaIiqBz8ymKvPJZ4sVp7yq1q8wLubOM
X-Gm-Gg: ATEYQzwjv0WsYWNSwunLt6EQQ1SEG0fzew86DMnX67Z8dKS7gd5INI6aP16jkw8n9Se
	NjJKOP3l1MisGNEQFhZrUq/uduCyoOF495XUEgrHZtYzknnNawpL8hsCqmrHmv8WHogZ9NIcFU0
	ZAAc3wA2LZ5v4nmCHv2kuBs1Lv7MEIwB+oQHzElNscCgl+iMqKM5aWhDqWPRMK5o9uRAWHtrCjG
	xpNPyUbdMwApS/+Bn7R5uTS/8PVKLu4TuTjyW19H8USUwZGMhlVGN+9plTgr5+dQzY5t4q1W1pN
	yWZzoPoPu+3oLaeBQW/XyyHMwTtqrHEqJfWwWk5cYcLY1D/SRq12m4Xm4qqU3uflu/6EIrUiKHN
	okikTwR2MOvrpb9J1UXeR5k/V7UU=
X-Received: by 2002:a05:622a:188c:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50b41b7df83mr165439441cf.47.1774293815210;
        Mon, 23 Mar 2026 12:23:35 -0700 (PDT)
X-Received: by 2002:a05:622a:188c:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50b41b7df83mr165438991cf.47.1774293814550;
        Mon, 23 Mar 2026 12:23:34 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644acb52sm33388113f8f.7.2026.03.23.12.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:23:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:23:24 +0200
Subject: [PATCH v2 1/3] arm64: dts: qcom: eliza: Coding style clean-ups
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-eliza-base-dt-fixes-v2-1-59af0627b7c2@oss.qualcomm.com>
References: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
In-Reply-To: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4z/NOxoMOA+uoK+Mdtn8e/Ss4Ul6SrWeTnGOfO7grQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwZMuAvPzIUnlxYmd9YD6dDAp+tvMD6uJgwCfz
 59RfP1vUGyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacGTLgAKCRAbX0TJAJUV
 VgEtD/46FxJl3PXroousgSwa70Jw4zAYrDcHuqQjRvFdO8JSQjFo9higwlRco9V9TcmkSBcFnUZ
 dH74RHyjr+MdrTROMFCdxi+fT6dFsfUGnHYswSz1AObX+YqsDUaRdGqSkIYN6j6Q+gDSfnbARCg
 ZvRKxRXkY//hSTrsO05g57kbltBf80ltTPsoqEiRn5dGNDCPIor4O1qcCfu5PQIw5eYEocKymWZ
 4DsLKP7Ysi5SpGro/yhK7Z++E2mOF+A2nynXZR1wbuyBVT0rbOctldLQPyTpGxyr3jIMxEM/j4u
 8qUNFaGP1JjcS+aJ0MbqS94i7SWslrSIgFbnfR7efdGFzT9cNFVqniJv08UnF7iZqoFeXcoe7iI
 ylGaxqXDWbYHOCyNvfsZwftPTaXOBZrXbWySdZvAp2hhalCbmjtronvPa8BruiOVpzuC+fqIQTl
 ZM8w7pggsc3186KiukU3/hbdIilUTuUeHvMwHA8nesMPOE4yq7PC/NBSj4LWoxnY4tBEtLNDXaP
 feHgrumAm8j8zCR56FRJdyRXScEdf/zWpN0Cj4ZlsHhpVJeujOPg2dSoD4cGQ5q9l2/tbT6GkLN
 TFV0XsYrI0B3e340E7JyHns8BbJvvf/6Tlk8byY3WTJE2UdVspUqY/YogbDrhIkYY+z8ndn9Bg7
 E8jiAg74BfKDbow==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c19338 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jx7dCe-4cp8LvEwUiLcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MyBTYWx0ZWRfX3JI9cJQAeX05
 Zvg12iThcSIlVcsPEZBQWCMIyGAFsHyWz69DnPMsak5dJM5a8oNTLKhFIc1/UXa5X00hCVHltFQ
 bdkuA0S/JMiQicvZKQ5NBAM6kqDDLIMyK93RFXe8u/QhevLzvs+wUrZ9noyYxXH8NA2WdqJlYNM
 KowbezfiM3aFfr5LnecjLRicgyU0L5HkwrUfG+0HoyG9TL20vUVEaNZ+NKhW228C9N40t1SNSBH
 JvUz6zZBYd07o2sVDBtEgXBI5rY9lTrrf1H2iiB+FNMssQsHFm1b4RW8GttPKM6ONcnUyPwsoAK
 e+2frafVfPaTDKc2YxDBVq78UN6qLvgvC0i2djhWKuE/3o00PEch6zHeCT6I2gbq9oX0ZiAGl/K
 bOAdwtEZL0kIIN/q94ExMjJ0Whu4dezhSO58mY4wQItfJ+3SeS1WlVaJKy83/EKFwiCAJuv/Jfe
 zGpCDMvlSbnFZKd/u1Q==
X-Proofpoint-GUID: d-C-AMD8gWnDedF4wjIaltZV-zxvpeHD
X-Proofpoint-ORIG-GUID: d-C-AMD8gWnDedF4wjIaltZV-zxvpeHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230143

Some coding style issues were raised during review but the devicetree
was merged meanwhile. Address them here.

These changes are non-functional.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 190f10a77d74..5dc3aede6842 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -686,7 +686,7 @@ pcie_noc: interconnect@16c0000 {
 			reg = <0x0 0x016c0000 0x0 0x11400>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
-				<&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
+				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
 			#interconnect-cells = <2>;
 		};
 
@@ -722,7 +722,6 @@ ufs_mem_phy: phy@1d80000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
 				 <&tcsr TCSR_UFS_CLKREF_EN>;
-
 			clock-names = "ref",
 				      "ref_aux",
 				      "qref";
@@ -912,10 +911,12 @@ pdc: interrupt-controller@b220000 {
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";
-			reg = <0 0x0c400000 0 0x3000>,
-			      <0 0x0c500000 0 0x400000>,
-			      <0 0x0c440000 0 0x80000>;
-			reg-names = "core", "chnls", "obsrvr";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr";
 
 			qcom,ee = <0>;
 			qcom,channel = <0>;
@@ -925,9 +926,10 @@ spmi: arbiter@c400000 {
 			ranges;
 
 			spmi_bus0: spmi@c42d000 {
-				reg = <0 0x0c42d000 0 0x4000>,
-				      <0 0x0c4c0000 0 0x10000>;
-				reg-names = "cnfg", "intr";
+				reg = <0x0 0x0c42d000 0x0 0x4000>,
+				      <0x0 0x0c4c0000 0x0 0x10000>;
+				reg-names = "cnfg",
+					    "intr";
 
 				interrupt-names = "periph_irq";
 				interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
@@ -939,9 +941,10 @@ spmi_bus0: spmi@c42d000 {
 			};
 
 			spmi_bus1: spmi@c432000 {
-				reg = <0 0x0c432000 0 0x4000>,
-				      <0 0x0c4d0000 0 0x10000>;
-				reg-names = "cnfg", "intr";
+				reg = <0x0 0x0c432000 0x0 0x4000>,
+				      <0x0 0x0c4d0000 0x0 0x10000>;
+				reg-names = "cnfg",
+					    "intr";
 
 				interrupt-names = "periph_irq";
 				interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1

