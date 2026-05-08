Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E42343D8F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 05:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778218476; cv=none; b=FpXuuahE8kADVpipPs63IWPrazaXeZPS/1hsh/R0pdYscy2MzmiFGCeDF4Jy0nXPOAUlHSQXAFKNVmauaKZiHfQLBYpyLvz5ku1BGl3HhTsPG7iMeEJ+fEZVXu5he0MR4/xg6mwJo4oUp2bMMbcfeursXK+ub10CneqoS4KVi+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778218476; c=relaxed/simple;
	bh=VH1bVyI/Pfu1KVaWoo8Rg00AXnz82yjCH8Gfd6pugiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOa8jVA0IFpCXgdz32KkbiqwSL414U7roJUoCcBod4qq/LQmNTiNmFrkTxLbprJCfmA3lEvNKlLoiDy6J+xqp+HxwyDugDDQuycSQ/tXDrwdDHmubYZu7AS//XM8S7oQl6/1bHogzVQ6JfrkosonH5XSJlNDwT6wJ7NsHZw+L14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0FNqR8X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLMyHsOK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0FNqR8X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLMyHsOK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648224nK2384216
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 05:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQyAqnnaNwMhkb1k4NV+l+NR6ZrYsqhwA3dfMbH6KHw=; b=j0FNqR8XZMkDr/Bw
	FpIe63t1HoyY4GLZsCip5q+OGqfcbGON/gg0Bfq8y1FpV3dR44a9M4lJeqHko4lD
	YtXi9+K9xQ2zqJZlOOHPsgtFoewdnlolSfNMQbpo+xRKXrmw5w7O32RjZMXMF0GQ
	92BGfzAO6NTa8z/4m23czqWqMuiBkUeomxh6KcTFxCMVfc6Lzl1/4nU5pWIhAUOZ
	2n5SxNCKEfNkAevqSzc51nnefXPNDjBcAG8a+nz/1oeGSjNwDEihDLebVRkcGpxp
	IoiypiND84hFWZ1XhFkH5HXL8Xv3pllESYJ16fGGeAYudHSBRU3S2BcZtJjSoQFg
	pZ1OMA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwujhgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 05:34:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f5943ca81aso1523077eec.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778218473; x=1778823273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQyAqnnaNwMhkb1k4NV+l+NR6ZrYsqhwA3dfMbH6KHw=;
        b=WLMyHsOKg1rIlpDER6idHyz8EMU5qfoCkv4t331mMmxZbUaBxmjYIZr+Ptwbs1QgL8
         ZAO/+Wyebe2w+IOuoVV7dSO04R81S9gcnE8BpuzeNPfMtyyamuic6E1n7uIunH1sSV9n
         T34bKz8PhOMsDURZILtRiXNr5bh5N5NQtoiZiIQBQIDjKfR8ZP0u3+k8iScMvpqQmhEC
         CVnfN4t+5HkmzF2NaAH8aah+HWZ7jZiyl6qf+eTdIDdeWuZdiUtfJd3Jdui3ft8FmnAu
         wNjjblfAU3RsyPxokbB+maMJAHpbkU6snA8fwJY+UaXUSajfN9TOA8JRa3bFaq+pAOwo
         Vu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778218473; x=1778823273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sQyAqnnaNwMhkb1k4NV+l+NR6ZrYsqhwA3dfMbH6KHw=;
        b=WYYCURZh6O3a1hO+9xtgTIwV9n+/UOd2ESIvCmbgKERBfvlnhSSOu6uqxRw0Yy1CO6
         cUQiKOBOIiZ72Q24jJ/w0VucMtbvZKTJ+oGYUz+2+BWTgentOsTdXNZCEd0VKZ/AZAKv
         R0b1dQC90ay1pxy6ERk9Y/m8MsI02WLH1cB5S55QvImLijz4ztFtzgG2PM66gyJ4hjs+
         UNdGj+FsTiT+leKDztJmafdU7IkC3EFTGxR7q4rsfKIQF5tvfNmTOLXrbXcX/1OrrJ4m
         p7KohL63RPX/OerS4IfM0amz3PHvd430awkTxNmvbty2sS/BWEGwlqEPZOEYO2Ht+iZz
         ym+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/xvRCHx59GGtdJMTEKLVntTClO0O13RdAh+x/Z+MO3oMdUqdKnwOi2LMa68ce+LEPFckGJdXD18BJl@vger.kernel.org
X-Gm-Message-State: AOJu0YyzpAJ+uLqjNaAl85ZCLN5ORu4AnnJp6l/2xWZIGT8JFq2Jtr40
	fIaDgxKFVAIue668IVL+2BSk2+0Ir+aYHFIcup3kZtCts8aR27JOrHRaVMZ7aIhWT8+fucIFqB6
	w3N9iwwwznGPWUriiO+QbB6+dvK6MM8JNgG0Yu9+oMnBbD5Xf4zaWrHcxBtxsnZa/25PQC6c8x+
	Q=
