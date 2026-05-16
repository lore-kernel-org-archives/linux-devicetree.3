Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2691C5D72
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934862; cv=none; b=nh3el4Kds5eXweDoZZ+4YP61hozWyyYaIRXRcKMTrcaTc/uiuER4vAi6ALgCFP8VezXLVT/ntFaCd1JjvnPpZZAJQ6OPwrK0+Ud4d/h/+15U8seIf+PYFc90QsfT7tpH1bnZKXdu2euVsvaviAYG+32uC+IU+UPVxduGTHfFHFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934862; c=relaxed/simple;
	bh=wqpXfIpeij9xEfvUNcjaE+C+fgLfl5o0ZRfgRNcaWrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lTaQBfITt6LUJ1PusxagWRpke4xOUsWmpopFqQ2FnFnDCyuYwc6moX9pvDTx0mNEbka4+bsH5rea7qBGjlRqbR4CIeX3dA3trwGaq8MekkkOJkJXuncD1SweJvg6hsFt+mfwmf6OCrDEgrye+rI0V7BP/GjEtyKHlhW9c8dDr+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwCWa8Oe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFdHVKO9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwCWa8Oe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFdHVKO9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G8jPgW3863506
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v/qlA8PM2DTSSKhlDDk1SL
	7aX+U5Iuh8+Hnk2GoP4P0=; b=NwCWa8Oe64/+tC+7G1YPgU4Sl+IxypHWpjZ6+U
	v3HMl/VIwq3Gz/+vSD82ELktoiGIT7WHPoFt62DX6rQnW/L9RElH0wySuO3lw2/c
	dPfxI/s7UH4sG0kKoFghl01BuSSVS3LbMNMgBN/IVeT3ffF5z9PS6ECcbxZj6W5z
	5m3nmPfPvUO9pQxUv00zgomy6m5ThIQ5ftSveZ8HSYnLuXzNXQVrw2C8+I+4WeE8
	/rVdErwnm1dpQVrvBg5FzMyBGHhF8tMPdwxCpxkNKQ803tv4vJR66AMj+5YOLzsx
	Bn5fnF0r4ulXRJiOkDVCLu2K4ChY0GytyDs3o2/PmyWqk/wA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqrumm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:34:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353df9bc7eso901069b3a.2
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778934859; x=1779539659; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/qlA8PM2DTSSKhlDDk1SL7aX+U5Iuh8+Hnk2GoP4P0=;
        b=fFdHVKO9J3qkMBg5v/6DCveRBGlB2E997Xwd6I6GOZihFpgQJNyvwES5b45vsXuOg/
         yzZJ3y4NtWxUdZLiFaVxLOVmj0xTiZqESARNtsMteF4MU2KK7SeXwTxJpe43imDqnppx
         JQr96S5Br5SuDwCR+cC32vUWAokBmDVjd7ypGsgiuX8r84VjWrqQ1YN863p7wPHoFdhv
         wjvP1ysulLohtAEIytQi4p1b0SdlHUX4IrIKzVdtrCrXeZG7kyIUYkxcatsg1sx5rSXe
         dY0wNzZKFzWaDLNPqLRiWXemgrZoHNbjWSpxL/KRT3qOJKn4wA33z2cqUAnZmnx7IlTM
         AxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934859; x=1779539659;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/qlA8PM2DTSSKhlDDk1SL7aX+U5Iuh8+Hnk2GoP4P0=;
        b=DChTbo5epR+kgjlIKRWAXPJhCR7Ldw8OWN3c2xDI2vEAsujSMMrOQk8QB+qhvBUd6i
         ++S0NNS1EaOomR/fDGMOfIeFEQThngbAsTvOpmMwVFVzNe8jZNb0v4rWrHBLfm0TtSfq
         vCo5NVl0vPgEZjAHe2qsWOcBAHQcO5mnUs4Zi3Seqde+jvOcKIpzaxyeUa2FOX+927VA
         Cec8YBVBrp13JrujZkrb9HN27HxdCq/On5MwgW7n5mmh+IqjeDn9gbmFmYRstrltHGKY
         +Fb2BYBUSReJicTvgMxyPQidcsPHhZRherWQZC/vl9c75Hvs6LJ7uTDAzXtT1z6VD5fI
         R5UQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sw5y2CzMXcMrzW/dlLRizIlQyUqIY20+Tl64ERue1RSCVp3uX0gcYSqz44JBXyfauXAAjsZXKNQVG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5T4G6DJdCV2PinT7v/US8p7P/McSLQ2HzcCtg4/Dd5aLHQZZN
	6J9ToYG86Al9UZR39lwhVlsTfW231ESRDRCRZR0L/O6jDBMAlOHA2biNfCkc/j0CbESGZaqVY8B
	e+5+1skzBRaCf30/rOOqBS4YTff3sCjlOttkMkvYashsI3tdSo/fjMrlHYB+y9V1vZlGz3yw9
