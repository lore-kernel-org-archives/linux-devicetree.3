Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE324E4C3
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 00:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775176579; cv=none; b=uCzzHi3QgEVJ8B9JNvLb4EPZWoNM2kl898QKW1H0gdTjf3b5tiF0EOJMhm0Vkihwk9IifCV9HSV23OYpiC8H1inIZNQjv4OJwKGtf5FM0tV4MQuBhQWvU9Chqc5pMeLIJY96K+oRvg5LM6l87AOZug11EBG11wNSHN780PQ09WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775176579; c=relaxed/simple;
	bh=8+zQnJVyiAurgkjhPC0Db4ho143HWCzHXfzFv1rHJrc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OOxuYlTplV8N44+YukuWC60V3+a+G6XCuKHB8evxyOiJl3hyTOEuoJVVlyyHkBlK2qovcwYXLZqnjrgUXwbtjDfibfoGKhoNXFUkj9JVgdK6GbMUCluK2R5eOH+Kv1KzPz+euaqomgZRuv5EIYW4CmJXlf4yXXPHMLTByOgNyPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqvtFzVw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ch6efdQi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JqvtFzVw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ch6efdQi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4Qr7981800
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 00:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h5UAAm/txxqbelO8VDP+Qh
	NQZ0HfLYdusAPKbzIIshs=; b=JqvtFzVw83pb30qhKk11CX19n+zsm/7MBeiB7G
	Xf7s57mq+7OxjmXhIeLuU/U8REts793Gr925F2Mfa2IlJDJ3zOKv4mCiq6bZ3p05
	LbHKyuMc2uyUtZERnzcVNC/AoSeHtiCr2SzlYrhNkUYrHsYzC/tqSdkAVvXC47J0
	iKXT2BPJ1iTkKj2G/ze3ZiVgYf4omp5Js7Ob4siHpWrgkT1Qjp67sj8L5otXMxzO
	/6dAODC3HfD8s0i8DjdYqtOpTTdL4aY46RqEnviGyzXkGyXuucpAHCJ8E/zSIh85
	+gr242b1gQhbLvWjjffF+NHntTuxmjtq54Dy4+S2zsHN/iYQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tupsn4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 00:36:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1270dcd11c1so2426965c88.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 17:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775176576; x=1775781376; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h5UAAm/txxqbelO8VDP+QhNQZ0HfLYdusAPKbzIIshs=;
        b=ch6efdQiu3sYGbtS5YrzKM5iYKMbTrr4cHCnhVhu84pGGBGWqcoMrAbg6aF+MjYJc1
         Sg4vKUpPFTyGDCLhUyzxuLvUUjIaCFheU5y5I3dC1H+suGHT2vGJE9r2pCHrF8F0nW7D
         lOXDe6Kv8LvJ6RqZZRVz8vmiPDfs/DRXCRLyCxjYkW3a8bar5bhmrUbuECH+iRN5iLa+
         hSAcamTELjXML7TSqpv+1XHxE6adMDIl4rcAVQadypb4fZ29CqoSerNnxGiCwz2WGUSn
         nZfJJbYYkSadccXS1Fi5jAV3YV3lpixd5xc+pxxRjeCa7q0LbTmEzbHvN34450EeJFhb
         SFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775176576; x=1775781376;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5UAAm/txxqbelO8VDP+QhNQZ0HfLYdusAPKbzIIshs=;
        b=IW9bQSUbUs7U7EVEKuAcTXxoTSq82TtwuRzEFGBGiVqnPSqh1/fn//yskCE3u8YhX6
         JZG8k5GFzXM45mCDqBmWVZOoL936HqrnlybBnRKw+nUDvvwQsb7IxmZNCRpn59Opf6SX
         hGlv5R0eQ8UgNFBOQWkvTXaGz44RtxAWHCOMbIl3GosmIvNKmm40vH8N8CnATtgL6kUU
         BTu3jiNZPV3h96FKl6dBw2dRnmIue4GHxnxqsaT+liznc62DOeXPMLMpo94qka1nCZi6
         XcpB9krzI0YHUPRPmPu6anQmb0CxuL94e5j7oks7UMKwDBRwZgds9oO+Aj+gTaSFqUDP
         3PHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaUq5hXOespRocyBlIQNEDJhdoBuAWH2eWebpDdvT9r3LPGOXgGI4JNOaL+Uc4qBQtWayDsWoYQCad@vger.kernel.org
X-Gm-Message-State: AOJu0YxUDQ4NcwhLovOoMKyCaX4RMTj9xa4pRYxsvQbh0Wo1rJjvi3Va
	dhzxKE4LkQFgG8vTqvGpb+k94sO8fr4VLNG9Dptr6k5ukLhBuz/d7iaE1Jo7Kv7/SW7821un6ue
	2F4QCxaafYi781QEJg04dShG/SXMy4OerkJMO8/OQfgUWI/aJXihgF70v+aw7TLF8
