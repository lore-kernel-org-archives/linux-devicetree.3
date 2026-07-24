Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E1C3385B6
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889570; cv=none; b=aW8UklpVuBo7gwG0d7OUnQycVN5mAKMTn4pwscJWp1BirFPyVTFzXVIAtrjFwRWOTuxooRZmrUxhxgY6sy4QXZF3fd1e6LJk9kMCOe5f+6Dfx54AWDGLYmDixNU3v8a0OJAI61GbEY0iPoLt5giWAMv2Srng2akWHV/dDmdK3t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889570; c=relaxed/simple;
	bh=hIzDAOSQ7K838svGBBJ9JCf98cNZaQNoCPCfM0iswxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmtl9VSwagx43JoClj9hqXlC4v2OS1wP483DlX2Ene2W7nHXa0jPhwKnOyP80OOUPoD7IP8AaV0G7ah4vsl0BGJ1eWXPTWCkeHfi+wNvRLmhZwWVt4Gq6X6Zf+EJVSpIjNN6ih7TMFq8TgSgw98kRM/AISHyCo6gpg1yWXDV/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faw/uyNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZH7eFoR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faw/uyNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZH7eFoR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADrVX2742615
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h6cnqFci2JIxJz7KmTSqiWOSZITGQx+tRol
	KDqfOfCg=; b=faw/uyNlvL4vwvTBqFW/8y1jnsrOOeBp8pMgAIfZueDX9M0XZIN
	YMeg4pHJAGvSZTMJYawI6uvhR72l7yaFXJ12dCRgWjbHkFurZnNFGHOH0ADj/mgT
	e+L6IeXxiiNpOX3j2hpoJiUgbTJJqyN3TXH/4ftWCbH3NPi/LC41usfI19tzLsqq
	N48O0iSiuGZohuxw7VqtMH7awE5kpg1n6UcjvNQ+9tkVRari1Ouo3CMX56QCQ4si
	dc3cYks0HAdWAl+YkL/h7/fyBgZDyK8jyE13snTjTobdAYdcS5tc82hmOYYzLRCL
	IBxYS+x1+bzR6K+1fkLsWWqP6XwzKBJyPww==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p51ckb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:39:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb733fc5024so473291a12.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889563; x=1785494363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6cnqFci2JIxJz7KmTSqiWOSZITGQx+tRolKDqfOfCg=;
        b=YZH7eFoRSqBaJQHWipQeCEkvURZW5q+zfDStIsV4w1as2anUjvZZNGqxBG7rWe8I6X
         h9IBjxjqcfdhamjY1+2aOJUK2RkZMkhVtarjbQ+kOJrc38Aqlu6HKfVt2B1MXpWlP9ja
         94I3bGWjocWvIAJDL6D9oqMNzZgOQTFiUlhNGV74qoI/kmr4FjM+3GF2ToynsDWn738o
         G9gm6iQ8mgl31erWtslCkoVlgfw0KMAnkVpYxxcMNzIlM3ub4McSmP4vlSDcwLvPeUiu
         DiLvDDmrYZLTqk60xwtEkNxJaT61J0pQu11PL1b4yA6BU1ZoemMk9eH4sCCjvDL4hjmh
         ozwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889563; x=1785494363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6cnqFci2JIxJz7KmTSqiWOSZITGQx+tRolKDqfOfCg=;
        b=evolJVHRdCyOX2yiKMYkZUf6bEKvKS4Uburp1ElDe0C26Lvz1G5nwRJLHjslnZ/BU5
         gS74XdI/g+toqxiROZIF6t+kMemF+gIiWPxHdz7E69meIcbjeOeHCo5JJOOInbrOX4Cv
         vR2mJvq9um3JepGgillpfgOWt+//7Rw4nq+WpD8JpiKp/OmWg0xO+n285SBXkBdshyB2
         xgqrY2j0MjqmJMmu0ApuijUKNiKT+SF53hcPHyYfPTGAKr/8shMEMC6P7x9CWzGQdU8U
         XT1FENbreOx3Ruzal5jT12c80MpLKLmkVZPX1OjApqxPuv6VrTbxRQoK9eonbKZe9yb6
         RTlg==
X-Forwarded-Encrypted: i=1; AHgh+RoojwWNkEgx0pNzSn8i5HCfJCLhake6WyilinVK5rD9bYP9NjK5MBZlNtRB9fUA4EbY6ZG1HAaJuqIE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs9pqHkpdtlUr/8SsKqPjDq1Z31HKSxRgdpvIUhMeL79rn9l5I
	Psga1alFzyMuV/AQ3XNLhf0Qo80eIj26ZPn7qCpE8c90V7km/nRciFRRafitP1vU5ce3B0wTppi
	Q2ja+zQnAb3R9Q2rA1gVG+6hqyripN4sc8axGudEB5XVvGLQxqZxouOTQFGFE4xDU
