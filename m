Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520F84CA29D
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393217; cv=none; b=lWViJz3CEHS3pqZ5Di+/bwEFStNZvVk7npKRWu/Jhl/bPunSbsFJpaMr547HlBX2F0z0qnMQk234i/qZ8eupcOlgLqo6oPZzdTJj4cuZrIdKjKwbIA1j08WeOVv0rySZ4/Hwb13aULntuZPUdqxFYkVIMXKEhYxBHgHYn3r+t8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393217; c=relaxed/simple;
	bh=KLPeM5k5lWSdiT3vQwMw+gVOYBopoLfDR+7SR/YgYRY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RMGJrT9XFffVSw3gY7MDYDG8NyckUexePNeU15Z+M3VQ2EUa2BOr2qJfp2ELQJwYriniwTI+4ymjqDaWYiBdOsTXNI+aJUUNFpV2gq8RKY6U+ZCHXN+DIPj1mom57Oz04e8NY4HB1qmFgJ0+8YazJAw8ukl9hGn+5QKI0J6p4TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9e0vwCV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZH88QWG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9e0vwCV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZH88QWG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697GgnKO1423286
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 17:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4zgWP1aEWjv+Dh2OnwFE6u
	KFfoHCQQflYNpagBMN9uo=; b=J9e0vwCVjh354Ke6T8l/Jba4ZDGpJPoKSZDFAY
	dzu6xJBpSRnY3kjoe+lQd2njcmXmdJxgm3P5qgka7SqkgiuFV0wvzD4YHJE8oT7S
	O41tXKmx2IwlDR1igxSdJe+QsnZ9JdQyYciv3t8bQ2e2ng1fF7V7DdeJl1iDiOJc
	5BREM/o8olHrU5zPp1lvD73ukm+hig3jzSXUm5XUebLI24sobXuD689e5EC7KBUd
	lVm0Oc75sVU55qowxUaaJfw2xcTQoTqCHN8ocM1hh3S2QVluEOXklB0RdCp1v1PD
	07MSsbid3ZUVXjg+lwp3j42bML6MmRcYlBi4BmjaQi/HIjyQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5suhr446-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 17:13:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso4549015a91.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791393215; x=1791998015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4zgWP1aEWjv+Dh2OnwFE6uKFfoHCQQflYNpagBMN9uo=;
        b=eZH88QWGclqp1np+umM2IUpmgwt9akxrk9FMwjN2kp7dvzW6+KTGW3Au9wJsbcHIlq
         TvG29YXBQutrZtaxNJv2DyiSrTeFOhSzcGqWIfiiz6OWCMRvqt/Gl4OpW5k+whMCGCnx
         YZHkMhpo1I/Ea6IrOoqPV5Eu8coDGIa4U3La/fdzY4B9l1YD6f9xDjdZaIBuw0zY9BCm
         ulAoQGbBWW6BITATxOpZj9MNS9Zo+oxjUmEuLnNlc4xLtCTzew5NIXPQWuOHQQ5+Y+NT
         QXtxJGWM19YsGtLX5vBFj1p11bY9dnYzLNCZ4elRaD2lzuGYIimEYpSfTZGj2g5jCKTH
         mmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791393215; x=1791998015;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4zgWP1aEWjv+Dh2OnwFE6uKFfoHCQQflYNpagBMN9uo=;
        b=w/nvh+QSzSxtuKRfSVNm33BokyMEYm5mfkWFx7vjGv1ak9FdId4Y7uAmtyWwa1D65W
         ffDjCVdZWklBcCocgZFJ+wxfK/DmXWjH9KifO2GVPJvOv/uF0Ek5Yc41KZzlxX6Uug+j
         cseXQcOeCt2Ebs1DhdEHzPyUdQ1WRlj2bzf6i6m7K8dZe54FJgYKJgWi+Iy1CSj7ixHw
         ZVmG2c5vteU9eIWxTEzFOt9CGby7AIalAEIi+vORs7fXqLrS0pvjdTYNtG9ladAx+66N
         3Z235Q91ZSRJ5LgZWsrlJJ47ZPKedA+uQNGJ1aNG6C9qT3IKjwywZHtm9OvvZ5xsSsdb
         HgMg==
