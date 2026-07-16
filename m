Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6768C393DC7
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190807; cv=none; b=nnUrMrdRvwXXVhPHfFkOPRaUw5zjPeGwJt/TtgnPJ6lHeB6xOlrhUz2QZbOxLzFdH3XL6BpKT7ocQuBhkmR992T0fnIhP0Qc0sQRiD1dSsCJjZFcN91twMETWkNx7eqKc52YtQ3FexbuQ7EvV8f8QCJ+qlj2+KVsUT6nPxxJFG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190807; c=relaxed/simple;
	bh=j4YP8VVHcJxGBcL41VK5qnTosLDIe7RBXIvw49IAINw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cKmMtmlCB1IDIKPXmusc1E5NlyJ3pgRWnTe342Nf8jkPTWDLmmnOyRQsBxJKRdd0Ce5fo1j+xuDmyb2JwqktgQiN2uT0WfVj6Jj6DrrAAgBOFKG/HM74srlZ0Z13uGrlLSt8dYyINjJWh3Kp/VPmDNuaOZl42En6qE/ed4B2i+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ibk74bdb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Szhb3QS6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ibk74bdb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Szhb3QS6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G838CC2123575
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DTg9lmaJlslbUOkVtN27vmAWs3BfSe86rDw
	ZaOm3C20=; b=Ibk74bdbcWdTnOnIE8S3UghYR/967Q6LVCbX52cbZx85QvjhYD4
	+aWMhkHatls6NcaGlzg6Ofvr2Wwmm5bneP3dU/Fp42KowOtuMBA1x6mbDnsjfmg2
	jdTvu2J5l5bnLeDztP9le+aryFRnDYyb8iKCHtPNubY1OYmxt0CnilCXmeWV9Bn0
	hstsJoplX0DqK9WB3veLFjlhbbL2PxzaznxhkmXiK5PvQCMEOD/wRIRQBTIE2U/q
	lg+XrkaHzRdbnYq8OGBHyP2diBX9A31EYyBvTRqLz5P5NOrQsXp6QCqc3FP7aEQO
	X32oRtt8zBQnaYOaIRHM08LruKCSc+hF+/g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex03jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:33:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c916d17dd43so10494514a12.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784190803; x=1784795603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DTg9lmaJlslbUOkVtN27vmAWs3BfSe86rDwZaOm3C20=;
        b=Szhb3QS65DXDBb8k7G576ytQQ4n7FPwOi8lEr30Tft5MbzcSi9neXTUGt81oWji/t5
         aCOagIPmhVImbNY5pLs4MHmglC60eJEJ7SiDd4836bqqkGD9CFeQYYJr3FWfJHYJunF9
         F/eklon9PILJI8O+X8XviCJrMkoNK6aBryo8ZPLQlfqkJ34Nf2vKCy/x8v0CCfutiWnS
         LTXVqyj4vdB9E9r2eWDCIYxG45rs8saZkQ4hkVpORODE0RRHGtdbTJBFG7f4YUjKjkpj
         nbx/DFuhFy/5XyBGjYxqdRJfEuLw7cYvRjuNjCpFBhhtjf+RJjDmNNyG55n2uSAaGJUA
         Hw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784190803; x=1784795603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTg9lmaJlslbUOkVtN27vmAWs3BfSe86rDwZaOm3C20=;
        b=liVQvRcXPLAVBmvL7nct1iGmPxd44YTeEGLn1x3f4AeTV3+Xru1WzLlyxqh/Pe4Mn3
         2Td4UbLBDapgHSXIWgWcGwT7TWWN/0obuWu3HRbnGq9cbt1BqmLm+kxbvj11XAoTnq5R
         0S4yYc5d4KopN/jUK9gQFricOCrGQMATr1V6lXkV5Vsns/wkOirRvzUtClEGjyVQ1J62
         NUE8d/a7qDEuq600FJZHB5q31cbzPcEp0WOfF5rxwwrf3Zx03W7Z52HTjaT/A8l++kX6
         NCDbUUTZRI7BkXZ2ns5YxvIH5+zOYhbUy07uFDzAvLXPDehdtDgIyzNWCTOdGJv4ic5+
         F4xw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2hB1WevTXsbffCua1dqKpaES2WtXSdv8IbpsTfVWGREY4Yl2ZX8tsDyBtxjREocpTCg2gulf/fB2k@vger.kernel.org
