Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A80E3DCDAD
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309527; cv=none; b=n+KNinnPwhrtIx0IDZFxosKwgnxKWUuGV0YAtucGC6sql5Bbr1Eou51K+2OVBhvzyUfFk+btuWkspNM4UiGvmEv1Oe7WitUYhdefWjZwomn3dU2O81V+WFboaShGmw/TzD8dawFBfIXooG//aRWpMps2x22rLAXQ2QILFnE3G+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309527; c=relaxed/simple;
	bh=X1wjjd26sl0ymy8rlRcdia8IuyUNa2lgwSQjUBF8VxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=leymJr2mLsoMbc4OOnCZNnZb4uZOwkoiRuIQsC2vhrRObUxjii1YYgIclwWhNN7LpSQdhwY4H3hNbaPmMg7qwfk30qPBKlXLuqWx45uUXBYViGxwByxdrYQMoOEwlZ+h8JM7dgBcnm27qTlgLsHo85iIUS4/Bu/o0lu5rSvLR/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSHlD92f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUx5mHxi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSHlD92f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUx5mHxi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDqZ5v665837
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yyZ2p1/F48a
	Sx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=; b=QSHlD92fwVP9/bjwMJEWnPgKcMN
	TeCZ6WcLktUAaHR60Z3nuqOj81KtMTW56IKhS2PdD58hndzvM3SsGWtx4gFKQmNJ
	ugqR93mdn7MeZKekD0Jqt26U3y6Yh7rYJ8YOVgujvekvXFEGf+jX7xO5PQXtei50
	MB9Z97OwGEXPmjkcP8aCYBUs6VB2SJqeBi3UaayyrDzBRO0lgiBbTKxpVpiKAq08
	QCF9JsLdfKXHgUNuHUFRzZjLW/8NAMyqq6Q+UvX8Ioj5+AY6b0CGQqTq0dHgw4QU
	8mGl0H/9fSGRpSCbxGvjtgMys+XW7i+tOr7xUOIwMBiI+R3TodwTedCKQ8w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n2dxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35679eb61b5so2481854a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777309524; x=1777914324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyZ2p1/F48aSx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=;
        b=MUx5mHxiCWEAnolkse36XT7T+aqUEP6dUbW3CfC2nJ+HbL9iav8TQAF3VO8zufQfOC
         bWUu3SsDu423FgVRxapFZ7/SFbJhQpkOd2Boi3aDqvU619EAEt7VgNbTp6lWiwcRcA85
         4iUSpkLTdOQV1S5+7/4YHZ9M6IrUiMRjHPRwIeflO5Gce7HKWrz9Tkadx91Ufom0i/4s
         n5eu19Al95DRLht1C8pnqB3xKm9dc21eZ/jYx+JBzpEUJlbCKfy8jx9FNk07EEov8xSm
         JC9XtlLrUTdpaACKQyYpZDQwXNcv5xGiQfP8iiuhc5OFQ4tVxTX5KIORHY/2aXCzb/Mh
         +Y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309524; x=1777914324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yyZ2p1/F48aSx8O8EfnBTKP06yzbt8nwgrksGcLZ7KU=;
        b=tYWYPYxri/ff/xtqiFpcr2yFswB6KOPWFkvpQPgckQLL0cntg83KIDzyEgTetrkWlK
         NJb4uXuJwQrmLJTgd+NJqkzgwQ+1ML1A31s0FmyqO5XIACH4XZFIu7naYNVsWzs+nXw4
         MA/crRdNWMyCvxeTYDPfPZe2w4flIuIMYwXMeHclt3s1gjS1R0ge+/CQO3ErYARNdBLV
         Wfcd2vWZp55ttgB6/EVSwNyiYWP8jFd6Do0xFktdUHnkFGMQ/cNjUNb0oXy4YbOTDljz
         5HkA0xNO689hd4z6PhCO9QoZ791pr/fSBpezoIuQVSC1QL1xnIBbjpHHJlj25veRq64I
         Zp8w==
