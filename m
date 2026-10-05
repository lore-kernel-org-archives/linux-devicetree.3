Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C94C653E
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214199; cv=none; b=UP+e3c7Fubrh3dV0d8R6LkAiNgUikIL+SPjihYqO7LOMFUnJp50bxXnIe1EouQsRLGkwPkiLo3MZReOnxrvppWRH0ZhYbCb8OTXl/grvUBuV2b788fTE+/IJW0aXLQJGrKdPWOyQepJleVa6x5potIJruZTh1XFeA3zLAIHu8zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214199; c=relaxed/simple;
	bh=0rZMtbqx4OJH/ZRZnVtsTEJfbEO8f/Oy8uSFfMNquXQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FHVfTm3SPT/72IP5yDspW3iO0D9jdU5j5VQRfVQ1gf0KNKSo2YROQ7ZvESBq6Yae5wJImYAQ9KsvArsyfrAk9Ha74S92DQ5Ob8jkGNh9FksfajyDezO8yQwohgAwtdwsM1BE8kxVgV/PaUPVOqnrgT1fyO4E1738Tm58lV+jLq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKtfxl2B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyVDRvtV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKtfxl2B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyVDRvtV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EPwD2762336
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 15:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rCXw8A2I1UeDoK1QSfdJN0
	EuaLobUdXeGbqPzaAGUk4=; b=QKtfxl2B5MEPWQPK/JhdHjkpmV6cfy2eE9mmrn
	umzA+SXBw+eL9JGvBdsBacHrXg5xlIu00YrZjyPijB9ZFQXcE2ZSEvY2uAvIBMO+
	qW5UKs3H6QJnNeu4EBZqDSPkOgABECXe2bhIpRxQPr326jKFF/4os+vf1lwhOQIg
	HTjkKa2wvhFEtdYjgWL2YaUjSswYMHtxubz23JYz1ObI//9RcgSdU+peaU9gwFmd
	GmIxwEQJVQkoCWUNEUFA7Ph3i+4N7WGtg89iWQQRF/v/FkDgQOGqrwRJu7j5Z9QL
	uPJkuiNvmQhVAkz9tLiD2xeNjs42ID/kjokmvjG+cH6IXLlQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dncg959-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:29:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88679c4f94cso1299224b3a.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791214194; x=1791818994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rCXw8A2I1UeDoK1QSfdJN0EuaLobUdXeGbqPzaAGUk4=;
        b=jyVDRvtV6cuhqiZ4DihK+rM7RxdLl/acsJov3KjHqNnl5YzFWyyFof12++hILSFe8A
         UOXB0GX3NUPLDbN21gtm3f19XraBbKpp7vl83Hx00/tIsPbACjAVugM7JOBy05LGZjD/
         0JcUt3q5d+r523Jt3OtLssgOyo7GMNDbAxy4GlzGtpd/fWLMMz4lROU8XPxhD3mrB/DB
         VB+X9lBPtHGo9eygoP+yl07Uz5vGnzFJZvl6cvrM4y8eNSV7SBekOX+LXVKZ96AawX6y
         8ByN+brj7+RXwv4uWihesBvLAjXtiyJM99DRqQUUkEZm7GBFd2Q6WIHVv6NAlcbCp2Fx
         Nw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214194; x=1791818994;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rCXw8A2I1UeDoK1QSfdJN0EuaLobUdXeGbqPzaAGUk4=;
        b=UPeucwNJri+1fUkwOOg2rCZObVFcrMD20MU2SfV4pGJeXWxLZ4fsMITpw9ZY951pKU
         1eecC2H1iCd3R+h3rWxjPAlCzocQt86+4lfnkhLrtsnG+vZK0PEjmKeUxoHbz7MVIXWz
         EbQLg/psYJt7DN6yNJNvE49sPl35ymVwi2cB6wDwm2iKayGiaXl/7VqfAxLk83t1L6KP
         UoA4PSxxPdxN+qZFITB8FIIDfaTsh9OtAJgn4zjCuXHDMHpwRe8WiNDwWcfex1jPz3RB
         WiiZ2lXClL174ousUVJSkHs404rAg8GskorxGGFECAWgvSlbgSM+/+aS7ZJ+5NBrl765
         PFww==
