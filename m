Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724BB3D1A82
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749922; cv=none; b=LjF4TTCOHvqvRlsqhsplp7oPHcInPG5zmHayInU8C/9FH+XJ7Ahu5Cw5J0NTPjO939kN9GW18ilZ8+9Lhjolij5HlGh81UCsbG3Ndg9GL+4h0/6czPeoXKtogrCcvw/xWG4DU9pJa8AbM3494dZEnz+IkxBHHYaZDKdv4gKGw1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749922; c=relaxed/simple;
	bh=mdZEiXnEcF1Ehzi2mtklDaI5cuB2rt2/NDVg1wust1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHo5ffH8i59HkLUZibXu8SDyIMp5w66dZwsMKtG8RzXoH6Jv0jcqQWyEEinkCCooIeUMLz+rYMdy+sgUltjDM+6eKxDXrz2sON3umkw8B5/PGo0b2UNc30B5IyAr6UlmsyYlQekx6BGye0csfZTJfaz2pEOS5O8WDx0XNbBrttY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZwDn2ud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ab/esqRN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZwDn2ud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ab/esqRN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6GoDs2899477
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=; b=PZwDn2ud/5UDT3Wi
	iMVCBXhIXjgaBmjSaezgIGsamG2c07QfQSyzVZZHTa1TsjipvNniGPkDCjvCbYAC
	4QLFsd2/vW0YISLZPYJfHmwE6PG1Q7pUKn0XxAogT93GnDtAP0we12GVm3Dj6OZc
	IMoQBlhf3UGseHi4EXSSe8S46SoCLrcf04Q0uHbUOLmrSi2wkn92Kfk5nxqr0+de
	hKktvN+QF/cY8qu+sikj4dJnJRRRkrwjA4hUtnZ1l9tMTaQSYu+FdzDqgYo+dIOB
	Cbn5dv+XJj4uWsuVRp8FpX7ymOTtLUN1bvrYBP0gMWuUcKNofpfogOcd6VA408a8
	iyu+4w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w1401se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:31:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34344599f01so4168345eec.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749915; x=1791354715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=Ab/esqRN93KUTdSnt7DJ6w+sv7NiUpyVEaFPIpzuyUH6OQF0+vU8Td5ay6/v8GKFK3
         Z+tnrG7omQk0nVAzz1tBI90VOv3T4L20oT/M8UCJ+dikJKY0R2r0oPKThprXhfjE9Ig5
         2OXdUXtQv2u6/II5E7i0YB2eInAtXhj8oZTB0MKMALiN+xggnCSSjSR1UOikCVbZYJXh
         ymIaXAk2Nh4s19mlbAAEJBKfvEY2VeajkeQe7rF9/Sb7kJj0oPI3uPOTRRi+o60MzxVc
         Z8qrqopcbFjDXsVSErLNCRrMtfX2ERpaYny2S9EEwvFb4OnTQzVhng+e5qu0dK7VvZMP
         uzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749915; x=1791354715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=xs5F7o8OzsK/zwcufRRptrIaiTLzfMjRNnj4tSFL44endT2V+gQXFAek4uPaNAPUNL
         it7lyEZXgMePMWgAghOYoaRyTJaG1Hmg/S6fgJfE9nNOBlIwXksu36VqgI+vMjw8U+Ew
         X7APT609NuQc/WfuU+YOUOTasyiPAewYXmJst9oGQ9ac/W2pzXeMxgmbgxVAgd6/i8Eg
         rbGsKEQKfnXmrVVxLbby89fmCAdGVblIhr7MZFfy0kmayqT1YTckZ+JMptMHFlNe6Tt8
         y7er1QMQWDn5pdd5GZdpgEfxOcRD+Q4oAx2JeB3W9pbV5k6MHqh2AMEXQmH7QQ64OojM
         o1Eg==
