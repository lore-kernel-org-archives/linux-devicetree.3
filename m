Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D0133F5B2
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778790626; cv=none; b=M2MbIWVHWq6hZ3cLWo6urorJnomAamb5TjtSoTYyBDzD3/4ON6wT1PfkNnr7EEXft9eH4f4kh20EtG+i3HqnU7MasYYGs7m5vzP4wYfVAwgBKs4F/xhci60TeEk1+YyGxFLDcJDRs7huAR0ef1KFBGf6SLlRroyPubH6wsw2yWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778790626; c=relaxed/simple;
	bh=hBUEdU4gtKk6cuED59MJsN9YQuh0ekZNAnrR3Vh+OK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LGtpTXMGJeJxg9QT+udeV9hGkkLnCPR/DabgYE4Q0uBa+Bnte+O+Q30oV4aO7YNkrWCNt2viIADbFB2V8WcZ7nx2k1gJk6BHBkjoRintNiIk3SzoRQeR005j2CTo1c/+lZ/VbdZ0WvUOlx1IAkgU6JHQElj/QoEjcka3buzpNdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOSGp+Sb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QW8b9F5V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOSGp+Sb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QW8b9F5V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpMLl3219660
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vy4HqHBCl3ieq4x5BJeO/r
	Gc0+4lnXTUCuMn6y7ah8M=; b=VOSGp+SbOMvsBs+w9+tYr4c5v0kN3YZkG/J1nx
	LSxwWVNuoRP9trDM2Rdq+Q8WfyogGYHnAYsvFmr1lQTsKMgSTMR7nznXj0L6wije
	Giau2uoI7ZL9Oerd+FJah4y1Qr6VMv3f6lu5luf1Bc8qnnj7Tf52To4kLvj/B5Ls
	mis9M8J9Tbx+X7SUQdg3YdGZB7amAfGk7UPDnEXLJMP+vb0YL91b23Q9pQW8vskc
	SmLCuYSkijL1GgaWk+c+4NpQRJ7rSh+6sEB4JhAGKZDu+LsE4LAsH8jm3irfliMx
	Id8K4W21xkFknukfSpL4Z68JJJzm8q5bhYvkh+uPqpy+TuRg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s09s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:30:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83f24cd00f8so647596b3a.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778790623; x=1779395423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy4HqHBCl3ieq4x5BJeO/rGc0+4lnXTUCuMn6y7ah8M=;
        b=QW8b9F5V7Xdwe23X3rFoDXtLzJPqCGz8NQ8mivsdZiepK/NAdj2YkuVmxncUNyYFOv
         ej2rvvetbUprh90vzPErlDi/GRxnO6+I5x7iQsYDrzFYIO8ffEYuTmhuTcRJGRNFsc8C
         yYKWsGvnbvyyT19WyzflsjNKOkWb3hmxumP7fsQADMi2iKELih4XNPROPQHL8FqVDb+S
         RdxiphLOVHNC1/plu6nZCK9yB7tB8nrKatCVR27KW/dnlcFKxq5pFhnNf7XZrLMDTkfH
         F6XXLpd2SlyjjgD1Gm3G8+3fWjYoMt0nWgcco4UsaKKqBQuaFLHEsgQjLrsx1hcS1Afp
         TJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778790623; x=1779395423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vy4HqHBCl3ieq4x5BJeO/rGc0+4lnXTUCuMn6y7ah8M=;
        b=MMBv7E4zB4E6FSZaxr+4tnPQldEFE6hdMWmUYN/9nzIGOFijKwPECg0Cn8ISS0BaHB
         wpBy2Jkk0iYiNbNhPT2maph1tYkpZd/9AoYeaC2FEjInr7RahA9qIgXcXbT/wppwtUsc
         sWMRG1dUYZOypuyOJQMR5FH+QpMrW1d88QyI51g1IiTEJOJI2vdZ+bF2PyqE3L0ePeXx
         5h9JFi0py+fG1iQvgxrbEl2OL5SU7XGeiMKGHndqrmKzna0DnybLDpjFf5sgUucZTXzO
         rvTMVtgc1UKZASAIsUYLN2JoHe7eXbgA4VW9iFvCe9/HP+Txmly0GEoTXJk13CCCtXjB
         OeTw==
X-Forwarded-Encrypted: i=1; AFNElJ921O0XqPKs61cah0dE9VICm1Hi6l2MLi35KXdsx1BIZKpEpEuyE5ybf8uM8bKXT5UCPZA0eIca2wqX@vger.kernel.org
X-Gm-Message-State: AOJu0YyGQezqiikssOzDIOsUHKInIYa6FfwsUmMP9PI/45unCqWWEp3v
	fMO1tjxOHNfJZTZNgJDpkBPQlf+xTXmIu0kOiVwpZsMd2U3mLsVMSKd0c08OYcHkcWhhaXpwodk
	MDOHfODQ1ocWvkRtT98gzh0zDLcpxg7vf+8U+MOd0a4anDpUbLYGynqL6gpbpINBV
