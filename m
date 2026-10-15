Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77652ED4B
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071346; cv=none; b=Z5Rq4qCHydmgCsWqPjXYFk/tp2BL9iIa10x1YKrHrPfdYhrq02YQNxJDaKDYXX/Y/dYxdzdOdnvlcqdOmzAfiWQGb/Igls7LnDdg+6bfK8lHvXPMgXXeFoFGFlXCyXhhxV3rFAew75k8YgRI2vj565Qys5JLFGaMlpw8irz4ncI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071346; c=relaxed/simple;
	bh=hCO4Jz2WmavWtt++4VGHYxabDTrf/xVNhLgsFbDLW48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fukFUR57umHQna4zoZyRnj+s3ZW0FQixMq1kJnV7I7jTTKKd1JPGgw4Blf8CwgZWouqFhymYG07iWHJyDD4iCQfjVOvbmyCiuiYIqk8O5GFBn4p93O/KiHqgex0cdvYGsaxZXo4TNCGRYGpVVbSXRxvtyQNGQBx+64Vl+GlgYSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+DZxHhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiooOUnO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+DZxHhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiooOUnO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jR9f2662624
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i690FW/98Pummk3TX1MdQR5TM1eRlPMuM4D/m9Oj9pU=; b=Y+DZxHhb1QbpshB9
	dqQiWTjFWbRFdw0s/qlcqC7a5arIJG6DQmFP0Os/2lhdwZbA7LrVS76DctD96LZG
	lk+S3H5CtiRM8nlSYNnnBrXGQ8q43IgNLKfv75rV8VKsmAGlsXBP2AggeEqdNio7
	AzI9R+NWylw6aFsZmuOh5lzUMFX/SItjQfsjoTY9/b1223L7kYe7Qt6kEowVA1Cj
	w1gx5V7tLLHZ+cssa5bVGThfdvbWeTRJo76zipqjJN8AoL7zS+BD9Bt8O+2N5mxu
	VFgxK3cTsix8o23YJt+U+dsNW6kaiD0JmBiRtPSqFu2RdsAfPJG34lKMktmgMyza
	m8sQqg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda29ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:35:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so3603854a12.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071342; x=1792676142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i690FW/98Pummk3TX1MdQR5TM1eRlPMuM4D/m9Oj9pU=;
        b=ZiooOUnO98Dt+EoXZMlUcnkeusSGh3AqWn/o5dnJ9lydl4fwSmN87ZQU9zgd/40H5r
         hKg53HWXWaLJ53AA3bd/Wx1dotGfAaRPk6gRlXP1h0lluvCHqGLsZOI1R2EoCqHSsr1U
         TeRHtFXV35QCGGxXNYFjYqC5tyM9NvCSZqZDLHnFee78ZD6+VlCc38dQg33ZkZepzDQe
         UIvo1vZVpE7y56VcFJEvYV/SIbti53+YH4cmynqqrh1xo+cB9tLzeBxxZtAWAjtxir2O
         zese233nfjtCywdkmbb0Xvq6wfgfnFgJGF+xN2KRCEmcO94HgXiDj9AVR8im3vKx4wBN
         270Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071342; x=1792676142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i690FW/98Pummk3TX1MdQR5TM1eRlPMuM4D/m9Oj9pU=;
        b=03gfo6TCGESwYX7jLBI8hXkJtv4dxK6Bmjpu5KsMJYrfGPMmvO2sWV0+LZY5Sl9See
         aZ3SZeq54IZ64KWy/ofsmMwD0MQok6/mT9+OPY/G6xenyIprHdqhbjJrH4yBtR7ACmPq
         ns67JO34n77uhaY/Mye+NTOMUinc4SirmOEmqrNfd3zYl4Lu3zimt9nWd0yrel6Bb4Ow
         CgYKXnnwL7eRF4MEwrQDfOecX4Hw1Oh6gD1PsFdV9NFf17i62vPLt95w/BcWj/OKkTOt
         r680SV8vpgiXRDILpRRFix3ybZS7MgQeEOu/4rjAX+HgZObBlZABC/LafPCECoZwB59l
         5J0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwpfZfJ0GeQRYTHyPQYLhRbTC4tubnl5YKHyRtZn2OZNLCy6qADx5sOsB2dz6Bfd7SLPqxfT9lIETdu@vger.kernel.org
