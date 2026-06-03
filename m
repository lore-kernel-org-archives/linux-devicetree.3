Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142573DB653
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 03:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456303; cv=none; b=GiPP6U2uo2Bj5n8v04RNXtfn1yZIXv3X+9JgjzM64mvz5wEOKruuZkfRr2JmsPd/RNsR3AaSkwoDHzS4dRpzKzwtn3fjQc+xxNyc1JpduPLVgpRhaoCT0UczcG7QzQ/rjzkSwxY/eE9z6DnGjPqUr42cIyDhnkvZL1YEEg6w6LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456303; c=relaxed/simple;
	bh=zaN8t9MuA2z8Pbjwa2ktfzrhBAhbTEWSUIOpy+NHG7k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QFo/sa8r2LlwoQ65YVDPUMX2fQr2iw60L5ce0egqJg8PP0DbDfFzCTxATYa7FzaSO6tYtZfhPpqlm2oPM+M8+wb74HO8tCkf3/3ZHbo6pjInUUBVEG7z+nc0aKuD9q5Ybu9qxYhAZHjYugVz2HF+ChkmWEvUx07rMo8Eq0wpXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqOfdabw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jny8cL3i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqOfdabw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jny8cL3i"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65318R9W1260437
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 03:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UFAojcZIrZ7Ry4PJ+gae8k
	ixitwkorhARKnBHVCHXL4=; b=bqOfdabwQTlS0ue1lPIqDZZnM4QTGm8Iy4/e4W
	HC+WmnQN3S//q6KyLRsYtBMtTsMClcHIuRe4HgRHI7rEQrxGwQlYgxAwx3tRQ89D
	LT36bM2iqlyPRYE4XAUIKRx86jGwjGBi0oF5tS9pf5QUZHIN1zfcvNOSe6koijwP
	mXbjQYrwqFJ4HfjE56WjZm7iM0ZLluytz6OojHZ832zCvHSjhX4Oo291qmhAQmvb
	x7vn36jDJ+d7cI7OehAbXKr878NKhDapUAN9jPS9nHJw5BfL1iQfoebrTCo3EPtM
	yuYY3EIS9fZtPYnPQE//dDRKmD9Bed+0k9EvR925KCUQQaOg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabggcse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 03:11:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so3946413a91.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 20:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780456301; x=1781061101; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFAojcZIrZ7Ry4PJ+gae8kixitwkorhARKnBHVCHXL4=;
        b=jny8cL3iXLMXfHDxrXbjeylM3wX/QrrLcYBKiGvFMWW0pk2nBdTf/3KXaQNc8aUgeU
         Nm9ygDVfxGykPcBzGkVMvs/dmIF0/tGpm9O+RWt9un4hqrZaXKkVMXhv89SBEzhBx9FY
         SsCbXu9z3KUFV6FHHr7wk59Bflb83BE9MmKnUy72Np1BtzXMp38eMS7YkpZ6DbXcZBp+
         beKL1uoSVZLvaI75DN3kbyczZ4psh9yn5nRFTzXPVaGOl5RaJw8sVNEp4tKQ+tk6du4k
         7ujYDKzYR3DhfLlRAv4KAU/unxR8q74dVstpCGRjlu3fPioS4/UnwuZytouwLM0cdT4V
         u42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456301; x=1781061101;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFAojcZIrZ7Ry4PJ+gae8kixitwkorhARKnBHVCHXL4=;
        b=sSnZOto2RghP3oNK0l5zF91Yn8iqZqFekHEb9ldysqxuic/DLslRhc5JTPmbakBZ3c
         Ixjh6SICpeN6ngTIBPVkhvnDT8W2bKVBihPeCNtNog1NtQh6ZsJQEAPo32MLvFnerqcG
         DSUrfsewBr3HYPAKq0m2da0Whp/KxuYOlIcEgkt8Y3NE0JyVPoyQj8ER+pQtymkBezJI
         MwBjUWDx9523DcJfgBOXJoFobKJvxfF/uL3y7++J817M0LDGFZsFMMIwv3zTx9a9XXtk
         UC7NQ3OxkWRyyoVWGpdJLwxC2Wr3BCwHGLALwcMzcgTa4+xGBXOUaqNP9nzQzfb8AJAb
         7uyg==
X-Forwarded-Encrypted: i=1; AFNElJ8xZDRnm441XJQCYkWRMvRfDlFUq1HzHasTXc1BtlUfrqJfs/7xAJ2LnMPOtLOoacU9eprBhNIRXWJr@vger.kernel.org
X-Gm-Message-State: AOJu0YwaECDiUew9Ih7gauhFjXvldnCKBDjbCKrEO3qZHaxLS2DHuui0
	omyHDxMdVvMjVU/kriwdgZ8oRSQccHXJJaNeoNRPuS1mZztWFBsCdv/GG3t5lv8QwhSZaj2XzUB
	GFwUmjxmcPqMzVqcJJqqzoQCtZW/sQg0tLL8AJxsPvs3J16ggmgZk//PG/Up7mmhT
