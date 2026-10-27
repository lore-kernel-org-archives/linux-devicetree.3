Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104520;
	b=AnYlI1FGvjJeAZ5ME0EPMdydsN4rn0DY03Kwt2Rvc2Emt75RKBJV317PHRqF4nV78RBp
	 KflRhlljK0ljWMMu0UF86dDhbq2ug2WSNcRe5wdeW3cDo8lrvbXmBRp7WlwfW7vduIQlg
	 xb2wai3XhNUs9BbaMjMKIrmEDHqJCUe3sTqlk8iio3rbKYbdQHwyjGmfbHiuV0J9lQJox
	 0+Q2jc3qhVVs7QauThl/J1DDvaw+etXd70U5wGAd6PGJBQhuk2QJF/G/pedXF5487Lehi
	 m9UiiXMJtMPToxj6WP/N9EwPRAYVSHVMOkUyzlTMssutBDmDPphQZ3U7RXkzlmwJVsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cI2uaVMhurkI4mNBR2Hp+MEU5aSgXbFuVTtoDyHy7Ac=;
	b=2KXkQiVKJH7jr8DoftUawqITCkZR/gynkqw1Rfu4qEEH8yfJtFjGjMnNAjQMCWhsHS83
	 kMksZfBWUc9GhKnfpR72nckktJPl4aHVUoJ7f730KwqCt1yVAD3CP+Z8aGQ7x89/a8WUN
	 yhCZp9Kl8IFRR4x8yvVo5uNgp32/dafDuTwOhXH1TI3MxoaHLzlHs2I9zIhholISjtlmW
	 kxV49U9rDxPgmPJXfFrTZG7s0ik5TBAVJEYP+lH2wZsRJDP4e4lbEPh0/hhT5t6vC42yY
	 i4TzpyA2zMFFcLx5qtoE6vScp1t1HVyU4kpJiRmep2oUspZXEie7mHEtDUvFKgGukSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BWsbTrqn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C+FTBRlX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25FC606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A25FC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BWsbTrqn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C+FTBRlX
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeC1k3012028
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cI2uaVMhurkI4mNBR2Hp+M
	EU5aSgXbFuVTtoDyHy7Ac=; b=BWsbTrqnNnL2Dj6mLRWAkPMLo1XcWhJdKVWffZ
	pFKPLTHf6QvTmPK5sVGxhMxilovwBsZLkJ4kcf3d1IF02h+tvnRoqN2tBG8sHcH7
	xNFKDhywEoXF5cfgvhkJ1O6y726vngWByGIEhHUubVlN+FFB/RrPi/mv+wPqjjXL
	A6IwubC+U0BlGeKjF6KW5AagshtAXUbiiSzwQm3JrH55Vt2ppHWYALoNFPc+m/a1
	+tqYJ1F742LvbKGcSZm+qzWi4k8fPqSG/2qAYHItEbVPdCzINg2gPKaOrfTPlDuR
	OQ1T+GR6upbnCdevLcFgVMvZh4AbznxOLgM7CPwjc9j/OxFg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3db0x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:18 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-869553205a7so65044827b3.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104518; x=1793709318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cI2uaVMhurkI4mNBR2Hp+MEU5aSgXbFuVTtoDyHy7Ac=;
        b=C+FTBRlXdRT8AKCEziIx1mv9BZehzUyPza3nE4REGLJi/FnwNgKlh2yj2uEhwTekh2
         AwCbqI1qhnS1b2HY4PygS7KZGPXwhg5yIek5KmN2/Nk/e+onTaSHM2yC0QDMEy+A3ttv
         O4UmWTKq2Cz6lr50ORHNZNanhc5cYkfL1YUolqNfPwEoeAJ1HsSbRn9klmgIeMkncMzU
         5tHu759ainK/nClwPZSadWfH41+6T5/Ho3eg7oBtupi6zK1aVldx1zIyOJxwrEOXZVDm
         zCDYCaKgD2pOUaXAWJdJgmFbiIDSEapWESJ28lkU1XOODG8U4IwS//idVoPNfoJgSd0P
         L8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104518; x=1793709318;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cI2uaVMhurkI4mNBR2Hp+MEU5aSgXbFuVTtoDyHy7Ac=;
        b=Ok/iPiiqsf5Eb0/wkiWNtQkHjve+DbsgVqz0TUKHh+/nmF155tS/VcKrXusUfbBNzB
         qgDZqotOwz0bzqmh6TGSnCft7Z72sI4PtuA+jIFuvG3gQWmFveffX/UU0esNqqtyQhxT
         M3HhHG0RlNuLlEwZeSF+gA9EhIhSna5YoLFsJyXMPsITDgWu3AtfKVXVqbjFl0x7y1uf
         LmRGp3Eqf18YJt9J9fCrbIC/cDVMvhSKsFQ255NbQvYc8qo64u8nptVy4FvbectPq1f6
         lFB4cl7VxLnya7Ip7ifKyCQJvyG+yR113Mkiv/olUJXFtzI7Fdj0Cjdf4pur5M71ysHI
         gYTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEWzEAUxmcs5wNLpo4b2USRhLV/I8+qMGzq/BwMOsxr6XlcPZXkJDL5VMrtKBHfXC3Th/i4sJJH7j5@vger.kernel.org
