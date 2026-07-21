Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DB542F6F8
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617684; cv=none; b=YWx5wH4bF0ZcvYhDHkKMI0nSx2ja5MT3kDq8KtqdkpO9fw+Vh1vrBXMcUmK4qR7E6FY/E6dd0qu2WTM6aMN6J8wITHul8vyqox87gZOuwqQMLIx0z/sUUbLW/lTrYEmayUnFt11cQvRjq2eVtqeCWZzkcG37chd/ZiQN2oJoUSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617684; c=relaxed/simple;
	bh=co3ZcpWTx4KyT3V9KCpPr1KU9LjGh5464FpA3zU22R8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmMLKiOiw3E8UKZiWmbS4ribphXmN0pLErMkied1FEAYCFPdPH+OpdCx3CCTe09oUsy44vwOzOrdlFPqs3y6j3bFSaqd/pc1OXEKiIaoHLcqgkGo4+h6qv5QSYjsCAPBHv+13r2UzeEsfSWyIgKTVRnt9GX/nXMH1A1UfMdxhPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4JaKl2o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cw2pnst4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4JaKl2o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cw2pnst4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L460QW037547
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTPXYNu1BS61Oc10Fpzbm8m4eD+3EJeGtmDzuxepwyo=; b=g4JaKl2otrFV9sML
	4OjM+nVCGwUHMywYmjMGt2ArFd1lG1K4ZTeN6a3qW/T5+gbzDSWePKBrTYQp7qSe
	vjlpIHXCE05r15+1LCjSx3vHwxgh1s7G1JpwjhO6p9AcJOgd7n0BpQeqdHjuxxUl
	+Bv1RYd/Zdo1Aq6lqOkLDbAs/NuWIIA3ojNBK3u6sgty9bS7AEZFSVqjdRfRudBm
	EMev8Kwan1Y0ZkNISBoJN1rK7Uuytrhzpt8DlojT+atSQeDfVovpRnqul5n5j4UZ
	kBcifYKpEDxd/jP1+QaDFpZoHifx2H7OwpkFRSI6z6Zfs2SP/5VMeuwMujpUMEtp
	eid76w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es0p82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:08:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e024d2129so1232647b3a.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784617681; x=1785222481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTPXYNu1BS61Oc10Fpzbm8m4eD+3EJeGtmDzuxepwyo=;
        b=cw2pnst4UJVY1n2dCc2kCrz5ar5k2zAksjifdgNYe3TxrtJTM0Q+VSACkiTst7ncn7
         O8ufAJUI6nv7ef34gMQD6fv6oEqdUkAjfWhLTSFups9b9Cndv7gjH9DBX0jEsI3yHOL+
         HIv8jWvKX4qTcmjdj3XESgcmnbzh9sO/XY5cBzo57uZCwBTS2+uWKzqxTadwIsI83AQn
         gv6qxv1qHDEzRPu7NExhOXC3iSQmKGK+pQBIHtTxECaUazsQV7XXNnvjKU6d8i7N2ON1
         4Dk1AYFtuIdF1wHoZQ/5YF6lRDSoUR1O7gBp1CGW0cEQqXQ4nvtIvv6phxIG3OGEpSac
         V3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784617681; x=1785222481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTPXYNu1BS61Oc10Fpzbm8m4eD+3EJeGtmDzuxepwyo=;
        b=o7p9Nrks3ximMyL1tZpPuxdS2AyslGDmHsCBtAscMaCVNQ0v4MBQ3II7TCztpzp2hh
         bWXZSxxs+Ozsz3J7RhADPNCGZt+Li3g9bYbaqaKHERKJEm+XXttpfQl1L0L8Vr9CAc/a
         4JshSMnCaPK2J/oP+4FNUMoFOY6cFi3SOq3+lAPF8DDAqZ8yuQEVWlKzxFx9LX2iIY85
         QMbl3fO/dSUvZBY0YltjiHXhDUbp0a6vHl0svgDEj2N7d9JC2p8LokriCxCKhNAX81BN
         PzbYd2J3zPz2JsKpc1chx9nJNieE9S5Ix1lvfdNtO+9hUo0qe+ffGMHlUeHgAoHlcX/5
         CnoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNyiCsylzGW31RC4v39bMDGLKwcyzd/nP3GUYX4rH0U2Vv4FJuno4xlR7b2iULptgBIBAN4xfFt+Hp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl8ZkmduToKmhb8yisLvyBCicPoV/cxDe6YoVWhPsR6GtSJ8eH
	r9lCGpq+spF6eulcr1HjByyM8L+CdJ+Gt57BMBJ42WQJMpgXnFeyw/CcYLfDTD4ixqolUZmttQa
	HN+xotyvRPQGDta+wsOoKzb475eRJFzqTgZrGvnzyWZ5OesOCbnL62jPwpgHu1A2VGDEqtLCK
