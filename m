Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7F41D212
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887838; cv=none; b=MOLz5SPFcUDrWrWx4f6s03EEIXBpQQtu1KBzxueLqsPTBAra8i14fA2wGJO2ybvaSxnUoxtG0SI5DtB+XugNi4W8D1tRf3PYHG5B8BlSR3Ojnz8GfGFhSroFpyFu0F5+FapjlEMSgy14tO4jLMs6b4+9jRv5KtvBMVaO4WzgoUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887838; c=relaxed/simple;
	bh=ddVTMkhYQhjB6ZCGQhNmC7udHsSIhRwzbp49Q5QEPpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dzld4XgxqdyS6piyJESk54r60QVmIF2EHMbuf5oe0HfqMW5tJtFKhvdHTryDrml3bXgHUva23ZgTw7GT/8ZgERvNuM+dUXsWvwOhMGKmToTyRtG4dQF14z8/01o66Sc8hk1AP2GyjaIqL1Bxw3EzUPKZEkuwKRCkki5kYI9gUYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtpvpQ5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USFAhGUb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtpvpQ5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USFAhGUb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lphQ1869894
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=; b=NtpvpQ5DKV2j/Rz0
	msAW+2hppdQOJuqzZxXLB1q/FVbu5Z5JWwABeMGb6MaUqn47r23YUpmNoZrPPQD+
	gwfZVdRhnppBTCAUCMVxC5Vc38mSsP8rRNkctDgp4UY3uyGhRvCAOlr0OBksQpyN
	urqXf4nmt1Rk3yHfSXn83Bo8sy/8nlJADYqc5KSGWBQLi/MRStHERqr4xy2qVtyP
	3RqyxQw5EpeakYxnJrMWR7/89jUJsdl2gnMLq5FOD6A/TAnoUhfU6uRM2Y4bcsys
	2JEDrqzHC/U+nNb4ndG5+QgX1O7kFtG13tBHeqjv9xBIfr/taxsIudq2cCbYzF8I
	bXLG6A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw98te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso3809685ad.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887835; x=1785492635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=;
        b=USFAhGUboGV7AZ1gpkz+EDgvg+ODy5lqLn/uFG0+xbK7A38ZyvsWtvMofpzcGYkPLQ
         Li5nwBlm6HLumkhZK4AM1taL3wOx/Nl4tsqALEEwY3gWHJ5OSMrURdTF6XtxW3p25eZW
         suU1RrghQE5ksxc2qXMUe5I2C5XOoThyrqXnm1ukqIIVxlKm2+mAeACr07Dz7LVgIEgc
         uNDOMlCisudc4QJLX41qLmjwDIl+KXTz1arlSxtgRiJSXftj5NKwcGw/vrdLUMih27fi
         aMbKe+06HoCXTWRzVhGg653ucizlbNLbj9T1SzlBYMuePzvrU2vtL9pRaGUGWVVpEw/u
         hSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887835; x=1785492635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=;
        b=Fe8UYec3R3ADS20C/RSBbEHg3bAeYJIDENp5UTC4CZQQJHj3MnqslVvGSjinEYnQ/Q
         q8SXevf081tAOOHx/W6/xT6EFLv0qRFoDZdGSfEVbbmIEYdsP4twjiqClNLkVwUR4Vw8
         SS19tX65JWGe1EeL5lvulvmstftCO9oAFW5Cb5HIMgKVFXydB15trQVGiLutiEm/GCh/
         5MitHqRBnVl/Zjb9QleUpcYckuH1dh+FHUCTR6GlVwqAJ2efMSoz7EHwU/Hun7MXgyO/
         AwYsBXSpJ7G+gcCNGVPiqF2YetsZsefaOVlpMIBWEWobA0EeL4aq6YEiyykq03cqx3Nm
         9KWA==
X-Forwarded-Encrypted: i=1; AHgh+RpSOrNBdHHzOzXqKVfXqXft5FBdqtZGHglpjA7zLS+BxybkqxWWmidIPb/+EqW6m53JYiF/QsuHezy6@vger.kernel.org
X-Gm-Message-State: AOJu0YxtmuPUfgDswwcoUkCmzL1/+qDixUOnH9r+UXA5+OcrolC5B4Kj
	ZPlFoBuAppjmA2T0X8WTGQTW91cvMSVeXdxVd9/Ehwb56touSg95fo1ty9fqdMQ3CpwBdWTfgVz
	fg+yvam16hnypz7FcijWW8NVZQTfA2gN6IqBo8TnafEnd8Bqn+I4eIhDG5v/GedyL
