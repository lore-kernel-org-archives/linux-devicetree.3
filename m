Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40300442FA4
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012493; cv=none; b=MtFIZrhYTNlh64YNsYjLtpRCVRJODfXnzMt9yHLYDhuWR/noArcZxg50jF5VHGTJQ0V5PycZfBkONwS9FX0vs5qi3lXus1e1OXpjhI/aHQonE+pumErN8IiaqqW/3UPpXM3e9sTCPzd8ORWM1nCsbGjTU/FIL1M0vrgYUo5/Aa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012493; c=relaxed/simple;
	bh=B3TLsDqArP03LQKcA8ngy2MaXdpHgeOMi+R6ynsdPHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ufbp4yHkQQusOsj6L8LDTtX/0XYkUakGkTuFaF+6Tk5na7gD5RPB2quZD9h2pEB1KLgawBUK0P50D30wAsZkLorDbJBlypWy6TUJbK9G3fKXjtJE/juLBYueky7IMHxKgveNFwrYyynjE6EuJXtheFKF1UcAft1Mr9jVZOicx9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opfB9VB6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKg05EVU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opfB9VB6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKg05EVU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nkDJ1228244
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=opfB9VB6J1PlzVIZ
	IUQKuvvi5AxwFQLVkm1b4DrCpCFtDHy8a6Bz/FpVhdC0KdtLOYzWeUwp/1foI8IM
	llC4B6oAgYZsI37ElWGhRko11TNKjxhMqR6Cra/+lv62aFQUWwmt/Zdxz8dUcmDG
	tWRSo1jkxOjULNBr0TRrOPUIC7c2vlkAgoUVu61C8fXGL2aTbbQMnUr82DCTG8+p
	HvDvALFRL9wmfmv30Wo1NpH1mzxRWvQBoEgQwWGb6EHofaXmxr3nQ8fBqU0wv9Nx
	ddmTZWvfTQ7Fs2Mnsv3QKEIjYxV6+cgKCq76ngHqndzF2sDrTaV+Xxcc9QpYpRg9
	W+/iZw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqdugax2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:34:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1102201b3a.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012491; x=1786617291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=JKg05EVUxzHSNop8ueEOGWxLTd/RDjYjEKxscO+TVpXbJVeFQl3OkaFfJSv+6N8xJr
         5tnCvD4am8bUZrftPW8DMD2F0C/RRI0Nuzijxlq0pTyFemTRbBruMzHi4rZnQWgc1rfJ
         N6Nqw4Wmi70PTkk9gByuKMyWkGfyySg/1gJ5efb9iNRfQ6hNFrRxWVXeYoIcUSZcpni+
         w/L5vsFFn42d1iTg59FZP+NB1XoeP2ui32ugfBKYViuPwlVvVma0fvW622VP3xec8JcO
         2+worBumq8fhqoOuHP7y78z1+DSh1acUoZ6wgAbKsNtlNkhgiGvPSPJOXxDkxJB41way
         T/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012491; x=1786617291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=QuiBt2BtB4FADE/KlqF7cKYMV5kSlH9rS5sQo4LdBaU/igNjFK8G0kPb6mAS/Fxp+k
         gFegBnpiTnSLwXZIoTCZpKx37McqKaGuYxNi7uaJR45dbxQETqTKsVuXturenIZDQko6
         st+rGyb9ytNyPuuIRhl6rJOdDvZBWTF0AEkETaY0D2EUxaLOfSMd086x0eCLItUpqqUc
         y4qizLL04TI90ZMwuBHKlq9ffy49ZOl9ejz//JBjyTYp2M2SHgG9tvls/uGr6Z4lnhs2
         3BgAbdf+eRVHl/RVcQ9FYap4QdV+SK59dD9nLcXdikkA90OEstIFdQYvHsq1GOtDLHz2
         3vYA==
