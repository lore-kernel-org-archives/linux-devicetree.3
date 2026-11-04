Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768927;
	b=c5LNHV98qlDP0+wjpVT7EiM9q+f5IGfH9YcErlnUyTb8QDh1UlIj+7HozK+uUBP6IRA8
	 mc6a/iB194CffsCL+3Qaa4cB4sgWDfc0l366TbtZCVYvPXcQVo5u0Tu1jbPB+0VCxYLfV
	 G31d0Dde0NHeFH2vNjw1vEZ/yJXdCaCizCwhH4xg9doV6m7D/ycCkF6NwAWVh+olaL8Dg
	 tvtpzHBYh6WgGmbGAN5rECUl2vZND+eweydr+2KIDPkzNAgb1RJ+RmQNa/5TITdXlp5Wc
	 dhLcyrCsYhtSD9gbeT8s+W7nLdi/Ay3RGqPsHPnvXD42exWIdGmLokvZf2C+hSQld7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mChJiALCphUbee10ss2HZPtfnDajwEqU6XVdq3o4+0Q=;
	b=3RzsyVwvFuI5dq5Vd26JMWPqLhdn/6dMRl66IDi6RG52QQW7ZnhbMbWIO7fL0f4B9kqL
	 5WwKLc8woIDQMOKAGG6LCOua9yFqmKa2znHBPIQBrA/o1Oe6xfxP4jh65O+Sy6W3tdYiF
	 apSvCh/ltr1VOXDLOh+uJUF2UCKczyJLjFLzSXvEIiM+Q5vGD1z0i6nZADO7DUro8qmHx
	 XCeEYsaanXT7wGZ9DrJWNtybAmwIZW3fWHvDYJs47p/VAVl+e++FvTUFiluqHt4F50mQj
	 RWJS6wFJzDpcBc1Zc0mPA6OjrP7hL3ZJzId/+kotU5qrGxkBsM7tI8KkbsXZi6lqqHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YogJ/ZgC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3pGRvHO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D4606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 05:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B11D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YogJ/ZgC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3pGRvHO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43Or6K267289
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 05:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mChJiALCphUbee10ss2HZPtfnDajwEqU6XVdq3o4+0Q=; b=YogJ/ZgCjxXbFeRY
	zLLnTjoJHq/65aB7Fhd4hSdO/NyWhUXDP9kXa5zxs/GUybUxsLG96jD1+hK31tv2
	l6/Ly8y7m1pmRVSqDzmGVBD1o+58C3zA07IISbkInYMOHnst4yDiAPtG4fzr8s4L
	NMopLnFiv2jD8GD7ANgdKJlAfMZakUz9xhSNYlINpCcgFP2KbAE/r8Fn6i16ulXt
	nLFaSPqYU/K3sBgoULbZDBi952y1M9lyI9IzvS/TKDFUECYF9OLwXpYcYHWbcMrC
	rP79k0gphoUptdK04+jRdG2nx5GcRBYmkDNB8yaXzzJwUXoGdcMSp+p2YMSeQgek
	EObCeA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg8a75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 05:08:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so411358a91.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 21:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768925; x=1794373725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mChJiALCphUbee10ss2HZPtfnDajwEqU6XVdq3o4+0Q=;
        b=M3pGRvHOUEsK3fgtWY/d1C6Mn3Ay115k5m3sgdSzaMqBrsXgBS7tqtI0Q+bYYSydrs
         ef9wGRTp3rNn/i+Rr0F3LiU8gMaMn7IzpxSUpKR/AJC23Qk/dAgxF2fBPrAiB2bOgxMI
         XjWMKdIptJ1IlkH6oePp6AAacTtqkRZZC96VfivAIEN5m9xhiV2/SIKP4nge8eZATibC
         EMKkBBy1EQ0SxeYVbkhQqHHqFvkXYiC5pVfs834UGRh2dul1axNdVbGQKLrP0bI7vjhY
         4XAhzl/OZ8YCzBrLYyPlAuLK/E8sWLDWM//Lq5cmevTETGZ6rIppKrpJ+VRX9dbrkTMh
         ipiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768925; x=1794373725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mChJiALCphUbee10ss2HZPtfnDajwEqU6XVdq3o4+0Q=;
        b=G8jDI1YJU9wJuU0s8qsSU2ETvyYpgxttVsFhxBKesoPfIM+WlLNubDwqWuajSf7VjO
         54vYk5h1iLeTzAiJnTie7l/5FvplOc3HV6U0/V0Jsv6ek2yGE7iINYSpgqsdkQbhnHkX
         7sNAVd1bClQFcxIXq3deikamPTlYLcgAOM45CBNN0rzRPqEnXNuWcvtjGOMX6Or++9mO
         vzq4+AamvfyiBx+82FiVgTrtwLE/LfXiHECrzu0C2xZcdBcSjVjuOK7CTYGBYEOMikbO
         H+5R014zMf+uFZq4ydtCJ31RttGBVzoufLSG5PnCkaYyNJ1sTzeshq8XZiuX7WV5xWQD
         nspg==
