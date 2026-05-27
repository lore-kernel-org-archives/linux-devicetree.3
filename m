Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA033E009F
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875025; cv=none; b=TNEqqzrfIll4mW4pFH3ycwNh0tnotxMNwqDGGyGWPbtJ8yTSxgZ7Ywd60HpNxPINUw6Wwo28uJrChaZZZngcwBLYVRw3w4UHhsa36MXNjfnAQLb0X9yHPgCfqqLm/zYEj1ysEJp7Ycd11HEXZ8Zr9vh0Lp5JCPBogKXhNeZWURo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875025; c=relaxed/simple;
	bh=ak8pqRztC4n5CkdBOXwHRJH5rdifZ7ff4Lss7dcxTQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KiS135x6fTwL3G/KInoQfzp0YbTB3WzpstaDLrKXoXAwcK3CR4gS1q34m89CWQYlXWIYstUvd9g9uzfVjyoK3f0zZfX2FZdniqpOo+gALU/rRzwMk0j1CfJLyCkV+NJmT6u6vEtMV4/zPQ9zL++8lwuUgJsAR6ohKjhMlQsI0kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=liPoEOQC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXF1y0vg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="liPoEOQC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXF1y0vg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8maRT4109020
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yf1lCNCDWPZygOQdkz4Rh2
	gBP/EIpy2DScuvoUBsa0Q=; b=liPoEOQC9gwr3IkgVVv0f2AOmbsm2Bb9QdjIzY
	LoACaEIfkLgamx+8Y3b591roQEuREELzQPfWCSJdaPRvu2MJApHCbhLHRxrgfLBm
	K9uyR+6BlRYpmZV8naBehhACOoKlPfBiL7788YtKDD64dJGS69qgQvd/jACAgxuj
	Z1HkwlaShWYxstxtGU20hLcHJBCgGP6bCgkX27OFCNpBtRulEHIW7S8rukFQV5Qz
	EWRQdMmzR3JRM1QNIzDhGa8r+8zTOdujZS81kVxRnHKUME1nZpBYRQ3uuJyZ6FZc
	QbtLI5HySRx1/g/1foPNohBSpoY0x/AKgpmbI5nSbFaan1Wg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefukk3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso67954095ad.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875023; x=1780479823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yf1lCNCDWPZygOQdkz4Rh2gBP/EIpy2DScuvoUBsa0Q=;
        b=EXF1y0vgb6yeRnCCysygrjx7HoNL71IlPPBN0HK26QkB+kn1hyq3Ft2HZFthaP7P16
         NfTrZC8Qsa25f2qrAA/ezlXRw0RJwRUYH6sg745jOrJDtWZq7y1H46hq/tFqw5vP7jIU
         6KQ+XRPEZ0I6diTvovQycLL2SYFuByZlq6nlIigOPUhpc45FOgcIYF9bmRLPSLnb4vp9
         eIWz+BJZ+Og1vkuauSo2d8YJ+UkChmI3C20qGKwbjAynSZZFqGqFwjn7O3c5B0hw9OPj
         ScGGszEA/WqElpvQtcM8LmAyz4bbVt8MoYJg0dWuwkrBa9s4qKR4Ihb3ftzgmKoK42ed
         WM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875023; x=1780479823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf1lCNCDWPZygOQdkz4Rh2gBP/EIpy2DScuvoUBsa0Q=;
        b=o7AfFpx+RKihujR3MFurWdLzGQoGVhw07gp9To5ZpwEo1O/pa2Q5QzaUzRNA0xX0xH
         HI4wtgP6fi8cSahbVlDKiIUMimqMGuCCTXUT4agYbfgAL7lUo3uqfm7SBv6/T70yiVXA
         68svhZkVnicRVYyqzzD/yXE2PmdoJvSp9/RmHasvq+LBt80vTvqUmX4BCFtLk3HtC1QC
         m4+r/duPqCPJ6hFO9tsvwxAyap68MDT5Obk0YXJenLTb8J4ZuVRlsJa9YxwdGw6WZN7y
         3rOPlDAcc8YibLoRKjt3MS3eNEH6yDTNXXHVZa1uYfFzpb9kBbj+QGcABhLhk+NhffJ5
         Lldg==
X-Forwarded-Encrypted: i=1; AFNElJ8cutJFt7fQFESfZ7GKe4OHhPEkD1/OvPgqxOk5PRQziMBSoDIfYFijDB6hoG4LmLDiNBXCG8xIKTCu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8UHeXkVFfJAXZQ3iyvmRbmxnMHbaxhiOXzPyPw0oz0HflDIjc
	y0ELZNzocR7wpOp9D+lhC/jECrfPVmL4HLT0ibhNK3eLjhptsNep2rF/MyHEzmV0PZhjX9Mfp+D
	rS8/fMr4u+u5SRx6R+HDfco2u9LQ2UvlDQ9KBDkAQgAhq+Gaq5bySbMnZh5Ye/59b
