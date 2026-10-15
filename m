Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1CC44E02A
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061739; cv=none; b=eGXjwVG0ToKkfxVMh+1TVIB/2aoEdmMsCCyTvMBn8a+msDqzp70iB6h1zP23OdzMZH3nAkLihvSAkOO+JMJ8j9pbeJVRtKa+/ucE84+2FTYKuNHJIM8vpWDpwykAo4W6fzyO8a/F4XLofEHj+rhxc8tY0u8QaAnocgMi4HPGbzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061739; c=relaxed/simple;
	bh=Zuj0Mp5Z80P5Xe4Uv2Evzpt8jsUT1HsihC1ZLba1Ap8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gZ8HtS7PWRQ04FmDtsKZ9J+hpU2GJ3VjCRdnvMNMvqPNnClZSuWDfgtmghdzFKlqIUSejVT0Yruf3pvo3rP2C+qY/+9wKTZBXxCrEVWsjWBZkfZLvVG7CvfKiZoZPX/pliAvb8hbZc1PrDrl03V8uKBswlVV6ZaWhX84j6nBOFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0C7Z0My; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EV1X+YdO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0C7Z0My";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EV1X+YdO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPuTU1596361
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JwyFlz/ChE0rMDIH1WU3Ms
	Q60a3WnORnoupBPMHI0Hk=; b=Z0C7Z0MyMyX8Q0oAR65iBflkULmBYpO2HVpLaR
	xHr/BSFLuyvIRn7UyyWhaT9JQsY6f33yD0dAmZoDuX4qwLbmMzuyGzer7ESxy3aq
	JSp2KcaV9oKBj5D4huMN4rpTZwJd/5PLqwtbUdM/ZY2psPotWktMtuhxNpB4hP6a
	/nvh9v998GfJxE9vE/2sYeaOPm53ijpSjPqEuFgmxciawzUA2u7Y+HUbQOFPzrsq
	IvQ6w7saU+nrixqTI8goanAfaa/NQmuPpCjNoQuZGq6+OVA+iwT1KsQT7uzlCppO
	fQMZVqfJpHvh99PrdY+AgxX47lkWWe0vRhDhVUXg9OhW1ogA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v83ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:55:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso9216128eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061736; x=1792666536; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JwyFlz/ChE0rMDIH1WU3MsQ60a3WnORnoupBPMHI0Hk=;
        b=EV1X+YdOyEBKlW8+jt/4mYX7dTJ/bXgxPBSpd8ISfydHMHsApphGcvG3WIbYGW/q1L
         8VpgnVKkL9rIqKkT5YRsZwupLkxaNSXxQ3XxKC52cFx/UN2MsHY//nvRiJ0SrykZxJTD
         whACqkiGgZycASyTYjGpwI8/AHOLSSW6/d3c+xp0ePpkzAHaQ6r8NVZCARP4EfgLGqDG
         ckcnTLbaqhZVodvgmJDOhjZIiLpJLU81jtp0YPnfVmU5hlEqCS3WobEL/9DqoFGyg1Jp
         PjIcZBOCGljBRJP2UnA1lNjhfWyrM3HlcBsWcbEghnMHOGq8bUX7uW0HFkVuXEVrmtSw
         FNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061736; x=1792666536;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JwyFlz/ChE0rMDIH1WU3MsQ60a3WnORnoupBPMHI0Hk=;
        b=I0LeCA+8uGido4ty/dnultPEX94FG6G5YWq5ImxlPy6j4HluXFPN04MD0DMm58qSe5
         tGRObXJNl6FI5zDqfCdPZgtgRRaiUE0bWd1/GfWps5bsO+9B1qRrmA171ZE58g9+7+sH
         T1E8qlce/8MDS0g80uGE/cW5vbQnrq9+LdT+XvtP4c+obcNyPNi7wqlGV9iFIQCL7YjS
         OzE0igvIryhCC1JMuiomNCMCvd5o7LkDAjs+kVltQmJqenje/PwEAAOTLdFubyiHbJ/y
         +6qEkcWMp5Yo67c98EBpV/WLC8wxICr6xIinMk5CYMW9mAUhhotriQ26cY74TkAy7ozx
         SKCg==
X-Forwarded-Encrypted: i=1; AKwUvBwASo93KjmeR7rkAor03zG4Gt4tVBvxUcnBej7Mr486kaYWZ6ZcfNrxn+ey7jRrdM2aQ6WUYdQ10P9R@vger.kernel.org
X-Gm-Message-State: AFq9FYJTsXdv5JY1FdDlEymPZdyh53BfQSrpB1P6Qa2OzMmbysRx3m/H
	CSU5Zzq0MpSUQViF3FuvYKHOk7KtzvXMO3jFogNWU9ES3J8eegWVHPtZB+GxJZYOUVgqap8hBT7
	0hUI/VleUPAwq8ofJjHAjYnegFgIHCR2BPaLye6BQ8C+VzJonuF8N1bkpsrtOA4kr