X-Gm-Gg: Acq92OE1KxjqJiIUzBYNMz6IO8PXHEQiHPAyQY1JEiAyj6Wd8Nso+nAyF61MLmUJjz8
	1pOCfTw9UlU2zpmXRP3IMMN0UedxI3Lw9kmdrtSKl39zuzsxvQOHNG0DeGnr891rd0R1V7R2xFR
	kOq/V1eY4/6zKQlYVNI3AnKb4Fa2Y3h3O2XLtbkShg2c/Qela9n033Mv6K4TMkDGrPmZiqp9NPg
	ZRDpfF+cvjTT2WH7P+4xbXE+C3Gv+sru3vO7lUbhgA2HNy9p8Ye+frB4VCxfEf67wRSKA0PPyk6
	K82LXuEEyoHovnFLVPi+RHEfvdlEe2pjvgTVEdDhGbIdjVRkbg50T8l5LdXRBiyZZGfo06vmO82
	GOlzoEtn/f/ZQnN3rmVszJSnaWiCPJHtau+JRjfKLLzF0ezKr
X-Received: by 2002:a17:90b:3eca:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-36e2eeddae0mr1466845a91.4.1780456300640;
        Tue, 02 Jun 2026 20:11:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3eca:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-36e2eeddae0mr1466818a91.4.1780456300115;
        Tue, 02 Jun 2026 20:11:40 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a276892sm1269420a91.12.2026.06.02.20.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:11:39 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: glymur-crd: Add touchscreen node
 for ft3d81
Date: Wed, 03 Jun 2026 08:41:18 +0530
Message-Id: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-0-3453ef577bcf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFabH2oC/x2NwQrCMBAFf6Xs2YWSag/+ingI2We6YNOym4pS+
 u9GYS5zmdnJYQqna7eT4aWuS2kynDpKUywZrNKcQh/G/hIGjjaPZ5bqnJ+feTNOJhxF2OConFd
 duP7Y0uTJgEKttRoe+v5/bvfj+AJtVz0OdwAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780456295; l=2270;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=zaN8t9MuA2z8Pbjwa2ktfzrhBAhbTEWSUIOpy+NHG7k=;
 b=Z0ovbeUx68sdPSFWpkLlZ03XjPJcV6Measm4wRx5mV1X98xOi3qHgHS5/sHDBpQ/J3X6FkejP
 22owGnklzJfABbwKZnvoPo27HB/RAAGgcTvrPSIzPM/uMNtB52nQ2gl
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a1f9b6d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mZh00jpdjR3KdUHqnqAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 9hDNAvX61Z6dXJix9N5ieb1onzWT2Jkk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAyNiBTYWx0ZWRfX6HOR/EX2Uqs6
 e+Rz1/hfYThCF+IT7znkKZuWzaEeiUSrZJs7NrUcyuebw40imBSR3a84jDIC+SRmoh5GflFitXR
 ZCuA2ytV/w8gcaAlFGequyuhrJ4ezLZ/LO00q0j6JNng539T2R0wy/RrBZJS476Oo0SpWXnxko7
 UJQ6A6gVYMNUaBIurxiXowwRJa2FBHu4hRbPttyFfiu4to+MmVR01LJ2pK0+eoE/rKknny3/YZL
 og33+4UfwBeUzDLP5vaY1qAdaX/mvdJMUcbQK2vbW4Z9WYXYQM06NfeygNt1ubFDgcanOTmzaBr
 MmNcdL4fyrjzMF5faZG6jYUSlRC2hI+pJ2XOBBeVS3Xnwp3XCxr4lEG574EucEJ29dJzmzK0OQd
 2P7wlYiBZk8x/MsZ8CoDLWPBX6se0l10y91ol8AoBXD54VFv1tLvbY7wp/v4z9taSthCMuZkfHT
 UDxccDvbBGotfSauddQ==
X-Proofpoint-ORIG-GUID: 9hDNAvX61Z6dXJix9N5ieb1onzWT2Jkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030026

The touchscreen module on Glymur/Mahua CRDs is a ft3d81 chip which, while
hardware-compatible with the ft8112 (same I2C-HID protocol, same
power-on/reset sequencing), requires the reset-gpios line to be
explicitly wired up in the DT. Without it the reset line remains
permanently asserted after a suspend/resume cycle and all subsequent
I2C transactions fail with -ENXIO.

V2 incorrectly used the generic hid-over-i2c binding. V3
takes a cleaner approach: extend the chip-specific focaltech,ft8112
binding to cover the ft3d81 (they share the same driver) and switch
the glymur-crd node to that binding. This removes the dependency on
the hid-over-i2c properties (hid-descr-addr) and aligns the supply
property names (vcc33-supply / vccio-supply) with the binding schema.

v1: https://lore.kernel.org/linux-arm-msm/20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com/
Changes in v1:
  - Initial submission: add reset-gpios to touchscreen node in glymur-crd.dtsi

v2: https://lore.kernel.org/linux-arm-msm/20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com/
Changes in v2:
  - Add dt-bindings patch to document reset-gpios in hid-over-i2c schema
    (flagged by dtbs_check on v1)
  - No change to the DTS patch itself

Changes in v3:
  - Drop prerequisite-message-id; series is now self-contained
  - Patch 1 (new): add focaltech,ft3d81 to the focaltech,ft8112
    binding compatible enum
  - Patch 2: Added focaltech,ft3d81 Dt suuport which is hardware-compatible with the ft8112

Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
Pradyot Kumar Nayak (2):
      dt-bindings: input: focaltech,ft8112: Add focaltech,ft3d81 compatible
      arm64: dts: qcom: glymur-crd: Add FocalTech ft3d81 touchscreen support

 Documentation/devicetree/bindings/input/focaltech,ft8112.yaml | 9 +++++++--
 arch/arm64/boot/dts/qcom/glymur-crd.dts                       | 9 +++++----
 2 files changed, 12 insertions(+), 6 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen

Best regards,
-- 
Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>

