Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165192;
	b=VVlQQnx0C7J6zM9EmZ31nOwlCU4Do1Uc86CS7TxliC5zplHzlOSHSAuG4ZE3p3kop5ho
	 WBmOUO4nuhgnH3bC+1ARuktdIjg651ocP9mUV/Nl28WrCM3DNPW859BL+QQKeSOLVqgFR
	 Q5L3KTk7f7R/HLEL4S2EUtdpzZxLP5gSdagl3H8K6UzrrnRa0SMPdIcx7kXbHsAbt8GHt
	 Te72/Is/881Zq1BDxVGDYIPqNi4QULTKj85caZdSVPnhjTPWq7RhY3VAs2SJtASh1l3b4
	 LHYtaebN4QlULZrpca6tw42yHtR/JDVMjf1KQLUhiaRcdqZsentXtS+oyuxbf/jx3Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=;
	b=r/kZhxcPxIFBmq1JFIAXmZbbtQxNMo0XtTcrKopIAbADup5L5s8OdJSc9ij6LGyCJS52
	 U8sNSL7iHE65yKOkD2IMp25gXwf3ePb/B8xwwL2wKK94x9Y59zngd7sotb1mGbG18iQSv
	 ix/kA0e9asSSsVTmptbuah1kqkP7jjWOJgA3emvXSNy7nRnD0NnmTeQcLGlgQtflVCOnq
	 pFf9txTLYmvzOItzzcJA6uP6ZEROIjLwRs7fDqbSQjG66tBJomK8FlGCoBZV1c11d1eDU
	 HfnWeTveeahn2rCFaTUuobZgE9NFYaPdWT+4FSkLFfqEFApY1hNnrlJZ79R1uCBMR6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RswzydCV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSiAsk+Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795FA60A383F
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 795FA60A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RswzydCV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSiAsk+Q
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f2iV1112288
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=; b=RswzydCVwpRN0aTB
	hKXywHrnYYcvTSCB/seaXPvfoeM5J8GcZpTrzQrVMQvt3hSdrMXM5ZhGDyzCTVp3
	K1Aqh713GmyPhl867lXvmCQkn5RGuzFTmQz8QFkH7oKLMuLgHQMsNC3Kpji9wahm
	OZUKjKoa6uovVnGXZMCrmIJa9j7tUOMrKEPj7GTp4X4b3RFfA8kKT2dUQ2mhCPAQ
	9zMhy+tbsBArlQ3+jBJDVOf2dQ+M2p+qBks7y4TWnaYEeVzKN8x+g86r6MUi0BeV
	DwzsM800pbIZKxqVkZycHIqUpwgomPozrdxl1XIcwJrgFQ2BtyHxyI/W9jU7K7J8
	uE2Opg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtry0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:59:43 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3a348a6dbso1306212c88.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165182; x=1795769982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=;
        b=cSiAsk+QRq/Gfs1mAGfjoPbiSjUgl46pyDp2J30Eqjjn1Xk0JRjf6e6eDk93RJydJ9
         GoHL+SSfn9bUtIAa7/KujYx5UMjCh9B2DEHK6G2lfRNKph89OwqE3yCvKuAihFSeABl3
         oLEmeLnw2CDm+ZqWRzFgP9KDmGcYPKoNsIiPyaCvvYOfNIX4bNepy8+IcIZk4rrSMQUu
         Dq0jzEmZ9HT6mNJtSVnDVAn+/nPb4Zrgoqs4Gms/2XA1uIqsyMkJcW7/kfvUGWHMv/5w
         4jEUEzL1OhdPtCCCavyY6sXzxjL/jZEO5xZzshomrE8kSm/oivZEcx3LovQVc4pDzKzZ
         hdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165182; x=1795769982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=;
        b=R/UfLSBbOFNRW+1LhcQyQOQG1Evdy+r7McCi31rk+JYHluoP6m9BiMChHYAPheW5s7
         wUCItyExwMy11WkSAqhuiAeJXoHtG1Y3dab3UcB3Oa430BEIU4x+Bg92PyYzH1QaI6kZ
         QKT2oKzmebtb6WFQX8NfK4/+QXCqKw1k6KFN+XF7ed41w3ARZTqEdmd25hYng+oJKabW
         onnp9/vRL0otHSYfuXpBqgGtfiqRo6dseHFyEm6+SBBUhf4DO4vvj2LBVMOKw5uoGSUH
         iSe1ETG0QOd4jIl7nKVu3E7CO2krtLLaG11FFtMregnYgNqPNsy/ixARTPefsFGDyWCG
         ZxCg==
