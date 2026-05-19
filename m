Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5E37883C
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176484; cv=none; b=Cjbo0HrOX/Xhe7rR/C4yQRpbQf3dqm8Aku53qjrwV7YbiDTs76QKEBEuuRUygHI+ZwNHe9UP1VXC5wMSdtVIp8DFoK1UQZ1CxP1bADUezBSeZHS6zERLduatooa1MD4cp4XzfYriEtmjCX5yLBM3M4zc1w8ErezABUg5uxL5n9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176484; c=relaxed/simple;
	bh=KZnHZBSLSMpB3NoM0qPWgRe3yVcNSNMcooAkdHqMozc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eKn0tlcP/lhrFE5KDZRcXAEVcF8dGI9a7Al8OlsNIGDrz8VCsxXQvf1AEZD5DxCURhdBN14v1pVYw3yj9eywUVf+IAkbFvFJRNgaL8hithbU/1lIIFnCsCYqSE6XxkrCjz0Ez33pgepv/VDX+Wvo3UQbJsEdFQMiOT4rg5N/TJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9yclq2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frMk4llc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9yclq2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frMk4llc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J6gw0P1737398
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKA
	zjC2X97Q=; b=L9yclq2KsTJFssy9xBXjxGmgSevx++Lfe3FTGOm1gtfRa9Ht2cY
	gRGTjyCVVAcY1hkH7scTOvR4OPkPz5LtQ3ibOnGVDEdUWvbTybs0NTEI8p4Udtvu
	/ybU+EqFPJjPXOZp5u77ibbSd1tVDNIVuPnzHrUDOGAYGpkWiCV2RQ5riqg1d6Mu
	6zwGPF2153Vnqf72MsW8GmnC4WZWJ68HaMEY/5wY57INNFwuhyz+mWefRb8QNQVN
	Gx7wY2B8pb+i0myu1tYkCgCqIjT8teNYivx+zO1S82JktFxQGDzwKBNPt9j+QorZ
	rCM4AX5IODk+HeJ8Sw2DTELRLDpC8h4dPUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju907x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:41:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so94546771cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779176481; x=1779781281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKAzjC2X97Q=;
        b=frMk4llcx2CoILqEPL+9flG8s8vKI1hBBZYXLYdRO8Pcr/a1IjvhwEEbQvQRs2yLA9
         nxnK/8AzoJcCYWZXryt/fzNJimeGo6a+j8gosI78gxliw1n2i9cjdNbJYKLO9W9xVt0C
         1qVYqs0XgsqUtvvnvUeMcZSg/erYWGfIOEcrlbYr1N8u+obz2ZLOx3jZZcUdZGC6WA+G
         YKb5gOx5ixS5XUFM05MoRJfRyjIYk9ORe0+svLhCkYHPXmlW4jrfQ/fwoy3H9TgJ4O1K
         7S69dX/nmimmxR0HR4r9t9yJ6UEy23zftb9tXVMS/QogAr+uV/0s7o4yo0NQ4d00Bwm4
         z/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779176481; x=1779781281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKAzjC2X97Q=;
        b=D5VP0BBtA+GolTHoQZa+tnTdsIks8aMDB4/49eKcIqivLH4vrDF3bS5qp/tN7uM5wo
         QHwB2aqdxPpw8T96Gw1/utbBst6m0wursPcR3mouw3o+goL9/0Pe4X9bwnDJfOAGg6T7
         slhfxGjzPvAcDBEk/L/2h/Iab+xXEtiY9OJGQNNbgmrj0RAIK33F/DTyS5AST3jVTr8S
         LdKyoG96MFVJrOzReVrBKG3mNj4s6GUklQeypPa4JdhYWWivg4oncWAPnQNxLlV4bhrD
         Il1Du4OcUOSje0Y1i7P1UlBIyWfZbBT+hcju7F6G/PMjWDInk53rz9FaYI415usM1F+j
         vqjg==
