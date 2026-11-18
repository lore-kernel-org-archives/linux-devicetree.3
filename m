Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982790;
	b=yirOTaylmuSXHZQT/At1pOuR/Cw2EbY9w7jSEQWDXUc9vS4MG6GTrLov5sZ1v98O/SYv
	 lwqG5r10jA+70yn2dhUsXcxjMAJ7i0QFtLhuEmZzaHALgZWeIJDjO0bwlTIbLqiS9EPq5
	 iJagjfIzmRWbJtfchNFruOvwwOuyDVaT/qsugPEW70q3Ng/8vi7htEbxbpbb66lRTvlEW
	 bKEWNnj8jp5cgQfME2FPpFmHoZ5y7djRb63EjegkxwqV43cuNYTPIyqHajKzRE/ikcZml
	 mRJkUA8Dp/KADaa1lEnOFdvhtSNN6pHKcCpVrMmBmFF4nADLu+gwpiIbrKcK2t24S6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982790;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
	b=OjoJLJnvbiKabBmtGK0KNrc9Ug40CFYDABPgO/bHQb2RlHukPb+qr/wKXKKvxCX+WRDn
	 H0LvblCc/ewvYBX1QVflQjd+WW35IWFUHKGF+BAcUXgD83ULI/fScAym28VaGza1KezNI
	 jBcL/UmBmAPfOdQtyjKvHZ6ruIO7QJ04GtuM3Uqm/1MqUkQKUCYY7nBBANftSm+gSAitm
	 TtnsdX+TwYc6ZR9WYGEXkv1avfk2MnblJ/bmgMZdmDrpmz7B1euyXPPaAOPMI5ZDdwzOr
	 yYnKPheyP6S1GhgpIm8q0PpX1xODxPI693ZjXju9RuSBS/N4yew562Ewyu63WFhoTiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="JRrD/6Xt";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+xMUlDA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FF7606A33A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95FF7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JRrD/6Xt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+xMUlDA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI5u7fk2438470
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=JRrD/6XtDsB6Qbh6
	4sy7bGtdYPb9cJE2/2loKnxWE6q+uR9hy9l5Rb7Q68cmJwu2P0E4szy9+pjEjrcW
	KOk+jQzGqhPYWfcSv8wgDlV6X7etDM+TbxghBRHXg4SQzoeM1YoQEzUJtEVz7vog
	B5sMAlmPf69U9vOIPpLikxGqFB1Oerqyhq0h9ZA7LBRovX2FrB79UVpzopQuQM6l
	vzsxU1CoXd6YCCJ/lQWTKFqMqMPoxF5m4jSh0sZnUu6xhbaxACNL2zbKRGD6BPCb
	7qorAaJq/qqTq5mXhgkxJSlRP1ElYj8Tfcfp45U8citY70CC1PlpmKvFlKOGc/Ck
	TfvUtg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hhpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso377462a91.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982787; x=1795587587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=j+xMUlDAdLy2iIwrOI+FacaRz9LN72x9b1dPm6XJ3Y1K5nPFy//YV4YPki1WJgdwC3
         DS6AKQp+rq4JXOxYg6ok5E96g5k0oymaR3M+sUuJpVI4vA2WEk8wWt1GRIqRDoq5Yqhb
         VWVeARkz1GCYcrWXPDwueQewpcvSnxtTTaQyBTBCyAVknAVZ80+JMZb5F24Pe/AocrnK
         /aogc70rh0ILlVNc1UMYoxJtdAil5HlJhHnSyX+g3nGUKtftRK1PXOrNPBZfuMlsJDK9
         xxIIvSoFLoY65ogjU8NNdYJ1hjSN0KEdyzhU6QjfSYDE1DbTUMMvKsNY1Oo0l1sgCbBk
         KwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982787; x=1795587587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=OwAcS4S2IRel7ryxpZfHkz3YmZJR1xccnccToZKuii62hMK8eIYFjxcoooT/b5xOU9
         D4jF7TAhSKSaUhiA8R0vAODAbk2zqePVpmUaPRvOinO/oULtc0ZvnnCnu3tXNExxUz33
         /4L52+DCU1cQwbjfx4IbiuaOXtINLYLqaIN7m79val7EsGrcW/23Jcyi6AMGTqqloQKe
         fuArJ5fBKo6I2tbntj6SR0TY7sehLlUIgz8aZ1ukl9j5S/BQPiH6yOeoyPXRL+2WGSOH
         5lWgQzt71BVPvBAIDRMF7wI6dzQkmbakHiIaU1EuzLPgpL75dYIU2pIMs0ECiuW6bRdl
         q4bw==
