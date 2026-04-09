Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19C13AA4E2
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726502; cv=none; b=MDHUbajUqB0gh1XuXOrPyyOkQm+7JEVBxRff2jbg1HD0bu5fxjZ2fAsnjh0YgAsR/sKE2cqBAJKR6YtbgUMN2XwKGnjS9jNSOsIF8OB8a3h5fuDrNtr82XC1xb5JKjvf0inXqEnN/uljvU1yKNxvDFbaLiQJMdEhFxF0qhipUH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726502; c=relaxed/simple;
	bh=9LVPDuJ+bbF3M//gO5UB8E/RBRqneTorEHz9vTPLB4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nb7HxfxadwGt8qKmcjQa7UFqLLHyXhXUKtjryYFDpmPzf99k546MeMQ9FwjNCons0KSbBPBzwblO6hn2xW6MNRhceUCAA5V5toP7Q27zXU8vAa6FBA12khufwN/sCkT5HPqTJ9XdbsVr5Cmj0d30Zk4WwATdYLT4cXuTl8h6mzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+4jdapk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqEpphxe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+4jdapk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqEpphxe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6396v5xl674881
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=; b=P+4jdapkl4NECgSf
	+oXs3ETcyEQR4PKBVeaoJGKDjTsIEh/IVjtVMER2NN9y4drEERi8pijBvfAxZdJ8
	HjdyY8YWHvnk6MOW2Pm6NnUXIU2B2cGpDWFQ8OWPfXwp0K6NOwzt1C7P8C6ni1PQ
	IOTmWCxUEeJ23I2r8MKrZuJ/EcvPw1VotrLcUMOpth0Guk5cKMeVURQZcrhJnBwZ
	9sFZN5tC1neXIDZcp9HsXrNuSXi/eK/Ijylbq9geqXMmL71rdrmih7aoKMYnLqio
	TIQTWPqb73jdc7sIpZQEjhJn6H/MmpgQVisFdc+kzK4wuzdJyFklx5gVK566QQRj
	W3YCVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtbmuc4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:21:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b23c909256so8447265ad.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726495; x=1776331295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=kqEpphxezovsIJXRn00/R+LZOiDw2yZsNjsFQGkyUqjZRqhFz9dbg25u7m8GpCYmFs
         7DR2Cg0mVyb+2Q5+KAHRDL63TpgmKqEyrXENJicYMwvCm63Dxwi1a1w3mDIVt6bc2Fkj
         WKEyHgeZfIPkTGeOkWvETVKmw/Shw0njA07hgA+sodLGxmIOcF67h8SuKjaxw75STHRm
         d3pg3W5KYcW2+IwpxAonyuTQViaN5+VxXVXA/E77JFebcXeiYzpltKo471QxtkoBUujy
         5DSyfVGejOblDhIbXi3epWoOIjGGS9yF+67f8uisgDliWXqF4Scks7uJGdbZcHrBLx2q
         3niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726495; x=1776331295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=Jaqa1xulC4qpQujT/ABXhJ6f+mB37UcwSJ7jiaP9kvsnE2zMb23gyxK6VD3XOjjBct
         erm0qgkGevA8psVCCRb6IrulMJIxdWwhyOOeL0pr40f8l08usB6Lkzo+Wr3NthC5eztY
         dpFhHlT80zGMsRBwzJAQI3GjibyozAeupvSERan6ejaUersxYnY0QsAol7AR5G5KlUJW
         jNm2hENJed7ButpKP4Kat4a2MgFDJiTZkWBCoov7yubxBbke243Kq6HXrC+EzKEavQ9+
         bijjD9F9KKREv2QwuoFSS3eiV7zw7vBguS0P2ivEweYVHcdOetzMyRUnjE9A8+EUSGhD
         Uo3g==
X-Forwarded-Encrypted: i=1; AJvYcCVklRgbLHgJQTzF5HK1PUWqd6/5zcgvTWtcFGhdMVGgn3lQSmrhq9B9msNBCbCnc8vdNwnU0QcdWO2D@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2puc4orqqOhkvYcXxZIlwg7FG87x8u79zyH0bsWdZ6XHBHrJt
	yIZL3Tkp5Q1InF0gf6qBsrmBliq6TAiOqT/177+KCoK3x0hiNNOaCoCW6XKTjHyk3tfHQVbgqMM
	DcHJ0QvE7XvFqWmompqIJXV7tcj7+tlHxKyTjnyCr5xeh8PvGyIUabvhE3DWejd5a
X-Gm-Gg: AeBDiesoY8lyqpfgaDcb0eerooNBXfqKIuOXP2ZxLpOiVot6GHPcLKviYW14g4Zz2OT
	NFJl+829moJJqdQQRvjVhTT3mhTqhDychGxPdLUyYaIPKsNJhaDOUB18RXvM4I9p1Z6MR4uPqiN
	fuhqi3tla+2oo/OF+GZT2SE2LHUe+MuPcbybX3AzuVwADUj4SXujkXO++yKGOFz46JlHXhmMXPc
	bb/PdZNzSSNo4G5ffkrtCu+j4eV0H1DZhStB8K1zbQB5XwpeRx9o3icmFoB0A4+UV477+ObqAon
	/dfbVYmDBSMB9GdE6/2EC7pEVo3DpzhHLeAPtRA04qr33Elnp/ZMFKoftI6TU82A/z2h8Q8gEG9
	ykLP9NOY3Cv1Axi1Ttj75m6q4wseoJDdHGrE2iHDmgcwHjI0pKIJu