X-Gm-Gg: AR+sD101z7Z+ff75n2xkpyA3e1iaEqVLQtGqMHkT1itvBznalFdkrq3XcgwoRfjiSzR
	mmE1Jj71/fmtnloxSzUfHmoz6bky1sFLzhBPthiodQyjqR+HNE0ZnwJZwzQ9iyaSDuNF6vDDfsn
	xG96a7dxNSsckFbkkk7HbyG5fK6EkniYKWM+IC3gsCC/lni/svPSGQYPEk3zTYrQvWURZWmz3oC
	aYoR8l1q4lM9eRP8ODA5CtDNZLZsa+lUaaXqxbHhPltY1a9aewLYgAf4QpY9c0+7/ngJUERDDmM
	KoremtwgXk9942kvT1PNCByUBmMH+Hzaul/0wX3QeK3vHBDPCxVaTsGeNw7venX/ySACXdYWt6+
	uTw7TXDLPnt96Ctzc4C2c8kPt2lVHYyrF+R6LP3nVdn2D5QHr+pZ8z/gdzzxt
X-Received: by 2002:a05:6a21:391:b0:3c4:34db:9fbb with SMTP id adf61e73a8af0-3c44b21d7b5mr7507732637.57.1784889563167;
        Fri, 24 Jul 2026 03:39:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:391:b0:3c4:34db:9fbb with SMTP id adf61e73a8af0-3c44b21d7b5mr7507707637.57.1784889562765;
        Fri, 24 Jul 2026 03:39:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm22495290c88.7.2026.07.24.03.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:39:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add ADSP and CDSP support for Nord SoC
Date: Fri, 24 Jul 2026 18:38:45 +0800
Message-ID: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a6340dc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YTZeY_j4NDz4IKi_2jwA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: a3kNtgvOSm3fDZfFNwWHvWM3mwt1F4Sc
X-Proofpoint-ORIG-GUID: a3kNtgvOSm3fDZfFNwWHvWM3mwt1F4Sc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX9SQdW+EvXRHM
 vIZr46cFlpvy4rDaubWIlwPPyAFX+8yCoROJBECuuDLfvphXl38nY2KJe4gnbwtmGvb1apWEzV+
 VRkypcvXEd/cAyf6R9txdJ9C88TyemM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX+Pmnte97XwWd
 MKbvbfyyPd4reppu7t4FI8SjujW242/BBfvYih0LYsY/eiEaMzvMMrucYdwqNgaWNcsB3eikkOR
 v6MhB5apw2xR8ooGNM97XC/etNXNOfL3Nqc8nsGsti6FZ2aHyoLGJZkyTJpHK7B22NUqHh0pA2d
 pR+e4Yrz1JgYjSRDfqabxJk3wPJBeK43gntel+lV9L6rCpsgqAJS9ig7tt8WT7HYbs+8tnH0Kui
 THN3DCO0ARI4JgU7N04RLY6mqWbdfm7dmx68TJrIqB85+euZE2ZO+5X00eWlOB2AGPCMcafu1T5
 oZJ+TjjZBEBWcxPO2yvLSn2g/y8paHovUJlCPc6lVQCCoR377ItsZjWh6uwN3XMc85ViCwlgW4+
 U2GavBdKXoG/nY3GS+su/jYrXliTrzgfhDBk7Sn15rfwyZA49rVZRnsfBGOa4Ox6LvBk4hvZMLh
 TRoH25TmFIna8jW3+Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

The series documents AOSS side channel, adds ADSP (HPASS DSP) and
4 CDSPs support for Nord SoC.

Nord SoC actually have 3 ADSPs. This series only enables ADSP0 which
can work independently. The rest two instances have dependencies on
ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
seem to support such "slave" instances yet.

Changes for v2:
- Create a new qcom,nord-pas.yaml to cover Nord ADSP and CDSP
- Include CDSPs support into the series
- Link to v1: https://lore.kernel.org/all/20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com/


Shawn Guo (3):
  dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
  dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
  remoteproc: qcom: pas: Add Nord ADSP and CDSP support

 .../bindings/remoteproc/qcom,nord-pas.yaml    | 167 ++++++++++++++++++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c            | 110 ++++++++++++
 3 files changed, 278 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

-- 
2.43.0

