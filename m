Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86883AC0D9
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725920; cv=none; b=ZFY1fj93VEhzSkIJ6JsmvJ0B+ROC+CU4vWf6UExmnD62oClsrySJ8cgAbdJtvn1CLzjM3txQ+DxeQfW8OBOLsV/xNfWa97vxUdmlMghlP8+myyoR0BYHJONcTCRsb1zNSr5+l2Fj+D8Gf7b2ep8nceEUBg9KbNOxfVJJnU0iUjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725920; c=relaxed/simple;
	bh=2XnojtAV6Jabz+DcCTp8/qRw/weq1RG9ib4HGeGsZHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIe4VMZQWzGxNXEdqTMYNcB0qfWJjeeO7OezSTt/nrTjBVvzky8zM1GAaQqIQTxCmgbL2DO/fbAAJzuTUOPSoXo93EGKbyxn70g67pUHsT2qzwvWxqKaMpbqkIbnKTnmtY94YwHHHYLc2aPA2a81FfQT1GPZnSPgYbIGUD4EyEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVkwiW2a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrujOzFD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVkwiW2a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrujOzFD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395OLAK3712758
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X2JYhH0Sc21
	8HR/g51BpETqibfN74W5aDBvbTHVRBgY=; b=YVkwiW2aKKODH5QSHGoFZA8CTeE
	JXrKCwgUkIBrrsahzQmN2ZGlQs7ixVWpyrayH4uL/roifHluR09h1nqUEH86nRKY
	KuLxD3zPTfIM0/UBVuZx695j+t6Oe/1wSY583HTzHsJQSelaVAC9Ogf/kzWBdfZB
	u4AFkOm6oc+tzMc+1gbJmTFW8HkRuNSg9lo03xQMYrrCK+guX/j5kG7adXAc2Cis
	kL765Cw6KQrgkkX+ZpsvQQVdpaYNoFdPLrDV/XfywzHKgHQjbjuxFrrCCvXHdQeT
	30a54kh0YO6BvohaK58ImMybkiHU3cI0P/tJQFZUjZsaSmDDAf8ej5zILjg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74b8fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:11:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so669883eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725915; x=1776330715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2JYhH0Sc218HR/g51BpETqibfN74W5aDBvbTHVRBgY=;
        b=VrujOzFDWAtTi1nuBGd0eOqTraJb16lZGfk+e4y2pqVN3BhU4qFfcFE1q+iqgg1vXX
         VtvNMUbm31Og6KeXhdYaGTy9qBIUEnahSW0N/y26AKuyRfZmXBgLy+XqvAJiacg+Y+v8
         0fI8TqakGHyTh83ODPKmxjjSFFm5Adq6KziXr4IBvISwREP465BUOhJz1fSzM5SwbtWO
         z4sTYx+9dLWKaHyOS0PcjmbBFmsRr55eqYXcHAtLJKnyjJoiK1DXcu6SiDtxHCEZCSmu
         bITW7mKDU0GkBmVEIf+QFAejHvFXwsVCwMo5HCOtHqjWLTUihP5c1wcwvbcKBds+j/cR
         2PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725915; x=1776330715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X2JYhH0Sc218HR/g51BpETqibfN74W5aDBvbTHVRBgY=;
        b=J0qe/6aYU5B8VO9jJkp8YpVAcDxf/pxChDHj+W11ZtOSZvMIAf9Oz/PtsrRaEb2EBv
         Avvh09moagslm/x+hLlj72F9kOUc2VRWS2AYw9kNRTn88beIBHEXfnyu3HptOv4mkDJ7
         bsyKiNFctKfuUC/gEdcl0F9OcKrDB4zKAEHYy0m9NGsnAFu/Ovc7HpKQt0Ei0z+jAn9T
         7OeKkGTyJ2L68cFhQhO0dlHPifSEIsIcqF0f60tUpkbwBd3XAt1zAk4DGBhhoJO3LcCC
         tZ+WfHLyphP6HDomV0+Z2wV70NocupBkyJpLmJQuWPXmsnl1JPchizG03F5x8QaVG/a7
         jiJA==
X-Forwarded-Encrypted: i=1; AJvYcCVMAlq/bmhaNiszmUnC74Zz9ByfejIfQTa0G3/NTZ9v7SpepejD3m3Y11BkT8FtPThmcS4C3f44EHBK@vger.kernel.org
X-Gm-Message-State: AOJu0YxsjZkR4ytqd1RM+M8dRm0gXUG0G3VQYNz5MU2i/WfpjsXi8L6f
	MGqvL0Sr4BTjjLB/+yHLKz3BRDKm+sbakbIQCEJa4iIA9HbSrWcu1twNGn3yyZeemXg+PfzhLWY
	KfoSHkMsNs3rnY43qVv4l0Jw+5wWYnwpOp5eFKXmOyecCHeQ0Mf6NWan2H9W169dl
