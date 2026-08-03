Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D951C2F8EA4
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 04:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785731172; cv=none; b=MafC0ThXGZikcsBaI2VRfEAa683IY4EK66cQ/1f4cDzHWnWCqg4189FaM2Gg+STjLLHUYLLCpbz2ZZi07AjO8eqRUANu5dvQ2wTjhbJ0O2vkzR0PFh9hTGJU41tCsJIIMqAnr+u7+PdlMpKjlGfxfw/S/MLgzB+69GhIsrcm9U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785731172; c=relaxed/simple;
	bh=vaUOuNP9CEXlMt4R9gRdtJC6kku8gQd4DJAx93x9pZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O5U68Hxd6f2QU6eQz2bzw+7bM2IKrMOkCqyWCsZSBNOJqiOvAbzlOmSt7un/0hH6KhzE2wGJCnusNVBM8CcqMZkW9bzzL4mZ8pVk0oNDUuO/fEWavq2Acv2XE1Max6lb3QW4I58WfiifUO+Lae3Dozwxm+T5EjkEXsycTDH63SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiJ8YMOL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdXgCq/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiJ8YMOL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdXgCq/4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVr292594702
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 04:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GqHSUzv6TANlrKeUaTe/Y6
	BeYPwufFXq4KfOBLJTa0A=; b=TiJ8YMOLfYXg1rLTEpdd/Z0OC7XMaxGQVKM8tV
	Y+qn1OWUTUAFDTtmp0pEYTPDWonTBiv4RKghfQ38yKh8KjVo6R5tS5s/PsE3bwVV
	BFyT6GVTtUFqkpfaJZsMjtgYqbnkHkI2IipHJQOoZmpZ782Al16DU8MBnQV8yTIi
	8eKQ9ANa/GASHkbuWao0uYSpjrIwVUPNKCcm6KbmCNBxP9+XS6u6xG67PCD6JnUV
	/MQh3U94lzBqZ1Zu28DWtlrV/Wa1ijH1W3Or7apae8lXhqwp/ZpI7eDuLp15GDPv
	aYXKhUIcCekTIYo4ngsqw3bQlqbMTHsG7LLrD3MQbj4caEzQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs966cdh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 04:26:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cceabd70f5so91252735ad.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 21:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785731169; x=1786335969; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GqHSUzv6TANlrKeUaTe/Y6BeYPwufFXq4KfOBLJTa0A=;
        b=LdXgCq/47Gj5nn9gUeVYRxUD5y5LVk3GsGhpf3WSqq4tsjFGeWX35411uPVwfm3lUH
         Sed5Q5lIr0qrKKRQLKgYm/Y4pIdkMEh8x89RSl944YHlayxb0Q8b5oGbL0SotSEeQ7VR
         BinwLl4VfT8HX6wrRPdlAYqQ80l9D0KcFQulzC6qFNsTmarJvgdExRN0u8PTH1+/6V8g
         XgP7E6mM5cu/aCF2qS/Oq1yzLl4xc6HznuxBdePCAKLnnIBGPqmmsWM4HkH3eyzn2dKc
         dhUeh3x+oswaPcTT1pwYHEpZmNAXHjNILNZw8mD4EaA5fUUVlyifxfj0GW3yDoNTpFIq
         Rn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785731169; x=1786335969;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GqHSUzv6TANlrKeUaTe/Y6BeYPwufFXq4KfOBLJTa0A=;
        b=U5+ipi+5dDRf77l+4RzNWUIg82ZuXwqxTg1lW/KgqgK1wqXDnFVs17f0Zhq6HGfHts
         fljXCAwvmYzk3q0TqMeFBgd6LU5n+l9ig5XYPQ8b9/ALNEDWqZFISl4afrhlrfRrWtmf
         YiXmKjTIrt8faIXji34ifLUXYjHRBwQQHUks6WbWI3Fx/HSgJSv4njZEpqzraTZ1sore
         qRl3C/MzqSTnokI/GB/GQylTvhcYZ6I1/Kc91NGKtI5EoNomPoApKtUd3v5BWCrrzlhV
         PYqbn3lMhDzUu187X88PeNc3COkBvNMArGdtkWPdZz58e8QBvXE5zp3mhLD17DQVlCXG
         GVdg==
