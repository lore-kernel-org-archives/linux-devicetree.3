Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60BE3C0624
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846822; cv=none; b=K5ho8KlVF8LeFZyvjw46eK0fDyI0YFNPdZsAi5mrnRPlcQKTh+tfgC7yM22M9SChQW5vt0ZPBb4OTchODN0YUiZiCObXI94f+6dcEzPbO7ySi/v1haEqfZE0sHB9zfcD/AK2MujKS8dAiOoRF8y8oUkC4OCChvnL64YKqNKCLB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846822; c=relaxed/simple;
	bh=HbMPY8DMFPbwd2WkwpJJpBUBQrkllHGVUu7v6NMEi4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BnNUm7+E7XZ6F4E44oI7eF3owYoeZsQOlpUDiW05q5ehWRyJkrj3wU79cTIcFQugwxsUpq1sa3KRneyhj0dmV/fbWld38cW2LLt/EH/LSwfJb8gA7aCg7RQ2BLJpT8FHgNusN9tTJsYox7Xe6+eFPdXGg3pvKVi9YELXljXUlvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHf8nnDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cap8ZbZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHf8nnDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cap8ZbZC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M59enC163925
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ORoTDQr6cK4leZzidTtpiy+qFbY0ke5tAac
	DsKHAGzg=; b=nHf8nnDFNaHnaHZt7EGeYYRErDn3vH2NPZ3WbhusYfIhjVT0v5X
	tl0fo6g3sdHzDDU/g57I+VbEd0qdp57tDJf6uEATLDJOK1WDfEPQ9F5GIELCzqsc
	x80yn3vlXIUHQbJtKCusBVYDcfG/4YO5C81pXA+51iNstNilD9tuUEKZaAJTxDaY
	7s/+tuXGaCMYyXyJ1GT3J9IZyK8UWpm8JA66yja23K7L+ZIJ+8xgRMPf3OyS/kO9
	0v72CVkAHBt20S3bzL8CSCIiyEPo6srNUh9gVuHLK2LSjRqRnq2Y5YO9z2RgWrMj
	NbTNdyE9IWT1gX8LJMdkim/PACXjQ3el90A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhjjy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:33:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f896eb6faso5730980b3a.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776846818; x=1777451618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ORoTDQr6cK4leZzidTtpiy+qFbY0ke5tAacDsKHAGzg=;
        b=Cap8ZbZCRKNF9IUiaQwx/vSxeJc1KHXbP7lOhOHDmiAwNdAO7IcP+M1adCPoB04wBW
         T75/Xptrw0C+4dBt4enI/WbJunHYJwzF7oxW5VGfT6+D0XcJZyoaehd10hOmqCkGJR5T
         8+fHc1CzK299byqHk873PDb5D9cFA6rT1/8vjZypjYQklcr8K6kRroTv18RYbKwWAMlb
         2fCpmV6hEWUl6tjAJ/HPtGVd94zv9Re/QV8avK3SByasrI95tXZ+yW18eQYCOeh9qwYu
         X6FMRpYcuiybdMXqFuY2/ayMrMSNB7SIJ04qxGPLfbmcFLAqxPJNMPtP5p+w/lcZFTcG
         q6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846818; x=1777451618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORoTDQr6cK4leZzidTtpiy+qFbY0ke5tAacDsKHAGzg=;
        b=SYKUs0Mvy6Z88N11ps9LGs8Z2wmYpZNCSyGER2lT+9AfD8RSn/6mSJ3zcH3N1fBFlg
         dMOgdSUe7IUNquNEMn6du+gEdoF933tGDTnCEbaArW8HKUqlPeuap4sIG+1+eCZX+O1O
         IfTLa3A/zBOOxiXEn1c86jD6qlytnjrnS9DAG+vZO56ojtlHqnEj3RLE9Yx1vqIPk7/y
         mHCNTgrwZwX4P+dq85kpKSrbO0d5/DuUqj9bEZ3JoSL7K5l73egq6KwnFLd1EIRhygqZ
         UD5Tv/RDJFJDCV3RFUJAWrQhLFyxgcK0ymr3gFzNzDks1QQkvVyOC0WUnAYvPNn+Afjm
         i2Sg==
