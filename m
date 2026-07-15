Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAC13A7843
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083249; cv=none; b=rDc7V3uv7cbuj1X3YTtAwoFmzhYs31qttf03WjRUi5UJmsEbi3sJM/R51D+m8IMB9/fB9x5ez8UW0bSU7yz8DJ5s9aT7EMzMcKSGaE/a19vl6Af2ch+ndOzEzkOQpfrxhsBhLtnTGk7iemcdRA4yOr8UXbxPmnbYSh3AHJhn6NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083249; c=relaxed/simple;
	bh=LRUBCHmtCWd3pCbCEWG4bzIfRmvXJJnOFe2l5IDMwng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MM1xOuLewSrDknhesPBhbv9fn8m1bKtBxmjKCsbFbVWoAplHNHFJKUQzGkdmzk42th51VfefxqysSKfEQIB2YMKGgrwHzEcirUfTZXhLTt2FhyJt1qMBqIjJeQnBUHok5I4KJVlR4x1h1ki8NiJGqLNdjZaHQAiuD2Y4725M/xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWXUMHt9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bs1aLryW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWXUMHt9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bs1aLryW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0HwTw1921426
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GGN63ywSgwEmt576OrUnbOUrsDVqI2jRKgbSpT0rFU=; b=cWXUMHt9c2uS+jPC
	sxQFmgpc18pMaxx7SFPJJdLHqrzTBiZytnGlvg36aywqcNOESfoViiilXt4VuMNI
	O3lHUwK7MnxuDCKirK4jfFK+JAkvXj4F0yrk2HI6iEZyGWY5Ti67V8Z26+vR6IFK
	m4Yh3bfxEJdpQpxidcFhkhn6NLptfZ7pngMQfi2EoORHXtbgUKRahO6Fpl3HqwY1
	fB/3T1XkkEV5s8ibZMQfH3FtSdac+Zn2jaLVa1o5ERImf+XOj69u36CwTYMDF/o9
	Q9wIHjB82McFARyKV70H0nC9i7UADBB9LXzUNev5CcOm7jIc6iQworITt7joAnSC
	UlUy1A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk2xqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:40:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee894b3d8so31189315ad.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784083246; x=1784688046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GGN63ywSgwEmt576OrUnbOUrsDVqI2jRKgbSpT0rFU=;
        b=bs1aLryWFkQeHeJL0PYz40DQuDcx9II87BheOdFAd38m3YVFe7cFBT/4Or+XMLTG66
         XJlekLT1OIAmeh7rN7eHoO1Mzg1Djvz/HAYmLNZ5PnKyipFFc/7l9/w1lBGawOM3m5DH
         IVDA8ZrCHjJ7HtMxe0198aKWANMyuVL1L6arxMqhZ419Kmh4JNFg5ZhIcLh4xODh/ago
         uJGyf1DFoD9O/rm9yDqKz6zIRILzJwCq3GM+cEgzup+2r6/hkLKNvYM35ndNZsW7VkhS
         07+M4tRp4o8Lnc9udRvT1OXkdUWKmLj0gfmddfBseCIqw5O/BUBabm9+IZ61uPo1me5r
         EjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784083246; x=1784688046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GGN63ywSgwEmt576OrUnbOUrsDVqI2jRKgbSpT0rFU=;
        b=k6YQ0GBJkHgfS0+YUNrTtErlOPiTNd7W2xgzkDRaK5tt/5icPRa9m/BWbWCQcKQDkx
         pwdZRuPLsDvyE5dl46ifpcA/AH2zOu21nREDs0ylluPA66B6NUHO2x/L6ulWoGQM/gpx
         AqsRmFVJ4yFL92x7lOs0+se1xwgo5yk2DOUFzKaTpCoWjQ+mKDubThKSAuITvAvmZ01B
         YIpwPscSPH5QI5lMpHfSWRYJAuGI1jYa7nRUFMk3mx1gIG2rbCDqlOSCjbAt8p4CjYzw
         HWbEQ6qr5iAWTi3fqqTzXKaGvcYSeysYSpcfsi8t4jgdNIzTUV2dBU4977Gj1eSb2PsN
         Mtcg==
X-Forwarded-Encrypted: i=1; AHgh+RoNcasjZm1HT200313PMAWVcg0Jowtwp9H83s/xhPhP+NprVM3JkOn5EXQWPb+KiaGObCU1Xzok+MYS@vger.kernel.org
X-Gm-Message-State: AOJu0YyCvy89nFgrLyxLdjAiNrOFiltlldCe9cHwXQgjpz8u3FZbXLQu
	RWyJcHnGgEbYdQW567ZPYUNRX3rxFKAPSv4WGuEUg2ARTFbaS5YrYdf4Mu83Za7PSEhSxTfRrpk
	IKfCeNNmj/0bZccuE7VpjKtmY8HKcbnGj7G0lfWOnvu59WAUMjQeDhisYnLzOMmSZ
X-Gm-Gg: AfdE7cn4TU8GzZY4tAS4t/cMjhJ5QocjvSZbuisPsVPXsZZMTB5PBVe7asMMGDtjBsX
	zTCPxapIfrBdNvqNq48ffgKZlGo7zWjVF8grFmqMcikOAa5yZJBMOb516cLNbtbNk9C6XbdpJeH
	LoABH7XQnJqzwX0akD+yoZcbmC1lr33jUvOBXP7rVUP7X2fBrmqktDCLCfvGvF3wmjt9mG3hVJs
	6rY3N3LD7njml6PUyhu7gaSzeJzSHmL9nmH4LzRXCgLOmIWLIgey1IY0Wg/S6mfJKsv+5etR1Dq
	QpL33UYiAfeQ1+BVCTEjx2AMHGpfVo5XiWN33/rBjTGTRoA+xxXs66k3B7ncEUW7EaB8VptMY9Q
	Uyc9yspJ3T/TF09RhOyA50xeaCWm/BpKgj1OzdqcgzwJoRwCKOZxMEgfiig==
