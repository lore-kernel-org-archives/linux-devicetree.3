Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E141F3C3C02
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080922; cv=none; b=XO7JD7oHhTu44PaU9IJPMGBhD1EE95UYS7hqwOEVf3ObJjcdPXkWr8A4fP31U7JDuNlgZDvrTpXlzrZTutV1A3HN2BqNMut7TOkRO9CjgH7VsNZd0Q4CQ7S4b6wf/T7IZkiMUyoJm4/Alfm3JPmuXxY9PANrlLpU6SXcoe7QZRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080922; c=relaxed/simple;
	bh=X1wjjd26sl0ymy8rlRcdia8IuyUNa2lgwSQjUBF8VxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rKAWobiHT4JkgSVt/i4DCDXkk9xcrJ8sff5NotVACerPCkSI757HpAHPGq8zxSojRqVRjq891lb9pjynNfQTbImPTg5mpXUXgtYV97Qm08j/ALV3Wn+zMojLWStK4ylGoqerD6DQ3tJHi1M0zaQzAjngVaovibmeWCu0s3ZqJO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuzFGIhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwsG1Dr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuzFGIhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwsG1Dr4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D78DUX1780542
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yyZ2p1/F48a
	Sx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=; b=WuzFGIhAgzaQlgokjgvr4HeW3hq
	0zU3VzyqW2np2uYo5AwNqLgMt7IHH5JtD95YMfL2iakAPbFa3bimFcSzDqH+rqqO
	EtThchMorTdG/vjPwbABoo4O+zI1+FXJoWxGHwysuBFXAVUuxwevIdPp23EafoUK
	pPtC4WHVL+n4ynJArp37YQxyz1a+tyzvrOgDC+ev6gLVmhUQPhgFDX8GzROiXmn/
	e0GKeoAtdtbWrjNfswk+OIjxZ3cc/ZMYUyIH+/pvjvfuMUERrcZbz2yLoAONEIeC
	Mhc/g74EW6kvnviR8t9MXhC9P4eXehnML9vZk6ZuptpkyxPxIJUHYUdnpNw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jw2pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:48:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fb22422efso374902a91.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 04:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776080919; x=1776685719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyZ2p1/F48aSx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=;
        b=SwsG1Dr42WPeH9//9MOgE2mYrsP7k6InLfq6/qKGxhIJLW5ZdQSsVsM9cZdbV/B6AH
         kA2rdEb1kZ8kjRpDynd9yTLMBjCM2nw6tlaFXoXVI7V2543bgbGfO7A9YoR9bZQiBn5X
         qgOADaOff+wFGBR9ilxo5mDP02q6+lDq6pI2P4zeB5XiXfPirSDTNyzzh5so8t99s4R6
         e/jTa7XV8rOV30DO70nC0YGvHdCT8bBqnI+CuybNQ6VRALyJP6VKUvQdWTui7riFHD8Y
         KaZuh7vwQkXzF/r8Llp8Mmjh5wsAwQZoc773ko14Ziv+wCGproj+cJFvc91TWRqIM9oT
         qqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080919; x=1776685719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yyZ2p1/F48aSx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=;
        b=DMDfZs9fIA42F+ybRhyct8nndM0sp7IiPxPX9lHURPW3243i9WchEBLUd913bnW9Fx
         NXRrpf6yT97wj+7mu6WGfJcJghP8n2kFW8qWG6UwIohSxKsjXifbFe/ExeG5C0h+P+6L
         n47CE96Pk6eV/3LJASdELGlEFOKg0euTB3TE2eEp8Bk45ZkXkS4WcdTkz5N+iBi5VCqm
         G8VDqvW/aA+fbF0Y22je17UA3b5kX2YbdYIxIFvwD7dssX1krb7xOcIu4zkr7Z+As0Iu
         IkC//zD6YBNe57XeNFWpK6lB0nS01CQeRQU6dyxYl7VfSR/GySsa1LmPED0XKaBic2lz
         hMSw==
X-Forwarded-Encrypted: i=1; AFNElJ+puKwr3XGOrdmUbqqztIBXan8jU4VhYwknBqiRHs9M5TnGF8TeWiy8M9l9LPlsr0yINevNpAVntZd0@vger.kernel.org
X-Gm-Message-State: AOJu0YxprwTMGQaTf3xJdFgly9Bu4GjsUetCrq4FLfAE/R+HI5aSNXEA
	cjiLmneXu2ZovUq381Gx86zZqXzj/F+YtFHMfZsw5Ufq02q59RpKrYTiwN6D1bmlZZygaJR5yIF
	mIyzSQ1ZSP6MSgROgJ5JV6C/AUxwYvC+eAp53ALi3mV5Q/v/OOyb6RuLmvFmy0l+9
