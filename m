Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8626941B8F2
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165170; cv=none; b=XM89djdRsWNbizptBjj4nP3fhShSO8uwE2/VV6zfmZX3cqdiFgjx4F93S+V+XlTh3VhDN+9Bpp1SY6XKphWYxtNeS3cZBO0IfIvjyyCA5p3UTkep0jEAOHsZO5JyM5uDpkqOTn9z+FXoCn1nhpv70rc3DyDKSOIu9eTgpvIH7yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165170; c=relaxed/simple;
	bh=X6GslZBw9WDYaLf90dc3c89oMdXy2p8giiAFf9HTeYg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Z4fLj2xRtI8PLVNoIQ4F3cTwHvOcn8P516ozdby3IOpcLsETc/8Y0qv/kpXBfoHWO/Tp7QYQrNOcLv3a6vFkkYKi1s9dHLottJ7m7DUbVr+OmNhUy9hDNPbfNjf4LMR1GyIl/aMgIRRI8MB4yvR0BHLsrENCuBMg5qNHtBW/1tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iURbuES1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+VQyThL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iURbuES1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+VQyThL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDliKK4061201
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2Zq+RFnkE+KGc27ny8j4uT
	2d1IIiK4kFF7h4JELICCk=; b=iURbuES1tqksNnN3jy/AHNyE9RiFZkGTVMOoVV
	wbbjyi8l2BlnA3JFMlpmrnqTYz1usSXtRWn7JwyLO1GvMAGpmNXQTSz5J/QwgD0E
	vxA1QikwN1nh6DdmFDtT2LgGFCUfvSy2b2yrvV/L0t1OUXTxs9aYuhoNNzjF5cka
	dTheLQ8S2IvIBUWPhxXPybz29Iz/KKp33ytaBc6UX/rsEH9W4D+HjYl3RicxW2mU
	CJmzq4ToVU/pR9GXZQg4mQB0LiLxEjMlHgGFF0k9MaIf7LHy9JjREcud4Gsl5pgG
	eN/pQvfeuLpM5ciA152pqERxWUBx+P/HwMA74uq0AEdC5sCA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq1cpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:12:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cd01a14e81so40259455ad.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785165166; x=1785769966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Zq+RFnkE+KGc27ny8j4uT2d1IIiK4kFF7h4JELICCk=;
        b=Z+VQyThLvBd1RU9PX47bJCKK3mS8RIZPCnR56AkAmKdzNprihTKMSEW1+IotsOcXjW
         +GKZLLHE5/Y/fxhkZLfRcPGGbmvC7qh7z3kFz5oZNm3H76ptPnmzTumemleFD20vH8bA
         fi8qQ6+cTyrtVCb7MQT2ZaUbIETQ8nd4B3k8Opm6sPNnUSp43vm6st+g0rqoZ33iVh0q
         S0h9DE2B8lrBwIEa8+GCg2BB4NG65KVMnXTcZFMVRDVi9GU8jKvRG2thsd7+f/Ep6SfR
         p3aJrVhGHAqQBfqvL0LmQ59vCl554GqGZYOcXmXU4TD0e4p+5+9M1TGL1eMpK9CrG/M6
         9g1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165166; x=1785769966;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Zq+RFnkE+KGc27ny8j4uT2d1IIiK4kFF7h4JELICCk=;
        b=E6/ZZRfxZOzM/I1oS4plQ2peX0hR15tPIudFDRotbJyM7UFqM9F7syJoA/jndq7/yM
         ccuLDWBs1XdAZAZTK2lrf6EVIeFvraFMrrW0rH17nq2Am0320TggVuRp7L4cTGXvI6o6
         qp4ShMstEfz6f2Yubj68GCtF7JjX6o25amisE7DmBbAaGdDnKDoA+Vyd9goVD8nvvE05
         5e6bSWMm/L0QVC4MJ9eVyWhaOnHKHz2UjidrGTR9otdUCUnOCWUCCCCd6Nf+7zhHPmpW
         tZzKtdmt7G7i8DZxOOjAxvYhchIX1hKkAWH1xpx9LjbPnjwMGYrtHFrOnCH1QSHngz0z
         bQfw==
X-Forwarded-Encrypted: i=1; AHgh+RopSQjv6nYQQvzYZo8jQmhMVWQ0Cck6fOmWdrm1vbbZWlBowVp3SzKDjmKgTdv1JLvdH5V4me45SNhG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2D+2gk3SxrJHXti9VxihCfui8gM5RX4xZD5E1NS7gdnq1P+6Z
	BiSDGu8OOuPZv50/2MD1OYOJykLbz48aWrR1l7lOoL+lNApTOlkRfxc/OYezSpxmC05hp71G4/0
	yo5RwkLttL7EkTFLmsTvPrKwkYKn7FXAM7Jn/QXY/yOZcV7mPCg8JTirwJjCc4ybY