X-Forwarded-Encrypted: i=1; AHgh+RqTrD9QPH7rbm1AFbr6RzZB252KrGCp/HjcBk88eZ2IYns6mIK8fLz2Ia3EwuEzrMSsYsXsXfNxDeFG@vger.kernel.org
X-Gm-Message-State: AOJu0YwH1NtPTWhmwV5KUdkjS4GYJygYpGNy+70ucseKeQp/B2ftSrdC
	A9WxeHWIF7lctGedjiS6vXHKltzrMVmVklYcKfxNJzmIMc6N4GxkfKgeMkxLifGD2OHXFUb0Zs9
	gJyKbxm35/fuz7FOW0qeYbCHUagktPMT10spmlDjwNLkcERwpucTYiZUwPUnognAE
X-Gm-Gg: AR+sD12Dsrov1WghY4EDyAcguVp8jqHYpKOG0co0hGzNH+EnPD4+xIEuo4qWWuNpO4C
	aJFBOo7/lVHioPxmym4MsWK7q8Ny2B3c1/47Tn0IzFVGG9mjXM7gJkD8MU+ECB9rw3ahnorV/qq
	nqyExW/JHn7eSrH5miBoyjy8UjFGQIrvpgWqs735EOs3MP9twIyBqEv7Ne5x7mvD1dEzydC7uSG
	M++os1DhMO7W0FRwaEb4v3jG8wQTU8NQ+W9CeXNdvNGJ8T17kPigkFq9t/4MOJMfzur/boGH5GA
	mwa7E0vLCZioShPKdxzpYDJDShlc3X8S9yneWs7Fpv4ZhnognZjFX1TfJ5pL2Cusb5HAbrUM+zr
	oPpy65dLCpXR6P/X1bqh+vslg69TtVjfT4+KXKDzj97x7nuQnNPCRls1ZOnTQo3xH2TpLcw==
X-Received: by 2002:a17:90b:4b81:b0:387:e0db:3fb2 with SMTP id 98e67ed59e1d1-38fbc5abb33mr7980199a91.43.1785731168675;
        Sun, 02 Aug 2026 21:26:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4b81:b0:387:e0db:3fb2 with SMTP id 98e67ed59e1d1-38fbc5abb33mr7980175a91.43.1785731168288;
        Sun, 02 Aug 2026 21:26:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab25227bsm26427203c88.7.2026.08.02.21.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 21:26:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 09:56:03 +0530
Subject: [PATCH] arm64: dts: qcom: Fix USB interrupts in Glymur DT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-glymur-dt-usb-fixes-v1-1-0f5f52853102@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFoYcGoC/yXMQQqDMBCF4avIrDsQExHtVUoX0Ux0pLUlY0QR7
 27U5cfjfxsIBSaBZ7ZBoJmFf2NC/sig7e3YEbJLBq10qSplsPus3xjQTRilQc8LCZbam7xwxht
 bQyr/ga4hha/3bYnNQO10XsG+H2pKZZB3AAAA
