Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E53C6A38
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452848; cv=none; b=hJRjYyUZy0ORHzXyZFsuQQEeukp4Y5CtaSevTJABWMzzClRiD5MMcRzvE03jHqfUG1qlaNCleETZOK/joK2kuP+KjpTvGLCGDHmePjVaC8dHU5OzstOJoV96HOLMY/yfSoNOASwqO+YRICUsevgBZBfmNrui9RgI7SA4I5pJNUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452848; c=relaxed/simple;
	bh=r18zUcCEtt3q4VZvrJxgIv1cyuMWFYL1BvadhzW/xf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hpJEE9j3bM+OIbVIm8omY2G1LWa1eVqccPz93bqZCJ0E5QGf1GQrKVsJDfM07VzOBjOiZCWuaT0HZ8ERSB4L7KFdqpseTACYoCo1iUZnOWD32EU3mEVW8kmbA8LGwGvClhVtz8Z49MgQ3KN82B16HkXlVgH79fdbRtfTYJhTJqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUKipxJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBCbmv5a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUKipxJ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JBCbmv5a"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2iuRi3982784
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L0vlrvagyMguXc/y0gIFf7
	fDulN127IXK95c6qxEp8c=; b=eUKipxJ7xsy0pa9IUsEcQdNcMU0HlfOq/V5vfy
	1NPKh6y/ATyazRpCwAma9J+6r4doXTScl7KEXreEx8me3RoubFawSLqqEQeRyOOz
	ijYt2CzjItfynAzJxmFKULBfjDC0dB9XiFsr0oRt2X9aUjVZ3pyEEKTb/4Ly4euy
	bRJ87OIPGX08sykeLMQFYwcFrhWzlAM5EffG0Mk6XVo3QMH2qzthFHGs1/b1HVEz
	ozea2dIjkR7uJhLnce8bPUt3AKkcAzT49ibF+YDh6qH7ejt1ACTocdY2wbwjVJqN
	XHQwBoPKpP9qK+0dLbFCr8ceY78D4QdwcEmR/xYXaAZIjoOg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16jgbd77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:47:25 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-80a11e0ffc2so11808967b3.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 22:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782452845; x=1783057645; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L0vlrvagyMguXc/y0gIFf7fDulN127IXK95c6qxEp8c=;
        b=JBCbmv5aEDPH8dyF3ncTDtIMo6lnu3YZZeXpG8tnhINucslhaS8l1zmrU4uXKsApMS
         Vqqvj0XRtb6PgHfEj9OrF+uU1bfDmBJHSJsemlyLEp7Akivjl9ba5eGZlEjazBaCRL+5
         6WVgDCo2+kL1L8eXFhiPTMpVzXesxmiKySz7sHeTYUqCd6IqN2A7fZ4Q82aXqoNGkezd
         67thaDX9XhfKtU1HikKWD6PbOAFic1DrQvSiyTjBVq6jg7GqQzfcNBpZqFBfeEV3st5C
         cTtnW7ewwNAc8vwNG1Akcp1jyKK5npCbrIRTZxh8AqBBrviPkmp51Sh1iQ9r4f/rzRcG
         1ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782452845; x=1783057645;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0vlrvagyMguXc/y0gIFf7fDulN127IXK95c6qxEp8c=;
        b=mgdQxZiarqefez2MSg+SKcbAmjvBADJERRyxc/7OQFd4pcmhprYiaOubsIXM+y9PkY
         4pUbn1rnGG7sjhYCsDSiDrP765P36iPK1SZGe48HlL351t0jHF4lrKDx0iKbaBJTveqd
         5MdeO2ytlgCvZdu8LHG+EfePWgcMtunQm+HVUHFo6wfKgUPltdMKcYbCjQ9btL62a/QI
         nJenkUt/rLJaQKhCkxQ9TKcgS1YvvyhkLBqFc91XbonL8cmkxxPDAZG5sXYorKnPRFsH
         mjduDx/0CQE5DJ0EIP8jb5VQYhoXMo7YxzZvZ+FOs0h36X/hZ/GqQW8gMuFUff7JD3Vd
         7OzA==
X-Forwarded-Encrypted: i=1; AHgh+RqUvqyiJIWR4jDzz31Ep9zW4xV4Pl6J/ceXSV5tbcfMolEdvvKtGlSmGXkPsOAD+ngl0ORP+VgMp6L8@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ3IpuJ0Ed1gX5aEeSbhlX2VAxn6G5S+IoSrIYIXe26m0OsQVu
	RKcxb27VdOiTfbbrRmo3pZJ+DS0uX4dSj8Xh4i8pxlhY6Wx1ZNpTBNnw0uIcN4OQv3HOo1lVsM6
	+1kN1eOPVYM9EGOKyDpbPnqbSPV4/I3QlzqMVFfXeClAMlsn7G0Oqwg0JQu57yjJL