X-Gm-Gg: AR+sD13U68fEP805TgtWbybbBOMs0VoetGY4tQOjy2AgbxuCOZeTk2Eoe1KzCMmiTdC
	SkI56xbMwd2eCn1sxDg+/PN8ApAcMNv0+odby1dHjQ8pQt5LKsl8MLS40hYC4s8XqqvR0s0fsyY
	Iomh1MtmwZJiJDMUnnjdb2SFTQUwUGlDQGGdu8NOJa9443Z1jAFdOufBHwtXq6tlwKsLSs6EcKB
	e3hjqRCLOJv10n7V8/wO3xQqRtcTar5cPY7fiNVWPGc6zfkhamuxIEs65JSUK1VnDB1jswa+rgd
	KHUcsH7wBLN1Cnql/P5BowlXY+gJ2nLlB7r66ZJodIm01h+JQvzJ1Hs88pkJL6m8jrqoLpeVQ00
	Ry+BBdLomB1kqtSKdYXstH5Q3Y2N+sAGzqlAR
X-Received: by 2002:a17:90b:4405:b0:38e:7aa3:df25 with SMTP id 98e67ed59e1d1-38f29658c27mr8165961a91.43.1785165166120;
        Mon, 27 Jul 2026 08:12:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4405:b0:38e:7aa3:df25 with SMTP id 98e67ed59e1d1-38f29658c27mr8165921a91.43.1785165165503;
        Mon, 27 Jul 2026 08:12:45 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f1a759228sm2510133a91.1.2026.07.27.08.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:12:45 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Mon, 27 Jul 2026 20:42:27 +0530
Message-Id: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MyBTYWx0ZWRfXxUaKD8stPqau
 MnTCEYDzOD5EhqgiLE6TSkgX4SNQbIhlqTdlpJ9CsfrbbjjaoMEitR+NNr1RdVPSZsGkcwwhO1h
 4s1Z9S1634avRPgd1xvr9WLw+vX2QwU=
X-Proofpoint-ORIG-GUID: eqeAN5i7YI4uP4OCIgUJ1LyNNJ3vsU_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MyBTYWx0ZWRfX9jn7MUV0h6Uk
 9P36cre1i+0kLRv+HGNyQwIzRzEy6oYpgfA5SchgrP5B9u+dVBti3wHDygxxbRM6Tztvx/DbpNU
 Wl+a1h/GHDZ+EdaJr4ipiVKCeemCF4m94EYxoI+YyLbLxDOSTh+OIrbz8++bBQvlBelg95vdDGE
 icBI4FuUHVz8XM0wryRjyGu0L/hQlW5VgQqOMG6ihOulxbMmyhSX2n58yG75QwOUsW7wFVULEb9
 Zhl9oRoAKqEAsf5n5wF1h1mrVEbVm7VKvKOlBFtVBuOLSVYrz7lPBHaSwjDN0DIYUZjGlL6Dqsa
 +718yd28bRDmwop6kzlL63NxFIlSPK0PFhqa29D7y7r9h1T4qExYbdhz1CDeP+r9aiFJ83QfbDW
 bSIAYjGpU4El6HWTtXWxMynxqcoj8ib7EK6Ej11m/vboj6ApB801ZfOQBchtQZWN7ypQx1iQeUP
 7pDWErs8m/InqVOSQCA==
X-Proofpoint-GUID: eqeAN5i7YI4uP4OCIgUJ1LyNNJ3vsU_D
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a67756f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kcwWOOnH8nsvB6J9kCwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270143

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK via the DAI .set_sysclk callback. Each MI2S port
now retrieves its clock handles from the device tree, allowing per-port
clock configuration and proper enable/disable during startup and shutdown.

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
Changes in v8:
- Fixed indentation, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v7: https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v7:
- Addressed review comments, reported by Krzysztof.
- Drop ECLK handling, which is not required.
- Link to v6: https://lore.kernel.org/all/20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com/ 

Changes in v6:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v5: https://lore.kernel.org/all/20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v5:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v4: https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v4:
- Addressed review comments from Mark Brown.
- Resolved all sashiko comments.
- Link to v3: https://lore.kernel.org/all/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/

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
  ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  50 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 181 ++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   3 +
 sound/soc/qcom/sc8280xp.c                     | 240 ++++++++++++++++--
 4 files changed, 452 insertions(+), 22 deletions(-)


base-commit: c5e32e86ca02b003f86e095d379b38148999293d
-- 
2.34.1

