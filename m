Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ADA3D8900
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965317; cv=none; b=R0BKqzGjEBz/sxotINx8eaqHIrKtwCDu4mu9erF+F4rOjrIwZUPyScnAdeb7GlJVQ4nDDFe8dH62221G0NmTLf1LrwXr7fSkHMtpGhDM5NHbdp5fVCJuy7V+y21giTpgz8f9I2MK5RcKkxV0UqG/U9ppLAD+4XskPpYXXkSLZVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965317; c=relaxed/simple;
	bh=u62PmuJsFC53eibE16AfNNhsuEadr/Bcjjx+Id9tJAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZjXmE/istn5mGQstczIwI5jP25H6jJVoxzU831hMPedZeAdExiI2ME5OOposHG0CBIl5nnPQAscciv5j6289+NJFnwZwvKAhNL30/gHu2oxurwd8C+2GvghPI+zwNvPKOCUvDsndmFkDhb8fT4tSvY6o0up87FAn5c+VKQdyPB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INtSzHHb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGJ5M6dd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INtSzHHb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGJ5M6dd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454hXlS749077
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 07:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GNzLk/F53WBl/rRiE34Stecm2fn5k1JBi+j
	gtwl5zYo=; b=INtSzHHb+MXnQ8S3/6AXKi6M8NPaz/Zc5XdjEKBWk76TpkwegUS
	4m9cqzIIKCCusmGh5JnfsO8bYo65WAUhlBFVfrNavDGOt6RU3/AaMPwOnbRy/0PN
	VoFcTsaivs1hgX7vcfljo+KSU5polX/2kGyS06UBe4/2mXdWXtVlKNd1ej+Me1ie
	M2c/9pfziXaSPnZ0Eh8Rkf7o9EzHazq8nmeYHzPghwcGtdESzZW54p+U+9zBKUZX
	Jb/gNTv5om2BHY393hjQ+iGEOtbW9COUn7Tlwor+QWAHEHQ9ox3ebzOkyvuIUj/O
	5cT9lbn2fOqipW9KwLVugA9F6Gzcm2AtLQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscf3uyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:15:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51306c1076dso16557391cf.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777965314; x=1778570114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNzLk/F53WBl/rRiE34Stecm2fn5k1JBi+jgtwl5zYo=;
        b=jGJ5M6ddOp2zEgOgy3irWJceC9B+A9zeJvgZZ0XxR8ESnUua/4wGg/VbfaGLT27o7k
         NrXBTP3UzI6C6O6qfwEbDryBn/5BtgT8RU4Lz8ur5qblmnSboaUUlHFIPHlFoBlNugzR
         9sdkmGKaPWrhB+uppfd7hjKX+vTvRuA0zJ47svK5LwAd/ta2V/CcQiAA0lCas5UKsd3x
         kdcM4Px0alsMpFtMCcaroqbl2fIpI3FAW9A0Z4B30C+2hq5acU3b28M0GT5PUl2VZCrR
         Zfh8zvBT+EJ0/OiIR4+lnVTPMmGeFWFGtDQd99kptKTkHlRBAxitoFTsy7OmQuFYu/j7
         d9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777965314; x=1778570114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNzLk/F53WBl/rRiE34Stecm2fn5k1JBi+jgtwl5zYo=;
        b=OGaGKq2x+g1AoyWwxYks9/797oGe+BVVr5nwpJwXZCcd+clRgcee1IvEW3BhVx4B8p
         9TO8ecHu8KrgfD1TWAn7zVxPqA0uya16DUoV68G9uApLz5QdB4wZy5UiyS6l08dbgNH6
         LOPUL3XzaUh32yGpZUDxD6cviDmrCeXH+0FXBRk7Z55MXm4EO2d3H+3FAlTbZapNi1Dt
         iD/+ZdUSoQ+th4bokevdbDlbbvjDB96hhQbzK5vSz0pxqYKSumdKFWe/kKmfi88yhOhz
         Q3b6Eai0Mfsy0OLeUfoYg4CqUoPd9jbl43W8lA5O2XPIGuzyNT8QGyrNJuOMA94byMM6
         D4IA==
X-Forwarded-Encrypted: i=1; AFNElJ9tG4Fy2fF09LSfCIkm/9QJS0R5n+iFArdkYyd8aYkkN4kt1cSIR/mt3Iu/xYZWPJZEldvrXk+yvQwd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf8ewQIqg3MHPgvDoY33103foY5wZRBn7E/ObSoWPzFiinH/78
	xd1rZ70WLqHdZw3B2ACcVnBAgdsGiBNuWf9KuK4Dd0JDlOzTwPg9lYBWxi5BKX2qMNMDTrfz4D4
	dS3EyWCznOKse6+94lgvCneT6xJhykNPnmsFq+xhOw18SKKSJWvuUxT4DOmY05AWJ