X-Gm-Gg: AR+sD13rpifBPxzZEIrRzTp+HWYIncHkMsDxtggyVQOC2srkLQ9Un5N4pxfARKTKR3q
	DxkieiuuJEdCGuK6CA44XCS7lVkZwzpl2Ja/DP8cawxV6UWU5J1aM6Fgf2PkNb3w8nn9jwaA443
	Y1OeJYJF4WdJLwVufPPfZETiyrrgjZPARTIaFZrKaPBG1ZNXu42itgti7k0nzsctq4NDvgbKQ2r
	gXPJTXSibpq6+M0hUfP5FdyKG02kPnr+PGH2/lP+C4xYETaEjBsg1UHPc/qGBWdw7POTy4mBA0m
	Igx2bf+4kBz1oeembT2OxZXCCkJ+El8GUtgKZj+5EVV1Y8188bMf9xipku2HsbNmEDowZLZIiB4
	4AknMjrsD59Eh3fKSRYkneRnM
X-Received: by 2002:a05:6a00:f8d:b0:848:60a2:4e9b with SMTP id d2e1a72fcca58-84c294d4b0bmr17751586b3a.42.1784617681540;
        Tue, 21 Jul 2026 00:08:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:f8d:b0:848:60a2:4e9b with SMTP id d2e1a72fcca58-84c294d4b0bmr17751554b3a.42.1784617681159;
        Tue, 21 Jul 2026 00:08:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc74csm7080833b3a.18.2026.07.21.00.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:08:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:37:20 +0530