X-Gm-Message-State: AFq9FYLsyaKQ21gO5gcn1W/I0KpPSbkr9VaMtofI3wNHMG49ZIQHszat
	6GTTejCqpR048YbQ9kVdqQi9cB6aeGyhGxnXdYuMpZyWR8mU6uSvD2IunZMEP5g+TIkuqfA5/5h
	b8OC3WNNVatPFEzNNl98yf7bHOoB0vJLjk47w8o1cP6tPA2znSAytzriY8LCVlISz
X-Gm-Gg: AYBFou3oK6KW8smuj7coYmWweG1A4AOdqruwShRbSsS233UylAsMj4IXXuou89V7zTV
	oFooR+gs9Dt7JMTw538BsWI42uOXxCsTXAAFNViioory0+9UzSGPWZHwxvRyReeT4xxroV4dER8
	e8GwjealbGSjyL0Sa+5Go6g7WJmpnXxEMgMR7RRHqlzUvZjVmXNCIYlnheHM62IgL6A+8rILVjt
	G19/px2NL8CGnM7bT/VSAZq1bcFJF6ig/8lZFx51xBerRppBq7HcICFXP3pAc7aTasjAJqsgMES
	c8nVO5tWYIu3Ltbopr0qS9V3Sc9RmioOqnZwKOEj/evyAkjuTGiWYmi9ZShTRqUgLgviyg0cWx7
	orT9QwqviExKxZWENTQ==
X-Received: by 2002:a05:690c:4028:b0:8b0:df4b:6467 with SMTP id 00721157ae682-8b166ccce85mr62530477b3.59.1793104517687;
        Tue, 27 Oct 2026 05:35:17 -0700 (PDT)
X-Received: by 2002:a05:690c:4028:b0:8b0:df4b:6467 with SMTP id 00721157ae682-8b166ccce85mr62530327b3.59.1793104517172;
        Tue, 27 Oct 2026 05:35:17 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm10413507b3.20.2026.10.27.05.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:35:16 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v5 0/4] regulator: qcom-rpmh: Add support for off-on-delay
 and debounce-delay
Date: Tue, 27 Oct 2026 18:04:17 +0530
Message-Id: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEma4GoC/3WOwW6DMBBEfyXyOYu8DqGmp/xH1MPaLGQTwI0dU
 KOIf68JUm89PmnmzbxU4iic1OfupSLPkiSMGY77nfIXGjsGaTIro02la9QQuZt6eoQIoW0hjNB
 wT08w3lbe2fbAzqpc/o7cys9bfP7aOE3uyv6x2tbERVK2PN/LM665bQTNB9baIBZYHtAAgrsmk
 ptEGk/dQNIXPgxqlc7lXw21xv++zSVoMEfrqK7QNGRPIaXiPlGfRcNmW5blFzW9wdcMAQAA
X-Change-ID: 20260910-regulator-off-on-delay-2c86cb8f3eb8
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793104512; l=4245;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=h7kdOlEsy/XZYAxDWhvajoAD/K0QHoKJMKNJHcJPMYc=;
 b=4Iby379v726wLt8scpiaVQk/orjI4gLaXcrAOGew7ubHYzbYtk7bpHTz8zEWxde87uW18dr+h
 092x8gbxIr8CIzCcrKjbN0nxY5lp2uC5gTODd12s941tvgxNbzb8kmZ
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX8Qsouavn4etr
 s6z+Gt/X0H2kUqnDkJEb3NQ+NpGI3UDWQjSbtnQiAbTV+PKPTfEhDx05QAiUcbnfRUMg1xZPZ+t
 ipvN6xSktwnl4GToluhNJ1B+xCZICfo=
