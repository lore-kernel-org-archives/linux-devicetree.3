Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDFE416116
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344036; cv=none; b=rkC5ejs/a1iM2FT9xgAd5BJ8T3VD1I3xp56srZmG9o5RXXCMbPZwKw5OuchYrAdNx/OxW5L0V8BTUBZPlaV3ngDWirZ5ZQBKFIt4rppCN43Bkqe3IYXY2cPBrmJn8UJg7uRxQKpzu+LZXcpmxm0KHgvXs4ewuJrakUyRPerdxkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344036; c=relaxed/simple;
	bh=S8aOiD6kPweC/tJWFI42QZAWP6Ddl8c12bttFcXLfvY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Zm/FAvFXv1Z1AcnsZqwogcP/R3OjdF8yQIM29OnHQ37map5SHQSiyf+SOlnS2qeUvWZdBsVUcD1dumrXC005ThzPpX3bp7gVZcjKafcJO/Be7AyCrqhSTiFAsH1RYmm8BHg5TshFu2AtNbC+pqn0guIoCMhiS9D+IU6rObpmMZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILNpFzGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCmVLdEm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILNpFzGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCmVLdEm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDT9395293
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eS3eqDZj9HB7tnhetIVQAe
	69CtHFPPVH/7Y5nUjkDas=; b=ILNpFzGxkiVrWLpPzBbI1WBWeyABZaA1jgrCvC
	M0EFdIckx53IDkq9KqnJndg5i15kzNDISXv6uh+qnS80PENta+QUknDBMl36PlZ0
	eX+nK6UvXQ1SZHRsYWd3vGJhpSk8vx7/7CsDpJ2Z/4EbngL4iYirHD1GkrmeymR9
	U02eFhqEeNGHRzxnP9nEGvMnXfT0lnvDUFUl7KvgpeATIa2omqfsMKgnS9Tow8Xq
	84WSP/aGzJJLjfKC+1VMJEIRWhmA8BBe04mW/wDFebZ6ilVF+Zu5tFnQLFzuy75h
	lnH9ZA9fGKNHSqnqsY8eMCKuH0Zg/KPFXFWqqwEpEREj8s2Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpgvaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:20:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so39934515ad.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344031; x=1783948831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eS3eqDZj9HB7tnhetIVQAe69CtHFPPVH/7Y5nUjkDas=;
        b=RCmVLdEmDf4+rlPl6OMroEsyIrN4prZ39S8/pfTk8mPeCQGijldLdjBXi4phPbf3kv
         0VHuISEt2HA0BSjFVf7COeHTHWsajwcznTapnP9VgR8JcDaJbj6RWjabDHV1C6zQt1hd
         4iUvDSDmI/P4cvyuJ4R32JZY/546ZOUsYmVqwntAP/7pkhFikMfpsh/8boinbzNX+78x
         QI7M0SLUn0YkxrKcO3uXISqY9KbN4M1Qp+z3Dg/q+ucpWECR0Xv0ouddCuaUnczGf5TY
         X/VlSVrfbphxhqnDr+skTZGwk9sjejuC85j6u9QMTKpsvdw9FF8PgwxSMJEOMamu5pmj
         a2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344031; x=1783948831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS3eqDZj9HB7tnhetIVQAe69CtHFPPVH/7Y5nUjkDas=;
        b=DHcX2vYPor7leekYiBNhKAh8zancw1UDcNgYvY/ew7xw5lOsiFIzmT0zZmo/CjIIm5
         adA9zivoK6unQc0N4q0GzjMgrg7Xmb/q4vBME24Ho+Die2z3jXhAaktSeFUvcvsao7tY
         /jObAaV9lxtrAju0GZMAPjjor+Rl5PlemraBeHfNp3od97rhe9pVoJM4SOSe+De3YpRS
         SRxlXIPgwC8IwsqfQChAINKROeH7A+y6bRmxBY//K6/QSB8LgWLexDXv62Exchl5tuLg
         loyE+7D3eQsaReNT/1rBz8HE3An81ooQ8yrTwGQ90NwpA9Vv4rrsbtgenWk3Kuk5bJVx
         IHsg==