X-Gm-Gg: AfdE7ckmGKSkUZS4K+PSzfUQbm+56hu4i2DG/cmG+pQW7GfrkVSAcMg6P9mgbUUHu26
	FPAiTvGE95grT/WbN2bgotPu9dNlMm0xKXYiHm5+LdO5CuKZCCQh8+NLHfvK5sSN2b/ick9rEt9
	A4R5unTD3p4FA5x13tIBN7U3a9WQ5rCKYMDqF712p/gimmWQJbxn3FYvg2RzwGYMvYjwwCBvpvQ
	PzJcUpo30PO0PNJmnj3mCszo/M1FyB/7c+DBGwcfTdyULq7sN4SYWfSLUpQb8bWf4+Jl0yEf0FP
	CF3Z7pK0MjzLZze8+caVNQLU/DRI7DuIy9+H/bTvlU1x6zXlwAhgENciPS76mHGFvAZUhIulQ2E
	AhTM6+zy3J0enHailoMRoGDHsqyKAY5RmsXE9fs7+x7bphOqFM3VB8XSPlH64SqT6Pm+ZgANg5Y
	3hEeZD0aq0RlJB1QpwwRVleaKn2kVB4A==
X-Received: by 2002:a05:690c:e191:20b0:80b:9efe:4a8 with SMTP id 00721157ae682-80b9efe0a3emr8621577b3.6.1782452845210;
        Thu, 25 Jun 2026 22:47:25 -0700 (PDT)
X-Received: by 2002:a05:690c:e191:20b0:80b:9efe:4a8 with SMTP id 00721157ae682-80b9efe0a3emr8621447b3.6.1782452844803;
        Thu, 25 Jun 2026 22:47:24 -0700 (PDT)
Received: from agents-Mac-mini.local (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80259d20d84sm80029787b3.0.2026.06.25.22.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:47:24 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH v2 0/3] X2 Elite HP EliteBook X G2q support
Date: Thu, 25 Jun 2026 22:47:19 -0700
Message-Id: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGkSPmoC/42S3WojMQyFX2Xw9TpI/p+wLPseS1lkW26mbWbS8
 SS0lLz7OpMQKNuL3hhk+3w6HOlDVJ4HrmLbfYiZT0MdprEV6kcn0o7GR5ZDbrVQoBw47OXjy/v
 +OMvKY5aI2mVlNKEC0RSHmcvwttL+PFzreoxPnJYL4vZj5tdja7Ncv4kDLWnXmmw77YqJ0XsDJ
 TubA4RCzgUbE5sI2veBrPGlrJy7CqxxGiGoZGzWFDWiL9ZggWxyD9E5yJS8/qyigoG4gPJNplA
 nxGi088YV0hh1dBzZuHhR7blWWoPYdj/XHMw9h7/5IE8oUVJGcJ4CN+zvqdbN65Fe0rTfb9rx6
 2uMVRqCtYgbZbVyrm+cOsRhU2l8pvm7GKe0fB4Psk4pNTdegkROPkab+sLpuxgD+j7cK0k3PwU
 4ZOtLy4e+JkWqLC83w7LtRn5b5M2VEZcd2A11meb3dcFOuI789g6fdqmlCLIkQyqVlqX/37d4O
 J/P/wAwBl+1sQIAAA==
X-Change-ID: 20260619-glymur-send-1136d243a120
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfX1tlgIWpTmWLJ
 5UDxSHpeBddg/qUTVXHlm+7NqtlOVjw3k2MVq8WAV+0O6eoCv/kJjTp8TaVOKGmPrHBb4sS+aqE
 OyR0yK3AE8iasm+vShhd/kOru2fOALLBOEqtdYSKOYRboqpSbzCxzOateygXqMZDDQLobtGgf0z
 IQdzqGGydDmH2bl1ttwlwfeQLn+xjsVCi1r1Dxv4jnjGPcbUBwJEtzTUhKKCZQO+SsJqDOtsDQJ
 IxdBIdp4q5vDA9E1LrF8WRRAbsCSYbd1c/ZwliqR7jO1JYgc3pXoPf4alapUySle7x9wlKQVV1b
 nAUAj3iYAU/lIP/AeOFA/vyIMk9vGJHs2UUY8740xwy3ffOQdyI6xuqDx1tFhhQzQ1niCJYdzhB
 YwxYwpjp8GxnBatTjbQve0s1f0MUg9fkDuuh+o+d/x7tcB3oz8stgt5q5F8MvsKG/MlxgAsErTw
 /On5CCnNryMsysniuxw==