X-Gm-Message-State: AFq9FYI3UJVqkWn/Sv7UjxDGm94KiV6pRg256UgDjED2Kzb9b79QJNPK
	NRZiOHFSGJcF4C/pFaPKuqnkKTcKyaGm8NcVQIhcOvkwy/t3D0EmYYuQpPAo8QDqHCQOk1Vz+ar
	atEr23w1TfsweWGuY/xoRCixxnyYxUY/i1fjQUNy0GzzM0WbExCucg3bWBSyElgAQ
X-Gm-Gg: AYBFou33q/A8DbPQEP3j14DrQWdIs1fgK5gA2qJW2+lk7CGwbqAP7ohqw5JyTUiPTQj
	ZY+z81zlOX/3ve0/6LNFWl3oij/P1R1aw5hz1MrsSIViOFL/jWUx7r9ZqHOPKwyLFzBurLPiCdw
	jk+n4uwxTkcAKd3q0MqmGbkdAVOyjyBK3WIJix6XbFNxjQRRF4yW9YE41iNfF0zkpDZM3PtqlB3
	LaoTcZh1lmXKwYBz31mztw2PLZb0ytbDI7X0aZswy+fGbhk+CniWQATaCIIKKqdLVuZgopzqHua
	UfdNPK761D/+2mo9zeiHfyhfKV41jDQ4wsG+hkWvkQ15xkZi0rCBU8WnjhgJtT3j9nGWDPU/qos
	xceQSYJ72kyqsmKX4TsmwUk+K4b+eVw==
X-Received: by 2002:a05:6a20:734b:b0:3e1:9071:acdd with SMTP id adf61e73a8af0-3e19071d800mr12312744637.35.1792071342361;
        Thu, 15 Oct 2026 06:35:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:734b:b0:3e1:9071:acdd with SMTP id adf61e73a8af0-3e19071d800mr12312714637.35.1792071341808;
        Thu, 15 Oct 2026 06:35:41 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89ec1705f5dsm476617b3a.53.2026.10.15.06.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:35:41 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:05:02 +0530
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Add AV1E clock controller on
 Glymur SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur-av1ecc-v1-2-448a476d54af@oss.qualcomm.com>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX7ELeRLAG1XNe
 Ov4WbExfEMGGqKMAtKKg2P5thqSF2xh59NA+v9Wd1p39ELjQkgwW4nK0uDItlJaAdUuMMGhvOOg
 1nlrLB0o0NlhkHNGKwIbITTJB6fN4PE=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0d6af cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7l5iJHG2dVGL7M6DokUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 8sqTObVxYws2Fne6XWty9ZuDVTB9nYrE
X-Proofpoint-ORIG-GUID: 8sqTObVxYws2Fne6XWty9ZuDVTB9nYrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX/MWy+ThDy7t9
 bGGj1JT+xU2gmJ9muyC0IGd7ox4Q65nwomGmIHF9rIlkZSCrISAYyQKXf0UKzjV1UBUfAhtZbsU
 U0TfEmYyfe6E/g7pWQPoZbjP6gr4knTEYU3NJPA0l4oVP2eFGIjh+p7uSN8Ln9KuuZPDalcB2qp
 /n+zIxpC0hddCA1ReGnBgXCvvPG5ZKhP33OJPmUYOSC2pTUurOEBofzRD0EmPeP8SolCeTrLFza
 QViUuGmcmBPuM3+h7oGXtwaJMluXV+w+3K1BUCCweu7HWdFhcPiGY5CoRwCI+l8x9Qd+NkU9OGa
 zNQZxmKnRokwqeOWdj81VYQGuq/YV0CXozCYH203pzmLJ1v46EIMWi7jFa3AoWzkyxGc1d+c+FT
 bJmTOvTCZXUFU4aRgMXl7gZJX5IISsDGzG1V9Ln5KukyiMBAveYVKoKtWDVuHEuHQQ0og32esdr
 h0zcIJ6mCQ5q0t7iYLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054

Add compatible string for video AV1 encoder clock controller (AV1ECC)
and the corresponding bindings for Qualcomm Glymur SoC.

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
2.34.1

