Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612703;
	b=ObeoAzzuWDw/ryc6j6Ewmdjd6vCWjWvWaWETOIcr54Ej7s5st+eCzVY9ste38W/HMo43
	 o1fuSYPhnTccK1E7Hnyt8tNt7vhCB29yLkQuatyUSXBVcBSI18MvhVG9hT26Tp8vWO2ys
	 viA0Uv/B31C6raXIhSk2hiQQtMxAzQGEQDSvffR60NG0s3N99XMm4XWzLUCyEmFL8ZMnA
	 jIwrxnUJW3Tyw+o6GCo6W2nxaaFyIf29qPmRvr53bltzOWtJA1JfSoiGiufgBqK3LtMpA
	 TLIkgjPephnd0Vyb7rmXxy03yTDKVGJrcbNJ9WLBWfAiFAtTJFR/1e3R7yiE2MSNsRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
	b=3OqHRq1KjPkzxHgQ1hJbj/bMZ5WuyCT+NwlbyQ2jjMUJKEzqgFMzPJ0NKTdEAtWLIAHc
	 HnnmU/imW9AZA1B1I9aFCpVR1imf5GK0qruWXkC2Ys5XlhFZyEOYM7/OY9a/0ONI3rxNJ
	 9Vf0z5iI7alTFmhY0gkTzOHF8Z2ip3J1vez8PBFBCAJP6IP8MussvIP+44cmV2HG+gL3w
	 vTs+48mkmDTtDj6pzNICPm8P9NHPtR0Qi8IyqCos67HGVabpbe0C2KMQD8Z1xg5xBNNjE
	 3I/PC67AVHKqdgeK3qYiZslDrdutsyNFsjwsdA1x+4nwhXYNMl9aNHulR9hxUmsbiSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YsH/mTW8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c6dhz6dN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665A4606A33C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 665A4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YsH/mTW8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c6dhz6dN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nlZY1505248
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D0rA4mbm0Sn
	OvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=; b=YsH/mTW8Yfze59pzM5U4jIYv2AR
	BxHVjutTBhlqU+LBEjrFMFvNOZLZndmn5wfLF0IEWgYaZnnRc2s+QXSaUX0xRHJC
	LUyNVan2XKBTxTj0+gSXoU7stPJ2/fSrRY8JTiZeDoIL7O6S06vR76kdu25obYEA
	HGTJ0Ki6JLP2aTfyU/FHA9oquSZR7MHlxHMchdhIdgU0g96vOwF2TByBon7oJgZr
	0P7YXTRzC5nLQLEM0FJkHQbXDVcUNVuY8/X+9EtlxatAUJmiHwc0UEKgbEGEZCnq
	8/2mRMF++2pns8NMIrdqc2u3wsUKIa4ZT1PKh/isxQgNjsxl2jS3/hcoFyw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa2abwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:22 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ee30bf935eso1084599e0c.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612701; x=1796217501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
        b=c6dhz6dN3FwuJ6WDuZdvcEA7x5ATZMTXQDkK25+dCgcWYQE+KaM1NyxDYuSrrMULLV
         ZwwMhsYJ4xb7lfZ2/4SpbxAj57UXFEzbQ6/u1wkBpUspgIXZs3/GgOkyocFgdkb4sQW1
         xGhsBqzlJ6cQEOm3hKxnWHSweZKwCdmjjuFrZSkX05Zugjl0CbA1V+lyTHb/W/97LLUL
         dtqQ8MM0x1H4XWEs8WBiUhkiakKZlONMEII7CFnxLfkkfFpl1ayJm/ghHORc8lUPyjwy
         mzBX+kt9ArcdxSXvAbVGWOVG2ZUTpxgLD9yjXvoKUfrPblGaYoCW3n/JA4Kg+5C5WAcy
         pGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612701; x=1796217501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
        b=kXoRgY0BO0+SdRrrS0A8XGJLteAHl6v+r/d6bBx17QxzaXuc5RR4wuwPX762jgCx9Z
         PPNPsuOMd8OPd/aCyZSckr0bJClr2y6oQGEzjONJHA83tm+OfZLOnCX0RIuZkL692nFB
         wPIv+K+pgqTAb9CrFHj/V7Tcv/Ua5nc8A27FqPOkoaVIrmUhjNOrDGDlfmRyNN5jc68o
         Fpy2eHUHnFTbPhD1LhIWEu7vOJ/SR0UM6PCtMUlCI4N+xXXcHDrAqzYs1Upn27ICc16V
         UJ9NYJuwO3Sxsv1yqzma0e4lZFGa7THeVxR9z+fK61NhX487zvfQKQdAZ1whvzn7RQ15
         ggWw==
X-Forwarded-Encrypted: i=1; AL+hErF3OpiXXQDTHj1KUQQgo7yDgW1RL4kAHDTeeaNQAxPa7rQqhdsfWVMjQAQraqSc+rUs86Q+raVKE6sM@vger.kernel.org
X-Gm-Message-State: APuU4Z+DAYV97XcW1zKlOVlKKnxV5oVXSWC4hyUmiKVHQC8pdIRTTfJd
	vBTzeFGvlQkND6V0rqr4rxBFI5tAAPhpU1SHemj0AqwMVeqAVFlOFEmMadesgQhfImribLjYB2s
	sUMeRvKh712TOeimqPQKm1Kyrxk8gR3ocwnXCmrLy1JLy9ebMz5R5qwg404nUKk3x