X-Gm-Gg: AR+sD11HIdigOlDsNAHBkHPp3X37Wq5wHr8xkvppKHo83he4XM8FZO+yOVRdTIyWNwI
	CH9xTUkpNjX87PWPd9sVLu4bTWXx+/DQ8t4ngsjR+XCISz0XaWX61OEIPptYxFOUGF0hOZgE9Fv
	JR1XYy+I+ckw57U7EswC3w0STykIZjJXqLip30wzkkt+WmkOH2smcxTir+PUJQ1c2J1UUXb+UVG
	xty7k7Y0qxN8kaOWsHqDaLprrf5veY+sfs9GwpwyKmvQZI6m4ccb7yoihlhQbgbp+B7rBoSmKfX
	oqCVAsiBN1dkt6FBM4LSRv/9macicucMxs4t5LJjUvyutPjFvOBoCyspKHGsG/cNUsT7Dk6Jont
	QCSylT0PW2PUQAYPIfN6cd8tq
X-Received: by 2002:a17:903:2282:b0:2c9:c083:cd50 with SMTP id d9443c01a7336-2cfa6b799eamr80891215ad.17.1784887834557;
        Fri, 24 Jul 2026 03:10:34 -0700 (PDT)
X-Received: by 2002:a17:903:2282:b0:2c9:c083:cd50 with SMTP id d9443c01a7336-2cfa6b799eamr80890965ad.17.1784887834104;
        Fri, 24 Jul 2026 03:10:34 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:33 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:40:11 +0530
Subject: [PATCH v3 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-maili_initial_clock-v3-3-45b577241c91@oss.qualcomm.com>
References: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
In-Reply-To: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX/AVejxCdecY0
 zceMqoddEITCTaR6SlOrh7+dAdz4P4/7HD0Sd/1XCalh5I/abAh6RBRiLU+6Wf7BZXHdbEV4xDM
 9T4yw989mKkhacOciejuVe473rbquGqVHJegY3CPGnFx4cYf2N5gKfIsKVpyc9m4V4oEUrhqibI
 J+n2CngqffYYvV82Dd7BI/CxsvjsPl+cox1T41aJebqqzvwd3jIBWCtM41wW1SCUBp9zTEfAjcI
 5YhTLdWym6BEMTABW4aon0BiIQgLFJKypl7H8UE0ShZLbRoibAwU5NwOY0IZFuKGM180Ws+oOeV
 cpraU1fo1FqnjgIonpQPrHh3FUHVdSF0Hr92wSAMqxACNqJDPdiAfdU776QdqiF2isUE9CMtdF1
 uFJWkBllkpHrUR5288ns/COKAla8todOs9QRtj47i7G7jFfbzJb19ETLZ/UyEicc2or76p0GChS
 dyUL5/V8Ng3o6nNqoLQ==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a633a1b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4s9NPNi6RWkeKLmGOYIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GgPkfoQRulYCO_nwM4iyS5t163hHZNRv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX63Oax2cI4wXm
 +xu+zC9vToaOtuLwO5eeWzQA5dzVxDiFXj2j22ncEyDDZLkyTW4J9QL2eFlI/8Foi2UwWx0mWao
 x/dvQBzLElxNDTF1EqTZTF9dcW2RKew=
X-Proofpoint-GUID: GgPkfoQRulYCO_nwM4iyS5t163hHZNRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092

Add device tree bindings for the global clock controller (GCC) on
the Qualcomm Maili SoC by extending the existing Qualcomm Hawi GCC
bindings, since the Maili GCC is identical to the Hawi GCC apart
from a few additional clocks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml    | 11 ++++++++---
 include/dt-bindings/clock/qcom,maili-gcc.h          | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
index 4f428c0f7286e83683a65cbe60b2cfeff67f5b8b..2101f4e4bb0d37f5cff42290f88c2f816038c402 100644
--- a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Global Clock & Reset Controller on Hawi
 
 maintainers:
   - Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on Hawi.
+  domains on Hawi and Maili.
 
-  See also: include/dt-bindings/clock/qcom,hawi-gcc.h
+  See also:
+    include/dt-bindings/clock/qcom,hawi-gcc.h
+    include/dt-bindings/clock/qcom,maili-gcc.h
 
 properties:
   compatible:
-    const: qcom,hawi-gcc
+    enum:
+      - qcom,hawi-gcc
+      - qcom,maili-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,maili-gcc.h b/include/dt-bindings/clock/qcom,maili-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9bea90adb988ed9050ec30550d8723ede01ff6d6
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-gcc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+
+#include "qcom,hawi-gcc.h"
+
+/* Maili has below additional clocks on top of Hawi */
+#define GCC_QUPV3_WRAP5_CORE_2X_CLK				188
+#define GCC_QUPV3_WRAP5_CORE_CLK				189
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK				190
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC			191
+#define GCC_QUPV3_WRAP5_S0_CLK					192
+#define GCC_QUPV3_WRAP5_S0_CLK_SRC				193
+#define GCC_QUPV3_WRAP_5_M_AHB_CLK				194
+#define GCC_QUPV3_WRAP_5_S_AHB_CLK				195
+
+#endif

-- 
2.34.1

