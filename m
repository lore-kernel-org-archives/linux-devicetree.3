Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FB383990
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376395; cv=none; b=Av8zkSXGOa5wBUczDy5cP6/p3czIGRFCpdpnL1iYgAMSb0lcaboM74Ei4tjZPrTyTSLuookny4XdA/zUmVKlbpPl/hcBHobjj6c55NF6OjV1CGjoUVG2sQNQQtHu6gYSfTWxFZLsswmnLgIfO65RjuPEgPJROtwKMnRlBxbMhDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376395; c=relaxed/simple;
	bh=xSWMZUncT7XcVJn8ZycXc6L+VR1duUYDggVDyKymTus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f79vSnCSMnNgv/kUuaIb36jgRSxz84xon1yuU7OqOK7ucb8GaVwpai7xvp4AWn7qWHsf3lgbG1Kfi874NHFC8AQqkZP0wZad94+NxrKL2Rdh6VWxpccWbaVPJM7S7byvgzCNJPF+90DL6t0u0FUQ943a5MRC2nQMPhmd0t/QG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+3goCA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STCS/cHk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+3goCA6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STCS/cHk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHgxs027152
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pE+abgvX3Y5p22vOFjg0bXapLlvagyW4I7PINjG9CBA=; b=F+3goCA6syNXnbrc
	VEyAMbhYzNPQ+3g0cEPzf25mcXE2t17xMlT9ES8m7P8eU/57OhOB5tuRec/niy1L
	u608weQRZgGOy7UEWl3/UXPG+ljZzddzJX7MQ9mPqPd0lCFM4AzwvYZPBkruVs0C
	k3mjItC4IOF4EJydjterUp4z+O05SuKIZHdvlmfDIfdY6/eCQR3dhEIgVfDnyhPW
	v5MGSV8028T+8A/6EBQeqhRUJlFSPJ0TxC5vqJYYjdSzJXM3wzQBfFTjWZxKH0gw
	jhlFmVpiSP0oyI1pAubenk1APo+yMi0nK+NvMAo9iOFFLMl45WHnEukqeIZ0Fgq1
	mzJUfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhgncm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811279d51aso9871206a91.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376389; x=1784981189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pE+abgvX3Y5p22vOFjg0bXapLlvagyW4I7PINjG9CBA=;
        b=STCS/cHkUdFnNx2FeWj3wVndGcY9GW8zT1X3AphoOamxfey8Y0mZyk6bkTWFRLZPwS
         dsYrhRpsQYSCL6T6J1qBE6JxMn1XND+H5868uqqYedW7pPSoWptvgMr3Ui5oLFMxRS0a
         Yny9llOUc+6LwAnGnS+yuoNpOnIW2StUlLA2HZcD/njfmzZlZ12hBotPgYQYnFSC1tjL
         B95yV9ovZaGQ3sEVpb4zmU93jtC/5oUFDSKlFgoAx/TnBHfrdWAMWZikhayPzwLKzX4k
         dA+Fm1FxudkQ3DIfncr9tEyXhADdaq6EtxDznox1+MDOkuqlLM1bGIk7WFquqokCKVZD
         10pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376389; x=1784981189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pE+abgvX3Y5p22vOFjg0bXapLlvagyW4I7PINjG9CBA=;
        b=nQbovwnOFKFsAxQ0ME/PFNIZ/DCu4JIw15s8zqQoJUyvOmpbPaf+1K6sTcZjegL5mY
         JKJf2pF7eh3piNCxRNVGnT+YOqV0UdaXbDHWMrwI/PM1uPsI96Es8Ai71eLds2VpLxCv
         4ba2e/uE1VWvrg7K2Bj3FkBVW5qAV69QH14k/K8vsSzQXw+Ys0QukPqa+C0ewSbZ4Gxy
         ULoUjaWTNiFdrQdFDyKskewcawMxS5QGyBv/zlnL7786TJb07QSPldClAWRdTTZh3+f8
         JmjTzLYbXWnaB48IadF+08V26UrJEF9vnnZQXSu67Trgqaf9fgBDe5JeunZ31KBo9ak6
         jwcg==
X-Forwarded-Encrypted: i=1; AHgh+RrjWUcI6BOj1rByurjl0J3Aj+BUZ25Dy00qbExhNtwwwXoB5D2m1uUvadySqf8ywbjFQScdhwFqc5E/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1OROULJTbJo6n5Syi2KuVIL7gJhvOYpGuO7TcF+1SmDJWNmts
	TkhlEtWX/0IHje+pFAJmeG6lqIg1L3o0K9KEJ+ut/j4NKKTEFZdfcBg4R8T/tA10SQQJGlkb6Xb
	3yH8AqpE5rXhlJoGYXrYZwHhLTPxEtEGfnDqwP9ZdYaoXktbAH0VlC6XEx6SCu9JxSlx0fFjxE2
	s=
