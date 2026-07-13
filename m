Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E603DD522
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933478; cv=none; b=ZjzA7K3GI57HGHVDfpB5SCPPBQsYCVJOj8piGNDY6RT+5NorRdmSRnhjBR05J7fzrthIZO0lOMARZMOg8jzOqX0Qq6qtwBGOyPvu/nZVEOnOjtYpKTqhx5yKVH2j4EMo243Zy2R7CKIH7xwt7/rHoT/ulpEZbCYF1x6Y6uk3ti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933478; c=relaxed/simple;
	bh=AzmlBXROR8iQCdEb1BFK578xEWcRCr8BSs+1i6E6Fvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JScs8tqTfyIshFDW+k9+B6X7EAAKZhAjCEY5aXPf1GySBDMUxBAUrafHjjylObtJ7TPi7m26bztdrk3zXQg06VApiRUtecg9ujaXJDatkZE2NP1x2G8+kGAoJdNo+wvY7/5Fusg1HPFgTDewTH+/fKBh93noMxlLENk0V3oyWe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m38nCxlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9hRO5JD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m38nCxlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9hRO5JD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nf3c469272
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SLkAwoLVoj6Qwjd/dBDZ8C0ko9gsRMNeDqMng9Ci0XA=; b=m38nCxlMUljM7c7d
	Snds/9fkN9ZZrI/s329Y4CqL0s6ep2yMm6os9w2ivKiO8vj+Kr8i6+Uqatu5D/us
	uqOYTXENqMF5LaTJ8q0RcnIGwXZAynw3Lj/Bh4Y/4GasfFdeq+1yGXbZ2aKMWbkT
	fPPx/q/RFmSUNU8BPLon5BuvyV9hrE/ZtqVrL246yixbnIFxhPNhRnF4Finn7X1j
	D6E/5SPCV5XPf6h+IVutv6Cq2Az5PEfscXWd+qEIp2xCKV1Qu7z/wAzieBCUseK0
	LMrf/QRsilmAaib7Qmbdd+I9yuJx62fYioBEq7ws1FV8lT7W1MPV9Zed2S1uB6Yj
	eCLtZA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf485av7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so3055691a91.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933476; x=1784538276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLkAwoLVoj6Qwjd/dBDZ8C0ko9gsRMNeDqMng9Ci0XA=;
        b=O9hRO5JDF3TXWPXzUIXIKFu/SFwK9W3eXTOQXYKQVOEQZ4GBWVXzOePYCcEf+RQtjm
         4qtukeZ9OswcaSImlTfChka1pPO32V7r5/tlfU7ziJEB8GHbcnM8QIEbCGHoW8Thz7I2
         lOj7/pnqR9yg4LB6xyH9P2ZL1wiabKHHdb/nvZd7aLAaSZ4N8s3bJX1uxW2PtMhbBQE1
         DT5fxI0eVUpI6s7ikw05Upq4bmmdx5p7o1ulm/m6pYHtxA36hPVPRmN0Nfkm1iL92K1p
         i4HoC84evwPNDk8T5SFbkcc6bTfBIdTtalo2H9gjHH3Z+9AJyYEWsWn3L7+HMVxS4W0U
         lc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933476; x=1784538276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLkAwoLVoj6Qwjd/dBDZ8C0ko9gsRMNeDqMng9Ci0XA=;
        b=n13zlRWUwl0Yjt1lYSWY36YSvCJVpzXClf7batwUfgca4DPR49kcC/IX0cr3sV8CU5
         wvEI0uWKpz9dnF5gp8gdL0Eu/AiO1D3yOkICOrkqsdcRdDM+PDFrcZqkLJdPDrjp4G58
         q2W8suDmYF/BZ6hB4K2kQn6bvF7ewi2HzyEbvB/AcvszFfmLRkJTrcpD4BqNFyCKdKbL
         Q1l7Vnw+/sdKiXTMVlCMW19VgvQtI19bkE7NhkUAzqTne894vIiXktEFCOJMuNjZNzZW
         d8NjFKRbhn+u9g/OyaF7aNbl6NqvuhS/LNlHVYnbh/1Xac+yrxqYlPDU0BUTSvqxIGa+
         AM4A==