X-Gm-Gg: AYBFou2uVMfADuprv1UktzQq76LIt7j+KVfj8cdslQBnc8wGQ/ifefkuvxz/BsJMttf
	eGfbYDyL+VM/9+UVwOe1pQY/h63vpP1roErzxQedRVbUARhxyBepK8FYt7ADZOsxGEbui74+d9G
	7uwzkD8YN9DEzenKox9vET9poLeVkDqk51lDjoJWDh8mIZ0R7FcO+PvTDxRc9QwAGtjHvN1um5M
	8TSZWkR47UHZLa+DHC4ZA/Q5ZJKAffaG78ZF26sa5VRdPXsVhwVLynw2X4OR6f9IsrUbussUxN7
	mfXHjOXknwzkTLETThApHg9jNKH9e8uLee65dj4qkIxHNneJ+QDZ6xCxxEJKDqz7Q1FrhceS0e0
	NMTWH0L9KVzhh+1kIRie/pf8Ff29+k6bYXQsKMY5eyRqalD1MWB1XaTa+dZr8t3xpw+Mu07k8bn
	BlveloMGu8PlEYllIET5C1P3+pPKHv
X-Received: by 2002:a05:701b:4503:10b0:158:7ea9:4a5c with SMTP id a92af1059eb24-16a60066981mr25230153c88.27.1792061736469;
        Thu, 15 Oct 2026 03:55:36 -0700 (PDT)
X-Received: by 2002:a05:701b:4503:10b0:158:7ea9:4a5c with SMTP id a92af1059eb24-16a60066981mr25230128c88.27.1792061735948;
        Thu, 15 Oct 2026 03:55:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm72352996eec.14.2026.10.15.03.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:55:35 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:25:28 +0530
Subject: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP tables
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB+x0GoC/y3MwQrCMBCE4VcJe3ahKUa0ryI9pHGie2gSk1QKp
 e9usB7/Yfg2KsiCQoPaKOMjRWJooU+K3MuGJ1geranv+ovutOGYEl+9MYB2t8l6as+U4WX9Kff
 x6Iz30rB6jDTZAnZxnqUOKmCt/AfPNO77Fxa+wcaGAAAA
X-Change-ID: 20261015-opp-8f55ee1c9baf
To: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX7INjmLhRRrZY
 Lnex4dY/3TnjYj887uxJqelz94iJbmnbstLTV9CnjBSv0WDVjCSTN+4WCbyluT2QkSymVkVQjOt
 Jn8SQUXYtdcaeC14sIxXVDQ4leAHc/CaYn7AqHjh30P2YwK5CbHw4dluiij8VEmCDz70d0kI6/R
 NstJo9GWpD8OdCWzYMXhko9WF2NsjhEQbQ0TbeDA5IZ+9nTZstQg7pnaiuJXB4aShukdOPgKf9p
 q+D6+Mi5Ui7sB/ECDznRHxmxPwsPFwl0cpHZKs0ta2PoTGcNDtZRW1+oHZJLOvEf5+7KxzINmSH
 g11hpZmELonMzS59z4+UDSn9olWnW2tf0WZzn2mw9fhyyit9KaPzcJj3DmOBPNLRWAWtjHHQaHD
 KnXMs7lQei/TeQPT68QmulzHF5uRmn85tgMns/5MavAgIOZVYnKoXMZ5QDLT6mja+nvsMv5rm0v
 5xMpT0z1ku1P+pXgnSg==
X-Proofpoint-ORIG-GUID: BxrSoZHDFOzC8nh87vAcwsddvGjfu5_j
X-Proofpoint-GUID: BxrSoZHDFOzC8nh87vAcwsddvGjfu5_j
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0b129 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hxkfFdRD5dxKw9vi-7wA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX5tmRZPqPivvH
 PzTn3UW5No7fFh7oQSHyGmsSdvGuop0VeewS2ah10K6Jhmx+pRBuF+T6co2RMT/BDdpz7YZM2qc
 2qiVSnwqJzPCHrjUG/8dZp5Au+RN0Sg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

The OPP table node-name pattern also matches peripheral OPP tables on
supported SoCs. However, it only handles Qualcomm CPU and level OPP
compatibles, causing unevaluatedProperties errors for generic
operating-points-v2 tables.

Reference the generic OPP binding when compatible is operating-points-v2
so these tables are validated against the appropriate schema.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index 547265b8b118..fa9330cb3223 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -60,6 +60,13 @@ patternProperties:
         then:
           $ref: /schemas/opp/opp-v2-qcom-level.yaml#
 
+      - if:
+          properties:
+            compatible:
+              const: operating-points-v2
+        then:
+          $ref: /schemas/opp/opp-v2.yaml#
+
     unevaluatedProperties: false
 
 allOf:

---
base-commit: ab8eada9868faeee95f25d81d3d6fed0d1c98b78
change-id: 20261015-opp-8f55ee1c9baf

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

