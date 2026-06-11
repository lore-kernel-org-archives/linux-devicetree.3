Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A72388E45
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154064; cv=none; b=N53kLmxw4YNA26a9tU5qYKCg5wisMlmkL4Np8+0kTo2QCDMHbpeIQU/4gkjw+0XsVOXUaVhYxIZWH0d/kgVeoa5w4XpAUTHOhXCBnO2KbvUrccniuAMDqY0X2QZ3d8U2FDs5pBTgX7bfd7IGD8mTtUeqsy56/kIsysaWypNgHYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154064; c=relaxed/simple;
	bh=FPdfUsfn8q0zPY3BRymviftK3PmEepx18oCPwq5LtH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWxvgW0YCrFpAtb2OYFoMNxYe0Or/KClUI9EXWbxwufoxQaC0zy1KP+K610pzrcrrtDZvbUl1ZVY394W0mj15icpJs3/ayGpI58FpYCDFgDkbZVJceE0lmLe+l6N5owvjaTXC3DMGbFXu11f+DUWE3+P53Ybb10JbV0jz6LIssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRGP5AAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pj9qhZ0v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRGP5AAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pj9qhZ0v"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NQJd1614529
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asIoKSdaGYNn+9bH5fpzO8aem0Ee5lVW7EfTX1oJsBU=; b=dRGP5AAGgPsGhBGF
	phUgHR8nnx+73KmjnZT14uNYb8SBoacBaPltZN+lOV2DQbw5zEK3ZZTll1VCgcl0
	mLXXpenAKIx7D/I4thtkuIdqLYkwkDHaqROzsDXhQ+YDz/avqutABEpwNLgsDyG1
	6qZs16BM+vnUbuX1D8BMg87TUWc9+rn0kkWsrWbI2ZYD5PNXtHq3AnvE+gIDPHxz
	GjWkUyBrpUBnFu1WNmlxyBSetuQ+9TFBtRVVzhbJOeSL2KkTFf/x+wsTM9XMg91O
	RjdeeMYdt0RvjgJcZBRZlsx28NEGbyw+UIpnAnfuq2ybRholXfFh/dfLhdaNY71v
	d+auXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79hnep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso12288295ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154050; x=1781758850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asIoKSdaGYNn+9bH5fpzO8aem0Ee5lVW7EfTX1oJsBU=;
        b=Pj9qhZ0vrLY+CQktRVR8uy+NQAemb8opHe22Rv75wEw8hgnKotefKzoM2TmSfpcX1N
         6qk/4wSXRMRRIdxH9zsiwW9jORsxEUYuVc+5Mf2duT9vxMRo8dIXJcu5s5iuWpD4wGoa
         /ovlK0KAyBoyAstELoRU8/+H8gSOhDCtVa+RRt9tMwcZXcUvN2XwN5Ipr1cxvDZLUK+9
         xCmAE2AKWrrh+R91DQuvnujJKzPOr4K0PLZO/plRmaLpVLXrkl0rXU54ZjDwrUiEJwcN
         NZ/HnvWHBacwlqJ5caqWcGeyvrwJ6Q6I0Kt2CP826hMYT4bqxwX7KsU/vVGPL3TFOj+B
         AInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154050; x=1781758850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=asIoKSdaGYNn+9bH5fpzO8aem0Ee5lVW7EfTX1oJsBU=;
        b=riGkQpyingGeM5FJZmFYP8YMA0ROp+vbhe6E8AGe2apQJJBpoiF34Yi83tgYYGPcDP
         HTU1QdPOw26YJJBNyqtabLWphNgtSvESPidLK8XaXY3zRK+YDnqBbUa7tOe1n1rHOBiH
         U+duXWs+3bjelYhkcqjOysun4/mYYAi0O/D/I9PMccXnDrgmVLubtC7UR1hCBoa/LbIv
         AFhMk4H9Nm3v1hLYLm9lSq/M6YT2haunn85pbOc40EluxILCtIvJxZeTdfgH2w4SpMZC
         HFsT6lQ2yAgYl2wTSOkNvAvXssFmyvamkuIq4gWvQOGWxnmUHIWmo6j7ktmCAHsOPKMn
         njcA==
