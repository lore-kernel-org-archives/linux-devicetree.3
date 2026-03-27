Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717B73B47CF
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607095; cv=none; b=NATQbB8an/pzfEpDiwABIs5l2xzkqoc/inUiedDygZllEOzCXlf+HGkzuj88rrNXMYXrx/rj3YGVdTmXqAczMvG/poZjTs3lFLlt/PntgZfxALaJBAxL3uMDOHQOASex5JbY1pSEjEQ72NK06iSy8M1i2a7qApJvURnhL2XNHj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607095; c=relaxed/simple;
	bh=rTNyAXYa0G8sDfHiF7L6uMqPSCAR9cACumeRerK6XaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JwJR6NDV76oMmavoK/TwYlv9AqxZ9EkztaU1wL0HK1cX4wEgxbisR6mtyOjyNg76IFzrL1WYUgbUZ25Xzheim6R4HR2Hfbfvn0XKqK39W/lmA2kch6DGQp1RlKV3JLZLYIQkFOTaKQOug2vANDdYd8AFWYrn6uR6dijPl+F7p2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlIVioYA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feLme7Eh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlIVioYA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feLme7Eh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w7aj3132138
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwovfDpYGUGxOG1PmiqhuvreEQneBruhR+pIsBwwcGE=; b=hlIVioYA2KU/r4jY
	duRQh0anxT1ETUyvnMyblxFF5WLOK2JeO5NbQF8Z2kZJaFhGYWc3/Yoh0WaE9RrU
	T11oxtN1zF3t2DTFwni4oQFj7PRREJX+YVK8T8fWNkT750ZzVQLTftGjC/oSWhLl
	Wmt19fdWB+ShOfITWF0EKGClIgF7qWgbw9R79v2d/ATtn74kzk/KIWj83uOQ8avX
	XUzaz5K+VnS0qeNqWfFNq4ub8xbejMiOhhcXtd9W+Pce4dYjrfzRzZNlzDpUYAss
	stevOEqd7y0awZQiCmZMh07XuXuHOCayZ3B7AwAt+3/UTRWDzZXdbd8Um4H1hL1w
	wNq3YA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s43220-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:24:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so1479185eec.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607093; x=1775211893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwovfDpYGUGxOG1PmiqhuvreEQneBruhR+pIsBwwcGE=;
        b=feLme7Eh38v51ed2oFCx5s20FwHiowp8GGGFkqW8gBOiwZ+zlP5EXUtIPWizRefWyZ
         e9zESDnFAC+QeBih2k0Qg/aQArmPDV+qLLJhtZERoIpGc33YBP6o+qr/BhlTggfFNY4h
         HDL4SEEuurRBWmMJGStHCkb6JXMZv0X5Z6+ZKK7vL/M+G2v7qLS2InqBHvtd0IiXxWil
         l2wrUECfqPrZhPgpRwv36nNBORTO1X3bb1RJ15loteHkKZch0wX1YygfKfDN32PiGXMy
         vkxQmG5vjmz0D09Ffjhyotj3f8fTolwyRfYtnH0O+gz9aPw2XrJLCJlNcktP168jF4Pb
         Ypwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607093; x=1775211893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PwovfDpYGUGxOG1PmiqhuvreEQneBruhR+pIsBwwcGE=;
        b=YisvWRrycPei61qaTR4DqVkSryOJMZU3Po0BacQk8p6/SCoQ0103/13YRxszTWC/3U
         G2WrLSGCSRCfvxX0eL4Q971aqww5t/km6BCMTenHgKFsxkzmthBChGQJDSkWfcNk6D8l
         ybtVTId//1ez8mAawGvMd4qDS8J5HwSms5pPno4c26+e0OvBqxqxaJgBCHaz6phMbAcW
         U5/x8swn+8acpCGHcXb2ubr3ZZCIozIbCKhsq1ZWjk6faJVEX5bIuoAb9XRdKVmCNuCU
         0cmYL1ULZkUKJRdJfgl4PWoBt00MiP2/p8MAKyCx4PWFEXysfcLuS2FtaxLgSXYgavG8
         lCLA==
X-Gm-Message-State: AOJu0Yxk5sgXeHIQRh4tidvDBgzp34H5wQgAftmCvr/xStYbf15sjgbm
	jIF1RcGdi9rzgpYDedhc2/XmZP3yKLH//2JNTiTe2BnQaOcPXMXvLO7rcawHJA+VtO0BRLNTpHb
	AS+ziqLS7fOl4H41D8HOdoIR/icAmSiojQkkNoTpnOT2CUlZ7BBJTH/pE7pKdf4NX
