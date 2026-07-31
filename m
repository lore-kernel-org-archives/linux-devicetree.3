Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF233451BA
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475901; cv=none; b=exRQvGn2Ngq5pDAC11d9eOkMAwW9X6j3zqD39HGtp9cAk7jd7U4pL7zyiGt0N67wq6q0McswAVX7+dMi4VWzRzjJl+/Nrn4rm4SCLr2PPxGFC6wnim1O+tXQqKOcECZiFztdJ+IAVXOzISzwKj8NwDeUAQfGlguNTo/+VEOuqHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475901; c=relaxed/simple;
	bh=87gyxKw5vueVf2Epya5aaSKe+eAGML2SWSMjgAKpXdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i10Db/whAMeCa/XLtXl0MReAZOUZwVanHKuOkD9hM7V5TzvkZvBHsllPZEb4XxqIhEn39eJBeXGyO67m6n1RbdjM47c+VfsaGW0ZT7jL0Se0MJ3fzzjiUTQvNe8rVVZQAjiSEskKL0EABXZhJY5LpujEQ9fO1cFDnSrvD1UcIB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDtnA4HC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPa00gj1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDtnA4HC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hPa00gj1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4v5hf3259764
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+ge0zGVB2WMr0FkBsLt/Bn
	F/YfcascqnH7BAZ+KIoMU=; b=QDtnA4HCCjMlHLFZh7gRoTQdkUUJf6P6VoZ6Ck
	1RkmMZRvKR56/hprrAXhtga/smz/hoL+pF70ukVctX3Q9euEVNq5pjUrvtJ39nB+
	F2O+uM+QmlwK0zuNyvRLnjnAeJ4lEV0xYixWBF5f6MxPKzEF3PdDvFpwG+xhwwgt
	cQpvNvcPfCBCTDfswBox4OdqGcMCJ+jpzLH/EuTWCnj93WhFwbIwu/YvPdGpqc9S
	AIpAUmwOciN0LZEdXKFl/FEsT2sNBR6IbK4hym7PRON/fjC86cuVBf848opZM0Vt
	SUQAqNGxcV0/LbWY+Rsmb+wQoAGvOThfX+Iy7+cDJo5X6wgA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0b046q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:31:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so920710a12.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785475896; x=1786080696; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+ge0zGVB2WMr0FkBsLt/BnF/YfcascqnH7BAZ+KIoMU=;
        b=hPa00gj1ECKhdrNAPo6Pyh+HSjrc7SsDUvfiFTAplKV7zVP0TLhDPOQbVVqTihPJMH
         iQspTNyyaHuWgX+j6bSatuGMwqy/0dwcdmZnwPWMkaY/WkaFQP5m3V0DJN2XYQ4i1p0R
         obDS2EBujzUsRH8NtnKXmShbzzDLZMEJa488Tw4lhKQfIvn1rSqArJs2xrYYdKC3pDkC
         mYDtPb/FDOPwGXfJ8ehukfMImt44aUrSxHP+fPbKDX1o+2lVDOvEg/VVcVq7AUtZLbmU
         pABeUDffFHpumRR6itzKTeGFUdO+Ev6CT0h53FJ7zOjddzyvoI3EGWBSSr728HmbNnzU
         PNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785475896; x=1786080696;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+ge0zGVB2WMr0FkBsLt/BnF/YfcascqnH7BAZ+KIoMU=;
        b=Waiz8f28WttZ6OLVLz826brEYCWSQh1HJaZe0N8nelAhF79VArcR0joPIzYRpGFZye
         50Zmd7P3GdUHEJH8p0xaoVaaleiLYJpcXgdWVgEz7pijE67LhkxKRcPdfVQGKsorGm0B
         JUOfHqkv7ucClRXxOVJKbgYpwdlGWC8/kaDf0ruewRdIrOxGx4+JYDEtVU8H5sD89lnj
         ciyZsm4fxpDp4Gi/ZyLUMUQukwSTnhFqFC4Sv3pK7VYxrzUGSHtaJ7scYynzgTtMDhyh
         zcdvQUEm06gpBgxbAKu7PKwkvQMj+yHBi214njwSRc+5ZTcptCc5EFhaPWCGF3dgyKQk
         8a3g==
X-Forwarded-Encrypted: i=1; AHgh+RoyZL1V8BPc7Ht5h6tGlkdvn4LCzPaGO2AffZZfFBZalQSzoJG0a/mUUSSk0qcIBKq+PdS7xxI6JYAc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4q0vwlqg3pZcibWw9TA4nxJQ6klD9WiRMdNxnV2XFvvJ/AntD
	OhjM5ChWb23p593DWDYSKAQCZH3C3D7T2o+nxeP8dHNAB+RJO5r+tqXMe4JcT9fGrvOO/DMbtYO
	1nDcfkKSFBZPv1KmCeuajYNMigEBz94fuMEiRCH/VLuGhSharWdfRT5YOFhD+/Vbt