X-Forwarded-Encrypted: i=1; AKwUvBzZ/XJVii/qsW/dwhjmfBTJwZz/ZhMnKn6+2Ss6glbBQpIly2MaZ2g1bUEPbojusoqIYRdcqWzOzcMC@vger.kernel.org
X-Gm-Message-State: AFq9FYK/A22+zUMjQc2miR1EKMap1jtugm3gyzzdkE/eEjCYIm07AJzO
	rn+b3XTCP0JKsDwerunr36loWFSHDysfdisVV3XfVvJLFnfmqKwV7+IrPuGy6qgtq2G+KPXhxwL
	sapSBDTbFituTjSV48CrZeQrmsSbA5dofrYVj5yZCEUAGQofxaTy9qbOZBeS6tGHN
X-Gm-Gg: AYBFou0IYuSjjluhxzzdB60HUv7EiIVUXGmQCRqcWr0VuYeL60P58idXZRrOPfh8kXt
	Q8Intj8et/Bg67KGiX8DdCv3t6poRyLYvMU2+3NNgd0D/wiGASeQJMiIpxo81JS52nyyfX82lkm
	BwY4ncTTpXq2h1XR6BclqpA23mlaCOe+bv7m1AkIkfKze7OQDvZW7Sr0BmVNbeWO5mxgaTrtXgN
	W3y5Utokb4XHvbrTStu6X7CxauJm5KxuLPZNi7EOQOIt4reiycZ69fUUul9lXInQVlzpyjgSSaz
	CQuMun1Mquw8gxQB5LzaldeRopglBRv3NxorvqLb1ggyWelg342uzReq4+ZZkspNUMMCnIykUvh
	nvCP1SI23t+AJmRpWTfAzIBN/AIa+MLt8
X-Received: by 2002:a17:90b:134c:b0:3a5:3f7:27a with SMTP id 98e67ed59e1d1-3a8a1d3ceb8mr2287585a91.67.1791393214611;
        Wed, 07 Oct 2026 10:13:34 -0700 (PDT)
X-Received: by 2002:a17:90b:134c:b0:3a5:3f7:27a with SMTP id 98e67ed59e1d1-3a8a1d3ceb8mr2287548a91.67.1791393213986;
        Wed, 07 Oct 2026 10:13:33 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm303304a91.15.2026.10.07.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:13:33 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: add CDSP FastRPC extended context
 bank
Date: Wed, 07 Oct 2026 22:43:18 +0530
Message-Id: <20261007-extended-mapping-dts-v2-0-fa9e14900313@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALB9xmoC/3WQ226DMAyGXwXleqkSG1JA07T3mHqRg2kjjUMxo
 E4V775AL9luovyO8vmzn4JpjMSizp5ipCVy7LsU4C0T/ma7K8kYUhagwGiljKTHRF2gIFs7DLG
 7yjCxbIwKzhsAba1IX4eRmvjYsV+XVx7pPif69CqKlpjtTq+z9w2uKkAZ5kFyekkSLJdCKklVg
 RrR6hLOnz3z6T7bb9+37SkdH1uvAylpno+aCyRaEbxFa8FDwL9pzjLJrRKnOit8HnJtKqNyh1h
 4LJ3z58p53XiFKoeqTDfTiG3GW+SpH3/2TS56H/J/m21pi05GrgBypUejMRyMxGVd1198NGHuo
 wEAAA==