X-Forwarded-Encrypted: i=1; AKwUvBym4kYuHz6Suo9J/k3Iz3SYOXk1Kwzbbe/ehBB4+4wA8k6HJfWl6NMbxPj7LFNioWp9jxc5OVY5MEe+@vger.kernel.org
X-Gm-Message-State: APuU4Z9apdSKKCMAy9g/luc2CWvgnSSlhWMO/kaQdj+sfzAXWNvuRGsx
	xDfCerVX5Pzy95Het8XKS+JXVDl2fU3dCAPb5LLo3rfGYsXAOIpbpikSCY5kAjmYG9OwzW5fFnN
	oLqtUfniVhsa/2sHk+XAXwmBfVtqHdgrqVT0fXAAIqPatjRJKrwe6Jrt0L44XzYaf
X-Gm-Gg: AYBFou092amslMeQC3L9Y3uGj8RNemXjXch7ikzQMe6Z+g4tjjAmwT0A1dSv42bEKOH
	Da2duOYa6YzqXpBfRapPShVD5qHKUuxyrikFaYO0oEGnWJmVH8u45uEk5+HGqlwFGqOL8RSG8oK
	EQnUZbQGKolj/D3IUqudi54E1ajtcqh87RQ+Yg8fWj0CFkctWteGBbIN64CkoWsrRZEHSguhRMJ
	JvOvAMvFbNccpPNvOi2zgMh03BovNDXbNBlgu6XE8Nq3OR0ZUBMN9tjZ+CkRLxRpmGXBPY6w4Bk
	qa+q9ZbP+Q0Zr3s3oBDC8QamDCGNf6H828zEKOp/Do8aR9FPjTff6LppldvWVWjnLotxtKFjuT5
	muQMdnFEA9Iz7Mg/fT6DgwucTdsAtpWlwh3sOkrBIQ3WeME0z/Ngy4PWYohDQG9fEYAJJs0mVQs
	qMKR4=
X-Received: by 2002:a17:90b:3807:b0:3ac:9e76:aa93 with SMTP id 98e67ed59e1d1-3ae89573cbcmr11594030a91.7.1793768924687;
        Tue, 03 Nov 2026 21:08:44 -0800 (PST)
X-Received: by 2002:a17:90b:3807:b0:3ac:9e76:aa93 with SMTP id 98e67ed59e1d1-3ae89573cbcmr11594017a91.7.1793768924198;
        Tue, 03 Nov 2026 21:08:44 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:43 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 10:37:34 +0530