X-Proofpoint-ORIG-GUID: mxj9HRB1-6UGxt-iUvaLHvIsYr0Cd1g9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfX3scZDLejIhid
 0MxPzn0Qpfg95Q+6IxhHld0AijkPsBRtdhlKcYtetS3/MYXng2TfsitiBPxUlWyt4bSEnTRilpz
 y5fMqCn/Aezkl6DtpRpcoqXZ0YAXmTI=
X-Authority-Analysis: v=2.4 cv=daqwG3Xe c=1 sm=1 tr=0 ts=6a3e126d cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v_Pz4op7f3T_4hR4KoUA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: mxj9HRB1-6UGxt-iUvaLHvIsYr0Cd1g9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260043

This series adds initial device-tree support for the HP EliteBook X G2q
14" Next Gen AI PC (product SKU C4JG0AV, board 8E91), a Snapdragon X2
Elite (Glymur) laptop.

The board was brought up and validated on real hardware. The electrical
description (PMIC rails, PHY supplies, the HDMI bridge wiring) was
verified against the live unit rather than copied from a Glymur CRD.

Working on this laptop with this series applied:

  - Internal eDP panel (samsung,atna33xc20)
  - 2x USB Type-C with DisplayPort alt-mode and USB
  - Chassis HDMI output
  - Chassis USB-A host port
  - Fingerprint reader
  - NVMe SSD on PCIe5
  - Wi-Fi, Bluetooth
  - Keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - Compute DSP (cDSP)

This patch series builds upon the recent work of Qualcomm engineers to
enable another Glymur-based laptop.

Like its peer submissions, the camera support is missing today.

This has the same known dependencies as other boards on this
platform (audio, GPU, SoCCP series).

The GPU device-tree patches come from the partially merged Glymur GPU DT
v5 series at
https://lore.kernel.org/all/20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com/

SCMI on this configuration needs CONFIG_QCOM_CPUCP_MBOX built in (=y).

The bindings patch is independent and can be reviewed/applied on its own.
The board patch can be reviewed in parallel with the GPU, LPASS and SoCCP
SoC series. Until those land in the target tree, it will trip the expected
"Label or path ... not found" dtc error. As with the X2 Elite Lenovo Yoga
Slim 7x submission, this v1 is expected to trigger some dt-bindings warnings
that come from the in-flight dependency series, not from the board patch
itself.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Changes in v2:
- Enable the PMIC RTC (qcom,no-alarm + qcom,uefi-rtc-info)
- Add the SMB2370 eUSB2 repeaters on usb_0/usb_1
- Enable the compute DSP (remoteproc_cdsp / fastrpc)
- Addressed comments from reviewers on v1
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com

---
Jason Pettit (3):
      dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
      arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
      firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 1019 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1022 insertions(+)
---
base-commit: dd60bcf0ad17dd15d6d4d677315c4cf9827445f9
change-id: 20260619-glymur-send-1136d243a120
prerequisite-patch-id: 36f4bb7740fd65d808fa6685bce4b03798a547ff
prerequisite-patch-id: 054631082c45d3ab3117f541f0d4d90b660dac73
prerequisite-patch-id: af18aef027c45213c11b436746fa31b3b6ebe46b
prerequisite-message-id: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
prerequisite-patch-id: 7cb9a168c33491bf91ece900a2218aa7b4b68ddd
prerequisite-message-id: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
prerequisite-patch-id: 43e96d8a5063f51e2b5ee75fc8c9e10682e5670c
prerequisite-patch-id: 2e71d345f84a821d89da2a6064954409fdb1277d
prerequisite-patch-id: 0b9f5995044bb3d3ffda227ac986b755fa118c63
prerequisite-message-id: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
prerequisite-patch-id: 8459bcae98ac156f6576657fe9233badcd385218
prerequisite-patch-id: b5182f879cdd23c5a0c64bf09b40213b71059b51
prerequisite-patch-id: c962e3f24c435e91ae563bbba9e396bf277ff0ad
prerequisite-patch-id: b9cd65895f55e9d76ba28ef8f9aaf6cdefe1b9d3
prerequisite-patch-id: 6484d1056e30f2027e81eee375d979197754bc12
prerequisite-patch-id: fa7954f6fd2d27a6f0e805c9643b70e7e201c503
prerequisite-message-id: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
prerequisite-patch-id: 48c26c428cbeaa674a615704d1abeb87e4e965c8

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

