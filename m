Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F4226E165
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885836; cv=none; b=XFU4rYe7EqJuSEX8mgMSEAWY4qfHQIzZ9W4ffK7g2BiM7tF6iDvFQvNF0f89nKfZbVfSmXhRcX9hpYsHkNRwxUeD1xjUywHb6Ob6Jn3iZ+T1Dk6A+R61sE4LPjdJuu01LvcKqOdb5vBWEHOu7IuMFZWnf9RY9nbrGQIh2k0FwSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885836; c=relaxed/simple;
	bh=as2K6Olkw9oeUKiAJkBfQ29l/hJM1plHj4oLgqB9CAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pVtvmBkHCcoa/wIoMHxQe3ofswVSb301uOMw4p1GdlwSw99xzV1JDueg5ewhwRVO+2ja0cXFper1WNMU7ahc8GMV/Z6F4u/OlCLGGKuVJ7LqFE+rIdOxW5snOqmuTuuWKjUMXWLLBF7KKGsYnfTZPZ8ilHK37ssRt9oZydVIVvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUiGFWLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgsPJZY0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUiGFWLt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgsPJZY0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EBfE1572144
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 02:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GruohMJr1MJcHN3mBUM1hv
	z0MEHN2CgE7L3SL79Ae2g=; b=UUiGFWLt82y45uxMLhYUVEVLgXPbDOZGyB/Uab
	HJza44t76d/65fRfEiT1Xfb5nDtrbTjYaLkIrzsyfVt4zMyTiAWe6eFv6rfLNmVu
	tHAwU7dxQ7z5QH1ahqR82WDnj3606YZ0vZZoFU2hF/nNL+lDU+WugPr1S0kw+qis
	VZouZlc/KrQ4RL4XutaX2wuknIFLrGsHsgaL64NleNkWh2cA7UIvqCWNoP1Y0DY8
	bCPgeHxj5CJFmD+u/FnHGBaijP9MZDmOBDdVlPvrY79FmpviR5mTVJ2dc0uvUY7i
	vlGlM5i/cYbFiCVRgyTK/obYvzs6FOoZ7UruARfgGIm8innQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8w6kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:30:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c10cd7df22so47303425ad.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 19:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780885833; x=1781490633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GruohMJr1MJcHN3mBUM1hvz0MEHN2CgE7L3SL79Ae2g=;
        b=QgsPJZY0dHu3Vf5kTWiJhrxIywseyoy413S53ERdwVKgZlAsXqmvFZMBPnnhzVnW1v
         OjAJnaNQj6YluHA4nsBaqMoHhAIC4R32UTr1zDX0AgweAP7L7vw5NGGNzOdvr0sY30T9
         eqBB4JCJa/U6yxy3BuuWBf0o3fI36Pjsr3ZDoNTfxdGW0KmNuHGER6uVCyJVlbf3OuT4
         uqznmCFULvbipjEKLxeGmfPwh+LaKP3HiZYFJuEz2KgbrRv9Is/z7ArBmUZBp+Y99n+n
         kwKpRrZSD7rIkrE1AlpuqlLZ16iMkiavAtFokPCSzEkaM/l1FSIhNhnmLXwCTPjW9bvg
         5OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885833; x=1781490633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GruohMJr1MJcHN3mBUM1hvz0MEHN2CgE7L3SL79Ae2g=;
        b=RY7ZRJDu7/nIlTHo0spmSjbe1Kkopj+FWJJVlg0vhjOAFeYzJDBwjeyHc6qXwjRKUV
         BVsi0lxL6F2cIbIagWMEBCtM0UvvmE4SQZ78Y13O0Kuvstd2dpK6cNio80mCCEEVUYWY
         Ra5abYhprhdmGnBEFabkvd/XEMQmG/ydW1bEg4jHcrHeSWogXiZstL+ais8UsXFPvVbH
         SMCLuORo5Ls7l00bP+8usVt84xHX5mQqES7NQDymzW/Xq5tQOymJ/MDRFMmkjBdIUmv2
         Uhsr8PS3yVR8Zjf0uX4A4zujhPWnThKm6qLj6sUVyrF7/6vak1Sc+nIK//ZBDzkIqN5g
         tMnA==