X-Gm-Gg: AR+sD12n4SWoVvKlrpNWQhFzUDyWIg+9etwHo/U5q9l/GG9lAt0KuZzuu4kBU9lz+P1
	cI+A/vzY7jIA7POls4vjZR0PrZBx2sXR8cNDTbKW7XVuaWXpkk9v2BGPeTIPng6+ja2zRGud0Bh
	hN1ZOtL+zO3Tco6mwzm5laVHkINYkCYyj/E291oxdsmJ3q6DW7eeCNANU/E9WVALmA1KaUrtyr7
	be1qytUypwUUk/rMJMJtoHKIylPUSe5hUxBlPfirTwO8nZfj4ZDcIounIw6Y8Z/B1p4T8ShbJhA
	no3GtmYg6myIbsDtrQR/V+T1rYLWRn1IkOLkoNUjninNqdjdDX/moys78Js94TQUnb1SR98eGHK
	tXO2PwsR12C/l1sbSkjonNZEOx90esyRiI22TQboqmUTIJ9dzpg/cJkTpyC55orVi/q+YX7qPel
	d5eExRTvDuHKS+KeWs3p4vznSZwVf45uHFqNE=
X-Received: by 2002:a05:6a21:918c:b0:3c3:cf9b:fb8b with SMTP id adf61e73a8af0-3c91b3ab625mr542266637.68.1785475895812;
        Thu, 30 Jul 2026 22:31:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3c3:cf9b:fb8b with SMTP id adf61e73a8af0-3c91b3ab625mr542243637.68.1785475895416;
        Thu, 30 Jul 2026 22:31:35 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm1983434eec.4.2026.07.30.22.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:31:34 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:01:26 +0530
Subject: [PATCH v2] dt-bindings: arm-smmu: qcom: add compatible for IPQ9650
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-ipq9650_smmu_binding-v2-1-143a51c8ffce@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC0zbGoC/4WNQQqDMBREryJZN5JEDbWr3qOIxCTqLzXRfJUW8
 e6N9gDdDDyYmbcRtAEskluykWBXQPAugrgkRPfKdZaCiUwEE5IVXFAYp1IWrMZhWOoGnAHX0Uw
 azQqTlVfJSJyOwbbwPm8f1Y9xaZ5Wz8fX0egBZx8+p3flR++PYuWUU5Yb2xqleM703SOm06Je2
 g9DGoNU+75/AVYSpJzRAAAA
X-Change-ID: 20260512-ipq9650_smmu_binding-36dc05d39860
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzNCBTYWx0ZWRfXwmpZfRoYTQr/
 EVyMhkHQ+zHhBbnLMK+seKh5+BotjYpPAxIhytGd1eObUGYuWpqpd9gDj/2KJPx2stdkFoBzIjp
 03TZwVyrX6814TaSnnzC62smCyZpyGY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzNCBTYWx0ZWRfX209zRd+VLX/z
 tHA0LIK6fJh1x6gFWE1K4ZLmjgY5rfKGvgtkv2NLMZGmupA8ZIFWS8E7g7eCP+r1EO44/KnysaT
 oSAP1ZRTrf6UEfr9cIlIvtqUWn5UjZUm9RPl3kbZevOjMnYkOU9k/xs1orzMwnVFhPv94ldUTfa
 H9SIKmZs/+ll4I9Ug1Qwfrvm4wusWzMiCoJMMANPpeg72m5wzEniGEL3Y6OxEBJXHjC7DQb7MOI
 4exJkRAe6N82ZLAQ99gyT2fpufj2JrkoYkizSVtrluFupLva42RkyP1gMv/Q3Fg/aE7UpXauX5p
 ISdEOEj3Ulw5BXbZly4HAm/rmdGt7ULwFb+vw1Nhj35B2ytvNTx6sqchgjtkHOJa/gdAV30RPrj
 DhiaoW7UTAkuEOjOZIsx3gsmqOv2yPnhEueuF6YOyxnNv2rwZBIGVWwAuIUkUCjS6+YvO8V0nJt
 9FPJWtU/2uUB+fGJWPQ==
X-Proofpoint-GUID: BS-LOtIefjDH5zXJ0kZUEfk_MeGx1u3r
X-Proofpoint-ORIG-GUID: BS-LOtIefjDH5zXJ0kZUEfk_MeGx1u3r
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6c333a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=tA7aZXjiAAAA:8 a=JfrnYn6hAAAA:8 a=pIFn9JwG4DboacuzgAoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=kIIFJ0VLUOy1gFZzwZHL:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310034

Add the compatible string for the APPS SMMU present on the Qualcomm
IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Add the proper constraints - no clocks needed for IPQ9650
- Link to v1: https://patch.msgid.link/20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com

To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: iommu@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index f2188942f877..ffa33b7f4a96 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
+              - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,maili-smmu-500
               - qcom,milos-smmu-500
@@ -625,6 +626,7 @@ allOf:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
+                - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500
                 - qcom,maili-smmu-500
                 - qcom,milos-smmu-500

---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260512-ipq9650_smmu_binding-36dc05d39860

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

