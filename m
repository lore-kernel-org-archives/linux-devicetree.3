Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EAF3CF218
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887832; cv=none; b=arYyy6iDXAs3hhwy4tgl052QgTjzFpi0YhZke4abkD2opMyTu1VCqmxKPZyzP+gTrl4cdiZN+720VELZWbDAlZ/1fp1nmg9oRWj4txk6dtIgzDn//qyGWYDgdLX3zFeQWJeWXuZf6DMAcpw/XvDNshih4mitQGBD90LszhAkvx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887832; c=relaxed/simple;
	bh=YdR1uDQI01UrRdwjInrusY38ih3+WE1QOwNiA9AQEuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LUJZzENguOP7leZQfPzSw7DAI1eKIzyDL2vMMVvao8JQ+ZdzbhRssE+jGGOq4t7r9yEMNWbUl0jAEzunhQ5rMKVwbe46sgsQIHhMlvk1e7j8ImqU7grTKjDnEysVzASr979V2kVK5UnCcpkhiGNukRaerFlvxI4AMTdIdrrcQJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mh9jzjKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrVikdT3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mh9jzjKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrVikdT3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4liTH2099582
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=; b=mh9jzjKGsB/DiC4o
	AHqChOMcGUTnLwKKZOGQ/ZC2Ujqy3DWlYADe+/VzgOtOQBenU9CSnx1j0dZnpmjm
	O98WdvGS9sNWqx7BvoSni5Wy7HoUnHeUWdOBtQnbJHAVT5ZCnWayvh3d3GgCVCqM
	BDCUFWQyhsftlrItt6YTQ8YvTv5nheKm3R6HSh8J73YCzW0OAlvr29FlVHEIYFmo
	BBTLYrtG17jGZxoVqCLwVtm4q6iKq5VLL3I+aXT0bVXkQHbWSofh29CEh7P8L7FO
	BnQKP5radSNh6EE5Y5snmOu8acX6rd6eSNloToiT0jAZZyj+hP65CI39xBbNPuBd
	EDO3Ug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahtf6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso5089245ad.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887828; x=1785492628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=;
        b=IrVikdT3etO4DKHTLpfdiN3fwUM/Z7EERXoJazBYZ2bOIAug7343JFLrMq1ddguHHI
         s3FTAlklxOaZGF1RJFdgJjAagzOKNzEgVN4vLX7BGs+X53R//qFFOUHS/NqO7d9ZCXlu
         sxz8/rRHjpRmttieDWBIbgTDH/Jmf0va4JsKjdBtJ1hQ44eT5XjEnY2YG/dNmRA8yX5N
         NGWnOjbm6uw+8n6VSZxWeS4wmBFV/Imh3gur2Ik/hd1sanzDcbcRQajw5ubykH4TFp4c
         7IrXe+H8buaku69LfwLraEq4ieL6ZYad0nOFQflkT1EebEjFigZ04h7n+0bD7/+NpmCc
         bx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887828; x=1785492628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=;
        b=pACVsr4jxmLv8TDaqvyEidZliZ1SAU7fwKxfnQDSUNhsI4VGCvjN9rxRBDhBsRYLXF
         143kJ9uneJpzfHpCzisIdHRkxuKE0fKy2SOsipHYiTtnsaDVTklKe+R25kGp7rQseT68
         TIW+LOPuRIJGzkIICbLbCkGBMj3/hvBAkHqSzAygrEituXMilyHolNmrnsdrD2OltdAf
         xBcMSD2CRjJeGpdQZk15vMKkni7yyyDXtazDpg87yDptaXB4OMROmZDFhJFh2t3lIVUt
         3BZIgDddcuZAXv6X8ijScDe5OUwUPn1prOIfmxeuVIh7BUN1uwEzg2dKvfspcA9Nfcbk
         lYQg==
X-Forwarded-Encrypted: i=1; AHgh+Rqr0yKQwpZ+KbOfbeXwCA65yktl33Uv5qR2SN5UjypT8mi2+R1wqFFaoVpyeiwb7Lswjl1HlunQj6wK@vger.kernel.org
X-Gm-Message-State: AOJu0YwtB9BUBQgU9VUq4aeayuPQYdC7jcpl8tz9g/INU6xUhj8k1eVf
	Gk9KBLe/u/EZ7+dRjsRdb6mznsVF6ktfMohRJznGF+D8aaH11rKtpgs80cpwGVBtnyEnPjN+khL
	/COEh3G/p7VSofvZ/dEgUKw7tEiFIti96xRjzAqcZn+U+pqYaGJWkhpBT+jVTpC/L