X-Change-ID: 20261006-extended-mapping-dts-f60dbc6221aa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791393209; l=2098;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=KLPeM5k5lWSdiT3vQwMw+gVOYBopoLfDR+7SR/YgYRY=;
 b=/TvoFC1DQFG7W/w+IxaCdj99ptmQ81FFBTQHR6HXBCY6gXFBLd6ibAuBVKRSdcRoMrGsMel03
 dEoiEzL4n6KAudVfgLXZ72vxZlWMSksOje6cZdkH/4uzecXRrscF+rw
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: 1aAezZjTxWVyx1VG4QhFoOjNMH44ksL-
X-Proofpoint-ORIG-GUID: 1aAezZjTxWVyx1VG4QhFoOjNMH44ksL-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfX5HDS3E6ASXDy
 huSDTpvxYSkvex/i1qSHjQJTEP96LEqxBVYiJRQRhpP+8Yjdi1g7OhrZNlezcDXxQAIA8OhrXCJ
 w4jH4IYklm0lTDkI9X2BE6v4HuvTjSY=
X-Authority-Analysis: v=2.4 cv=e9qT2qp/ c=1 sm=1 tr=0 ts=6ac67dbf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xjH8PXm33EyjZHmDB5YA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfX8P15lHoDSNKp
 +2rr+PxgbmexoZfhlyeHgWSVyM8WYDoi4kJQNg3gjeBl1phlmLItxecIysknm6sPVYoD4jvShaG
 mbx/9KGjYc2DTdUyf3RcaK0RB/iMmH2TF4SbsqloyFbV9Dya8ZVz4f9Bo51hxOXZHdXynLRZDDG
 ucYJhRYqWLZP1UeeeC/s9lInIReQDhd4GxUkcoLX/rAhoJ5p/Iqr3+eFocvSsHAwkr1tUpV5kRF
 IIK4ndIma4ib3ORo34QXk3+esAx46NfYGsx6kaQWHJnVK2dR162DNDpWku5CwRqHFSvB1/Y5uTd
 1Ld+GsNroIc3bswK6BphDtYyRYAIlOooatfTSy2wUwodzBN6oGI27gQNAzlAli3tjrePuu6b8R6
 cMrYbQ8c0wuo69BLsDlqH6XVPMKPMrFI99FRtkVIL9+WhJBAZbYrCcaJ+eFMUYmMZRHZd9+Mh0a
 F3HG4GufzMfpG9MK8eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070067

Wire up the dedicated CDSP extended context bank on kaanapali and
glymur, enabling buffer mappings beyond the standard 34-bit IOVA limit.

The FastRPC driver identifies an extended context bank by the presence
of iommu-ranges on the compute-cb node. Each patch adds
iommu-ranges = <0x4 0x0 0xfc 0x0> on the designated compute-cb,
restricting IOVA allocations to the [16 GiB, ~1 TiB) window. The
fastrpc and glink ancestor nodes are bumped to #address-cells = <2>
and #size-cells = <2> to accommodate 64-bit iommu-ranges values, and
all existing compute-cb reg entries are updated to the four-cell format.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v2:
- Replaced prerequisite change-ids with message-ids to fix patch-id
  flood on lore.
- Link to v1: https://lore.kernel.org/r/20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com

---
Vinayak Katoch (2):
      arm64: dts: qcom: kaanapali: add CDSP FastRPC extended context bank
      arm64: dts: qcom: glymur: add CDSP FastRPC extended context bank

 arch/arm64/boot/dts/qcom/glymur.dtsi    | 31 ++++++++++++++++++-------------
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 29 +++++++++++++++++------------
 2 files changed, 35 insertions(+), 25 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20261006-extended-mapping-dts-f60dbc6221aa
prerequisite-message-id: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
prerequisite-patch-id: 425dc9414848bbc3f2a053d067195d849898e2ae
prerequisite-patch-id: 4fea14b47d11a5a3e18065d8cf3a461841ee2b86
prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024
prerequisite-message-id: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
prerequisite-patch-id: 623ce2b8bb3c3109e8725b5c6da321c5319b2845
prerequisite-patch-id: 507349e8804b8b4ec2afb32f0bfe887ea0988e1e
prerequisite-patch-id: fad218522e72b993815db4b91d4a3fb69b1107c8
prerequisite-patch-id: 918c24e26e0bbcedc4ae2c73d80b9ad3854823aa

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