X-Forwarded-Encrypted: i=1; AFNElJ/N6YlLlR10e1ChdzmUfaH1cOE2mczwc6k0Hih7vPn+w54iPoQHmbny8KWojqKCo3hQu1kU0GNZw2KZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSzSeJJuJHcv83/KC15fB5WZaizyesM8J3noSrF+opFztmPee
	qM633zg77ICRMRDSsejpwi6641pwlX1/5ronMVlpYQs4hlLvJFck5xUnQEKPsk+cgS5oxqnALYX
	dl9NcQKNrhZG8mm4LiS7MU2TfC+CVeWsYROSycJrkfg2JSfbci4DgMFerMwOCn5Lq
X-Gm-Gg: Acq92OEBGGHVqsyhxJ9LQRxifHCjdruQ1/X5frmDH9HZ3OmJOiNWaUtOpDuCpzQbmWu
	e+JdH1j2+7htT6U5Bg9HAQaQbLAG4lgj28gEb/SWUlHnV0Z47Zob5YVvrwikW7AUMvPfW+IG9fm
	krp8MR1+vz5GTNbK0Az5xa9zL+jZ5Y+oQQFvZq8S1UZsMUsWzNKesjl+4CXrWjBlRlRt73OfNeR
	pKXK9ptgq5wcXV7hVr/dip9qqW4M0xd/K1LlKK6GV0ill9wppqxyXuTn7N8O9y2MhjztFNcYgEE
	01YBpQtPnl0sTl2MmOEZ0ncQp+vRPpGw9EekpbxemSO2sqYxja9zmkejY1KA/Y8VlunhldDzwcg
	TjonUQglrFxebp/4NnmGGTIw71jNCnqqGzm/S3EXXftyBZJxMGx/fpwHr/WwFlWchSY0=
X-Received: by 2002:a17:902:ccc7:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c2f23a04d3mr14469035ad.28.1781154049812;
        Wed, 10 Jun 2026 22:00:49 -0700 (PDT)
X-Received: by 2002:a17:902:ccc7:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c2f23a04d3mr14468565ad.28.1781154049317;
        Wed, 10 Jun 2026 22:00:49 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:49 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:05 +0530
Subject: [PATCH v2 29/37] arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-29-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=2280;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=FPdfUsfn8q0zPY3BRymviftK3PmEepx18oCPwq5LtH0=;
 b=/lFkgaYqz7IDXrx+lsoAH5DarjM6mDXiklRFg8njNZcsrWvcqIv+fDptZTC6Tp+YWq5hnnmK8
 /px+L4jGDwjBs0z84bMTdxlIffGf/Zh8ChxMt9D4TBQfVwMcgel9WK4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: Ux4d-pEhpkkr3Ii-TbdpqmZkM5L7emG8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX251B37vAiLQ4
 lJ4PODdHHC7wWObFidC5QH72EXGb+waTlLoKIjLzk3TxE2v9uJbWlRPpkXmqovMDZiEQbiqBO8g
 2W+v1F8jEwU9q5g2Xk9lToByP8PaEtRBSCf6IOSLQfA6iCIRd/n/cm8tcHhYCYfBDnZ4Xq39ZPe
 IIwrLYsa3y2eT1/YEGs3ibmdn6loeyrORTMFNJg+ZLDUiPAa3ybzIhcZAwzjHM78evrhSE2xEWI
 aOHiwHn64R8TTcspwC4rkjDyemhEkltdwyO9vZL7cfYDaJGSqMMZ/hGEykyqFMUUl11YG72Q50l
 PEDJMPrxncfuoxzbzsXrm+YAnMoShbqP58pigVJ0CYkloEbLn9ToDEICLUEDmJJNl3WmIgnd7Aj
 EtcVUkwWg13dCIX21Z/uMbWliuMQTHHwTCIqK7nGqY957wkjAQmaPl9Ok7P6zvkHQXxGUwBlv3/
 SVWLwRh7lZ4fjluHNIA==
X-Proofpoint-GUID: Ux4d-pEhpkkr3Ii-TbdpqmZkM5L7emG8
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a4102 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX8xveynqsPf14
 YS2g2yzYl9tjrxy112CWQCG10i479f7Muse6HU7/F/U/dAFoc9afAi7YrJbdraLDHF+voVllysa
 nMJfrG3A51V892b3yyIV3vLiLA+yw6s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to pcie0_port0 and pcie1_port0, adding labels to
these nodes to allow board-level overrides, and renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 8da494de4308..f13c67e93db3 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1901,18 +1901,12 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1920,6 +1914,10 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
+				wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 			};
 		};
 
@@ -2019,10 +2017,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
 			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
@@ -2030,7 +2024,7 @@ pcie1: pcie@1c08000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2038,6 +2032,9 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
 			};
 		};
 

-- 
2.34.1

