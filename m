Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69F637702B
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273354; cv=none; b=Zd4hh0YztPsjcfMIpd6ZNUq0QhUQpFHyetXne8OU5c1jmAjGxLOSrfcZUgcILmmNlN+7v78M6LbDsiHegHpJ3IJhsw29DAqm1mHq5pOkfbDSjqeYBPAZTats9Qf4imQRjXs2nA0Tc3OjC4iu/Oh+EvJz59NYBWuMPDXgNtIq+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273354; c=relaxed/simple;
	bh=/GptjR6O6rD4eEhdtk1yscF+FxhFlo1Lmp4HIWbr7w0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qh2kHms+ZLxjcG3XcBFh0CtGhtRAMoxlJmD9gYdvUNU7IZJvBIZxCNe5P3My8DJ9ygNGZX8zKhwziMslkXX2w/g9+RvX//m6C414cVM533WPa2L5644nPgzNhwwP4VRxS0vy0BIpNH4YgNJvKtfFHJidCR1RjQ+A60/x39L/J8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVA0qUrm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/sx7RCy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVA0qUrm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/sx7RCy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cRRV794326
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rlxXAgc4Ja+lYYqhl6LIDR
	odEiocqjvsejHeQSWPPpM=; b=kVA0qUrmxYBNU+yZBspCgVam8F/M22X7cbhRFc
	7K4Bgmp2Ptnv575k5zYdoV6TRwWdJS1GTvsZgUN/zFYS6kIoE6rfSHZD/ozGEWZn
	GdZQS/turDp1vS4NiYPoiVsI0qFguFyvE6PwwSr5WZPCvbM8erdioqn7buwAtYVE
	nBXN+bZizqmIIHZwVexICIpwhh2187E4OjF2q3X2BaXjaE/+d/v9l3L9lG5CqhCi
	r3kgMw620aAlaXaSpZ7yhp5PDAc/nAdhENgl6slZ6VEf9/MwsBgep9GcQEMVnoRA
	o3Y0OuvReTQeEJGNPHDq75wCx8WwuNgBcaxGEH8Xse5sP1+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8jmau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:29:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc5faecf01so145791045ad.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273344; x=1784878144; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rlxXAgc4Ja+lYYqhl6LIDRodEiocqjvsejHeQSWPPpM=;
        b=Z/sx7RCyRjByFXJAcFK2ELwK5R9KBkhc0JdwtlnOxwCwXWPZkrZNxhHFgHgst1vsds
         +yinOOWx1OLcDYcfjgojQLpS6rHe+J7pLoeDCwadReD8ZDaNNCTIrG0PE9pHBtjmvmRG
         GXtHa1npD4A/YK38qhfTFJim01qyjrQ1yUKQsvy0PzKWcfZI/qLC1hFZaD52Y6ANy+A+
         TNSLmBMLE4DM04Rn09tYUH1nlnTphxpf6+a9WB1M7meeHluzgEcBXicP92iNUp3bgz3V
         Pj49hA1QFdPyt4ZWIJNG7LL52RGzBM3cmOkI3oEwlQEF/19T2FH2Uwelh9mBqVoRenJy
         YUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273344; x=1784878144;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rlxXAgc4Ja+lYYqhl6LIDRodEiocqjvsejHeQSWPPpM=;
        b=st+0V1WKs44CJHPz8GPgRqVsMIbUl+znAhmPGsF2S6YirAcRpvSBxGoUd+82AzrlBj
         LTyjOJE7/rwvWWKKoL7Ybr+f6hpcR+WVZIapsZPrzNyzaXBiZqiSRr7qaQBXPauGWxKW
         tKGnLgMc94CjBAe4OybXhOAujv2+PmKDqsKZqleASkZrAQAmozKpCgDvwdH6sIblGm3+
         HjwBNyrXlQFBUI0lsaYgLeK+TK7a7sevn57/XnoAD/RdYeSe78A2p92LwkAc80FPJIsU
         h+OtLx4ayJhH3hmnQFKwvBZyiSf1PKgJq/+xTvkYfHQXEUTWDGdohiulxP1eLdBkeW9r
         coTA==
X-Forwarded-Encrypted: i=1; AHgh+RpjT0Vjo+/d7nTY9kb4p2MzZtVU2ALkpuNwsO0M+gafYyjv7e3KaF2FLDU9zYBZU4N8FbgFhLNPus7b@vger.kernel.org
X-Gm-Message-State: AOJu0YyI/yezyRBt1AFzSMSjx5RAY/etlJrcH4BlLOxinf1tPBRbaotA
	T3g7yhPfd9v1WoK++upT2tu6vIp2g18UWnR7ptmLpN+GeAv4GGEHIpBm6YudliFkgUfYCn5s9pz
	pEqtSLeORuLaS8MWY1+oPyfY9reLMNVbBu6G5r8nzcVRwpanpZCKlFSqqLmX/gjHo