X-Gm-Gg: ATEYQzzNXcVWxAzY+GOsqJTDi4QsTnt3Sa4Usd4aHi9AZnL+ns/fnWeNFzTzXATkzCS
	HYwHi1H52M4P8V62fRmXYmEVof2TP5ZCOPpxPL2L0BB1wobTgkHZ0zWOMqfIPaNEgx8dtQ8tzHx
	jE3UPRL6AiIaYV8w1cBSdK9kpni8XRgEpBi19T8rV3xOV9DLBhN+7QcYSBNQV7DojAM6jfwGqeW
	tjp1ENdu+9Pd/w1ZgsA/BphjHk7y2PnZ7gXOl1XbDlcEuBZGgoWo9SVWJ0I4L6WDQyhnNGZdlSM
	fICp/JJmscXytlyLBOGtBhYqf6gCCK13m4ou6d9M18zPtcIGMxbC8uD0PdzMMewGXBYvnSyUfIJ
	C308QCeF+WD0wJ08SBXdTWBwT/Qk3MeOSAneFR5LCuH0ylBQfI6wYs1FNKln6xJf3MgRYAs012w
	==
X-Received: by 2002:a05:7022:6997:b0:122:3a5:fc42 with SMTP id a92af1059eb24-12bfb745a46mr543691c88.20.1775176575950;
        Thu, 02 Apr 2026 17:36:15 -0700 (PDT)
X-Received: by 2002:a05:7022:6997:b0:122:3a5:fc42 with SMTP id a92af1059eb24-12bfb745a46mr543673c88.20.1775176575415;
        Thu, 02 Apr 2026 17:36:15 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm6290550c88.0.2026.04.02.17.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:36:15 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] power: qcom,rpmpd: add RPMh power doamins support
 for Hawi SoC
Date: Thu, 02 Apr 2026 17:35:20 -0700
Message-Id: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgLz2kC/22Nyw6CMBREf4XctSXlER6u/A/DorQXWyO09gJqC
 P9ui1s3k5xk5swGhN4gwTnZwONqyNgpQH5KQGox3ZAZFRhynle85BnT4sW8G7VTrC+5qBpRSKx
 bCAPncTDvQ3btfkxLf0c5R0NsaEOz9Z/jbc1i7694zRhnsim4rFtUzdBeLFH6XMRD2nFMQ0C37
 /sXVTl4/r0AAAA=
X-Change-ID: 20260401-haw-rpmhpd-b40a68a3ce79
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775176574; l=987;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=8+zQnJVyiAurgkjhPC0Db4ho143HWCzHXfzFv1rHJrc=;
 b=KvoD80jUtV9+vyWUVroOchLMOdOoMkZyHR1Wbl3LaSjT1X6E6Z9yI7FcBnVPxBKAXZBbn7VWb
 kn9+4EewxT7DH9Ann9pWE/obgLWjPylMk+3UweVfu7sfhHnD4VxliEr
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwMyBTYWx0ZWRfX2WYbvkvWKvrU
 JT1FZDQAZnFNEuppdbuJ+Py6Iv1C/70MhGw0y5y7rj7fF7pCuZS29Hc/jqeUoQFxholSf0bXB3P
 +uQATVqrN4cFar6ah9HSGg5IjRU7KCXb2rHsemoztYpHOoZLSxiKlNrNpKKmqZcueexQZ0cYuoH
 ip2y7Cr9HQQKZFvD47IatwpFpVcOUo7jTtDpKFdzZ0CN3WV4T/GwRsp1/7dMEHeCyAMpwj403Nl
 HKs+gBBqysaV+tdu5INA2G6m1o9QqCGmxqDLsHwvIZ6uLX25iGm6vrcXiYqIhct03JxcmNrog1a
 70BQ8xIfX4s70x3OTIOV+m7lk/AMbiXNWsYOC4x3c6SCjuNmfuU6lGtJv0nBWA++VEO8R5zxES8
 WdTLDAf0uYGFdoSyaHrofYuPcltrRevcueX2QRssSFJfj34wh+UW5ZCtAq1v0OYwILQEF/Klx5q
 z25i2czO9GAfzLgwSYA==
X-Proofpoint-ORIG-GUID: miwvnbTpTi1jPojd2P6ZxP7CFDudkrzZ
X-Proofpoint-GUID: miwvnbTpTi1jPojd2P6ZxP7CFDudkrzZ
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69cf0b81 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=q5vjKfq5BPxnf1QuwTYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030003

Add constant definitions for the new power domains and new voltage
levels present in Hawi SoC. Also add RPMH power domain support for
Hawi SoC.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:
- Squash patch 1 and 2 into a single binding change
- Add trailers for the new patch 2
- Link to v1: https://patch.msgid.link/20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com

---
Fenglin Wu (2):
      dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Hawi SoC
      pmdomain: qcom: rpmhpd: Add power domains for Hawi SoC

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                     | 38 ++++++++++++++++++++++
 include/dt-bindings/power/qcom,rpmhpd.h            | 12 +++++++
 3 files changed, 51 insertions(+)
---
base-commit: 33b1a2ee3a3df63e7a08e51e6de2b2d28ddf257f
change-id: 20260401-haw-rpmhpd-b40a68a3ce79

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