X-Proofpoint-GUID: QCwtO8E3XfZnsVIYZbvoBVtNl8T9Y2op
X-Proofpoint-ORIG-GUID: QCwtO8E3XfZnsVIYZbvoBVtNl8T9Y2op
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX2q6efl7Vodhd
 eAkAs+0udrc+W7CKwBv1/qS3ljKllR5b5eOIXDE/PYi4Nz7fP+whqg6A6eA3SLnyJCggtyjljAq
 V307fq0aUk2AWaR2LNAiGazVwdMWYrFjTjtrsanMUmGd1YiQDwXzQcuoTG4GRzoRz/iXcQTKblY
 L0OkHT97EyLnDEaQ6qLFSEed/pSuUvzjGQVB9jNDPDzW66SENCorxnt/FrMauuPHgE/mg0oDwK6
 Hr3F7ZSfTpC9hGXrywnmemUlB1LCozDRSNMZ6oS0Tk/BHgGf4tw+4fbSNyTMFOYYpKv4iUYPOpG
 4Hfp7Btb21aXbw6uLWdPDJK6ACAVd1k5Rk0Ix5797P65lhVPA/tjcRuYU7WbaelDCfs+zBpigtN
 wC0Ouf8LNdAWP/QKl9RLqnk9Z/9TZSwAbE9k1w+IVba8wBUuzrDmOydm/kaj44BFn0BEr1oTt3t
 rEOtL3cHSpYTMRD6a9Q==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae09a86 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=aDg8Iw3iuXszikcmRqoA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050

This series adds support for two related delay properties for the Qualcomm
RPMh regulator driver: `regulator-off-on-delay-us` (enforces a minimum
physical off-time before re-enable) and `qcom,regulator-off-debounce-delay-us`
(defers sending a disable request to RPMh so quick disable/enable bounces
never reach the hardware).

Motivation:
On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
(LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
When these regulators are disabled, the voltage decays very slowly. If
re-enabled too quickly, the sensor experiences a brownout and fails to
initialize. This can be prevented by specifying a minimum off-time.

Separately, some consumers rapidly toggle a regulator off and on again,
for example, a driver that disables its supply on -EPROBE_DEFER and
re-enables it on the next probe attempt. Sending the disable vote to RPMh
immediately in this case causes needless power cycling, so
qcom,regulator-off-debounce-delay-us lets this be deferred and canceled
if a quick re-enable follows.

This series was prepared with the help of an AI coding assistant (Claude
Code) under my direction. I reviewed, built and tested the changes.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v5:
- Implemented "regulator-off-on-delay-us" in regulator core as Mark suggested
- Updated vreg->enabled in enable/disable callbacks to report
  correct state to regulator framework.
- Made following changes to address Sashiko comments:
  - Set debounce_delay to 0 in teardown action to prevent queueing disable
    work events afterward (which could lead to use-after-free) and added a
    lock to ensure serialization between teardown and disable callback.
  - Called disable callback in teardown function in case of pending
    queued disable work events, to keep regulator HW state synced with SW state.
  - Set vreg->rdev in disable callback to avoid NULL pointer dereference
    if consumer tries to disable regulator before this assignment is done in probe.
- Removed Assisted-by tags.
- Link to v4: https://patch.msgid.link/20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com

Changes in v4:
- Taking over upstreaming this series from Saikiran.
- Made the binding change for `regulator-off-on-delay-us` in
  Documentation/devicetree/bindings/regulator/regulator.yaml instead of
  Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml,
  as this property seems better suited to be a generic one.
- Added new `qcom,regulator-off-debounce-delay-us` property and driver
  support for deferring the RPMh disable request to implement Mark's
  suggestion.
- Rebased to Linux 7.3-rc5.
- Link to v3: https://patch.msgid.link/20260127190211.14312-1-bjsaikiran@gmail.com

Changes in v3:
- Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
  for `qcom,rpmh-regulator` (Requested by Mark Brown).
- Updated Patch 2/2: Refined commit message to explicitly mention the
  passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
  (Requested by Mark Brown).

Changes in v2:
- Moved the motivation/context from the cover letter into the commit
  message of the driver patch.

---
Jishnu Prakash (4):
      regulator: dt-bindings: Add 'regulator-off-on-delay-us' property
      regulator: core: Parse regulator-off-on-delay-us generically
      regulator: dt-bindings: qcom,rpmh-regulator: Add debounce delay property
      regulator: qcom-rpmh: Add debounce delay before disabling regulator

 .../bindings/regulator/qcom,rpmh-regulator.yaml    |  18 +++
 .../devicetree/bindings/regulator/regulator.yaml   |   5 +
 drivers/regulator/core.c                           |  18 ++-
 drivers/regulator/of_regulator.c                   |   4 +
 drivers/regulator/qcom-rpmh-regulator.c            | 166 ++++++++++++++++++++-
 include/linux/regulator/machine.h                  |   4 +
 6 files changed, 204 insertions(+), 11 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260910-regulator-off-on-delay-2c86cb8f3eb8

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