X-Forwarded-Encrypted: i=1; AFNElJ8MCD3YYIpI93ultvpkctrqbRWf/ZdDwcFWztsg9I82aoHKjPiOW01R+H0SnZaV98f/IDXr9dn3zOB8@vger.kernel.org
X-Gm-Message-State: AOJu0YxNRe7uaBF06aT0/wksvbIaTf1pQQVa2oDE00lPuDFr1d4J493z
	QHTM67GJkJIb1Y0IaqSf3p8Qi+DrE5w48PAy1AbDOAz9PZmR9OpDI0AxHEtzYfOL2ktGh1t6yVz
	YBkAZ3RLcRlY1zo1O8bCqWiIBQl1o5qJfWEmHfSk5RfKv+SVNZmu/S5z7OkrTofQH
X-Gm-Gg: AeBDieuiBvR8d/XQtJgvPQnz4poazlN20Zj2QsZeNhzCCDRpIuMlPoMrnIp6XN663qC
	4qWumDyqdFapcijWTh8OTjfC4mCAWui47ZLxf3guwqjEWfCZRUizJK6Pqyh+zFh/kASQnPW1/80
	Y5FqOMPelG6jmEjxEGmNW3dRNDUu5lFk7jDrt04V+50ghRQngogroPQOI9LRyL8BQ27u+31xbNh
	GeAmlOzabGvc0xubeyjeWht12nSeS2us5RxDGTh1ZvcYjenRXeGixmYMHaknZIF/RckXEXB5Q7m
	E8Kbr+eBKPkRWu0MMlZL7AQoe3XEaTZ89Jh+jK5qy8aPFPPQV/FKMNGuhhkqXHNvbltRilTCwYU
	QFZauN60d9JLowZNZDCujibEU+CFPhUGqC10NzePGUAbMmUrxD3pmXIIkw6I=
X-Received: by 2002:a05:6a00:2889:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-82f8c7db2bemr22952343b3a.5.1776846818347;
        Wed, 22 Apr 2026 01:33:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2889:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-82f8c7db2bemr22952305b3a.5.1776846817705;
        Wed, 22 Apr 2026 01:33:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981c12sm19736603b3a.6.2026.04.22.01.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:33:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robin Murphy <Robin.Murphy@arm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm-smmu: qcom:: Fix Hawi compatible placement
Date: Wed, 22 Apr 2026 14:03:29 +0530
Message-ID: <20260422083329.885979-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yR1-OZbzni7zILKbnhigdmQndaer2Qod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MCBTYWx0ZWRfX3kXZBUbhEe41
 ZFgDj2FstQqkwvmj6dyH7wbkqYOoHY84x7/jLQoJvYVDF0/ZK6TncBfhvKUfd1ykHeLK1nh5ERi
 SJe/CUJ1zDtwwCN3VDZGFaR4OHQDc049iM7oy4EDsiiY0ioOExdP+/BLwDy5OTT6xNkcYMSB2lq
 JuU6xvwnwHhT4Udrq/dl6IqphcbcVSaz9kdn2DbVNoeKca5zIdf3AHWNcX73pcZYa5FSDH7tB2f
 JmVU1g+AOd6Qff9Ln4lFFdjieObQJZI6TglJQCfGVQ/9Oc3+pOEmQZDdKgi7JEAYAjdWyx+4wt/
 EDUbMgDJUnJSee+3yz5AOaXpQ4gJoFVKwI7XrnL1NheFaF3JUvTvrZ4hW2y4DKkGyjACTna7lSa
 9b0kJUTHLuFLOv8jtYkXonXvfEZpCRTFPnawhuIMqdm1TeSP5jh5OcjpbXBXjTcwpeLHUU3Ur12
 RdS8f4h6gY1g8ePf87A==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e887e3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2dDrt6dFNNLvW8Gx2gAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: yR1-OZbzni7zILKbnhigdmQndaer2Qod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220080

qcom,hawi-smmu-500 was placed in the wrong enum block of GPU. Move it to
the correct location alongside other Qualcomm SMMU-500 compatibles for
CPU.

Fixes: 5e8323c3d528 ("dt-bindings: arm-smmu: qcom: Add compatible for Hawi SoC")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..ba9ad1f5a8ff 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
@@ -93,7 +94,6 @@ properties:
         items:
           - enum:
               - qcom,glymur-smmu-500
-              - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
-- 
2.53.0