X-Forwarded-Encrypted: i=1; AL+hErEqMzcoh1wzR56mTw94TNRp7bNb4a5xIeMiSPnFOqgXaWlGRSM2ze9AbSD7sLWNkvOmSfoD56GKreTq@vger.kernel.org
X-Gm-Message-State: APuU4Z+AWaMCI8QWlyeBNXjXNXrQRZSuwhlmdpxWweFLFIjfhxY7lecr
	mmkRO5YOLT9hS5pVjg+ARZ+nHS6R0xR9SNy41KDZ/p3+8i8KNgNMTa5FsemOnG5fG8HxuDl0vOa
	vdNsdVTjoGr7El6Npohn/BOmaqkebSx9AoM3gb/VZv6UAFitGkoW0BbjNZGH7lHhRCY0rpU+L
X-Gm-Gg: AZFdTZcDNx8T20FJNibgtUwzYyDua+x1oWHgbs8aMVzr689UAMoID0hWdCpKSwOI61e
	kr6RZpeSWdOa4LPUIVg9A3bbYVXav7SEMEO/UTc27qTXZiVjwct/RrRQUdv1ZBLMgnP/m4AIWKi
	qKvQDjUxaQcAlrFvog9+m1LxiSaKOO0xtkJQHtBSOIeDol91qpYkGPwNALyFkttt08YHP8dYOzf
	34J7EG+84QMXDP8Lxww9nwsnc6aBKRSAP8njGXPj9Whcd3rxMNwQflhpRLPz6g6OTevRdFC/gfe
	MZSsoMgG10/zl6L7g6bw0IKeub7jHdzaowgNrF1/jt8QDmklLyNWT6aRjVTMjvzT7MUUIq9qyHo
	h2kYQmoTcLmNiP62rPycPhdfPfgMuDrfjCK90eKrVPNM1VEZqUp56O9Vkc4ypEy39ucac3SMcom
	sLRAfMZDnG2FfBhItTfFP9C+yeOw+xQjSmTJ2/cfatLxgOcJmrIdKIHMsIfwS9RlYwmcFweq/ch
	F4=
X-Received: by 2002:a17:90b:1d04:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b3d07a5375mr1531490a91.42.1794982787369;
        Tue, 17 Nov 2026 22:19:47 -0800 (PST)
X-Received: by 2002:a17:90b:1d04:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b3d07a5375mr1531457a91.42.1794982786698;
        Tue, 17 Nov 2026 22:19:46 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:46 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:10 +0530
Subject: [PATCH ath-next v2 07/15] wifi: ath12k: add Wi-Fi 8 HAL register
 table and hal init hook for QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-7-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: IAzVlp923xBnmRjlOmoXh1AAcnipkEyz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX9+x96YDWMV+j
 x5aKTBdSWSoLyeK2olxguuBW1DM/Pp40bj4b0Kda7bVudO0MIHsBzGKgylYSlOlQfzP1c5e4VxD
 pjyApnhu7+JC8r9gew3mkjRRy3YdT2E=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd4384 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=k5nCMmGC1qFvne7xG5UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX0TLbleNO9lM1
 ExjTidLu+J7M5raWVQoRGZkVki65XdYYfxRfmWQnRRI+t0DXSFl58mK7IwQCgwhYg0LTW2qYzsl
 USvSFU3K9lZOJ8PblPzLQmUafDTgDSSXyt3SCUxL3OZBqlpgTLfMn2TNgNopR+7vk5AMZip9xTu
 iiRRigE9oHAZ9RQyqGGXzrr5hnnjvX7O6VCqGpVvjCI6TFjVISrLkI2M89dOWlpd8upA8uramtb
 AGXfc48l2gIyCaaGTx7FneDy+hEEtXbmwIXtoKaatV3oJsKNmXCaCezeVdfOF9heL7mCY8rB8Gt
 WPFu279AIoiCTobC5ounIfvFLHTqVWHoGiyie02V07qHURB/9kTOrUYpExrJJbt/ZFcJCl7Iban
 m+tJvk17YqFwMwxxkx33j0FZ076rtEdnq/ft4JoVW13kGy1PCgmn4ty8GGiML0j/hU+e+gGnoH2
 jDPggV+CWsDJNJ3apMw==
X-Proofpoint-ORIG-GUID: IAzVlp923xBnmRjlOmoXh1AAcnipkEyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