X-Forwarded-Encrypted: i=1; AHgh+RoJYCQ1ajcA6WNlb/lNvNn8wyXoo/LQol4Aa8Ns5VUiNGWFvPhXshj6cZOy/xoHqkaHdiIOl50Idh6u@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv9Ik0SKT4qk1OfXJJoypI9lwVMTU9vYTNBPhg4s8VvvC6GKC8
	3YDxjhCodmt4Xh9U1ImyrA4PN8k8u6nbGfq0hQQwGEMKfgZskwt1dRKaKLT4tejHJDYdWXXl3hI
	+G2OfVVQOPh5XnMuYAcb9beIphR+/4Je8u5b0reciEHXFmsEY3t6wn/j5Qf1DYcb6
X-Gm-Gg: AfdE7cluzwFf7g9kOf25vcJYQ+RN3pmtDQI63meQe7x0dpUrvsioXRo5uMxH/ENWF1M
	LT8yhzcUpmnFzjS8s7NOsuBlxF2K4glfXozsaK2rxyF0UencZ0cN4VBe561WlkkB6V29EUj2GMT
	fUfeIm4Gj7HN7Sh3PDtJN6Z8e/P7gVWMHIxSep3kgVI3oQPKXBOgccEBZrhNrsSCPHMMhlDkdVA
	KqrCoQEGrO6WpzMoQ66oYiS1zDa5nNNgh9BFf2Y9vH0dXPvd5GZj8rvgGz5GCVgUxFxEU59eZB7
	mrQZ2yQpMDZ+E++kJzqEWAiMClzQdTb1e1wyc+3jz2TIA0n43QfVWPOxXSKvaR7JY5zlAAhsV9K
	aBwGmihS9yNfi+Ra5FGHJ2QVAuT1qLEHGdjk=
X-Received: by 2002:a17:90b:164f:b0:37f:9ce1:735e with SMTP id 98e67ed59e1d1-38dc779ecabmr7418658a91.31.1783933476013;
        Mon, 13 Jul 2026 02:04:36 -0700 (PDT)
X-Received: by 2002:a17:90b:164f:b0:37f:9ce1:735e with SMTP id 98e67ed59e1d1-38dc779ecabmr7418618a91.31.1783933475496;
        Mon, 13 Jul 2026 02:04:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:34:09 +0530
Subject: [PATCH v2 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili_initial_clock-v2-3-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX1yCe+PIDPfTV
 IVVCoYZuA1cZjOd3rGGW45ia1emob920iieC77I8XLsxUrDC2HCZkDkaxBBQ0WLLkdiB2GEkikD
 7rLP2ITFEsp3WG27DRsoUUTqsWS1P4k=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a54aa24 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4s9NPNi6RWkeKLmGOYIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX6c2rp3NGOqaY
 MWQCpxdr8Q9PvHY9EnsItq+K9Im8fz6fF0p7RyZoK6vD3OWz3wYmAomOu1m0Ha/EXbBfnd5v6nf
 xC1rYU3qLYJOcwefhZtoPAyNS/xj1AlDb4OCDTs46UsOjktFghxp+TBozMTVlQ42UDRDLmTvxiB
 a4pwBvN0leGN0HgzDhtTnF2lSTgsUXgyAT5V0jOJhp6TeD/MFqmtqwOApdEiKo3IwozMJZ/sbph
 9dVgx0c9uIeuVNGMUcqBKlLGbFCNdpwx3ZPDTGz+Aua1ll+fGjNSeLHkacLijqFwOXtK12lSs+/
 q14o7hWCOxw7xGw0MMqt//bnIpJD3/0/xOEhyWUgMlWCQQX+C8QThgTh37HW0xf1/bADIAhwW3i
 PAkYk73Zh8G5jFL30ie2VupbjdeANwdNFx3iq9RLksnt1h02fY6YUfKThYAtC3dbFNy6XvvJjg5
 PvMvcx6Wkm33A3hDTGQ==
X-Proofpoint-GUID: YWHcsYsJ-iApPC2Tl4j6LAEaxU23FIkk
X-Proofpoint-ORIG-GUID: YWHcsYsJ-iApPC2Tl4j6LAEaxU23FIkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130094

Add device tree bindings for the global clock controller (GCC) on
the Qualcomm Maili SoC by extending the existing Qualcomm Hawi GCC
bindings, since the Maili GCC is identical to the Hawi GCC apart
from a few additional clocks.

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