X-Gm-Message-State: AFuF++nDuRh8NiHPJI86Y0mpz8Dq/+n8TqI1o+GHEqh1wokFRJnCcGC0
	bzvUtpCIJ9z+nTu2QbhcqKmq1WjYdpPVBPCL2YiwIZRaXa9v0PR9OTzXnJ2J1/aUmTUQsGRDeea
	pdUHTKTVrUHHKnCojBS1YCGc5OfvFFLo8tsrzPcEFXNsk89LlX8u+BLPboKf8i9Zs
X-Gm-Gg: AYBFou3ERTKLGH5ZXXzqhtW06PjLxePjrqFoiUSZ5aSnyb2FhKeAexmfG/23svpOeeT
	zZNjk88sA0RgJIWX2Yon4fi9ySzl7p7xjP3u0gTCaUytkkZyRzEfleJxiZc6W8/kXYSv+N965Qk
	9z+kWwEhnVV5TElchLd1yUdBiYDbQi94sd/T6Xs83rZSX6aIbN1WUxH9qb7mh9v3do4IUse0QMQ
	HChu6wzuGjarJP6mJiycZ9EY9x0pGctWh+7u3uVQIpVlBz+ZPr8cbzwSffq3UXksoFcR3lkevnD
	KFpEO/0J+H9kMwr0xVcC4ehtgfxdg3wDz6d+J2KjQy2nPcoWBphQr0TOIagoaVbUY5agVbkZvwP
	qEnkpv2hdC1ciGqd8F3Zgl/1MH4uh
X-Received: by 2002:a05:6a00:f87:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-88af59ca53cmr10814041b3a.52.1791214193886;
        Mon, 05 Oct 2026 08:29:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:f87:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-88af59ca53cmr10813997b3a.52.1791214193388;
        Mon, 05 Oct 2026 08:29:53 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c792ce7sm3681528b3a.41.2026.10.05.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:29:52 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH 0/3] pmdomain: Support system-suspend-only domain idle
 states
Date: Mon, 05 Oct 2026 20:59:41 +0530
Message-Id: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXCw2oC/yXMQQrDIBBA0avIrCuoSAi9SgnFScZ2SjHBMaEg3
 r02Xb7F/xWEMpPAVVXIdLDwmjrsRcH8DOlBmpducMYN1hirxfHypruUUEgPfvSIGP0YEXqyZYr
 8OXe36W/Z8UVz+T2gtS915QdEcAAAAA==
X-Change-ID: 20261001-s2idle_state-6484bbbf48fb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214188; l=3514;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=0rZMtbqx4OJH/ZRZnVtsTEJfbEO8f/Oy8uSFfMNquXQ=;
 b=NXMdRjPVdkOUnvkOhaWn8LlA7qSPqn6e0LdgcJn7ZsRyAQYK7Yn9r9hCj6ymhwui4iheXc7QH
 jjC6DXrjIZLD+pRghWt75RLPFmT1twrqOr24XA5x6nWVKNoIF0CIdf+
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX3ccBUQPsS6+H
 9t9FyIKKchCP+/CZ/FXnn7bYaJcpJeAV6+GGgKLRQBu1Xx3AyY2LMyTtoEyu6yBbIQockfKmtQ2
 LBng0p/4RLIy5sVWN2ENXWHZU0Gwrq8=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac3c272 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CdNNJpWm79WUBrjYsGcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 3EuJhKkTzIEtp8LKrOybZLvn9i8Jyy0F
