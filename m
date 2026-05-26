Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8B62E5B2A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779767178; cv=none; b=GYFA0LkejOp/71/ezyv8ednBJOht7Nj3BM/AjCanDWUJEMZEpOoCQNzRaQfyIVMJIIXeY3DoqK1+svSghUdRrrOJypeM4uTN3CHR3mV+x4ODkb8Pl9cYfiZPh3LAXvo92Fje79UcsPD8VGXLKCXuijjabjUKlf5cfptQFqADKZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779767178; c=relaxed/simple;
	bh=CVT/mzSCwoUzKJUV1vbwRBVnk2DsjzQRIpUY5ClQGl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RxT24SJS1423Nd+NifzjKVGl5G9lP1o8NJvySbN0/sY75HfzlrkDhlkM3BIv9V0mT9C0iARur6/J5Cc3ZsuaT1UnqJp+mlFjmitng+Fa6iEISegtW4FFfFhMrCjh0+pITjXiQNDOVDGPjdZ2vf1J8at8MeQ+2rHZUac2EtfhLBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yd33+C8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1aSE+NW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yd33+C8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1aSE+NW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PNT51Y912458
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vEppKcgqZrnyhUnESr4bXm
	ax6T01gEJ8xofy7jdRalA=; b=Yd33+C8oOL0xNKe+PcRx+cLGyPGGGmVOeSVgyK
	aOcrkYEHJQOdljFa56zY+gv43/uqtxYxgD2q8KH/mfoZjb7pukwXV4juHpb/X3Hf
	Fi0aZB/r5mR6Ph3ESLMBfWaCgcAinlp07p69/xkNwyfhTMSvCwpbFO5zOQM+JWWy
	Oe2cUPesiBhtR+euFycxSISvYoQRdLzWBRL1oBzPhVNfQ0czIdrV5KO4MipDQQpe
	39qIOtKTjjaGot1sGpMHfI+/5HX1Nj7cT632vvcIGnepE1OfOI/hGsd5l22JaolT
	iDj6wt8XHYxJJYmixJ7rUQuh/gnWAIUojmCJGmSY2+fjhuIA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm01h1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:46:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so15894631eec.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 20:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779767175; x=1780371975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vEppKcgqZrnyhUnESr4bXmax6T01gEJ8xofy7jdRalA=;
        b=D1aSE+NWfSSfxV7V+dzzoao7fsQBCVCMpXYEUQJ2XNTm4d2Ml/YzvGBUG6EEelSa1m
         TSa64qnD2XadflRDwG1GtgGDjVC0LJnZZSeilDSB0psWO7SbWo1dOT6+O39XP3Q3GB87
         5/b6gnE+IhpH5ezNipDeaAIVeH8Q+yLBjkfhRiak7BcSvSioLpuBkdGOLmmsV1kWmZAD
         alE0+j1xMa6JIWnXoEbIgTaMGZ1cE6vg4EHIZ5H3JUOfOT26jnhtcZYqrPb5GucE3zyj
         zE5aYHWNTUhrTgJ/VmSbb0gTXD0gr9JljoMfS607zePeb9S978jSEg0stNdCDCqAQXFX
         yclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779767175; x=1780371975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEppKcgqZrnyhUnESr4bXmax6T01gEJ8xofy7jdRalA=;
        b=Lo4LcQYkFEq9vbuKUuURrwG1/3d1+LFZvbyoC6dgTDO3zaIRNGvHYgUCaeOyZG+10z
         tLh3AHXpfczPQ4fasKbQghFAnyKmBhX9W5v1cPj/So2GnA0w7PLNEKIIh06iZG1AgYR+
         pA68B/rEJVQV67lUG2xa4Ay8fFGP+xkRso5VWvC39Fj8IPbMoN3KVfKX/J+m+qU45d7+
         IIqB+dxLJupB0qQO5Icp2MX7BSDRdPGgel9mefQ2rBm9l3V4VUVEoEL5hoNCnW23RoIJ
         rLNfWzcVIigl/JjD4J/mWMc32xgxiv+2pb/Im8Iy0jMjA7U1wZaZf8pQ8fkE1+06py7H
         EG+A==
X-Forwarded-Encrypted: i=1; AFNElJ9xwpDLgAp7qjgN7hspypLXhAVPnApuJMsnfn1elvMOC/m6d8eDbgydi99WalekMIFZOA/uYqF7EFNP@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcgAVNVxw9i7+8rRe9nSMkePn+5vF1pL0m0ykvEhpGwUZfYAt
	1dNuuCrV3kxNgd9OJqG2WreWWGZ8/XdVkevXJmLzkoVCTkoBpgQ+4r7+8q41tPwyGQZd0PLQydZ
	dTXrvIFH+S469Xk5YMjwF1hu0OhsnRljhuRjk5UHjLSFyC73ONCNgz5Vw8YB8RPLc