X-Gm-Gg: Acq92OGvHRQW0I/uFL6CZK9p5NbfMtdzQ1w0a0CVfwd7PETsTN0bbWG6ApRNfMMG8yT
	1S9TfIYX+wMwXeBWyzHQu2M0av96CNI+yrd5oOfWBODDVgm8BzRkpm63Tsth6+gGhF0T4dYl5/C
	Xhx/hklGSYq9tb4SJehM73ektZ4exGEHY6XWAgRvKTwnnecaG28nDRtBqqcBD2mNQ0Afu9+65N+
	dHFpmZlmr2vcpiioRQVBMDOEeTgrQd1lF7YOwTtDtOsZYtUtOoZRuq+fhyyMZlMYU0u+RcZqB/v
	Tgd8SMQeQa0dB4rXZjJbSS63y/St/FYeDMklbLpfjhGmmB5wz6EN07d5FPBJe+iZ7prsKhVjHfO
	vDhVZBLY0r87GoXKEBl48LTmcyexDnQ0iabTiB35gR202AXOd2QMwwvBWYv0=
X-Received: by 2002:a17:902:e885:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2beb0699cdemr244710495ad.30.1779875022551;
        Wed, 27 May 2026 02:43:42 -0700 (PDT)
X-Received: by 2002:a17:902:e885:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2beb0699cdemr244709985ad.30.1779875021925;
        Wed, 27 May 2026 02:43:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:43:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 00/24] dt-bindings/dts: qcom: Fix PDC OS Direct Resource Voter region window size
Date: Wed, 27 May 2026 15:13:05 +0530
Message-ID: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfXxq0O8kNkg4lK
 7DTRHthl2YimAZXcC8Ml85kqyWyIZVD7IQXroOJNdmfTenYviEpKii+DViig4i6x+mCHk9O+thl
 tRGbfLbvWDRiKWFtI4j7pFSuZ5EIh0pjDUZGyBQ3cSy0Tq4cBFI6Vdao+6CqPkJTLCp2r26VdkE
 q4V6vc63X8eix3H8V21k8LcexSUY40WVKwzzNiJGyr4XyH3DaHrgtPVQ5AooKRaTfHVEkNSfAo2
 HYvDYt/6qMXhi/YIBEoYoWHK7+DwUp69E/bQ6SR8Dqa48tX4rDcnSzD3JD7MjV3EkW/cQWfWHIf
 27KvUug967zHl1xwQ/lf2x64o/ZfJLzLnmbJft6x2ztQvcwBFm7VoyFa3S0rXqA+anMU6LrRqZM
 PILcdmMJIPt1OWeXpUfv/EnloiEI//wq/gQDqHqdeq89sH40N+ByYQDSWUK6NrF+3ECGZnJMdrc
 F1Gv2Xa4GrQPCD6eFgA==
X-Proofpoint-GUID: h3mUj7f0hXmFBw-LqXEHEsApTiMz5nQz
X-Proofpoint-ORIG-GUID: h3mUj7f0hXmFBw-LqXEHEsApTiMz5nQz
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a16bccf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rjoA1jeWjAGnMlSNlwIA:9
 a=bzHLEoA-GPT-YQmQ:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093

The Qualcomm PDC (Power Domain Controller) hardware exposes multiple
Direct Resource Voter (DRV) regions, each 0x10000 bytes in size, where
each region serves a specific system client like TZ, HYP, OS etc. Linux
only needs access to the OS DRV region.

Despite this, most platform DTS files described the PDC reg window as
0x30000 bytes three DRV regions which was wider than necessary and
matched the driver's QCOM_PDC_SIZE ioremap clamp introduced as a
workaround for early sm8150 DTs that under-reported the window.

v1 of this series [1] addressed this in two parts: driver cleanup
(tightening the ioremap clamp to 0x10000, refactoring version-specific
interrupt enable paths, etc.) and DT corrections. The driver portion
will be send separately depending on this series. This v2 sends the
remaining DT-only portion.

Patch 1 corrects the binding example, which still showed the old 0x30000
window and would mislead anyone writing a new PDC node.

Patches 2-24 correct the PDC reg size to 0x10000 across 23 platforms:
sdm845, sdm670, sc7180, sc7280, sc8180x, sm8150, sc8280xp, sm8250,
sm8350, sm8450, sm8550, sm8650, sm4450, x1e80100, sm6350, sar2130p,
talos, monaco, lemans, sdx75, milos, qdu1000 and eliza.

The net result is that every PDC node in the tree now describes exactly
one register region of 0x10000 bytes — the OS DRV region that the
driver actually maps.

[1] https://lore.kernel.org/lkml/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
  - Dropped driver patches and send them separately so that it can be
    picked by irqchip maintainer.
  - Rebased on linux-next (next-20260518)
  - Dropped the changes which was removing second reg field in pdc.

Mukesh Ojha (24):
  dt-bindings: qcom,pdc: Fix OS DRV reg size in example
  arm64: dts: qcom: sdm845: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sdm670: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sc7180: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sc7280: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sc8180x: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8150: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sc8280xp: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8250: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8350: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8450: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8550: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8650: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm4450: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: x1e80100: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm6350: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sar2130p: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: talos: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: monaco: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: lemans: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sdx75: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: milos: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: qdu1000: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: eliza: Reduce OS PDC DRV span to 0x10000

 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml      | 2 +-
 arch/arm64/boot/dts/qcom/eliza.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/milos.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi                           | 2 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi                          | 2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                           | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                          | 2 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                             | 2 +-
 24 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.53.0