X-Forwarded-Encrypted: i=1; AL+hErEQYkQ0SGmLJd4KfraRiSff+dh4KjiE8wW4e37M/QCXiceIGXpfY6P0RSDKWWoIn05WXzt+dxjLB/rT@vger.kernel.org
X-Gm-Message-State: APuU4Z+CFspYEVFosEQbnctEctfOL1XEt3B5fGfgrIA8+Ii4sO3GjAQ6
	GershdIspUywK8+ADXruD8NfiYHPdMQ+60sE0y7Nhco6tZmWDmBvOzx5Dr5MFCwokwXHIQi/sI2
	UwHttnNkAW66DAVSVh4sSLsp4PLYbb0bRanc8PlSb9VtUd6AbKMkQvvinEutHOzeU
X-Gm-Gg: AYBFou3aP/Tpgesmmg4UvZp43sFKBwWDycbpYuMvuIaZjLiOP4RZ8OqPORXMyzZsaly
	QaA4kGA4QhKN/pKPC/lrvSY+vVaaOA+PGQ7jXlCyO0ojipLI1Cv43VkGp9BrT5xWy3HEorhv+Tj
	XOOBRPvRMsSg7cYsbDIo9BkmkkWMQjiJ8Fki4laTRc255vt/GaEDVyQF3g4xRoary5pqBgMSJQT
	SYtSz5pmWFyCvXTEmpVpt4JmozwmS+aOyC/dWx7pv6437vLX69Y8KlXagIAYCkrYA8TKtGaXrhT
	kzMnKhvC06fl4pS2ITUS1ZjQm28V5hxbPC44rchhfvaMihofXDgX2rDNICypZQQJlFQhveRNEJG
	var/lES9lhvkp3N54hVgrNOvhte7uofxzXlv/r0qdUmCL1dsNy/3nI9fxauJ5wkNneLuaOLYz9E
	Mij6Y0o6WKSbX0aeO9WWCYJUMpePk5ufCdkfgT5lDGYLQwHWjbggeTabX62Ia2qqzTA+6jW9273
	9WZn72qRIY=
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr2130556c88.38.1795165182281;
        Fri, 20 Nov 2026 00:59:42 -0800 (PST)
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr2130538c88.38.1795165181856;
        Fri, 20 Nov 2026 00:59:41 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm9490658c88.9.2026.11.20.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:59:41 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:29:09 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: ipq9650: Add RDP488 NAND variant
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ipq9650_various_devices-v1-4-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
In-Reply-To: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: jKkfdXAZlFzZDI3rM5Ajue3m3riw5PRn
X-Proofpoint-GUID: jKkfdXAZlFzZDI3rM5Ajue3m3riw5PRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX+JYRhYLPsTvN
 Da/zKLwI3YFH7ndM43Z+J8IWOfc4YhlGOvYiP4WJxSq7MQDyKujcIk6yYLqjRlNRZg3BeVA7B/C
 I+WYi0KwQCtcAafHZo5fdw18L2+Do/aU22XqdypRpLMgPbhieMdPNtHS5sfj0X3HkuASkchJCcL
 kEWb6SECfof2FbsmkDditd4M74fOWTQtiidmGSLxQCUUe5ZqqyqCf8v216cZQpipYDJJe+IUbnr
 ZOrCCNXKwvAcpZy6fsSQ/GX1AX9nw/Y3SyDb0t9WYIcsnI8IHcoQbI7f6TDS/4l4wUdSep4Lk6f
 /wCl9t6OhNWm5e3Td80BFE9T574xCLHN3C+9LV//HA754XXltFH6VHNTM5BSD3aItK35ll9qrvQ
 CH4ocwr2HWj9VBbMx7x1Lpms1r/z0N+MK/RUKqW5JPjiMxLMx+Ty92WtfooWtrPenac1wznFp34
 HSzxpop80cpOxQcxZKQ==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b000bff cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yQIfAQVsIWg_aQGHYmsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX7p2QCVq3GATB
 Nr0AXKrVPeDgGR1ADfusZ94q79bWfa/T28dQIoyD9Myyp//yjCINJNLDuw4FghnBTaCN/wU7ku8
 NGD6s7aNkPSGbONnbvoez181uFAtADA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200035

Add the RDP488 NAND variant DT file, include it in the Makefile,
and enable the QPIC node.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..f3d3de3a1f7b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -60,7 +60,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb ipq9650-rdp488-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-xiaomi-nezha-cn.dtb kaanapali-xiaomi-nezha-eea.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts
new file mode 100644
index 000000000000..fe592e04551c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq9650-rdp488-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488 (NAND)";
+	compatible = "qcom,ipq9650-rdp488", "qcom,ipq9650";
+};
+
+&qpic_nand {
+	status = "okay";
+};

-- 
2.34.1