X-Gm-Gg: AR+sD13oDf4zcA2pFTlZDuT1NwyJ30JGzuEiTonGliWwb+MYcQVqZ6ceL8tzm2yIa+i
	r/mh9ZXzhtsD75Tg6R8/cd9fuwvrfbCzjMzU1LwzOQTEgEMUz1SKRo8YtE00nqgxDjW2XZ87zV9
	iO4KWOSrTmsyhWU4sMErxkm+LYKZABvlqSEOCam+M/OnD9V8Go2pqrhFkTm32Ij5EFD+JWqrKoP
	IngHcwb2QA7LpqVbXn71LuAjmGzh9nqsX1L7BU2ZHdCY1z+/aXIG2M+KlhUDZc1AIYsYV6l7Cg2
	mwKvEmVnybvRlZfsXqdEOXJ3OzrvfOUZUYO4ppXD6PUg6k/fBAQZmSU2GegDyPjVbmPl5irQDw9
	2aFCv8lU8BD4M7KS97W3b/JpP
X-Received: by 2002:a17:902:f60c:b0:2ce:6d4a:5b8a with SMTP id d9443c01a7336-2cfa71ab5b8mr78683705ad.38.1784887828583;
        Fri, 24 Jul 2026 03:10:28 -0700 (PDT)
X-Received: by 2002:a17:902:f60c:b0:2ce:6d4a:5b8a with SMTP id d9443c01a7336-2cfa71ab5b8mr78683495ad.38.1784887828198;
        Fri, 24 Jul 2026 03:10:28 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:40:10 +0530
Subject: [PATCH v3 2/5] dt-bindings: clock: qcom: Add Maili TCSR clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-maili_initial_clock-v3-2-45b577241c91@oss.qualcomm.com>
References: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
In-Reply-To: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfXyzHtPFRVfDCY
 U+ASSgUq4guFgiTAJVjl5e1xcstDw/zjVSSMeYB9pwiyxoxkXBzkT12goTkaoiPB2qvqutGStGo
 78oP8w8qbhKPaA3MbkgpXe6L7eAKVMY=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a633a15 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=e1wQWcbTFuPEDoJv1qQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: u0lRapLtLKdFyrZUsMbH3Wa-uvtN_m7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX6hOsyb556S6l
 eCen5kMnAjazzJcng4lQVnx03busIiFlsghyhellt0142XpKHCV3YfII1dk60F7B9vfRUIAO4SO
 D6uRN9f7xaf/v2nyXwiDwqobMXS9cWHOSXtKOQ2o9bgTXxccgIO4VmDENw+FkoXEshwTSBAt4rc
 wG7SRP3+x2z/XP18JjEM+BFXT3uvq1hHMad0y6kOaX+mdjlkf2djwYqdepKH9qOeJPeivDO3coa
 3236Od3AaRKGmPO/mVWdf+wfXarKlX5ZclFYzCuNpXtXbxocZhy83Et62xezhvWXupl3d2V1LpP
 E/bLdO2ZuCHjYI4yGK4PdDC4c6ByDm8ejAgOQrAAfMaAlWLMyJ0PRuE1/YR99VrVTfzGeiRR7Dn
 qTHU0qBJcrxjZsMExfdDNTSeDFIct0BfxFlmv9j5egVJFBNOAE43FmiCMKU3JeFICmKPssu2BQE
 3yHoK31HUEb00k2A0ag==
X-Proofpoint-ORIG-GUID: u0lRapLtLKdFyrZUsMbH3Wa-uvtN_m7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092

Add bindings documentation for TCSR clock controller on the
Qualcomm Maili SoC.

Maili is a derivative of the Hawi SoC and the tcsr clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi tcsrcc driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 34 +++++++++++++---------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f84897358f2f7eac58e282a507c0489b5bd..15bdf055db3c012ea98217a0e7ca729ef41071a3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -25,20 +25,26 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,eliza-tcsr
-          - qcom,glymur-tcsr
-          - qcom,hawi-tcsrcc
-          - qcom,kaanapali-tcsr
-          - qcom,milos-tcsr
-          - qcom,nord-tcsrcc
-          - qcom,sar2130p-tcsr
-          - qcom,sm8550-tcsr
-          - qcom,sm8650-tcsr
-          - qcom,sm8750-tcsr
-          - qcom,x1e80100-tcsr
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - qcom,eliza-tcsr
+              - qcom,glymur-tcsr
+              - qcom,hawi-tcsrcc
+              - qcom,kaanapali-tcsr
+              - qcom,milos-tcsr
+              - qcom,nord-tcsrcc
+              - qcom,sar2130p-tcsr
+              - qcom,sm8550-tcsr
+              - qcom,sm8650-tcsr
+              - qcom,sm8750-tcsr
+              - qcom,x1e80100-tcsr
+          - const: syscon
+      - items:
+          - enum:
+              - qcom,maili-tcsrcc
+          - const: qcom,hawi-tcsrcc
+          - const: syscon
 
   clocks:
     items:

-- 
2.34.1