Subject: [PATCH v2 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
In-Reply-To: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f1ad2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bOuFlZkiYT1K-aWiZo8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: qKGQETdbSCxqHmJYnnkkw2f4rjLjAKu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfX84tjOc5YsORC
 O378rehO+gx9H6lxPYXyk1d8t72lrRKqxMBvo7ZMpcDIIqXQmF1pUeLhIBsPgcKkBZxV3NqZ6TK
 4xH70p0WBEX5fgVP76FTDeMlhdCQRUa01URRmDUakkmEQDr9vlWs6GZswceAIW5jlffuV9b4JUb
 5n7BGhfFvQ9LiKCBocVY14SIffhtlTtvRr7a9lZygvwICHRTFmo2F/w957AKuTGw5yQjm9hN0uh
 pWr8jaoi+2EvViaHo2ssC1YSk/pkV/HP8gizR21I+dBMuok6d60Rd3Yx2jjkLBenp9GYAOMCEaz
 xE28G+4D7lfJaNl636Us0Ub9yn0vOt5sJTDelOYpRjs2SLsHuW0hrcuot+bcCZPxy5qe2m39L4B
 XiQnv16YqYa9Yj8WK0LTFYQ/1sYyT90r49T9CVID7yr0cLJQ5BNEGeNEYxVcZTSsCX1F9057tqo
 hSHh2nC+wZA8P+5izww==
X-Proofpoint-ORIG-GUID: qKGQETdbSCxqHmJYnnkkw2f4rjLjAKu6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfXxgSUDsEjfoDC
 rWc3M8ikxTEbcvDFOVEPRprHtIOR5QxhQYE8wvm3BvcjN3MDY7qZiXtJHp0SsgENXA5YMZ1b2RM
 0YzL19krVJjW+IBeDcJQknpA1vADYxM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210073

Add Device Tree binding documentation for the GPU clock controllers
on the Qualcomm Nord platform.

The platform includes two GPU clock controller instances, GPUCC and
GPUCC2. Document the compatible strings for both controllers.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,nord-gpu2cc.h       | 47 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-gpucc.h        | 48 ++++++++++++++++++++++
 3 files changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..ba85692240e07a4ed8e69c6b61847c5601b32fa0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
+    include/dt-bindings/clock/qcom,nord-gpucc.h
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
     include/dt-bindings/clock/qcom,sm4450-gpucc.h
     include/dt-bindings/clock/qcom,sm8450-gpucc.h
@@ -33,6 +34,8 @@ properties:
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
+      - qcom,nord-gpu2cc
+      - qcom,nord-gpucc
       - qcom,sar2130p-gpucc
       - qcom,sm4450-gpucc
       - qcom,sm8450-gpucc
diff --git a/include/dt-bindings/clock/qcom,nord-gpu2cc.h b/include/dt-bindings/clock/qcom,nord-gpu2cc.h
new file mode 100644
index 0000000000000000000000000000000000000000..3886af669c61003f71e2da28f939f273e761c653
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-gpu2cc.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_2_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_2_CC_NORD_H
+
+/* GPU_2_CC clocks */
+#define GPU_2_CC_AHB_CLK					0
+#define GPU_2_CC_CRC_AHB_CLK					1
+#define GPU_2_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_2_CC_CX_FF_CLK					3
+#define GPU_2_CC_CX_GMU_CLK					4
+#define GPU_2_CC_CXO_AON_CLK					5
+#define GPU_2_CC_CXO_CLK					6
+#define GPU_2_CC_DEMET_CLK					7
+#define GPU_2_CC_FF_CLK_SRC					8
+#define GPU_2_CC_FREQ_MEASURE_CLK				9
+#define GPU_2_CC_GMU_CLK_SRC					10
+#define GPU_2_CC_GPU_SMMU_VOTE_CLK				11
+#define GPU_2_CC_HUB_AON_CLK					12
+#define GPU_2_CC_HUB_CLK_SRC					13
+#define GPU_2_CC_HUB_CX_INT_CLK					14
+#define GPU_2_CC_MEMNOC_GFX_CLK					15
+#define GPU_2_CC_MND1X_0_GFX3D_CLK				16
+#define GPU_2_CC_MND1X_1_GFX3D_CLK				17
+#define GPU_2_CC_PLL0						18
+#define GPU_2_CC_PLL1						19
+#define GPU_2_CC_SLEEP_CLK					20
+
+/* GPU_2_CC power domains */
+#define GPU_2_CC_CX_GDSC					0
+#define GPU_2_CC_GX_GDSC					1
+
+/* GPU_2_CC resets */
+#define GPU_2_CC_ACD_BCR					0
+#define GPU_2_CC_CB_BCR						1
+#define GPU_2_CC_CX_BCR						2
+#define GPU_2_CC_FAST_HUB_BCR					3
+#define GPU_2_CC_FF_BCR						4
+#define GPU_2_CC_GFX3D_AON_BCR					5
+#define GPU_2_CC_GMU_BCR					6
+#define GPU_2_CC_GX_BCR						7
+#define GPU_2_CC_XO_BCR						8
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,nord-gpucc.h b/include/dt-bindings/clock/qcom,nord-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..3cc348be5668b309a151665fc29bdcb30c480740
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-gpucc.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_NORD_H
+
+/* GPU_CC clocks */
+#define GPU_CC_ACD_GFX3D_CLK					0
+#define GPU_CC_ACMU_CLK						1
+#define GPU_CC_AHB_CLK						2
+#define GPU_CC_CRC_AHB_CLK					3
+#define GPU_CC_CX_ACCU_SHIFT_CLK				4
+#define GPU_CC_CX_FF_CLK					5
+#define GPU_CC_CX_GMU_CLK					6
+#define GPU_CC_CXO_AON_CLK					7
+#define GPU_CC_CXO_CLK						8
+#define GPU_CC_DEMET_CLK					9
+#define GPU_CC_DPM_CLK						10
+#define GPU_CC_FF_CLK_SRC					11
+#define GPU_CC_FREQ_MEASURE_CLK					12
+#define GPU_CC_GMU_CLK_SRC					13
+#define GPU_CC_GPU_SMMU_VOTE_CLK				14
+#define GPU_CC_HUB_AON_CLK					15
+#define GPU_CC_HUB_CLK_SRC					16
+#define GPU_CC_HUB_CX_INT_CLK					17
+#define GPU_CC_HUB_DIV_CLK_SRC					18
+#define GPU_CC_MEMNOC_GFX_CLK					19
+#define GPU_CC_MND1X_GFX3D_CLK					20
+#define GPU_CC_PLL0						21
+#define GPU_CC_PLL1						22
+#define GPU_CC_SLEEP_CLK					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_GFX3D_AON_BCR					4
+#define GPU_CC_GX_BCR						5
+#define GPU_CC_XO_BCR						6
+
+#endif

-- 
2.34.1