X-Gm-Gg: Acq92OHZ2mRmbk4/45TXKCgk9C+z7jTFEOkPsXtqpPiuleLFAF+1U/1cD6LVlOqtYlk
	eKCWSS6lhnoFjj65pyUePKeM2aPMannVgGsY3IrUPONPwwjk9X1duyI3mclQFvvxC0pZuS7RxOy
	W5Wo56J7Buc9x3LZNhrHB1tua9DzGXgiLyboWQxa3fBjLNqrLg3tquyJ7uLphd22nUDzN3Gi8Ra
	MS0W3qVspGu6cie6Vd9NmTDVAWd7a7I3+ylHHf8ixjh6C2H+Cxnyy3Hm7kF1Yo6oyU3OC5RYd96
	zy0XbMKY43AIz6sbev9wfALsaOcylzFRck3eF/U2N1GKnBYmp5zrDYFx6A+G8SI9PBuoqTLtKuY
	2NVYZriJHeBybOdTp/kNK9RXxqdeMZGb5Q+jP5AB1qORQpGpN5TVzwks=
X-Received: by 2002:a05:6a00:a214:b0:82f:7ba2:e120 with SMTP id d2e1a72fcca58-83f33cf0be8mr1091879b3a.28.1778790622722;
        Thu, 14 May 2026 13:30:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:a214:b0:82f:7ba2:e120 with SMTP id d2e1a72fcca58-83f33cf0be8mr1091839b3a.28.1778790622172;
        Thu, 14 May 2026 13:30:22 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm3666952b3a.1.2026.05.14.13.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 13:30:21 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for ice ufs on shikra
Date: Fri, 15 May 2026 02:00:07 +0530
Message-Id: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8wBmoC/yXMTQ5AMBBA4avIrDWp+gmuIiJVgyFBOioScXfF8
 lu8dwGjJWQogwssHsS0Lh5RGIAZ9TKgoM4blFSZTKNY8Eiz1Q0ZbFzPIi06qROFcZIr8NFmsaf
 zG1b1b3bthGZ/L3DfDy+FWL1yAAAA
X-Change-ID: 20260513-shikra_ice_ufs-59d0a42e3482
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIwMiBTYWx0ZWRfX2twVaz1kjBvH
 1D1zibmgnaFlCJoScGneyvU5WN6zl6WdMNUj8x/86jgeIC5ouS1pOnEgwUp5MroolxvyT2QWGmm
 +h6NQu67/faiQWrEDL8wLbRB+fgiYtbxAfXRE9HVImO+njDNyEYJarbdB22Jj6j9T3ING0eApQV
 gpiFyvTbrK0NKk9b/+iIKIQndRKNpvlJ4K2qNn+gmC6TBXGCWMibcSynU9nvdke/USDJDr7zmRs
 BmVDezHvbN3mRoHN1vQiPW+Jr9a07LDTUxAlpPotfy+t20JcNTNkP772btisiDa+uKtDmAcG6vm
 5+EF5aqkBaLETgvHcex/3lom1fdsMihUKKtOqZpaUAehdHJNTMHWbbeMR4Voq0J/zGoi6JH6SzA
 lUba3YCYCu9y4uxTla8xN+C/ISh+BvYJJE+u6tBMJIGn88rv+ayW6nCksylp1ZY21/CfXBQXc4V
 5jv2UtbQ6NMQLoQJwrA==
X-Proofpoint-GUID: w6ed7RmROz131RJ-8EYEwpcVTobzfdGg
X-Proofpoint-ORIG-GUID: w6ed7RmROz131RJ-8EYEwpcVTobzfdGg
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a0630df cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OYeRMZJyD6lClM-JVRUA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140202

This patchseries attempt to enable ice ufs on shikra similar to other
platforms.

Validations: 
- Driver probe on bootup.

Dependency on:
- https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
- https://lore.kernel.org/linux-arm-msm/20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com/

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Document Shikra ICE
      arm64: dts: qcom: shikra: Enable ice support

 .../bindings/crypto/qcom,inline-crypto-engine.yaml           |  1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi                         | 12 ++++++++++++
 2 files changed, 13 insertions(+)
---
base-commit: 7e247866bbe72314f68036d5171c1af354ccdbe8
change-id: 20260513-shikra_ice_ufs-59d0a42e3482

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