X-Gm-Gg: Acq92OH+iLJkNZ+HIlP8/N832CqZlZ17EAGQLWvpZrs2SYnzv1ier2xs3khePEu5zRG
	CUnf1cjZDLpeKdqpvUdU0yOmSkRpD/bD6J96SMiSCEJgUK+RhQhKNsHw7kKJSqQvZwkujL0O6ZG
	AiayGEq8Z8R8ZvON4GdxaDWAhpDUUqWDi8+c49oG8QMtNWTX/fG5wU8BUCKO/qFq0tKcWBVW85G
	f1m2FzMsjKUpfA5iO9ThpE5RRq91W9M7tMf3SeTUMbOEd1Zle7zrAH8JwSnNMe3XbvM6E7u8iZu
	GtFK41u96MJX0pcn8s5ry62guEzJfl4KeiwmC6CTeVmW9flfnWk1ujkHTjt2QOKhxODfdz6ghSu
	EG2VGvMAAgCIuqb4+LVO3bdja+UmKSwY6B7OwBgfW7wS6vJFY5E76oYp99yq4s/s=
X-Received: by 2002:a05:6a00:3028:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-83f33d9dc40mr8418954b3a.32.1778934858924;
        Sat, 16 May 2026 05:34:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-83f33d9dc40mr8418925b3a.32.1778934858440;
        Sat, 16 May 2026 05:34:18 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc9asm11405217b3a.53.2026.05.16.05.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:34:18 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH 0/2] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Date: Sat, 16 May 2026 18:04:02 +0530
Message-Id: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADpkCGoC/x3MQQqAIBBA0avErBOsUKmrREQ4U82iKdQiiO6et
 HyL/x+IFJgidMUDgS6OvEtGVRbg10kWUozZUOvaalNZFbftHFkSBb+LkE/jhMgpZwpbY51pDLX
 oIA+OQDPf/7wf3vcDEL/MpGwAAAA=
X-Change-ID: 20260516-smmu_interconnect_addition-d9567535e9d7
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778934854; l=1960;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=wqpXfIpeij9xEfvUNcjaE+C+fgLfl5o0ZRfgRNcaWrA=;
 b=JhI5NIrTKt3Fz1WHFtw59UHAjtXkzMyTDK6UkYq9PmroRFC6ryp6bV7aLu3hq2ngBFuCBlEh4
 1OPRd2WhGNsD5MXrmvURzIV8+iuWhpm0brMLZ+Y/ntndjB1FeER/fa3
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-GUID: T4P8uFvnQKekVY2bPEHKNvWKCleJR5NL
X-Proofpoint-ORIG-GUID: T4P8uFvnQKekVY2bPEHKNvWKCleJR5NL
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a08644b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Z_0B4eLmBfDa8jkmzhEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEyMyBTYWx0ZWRfX2B/5Ro7QkaT6
 xW7UDSrobXCZa7LE21+eXiuyYXQQxHEug3nSaHn0lktCw13udlkPOYNrMGAvarZ82R2o4WZhBhv
 puFQ4NV+LKcTHLvTirXr94omjfXzLxhxiOU6sXhiYO9w0AkM+2CDZBSFJJ66aeSAv6PxEHQvG/6
 04qoO+2QKymDSBS9mMGZxtN7mzDrwHRFZOD2wK8gSw+SWiVYK8zOkdmgTXgvnrTLcGSK1VSbm2a
 CXcTrT4e6PdTuGloSK7Y2HIlglcEfRWhpluHcg6IL8ET5rvx04oidlZlN6GjF4jdc7CqSd59Hr7
 04YO67UQebrWqWXrzLyau6c5zLBFDGlubvAH43Puq/unesqcrub7WrrdvjeFGaAcu1uvVv8PRys
 eBgPHUowetNKBrYO8JYGjULJCQ7EVA7C9c1x36pvxUjd1XXTMob5xqTSNjZeTBV+bz9KyKKKVDs
 icirLWfJGtZlW4UwIxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605160123

On some Qualcomm SoCs the SMMU register space is gated behind an
interconnect fabric that requires an active bandwidth vote before
registers can be accessed. In the common case this vote is held
implicitly by other clients (e.g. the GMU device holds a GEM_NOC
vote whenever the GPU is active), so the SMMU works without any
explicit vote from the driver.

However, during certain power transitions — specifically sleep/wakeup
sequences — the interconnect vote can be dropped before the SMMU is
powered down. If the SMMU is then accessed (e.g. during runtime
resume) while the vote is absent, register reads fail intermittently.
The precise ordering makes this difficult to reproduce consistently.

This series adds support for an optional interconnect path in the
arm-smmu driver. When an 'interconnects' property is present in the
SMMU device node, the driver acquires the path and votes for bandwidth
before any register access, releasing the vote on runtime suspend and
on error paths. Platforms that do not describe an interconnect path
are unaffected.

[PATCH 1/2] documents the optional 'interconnects' properties in the
arm,smmu DT binding.

[PATCH 2/2] implements the ICC path acquisition and bandwidth voting in
the arm-smmu driver.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Bibek Kumar Patro (2):
      dt-bindings: iommu: arm,smmu: Document optional interconnects property
      iommu/arm-smmu: Add interconnect bandwidth voting support

 .../devicetree/bindings/iommu/arm,smmu.yaml        |  9 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 53 +++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  2 +
 3 files changed, 63 insertions(+), 1 deletion(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260516-smmu_interconnect_addition-d9567535e9d7

Best regards,
-- 
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