X-Gm-Gg: AeBDies1GQKtyX9y9IyppwCnavlUX1j5ia4hGKvas6Nn12VfUvVKX3cY3sryEq96SJg
	jh9qFOv5jGvStjmp2PqH2IA6pswkDPFTGnemjiFyxLMeglFggaB4D4PTHzr3PptNdw9PPZYkyV8
	F7H/6zC6Z0xa2YEizCqjz6o0D+pbc58ijZz+eLMUqU7jZCdD1/inUsWzsl0l5QBhRovqQty0wIH
	j21Xo4gwhLMcEVOAay1XZLSMu+m5+Yi5XRJ/AH6AJZymwoziKxawlINnHqB5RK/kxcXHGGAaBav
	q2dC9Z5rN8RayWUJl3g/e2J1DdV9hWOs0Yz2IDsNfJMrLV1nAkNE7wl0gt1fMUUucdVqKloMUjY
	KJE2/pSF5PvZT20QzTqv68W8xDYdQas4y/glbnT8ztwlK5e4F7k1b6ENJJZliuC69m1eiEeDCXo
	g3oFWMgQ==
X-Received: by 2002:a05:7301:19a9:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-2cbfbf79502mr12203133eec.18.1775725915184;
        Thu, 09 Apr 2026 02:11:55 -0700 (PDT)
X-Received: by 2002:a05:7301:19a9:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-2cbfbf79502mr12203109eec.18.1775725914605;
        Thu, 09 Apr 2026 02:11:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:11:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/8] arm64: dts: qcom: Introduce lemans-iq9.dtsi as a placeholder
Date: Thu,  9 Apr 2026 17:10:55 +0800
Message-ID: <20260409091100.474358-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d76d5b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FvohN9vnyHKddW96yrgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 8Wrn2-qyvX9ed1kARBs2KXe7NxRpYKoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX4WWkLtUU9bNP
 AFUCnWFfJCi+96fuc1qACjTJmK/GS04xfWc6+BlPKzsQR/pKMW690Rjkur+zCXolP5ADVIVjnwL
 EC1vsQBbKQTMsTWag2HoMQisGwO6LGn31PAW+Ek5kTR6Wj/gs+MZFYDiCAAvY1rCqnW/lHuvHJp
 z4KRre8JAWH+pmzgYiOsqi8tnK3HB2Dne1Pm+hVGbo7DHzHwMO+bgsxEF/hFJbxbAU9BkHxuAcK
 44MM9tm4MC6dqopL57yBCSnGcJ/rlM+RpVd26NbMaKoaE0zrqoeoKbpvARyUO+lh+ieL3O06pt/
 V3weOmAcffqm9kIhhCY6eetOCDwlJ5LGggi+gZ+LVWiFuLcDTe83WiIN2w45D/uPKNoYv8h9xxn
 QR9dJHaxTwK6mLT4ZTX+OMz/PrTpOW0FdgYfP/LJwDPTzAIb2hfTu+3w13LUW9TEm1ZwNG2RPFx
 UUjOtqTMJH6n30CLq4A==
X-Proofpoint-GUID: 8Wrn2-qyvX9ed1kARBs2KXe7NxRpYKoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090081

Lemans is a Qualcomm SoC family that includes not only SoCs IQ9 and
SA8775P where platform resources are managed by HLOS, but also SoCs like
SA8255P where resources are managed by firmware via SCMI.  The current
lemans.dtsi covers the former variant only.  Introduce lemans-iq9.dtsi
as a placeholder for now, while later changes will move IQ9/SA8775P
variant settings in there and introduce SA8255P variant support.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts      | 2 +-
 arch/arm64/boot/dts/qcom/lemans-iq9.dtsi     | 6 ++++++
 arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts    | 2 +-
 5 files changed, 10 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-iq9.dtsi

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a1ef4eba2a20..cd6fa8c4f22b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -10,7 +10,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "lemans.dtsi"
+#include "lemans-iq9.dtsi"
 #include "lemans-pmics.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi b/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
new file mode 100644
index 000000000000..80d8c75e4895
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "lemans.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi b/arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi
index 8db958d60fd1..2b74e58c47c6 100644
--- a/arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-iq9.dtsi"
 
 /delete-node/ &pil_camera_mem;
 /delete-node/ &pil_adsp_mem;
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 7fc2de0d3d5e..e50da0da9c71 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-iq9.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
index b0c5fdde56ae..eec68ab572a2 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-iq9.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
-- 
2.43.0