X-Gm-Gg: AfdE7cnRJq5MDf85Di2g2BYtBGuO5+PnfCOsUN8RJkvPwowPuqbtzNpmrWd0BU5UvnO
	jMIc+27xjl13LGDB5BeGWebJkBp/3/qUkU2BAtFsi+VanekWbUo67k9y3moLgoznz88/dFvhnYW
	5kjm/dOVSoULFQDGpBT9VlcD8ShsRLNRuAuR9oQHrtV9cdQmX6I/wjoRmbe1xFAyrcdOiD7T1Xl
	VkUi9n028uNXdiyP2gCza3BCUzXqFgLezTB3PFlJ7hPp6GRbN1G8Nfe3630F3l7OeNTmktLZBXU
	X0odhjbiskgJDt5V7gfv+0I8zWqHZBt0/BPvYL3USgiSJHa66UtJgQYKoCsK1pMi4KJMOhCBBg2
	LjTyG+xZlfR/jH4DKJcTgAXvt+JRHa0bUtKaBdnmiMo92KZnftg/18k35OQb80JPo
X-Received: by 2002:a17:90b:57ee:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-38e4b454a20mr6958547a91.11.1784376388713;
        Sat, 18 Jul 2026 05:06:28 -0700 (PDT)
X-Received: by 2002:a17:90b:57ee:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-38e4b454a20mr6958502a91.11.1784376388316;
        Sat, 18 Jul 2026 05:06:28 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:27 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 05:06:23 -0700
Subject: [PATCH 3/5] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-b4-kalambo-crd-v1-3-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=1846;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=xSWMZUncT7XcVJn8ZycXc6L+VR1duUYDggVDyKymTus=;
 b=NacEzS+aAM67qR35I7dPmEvYyBox6vyQiFuOgnNVGkcln+sKvE6a6soa5fuozIIy2IJLwxkJl
 a+17GIkisKXCiLSPnxxYInL8KotgbrEdLv/Rw4CflVn5blJt/xVuqrX
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5b6c45 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5d9H2nC8b9pJsYxhbiMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 4qnysXKqKmZ-w4zzzUok6FJx9EFD0z2t
X-Proofpoint-ORIG-GUID: 4qnysXKqKmZ-w4zzzUok6FJx9EFD0z2t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX2QdewagDfO1M
 KC75KiPbk4V3hhhEmbipt8uN57S1psAyYHI38PhqlaY1pph+8Ubw0VtLGV5GQs5NPZUQkKkPrA5
 UwNgGRAFFuDjaEo0FcdlJGGH+p9iTVGqOrauXBYVjmEN8orqPja8tJWHRl06h8e6wVye0+9FbOG
 xhogCYuagYae+Lyd1mPQi3+2odgObiSZcZc6Rq1+VjNbZrDyKuMA6Wkvl62fMpzGx6BCqNvPPyZ
 3o/M8LWhu33xSAoiCo4yHKmPHFkP9yyVBRnDv3qK2HRJfL+G1LWV+UVTEOKWv4iGHsEoBiLxp49
 VuW3t4eyjlIqjei8WiVDC8duGflHa4watzg6bgdGyWk82YNsPUW8T56Lj122FrqVTWhwLt2rCep
 eXdFMYlN+lMAPQh2TWZmuuEhayvj8I6Q7V3jbAL+u2NlBqOpTffMwjNhF901dIKybTkxD6M7dlp
 UfwvUr/3LN6H2TXWqAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX08Hvo0e1F/RH
 Hk1mNq/8P6OXW/LlUHIi8Ywti/2YQZVVK71dA8fS6Ma2KmJnB3eYm1omdhrdyMIiw3ZCgedNtKr
 WrLGEBl5qR9MdTCpENN3PkkOCWhtG+A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180122

Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
common CRD board description and drops the PMIC nodes not present on this
design.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/kalambo-crd.dts | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..0ea4d6696aee 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
new file mode 100644
index 000000000000..b4441807f460
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "kalambo.dtsi"
+#include "glymur-crd.dtsi"
+
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kalambo CRD";
+	compatible = "qcom,kalambo-crd", "qcom,kalambo";
+};

-- 
2.34.1