X-Forwarded-Encrypted: i=1; AKwUvBw9HHQiocAmB5lH/nttBDe5d5E7wgeOvNNS8YGW5R5OUxZwUEi6AcPd5Jql9tRKvgNIgXP9lKlgO1ct@vger.kernel.org
X-Gm-Message-State: AFq9FYKLnW4uCL+XDk4E3girnUv6TELq9DTNuFT0skP0efDspYPhfssO
	GGsA5rcdVqigf+cr1TdFEOSmy6aN7RgmEICAc5lPJ6wpgzFi18czole1rXYXY9a5mz/YDGXOz4V
	YXajpv1DyOC2HfyuNZnFVI8G2xT7CR+6/UuQ3MWc33Rhh9ONuAYgmpPi8IrDx4G2A
X-Gm-Gg: AYBFou0A9IV0vcI8xaRWWtezk+ki9X827CMk3zVLHVDwtECQFfXEeiZaUw6W8RhrCm6
	kt+xPm36kny+Um296AGKFDelEeuUAORfhNBa3latLELQjAEMmdB/K2mjG6tK0Wk5o1IdFKMbLnz
	zYt8IzuWsxGg9UUHCZQDY16qp4QFvOiO+nYejvOx7zdu8hZKq/haHQktRjN81TkkXCfhEAQfIVl
	ASxiP4onFZhlpZ+u8/Z8rIJotfPLYL6aZyv7cZE+4Qf4rUCWozVSxzCv/kEh40o3+U6zWKIF5hS
	8rCG3/wvLHS50VFS9tWSlkLdRPyyn0fUREYpwNWnAVhrAngR1Og8scGuqmgMmE0qNDqW90xPxGi
	CMgxnUVeqKcXAfSLjWcZFS5ZzMfCb/Wi/cwH4X6QELfXMg02zoNg=
X-Received: by 2002:a05:7301:4714:b0:341:85c0:91ca with SMTP id 5a478bee46e88-34cdc3c942emr754305eec.22.1790749915300;
        Tue, 29 Sep 2026 23:31:55 -0700 (PDT)
X-Received: by 2002:a05:7301:4714:b0:341:85c0:91ca with SMTP id 5a478bee46e88-34cdc3c942emr754266eec.22.1790749914616;
        Tue, 29 Sep 2026 23:31:54 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf572e976sm1503416eec.20.2026.09.29.23.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:31:54 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 23:31:24 -0700
Subject: [PATCH v2 2/5] arm64: dts: qcom: Add header file for IPCC physical
 client IDs for Maili platforms
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-maili-dts-v2-2-965688646c4b@oss.qualcomm.com>
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
In-Reply-To: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790749912; l=2377;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yWrLgn4BhUP2Li9oQYTGa5Fv7Hp9QVFrMuhqbxh5MWU=;
 b=RiFdQ/bNy/bMhhNHLnMHYAu9LUbjdtaOLbdnqBXqorS6UldSg9RuugFG35G1mqlPC82DBZYTc
 mXhRAhSYdC8BXLirWXB+bIu0mUorBMeuwgpxNSlkMDcOuZ8t/D1Np1c
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX4BG2t9DeQ3Gy
 4M0MkhHLxne+UMPC81BLU17l2UCIxneZC8uyMegV/XhRwMbC+cpANctp7XXurWWpri9kaigxfMP
 7cnyoL3ozhc81BDRUyW6BxSzVRU+J5Q=
