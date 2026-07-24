Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD5C42B303
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890537; cv=none; b=RiupYXTv7EOjVc+JfrYROSHpFQk7wAEGQonflOsn0/s0vZSpMf3/bjUec9EaQEcqrqGcX+KOiPF0R51hO5ofNkRA8q3Q2VdrGhtefpTggfO3HftaZ3ObB1U80iRi2ptM/jLa9cBURKHAW+m6E2LJr44tDkVM2GKrhg+mjs6KGuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890537; c=relaxed/simple;
	bh=GrYP3ZqYO0jYWeOo85HrswVqxCeLX0OVmXBIbiit/Q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kxa6CVwP54NTPbhzACq0+TjL5kpX2mQhfxt0DHx7ZVKQI8Vhwyj2P9+Ab43AnIyfA++wj0LL2kilz1yC/NOTP1mjTKTbwtL89AVgsQkUwUEAfZnODyM7W8fDLT1UclTyH1AHCgn/yKhcPqYVx0JM1VUKFr7D3tqLdSvCsFVOUSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XInfHPHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/CTKQEB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XInfHPHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/CTKQEB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADfMY2629891
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RoOY8YH4kuwLEUEm8Fg8BmxI8udeSnUu1861YN530P0=; b=XInfHPHgoYIQHsGr
	UfYn0mfVKDJlK0QZqTm1ei27j5CqONzDYie0Ai5zmsCPJN1cJvvonVlHiE3Twddp
	kgQdXENG5QoqlYQ5YwB1PPcHX1EJaChQiSNhqLv5eoW0E28m8hkAsXeutrlQa2Se
	Fxuy+Tw3s+m0EbCE9nBmNIooj/hPN9T6jzP0dE7e6+ULMBvdnUQYVVBc0B1YnI58
	2wi30BzkolQh4kiQ1nxUb4WL4MiUUHlj6CiuWDbG6pEsjj/IaSInmao/+K8uHise
	21QcUie7RFGIfzSuW6Kj6B6YFQcuNv1rH1EHp/kR1lBDqn9ZPELQ5DOacV/OpEZK
	yp5xLA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em98up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbb61893fso7369545ad.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890534; x=1785495334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoOY8YH4kuwLEUEm8Fg8BmxI8udeSnUu1861YN530P0=;
        b=H/CTKQEBRZdXcYYInBNdaqxPwDwg7twRqlyC5EnB72t2duMNd+buCfxoc+RHzN+TUS
         VaL43v83uF3tdCuW9WI7JfdidHR0vfxztnfNESSDYsv4Dc37/HuN66QqK19PCdoBDZhG
         D/M9oTGk1Fn27GASLlkq9bfH+ZBcPs//OP0Zf7eC6ldK0qLTB4f05esEZcJmZ65G+tVP
         4qvgdCAPvmTKdvGgNihdGxyE4G0Q8BLLD+CHqI5/LtLjb9HO8kRehKIaZStyYewX/cdt
         nEOlWGN8e8VdPjSVWnR/0na3XCFiEQbkgagCePXNcmDsru5vZqz0zIzITiMkod+TTzFk
         m9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890534; x=1785495334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoOY8YH4kuwLEUEm8Fg8BmxI8udeSnUu1861YN530P0=;
        b=gm2o4TmaQ9gIu6aFwi3kvvRh7841yzwr8xNd626PkH2BkG4YoJMhgTcz84k9mWh7hp
         vt4gPFa0lmIBXrhN3iJMIywuFtAlSRAvn1LMI5T2SY+HDguUYlb6/n8DQ7qncYUG3X98
         HZJoaJmT4ulY7mi+vwcFTtBE6hL70s309po7Or5us9wWuHlky3a8IIkzMbSo5Wi8fAnw
         h3Q9cvkZswi38mRsn6n5ZbWkk0kB3rVBV0GZiTaRz82jLTRtdjzIlnmSkm9rnsRELeWd
         D0QIbjciiabUemb8p1f99FwCsiM+BgVHLmnOxemJjDOJ79JQoJw7h1AzyA1JldFELJXR
         CjkQ==
X-Forwarded-Encrypted: i=1; AHgh+RoabmRGTYXnH1/7HG47UgAzG3TamTH8dueSClQssrw3gtK+LScqDs7Ru0nxcrIYKzW95UC8B2IWoIaF@vger.kernel.org
X-Gm-Message-State: AOJu0YxW94aULTFf2ZLK3VzH6aAPDTpJJEEMlCM91crvY3OORYpCCsBo
	5SfTLjp5R4bvt4PJmmloiTT+EZvPkpTTRsLnD4dYM1yohJaBmH+u3tRUPAdorPJUvWhm4a3PWSh
	Q/bzIZkJX+uuQ+2vPnuN9OhHMPdo6jSjfEyD5mK9C6q3QmzWJS3dSQLzvW0xUQIljB1sozIIi