X-Gm-Message-State: AOJu0YxuFVzHtfXqYd6+A2PzFJOfRzw5lZc4u60JrkWebqp9jC3AZyY3
	lqH7DplPz6AJQAh2xZsIYDkqZuhVlaLBIX79NzxJ7iRRJeG5jGo8ukWmM4IrJEKE+PxJLTFci0M
	stBu5H+3vfxbZTmDmHjpQpK6GOc2qM3YHqDsfbe2s/A6icMauYBZ9KfvcTC5S79Zu
X-Gm-Gg: AfdE7clIRY0TKXu9YhOM7e4gSI8Ugs0GXj9lj/AixqL1yMXeiwJNRzJ9TtdHOaCysUp
	hq0+HmRR/k4eh8+4xX59wDe0NamqnxgkC4SLkBidaozjcsNkOF6mux1zm+LD06H6dKchYhnTJ5f
	BxUiciR/gY1lJWK9ms4n3GWo6q0fCQ3qrQxuVG/KKhYwXb8Xu/rcnzm64YA+I0Yh/R2U+xAfZdm
	Xbt9cD1/w5l77E34y4GewVliBaX9YmXP+1tLv3r3hZCCDgTjBv4HqPYzUNL9FjqG94T+NqK99BY
	3lgoumc5ZWMtAchbe4iRnbMeoUXj+zH93lHHd5NspUclA/dH7BctNWyu4yWgnb/TSSyFMjLyNmM
	Y63fDUyLX6l2v7Gi18Iq71MArzH7rPWO0NSK3qHm9QEdT5n19zisRHJbn6+0S
X-Received: by 2002:a05:6a20:cfa8:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3c36c0f696emr6539745637.2.1784190802640;
        Thu, 16 Jul 2026 01:33:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa8:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3c36c0f696emr6539721637.2.1784190802237;
        Thu, 16 Jul 2026 01:33:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5306afsm8979111eec.9.2026.07.16.01.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:33:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH] scsi: ufs: dt-bindings: Add missing mcq reg for qcom,sa8255p-ufshc
Date: Thu, 16 Jul 2026 16:33:13 +0800
Message-ID: <20260716083313.2367249-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a589753 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3miq8Qb-Iyz2LYAwW2cA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Fe2n3FdcTo3qLDH8o57jhxpjoW4Cg9tQ
X-Proofpoint-GUID: Fe2n3FdcTo3qLDH8o57jhxpjoW4Cg9tQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4NyBTYWx0ZWRfXxH3duttNT8rg
 KEkW5Jh7R7ZZ3bGsrnOZRa8zVfFKnSrTMz/+GCvlsSjqUevF3swMMk+/vzwhFiOoed93WgvI9f1
 z14pZoOVMsjUZl9MotPLQSeW/y7FNUY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4NyBTYWx0ZWRfX2Re9TDEVQJdh
 NkPtVAE2exKxSt3HzclnF+zTht3mdHq45YebSTlnNCxq2BBplZ2iPulUHR/p4KcaaOWYyY79wo1
 PGgdckbzEkmUUJr+1k9Y9xWRDVqyJ3XLPeY8WuhR1y2o/p6tc4f9hM9aNPprsikFfkSSN34EMcO
 ZNV3ykdWnGDBeYpIUpqS8P/we4D8Hdb1sHKRfjwA+3ktw7KA5b5rlfiq79kIk7TWP9NWUAg8pHh
 mWUqDLlvbTxGPDZCWqWblQS4/oMlMdPrRUoa90EX/L3dh2YF4oiubXxeF+NYE5XvnzM76gBFU1Q
 D78c7c84viN1UH862fKH/BMTRBD8PUQ3OBBcMQ8W0Qig6nEuyIMQBw2b2m2cu6db2Xca2uO0C12
 BYc5QoNSbE1Z6RW+7EQYiSsIYiD9xSTEMV5l9b8Gos3skj/gqYCTyWewh8V9L+A8kQe3VntzjQj
 kvSjZwALMh91hqnTCEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160087

Qualcomm UFS controller found on SoCs SA8255P/SA8797P has a MCQ I/O
address space. It should be defined in the bindings even though Linux
driver currently doesn't utilize it. Fix the binding before it gets
adopted by DTS.

Fixes: e2725ed2a7fb ("scsi: ufs: dt-bindings: Document bindings for SA8255P UFS Host Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml    | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
index db165a235cb6..bc8734e1fdea 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -16,9 +16,15 @@ properties:
       - items:
           - const: qcom,sa8797p-ufshc
           - const: qcom,sa8255p-ufshc
-
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: std
+      - const: mcq
 
   interrupts:
     maxItems: 1
-- 
2.43.0