QCN9575 uses a different HAL register layout from Wi-Fi 7 and requires a
dedicated register table and HAL init path. Add QCN9575-specific HAL
register definitions in wifi8/hal_qcn9575.c (qcn9575_regs) and its
header.  Add wifi8/hal.c with an ath12k_hw_version_map entry that points
ATH12K_HW_QCN9575_HW20 to qcn9575_regs, and introduce
ath12k_wifi8_hal_init(). Invoke ath12k_wifi8_hal_init() from
ath12k_wifi8_hw_init() so HAL setup is hooked into the Wi-Fi 8 hardware
init path. Keep HAL ops and params fields as NULL placeholders;
follow-up patches fill operation tables and remaining HAL parameters.
Update wifi8/Makefile to build hal.c and hal_qcn9575.c.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  2 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 23 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 13 +++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 42 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    | 13 +++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |  3 ++
 6 files changed, 96 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 277b5f13754d..b1b90c109c76 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
 ath12k_wifi8-y += core.o \
+		  hal.o \
+		  hal_qcn9575.o \
 		  hw.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.c b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
new file mode 100644
index 000000000000..1afc6fc21d0f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "../hal.h"
+#include "../hif.h"
+#include "hal.h"
+#include "hal_qcn9575.h"
+
+static const struct ath12k_hw_version_map ath12k_wifi8_hw_ver_map[] = {
+	[ATH12K_HW_QCN9575_HW20] = {
+		.hw_regs = &qcn9575_regs,
+	},
+};
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab)
+{
+	struct ath12k_hal *hal = &ab->hal;
+
+	memset(hal, 0, sizeof(*hal));
+
+	hal->regs = ath12k_wifi8_hw_ver_map[ab->hw_rev].hw_regs;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
new file mode 100644
index 000000000000..311fc5b8015c
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_H
+#define ATH12K_WIFI8_HAL_H
+
+#include "../core.h"
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI8_HAL_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
new file mode 100644
index 000000000000..56d45785ecd4
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "hal_qcn9575.h"
+
+const struct ath12k_hw_regs qcn9575_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00001604,
+	.tcl1_ring_misc = 0x0000160c,
+	.tcl1_ring_tp_addr_lsb = 0x00001618,
+	.tcl1_ring_tp_addr_msb = 0x0000161c,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x0000162c,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x00001630,
+	.tcl1_ring_msi1_base_lsb = 0x00001644,
+	.tcl1_ring_msi1_base_msb = 0x00001648,
+	.tcl1_ring_msi1_data = 0x0000164c,
+	.tcl1_ring_base_lsb = 0x000015fc,
+	.tcl1_ring_base_msb = 0x00001600,
+
+	/* REO DEST ring address */
+	.reo1_ring_base_lsb = 0x00000848,
+	.reo1_ring_base_msb = 0x0000084c,
+	.reo1_ring_id = 0x00000850,
+	.reo1_ring_misc = 0x00000858,
+	.reo1_ring_hp_addr_lsb = 0x0000085c,
+	.reo1_ring_hp_addr_msb = 0x00000860,
+	.reo1_ring_producer_int_setup = 0x0000086c,
+	.reo1_ring_msi1_base_lsb = 0x00000890,
+	.reo1_ring_msi1_base_msb = 0x00000894,
+	.reo1_ring_msi1_data = 0x00000898,
+
+	/* CE base address */
+	.umac_ce0_src_reg_base = 0x01b80000,
+	.umac_ce0_dest_reg_base = 0x01b81000,
+	.umac_ce1_src_reg_base = 0x01b82000,
+	.umac_ce1_dest_reg_base = 0x01b83000,
+
+	.gcc_gcc_pcie_hot_rst = 0x1e38438,
+
+	.qrtr_node_id = 0x01e03300,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
new file mode 100644
index 000000000000..e2dd68ebd82f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_QCN9575_H
+#define ATH12K_WIFI8_HAL_QCN9575_H
+
+#include "../hal.h"
+
+extern const struct ath12k_hw_regs qcn9575_regs;
+
+#endif /* ATH12K_WIFI8_HAL_QCN9575_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 6e89a42111b6..91d8f762e642 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -11,6 +11,7 @@
 #include "../debug.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "hal.h"
 #include "hw.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
@@ -129,6 +130,8 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 
 	ab->hw_params = hw_params;
 
+	ath12k_wifi8_hal_init(ab);
+
 	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);
 
 	return 0;

-- 
2.34.1