X-Gm-Gg: Acq92OGaWFsyUKufD06JgnoYOl1t6Il446yTY1FSM4j5Tkz9fgNUCxGjwitxYAUJWcr
	HrP3HMxC/f73l2BTQOMr6St2d6zXtC+oREwnU3VyhemFYK09COIyHELHtziCX1ztUCFY+3gdGPg
	6Ze1SI/jMMQt0w8jWqEQGTJ7gU5/o1ZtSoWmtAJ+dYKXbonFYXDSfc+hOLxWRT33ufBmjRPt9Q1
	c34kYGrykQPRnb5VkpTA9bBTB51hJg27RE++7a5e8ATmvu5PPMuAAVnvAHw2G3fOp9hhYJztAaW
	nkW78PV/2O3qq/ZvrmB2BY4nB8C0e6yYX3MgJpkY0X6CEoBOOajSW1Q9riAggCqBHxMFdStWK57
	/pMq4KWNRMrtkCS7ulGKAQ+4FgC6rmF1mIRwzKNpDrzCKNlMujUAiYxowhJs75ZKBM2QdIg445w
	==
X-Received: by 2002:a05:7301:e101:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-2f55dd323c8mr3888260eec.8.1778218472943;
        Thu, 07 May 2026 22:34:32 -0700 (PDT)
X-Received: by 2002:a05:7301:e101:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-2f55dd323c8mr3888241eec.8.1778218472293;
        Thu, 07 May 2026 22:34:32 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm847475eec.22.2026.05.07.22.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:34:31 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:34:09 -0700
Subject: [PATCH 3/3] arm64: dts: qcom: Add gpio device node for pm8010
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-pm8010_gpio-v1-3-3bce9da8d2ba@oss.qualcomm.com>
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778218467; l=2615;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=VH1bVyI/Pfu1KVaWoo8Rg00AXnz82yjCH8Gfd6pugiI=;
 b=jcFOwT50ZYUv8mi1PQqDqpYxS5iJW9RJKnBBBlmLzxnGnq2pjm42qAI7RwiBda2pPxHHiKsK0
 LUY6azStleNCUV4Ab94zJFxm+IKr1qQrtmIQepq3fj29h4fzL4O5Txf
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: s1C_HanWs2rdgnWdTc0gLSQVwGiFlsAc
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fd75ea cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1woaabIM3g6s6BIelNcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA1MiBTYWx0ZWRfXyTP3nI8Y6pRz
 dcrV9Pmf6g75L9sqbEcyfKFXbNx10CM47LN8QLmohr5nngkoBhihWMlU+KKS9tg1YaEl4pDqVzH
 ENIcAdvoalj44dEkSJcrfQ4OSpGY3B0lOlVL3ncfgbcoxg6xCnKk9eNqibkhFydS9XXXPL2XLko
 w4nx2mgSFdri9WxJ/E67uP8brXRMfk80casqDw2U6qTp8YSK8/wxryE8fPRh8JYbbIXLnUVpRWF
 Bn8IJrb76/Lv0/68vGj4f6wzS2BSgCZuXclAljMT70gvDxZs/bPO2S8JQ4oJ5iTRCLdbMn5zKhE
 HqzgZCEEEGT58kIDlNxf3Hb6OiBGag+NMoe39UgcoXk0p2ToEjHzUTj3bFDLI5EpQ7zSb9QfH+a
 NdR+wrqYw8bLrYLDwfO0E8bqV4L0wQpMha1uJjtxUvPBQ5eB6vrULMdGrnDmF/QfU+BG8tUp3ik
 a0qNh2vJ3vuD1R173kg==
X-Proofpoint-GUID: s1C_HanWs2rdgnWdTc0gLSQVwGiFlsAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080052

Add gpio device nodes in pm8010*.dtsi files for any consumers to be
able to use the GPIOs.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8010.dtsi           | 20 ++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi
index bfc58a6589d3..6a8f1accd260 100644
--- a/arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi
@@ -75,6 +75,16 @@ pm8010_m_e1_temp_alarm: temp-alarm@2400 {
 			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
+
+		pm8010_m_e1_gpios: gpio@c000 {
+			compatible = "qcom,pm8010-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pm8010_m_e1_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	pm8010_n_e1: pmic@d {
@@ -89,5 +99,15 @@ pm8010_n_e1_temp_alarm: temp-alarm@2400 {
 			interrupts = <0xd 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
+
+		pm8010_n_e1_gpios: gpio@c000 {
+			compatible = "qcom,pm8010-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pm8010_n_e1_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/pm8010.dtsi b/arch/arm64/boot/dts/qcom/pm8010.dtsi
index ef330194946b..031fcf38f3d1 100644
--- a/arch/arm64/boot/dts/qcom/pm8010.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8010.dtsi
@@ -64,6 +64,16 @@ pm8010_m_temp_alarm: temp-alarm@2400 {
 			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
+
+		pm8010_m_gpios: gpio@c000 {
+			compatible = "qcom,pm8010-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pm8010_m_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	pm8010_n: pmic@d {
@@ -78,5 +88,15 @@ pm8010_n_temp_alarm: temp-alarm@2400 {
 			interrupts = <0xd 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
+
+		pm8010_n_gpios: gpio@c000 {
+			compatible = "qcom,pm8010-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pm8010_n_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 };

-- 
2.43.0