X-Gm-Gg: AeBDieteJgcuaTc9Qj4CeL9NfS7SSntYEqY8fO5oiJeQcv36Wcz3bhlNQulJwDDPutU
	dGy50mg+jWfZqsCieq57AAScB+zFScazRxVAf8sxOAyJVJb4lmGjgQwof7FOkHMzbG8r6PrXiVo
	97TH13KCbn3zw5nFytpwoWFrG+LNHX1WZiJgTrNbKW5AzZVvLzD2F1HApwpNOBNKdsRvETT2bdh
	kREN8/F7pHtdXAyiqz/xgA+vNdFAMDG9Nl/5BxQisT4zDejtHz638byEcLoOC4yEPXhLDsBNp83
	FdfTHMOoHGJWJYSXXwlPqg5tinDAzuF91jUJQh+F/v+YWuzzNsLx8zXFvjcSgYH9dtnVRhVKRFe
	M0Liie7xnEKmFJJDPZ/CweLntyVfUhDTWlYX2VnDrMYKnnXw=
X-Received: by 2002:a05:622a:558a:b0:50d:86cb:db75 with SMTP id d75a77b69052e-5130695bafdmr28103541cf.7.1777965314046;
        Tue, 05 May 2026 00:15:14 -0700 (PDT)
X-Received: by 2002:a05:622a:558a:b0:50d:86cb:db75 with SMTP id d75a77b69052e-5130695bafdmr28102171cf.7.1777965313243;
        Tue, 05 May 2026 00:15:13 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02f76sm2210535f8f.23.2026.05.05.00.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:15:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm-smmu: Constrain clocks for newer Qualcomm variants
Date: Tue,  5 May 2026 09:14:54 +0200
Message-ID: <20260505071453.34000-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2935; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=u62PmuJsFC53eibE16AfNNhsuEadr/Bcjjx+Id9tJAg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+Zjt0XAduVeRYEa/7OpETJeNBP8D6y9vWNM/T
 +QqfyGIYXyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafmY7QAKCRDBN2bmhouD
 10jgD/9J01XMkz+LeeUYM1W3mC4zKGc7dGAm/Bx2FVH5akQYlMgkbIEpVS3Ogc5mjsITedSD/j5
 fAubOMCzqSwc2ruOoFZ91lpk1n8GmKMP/6bxoN6BhW6we+pL2Vm+xGMv5vALlYN068vZDIdbjpo
 pBvCrzDFA4w4WR9LwXdRLcl+cfQS1+QO9M2mj9GTQ4g28e8xeeQ7KblUvrJzNd31BdijCzqZ+XD
 MVsWQopo4t14DN6sJ9w7lcvcrTHVvmI7X1y8yHacfBZL1g/Fsh/FCTXuK7nx0m8/G5HUM0F9Ug+
 FqtZ2v7FUmMXdjofB4Z1rDwkaOCPB4nkfrmpJ2lX500HpfVpoZ329gHBTM/jI3VnhHoVJztJijI
 NxRm6vahaM96AZNQigFNbW9OvDZdMIkrnGvS6T0JVNSyZjBiOvLV4LdM7Vh6s8XKS4KFDVWWZAD
 0doyi+nw+f0zPC+InA9rAh1mfzqE4iHeRORws3iql3WRXhpE5GVFxEnu7GT+NAlMz2/w93oVVR/
 3gWD2YdHd5d3VBGARjGq/9QZVtbUIRH9CsWC26wqoNhwDrqXV3OohztPNRjGe0gXGdwBgs1HPhM
 /+yl6YtY17BKRzCWqex282CV4nnU9aiZBkHojfXwT7A0a9eS76vUZz1/GeEq3oWmoLkL3NdHVAh RX79Aam2Vbn40zA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BcvoFLt2 c=1 sm=1 tr=0 ts=69f99902 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=f71n7wxJgtiWRlcSn5MA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2NSBTYWx0ZWRfXweYlJw7MUhtZ
 lGCA9kZocLPHQQ8I83duNdQ1lra1Q3M5RWgMIeOVvYNEEPLeKUqiW7BhRaRuiLpDmElZYqt516b
 lUGtfU773PbWSduECP9AN4IBlnw5C2y//t3tAV2kcAJieU2NdduAK8TjBKJvdV7sYGHzNuZKmZ4
 dSR0gMQhcco12ve2Xyhvl6mXn/exk6bfFiRdeBWQMGtExi7R3KOXCPZHTqcOGpYRMu9eAkkeYsy
 EjhekAB88dFkY37ormx7PBIoiEd41q2PelVod5GGi821pJwVcHxiY8V9pf502qdFW8+wHoLY7Ci
 NSmKKrFrC/r6FTQ+HCeB6xr4cedi/aTKwsqlK4heDobjyxTbcv0XCw87lLM3orCYPmEwd5Ddv51
 Dm6HMJYs64ufl8BMLH3LnYZfCcsU/BWwlTb1KJLtYEjIcgwpWVzSzpM0QUA18iGY5td8B/vjfbs
 3aVCk+Usz1EAp3hbGmA==
X-Proofpoint-ORIG-GUID: A3XfS-cPzP2xyqg5EkO63qsBbwzd6SQl
X-Proofpoint-GUID: A3XfS-cPzP2xyqg5EkO63qsBbwzd6SQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050065

Many of SMMU on Qualcomm SoCs come in two flavors using same front
compatible but a bit different fallback:

1. For application processor, usually without any controllable
   clocks,

2. For the Adreno GPU, with some controllable clock(s) and using
   additionally qcom,adreno-smmu fallback compatible.

Add missing constraints for Glymur SMMU on Adreno GPU and several other
Qualcomm SMMUs for application processors, to restrict the clocks
property to a specific value.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