X-Change-ID: 20260803-glymur-dt-usb-fixes-62f314d3f3a9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785731164; l=3907;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=vaUOuNP9CEXlMt4R9gRdtJC6kku8gQd4DJAx93x9pZw=;
 b=EMk9vfc4fwL9onGUGejJFf0vqpwOWEXMUasvxCUicTPp01k5xfG4H8g8x0NJx/7F0W2qC8TJh
 nZjTeyz9jbeAGXW/wzaj7JDUEf25AgpSWQwLnWzRJUedH4SM0crvU/h
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: i6fvIueK6PZJMo8OFVTLGd3x0UhC-hUh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAzNCBTYWx0ZWRfX3rgLF6Gcrmzw
 b5PDmdz5mFcCw1HavOqnV7Hje/hS9f2yEECscQYG9vQn+v13wz0u8pPnuT94NUcYJet7e9fIl1B
 +yXOUvoA+KNOjcVyyshSwXPUfpp//h1dotXSkyqkWo5wwIPxBMP2jx2aTWVZbbYFHQhKBrv4sq/
 +sapODtLWS1Egpum818bdEEfVLvcGSWudE8e18tyOEO7C/mz1ULnHcQvmKF5B/7lqr0kpHXGTFp
 mmaX1rIsk74Je3PTi5yjJPp+J8avvWGlue74SCJKu2nArp/eRCrtbMZQp4bojJmpoGjSgvggQPC
 GriVpVmtOtmv2DhXcqEDSobWpij3cQcTWozqlv7h9N3uzi/T2jsdI0KyESYoOEbbC72H1lFS51j
 7msTehyKGFtPGO6wUxB6NPCT2KXKMoK2xVEdPlswXA7XWWTfegOWq7RIew53w56I8Dmr6oV+afh
 8OLSgJXksMsGeTRX88Q==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a701861 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eq2ofp1Og2zW7akVGkcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: i6fvIueK6PZJMo8OFVTLGd3x0UhC-hUh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAzNCBTYWx0ZWRfX3oWy0Hmc7EBb
 CxdYodoWTu/JyKWIP7JgZM1GGE0mKVaI7kj3e1ceYQRJhJF7gkQjDXIBTHg1L1lLHDIHz5Azj3e
 FyqgzI45WB159kh/TcC2cPRqYAQc1CU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030034

In Glymur, DRD capable USB Nodes are missing the HS Phy IRQ. Also, fix the
pwr_event and hs_phy interrupt numbers in Multiport coontroller node.

While at it, the dp and dm interrupt numbers have been swapped on HS only
usb controller. Fix them up.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
This series has only been compile tested.

Binding depedency:
https://lore.kernel.org/all/20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..7a71297db481 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4574,11 +4574,13 @@ usb_0: usb@a600000 {
 
 			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 90 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 17 IRQ_TYPE_EDGE_BOTH>;
 			interrupt-names = "dwc_usb3",
 					  "pwr_event",
+					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
@@ -4649,11 +4651,13 @@ usb_1: usb@a800000 {
 
 			interrupts-extended = <&intc GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 878 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 88 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 87 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 76 IRQ_TYPE_EDGE_BOTH>;
 			interrupt-names = "dwc_usb3",
 					  "pwr_event",
+					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
@@ -4725,11 +4729,13 @@ usb_2: usb@a000000 {
 
 			interrupts-extended = <&intc GIC_SPI 871 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 877 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 89 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 81 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 75 IRQ_TYPE_EDGE_BOTH>;
 			interrupt-names = "dwc_usb3",
 					  "pwr_event",
+					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
@@ -4805,14 +4811,14 @@ usb_hs: usb@a200000 {
 
 			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
-					      <&pdc 92 IRQ_TYPE_EDGE_BOTH>,
+					      <&intc GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
-					      <&intc GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+					      <&pdc 92 IRQ_TYPE_EDGE_BOTH>;
 			interrupt-names = "dwc_usb3",
 					  "pwr_event",
+					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
-					  "dm_hs_phy_irq",
-					  "hs_phy_irq";
+					  "dm_hs_phy_irq";
 
 			resets = <&gcc GCC_USB20_PRIM_BCR>;
 
@@ -4870,10 +4876,10 @@ usb_mp: usb@a400000 {
 				      "noc_aggr_south";
 
 			interrupts-extended = <&intc GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 11 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 14 IRQ_TYPE_LEVEL_HIGH>,

---
base-commit: 1e88112e60de707020f3def45af81f9a0180ee82
change-id: 20260803-glymur-dt-usb-fixes-62f314d3f3a9

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