X-Received: by 2002:a05:6a20:244b:b0:3bf:6c08:fb8f with SMTP id adf61e73a8af0-3c36c39741bmr1072988637.49.1784083246052;
        Tue, 14 Jul 2026 19:40:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:244b:b0:3bf:6c08:fb8f with SMTP id adf61e73a8af0-3c36c39741bmr1072968637.49.1784083245588;
        Tue, 14 Jul 2026 19:40:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm155285746c88.14.2026.07.14.19.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:40:44 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:40:41 -0700
Subject: [PATCH 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-hamoa_tcsr_qref_0714_2-v1-1-13047922a376@oss.qualcomm.com>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
In-Reply-To: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784083243; l=4927;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=LRUBCHmtCWd3pCbCEWG4bzIfRmvXJJnOFe2l5IDMwng=;
 b=f0Yo0J8KBn9i1Z+E521tianI8T71rTtfRs/0vEwfA3bR7lKcElCwIJIKlTus19+hm4IEGsIbO
 mLCksaUbv+DB1I4n9/nBORqaEHTOY8urUuyv/xF5PISX2elqg5oLFdb
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: oOINqoLHoyEs3sVyXWEVMr4G6_IQEy0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX9NpNM5CEGXtb
 3gjQ709rIW94OF6882bdrYNLVnCVT2pMCs/Bn4OMg4Dbj39s/EpiAkPiomdJ0vb2t9EjRWpdHdW
 ovUXCTrovzZaGqkxit1njFC3nzNoN+XNC0Th4LWpsUXckdR9Nqwise60IbZpuo4PCeYZL5DbGDr
 apGm6+22a9sPmV9G9fXVnHq0+4Y9qGCyHQBa1hem/cmFG/gf2/24AaHLJObnzWjMXxPpwe392gi
 13KZWFAS9+Qsz65vOur1NFgPTgGW/DEe+vxxWx51uA/k5SEQDpyhRdmlszgZRAgT8CLYPoNm3+L
 gR9qiWm82eQotQG7qKunYcezx0288XibKpu0WIhe+IPrQH7XokqnEf2GG3Mm+gwDk40q8enOF7D
 0muwW6cB59r5nQgDcHpnE36F/rAtc2HL9DXiWP6E5PvBeSsGu0r6XS0BKr49BW1/W7WrL1THqeB
 fsFSsVocQDQqDdVoWtw==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a56f32e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Vu0f6eG494TTLRuRXOAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: oOINqoLHoyEs3sVyXWEVMr4G6_IQEy0i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfXzR4tfy/kB64x
 /H03PBGG33gCUAfblUVEHyuvEF8WGHlcj1o8QrgQYVAGBK60mDBbmYWddL9nibY5DLQ2aOS81RA
 EVmOaEp46yobMKcBcBeg3W+3OlQR3NU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150023

The QREF block supplies reference clocks to PCIe/USB/UFS PHYs and
requires dedicated LDO supplies to operate. The digital control
interface for QREF (clkref_en registers) resides in TCSR on x1e80100.
Since QREF has no dedicated DT node of its own, these supply
properties are placed in the TCSR node which acts as the control
interface for QREF.

Add a dedicated binding file for qcom,x1e80100-tcsr and document the
supply properties.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 118 +++++++++++++++++++++
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 19ae0634b922..1af53c6b99d9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -35,7 +35,6 @@ properties:
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
           - qcom,sm8750-tcsr
-          - qcom,x1e80100-tcsr
       - const: syscon
 
   clocks:
diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
new file mode 100644
index 000000000000..55182cf550e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,x1e80100-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on X1E80100
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on X1E80100
+
+  See also:
+  - include/dt-bindings/clock/qcom,x1e80100-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,x1e80100-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qreftx1-1p2-supply: true
+  vdda-refgen0-0p9-supply: true
+  vdda-refgen0-1p2-supply: true
+  vdda-refgen2-0p9-supply: true
+  vdda-refgen2-1p2-supply: true
+
+required:
+  - compatible
+  - clocks
+  - vdda-qrefrpt0-0p9-supply
+  - vdda-qrefrpt1-0p9-supply
+  - vdda-qrefrpt2-0p9-supply
+  - vdda-qrefrpt3-0p9-supply
+  - vdda-qrefrpt4-0p9-supply
+  - vdda-qrefrx0-0p9-supply
+  - vdda-qrefrx1-0p9-supply
+  - vdda-qrefrx2-0p9-supply
+  - vdda-qrefrx3-0p9-supply
+  - vdda-qrefrx4-0p9-supply
+  - vdda-qreftx0-0p9-supply
+  - vdda-qreftx0-1p2-supply
+  - vdda-qreftx1-0p9-supply
+  - vdda-qreftx1-1p2-supply
+  - vdda-refgen0-0p9-supply
+  - vdda-refgen0-1p2-supply
+  - vdda-refgen2-0p9-supply
+  - vdda-refgen2-1p2-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fc0000 {
+        compatible = "qcom,x1e80100-tcsr", "syscon";
+        reg = <0x0 0x1fc0000 0x0 0x30000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx1-1p2-supply = <&vreg_l2a>;
+        vdda-refgen0-0p9-supply = <&vreg_l1a>;
+        vdda-refgen0-1p2-supply = <&vreg_l2a>;
+        vdda-refgen2-0p9-supply = <&vreg_l1a>;
+        vdda-refgen2-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...

-- 
2.34.1