X-Forwarded-Encrypted: i=1; AHgh+Ron8dCowZcPUVIvRjaJzdjXDcOX6WJEVZgXH9Xtjn2cK9WF4LJelvQ1BNd2pjT50Zp9Q5CGuB7xeZgZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxxfJW+Td9akfohCovf4Qi5jSGr4Z3AKx3XVeVbj33Rp+tB31/2
	InTMtG5PK7bGnLdgY+SFqDRXjAaMruqWFt0bv2a1W/AZghEy8MA0LM63wqdAhoWFH4h7hOdj+Wq
	CQ4OSBySAPAVBeqAX+/LHh3K/Nm6N/P40KC6j9LNk7r6k3uXM6Y576cN6kobc/rIN
X-Gm-Gg: AR+sD13ZmjtXy0In3EaIr40/OfzB2D7ht/HpKM/uZkTSLED3QBnanOCbcnqFyeZFIGJ
	AOJJBHK1E8E5U5YAE5qH17oBVUxYslLzbAgXgwYDzsKTtfqdFqdV31o1vzB6sRR+kMiqDHCz+rO
	NHVNuPayL1elQbjH/xGWNSzdYble0qV7fSSl7sPqLrQO+Us2KjBgp7n2Ezh1U/4qMsKaJkMFaNB
	mW5gt60e4O/HTMK2sYTibaUOgpOC68/1N4unShlgeVgoSYkvzT+dtNIMs4xi0qBiM9SQ+RSB/B4
	JjrQUk6dWE0nnXYBlaJP+qwhUAY9ipziBXpX1mOaN3NOZwe6VAsqVpU2+r6T2BO0iCl7HyR4c1S
	Qt672oOmZpCdevQ9LJhWSzDoy
X-Received: by 2002:a05:6a00:2d16:b0:84c:241e:9070 with SMTP id d2e1a72fcca58-84f47ff528bmr3398632b3a.17.1786012490911;
        Thu, 06 Aug 2026 03:34:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d16:b0:84c:241e:9070 with SMTP id d2e1a72fcca58-84f47ff528bmr3398584b3a.17.1786012490484;
        Thu, 06 Aug 2026 03:34:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:50 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:09 +0530
Subject: [PATCH v10 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-4-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
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
X-Proofpoint-GUID: msYGwKB2hPUx2SDc82kFnt-8G33ENehm
X-Proofpoint-ORIG-GUID: msYGwKB2hPUx2SDc82kFnt-8G33ENehm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX4CsJ5KmdlsU8
 KF+DeqHN49HqoI5/tbc7wn4VxtsDdCdH3PgI4/b+SMOC1ymobjBPN8bRTLJdyeLqOoj9DXpCxEo
 IGXcZWAlT+Qw7hKxg3GcMTh64JIrx9T8AJ6wcR8X81ny80fuhA5Y9KZvTmdpXoz5wgfIIlfWo2h
 d8yRDPfCPobez09gr8oNqUlzhABMP0o5OjfKINhLDEoJdbnQyZVufzMLGqy+VHUIv1/zbCCeNZp
 95CgmNeWvsCZC1gRhB/nvpk04g34DCMGs+P31PcFnQOISzDcioTELcNA/n2pvkImkeMWQpx/lhA
 BC80RVqmEyUJiwIE0X8H8feQG4BgfxcN6uScHuP1ZIQK5kTiDhJA13cqA1AF5xp5W5VL90yXl55
 QaEc6sj6lP2420a4kBp0CEvgJFJyRzI/cUxnDy7tcxAOPz6s7KmOk0IGgOqNACxP8IrMQcM6IiS
 LBhYz8+6LgT+JmzyuLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX0E2h/fL2Icij
 i1k9R6x1OVFtp+u7uw8TpJxO2icdyKHH9Uehg+ENvJEHL//hMOZAOdnU8EsX7xWXzkZPqaQPQwC
 RRDtG9OBCTYEjHws+93QHqX9a9faG4M=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a74634b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060082

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