X-Forwarded-Encrypted: i=1; AFNElJ82NCbBl1IcovtbdhcpByENKVPr2G5ezylecmWr7kRXHymdhb2j21TXQfmOu2AnYErzNPGeqxjnvjvY@vger.kernel.org
X-Gm-Message-State: AOJu0YxoWxgVaizGkBpRH/HlhysU7zBPlHO8SkK3g8sQ/ten9JzOs64Q
	2M7tYXnLgBiL2Hebt5Zh9sah9GOaSHIGp5cGNxKl1XU0l7NQa3xmbFj/XX8PMkquTFHY9lORAca
	tNZ+0T8ZsZO+ZraRTfFmzgCOCOR4YgWct/QZ7b6R7PHix+e59Yxy+eqTOk7rgvpp6pZeSpWDy
X-Gm-Gg: Acq92OEmx02yvtfcKnVqx6PmmTV31d1zNfdUvGTLRfvnwLdcS2vyfWBUXdTEsrCiqpa
	nD+/cgLPH73KLs9VQK8mvj2FR/Br4WJAj1XfNd1oZV1OcfNbFMP/1gD90CCZgxQc1outvl3PquP
	3GpQqknECJoxAMOtbLeCJz9rpfbz8WZ9ZTmu2vQ69QjrJu1dGt1tW8VD7kSKj15L4pCgL9pRVPq
	l1Y12MZIPyilBIXG/xz7XKNUaCT6vsMSzpB8Q4pbKyYffaKY+uIr+raJGqAVhn2aW4PTIFfjzHO
	yKNIrRdGehhSCM9uigMbTV5/ja30vS/ZAyM0aocXzEbL2Pi5Pq45myRXCHi/RGjnSmOToNHTOsj
	nZMgB20MkwYMeTE0kaVEuhKNUPmA0cxz3dIq01WNIK+GFWVCY3nWVqCx3gxZP3sgdybKx
X-Received: by 2002:a17:903:4b30:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c1e80e43c8mr152399385ad.1.1780885833111;
        Sun, 07 Jun 2026 19:30:33 -0700 (PDT)
X-Received: by 2002:a17:903:4b30:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c1e80e43c8mr152398945ad.1.1780885832674;
        Sun, 07 Jun 2026 19:30:32 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm162343585ad.50.2026.06.07.19.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:30:32 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Mon,  8 Jun 2026 08:00:08 +0530
Message-Id: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FChRlEmbs9xvBsPilwuOww0Uw-U3DOHs
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a262949 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Wdb1h0LgAAAA:8 a=EUspDBNiAAAA:8 a=BifR_v5mCn8YSut0XsEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyMCBTYWx0ZWRfX6/OfSUyRf/lL
 b+N9gFjYpnT6rkjb5np/KX7+cNHTxAyFBFefQqEV7FLr8qgpzt8rpPd1cK0iG7QoreSLkSNSboH
 ANoJOzI6rbOSUvbmMFqsejdN+3fWI2rNozLnrmZvJzSNNYTGon6+xqe6HWR3cGrElkuTK9Vzwnu
 8tnP59fak7TEh4T73JMzAhlmiAd1xEVwJIYqevnBsz2P5KegsPwV7N1cWkHKkQaEck37PLFgFgL
 DzRBE47wmtsuTbc07sBdb0rjuCQf8lmycFQhWV1G+mgmEn0Nvz4Tp+zyGQy0W0EXR757rDek+2A
 cq0kaL+GaQs897a6YKvnBtjGHkuSw4rSkJhNqLWpt4ar1bVxPjBwr/Dwy203qRykpH+a/X8cs1N
 q7kBPmSgnXyfleKIVGTpBapeYke59sLqyWfB4y5nOrvMNBAW9ig6s0vqL0uqT2LjEMNjwTCRidI
 JOGFX/eVmdRYU6RlXEA==
X-Proofpoint-GUID: FChRlEmbs9xvBsPilwuOww0Uw-U3DOHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080020

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

On platforms such as Monaco and Lemans, third-party codecs are
hardware-wired to the SoC and do not always have an in-tree codec
driver to manage their clocks. For these designs, clock line
enablement must be driven from the platform side, and this
series provides the necessary support for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility
for voting I2S MCLK and bit-clock has moved from the DSP to the
kernel. This series introduces the required device tree binding
support to represent and vote for these clocks from the kernel.

Enhances the sc8280xp machine driver to set the boards spacific
configurations.

This series depends on:
- https://lore.kernel.org/all/20260607-rubikpi-next-20260605-v1-3-7f334e16fea6@thundersoft.com/

---
Changes in v3:
- Added a detailed commit description to clearly explain the need for this change.
- Improved the machine driver based on Neil’s feedback.
- Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for
    board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  57 +++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 137 ++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
 sound/soc/qcom/sc8280xp.c                     | 213 ++++++++++++++++--
 4 files changed, 391 insertions(+), 20 deletions(-)


base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043
-- 
2.34.1