X-Proofpoint-ORIG-GUID: 3EuJhKkTzIEtp8LKrOybZLvn9i8Jyy0F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfXwSHqSIZagvMk
 ST1r5wEq//CRQQTwNSUkgOE5KznaHPFcEs9W3Ex4elYnn9fWJSWrKo9h1YT3Eu/Flkf3GwLHUXF
 MqO4uu9cFBD0AM2oD4z68DDQOfO4GVGI6RawD5hWbXZXvt36b/BExPFWtM1R9vWeAkf1BFske/e
 NPeFoXWKzIBkmNWD62c8xzmcOV0XH6NPYUVVFFj7MD4u3k2kzii2kqDggkAqF99NwAQH7dHWzab
 1brwb1MpM2mjNEa0jIhAboKcwCWz7wKRgzLUPCdQ2IZ7Yix6v4LdsI2yTK5sqIjgzgFxxT5Q2ZS
 /oKpKr+Bs39ySWp+wjw/mYSuiBAojjCLx1yNz8+XaZJRhQ3Kh66bxxjaKT829y0nfd1oEO51cOa
 hS7S/jyswkzC2WIBQ2xFC+dl536bLUbLEp8xb4U34cWJyeGsW1gc2a8S3xTZHvyQ3MI6j2BFy0I
 K0KzoPNesFaJ2RpIczg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050060

To achieve the deepest CPUSS low power state, which can lead to chip
rail power collapse (CxPC) on SoCs such as Lemans, Monaco and Nord, the CPU
subsystem (CPUSS) and the Safety Island (SAIL) subsystem must be powered
down together in a coordinated sequence. The Safety Island (SAIL) is a
dedicated subsystem responsible for safety-critical monitoring and control
functions, and can operate independently from the main CPU subsystem.

This transition is divided into two stages. First, firmware requests SAIL
power-down through IPC, after which SAIL waits for hardware low power
handshakes from CPUSS. If an interrupt or another condition aborts CPUSS
entry into the deepest low power mode after the IPC request, firmware must
bring SAIL back out of its low power sequence before any CPU can resume
execution in the OS. This recovery can take a second or more.

Selecting this state during opportunistic CPU idle can therefore cause
substantial wakeup delays and repeatedly interrupt SAIL operation whenever
the CPUs become idle. SAIL must remain operational during normal system
activity, so this coordinated power-down state should be reserved for
system-wide suspend such as suspend-to-idle. Shallower domain states
remain available for regular CPU and cluster idle power management.

This restriction concerns when SAIL may stop its work, in addition to the
transition latency. Idle-state latency and residency values alone do not
express that requirement. System suspend does not eliminate interrupts or
aborted entry, but provides the context in which coordinated SAIL
power-down is appropriate.

All domain idle states described in devicetree are currently considered
during the regular idle path. This limits which states can be described in
devicetree. Due to hardware constraints, some domain idle states are only
applicable to system-wide suspend, including suspend-to-idle (s2idle).

To allow these states to be described in DT and used only during system
suspend, this series adds a boolean system-state property to domain idle
state bindings and a corresponding system_state boolean in genpd. The
genpd governors skip these states during normal operation. The system
suspend selection path remains unchanged, allowing these states during
suspend while retaining the existing wakeup latency checks for s2idle.

This series applies to cluster idle states with the "domain-idle-state"
compatible string managed by genpd and its governors, but can be extended
to CPU idle states with the "arm,idle-state" compatible string if the same
restriction is needed for CPUidle states too.

Assisted-by: Codex:GPT-6
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Maulik Shah (3):
      dt-bindings: power: domain-idle-state: Add system-state
      pmdomain: Add support for system-suspend-only states
      arm64: dts: qcom: monaco-evk: Add suspend-only power collapse state

 .../devicetree/bindings/power/domain-idle-state.yaml    | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts                 | 17 +++++++++++++++++
 drivers/pmdomain/core.c                                 |  2 ++
 drivers/pmdomain/governor.c                             |  6 ++++++
 include/linux/pm_domain.h                               |  1 +
 5 files changed, 40 insertions(+)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20261001-s2idle_state-6484bbbf48fb

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