X-Gm-Gg: ATEYQzymlYZMAvDRrqOVDMM1SibwXYL0trwgR9yp0hxG2rhmZ99Gvp1aTW8NGkninI/
	x4HQ0qKAiUu2QDIEYkpAPw658neFcvf8+iv6yAw4JigL2ctanXynNZNeJnoUuqHXdbMJ7jpc8sx
	G/mPfzaDQpuFs989JC56K2qCg5t4+E4kMQAKB9bhrgn95e2uu7rGy1PbFhV6odgF8UADf8Soj37
	ZA9+GvcYg6Y7//iHfDgvUuTDPLWx9aR8rYOsi03gyztyYAuj/ORJ3s7xMr9RfjdqkNHjzo3nYC2
	neqhQTeIkt5pYaU9UkKldsPTNu8FJpujhLcoIbhjLTnvhBjRNFk9XHWdQZSUQlJXvKMQK8uR5CR
	t37uig0Y6IZkwoBOE2aevORmAWPZubuOAzLzXLX3L4pGhnYDsf5mwph1JMcLmi11fyCajwGE=
X-Received: by 2002:a05:7301:2f8b:b0:2c1:5a78:ef24 with SMTP id 5a478bee46e88-2c185e128fcmr905265eec.17.1774607092653;
        Fri, 27 Mar 2026 03:24:52 -0700 (PDT)
X-Received: by 2002:a05:7301:2f8b:b0:2c1:5a78:ef24 with SMTP id 5a478bee46e88-2c185e128fcmr905256eec.17.1774607092175;
        Fri, 27 Mar 2026 03:24:52 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec495b8sm4756173eec.10.2026.03.27.03.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:24:51 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 03:24:36 -0700
Subject: [PATCH v4 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
In-Reply-To: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774607089; l=1053;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=rTNyAXYa0G8sDfHiF7L6uMqPSCAR9cACumeRerK6XaE=;
 b=1GAlhHhKOlwTpbcvE/k11Iy1n37btCxxJoVoegesZgANcRKKg9f+jmYNAHay6WxBx9/2jM9RT
 V6iBryz30lUAR8mjs1tcWo9J6ZkOLLSY1/s7gcmhGmhjjz3WRAKSoC1
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-ORIG-GUID: yqiG32QaqJMOhcQajnK-bHzU6_S-x0Kp
X-Proofpoint-GUID: yqiG32QaqJMOhcQajnK-bHzU6_S-x0Kp
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c65af5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-cAd5Rr3oDDor6eJ5jQA:9 a=9XvURe7g-aze0kr4:21
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX5MkPGoDWPWvV
 ONbMK6dsKLevU0ZuwlpKWW6Vmng8jcu5mFawuQU2VOBfHOtiJwMSF5oWDGEmDuHDjr6xMcKkPFL
 +b8ZrO2LT2JlA+En6foKaFHMSZR06W+BUgjQloJD216WYdma/hd4ZHyeOOk4bcDVMSdsqbDvaS5
 VFh4SMv1UvwtxTNF591PqoNjHYBdlOxmGEayBpQK727dTqPO7Zk/Zp4ratytbE17fC67kfQrxuT
 N+J16V7chBUgjgsdXMEoYW/bXJVoj5Xm1jLBhUedLx086zr8SgM3z5QuCT3+C1VOCw/gfFVqvX+
 6zB6unlSqoeDEcoERIBnbf9ZJg8NVLjf97R8qCk/bfKzAVg5itqYE7YR9771RrdR3HsS8vD1vDJ
 xH/tPRKmO91QMYFfGcqcrXewsHfGQo2ZBdKdnyY0Q2dRlgpigBgYtKugNHocBrDd/pK21MSPw+w
 pfib2uFV+ai4udfU6mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270075

Add an IMEM on glymur which falls back to mmio-sram and define the
PIL relocation info region as its child, for post mortem tools to
locate the loaded remoteprocs.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 4886e87ebd49..21ae05f0ee17 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6457,6 +6457,22 @@ rx-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,glymur-imem", "mmio-sram";
+			reg = <0x0 0x14680000 0x0 0x1000>;
+			ranges = <0 0 0x14680000 0x1000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-sram@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,glymur-smmu-500",
 				     "qcom,smmu-500",

-- 
2.43.0