X-Proofpoint-GUID: d6VXV2Tg6ZTYqAKtrIX5LdMrRnIyBl9q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX0qi74D5yPXp3
 +IwE5f5z2VQaIWLeMg6VaxpawnX+3Xf8WyoU3kV72n6vMp64ICuQjlINpOBPDHYmDlVO0G2T3kQ
 TsJLftVOdtJMzbV/qzLBcZfpDgTutKorToU8EHspEw4b5PCWPcN5ELc7L+2aIzcuTTIY+2k6W1W
 mSd8iCbKaW59phodkUlXuvrBthNN2/Oy1VSOG15KEyR52HHubevKRaESMd37QM8AXKbn5FCyhUs
 smPiH3SNN6t4GRPwrSkOvN4xXAtuJm1YOBPyvKVkl/CQR9+9IVF8zfxOHuSUtt2dMl+ixqZVbe0
 9+Xurw+Kc3PcarXaPTF99KPmrrHRSGnLENCPcPRoGt3sTVyTdsMJBNa5/SbQj4EbVp6qaDsuK70
 /+R8HXkTbKRb6g5ohci8vArxPrzsrFGAo34F6egJG5vbfgIFkJwVQlq0jDrFoHe1PfmnU6rIQL1
 9P8r1qfeeG+OzBhFRCQ==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abcacdc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KM9v1C0ZMMhQZhCIbx4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: d6VXV2Tg6ZTYqAKtrIX5LdMrRnIyBl9q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300025

From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Physical client IDs are used on Maili Inter Process Communication
Controller (IPCC), add a corresponding header file.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-ipcc.h | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-ipcc.h b/arch/arm64/boot/dts/qcom/maili-ipcc.h
new file mode 100644
index 000000000000..7cf66d20e9c1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/maili-ipcc.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_MAILI_MAILBOX_IPCC_H
+#define __DTS_MAILI_MAILBOX_IPCC_H
+
+/* Physical client IDs */
+#define IPCC_MPROC_AOP			0
+#define IPCC_MPROC_TZ			1
+#define IPCC_MPROC_MPSS			2
+#define IPCC_MPROC_LPASS		3
+#define IPCC_MPROC_SDC			4
+#define IPCC_MPROC_CDSP			5
+#define IPCC_MPROC_APSS			6
+#define IPCC_MPROC_SOCCP		12
+#define IPCC_MPROC_DCP			13
+#define IPCC_MPROC_QECP			14
+#define IPCC_MPROC_SPSS			15
+#define IPCC_MPROC_TME			16
+#define IPCC_MPROC_WPSS			17
+
+#define IPCC_COMPUTE_L0_LPASS		1
+#define IPCC_COMPUTE_L0_CDSP		2
+#define IPCC_COMPUTE_L0_APSS		3
+#define IPCC_COMPUTE_L0_GPU		4
+#define IPCC_COMPUTE_L0_CVP		8
+#define IPCC_COMPUTE_L0_CAM		9
+#define IPCC_COMPUTE_L0_CAM1		10
+#define IPCC_COMPUTE_L0_DCP		11
+#define IPCC_COMPUTE_L0_VPU		12
+#define IPCC_COMPUTE_L0_SOCCP		16
+
+#define IPCC_COMPUTE_L1_LPASS		1
+#define IPCC_COMPUTE_L1_CDSP		2
+#define IPCC_COMPUTE_L1_APSS		3
+#define IPCC_COMPUTE_L1_GPU		4
+#define IPCC_COMPUTE_L1_CVP		8
+#define IPCC_COMPUTE_L1_CAM		9
+#define IPCC_COMPUTE_L1_CAM1		10
+#define IPCC_COMPUTE_L1_DCP		11
+#define IPCC_COMPUTE_L1_VPU		12
+#define IPCC_COMPUTE_L1_SOCCP		16
+
+#define IPCC_PERIPH_CDSP		2
+#define IPCC_PERIPH_APSS		3
+#define IPCC_PERIPH_PCIE0		4
+#define IPCC_PERIPH_PCIE1		15
+
+#define IPCC_FENCE_LPASS		1
+#define IPCC_FENCE_CDSP			2
+#define IPCC_FENCE_APSS			3
+#define IPCC_FENCE_GPU			4
+#define IPCC_FENCE_CVP			8
+#define IPCC_FENCE_CAM			9
+#define IPCC_FENCE_CAM1			10
+#define IPCC_FENCE_DCP			11
+#define IPCC_FENCE_VPU			20
+#define IPCC_FENCE_SOCCP		24
+
+#endif

-- 
2.34.1