X-Received: by 2002:a17:903:2c06:b0:2b2:4b4e:e4d8 with SMTP id d9443c01a7336-2b28164c3ccmr261183345ad.4.1775726494751;
        Thu, 09 Apr 2026 02:21:34 -0700 (PDT)
X-Received: by 2002:a17:903:2c06:b0:2b2:4b4e:e4d8 with SMTP id d9443c01a7336-2b28164c3ccmr261182815ad.4.1775726494146;
        Thu, 09 Apr 2026 02:21:34 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:21:33 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:03 +0530
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-1-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: gjxf6xctFgm9CRIkDuoeuY2xyJwW0xeg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfX36IE/tWglvHa
 tT12pzwMgEPO2+RlT+gaZUQ9wh+NLmIrV2W/h5euCh8UnxAuR3qQljMc9d/TUTz3YWD8bniANHN
 5T4IvbEH8v5/Lb4Z98rAnZHM3bYYYlpF+O0saLMOE+XCLQQ3xgMDGMSqYoeJXxAkBZPXJ79GVFO
 UnvxPi6Ys2uDqx3vKvsiWhV7gjmz6w3tQRq08LSinhy4bGVsIsAvQp/nC0gUmE8O8RNkyqnQObQ
 oa+A2L/1ByDjNeFFJ/PgAzJ7bf10zsyRsOomWE8BEnWw9A0DMeKE+amabCvo0pRfRnldF2RFmK8
 esq/i9RrJoli76LO/ZX55FBD6HFnHpTUj4BTEbQFmWoy4K+QIKhtwDW3NOvLvnDqtDCASScQZjV
 F6NIQtaQXAuTuuQKhOSMrFxobjgxEpGKqNplqkxMEQZ6SWVhFAkdllMwTmMSVmIRb808C+UqRa8
 l85kn8iY6J/9+RsZDEg==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d76f9f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=F2P3E8UZIP7xQym9adoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: gjxf6xctFgm9CRIkDuoeuY2xyJwW0xeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090083

Add device tree bindings for the video clock controller on Qualcomm
X1P42100 (Purwa) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,x1p42100-videocc.h  | 48 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 7bbf120d928cc506a4f7aaeaa1c24e5da760e450..5d77029bfaf8830e2bc0c3b8f323c818ee48dba2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -20,6 +20,7 @@ description: |
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
+    include/dt-bindings/clock/qcom,x1p42100-videocc.h
 
 properties:
   compatible:
@@ -32,6 +33,7 @@ properties:
       - qcom,sm8650-videocc
       - qcom,sm8750-videocc
       - qcom,x1e80100-videocc
+      - qcom,x1p42100-videocc
 
   clocks:
     items:
@@ -70,6 +72,7 @@ allOf:
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
+              - qcom,x1p42100-videocc
     then:
       required:
         - required-opps
diff --git a/include/dt-bindings/clock/qcom,x1p42100-videocc.h b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..996408d1a0c32e175e5d4dd65c09bdc8dd47dacf
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_MVS0_CLK					0
+#define VIDEO_CC_MVS0_CLK_SRC					1
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				2
+#define VIDEO_CC_MVS0C_CLK					3
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS1_CLK					5
+#define VIDEO_CC_MVS1_CLK_SRC					6
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS1C_CLK					8
+#define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC				9
+#define VIDEO_CC_PLL0						10
+#define VIDEO_CC_PLL1						11
+#define VIDEO_CC_MVS0_SHIFT_CLK					12
+#define VIDEO_CC_MVS0C_SHIFT_CLK				13
+#define VIDEO_CC_MVS1_SHIFT_CLK					14
+#define VIDEO_CC_MVS1C_SHIFT_CLK				15
+#define VIDEO_CC_XO_CLK_SRC					16
+#define VIDEO_CC_MVS0_BSE_CLK					17
+#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
+#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0C_GDSC					0
+#define VIDEO_CC_MVS0_GDSC					1
+#define VIDEO_CC_MVS1C_GDSC					2
+#define VIDEO_CC_MVS1_GDSC					3
+
+/* VIDEO_CC resets */
+#define CVP_VIDEO_CC_INTERFACE_BCR				0
+#define CVP_VIDEO_CC_MVS0_BCR					1
+#define CVP_VIDEO_CC_MVS0C_BCR					2
+#define CVP_VIDEO_CC_MVS1_BCR					3
+#define CVP_VIDEO_CC_MVS1C_BCR					4
+#define VIDEO_CC_MVS0C_CLK_ARES					5
+#define VIDEO_CC_MVS1C_CLK_ARES					6
+#define VIDEO_CC_XO_CLK_ARES					7
+#define VIDEO_CC_MVS0_BSE_BCR					8
+
+#endif

-- 
2.34.1