X-Gm-Gg: AeBDieu3FCir1GfDjkI5IY0qKE+2HRdzx8as5gjzoFxUvlBOR8OYJY8p1HMjYgfedUM
	U0DBpXSGZvJkVFvDeb57A6rvIBjr/gGL52cWoXSvFtPboAIVOcNGMx9yiPG8NE9VCCS42yNJB5u
	7UFb2NoBYPno2OA+2uQmBwrOz7qMIeBwpJLaRaZBBGHcVdzTKuO3cxDz/7yleahbj2ChS/d1j/X
	rQFepcJ35eV5R/QLppdD95HKAzyshKzlrY/kQ18l7GxpXANjhNiKNKjvQ23I4KnwWq295p6Dn6b
	M7UksgTkZIVtdED/RGV6CzLgYg2657Xex6cz796FcEi2UVfNf2QPKlq0T+X/MA+4eNu6SoWFpwW
	6C9kL7G1QehpttplZrtDZJmNtpUIvf1Z6Pr99aE7vnVIuQjQIW/Vl
X-Received: by 2002:a05:6a21:2983:b0:398:a440:e3a8 with SMTP id adf61e73a8af0-39fe3793d8emr8019065637.0.1776080918872;
        Mon, 13 Apr 2026 04:48:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:2983:b0:398:a440:e3a8 with SMTP id adf61e73a8af0-39fe3793d8emr8019043637.0.1776080918447;
        Mon, 13 Apr 2026 04:48:38 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a12adasm9822453a12.26.2026.04.13.04.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:48:37 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: monaco: Add monaco-ac EVK board
Date: Mon, 13 Apr 2026 17:18:19 +0530
Message-Id: <20260413114819.3894307-4-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413114819.3894307-1-umang.chheda@oss.qualcomm.com>
References: <20260413114819.3894307-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExNiBTYWx0ZWRfXzt/C/Dvb/pB2
 AQnNMjyCxRtJEukeyS8hi/ZcTSP10iVS6hHsre+bPrGAIBZnzRDakw4Q+hNCpryb8FMM31ycQX/
 nsZlMOGhhdFhdZ19L2kr87nv2l35Ln+lxnq4Yo6qc/5SrUaijuiZwYhwVs/HMUET1mO2B5Zetzv
 ndB22GvWvdYPF50mjT6IEcL7Om29DQO2IFww9LG54azQSvp6m+FF8vHC7RmtwlkVgGS8u2oVJMF
 LVq3KAh8YamN9tDm4CgAS5pk5mGed1F2Sk/GcV5ewPf0UK/BojRAPi/axM5tpM1WZ9uu0zhWC37
 aBVf2gQzLj2BPPJkGW1SekX4CrfdSrSyZ/pHmoPcDXFw4KD5q4ePygNLubSlSaeM5Mn5WdcQTix
 jni3OhYDLtngMPl8gL5jWok4Qefr+GMtkLKMXzZRoAYqGJcXyYRIuqmceMWspNPSgjua+cSahRW
 5bgu3+aIqfcpdtSfIHg==
X-Proofpoint-ORIG-GUID: 27RLVq6MxoptAAJmAKqB-ljA-rupIkxK
X-Proofpoint-GUID: 27RLVq6MxoptAAJmAKqB-ljA-rupIkxK
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcd817 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=O7TEEOfKfJVoiFKcZRIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130116

Add initial device tree support for monaco-ac EVK board, based
on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.

Compared to the existing monaco-evk board, which is based on the
QCS8300-AA SKU and uses a four-PMIC power delivery network
(2x PM8650AU, Maxim MAX20018, TI TPS6594) to support higher power
requirements, the monaco-ac EVK uses QCS8300-AC SKU
(with 20 TOPS NPU capability) and a simplified two-PMIC power
delivery network (2x PM8650AU).

Apart from the SoC SKU and PDN differences, the board layout and
peripherals are equivalent to the monaco-evk design and are reused
accordingly.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |  1 +
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..852d2b86407b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -57,6 +57,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb

 monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
new file mode 100644
index 000000000000..6405d1e1939b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "monaco-evk-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Monaco-ac EVK";
+	compatible = "qcom,monaco-ac-evk", "qcom,qcs8300";
+};
+
+&apps_rsc {
+	regulators-0 {
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9a: smps9 {
+			regulator-name = "vreg_s9a";
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
--
2.34.1