X-Gm-Gg: AfdE7ckObkpPS4qljSUKViiMG3bemHe0IYnaHztTj2pM0DXEqwWcNrYGVOVGBXspW73
	k5vPbBh6lb/c/yPP9OvCv3DmCiNWPXzscxixyQby7XCQqxNOungYg5tOWzKMNudWNqn9oWSqaQQ
	uNP1PQL1P7Gorw6Auh1EWvF1/GHSMKkMuVU99NZl/sqpRIR0XYoDRj67AGtsFn+PAvtsQn/oA7/
	Gzruml8y7H9AUbTFevGd8dD/f4CHYED7utUYKa78G/gs+eFgKMhsqdlJk+RJhqs7a9gpUcZ6tWw
	JPFF+1kX1GZ1sh9vz+HXROqgWMEE5Ie6McBJt37w5PmU8ihibfRgLVXcpfCpIG+wUuhIjkZ9iYP
	PyZkVWfwt6Rn/VvnomJiu6I1aWJLphFSlsbGCsKmsYcyEpGHnZtbj
X-Received: by 2002:a17:902:da8d:b0:2ca:10c6:f69b with SMTP id d9443c01a7336-2cf3482135fmr16252615ad.5.1784273343838;
        Fri, 17 Jul 2026 00:29:03 -0700 (PDT)
X-Received: by 2002:a17:902:da8d:b0:2ca:10c6:f69b with SMTP id d9443c01a7336-2cf3482135fmr16252035ad.5.1784273342962;
        Fri, 17 Jul 2026 00:29:02 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da071sm5724065ad.47.2026.07.17.00.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:29:02 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] input: misc: Add an initial driver for haptics
 inside Qcom PMIH010x PMIC
Date: Fri, 17 Jul 2026 00:28:58 -0700
Message-Id: <20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALvZWWoC/33NTQ6CMBAF4KuQri1pp00RV97DuKBlkEnkr0WiI
 dzdwkYX6GaSN3nzzcwCesLATsnMPE4UqGtj0IeEubpob8ipjJmBACOMNHxwXcND3xCvi34kF7h
 yLs8ws6AAWbzrPVb03MzLNeaawtj51/Zikuv2nzZJLngJGjVAicbqcxdCOjyKe6w2aRxsRSf4g
 kDvQRAhm0t5RCMqheoHpD5QJtUepCLkciWtzZzNdbUDLcvyBiM0bHRLAQAA
X-Change-ID: 20260616-qcom-spmi-haptics-3cc97e7b232e
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784273341; l=5721;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=/GptjR6O6rD4eEhdtk1yscF+FxhFlo1Lmp4HIWbr7w0=;
 b=yaG1vd8C5a9GL0iuraqsDtFOnt7o75sG0Pc7mFNaJq4IPg/5jBjksITjNjjf1Xn/rfQ7nqFBW
 uJ8YeYZFBMSDyGaCi+ulGG3UZkJIKzPV/Zt6CiQ9QApKsGEwoYfdUaL
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: fNCDUl2vFsYMo6M2l5SAp-rUO_6i_mQj
X-Proofpoint-ORIG-GUID: fNCDUl2vFsYMo6M2l5SAp-rUO_6i_mQj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX3wMyMy1Oekx3
 DrX6RYQo2R3YkwkioqK1XffHgrMHNhmI/RDBVt2PXBLLcUN70tJJi22PSkLB1WIbRTgYYAO/CDA
 cPz4rZNDLgUEUf+vVzG8AhXcQyrkliw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX1F1bW15TVOSD
 mPTkoafB4lyTfukOCCDpgXYBVhGqLkCB6hAA8PLIl5hJjGyRo2FAoVWxPv573v9E15nKmrmuLUk
 wPICTW3SLZ8sbPEIxoaydtgeNL0BaA5YpVM8HOsnEEtyZGF6KkkYmuBQAZcZTx2q2pjNeEdwQOT
 IrJnYH979vgJUZwaPSo9FCIFS3Ga0arvrMKKVInvOzZuVvztCycB6M0jnqzuDl9PwctUQnR9uEO
 pdFhWlN0YxPbJTiF1ytoM15SM0U/VO0y+jqkyPu3k5+X4DyQi+RBEmAe0z+qmx9SY7ZXajpj9EE
 zhkZAnF+Re2OsOwV4+XvsMLxSV/gzn8eXbzPQsZzuUT8UdlFUQhxMJmUvw0iB9RO2hp1wZTXm9F
 DcbgIwPp9dgwUPrInpNmI+hnqW/vDYEPqsmK47e3Km9lxSFpGEsQZu4tZ0kzjubPrpxv5aUvO5S
 XpdRbM93iURRkGdbABA==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59d9c0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=AP9v1xrwSQ01pfBQjooA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170073

Dependencies:
 - [patch 2/3] depends on [patch 1/3] and they should be applied together

Qualcomm PMIH0108 PMIC has a haptics module inside and it could drive
a LRA actuator with several play modes, including: DIRECT_PLAY, FIFO,
PAT_MEM, SWR, etc. Add an initial driver to support two of the play
modes using the input force-feedback framework:

-- FF_CONSTANT effect for DIRECT_PLAY mode which drives sinusoidual
  waveforms with fixed period and amplitude, which would generate
  a constant vibration effect on the LRA actuator.

-- FF_PERIODIC effect with FF_CUSTOM for FIFO streaming mode, which
  can play an arbitrary waveform composed of a sequence of 8-bit
  samples at a configurable play rate.

Also, add the device node in the existing pmih0108 dtsi files, and enble
the haptics device for several boards by updating the vmax and
lra-period sttings according to the LRA components that mounted on each
of them.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v4:
Fixed Sashiko AI review comments in the driver:
- In haptics_start_fifo(), remove the goto and do the clear in the error
  paths directly, also add a comment to explain that disabling the IRQ
  synchronously won't cause a deadlock.
- When data refilling failed in IRQ handler, stop the play and disable
  the IRQ to avoid the potential IRQ storming issue
- in play_work(), check if the effect_id in the request is the one which
  under playing before stopping the play.
- Link to v3: https://patch.msgid.link/20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com

Also, add trailers in the binding changes.

Changes in v3:

In the binding:
- Removed the ref for qcom,vmax-microvolt as the property with standard
  unit already has a ref in dtschema
- Added 'qcom,pmih0108-haptics' as a device-specific compatible

In the driver, fixed Sashiko AI review comments with below changes:
- Added a list to queue and serialize all of the request, which helps to
  avoid the races between playback(), which is protected by evdev's event_lock,
  and play_work(), which is protected by play_lock.
- Changed to use guard(mutex) or scoped_guard(mutex, ) for cleaner mutex logic
  usages, and update protection section to prevent race conditions.
- Added runtime pm control in haptics_stop() function, use it as an unified interface
  under the guard of 'play_lock' in play_work()/erase()/remove()/suspend(),
  to ensure the runtime pm control correctness in race conditions.
- Removed unnecessary stop play sequence in fifo_empty_irq() as the HW would
  automatically stop after the FIFO samples are played out.
- Added a common interface haptics_clear_effect() to clear the FIFO data with gaurd
  of 'fifo_lock', and use it before upload() and in erase() to prevent race
  condition.
- used __free() for safe memory cleanup
- Checked play_rate against negative value when loading FF_PERIOD effect
- Limited the custom_data length to 48K prevent potential OOM

- Link to v2: https://patch.msgid.link/20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com

Changes in v2:

Dropped dtsi change and I will resend them after the driver and binding changes get accepted.

Updated haptics binding and addressed review comments from Krzysztof and Konrad:
- Extended the description to clarify the 'PAT_MEM' mode (not yet supported in the driver)
  by comparing it with the 'FIFO' mode.
- Updated the compatible string to 'qcom,spmi-haptics' to match the file name and removed
  the PMIC wildcard.
- Simplified register names to 'cfg' and 'ptn'.
- Corrected the unit naming for the 'qcom,vmax-microvolt' property.
- Added an additional clarification for the 'qcom,lra-period-us' property.

Updated the driver to address review comments from Konrad and Julian:
- In haptics_write_fifo_chunk(), separated variable declaration and assignment, and added
  comments explaining the 4-byte and 1-byte FIFO writes.
- Replaced manual 'x * n / d' calculations with mult_frac().
- Switched to disable_irq() to prevent late IRQs after device removal.
- Replaced property reads with device_property_read_u32().
- Remove the 'INPUT' dependency in Kconfig

Updated the driver to address feedback from Sashiko AI:
- Guarded pm_runtime_resume()/suspend() with 'pm_ref_held' to prevent runtime PM reference leaks.
- Replaced spinlock with a mutex to protect FIFO data during playback and avoid calling
  sleepable regmap APIs under spinlock.
- Adjusted suspend/remove() sequence to stop playback before canceling work, and freed
  FIFO buffers to prevent potential memory leaks.
- In FF_PERIODIC handling, allocated 'fifo_data' before assigning data to ensure its
  consistency with 'data_len'.
- Registered the input device after enabling runtime PM.
- Unify to use 'h->dev' pointer in probe()

- Link to v1: https://patch.msgid.link/20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com

---
Fenglin Wu (3):
      dt-bindings: input: Add Qualcomm SPMI PMIC haptics
      dt-bindings: mfd: qcom,spmi-pmic: Document haptics device
      input: misc: Add Qualcomm SPMI PMIC haptics driver

 .../bindings/input/qcom,spmi-haptics.yaml          |  136 +++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    4 +
 drivers/input/misc/Kconfig                         |   11 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/qcom-spmi-haptics.c             | 1178 ++++++++++++++++++++
 5 files changed, 1330 insertions(+)
---
base-commit: 66725039f7090afe14c31bd259e2059a68f04023
change-id: 20260616-qcom-spmi-haptics-3cc97e7b232e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