X-Forwarded-Encrypted: i=1; AHgh+RojlhSlr257yn/q9waW0if+bGDXZ+v9FfbtlsUouk+FOecC56ulqGdmIk1VC9qqgxoMBH4EywwtK2bs@vger.kernel.org
X-Gm-Message-State: AOJu0YycL6pokoSTLJGiB50iHpPemqrlG8i+uXVo8vizh9i0eIblCBy8
	NFOm0Cu6wN/D4T6Jp73lCMdwOrfpuk1t7klE8caJ41F7+rGGwZ1wcxuwH5IDVxBahDfqR+MuFi7
	2zVCNIYjRHy3EmH+t27duXmIf5b8Bx4aEJrMW5v0Xd2++DRKaMeWfD3jxkOb02dn8
X-Gm-Gg: AfdE7cmQiO9v7b5PEgqkIjr8Dk2He80/XYrSHduws2+hdTxChLy0JBYCpsbJCTZy+Td
	k0D5ULtzYVm6PaOhnzVx65agig92ksk5MeyR+A5PsDTeRQbdYeGIIH2i+QOTPKl3MGABt9Wzr7o
	OToR5zEwIXbWH+Ubm17UtK0yEnhBVSFIshyxWwZgjzm7uHK6dLBse8ZO/q42Te/51T7UcRxpDr8
	o5O7fnBPhztuVqW45J+5DCOIhY3lTpv7vt1L7WEI53eCkeX4cBM/X8cZEUPfyB+uHoWxYl97QV5
	ghAjsAhTbGLrUgMtYVlPhSt1DNFYmEWu/S4I10F2o7D+mJcBELhy2nE1nmIApKG6p1ewZtk6Iwv
	THXfWWBiSeGCRpfQoYcBd0SOJqGZEoHMTBvAE3E4jiqjSWHM=
X-Received: by 2002:a17:903:2c03:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2ccbf07a0d6mr4453815ad.23.1783344030607;
        Mon, 06 Jul 2026 06:20:30 -0700 (PDT)
X-Received: by 2002:a17:903:2c03:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2ccbf07a0d6mr4453145ad.23.1783344030031;
        Mon, 06 Jul 2026 06:20:30 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260d2sm51173095ad.10.2026.07.06.06.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:29 -0700 (PDT)
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
Subject: [PATCH v3 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Mon,  6 Jul 2026 18:50:06 +0530
Message-Id: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4baba0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BifR_v5mCn8YSut0XsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Jo4ZJuAHuZZopq3mdlZWJtblUjpten7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX/qVVdtfGvtWN
 KLPB357YZMUAtptd1HZri9hYH1GOy82n7l29QbAVGAkZqGkI9P2t5bOg85T1jrHn532p5KHw5od
 LIm87S/2HVuK2dSgOs1XVZTEofUX2jPtBmImuaCldkRBsMTaZLe8hZK4ey74xfXWIYssX/lMYF/
 Ft9zl6aJ4X3iLfTDhOpIpdIPOc2SKGJR22BtW2sNXjXr9JEc6vB7QlvMFpIukHxYfWrlZ4HZPKu
 yQ6TBDpIHlDGUHawgUnGj3wW90G5A2YdwkpEo8dZtIZMt/ZMYmdlFJZhNR89S3jsg0tneAhfTuy
 uSq1OoNv72OVLZyK6F2olc+1wzfasAknNJbh1TJA+ziWsxUwYgl6zBEamD6ejGGPtdOm4k3d0/k
 wTzDy8DWG8SzV1120eh8SL0TjiIw+jm2X7I0GewWpyDmpzkzohn0VJVMcrnw4oQlz5QfVdf6/rA
 8hoc/z4+8NL9+V41vhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX7YdkjsA6QYQl
 bs/MuY2blbtYmH+CAJ6WUAZF+6SqGGBUcyuFfdh3b3Zr/7gYmex1DPTZ+vSf0tdSI9p3zTB0K4Z
 KULagqoOMZPb41R7+gAEGl/rQJ+7iz4=
X-Proofpoint-GUID: Jo4ZJuAHuZZopq3mdlZWJtblUjpten7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060136

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

---
Changes in v3:
- Addressed all review comments from Mark Brown.
- Fixed OF node reference handling, clock configuration, and sample-rate
  handling issues as suggested by Mark Brown.
- Added proper error checking for DAI configuration APIs as suggested by Mark Brown.
- Added SENARY DAI support alongside MI2S DAIs as suggested by Val Packett.
- Link to v2: https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v2:
- Added a detailed commit description to clearly explain the need for this change.
- Improved the machine driver based on Neil’s feedback.
- Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for
    board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  56 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 154 ++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
 sound/soc/qcom/sc8280xp.c                     | 245 ++++++++++++++++--
 4 files changed, 437 insertions(+), 22 deletions(-)


base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
-- 
2.34.1