X-Forwarded-Encrypted: i=1; AFNElJ8m80par9XYh4VWZYSTTQASxlc1Tfae/jtLPJ+8RK5/9Zog6M6rCt6LH8+gaIpQA8CRlASqEm8FepRF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XjuB1Z81DRSi2h50Q3Zyvlp5jquP+j9VLVxpXvwh/8KMYih6
	xKxYSiCpIpy9VbpjB0KxoVMfV9+xDBnmSctbJ73fi5sfHa1gwg/HKKniN+/jY9sxYohtBjNev5q
	Fj4jsgxvmqNbjKJeXzuCHus1odvlQhILkHFANabpoeLmI/5iwCaT/uLyXwqcuCOJW
X-Gm-Gg: Acq92OGgWhFuHpcYLqdTvtOKKlYyplKS6z4rQQx0Z61+oTRZ77Py0LVwjgFbt8TTKXr
	hlp32Wku2JeLirmBEByEsEIs1HPTKn7rJfPdoI3zK2Gvy4ERiocztf7X5ucttvgW5IXWeOz8lWZ
	Y1G9Dwbqgu4OKN45lFiZPTy5XVoxcZnsph4qv5zZ//7F+VwNtiyLRNUHWJB48d4vLyYmlCRb5U9
	KTx1XJCqaJy0KllZuLnCAh5qgzqDtzc7l9YYD+K9pKxKZS3ak22UqyQpMGiJqXPVvOH/mq4XCEa
	D5Tpz+Zlf9eUqvtjGnVdkxrZcVAnEsbFNyKU+HgzI/RGJuaS4YgxDE/1+iDVw0XNIISiQxr079U
	5RDdfddUEqXjMMab4EXik8cGSYVIbU7GUdZj/ignMcgyWpSY=
X-Received: by 2002:ac8:5d45:0:b0:50e:a1ab:67e4 with SMTP id d75a77b69052e-5165a2112afmr266765261cf.40.1779176481239;
        Tue, 19 May 2026 00:41:21 -0700 (PDT)
X-Received: by 2002:ac8:5d45:0:b0:50e:a1ab:67e4 with SMTP id d75a77b69052e-5165a2112afmr266765081cf.40.1779176480807;
        Tue, 19 May 2026 00:41:20 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe2464sm44999231f8f.32.2026.05.19.00.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:41:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: Constrain clocks for newer Qualcomm variants
Date: Tue, 19 May 2026 09:41:14 +0200
Message-ID: <20260519074113.61464-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3108; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=KZnHZBSLSMpB3NoM0qPWgRe3yVcNSNMcooAkdHqMozc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDBQZmYb4h9fo1eUreNP62Frw+N5foIgep81TM
 ww/LLf+CfOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagwUGQAKCRDBN2bmhouD
 17/xD/9SxWFwr0hMlyKbr2w5eld0df0vviii88YLL7IVd+nKEcNHKnBzbc2KsAeVLdJTupqLlwa
 X4FvnxFuKmcJoSIOjCcXyLPmiZ83vnRo49bqjv2qSGuQi+mItHaOuJSdQfZM6dBujW1J0kM0xql
 XJzxJsmEJJF48z0GG7lGMmkCzp7hCUhcNdf69m4b8AAu4M/OC54o+gpo5dCiBik54YEOn4SJa7z
 zyBcrxLnRIWtjQEy7U3/2TYuSZwI06XPNUfgwQOcOj4WG4FCF9SVsrdS0YjxGjtqLlWxfCrG/2O
 NHSqkebM6IhcKT5QUPxU6fA06YFEIIwX57SQo64KPXm3NnlWm9TeVyZAIfTxwMnbylZzPgHrffA
 iqaUGMCav+lv1JVFHeF55lC1Mr67fFT2YKasRWM+FayCSnz1f9IcizRxzCeKDb7jNQ1bLuxG5fL
 s2uLrXXV2cg6ljWZL/eYzuKN6WuqwfoqyaCPvNhCioWd6S0IgXg7SRoTrb/NKkkRDYXezqT5HTn
 dpSsA0zefRZWDSMs7RdeXiA7uwRq2HN128ij0HJytyK08/iG+ULsGlZH3mFCpUe0B0Q80HgxrAs
 JlnRuSPX3cCjEGiVCXb0OxFC8UT2YpUSUBYVHrTz6CT6l52owrDlwxmwkEd349Iyq+gZUz1wtQN toMWRpDVtxjKjgw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fSYB7KAw4ODAmpvSHcmW_yZlMwdDzg2b
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c1422 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rJxAMVKw8lswYMJXinYA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MyBTYWx0ZWRfX/OjN+Qprmaz2
 Yu8B1hhUs33oHxDZgHzSfkPYcACEpstbuIMR5EgzYuquWmDYNO/ilgNrZCovzi1BVDTfX8u7k5v
 PXQOZQe2AZr1mKXrdFm5ftxIJA6+7JRNSS28mJBD5GKhrKCDB8Env5NTJDXRAHZhivjl2LQvtSn
 f7f2Q2CSYjEWwSH08Y26ZI9V6D2Hk8MDg4CAC5QNdWyxL2cnLfLrLMHTmR4uK3XQnQY6OlYLoAu
 0yEPKEXO2C7RrVF1/j4ZTP360kyn63ejylmOFTG2o+Fh4bK/gRHwP9syaYWaFoEZdZwanaxEblc
 pDxhRqVR3NgupT+PR/xPit+WU5Cv/dKSaF2x8pfqNSSNEHgdi574XkviWNz5t3q1BtXpcTZF06J
 IPNnSNcIC1NaJ+DxOtpn8Zk6uMt58LkDUIRtKBtSW/PjajXkv5r6akrRu1p2WfmlcKF2yxyY+7i
 YYI8eAQZlh4A6Zrg6IA==