X-Gm-Gg: AR+sD13OOxDNkjMc9TAg74xyQwZMvucZpFuFql4XqxwLCtxOfbPRA7qTVoUvKFt8ivz
	6tP6DPoqFngQLcBmbHLJVgNabsly67oZ3sZnwBvQnZ6lnRzeCblXVkSTJ3zyI7GUeu6nrjOgNqA
	8xNQX1y10Dk/Mhv9bEBp+M65EnrMi2HJIaGGAJc+jyIclTF5eWCQpuGfDxHrFQ9U/Yr5RudDy0S
	w+LwIi5rbokRYHiVyfbPij/+89C/pZjBSlWDPdoZpdInVIqJjTNzRXlAh2PxCK/0CqXO+zlXehc
	w66z1T9Km7lVIQZp2Ol8/w2Lm/xYuTp6IMhbFwlBnk5Yby89YZs9xS2eAB25p/bo3sYeU3s4S1X
	WceVOECNO2T2rFMcY35JjuoK2
X-Received: by 2002:a17:902:f68b:b0:2ca:bba:b35c with SMTP id d9443c01a7336-2cfa6c51b55mr74231435ad.31.1784890533756;
        Fri, 24 Jul 2026 03:55:33 -0700 (PDT)
X-Received: by 2002:a17:902:f68b:b0:2ca:bba:b35c with SMTP id d9443c01a7336-2cfa6c51b55mr74231265ad.31.1784890533312;
        Fri, 24 Jul 2026 03:55:33 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f310644sm49314775ad.55.2026.07.24.03.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:55:32 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:25:07 +0530
Subject: [PATCH v3 3/6] dt-bindings: clock: qcom: Document Nord display
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-nords_mm_v1-v3-3-32b45232217f@oss.qualcomm.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
In-Reply-To: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfXw779Yq1RqCQS
 ncbv1WtgY9tro9xn8GQZaOT8cW9Jk6VRTnPxYEBQwOIUAUStXRThjEYOpgfWjAFbPhhLmJshF7Z
 GTNffdbdDPB3KtvUUTGfN8f4EHjyBjo=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a6344a6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=IMvGRSTzsc0YZ_F2ARAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: eNOb-twzcSaXW3DMad0exFNFBze5PeDX
X-Proofpoint-GUID: eNOb-twzcSaXW3DMad0exFNFBze5PeDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX+jcd0ROOrtJz
 OGJiZC3dDy3xJ53rjdL0Z8RfVXSAMDm4wmKjnKPeWr7og/YrCmkN2wr0vna4f24CR3uPB4AIc8R
 r6ZYcACnJ7d2G3WPbMPcVfBUopI2dAEzgrr0XCZOP5u2Bcg397hQC76cFhZqk7mliKk8JsDfJkz
 ozOLsYnwoUQCDuhR/O+38vMpRgFQS/jbTp1+Mj3/J06K9cw1KSPumZRagGklXBPCipJ5uKa/mWw
 Qf6mnwBIirDBQny6Jx6kdvuCN3ldHeN2K2QAWtCadbgk4X21/YSra7R7U+s/wMjrgNr53RwUUF4
 N/GQ9Bi6jOoI7inZgxZwmPrHWgVe1qGPF9B+Jj5wu5pTW/Fxn67fG6CiCTC3XNxzQmWakTebFDA
 3LuPJcsRzqSliMVkj+GrGfOwH1zo3f/mquMF87my4bmvOCdCVQxXANM9HWo5dhSdwL2Z2OzsLQl
 TDl2VPRoIOhsvZZ3O4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240099

Add Device Tree binding documentation for the display clock controller
on the Qualcomm Nord SoC.

The Nord platform contains two instances of the display clock controller,
DISPCC_0 and DISPCC_1. Update the bindings to include compatible strings
for both instances.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   3 +
 include/dt-bindings/clock/qcom,nord-dispcc.h       | 115 +++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index 591ce91b8d54dd6f78a66d029882bcd94b53beda..61f58fbd5bd21c7f36081e7ae066176fd19a5811 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -16,6 +16,7 @@ description: |
 
   See also:
   - include/dt-bindings/clock/qcom,kaanapali-dispcc.h
+  - include/dt-bindings/clock/qcom,nord-dispcc.h
   - include/dt-bindings/clock/qcom,sm8550-dispcc.h
   - include/dt-bindings/clock/qcom,sm8650-dispcc.h
   - include/dt-bindings/clock/qcom,sm8750-dispcc.h
@@ -25,6 +26,8 @@ properties:
   compatible:
     enum:
       - qcom,kaanapali-dispcc
+      - qcom,nord-dispcc0
+      - qcom,nord-dispcc1
       - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
