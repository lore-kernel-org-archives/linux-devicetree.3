Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE2848BD56
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865868; cv=none; b=Loz/g8AoiXNoKnz3ydLI/hfsMMQq3aqjxBcpbpoF4UDnnUVJU6A4Dp2oWkfA8tuG2yeCfPeDF7tN49dgoKmBLRpJKVzRQ7NT1/h5ntxUmlZVJv/1HVwkc+L0sLZ4g8I3xDXgvYvIn782Cq7c5RHAwhz01djzhuyWxeqM4uCpg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865868; c=relaxed/simple;
	bh=B3TLsDqArP03LQKcA8ngy2MaXdpHgeOMi+R6ynsdPHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gzmuCxci3xMIdFWYvrTwNKktPftr2WdgzBXl9HrX1z78LA69Oi3/PYG0kvHDrZmeHXEt9gq/4MJEPbWheWiNK68Cni0IQIti/RTbGEflSDr5vHo1ymt8lnJA24xufOU2LJMkI6XmEbVdB/MTOuJiqvpnmb/ByDac0EFyyJ3PRfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtZro+Pp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=habErOrY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MtZro+Pp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="habErOrY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H3cv4404785
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 17:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=MtZro+PpmfRPxLfO
	TZQXNmFeTsF5cAnr3iwhnaLiFQNPciKWQRCWB6jTh0OGF4p0l3T/iaBE3pqcueMp
	f63KZ8vtN9c4Xi/Dm9fm+sbXX0bkkMSPp9FqzAZvtJpMoS1rIG+H/fUIqxy9ajWB
	OBXOEw6xK2TAguWvusbjyGhIXuz21jblHHtyJ8XyPotdhvTSavkTzSN0FPlA9wRM
	T3tOmYjUjsLi/P05CHzIfFLBkNlHld54MtljCxpc8nMmdu+MWXp7DiA6/zyJ9l7y
	jRGYT25mWjiT7L4phTC2XgGjRsshtPL3K9iPAidy3KXY3jdvhYWh80xSmbsy3wq3
	3pL/1w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56g7dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 17:51:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca3673560so2153455ad.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865860; x=1786470660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=habErOrYe6dXKYYolOHW2KRa3EbHG6xsZHvRaWwerW2fyiqWf+Dwo6eJXynmyzzY/I
         Lk65HSrk2f0kxyOIMI4V6P1HQIQww4ybETHKOqld/SIPSBbDIMNiRce76aBvQNJGRn3u
         FFb4c8NUGMX2amy/lnx1/5JFjPQc2z3kDFBdXNqNS/tmJdAW6X2KQvifggGoJmna5y8m
         axadePPY+fZQlRLrKyuVsx22WVYbxlIyR4zIogz52eVxA1StPoCN/zlhaJDwL4LkuMtN
         Tmn5w0dO7wrI0l1W5VV9Dlg3x1M6svoCUX37LjO4OyBr+PJwv6Qu9JCz7/AccXai/F5u
         qY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865860; x=1786470660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=a5qHgU3nP3WBawiQw/TQBELvT/1JQ1eYfC1riHs9WGsqMBiojJKOieQ9Uubm97pk3N
         dUuRyG+M/sinyefqBC77rWNS2dkyN3u3u9Emt5nvYmaJhsl7i2gnvCUItHZCfWba7Nbh
         vnhN4jB8Addv0Pxb6RvhtceaPo1IY0Px5RtNxaipdsUAx656gqjX//ifL2VW4/vu/+XM
         FJMLaSWos3GzJfTbNElVvbfQ4z5FrCFLcGqsFfth++LhkQEzGh+72kZH2cMwqcZX2COc
         a1wXp9icACOIqrmMZeqOHojd+RNINc6uD5MaN+CI7iZ26eNR4CzzOT2W6lkygldjuIgo
         5mzg==