X-Proofpoint-ORIG-GUID: fSYB7KAw4ODAmpvSHcmW_yZlMwdDzg2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190073

Many of SMMU on Qualcomm SoCs come in two flavors using the same front
compatible but a bit different fallback:

1. For application processor, usually without any controllable
   clocks,

2. For the Adreno GPU, with some controllable clock(s) and using
   additionally qcom,adreno-smmu fallback compatible.

Add missing constraints for Glymur SMMU on Adreno GPU and several other
Qualcomm SMMUs for application processors, to restrict the clocks
property to a specific length.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Tags
2. Fix grammar in commit msg
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..ed0d10157bd6 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -566,7 +566,9 @@ allOf:
       properties:
         compatible:
           items:
-            - const: qcom,sm8750-smmu-500
+            - enum:
+                - qcom,glymur-smmu-500
+                - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
             - const: arm,mmu-500
@@ -595,6 +597,7 @@ allOf:
               - qcom,sdm845-smmu-500
               - qcom,sdx55-smmu-500
               - qcom,sdx65-smmu-500
+              - qcom,sdx75-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
     then:
@@ -602,6 +605,39 @@ allOf:
         clock-names: false
         clocks: false
 
+  # Disallow clocks for all other platforms where specific compatible is used
+  # with different fallbacks and only one combination has no clocks
+  - if:
+      properties:
+        compatible:
+          items:
+            - enum:
+                - qcom,eliza-smmu-500
+                - qcom,glymur-smmu-500
+                - qcom,kaanapali-smmu-500
+                - qcom,milos-smmu-500
+                - qcom,qcs615-smmu-500
+                - qcom,qcs8300-smmu-500
+                - qcom,sa8775p-smmu-500
+                - qcom,sm6115-smmu-500
+                - qcom,sm6125-smmu-500
+                - qcom,sm6350-smmu-500
+                - qcom,sm6375-smmu-500
+                - qcom,sm8150-smmu-500
+                - qcom,sm8250-smmu-500
+                - qcom,sm8350-smmu-500
+                - qcom,sm8450-smmu-500
+                - qcom,sm8550-smmu-500
+                - qcom,sm8650-smmu-500
+                - qcom,sm8750-smmu-500
+                - qcom,x1e80100-smmu-500
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
+    then:
+      properties:
+        clock-names: false
+        clocks: false
+
   - if:
       properties:
         compatible:
-- 
2.51.0