X-Gm-Gg: Acq92OFXu6qHud0zqX7G8/seZCeW9nRE++uRQSsCulRxum+CxdfQ0Kisdj5Y4dP6ziG
	4H4OEuwiOo2iSORTPIoBYGcM2QIQAYyj4iHk0vMNlgTKFMRQHnflZztxKzq7482MIkmK7paIucy
	hvva9J7UfSANPL31qlheMyAVQHLTFhUhafolQwgfL5twFM3cinrivOzsv9IPTYfRPOUluY08lt7
	3ZBkUGQgmOSswP8tffOazSvN+HVMnN9ATLcvyDUq5S1sjAGiu/lv4HTPe3i8OdjnGVxNnZPls39
	fAj7wTOndfNq1a8i+sisCnCmFvQvlmaydjucK2WfnFDQhGdiFGqHbWb8Wb8PeecFVtnMwd7ewkL
	r6+x3xtop63mLCSnZZMGMBOdD3XF7APvSrd1dTfFmktOm+/w7G9U/Q3/4DzZaKfLhJh1gVbt9Xq
	cJ+IICAA==
X-Received: by 2002:a05:7300:ef82:b0:2ed:e14:7f5c with SMTP id 5a478bee46e88-3044922ee86mr6952278eec.32.1779767175249;
        Mon, 25 May 2026 20:46:15 -0700 (PDT)
X-Received: by 2002:a05:7300:ef82:b0:2ed:e14:7f5c with SMTP id 5a478bee46e88-3044922ee86mr6952265eec.32.1779767174693;
        Mon, 25 May 2026 20:46:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304522547fesm9792271eec.21.2026.05.25.20.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:46:14 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.or,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Add initial device trees for Nord SA8797P
Date: Tue, 26 May 2026 11:45:52 +0800
Message-ID: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a151788 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GKQnK2gSpAXo-FtYTtoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: FUNkhZO6ifoGeYwotXId9A2fZE7tulEN
X-Proofpoint-ORIG-GUID: FUNkhZO6ifoGeYwotXId9A2fZE7tulEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAyOSBTYWx0ZWRfX0q1vRgEoufz1
 c23NuYYK+f3GsoFsTW3SkSzklTPazoEvUd1QL1Pjj5rjiARUpUApWs9TF2cWa5F5sZMQDCnvRwS
 8ZbetGeXNKiqUiAY9+6+9J/jSbsPPXJihZceABL1K03dwpPi8SvYHOaVvi1zkXP1y9TmCCoVKCK
 p1JZwmvO126V5CTnPQuua7PkhGT6YtN8Hu0Q2m76JKotBf4QHUOKJYJzWMm+U+Qe0qOtUh7S9dJ
 2yv658UtWY1P0Td4jLVjnU/7T5lL3ykwJ1aqg5qeBbciSbHNyxZQQfGO/+eTpj0/nWDwr2HnIa0
 fn3OOs8lEjsWLdeQkZVA0a8xsv+C5UryTbS+EfKbMOiSQ1tq4wFx1OKfHoHwrCg5Pyzf8SczpXZ
 7QAhSzC4o0e6dbcTDKbUc5xZ8WuwK+q62XHweogTJc309dPwCFnhgHdBHtmFZdGBbWAGvFjQNCg
 aHj8bY+6t5XnL6Nbdgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260029

This series adds initial device tree support for Qualcomm's Nord SA8797P
SoC and the SA8797P Ride reference board.

The Nord is a new generation of SoC series from Qualcomm built around
18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
is the automotive variant in the family.  The IoT variant IQ-10 will be
added later, by sharing the base nord.dtsi with SA8797P.

Dependencies picked up but not hit next-20260525:
- TSENS: https://lore.kernel.org/all/20260504081236.825755-1-shengchao.guo@oss.qualcomm.com/

Dependencies to be picked up:
- RPMH powerdomain: https://lore.kernel.org/all/20260414035909.652992-1-shengchao.guo@oss.qualcomm.com/
- APSS SMMU: https://lore.kernel.org/all/20260519013950.873105-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Rebase on next-20260525 and drop patches/dependencies that hit linux-next
- Improve commit log of "Document SA8797P Ride board" to explain the need
  of SA8797P model compatible
- Fix the real issues reported by sashiko-bot
  - Fix unit address of pdp0_a2p node
  - Add missing compatible for i2c15 and spi15
  - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
  - Update commit log of "Add device tree for Nord SA8797P SoC" to match
    code change
  - Sort sa8797p-ride thermal trips in ascending order of temperature
  - Fix sa8797p-ride thermal zones with identical trip0 and trip1
- Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com/

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord SA8797P SoC
  arm64: dts: qcom: Add device tree for SA8797P Ride board

Shawn Guo (3):
  dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
  arm64: dts: qcom: Add device tree for Nord SoC series
  dt-bindings: arm: qcom: Document SA8797P Ride board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../crypto/qcom,inline-crypto-engine.yaml     |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi    |  937 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4513 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts     |  306 ++
 arch/arm64/boot/dts/qcom/scmi-common.dtsi     | 1918 +++++++
 7 files changed, 7683 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/scmi-common.dtsi

-- 
2.43.0