X-Gm-Gg: AZFdTZf4niKxDJ3jGR8q/lYA4SMsSWn8u7fMwNpmGvbBGS8+gFqrtEGj8IXhNedWJHY
	kR0tnWCbVeANXh12xblXISbenj2SVDeGwIimUuVd7VOESbxJnmVYy2rli8r7tQKuJO9TN57J3e/
	xayslG8VXJ70djg2JhEOihtoBdlCXtlyatI8lFYRtWN46ZPLBQwKRBUvLLBVQhXx1sAclL/spiO
	Ehu3PILJKDXK+OqgkQ9oB3mBTq8dx4dNfGCB8I2iukIraH+POqlOeRrGrVtiWcjohvF5cZZwsYP
	IN5Sq1sg33OQXwNmPHx17aphBS9pLY6/mv/SzeMwMKtbKkvKeWNcXilgqLmmh/XfoMePIw9DK3x
	0Ts323Sz6NdDDBYZRiETMIpsLXdYWWryf4I32t3E4nbslTf90MxNTaWXQTEkB27YD
X-Received: by 2002:a05:6122:d03:b0:5e4:f6c8:b0a5 with SMTP id 71dfb90a1353d-5ee8ad0eb56mr9557118e0c.0.1795612701293;
        Wed, 25 Nov 2026 05:18:21 -0800 (PST)
X-Received: by 2002:a05:6122:d03:b0:5e4:f6c8:b0a5 with SMTP id 71dfb90a1353d-5ee8ad0eb56mr9557053e0c.0.1795612700624;
        Wed, 25 Nov 2026 05:18:20 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: clock: qcom: Add LPASS AUDIOCC reset controller for Glymur
Date: Wed, 25 Nov 2026 13:17:54 +0000
Message-ID: <20261125131757.1163466-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: StyRYxAHKFw--CXuylE-adx8qZnzfUSA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX8nH4fVyAkzGD
 OpN/64RzZ1E5veKAs8cppNXHJekmM/PrsSu2L3f7Kdii4KckEGzFZeqaQFcmFj9ADS4Is1/LR+C
 A3lj1wU64WEK2bVZpufZbUw4IVtACZw=
X-Proofpoint-GUID: StyRYxAHKFw--CXuylE-adx8qZnzfUSA
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06e01e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=peyyOT9P35Ab0jvJzsIA:9
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX33wUGRSwKcIh
 exmRYxZbFaNP1jJ5e1SaMVW1QRw+SMSrltk+EHvUz9AxYEqi8mjmALaVY9vZ5OK+PzCugZ6VYVu
 WnATtvYHrwi58Q06IRmli+PEmG63VIizHpRJRNlY2htzk1nXIFrmxoCeEB9cabLdBsNjBAs/wjG
 6ydeSd3Gh4I+eL6LvR13oPMLyXIntSZOcZidexR/3c9+tYavbSiiYDSXH3FkorIMdilxedQ7rwm
 6BJohhsccdgEd6MEE4Gm9RXogzbCB5Rrx7vbAuGTZn0heeCw+H5oZOeHYt8MJQ0XkPJdY7ZFQhu
 CPpMleNPVKyaZ70Z0oZ0Jiy6N0cV/WzM6LZnYE8rWBFWjVpif+54+2zFNCTx+MtThSu40DlydxX
 ujMgFxKlOPvuoWQ/qaZTTZeEum2ptTv5up1kouDjP+cqWB6X/kqegeTjclqWUlSqeI5BZP0PaqX
 y93ELJ+M5GYdrtF3X0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

The LPASS (Low Power Audio Subsystem) Audio clock controller on Glymur
provides reset support for the SoundWire RX and WSA1..4 masters when
LPASS is under the control of Q6DSP.

The programming model is a near-exact match for the existing SC8280XP
LPASS AUDIOCC, so add the qcom,glymur-lpassaudiocc compatible to the
existing qcom,sc8280xp-lpasscc.yaml rather than creating a new file,
and add a Glymur reset-ID header for the clients.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml    |  6 ++++--
 include/dt-bindings/clock/qcom,glymur-lpasscc.h  | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index f235b4e24cc7..a25e043ab894 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -4,22 +4,24 @@
 $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP
+title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP and Glymur
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
   Qualcomm LPASS core and audio clock control module provides the clocks,
-  and reset on SC8280XP.
+  and reset on SC8280XP and Glymur.
 
   See also:
     include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
 
 properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-lpassaudiocc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
new file mode 100644
index 000000000000..3006b12e385e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA1_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+#define LPASS_AUDIO_SWR_WSA3_CGCR			3
+#define LPASS_AUDIO_SWR_WSA4_CGCR			4
+
+#endif
-- 
2.53.0