Subject: [PATCH v2 2/4] dt-bindings: clock: qcom: Add AV1E clock controller
 on Glymur SoC
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
Message-Id: <20261104-glymur-av1ecc-v2-2-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeabddd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7l5iJHG2dVGL7M6DokUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Y-qMwJ32jzcP-cIW1EMmUjY4awhfYgC0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX1i8775z2eS4O
 32D3Kwi2TFoWAuo8caRklBiT30GTgkPekbrav76Vh10g0jg1Ized9HaQr6GJzAkZjJNyGujXxet
 DKX4T6jp+Frb2JozOGzYLiOz9z45TYvTpEI1ZnAwGRygq2zCPq0auLIjvq31Xx+Le8rrwrfu3H2
 ncdZyQSb86sJCH5SYDFO5geup5QnV7Jv/17kRIcqayEib3eQBTxOVat7czjx9pfzJWgFofsIsI6
 MbNI3v3E9peL8IpjANHqr2kkjmHQ52ZzaZelUCtpBiULJoZtZDWQaIvDO9k/9via8Y7L7TCP5e0
 d5NnYKTP9puxH7crX4RYsMLh9DxU1Rv2JrkdYIs0tiVFimxi3Qe7s/IzVYXWpEoUE5XO8/KOnpk
 Fei2Z01vHAZua4FsD7QTDpMmuD4QC4OR0HjaPqux7OFxbRxQn3AKJjReSoKa7MZKCuNV9WKEltu
 TeFtUaadiLU5ALr7hiA==
X-Proofpoint-GUID: Y-qMwJ32jzcP-cIW1EMmUjY4awhfYgC0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX/DkI1bBrkwEv
 JrlkFOPU7jMPfYenPvSLMZh3/o0xuAVlL/BKORAe/IO08Lwc8ZqoCWyt1psJYlpYPBlanftuljy
 nIDaR1/fQEgjvU1EqtS9Ry8qNWxVj9Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040020

Add compatible string for video AV1 encoder clock controller (AV1ECC)
and the corresponding bindings for Qualcomm Glymur SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 ++
 include/dt-bindings/clock/qcom,glymur-av1ecc.h     | 35 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e985a450451d5e3429cf4630fb59268d9d894eb1..9f460fc4d10eb9245b6b9e55d0099bb1df2045ad 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,glymur-av1ecc.h
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
@@ -28,6 +29,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-av1ecc
       - qcom,glymur-videocc
       - qcom,hawi-videocc
       - qcom,kaanapali-videocc
diff --git a/include/dt-bindings/clock/qcom,glymur-av1ecc.h b/include/dt-bindings/clock/qcom,glymur-av1ecc.h
new file mode 100644
index 0000000000000000000000000000000000000000..02b5f3d91a63432bc74996153ef1e2f6b7c786fb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-av1ecc.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_AV1E_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_AV1E_CC_GLYMUR_H
+
+/* AV1E_CC clocks */
+#define AV1E_CC_AHB_CLK						0
+#define AV1E_CC_AV1E_CORE_APB_CLK				1
+#define AV1E_CC_AV1E_CORE_AXI_CLK				2
+#define AV1E_CC_AV1E_CORE_CLK					3
+#define AV1E_CC_AV1E_CORE_CLK_SRC				4
+#define AV1E_CC_AV1E_GDSC_NOC_AHB_CLK				5
+#define AV1E_CC_AV1E_NOC_AHB_CLK				6
+#define AV1E_CC_AV1E_NOC_AHB_DIV_CLK_SRC			7
+#define AV1E_CC_AV1E_NOC_CORE_AXI_CLK				8
+#define AV1E_CC_AV1E_NOC_XO_CLK					9
+#define AV1E_CC_AV1E_XO_CLK_SRC					10
+#define AV1E_CC_PLL0						11
+
+/* AV1E_CC power domains */
+#define AV1E_CC_CORE_GDSC					0
+
+/* AV1E_CC resets */
+#define AV1E_CC_AV1E_CORE_AXI_CLK_ARES				0
+#define AV1E_CC_AV1E_CORE_CLK_ARES				1
+#define AV1E_CC_AV1E_GDSC_NOC_AHB_CLK_ARES			2
+#define AV1E_CC_AV1E_NOC_CORE_AXI_CLK_ARES			3
+#define AV1E_CC_AV1E_NOC_XO_CLK_ARES				4
+#define AV1E_CC_CORE_BCR					5
+#define AV1E_CC_NOC_BCR						6
+
+#endif

-- 
2.56.0