diff --git a/include/dt-bindings/clock/qcom,nord-dispcc.h b/include/dt-bindings/clock/qcom,nord-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..219facbbda106488d3f00391c9e14cb584fd12ff
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-dispcc.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
+
+/* DISP_CC_0 and DISP_CC_1 clocks */
+#define MDSS_DISP_CC_ACMU_CLK					0
+#define MDSS_DISP_CC_MDSS_ACCU_SHIFT_CLK			1
+#define MDSS_DISP_CC_MDSS_AHB1_CLK				2
+#define MDSS_DISP_CC_MDSS_AHB_CLK				3
+#define MDSS_DISP_CC_MDSS_AHB_CLK_SRC				4
+#define MDSS_DISP_CC_MDSS_BYTE0_CLK				5
+#define MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC				6
+#define MDSS_DISP_CC_MDSS_BYTE0_DIV_CLK_SRC			7
+#define MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK			8
+#define MDSS_DISP_CC_MDSS_BYTE1_CLK				9
+#define MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC				10
+#define MDSS_DISP_CC_MDSS_BYTE1_DIV_CLK_SRC			11
+#define MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK			12
+#define MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK				13
+#define MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK_SRC			14
+#define MDSS_DISP_CC_MDSS_DPTX0_CRYPTO_CLK			15
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK			16
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC			17
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC		18
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			19
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK			20
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			21
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK			22
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			23
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK			24
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC			25
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK			26
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC			27
+#define MDSS_DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK	28
+#define MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK				29
+#define MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK_SRC			30
+#define MDSS_DISP_CC_MDSS_DPTX1_CRYPTO_CLK			31
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK			32
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC			33
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC		34
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			35
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK			36
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			37
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK			38
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			39
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK			40
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK_SRC			41
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK			42
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK_SRC			43
+#define MDSS_DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK	44
+#define MDSS_DISP_CC_MDSS_DPTX2_AUX_CLK				45
+#define MDSS_DISP_CC_MDSS_DPTX2_AUX_CLK_SRC			46
+#define MDSS_DISP_CC_MDSS_DPTX2_CRYPTO_CLK			47
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_CLK			48
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_CLK_SRC			49
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC		50
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			51
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL0_CLK			52
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			53
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL1_CLK			54
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			55
+#define MDSS_DISP_CC_MDSS_DPTX3_AUX_CLK				56
+#define MDSS_DISP_CC_MDSS_DPTX3_AUX_CLK_SRC			57
+#define MDSS_DISP_CC_MDSS_DPTX3_CRYPTO_CLK			58
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_CLK			59
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_CLK_SRC			60
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC		61
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			62
+#define MDSS_DISP_CC_MDSS_DPTX3_PIXEL0_CLK			63
+#define MDSS_DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			64
+#define MDSS_DISP_CC_MDSS_ESC0_CLK				65
+#define MDSS_DISP_CC_MDSS_ESC0_CLK_SRC				66
+#define MDSS_DISP_CC_MDSS_ESC1_CLK				67
+#define MDSS_DISP_CC_MDSS_ESC1_CLK_SRC				68
+#define MDSS_DISP_CC_MDSS_MDP1_CLK				69
+#define MDSS_DISP_CC_MDSS_MDP_CLK				70
+#define MDSS_DISP_CC_MDSS_MDP_CLK_SRC				71
+#define MDSS_DISP_CC_MDSS_MDP_LUT1_CLK				72
+#define MDSS_DISP_CC_MDSS_MDP_LUT_CLK				73
+#define MDSS_DISP_CC_MDSS_NON_GDSC_AHB_CLK			74
+#define MDSS_DISP_CC_MDSS_PCLK0_CLK				75
+#define MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC				76
+#define MDSS_DISP_CC_MDSS_PCLK1_CLK				77
+#define MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC				78
+#define MDSS_DISP_CC_MDSS_PCLK2_CLK				79
+#define MDSS_DISP_CC_MDSS_PCLK2_CLK_SRC				80
+#define MDSS_DISP_CC_MDSS_RSCC_AHB_CLK				81
+#define MDSS_DISP_CC_MDSS_RSCC_VSYNC_CLK			82
+#define MDSS_DISP_CC_MDSS_VSYNC1_CLK				83
+#define MDSS_DISP_CC_MDSS_VSYNC_CLK				84
+#define MDSS_DISP_CC_MDSS_VSYNC_CLK_SRC				85
+#define MDSS_DISP_CC_PLL0					86
+#define MDSS_DISP_CC_PLL1					87
+#define MDSS_DISP_CC_PLL2					88
+#define MDSS_DISP_CC_PLL3					89
+#define MDSS_DISP_CC_SLEEP_CLK					90
+#define MDSS_DISP_CC_SLEEP_CLK_SRC				91
+#define MDSS_DISP_CC_SM_DIV_CLK_SRC				92
+#define MDSS_DISP_CC_XO_CLK					93
+#define MDSS_DISP_CC_XO_CLK_SRC					94
+
+/* DISP_CC_0 and DISP_CC_1 power domains */
+#define MDSS_DISP_CC_MDSS_CORE_GDSC				0
+#define MDSS_DISP_CC_MDSS_CORE_INT2_GDSC			1
+
+/* DISP_CC_0 and DISP_CC_1 resets */
+#define MDSS_DISP_CC_MDSS_CORE_BCR				0
+#define MDSS_DISP_CC_MDSS_CORE_INT2_BCR				1
+#define MDSS_DISP_CC_MDSS_RSCC_BCR				2
+
+#endif

-- 
2.34.1