X-Forwarded-Encrypted: i=1; AHgh+RqMUwxSwKcvvUxkQ4XfcoztyKY2xJ9HCemvCQGEbmeKmAsxKcSReWv+Tt41Y0l9NiC3+TpPje+JraNV@vger.kernel.org
X-Gm-Message-State: AOJu0YyB84wqLZfIDaMOKrzKS39cFr5KMu0RlMYpi2MCThVnA/HKiNDG
	TSIDyYUbIh1yREpXREa5D5twR9n98K21sFhgIE5aV8lDKkSuQTJZ//nFR5xkc/cbdOX5su+kWDY
	zgPuZiFKUyO/jyLN41Y3X2mD+bRYzxthW8l2Pf8fTUKrDCRXcXziAxszw0WSplolL
X-Gm-Gg: AR+sD1342KVIMLHFlBkquPzf0C4ImDHLtkaheN54kKtnfniTN5uhTyOYsQeo8Bkzy4o
	rqfovuXJ4sLQj3w9h0M8KCVzTLCFgs93COh/7W2LvmSr22qj79QkR5hmWInwVTr0PJI8smrTOcX
	EchwN0k6/mTyctKHKrlA4PQ7dE838lF6UICQSRv/L9f8KPq9cA/I+mlzDfDiwjUx5UB3SU6MMFk
	yN2WuaN+WD9+v+HOBabRVBxQz+gz4MUlkR0X2to5ipZ3kcje3yGogylmzscFz/mvmMmyESjOwfI
	s7hfMd3UnniI0WCyuDaxSwj7sMtVDnu93cXWFVMJMKVv6kSfB7nG4+k/P3WgO3XTR7tUpAtsvaw
	Lrp4UHndBlWg7rpk3qQTpg8Dd
X-Received: by 2002:a17:903:26cb:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2d0ca9620cbmr5665745ad.24.1785865860184;
        Tue, 04 Aug 2026 10:51:00 -0700 (PDT)
X-Received: by 2002:a17:903:26cb:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2d0ca9620cbmr5665185ad.24.1785865859768;
        Tue, 04 Aug 2026 10:50:59 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:17 +0530
Subject: [PATCH v9 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-4-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: ogmWYgJpsD6Ibztdx_KlrxHJNO37FcxI
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a722684 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX+vELb3xt86EK
 xMH+IwSzsvZANuJ96bpV4vjgumsypk/pMXKKWlvZ0rnQgt1jJG0fkJCBxYRRkRYHWtSRB2hys8E
 TKarKAcGgsT6WxJ0VjHUQ1Ws1dTkS2I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX3GzV026UxrDA
 5WzfNEBExWcvirEnaNsKFofieVM/kjxxFbJ1SvzG1CAJCWAaf7JVArdv8DSxaBJL5pUxwFlUUFZ
 Lsy/hNwN3Jp1yJkqbEiCnAVe0qPGoKZ/ulrKOWWUKg/c3DLArX3bSX+rFCbCaOl/aFFbP1mM+9L
 uuChF9ELaFHdAjQBzfFR9uqPBJf6trOpY625EwlwjSlTsiw/FIBu0bW/RCKbzLsvuNR0WkyJOqg
 U0VjG20qH+PG77bizPdNeRlJJdx4nQTqPEoJk6dftKT4w/AofnFBhQVb/pvSKS2gtf8gAHSWLoN
 8m2uvRB/a9DZSJNok3DM0UenrMppBsJ8LJRSy+/YI5ZUP/kiNliMrSEwhNfB1NElndKAmcsK9zP
 At4Tf8OLpDVTFDX/Ih8ioI0p7H51PPyzJSFAyHugZsxEMlVURpWEMl6oLow+29NAi48UQ0WAxR6
 AOnMRmN5GH5/+FwbFgw==
X-Proofpoint-GUID: ogmWYgJpsD6Ibztdx_KlrxHJNO37FcxI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 4d8d109cd304ef0f5afc5c3fc7961a6156003d4b..08898f1d74e4ef0a3921eb7cc5f13d14bd02975b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -41,6 +46,7 @@ required:
   - clocks
   - power-domains
   - required-opps
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1

