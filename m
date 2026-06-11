Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0851F362154
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207418; cv=none; b=p8kzPTNDAiE+x60RQAJEZKUY51splKFD4kdn9aiYCSf/q1GQcMNpCNese74A1Kb62ol7E1Ereljuiol1MZJ9JKu3amJGIipFtoOhHfqmSnYsHvlE11+y9rmMAb6rlLKpF7p0DqEd0MMHtyhhF4olstn3Lw1Tu1OaEPvPbxTEZTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207418; c=relaxed/simple;
	bh=AVhnklETdUkp5mvKfLSwdbQnYbvNLPhgr6Rf58zew30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+l9Dg84BnKMxXuf9SXkXnHW6iOcGtuzjt4wC//bgFosyuFmFPcJ6lHl7vuIgoSXovD4wQIdk/FgbSYLOWgktMR90OOGjV19x1N9AUE80HLW107SOk4G+BTRcEW5FX4XdE7o9Wn5LdqFCdWFoyOwppFC5evJf+bEsNxzozXurzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M85GK+6K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QpleIJ92; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M85GK+6K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QpleIJ92"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3bO11480022
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+eEO9S0oz313LDlcQk/FLdgkvriU/fqVRACKNw9VMQ=; b=M85GK+6KreNNV8rt
	Ba71Xax3euyM/tHgXUKoNKmzEbufnH6y2iloBrItN46DBGU1dFAAIbcynA0kL4b7
	JxbcDProeA2cONm6xXRw+2aqV+YQEBIUiYEVXU7EuCrNVdBPN20xrhn8Fw4tWZ7o
	jWIdijgwCqBpiGbQkRaS/Gv5NoLXk+rtiqXNLM9zmbVwnVSa9IIRGoIzkL7szGHR
	7dN0alRxVd+VYLNh1Mqyd8tDV7QbdUkz6CS7KlmvCLrHCNMgHwqoV6ZsixhE6K9Y
	ycjw+cg5+CeZeZQ15w9C4Jjc8Lq9vXdjoHMJnX9kf+gaNMaV1sWtHXxlR8JzFLSP
	Y2szBw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7gs5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:50:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8426ed9f24dso836660b3a.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781207416; x=1781812216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+eEO9S0oz313LDlcQk/FLdgkvriU/fqVRACKNw9VMQ=;
        b=QpleIJ92bd3MCy71ama8yV4nfyDeGnjAsYxbDFEXM/9y+22bp/mf7TszjxAgeB+CKF
         dBWBkgL174eAT6xQtb9hSOLPXttAW8K0BlFZ8yLACEI1WiSPpk/9frr3c3op0FHjh8ML
         Em+bXulHOVLFztYkC8aIkw06u4ATlF4Ak3V9v7Ad32wnlLCElka2+3YGuM53ve1TQsQD
         ku5zyKg0obC9BQxU6+V8qNMs04czxWVzf85ceiWQ1KsH2QOOhrbeu/l1dkrziYSgtkAo
         YoLaACvv/zIekIhlgfckh7d4y5aUiHd4/bnpeD9zCkFIWCEJZN8HcFlhU85NGtNcN7xb
         dLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781207416; x=1781812216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h+eEO9S0oz313LDlcQk/FLdgkvriU/fqVRACKNw9VMQ=;
        b=lyNDTROjvlAm3laM00R4MUtMw/pez2zL6QetMzfLyYzas7BUGFTwBrjrtEKgqLmMSn
         tvze1fmhz240g94WmkwjOrnu0oKOc1gtP9bAR8FMwaISFOzO9gvyc0BgU0FuV8EPToEk
         0nAjrVXDsqjqxl+HrxNWSbxFIEL9GYLHBeZ5aJWlA6VHVttnqeTV7LrEry9cfhQ0NHli
         R4n131xXykPJuuxTdh6Tas4bAa01fcLLoURa3voUDZsk8mNx7s5wnMEkv3508Ss1bVqJ
         BuEitvkCEh+EC9SY0ng0K66r+lcd7LHu3WXDoFbdWcG0jAmLLlpESMhhmxuuZo2zrxpT
         7UDg==
X-Forwarded-Encrypted: i=1; AFNElJ/FaDHEtCoPxlJ8Z/g5Uy49FQmdSCMloyWFp/3P9Dc9pnZ4p7wYeGSXhHA+yT/2QecfykROJmz8pNXS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5v7EVGFmH6xA5vwhItXaxJZdBvDZt9J1mSs3lPrWuWKnvxUCv
	3UwRZ27g1CwMmpmXsckhn2a65L3ghazpLNbKeeWBnB/42w/3Piu5hbJfx2nf3g6TNgeRTWTgwLu
	sz99ue9ekKLuUGvravit+FaHpIiprictCu4PoDTbaGj5QyOE6oVg7yoijPvLZQWTu