X-Forwarded-Encrypted: i=1; AFNElJ9WPH9CshTVJ9kvKtZBKz0NryXpcgY8TW9PyOTPpNaC6ZfoajQzlbDLGgLX0R4AKHpTgEmewRuxGwj+@vger.kernel.org
X-Gm-Message-State: AOJu0YwXDIZw11tetXzsQvYRO+pDbeLzXqv8F9Dmj9PkSPgKKlnb3zXC
	5xzX+yLTMdqp4qeOq/LrxSONVjXwqWw64atC0GwHry1nBy5scu9wLgGgmf56Z3xe7uhB4mMC72L
	us1gahzpTVwBH6q6oQzjkJRtIBMt/a7N49GBW6yE9NZ9jp0bkyzPmRa6jIz32wXbc
X-Gm-Gg: AeBDievdqm7sZVtmqM1I8bzxIdG3NVXVyth9PBin2lCr9zonxiUtjcAB0Q3FYdF1KJs
	s5rW3ifvmAxf4FWyoEmhObeXlWgueaO7fR79y53PvxCFBMDvFqcG+cY/nQskFF4m0xA3wloyyx2
	W66Wwj0ZPa0pFslqjyB5J5RJCp8qmfwIfE+GPlTC2JxusmpgK5Un2yuKjORcWDFffdg4lbNBj8F
	z15PPInkyOLkNKf6k8pmnbP/snLKcUkeNSBi/f5R7AIC+CKSgz4Kc/eMSCSms6ZmKK/ZSb2PG2u
	3PBcm8bTud90kgMrJxS1oY50UVeFTPM8mKPiS87G/ZVJDmrAU/rQ6qpCIt0nmVVPeCP2e8aqZ2N
	IbPzf9eBh8egYMlQ6XE7yVWWntfAoEE9+A/HenqruMAov7opDTCvhDGDkfR5eHVE=
X-Received: by 2002:a17:90b:3d0e:b0:35f:baad:99c5 with SMTP id 98e67ed59e1d1-36140373c6bmr24450702a91.2.1777309523418;
        Mon, 27 Apr 2026 10:05:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3d0e:b0:35f:baad:99c5 with SMTP id 98e67ed59e1d1-36140373c6bmr24450670a91.2.1777309522575;
        Mon, 27 Apr 2026 10:05:22 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490025d98sm99313a91.4.2026.04.27.10.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:05:22 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH v4 3/4] arm64: dts: qcom: monaco: Add monaco-ac EVK board
Date: Mon, 27 Apr 2026 22:35:04 +0530
Message-Id: <20260427170505.1494703-4-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4MSBTYWx0ZWRfXzEcq3I2LKo+e
 1nEPmpFVHRDP6sg+SdMq1X2CEjg92633zfKIU/zbQnDRmpLa1dTt6zVfZpVJEqp8jPxPlJwYB+4
 VQLeieY26WdM5nf8oHLfLoZSQ0G+IU1HqMmM0F/exKtZByoc+ASMtCnJhItpCGdGi1lkwgv/7L3
 UAuRIVQiGnNq5/w7eWphziaI95OS1Q1lWtsC0j38R/W5ZUbTY+OOEYDPjeA10X9ozsNn0Ymrj8X
 w/GLcBYCtITrX3KUgrsEV+2g7wQzOMqUXdFmQqgHtXkMj4FmibKzZg3lnFVRzextXX3S07hyGy8
 JNdJwOjh0VlEGt5xN+NyZxux2yka3WBVKuKw2/KShEWVAbtSf9/OaqeMZP1pHqMW1mPv5FFJ9UZ
 Omcxs5upnHRtU/ruOEcLAI3n+tOFOQ1smX04ffT8SiU+DhiFf8HPTjeyX+uJV8/cFOjk4tf1cyJ
 b0uTpN2ETmH9Esjq3xg==
X-Proofpoint-GUID: vf6PF1Ly_mrA_IjQmFP7qCGJ64nrPBKd
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef9754 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=O7TEEOfKfJVoiFKcZRIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: vf6PF1Ly_mrA_IjQmFP7qCGJ64nrPBKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270181

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