X-Gm-Gg: Acq92OGd1Kt/BUr+oiHQ/fn6vgJ8B2NBJ01/sRW5DkWsTOa1Iwhv9aYVRZm7Z75vUdh
	nHAoVbTFe+U/0pUKM+BGj3fb0aafsf+AefI2xN1Fi5ddmHC6wTX7Aws6M4vB2B10Dml3aCqPzQM
	HW6wSylc/tO5kB2vDOx3zT5DMbA0dkGFfdiSmjt+tvUHMSFPl1Jx3noMmweASSgn6QwXyQVyGM1
	EBN6jFO9XUf240hKwJiPxR+Hs8py1txH4ofyQvw3WKKUXd2YkDYZ+snNqEwwfVxvrD+dUwm8CPM
	Zcx2hk7emyd1WdwHfDCpWeJM4xxDJZfVXqhdNecqMDQRUzZ6dhF2S8Z9L0YoXJIygSufr/LxL+p
	62uU+Jj+PShSZEixpMVN+Dbng5utL9E+8jT29h+HlX51RWjAmI//3q76M
X-Received: by 2002:a05:6a00:c88:b0:836:6f2e:bb6d with SMTP id d2e1a72fcca58-843495a4f68mr144240b3a.14.1781207415609;
        Thu, 11 Jun 2026 12:50:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:c88:b0:836:6f2e:bb6d with SMTP id d2e1a72fcca58-843495a4f68mr144211b3a.14.1781207415130;
        Thu, 11 Jun 2026 12:50:15 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c93d1sm2711872b3a.36.2026.06.11.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:50:14 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 01:19:40 +0530
Subject: [PATCH v2 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-shikra_vpu-v2-1-bf8727370a1e@oss.qualcomm.com>
References: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781207404; l=2453;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=AVhnklETdUkp5mvKfLSwdbQnYbvNLPhgr6Rf58zew30=;
 b=xvHzaET2RfPfSYysTDbeaqWlhg9S4KsIw/sHRKVu9Rh/LH5C2RPvzj90btuq7UwUZ0FYZvFXT
 egsJIUcFrgZB/b7he06r2YKNzds5iFWi7PWgxNrWXZ7MXzjdJA6glai
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 6YwtdfHSUHAhNX85rR3uur5D9T6DSzmz
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2b1178 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vu35gHCjgte05Dde9DgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfX4rg8/Fjoykby
 JW9/Qikk2zpoaatNwBszR+F880H5Z6gYieOyUNApSDx6z9bKwICLPYtZtEjtuiCqMBk15OkVVUA
 C8Pml3XK+Zxiq0LMna7LdV1351pFMwl9JLvUrkbB82WoL4wd4z+IDPqU4poLiIsbnLh4iLzl9z5
 XB8uruRcaD8UFP8ZoX/T+U6fC9DPfudZfG1iPkFO3gDH6szUoB93zcqjTC9McbT9WyxZC9EykzR
 uWqbdEE3M7Ax/X+7nhpIG9sRv1jcOJRouuq6xDwiZQddgYBql1cwls1w3fFSk2jirVU8lC1Vc1Q
 oIff78RVMm7uyLfXfgwvkmoPKfi7oaMSz+CMWS44mEAKMzLvi8WjpAln++e5Y7THNywBiIr9bnU
 YNR0twrMaSeXncjA+FHxrRYpkQNwkRbtUXyStxXePJABujgdyCR1VjIXJ4wgWyUwzSI/NNZhYb0
 ju8vX0vyt5LkntJTnow==
X-Proofpoint-ORIG-GUID: 6YwtdfHSUHAhNX85rR3uur5D9T6DSzmz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfX/Qe7FaZswV71
 hNplNO2NY+CmThc4TLDAbJW4Wlbk17f89qBQOkoOxQciE8p6XIrVFIOMwc7BoEJYk8DhzOAc47F
 ZAbYM1hrVV50TdE3xiLwpqvJxhzY40U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110199

Document the iris video accelerator used on shikra platforms by adding
the qcom,shikra-iris compatible.

Although QCM2290 and shikra share the same video hardware and overall
integration, their SMMU programming differs. QCM2290 exposes separate
stream IDs for the video hardware and the Xtensa path, requiring two
explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
and Xtensa isolation requirements, such SMR masking is not applicable on
QCM2290 platforms.
Since shikra uses the same video hardware as QCM2290 and shares the same
programming model and capabilities, it is added as a fallback compatible
to qcom,qcm2290-venus, with conditional handling to allow either one or
two IOMMU entries.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 5977e7d0a71b4fb5681f1c2094439c251366f01f..dec7051224d1610b8b3dcb1750152eeda95d3703 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -13,14 +13,13 @@ description:
   The Venus AR50_LITE IP is a video encode and decode accelerator present
   on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
     oneOf:
       - items:
-          - const: qcom,sm6115-venus
+          - enum:
+              - qcom,shikra-iris
+              - qcom,sm6115-venus
           - const: qcom,qcm2290-venus
       - const: qcom,qcm2290-venus
 
@@ -45,9 +44,6 @@ properties:
       - const: vcodec0_core
       - const: vcodec0_bus
 
-  iommus:
-    maxItems: 2
-
   interconnects:
     maxItems: 2
 
@@ -65,6 +61,22 @@ required:
   - power-domain-names
   - iommus
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-iris
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+    else:
+      properties:
+        iommus:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

