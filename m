Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982795;
	b=42VIeL67liWCHItEuX7d4toICb/TxzEebUNE+v+6Xl87nwNv12xzFiopChN5VvUrH++y
	 EGjMMDKsnQm+koxAfU7D4d+3SB35Bp+N3L1k5lBj1vEfOwVkCNPKH4puNFhK3cC/Ukwou
	 4dOLxETPUaakq6gGDTJpeZ8CC63fQbXywvJqfHEroE80LYgcjQseIRvSfoHU8eRj4d5Fi
	 V4DMHP+4RCBSrv+IGuBncL6DPyaA0gSa4GzETilaROVO0tMsJz2l+6+9S9aHtb1A30wHa
	 WhefSF6VIcWm5++/93pQvH+jySxeNZxxqNVVAc+WVXvjf6zGjuWuhMmQ0gmt36yFplA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cXs6kKvw6F0BGjzNjpFyT6a+TrFL50VAPUvt2G+w4DA=;
	b=oaEoeNppB8iwkv0gpSRjwweZBAOmkarxoD1TK6T9H0NVSfttmIHCKLIsdOPAvynOksTp
	 +IVQB9wPDJwLml2PCsRIfWMI1jaCBfSncAY+TVT02lIgxrZtzi4iT06hgMjJ4WLdnbt1o
	 BSxkgdkaXlJuhO0yFA9qyjwySqimZvF8o3hFA7r997617gfczaJdL4Wa+9Y0BgLsN+KN7
	 I9Fe5J3En6N6zZZtExVz679aTLxBm3HP6F4T6NOcvGTAk/bEaHlsgUIwj8/nMJILBDnrs
	 g+8NfnHm784N6pDIqlqVyThVLBHoEqYCPZKu4EapUd2wAYzj/wxE1blA+7GwWHpOi6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpRAxs9c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jJTzP1ZG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8698A606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8698A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpRAxs9c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jJTzP1ZG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Utwo1959667
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cXs6kKvw6F0BGjzNjpFyT6a+TrFL50VAPUvt2G+w4DA=; b=gpRAxs9c1skJG7D1
	rroZRoFw3m92qf05QqnvGyqEN2EH48NsdPs6kCpjTp8tYPB7g3soJGQ0mDdCaybS
	H3wVgVZPSSfE0MGJk6DAYbrisykG5W7GjMVKIyBkAlaX+DuVF704Xp9q1lGKAniM
	oCqh+O/oUom+SbzuMLzTn8QQektTqyIpsFQhdwrmKeq4SvPJ6sHn8Jw/sXsZPzId
	sBdFX6niuBQmZdoBqe7xJggPBIka4/VTz7p/Fi7arP/gPRgNxBUygE3SBTkMIWp1
	fWBEaqYLmQ7lEPjV6FTOPtFUM3zo1eRxsm/PKuMjymMzihntZwWoCRiCsmTbFS1z
	peR8Jw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hgvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3c459a35eso712396a91.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982793; x=1795587593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXs6kKvw6F0BGjzNjpFyT6a+TrFL50VAPUvt2G+w4DA=;
        b=jJTzP1ZGeW9hX7tfHOQegvRMcp4eIv6vrVK74nTms3bfTl/5yuvZFhXDr5TgfXub9Y
         IxSHoiqt+jXv0h7+QoOvzReusX7bimVR+LyRyW9qS7mG1sSdqfoukFNdpL0/OLK0WGh9
         kC8jvD9ChBbvOWgZmcnaStEmKDraKF5evftqD8KESN/WgHZZw3ax7fZPxdjefjEoiLMr
         6k55gMkFZaJKL0q97NqBTb+icZkV/eOcaKo9OqSVYitwGV6IuoB9n2TDsPNAioCTOgll
         Qtbfk/ZoV/kmC+Tth28hLYHn7g6lRX5YRLGM67TeLSCCz73EPsVWS1pw5TbFSyNZySyS
         4itA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982793; x=1795587593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXs6kKvw6F0BGjzNjpFyT6a+TrFL50VAPUvt2G+w4DA=;
        b=FN/2wYsVzdz3gFVwHq6vzbEXnIzvq0rldq6C3vJuYIy5bcP9diYUwJyKbsM7t+ucUc
         MLqyskKDoAVyZTocory5PPZum5qWuLLiLgHyIdf/UE8mvRSGaBDJBvdxgbSCDcMumwr5
         MbYuBBTqgIpA6/ZcWHwDLT2YqvrARNB+yXD6z9pD9Rqwj5xyCVoJhUwATiPY/FjObdMZ
         W4alyfMLGAkcnd3aUIWZFqkbNe8nE6zsX9NiP51dsTYdwIt2ycxClpRpnyBNKsSg/h7a
         D3qtbAQUCy2Dwu+tRBISefGAJ95c8afn8gPcIqsTg9OtBXRtQZX9qG+HY0ROs22EEQSi
         Yikg==
X-Forwarded-Encrypted: i=1; AL+hErHQqyP1W8sA+Z9/dbqJGV28djY+Jn4mIifcJY6P4ugIzuwSUPAMgVr7WQxQix2b+2kq1CTZQOVsSuxh@vger.kernel.org
X-Gm-Message-State: APuU4Z/FIxl2w6Fw/M4fzPZ16LM/ZWTStI+g7zmj/GKcVWkhnZDn4924
	tAHPaSyd4ViOCwHuK4m6RzzTPNRs+S/bU5m6xJ0jDFkaf/cqax3Q7U9HEZHUraDsOzSdYix2fB5
	9B3TFGrTeOjGxro3pMqIaZOITm/SRGquVgr4oOJTi5rEmoqtHHL1I+Kia3pPwTV7y
X-Gm-Gg: AZFdTZf3MLudIQz9hhYYJHzoTqOmWNcGxcVoS8UUyb9MhbIVLvw2FEKWdzmhY8+QWtL
	4laJYda1NklQq/mrt3A63eR5QzUm9CGvMrHLptRqdVSs+TTp4P/w3MHhC/1Role/SZ2WdvlKE3U
	G3IH2xBPiLn4dTsidBzPkzHhINqSSFRvEKsvXUZLeToqEZPXiUbiRfCYrBdNvlK7TTGoceNyplo
	3VoGmsRFADdKIrQBv0Es3ocD6c2tLKJkPdjlyLYBzYgoR/MfveJJCbhGiLldIF9F4sW/dJScqMH
	au4AR5khgCd/nBAOygsna95TvKQjUL9asxR5pD29fHm2SdiUvVZB6u1IZMTYY9EbiZ+WOwKEhg0
	+KTPrZvdaL+toyyPhk3HzGlRSOm4VYpPCZp7GdmY8+FHoWCpxDDpyhJR9mjI28P8Y3ENiuNGAp8
	kShrQjjNrhyUaEF7qj+j9n+3ENJrKDKSyRCWQhCWq3M5JrqXmhYDW0x96s9ZRbIsRhnmJDuoJ6c
	E8=
X-Received: by 2002:a17:90b:2243:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3b3d082afb6mr1617943a91.54.1794982792586;
        Tue, 17 Nov 2026 22:19:52 -0800 (PST)
X-Received: by 2002:a17:90b:2243:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3b3d082afb6mr1617916a91.54.1794982791931;
        Tue, 17 Nov 2026 22:19:51 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:51 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:11 +0530
Subject: [PATCH ath-next v2 08/15] wifi: ath12k: add Wi-Fi 8 HAL ops and
 descriptor definitions for QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-8-d81a3046290e@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd4389 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yNcPeKCPjwOc6u_oLaQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: V6IYytL_Hp2JYzZUDxMm4hc_6D3Y3tfw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXz5mA4Y86wOpM
 CXGsqURMYcuGYItGlKJqEtS360Q+Wm92kltJUCD+73kAlRnU5P9IhurjsZK51xJBms13ltW8weY
 qZ3V5Nv6h9U9mVDDB6exa5jIcKQN3vAcAQTv4r8C5zrB1kurcOZ3TAj0ihEbZ4zvfkg6Z2As2xH
 YuGMg9pRFZZ1U/v1jxtizISojmWEzcPV7kX2f57GjwJcBXeXVTlLGRhKC+ajOP+mYyB8nLiRTk7
 ab4eXckfuT07CtQXC46ARGu1cr1MGDAjdPwU+W7SvKmlIF9zEReG1fOHOdemY4Ad93TanSbZ3zZ
 kxugozO7jRYbM8UlweubniC1ZW6KOl1TW35DIZ3qPDxRToZKMykKuCIgjqQq+tH0gpM+OuwKA5x
 ZwvJRjiZdQTJk6u5keiCKTIa5GlSTRv2r7lXvH+O6hWboN3QpKq/QunGvf6T9AutxAGyWNmk3MY
 bxbu/S0ILt3BoGTmA3w==
X-Proofpoint-GUID: V6IYytL_Hp2JYzZUDxMm4hc_6D3Y3tfw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX5I+lU6B0VT0c
 bdqEcaL+9QeF+ZLDgViPSKJDcIjroB/YH7Wu/LhqNgEkI/EJcqCQaIGTmft8m7RZsQEAgejcjBi
 lroHQudXYYV3ouca6jkl7Gfistkg4kw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Implement hal_ops for QCN9575. Add Wi-Fi 8 HAL operation callbacks in
wifi8/hal.c covering source and destination SRNG hardware
initialization, CE destination setup, and CE descriptor programming.
Wire hal_qcn9575_ops into the QCN9575 hardware-version map entry in
wifi8/hal_qcn9575.c. Add Wi-Fi 8 CE and CE status descriptor layout
definitions in wifi8/hal_desc.h.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h              |   7 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |   7 -
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 411 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 157 ++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h   |  88 +++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    |  81 ++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    |   2 +
 7 files changed, 746 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 343e1636b4cc..4b0fbd6f4aea 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -58,6 +58,13 @@ struct ath12k_base;
 
 #define HAL_SHADOW_NUM_REGS_MAX	40
 
+/* calculate the register address from bar0 of shadow register x */
+#define HAL_SHADOW_BASE_ADDR			0x000008fc
+#define HAL_HP_OFFSET_IN_REG_START		1
+#define HAL_OFFSET_FROM_HP_TO_TP		4
+
+#define HAL_SHADOW_REG(x) (HAL_SHADOW_BASE_ADDR + (4 * (x)))
+
 #define HAL_WBM_IDLE_SCATTER_BUF_SIZE_MAX	32704
 /* TODO: Check with hw team on the supported scatter buf size */
 #define HAL_WBM_IDLE_SCATTER_NEXT_PTR_SIZE	8
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
index 3d9386198893..19e02bb16ff2 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
@@ -14,13 +14,6 @@
 #include "hal_rx.h"
 #include "hal_rx_desc.h"
 
-/* calculate the register address from bar0 of shadow register x */
-#define HAL_SHADOW_BASE_ADDR			0x000008fc
-#define HAL_SHADOW_NUM_REGS			40
-#define HAL_HP_OFFSET_IN_REG_START		1
-#define HAL_OFFSET_FROM_HP_TO_TP		4
-
-#define HAL_SHADOW_REG(x) (HAL_SHADOW_BASE_ADDR + (4 * (x)))
 #define HAL_REO_QDESC_MAX_PEERID		8191
 
 /* WCSS Relative address */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.c b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
index 1afc6fc21d0f..fb5402119ad6 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
@@ -2,14 +2,17 @@
 /*
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
+#include "../debug.h"
 #include "../hal.h"
 #include "../hif.h"
 #include "hal.h"
+#include "hal_desc.h"
 #include "hal_qcn9575.h"
 
 static const struct ath12k_hw_version_map ath12k_wifi8_hw_ver_map[] = {
 	[ATH12K_HW_QCN9575_HW20] = {
 		.hw_regs = &qcn9575_regs,
+		.hal_ops = &hal_qcn9575_ops,
 	},
 };
 
@@ -20,4 +23,412 @@ void ath12k_wifi8_hal_init(struct ath12k_base *ab)
 	memset(hal, 0, sizeof(*hal));
 
 	hal->regs = ath12k_wifi8_hw_ver_map[ab->hw_rev].hw_regs;
+	hal->ops = ath12k_wifi8_hw_ver_map[ab->hw_rev].hal_ops;
+}
+
+static unsigned int ath12k_wifi8_hal_reo1_ring_id_offset(struct ath12k_hal *hal)
+{
+	return HAL_REO1_RING_ID(hal) - HAL_REO1_RING_BASE_LSB(hal);
+}
+
+static unsigned
+int ath12k_wifi8_hal_reo1_ring_msi1_base_lsb_offset(struct ath12k_hal *hal)
+{
+	return HAL_REO1_RING_MSI1_BASE_LSB(hal) - HAL_REO1_RING_BASE_LSB(hal);
+}
+
+static unsigned
+int ath12k_wifi8_hal_reo1_ring_msi1_base_msb_offset(struct ath12k_hal *hal)
+{
+	return HAL_REO1_RING_MSI1_BASE_MSB(hal) - HAL_REO1_RING_BASE_LSB(hal);
+}
+
+static unsigned int ath12k_wifi8_hal_reo1_ring_msi1_data_offset(struct ath12k_hal *hal)
+{
+	return HAL_REO1_RING_MSI1_DATA(hal) - HAL_REO1_RING_BASE_LSB(hal);
+}
+
+static unsigned int ath12k_wifi8_hal_reo1_ring_base_msb_offset(struct ath12k_hal *hal)
+{
+	return HAL_REO1_RING_BASE_MSB(hal) - HAL_REO1_RING_BASE_LSB(hal);
+}
+
+static unsigned
+int ath12k_wifi8_hal_reo1_ring_producer_int_setup_offset(struct ath12k_hal *hal)
+{
+	return HAL_REO1_RING_PRODUCER_INT_SETUP(hal) - HAL_REO1_RING_BASE_LSB(hal);
+}
+
+static unsigned int ath12k_wifi8_hal_reo1_ring_hp_addr_lsb_offset(struct ath12k_hal *hal)
+{
+	return HAL_REO1_RING_HP_ADDR_LSB(hal) - HAL_REO1_RING_BASE_LSB(hal);
+}
+
+static unsigned int ath12k_wifi8_hal_reo1_ring_hp_addr_msb_offset(struct ath12k_hal *hal)
+{
+	return HAL_REO1_RING_HP_ADDR_MSB(hal) - HAL_REO1_RING_BASE_LSB(hal);
+}
+
+static unsigned int ath12k_wifi8_hal_reo1_ring_misc_offset(struct ath12k_hal *hal)
+{
+	return HAL_REO1_RING_MISC(hal) - HAL_REO1_RING_BASE_LSB(hal);
+}
+
+void ath12k_wifi8_hal_ce_dst_setup(struct ath12k_base *ab,
+				   struct hal_srng *srng, int ring_num)
+{
+	struct hal_srng_config *srng_config = &ab->hal.srng_config[HAL_CE_DST];
+	u32 addr;
+	u32 val;
+
+	addr = HAL_CE_DST_RING_CTRL +
+	       srng_config->reg_start[HAL_SRNG_REG_GRP_R0] +
+	       ring_num * srng_config->reg_size[HAL_SRNG_REG_GRP_R0];
+
+	val = ath12k_hif_read32(ab, addr);
+	val &= ~HAL_CE_DST_R0_DEST_CTRL_MAX_LEN;
+	val |= u32_encode_bits(srng->u.dst_ring.max_buffer_length,
+			       HAL_CE_DST_R0_DEST_CTRL_MAX_LEN);
+	ath12k_hif_write32(ab, addr, val);
+}
+
+void ath12k_wifi8_hal_srng_dst_hw_init(struct ath12k_base *ab,
+				       struct hal_srng *srng)
+{
+	struct ath12k_hal *hal = &ab->hal;
+	u32 reg_base;
+	u64 hp_addr;
+	u32 val;
+
+	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R0];
+
+	if (srng->flags & HAL_SRNG_FLAGS_MSI_INTR) {
+		ath12k_hif_write32(ab, reg_base +
+				   ath12k_wifi8_hal_reo1_ring_msi1_base_lsb_offset(hal),
+				   srng->msi_addr);
+
+		val = u32_encode_bits(((u64)srng->msi_addr >> HAL_ADDR_MSB_REG_SHIFT),
+				      HAL_REO1_RING_MSI1_BASE_MSB_ADDR) |
+				      HAL_REO1_RING_MSI1_BASE_MSB_MSI1_ENABLE;
+		ath12k_hif_write32(ab, reg_base +
+				   ath12k_wifi8_hal_reo1_ring_msi1_base_msb_offset(hal),
+				   val);
+
+		ath12k_hif_write32(ab,
+				   reg_base +
+				   ath12k_wifi8_hal_reo1_ring_msi1_data_offset(hal),
+				   srng->msi_data);
+	}
+
+	ath12k_hif_write32(ab, reg_base, srng->ring_base_paddr);
+
+	val = u32_encode_bits(((u64)srng->ring_base_paddr >> HAL_ADDR_MSB_REG_SHIFT),
+			      HAL_REO1_RING_BASE_MSB_RING_BASE_ADDR_MSB) |
+	      u32_encode_bits((srng->entry_size * srng->num_entries),
+			      HAL_REO1_RING_BASE_MSB_RING_SIZE);
+	ath12k_hif_write32(ab, reg_base + ath12k_wifi8_hal_reo1_ring_base_msb_offset(hal),
+			   val);
+
+	val = u32_encode_bits(srng->ring_id, HAL_REO1_RING_ID_RING_ID) |
+	      u32_encode_bits(srng->entry_size, HAL_REO1_RING_ID_ENTRY_SIZE);
+	ath12k_hif_write32(ab, reg_base + ath12k_wifi8_hal_reo1_ring_id_offset(hal), val);
+
+	/* interrupt setup */
+	val = u32_encode_bits((srng->intr_timer_thres_us >> 3),
+			      HAL_REO1_RING_PRDR_INT_SETUP_INTR_TMR_THOLD);
+
+	val |= u32_encode_bits((srng->intr_batch_cntr_thres_entries * srng->entry_size),
+				HAL_REO1_RING_PRDR_INT_SETUP_BATCH_COUNTER_THOLD);
+
+	ath12k_hif_write32(ab,
+			   reg_base +
+			   ath12k_wifi8_hal_reo1_ring_producer_int_setup_offset(hal),
+			   val);
+
+	hp_addr = hal->rdp.paddr +
+		  ((unsigned long)srng->u.dst_ring.hp_addr -
+		   (unsigned long)hal->rdp.vaddr);
+	ath12k_hif_write32(ab, reg_base +
+			   ath12k_wifi8_hal_reo1_ring_hp_addr_lsb_offset(hal),
+			   hp_addr & HAL_ADDR_LSB_REG_MASK);
+	ath12k_hif_write32(ab, reg_base +
+			   ath12k_wifi8_hal_reo1_ring_hp_addr_msb_offset(hal),
+			   hp_addr >> HAL_ADDR_MSB_REG_SHIFT);
+
+	/* Initialize head and tail pointers to indicate ring is empty */
+	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R2];
+	ath12k_hif_write32(ab, reg_base, 0);
+	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_TP_OFFSET, 0);
+	*srng->u.dst_ring.hp_addr = 0;
+
+	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R0];
+	val = 0;
+	if (srng->flags & HAL_SRNG_FLAGS_DATA_TLV_SWAP)
+		val |= HAL_REO1_RING_MISC_DATA_TLV_SWAP;
+	if (srng->flags & HAL_SRNG_FLAGS_RING_PTR_SWAP)
+		val |= HAL_REO1_RING_MISC_HOST_FW_SWAP;
+	if (srng->flags & HAL_SRNG_FLAGS_MSI_SWAP)
+		val |= HAL_REO1_RING_MISC_MSI_SWAP;
+	val |= HAL_REO1_RING_MISC_SRNG_ENABLE;
+	val |= HAL_REO1_RING_MISC_RING_ID_DISABLE;
+	val |= HAL_REO1_RING_MISC_LOOPCNT_DISABLE;
+
+	ath12k_hif_write32(ab, reg_base + ath12k_wifi8_hal_reo1_ring_misc_offset(hal),
+			   val);
+}
+
+void ath12k_wifi8_hal_srng_src_hw_init(struct ath12k_base *ab,
+				       struct hal_srng *srng)
+{
+	struct ath12k_hal *hal = &ab->hal;
+	u32 reg_base;
+	u64 tp_addr;
+	u32 val;
+
+	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R0];
+
+	if (srng->flags & HAL_SRNG_FLAGS_MSI_INTR) {
+		ath12k_hif_write32(ab, reg_base +
+				   HAL_TCL1_RING_MSI1_BASE_LSB_OFFSET(hal),
+				   srng->msi_addr);
+
+		val = u32_encode_bits(((u64)srng->msi_addr >> HAL_ADDR_MSB_REG_SHIFT),
+				      HAL_TCL1_RING_MSI1_BASE_MSB_ADDR) |
+				      HAL_TCL1_RING_MSI1_BASE_MSB_MSI1_ENABLE;
+		ath12k_hif_write32(ab, reg_base +
+				       HAL_TCL1_RING_MSI1_BASE_MSB_OFFSET(hal),
+				   val);
+
+		ath12k_hif_write32(ab, reg_base +
+				       HAL_TCL1_RING_MSI1_DATA_OFFSET(hal),
+				   srng->msi_data);
+	}
+
+	ath12k_hif_write32(ab, reg_base, srng->ring_base_paddr);
+
+	val = u32_encode_bits(((u64)srng->ring_base_paddr >> HAL_ADDR_MSB_REG_SHIFT),
+			      HAL_TCL1_RING_BASE_MSB_RING_BASE_ADDR_MSB) |
+	      u32_encode_bits((srng->entry_size * srng->num_entries),
+			      HAL_TCL1_RING_BASE_MSB_RING_SIZE);
+	ath12k_hif_write32(ab, reg_base + HAL_TCL1_RING_BASE_MSB_OFFSET(hal), val);
+
+	val = u32_encode_bits(srng->entry_size, HAL_REO1_RING_ID_ENTRY_SIZE);
+	ath12k_hif_write32(ab, reg_base + HAL_TCL1_RING_ID_OFFSET(hal), val);
+
+	val = u32_encode_bits(srng->intr_timer_thres_us,
+			      HAL_TCL1_RING_CONSR_INT_SETUP_IX0_INTR_TMR_THOLD);
+
+	val |= u32_encode_bits((srng->intr_batch_cntr_thres_entries * srng->entry_size),
+			       HAL_TCL1_RING_CONSR_INT_SETUP_IX0_BATCH_COUNTER_THOLD);
+
+	ath12k_hif_write32(ab,
+			   reg_base + HAL_TCL1_RING_CONSR_INT_SETUP_IX0_OFFSET(hal),
+			   val);
+
+	val = 0;
+	if (srng->flags & HAL_SRNG_FLAGS_LOW_THRESH_INTR_EN) {
+		val |= u32_encode_bits(srng->u.src_ring.low_threshold,
+				       HAL_TCL1_RING_CONSR_INT_SETUP_IX1_LOW_THOLD);
+	}
+	ath12k_hif_write32(ab,
+			   reg_base + HAL_TCL1_RING_CONSR_INT_SETUP_IX1_OFFSET(hal),
+			   val);
+
+	if (srng->ring_id != HAL_SRNG_RING_ID_WBM_IDLE_LINK) {
+		tp_addr = hal->rdp.paddr +
+			  ((unsigned long)srng->u.src_ring.tp_addr -
+			   (unsigned long)hal->rdp.vaddr);
+		ath12k_hif_write32(ab,
+				   reg_base + HAL_TCL1_RING_TP_ADDR_LSB_OFFSET(hal),
+				   tp_addr & HAL_ADDR_LSB_REG_MASK);
+		ath12k_hif_write32(ab,
+				   reg_base + HAL_TCL1_RING_TP_ADDR_MSB_OFFSET(hal),
+				   tp_addr >> HAL_ADDR_MSB_REG_SHIFT);
+	}
+
+	/* Initialize head and tail pointers to indicate ring is empty */
+	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R2];
+	ath12k_hif_write32(ab, reg_base, 0);
+	ath12k_hif_write32(ab, reg_base + HAL_TCL1_RING_TP_OFFSET, 0);
+	*srng->u.src_ring.tp_addr = 0;
+
+	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R0];
+	val = 0;
+	if (srng->flags & HAL_SRNG_FLAGS_DATA_TLV_SWAP)
+		val |= HAL_TCL1_RING_MISC_DATA_TLV_SWAP;
+	if (srng->flags & HAL_SRNG_FLAGS_RING_PTR_SWAP)
+		val |= HAL_TCL1_RING_MISC_HOST_FW_SWAP;
+	if (srng->flags & HAL_SRNG_FLAGS_MSI_SWAP)
+		val |= HAL_TCL1_RING_MISC_MSI_SWAP;
+
+	/* Loop count is not used for SRC rings */
+	val |= HAL_TCL1_RING_MISC_MSI_LOOPCNT_DISABLE;
+	val |= HAL_TCL1_RING_MISC_MSI_RING_ID_DISABLE;
+	val |= HAL_TCL1_RING_MISC_SRNG_ENABLE;
+
+	/* descriptor/head_ptr is from/to host DDR */
+	val |= HAL_TCL1_RING_MISC_TRANSACTION_TYPE;
+
+	ath12k_hif_write32(ab, reg_base + HAL_TCL1_RING_MISC_OFFSET(hal), val);
+}
+
+void ath12k_wifi8_hal_set_umac_srng_ptr_addr(struct ath12k_base *ab,
+					     struct hal_srng *srng)
+{
+	u32 reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R2];
+
+	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
+		if (!ab->hw_params->supports_shadow_regs) {
+			srng->u.src_ring.hp_addr =
+				(u32 *)((unsigned long)ab->mem + reg_base);
+		} else {
+			ath12k_dbg(ab, ATH12K_DBG_HAL,
+				   "hal reg_base 0x%x shadow 0x%lx\n",
+				   reg_base,
+				   (unsigned long)srng->u.src_ring.hp_addr -
+				   (unsigned long)ab->mem);
+		}
+	} else {
+		if (!ab->hw_params->supports_shadow_regs) {
+			srng->u.dst_ring.tp_addr =
+				(u32 *)((unsigned long)ab->mem + reg_base +
+						HAL_REO1_RING_TP_OFFSET);
+		} else {
+			ath12k_dbg(ab, ATH12K_DBG_HAL,
+				   "target_reg 0x%x shadow 0x%lx\n",
+				   reg_base + HAL_REO1_RING_TP_OFFSET,
+				   (unsigned long)srng->u.dst_ring.tp_addr -
+				   (unsigned long)ab->mem);
+		}
+	}
+}
+
+int ath12k_wifi8_hal_srng_get_ring_id(struct ath12k_hal *hal,
+				      enum hal_ring_type type,
+				      int ring_num, int mac_id)
+{
+	struct hal_srng_config *srng_config = &hal->srng_config[type];
+	int ring_id;
+
+	if (ring_num >= srng_config->max_rings) {
+		dev_warn(hal->dev, "invalid ring number: %d\n", ring_num);
+		return -EINVAL;
+	}
+
+	ring_id = srng_config->start_ring_id + ring_num;
+	if (srng_config->mac_type == ATH12K_HAL_SRNG_PMAC)
+		ring_id += mac_id * HAL_SRNG_RINGS_PER_PMAC;
+
+	if (WARN_ON(ring_id >= HAL_SRNG_RING_ID_MAX))
+		return -EINVAL;
+
+	return ring_id;
+}
+
+static
+void ath12k_wifi8_hal_srng_update_hp_tp_addr(struct ath12k_base *ab,
+					     int shadow_cfg_idx,
+					     enum hal_ring_type ring_type,
+					     int ring_num)
+{
+	struct hal_srng *srng;
+	struct ath12k_hal *hal = &ab->hal;
+	int ring_id;
+	struct hal_srng_config *srng_config = &hal->srng_config[ring_type];
+
+	ring_id = ath12k_wifi8_hal_srng_get_ring_id(hal, ring_type, ring_num,
+						    0);
+	if (ring_id < 0)
+		return;
+
+	srng = &hal->srng_list[ring_id];
+
+	if (srng_config->ring_dir == HAL_SRNG_DIR_DST)
+		srng->u.dst_ring.tp_addr = (u32 *)(HAL_SHADOW_REG(shadow_cfg_idx) +
+						   (unsigned long)ab->mem);
+	else
+		srng->u.src_ring.hp_addr = (u32 *)(HAL_SHADOW_REG(shadow_cfg_idx) +
+						   (unsigned long)ab->mem);
+}
+
+u32 ath12k_wifi8_hal_ce_get_desc_size(enum hal_ce_desc type)
+{
+	switch (type) {
+	case HAL_CE_DESC_SRC:
+		return sizeof(struct hal_ce_srng_src_desc);
+	case HAL_CE_DESC_DST:
+		return sizeof(struct hal_ce_srng_dest_desc);
+	case HAL_CE_DESC_DST_STATUS:
+		return sizeof(struct hal_ce_srng_dst_status_desc);
+	}
+
+	return 0;
+}
+
+int ath12k_wifi8_hal_srng_update_shadow_config(struct ath12k_base *ab,
+					       enum hal_ring_type ring_type,
+					       int ring_num)
+{
+	struct ath12k_hal *hal = &ab->hal;
+	struct hal_srng_config *srng_config = &hal->srng_config[ring_type];
+	int shadow_cfg_idx = hal->num_shadow_reg_configured;
+	u32 target_reg;
+
+	if (shadow_cfg_idx >= HAL_SHADOW_NUM_REGS_MAX)
+		return -EINVAL;
+
+	hal->num_shadow_reg_configured++;
+
+	target_reg = srng_config->reg_start[HAL_HP_OFFSET_IN_REG_START];
+	target_reg += srng_config->reg_size[HAL_HP_OFFSET_IN_REG_START] *
+		ring_num;
+
+	/* For destination ring, shadow the TP */
+	if (srng_config->ring_dir == HAL_SRNG_DIR_DST)
+		target_reg += HAL_OFFSET_FROM_HP_TO_TP;
+
+	hal->shadow_reg_addr[shadow_cfg_idx] = target_reg;
+
+	/* update hp/tp addr to hal structure*/
+	ath12k_wifi8_hal_srng_update_hp_tp_addr(ab, shadow_cfg_idx, ring_type,
+						ring_num);
+
+	ath12k_dbg(ab, ATH12K_DBG_HAL,
+		   "target_reg %x, shadow reg 0x%x shadow_idx 0x%x, ring_type %d, ring num %d\n",
+		   target_reg, HAL_SHADOW_REG(shadow_cfg_idx), shadow_cfg_idx,
+		   ring_type, ring_num);
+
+	return 0;
+}
+
+void ath12k_wifi8_hal_ce_src_set_desc(struct hal_ce_srng_src_desc *desc,
+				      dma_addr_t paddr,
+				      u32 len, u32 id, u8 byte_swap_data)
+{
+	desc->buffer_addr_low = cpu_to_le32(paddr & HAL_ADDR_LSB_REG_MASK);
+	desc->info0 = le16_encode_bits(((u64)paddr >> HAL_ADDR_MSB_REG_SHIFT),
+				       HAL_CE_SRC_DESC_INFO0_ADDR_HI) |
+		      le16_encode_bits(byte_swap_data,
+				       HAL_CE_SRC_DESC_INFO0_BYTE_SWAP) |
+		      le16_encode_bits(0, HAL_CE_SRC_DESC_INFO0_GATHER);
+	desc->length = cpu_to_le16(len);
+	desc->fw_metadata = cpu_to_le16(id);
+}
+
+void ath12k_wifi8_hal_ce_dst_set_desc(struct hal_ce_srng_dest_desc *desc,
+				      dma_addr_t paddr)
+{
+	desc->buffer_addr_low = cpu_to_le32(paddr & HAL_ADDR_LSB_REG_MASK);
+	desc->info0 = le16_encode_bits(((u64)paddr >> HAL_ADDR_MSB_REG_SHIFT),
+				       HAL_CE_DEST_DESC_INFO0_ADDR_HI);
+}
+
+u32 ath12k_wifi8_hal_ce_dst_status_get_length(struct hal_ce_srng_dst_status_desc *desc)
+{
+	u32 len;
+
+	len = le16_to_cpu(READ_ONCE(desc->length));
+	desc->length = 0;
+
+	return len;
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
index 311fc5b8015c..c99521abdcb3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -7,7 +7,164 @@
 #define ATH12K_WIFI8_HAL_H
 
 #include "../core.h"
+#include "../hal.h"
+#include "hal_desc.h"
+
+/* WCSS Relative address */
+#define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) \
+	((hal)->regs->umac_ce0_src_reg_base)
+#define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) \
+	((hal)->regs->umac_ce0_dest_reg_base)
+#define HAL_SEQ_WCSS_UMAC_CE1_SRC_REG(hal) \
+	((hal)->regs->umac_ce1_src_reg_base)
+#define HAL_SEQ_WCSS_UMAC_CE1_DST_REG(hal) \
+	((hal)->regs->umac_ce1_dest_reg_base)
+
+#define HAL_TCL1_RING_BASE_LSB(hal) \
+	((hal)->regs->tcl1_ring_base_lsb)
+#define HAL_TCL1_RING_BASE_MSB(hal) \
+	((hal)->regs->tcl1_ring_base_msb)
+#define HAL_TCL1_RING_ID(hal)		((hal)->regs->tcl1_ring_id)
+#define HAL_TCL1_RING_MISC(hal) \
+	((hal)->regs->tcl1_ring_misc)
+#define HAL_TCL1_RING_TP_ADDR_LSB(hal) \
+	((hal)->regs->tcl1_ring_tp_addr_lsb)
+#define HAL_TCL1_RING_TP_ADDR_MSB(hal) \
+	((hal)->regs->tcl1_ring_tp_addr_msb)
+#define HAL_TCL1_RING_CONSUMER_INT_SETUP_IX0(hal) \
+	((hal)->regs->tcl1_ring_consumer_int_setup_ix0)
+#define HAL_TCL1_RING_CONSUMER_INT_SETUP_IX1(hal) \
+	((hal)->regs->tcl1_ring_consumer_int_setup_ix1)
+#define HAL_TCL1_RING_MSI1_BASE_LSB(hal) \
+	((hal)->regs->tcl1_ring_msi1_base_lsb)
+#define HAL_TCL1_RING_MSI1_BASE_MSB(hal) \
+	((hal)->regs->tcl1_ring_msi1_base_msb)
+#define HAL_TCL1_RING_MSI1_DATA(hal) \
+	((hal)->regs->tcl1_ring_msi1_data)
+
+#define HAL_TCL1_RING_MSI1_BASE_LSB_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
+	(HAL_TCL1_RING_MSI1_BASE_LSB(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
+#define HAL_TCL1_RING_MSI1_BASE_MSB_OFFSET(hal)	({ typeof(hal) _hal = (hal); \
+	(HAL_TCL1_RING_MSI1_BASE_MSB(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
+#define HAL_TCL1_RING_MSI1_DATA_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
+	(HAL_TCL1_RING_MSI1_DATA(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
+#define HAL_TCL1_RING_BASE_MSB_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
+	(HAL_TCL1_RING_BASE_MSB(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
+#define HAL_TCL1_RING_ID_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
+	(HAL_TCL1_RING_ID(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
+#define HAL_TCL1_RING_CONSR_INT_SETUP_IX0_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
+	(HAL_TCL1_RING_CONSUMER_INT_SETUP_IX0(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
+#define HAL_TCL1_RING_CONSR_INT_SETUP_IX1_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
+	(HAL_TCL1_RING_CONSUMER_INT_SETUP_IX1(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
+#define HAL_TCL1_RING_TP_ADDR_LSB_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
+	(HAL_TCL1_RING_TP_ADDR_LSB(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
+#define HAL_TCL1_RING_TP_ADDR_MSB_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
+	(HAL_TCL1_RING_TP_ADDR_MSB(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
+#define HAL_TCL1_RING_MISC_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
+	(HAL_TCL1_RING_MISC(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
+
+/* SW2TCL(x) R2 ring pointers (head/tail) address */
+#define HAL_TCL1_RING_HP			0x00004000
+#define HAL_TCL1_RING_TP			0x00004004
+
+#define HAL_TCL1_RING_TP_OFFSET (HAL_TCL1_RING_TP - HAL_TCL1_RING_HP)
+
+/* REO2SW(x) R0 ring configuration address */
+#define HAL_REO1_RING_BASE_LSB(hal)	((hal)->regs->reo1_ring_base_lsb)
+#define HAL_REO1_RING_BASE_MSB(hal)	((hal)->regs->reo1_ring_base_msb)
+#define HAL_REO1_RING_ID(hal)		((hal)->regs->reo1_ring_id)
+#define HAL_REO1_RING_MISC(hal)		((hal)->regs->reo1_ring_misc)
+#define HAL_REO1_RING_HP_ADDR_LSB(hal)	((hal)->regs->reo1_ring_hp_addr_lsb)
+#define HAL_REO1_RING_HP_ADDR_MSB(hal)	((hal)->regs->reo1_ring_hp_addr_msb)
+#define HAL_REO1_RING_PRODUCER_INT_SETUP(hal) \
+	((hal)->regs->reo1_ring_producer_int_setup)
+#define HAL_REO1_RING_MSI1_BASE_LSB(hal)	\
+	((hal)->regs->reo1_ring_msi1_base_lsb)
+#define HAL_REO1_RING_MSI1_BASE_MSB(hal)	\
+	((hal)->regs->reo1_ring_msi1_base_msb)
+#define HAL_REO1_RING_MSI1_DATA(hal)	((hal)->regs->reo1_ring_msi1_data)
+
+/* REO2SW(x) R2 ring pointers (head/tail) address */
+#define HAL_REO1_RING_HP			0x00003078
+#define HAL_REO1_RING_TP			0x0000307c
+
+#define HAL_REO1_RING_TP_OFFSET			(HAL_REO1_RING_TP - HAL_REO1_RING_HP)
+
+/* CE ring R0 address */
+#define HAL_CE_DST_RING_BASE_LSB		0x00000000
+#define HAL_CE_DST_STATUS_RING_BASE_LSB		0x00000058
+#define HAL_CE_DST_RING_CTRL			0x000000b0
+
+/* CE ring R2 address */
+#define HAL_CE_DST_RING_HP			0x00000400
+#define HAL_CE_DST_STATUS_RING_HP		0x00000408
+
+/* TCL ring field mask and offset */
+#define HAL_TCL1_RING_BASE_MSB_RING_SIZE		GENMASK(27, 8)
+#define HAL_TCL1_RING_BASE_MSB_RING_BASE_ADDR_MSB	GENMASK(7, 0)
+#define HAL_TCL1_RING_MISC_MSI_RING_ID_DISABLE		BIT(0)
+#define HAL_TCL1_RING_MISC_MSI_LOOPCNT_DISABLE		BIT(1)
+#define HAL_TCL1_RING_MISC_MSI_SWAP			BIT(3)
+#define HAL_TCL1_RING_MISC_HOST_FW_SWAP			BIT(4)
+#define HAL_TCL1_RING_MISC_DATA_TLV_SWAP		BIT(5)
+#define HAL_TCL1_RING_MISC_SRNG_ENABLE			BIT(6)
+#define HAL_TCL1_RING_MISC_TRANSACTION_TYPE		BIT(22)
+#define HAL_TCL1_RING_CONSR_INT_SETUP_IX0_INTR_TMR_THOLD   GENMASK(31, 16)
+#define HAL_TCL1_RING_CONSR_INT_SETUP_IX0_BATCH_COUNTER_THOLD GENMASK(14, 0)
+#define HAL_TCL1_RING_CONSR_INT_SETUP_IX1_LOW_THOLD	GENMASK(15, 0)
+#define HAL_TCL1_RING_MSI1_BASE_MSB_MSI1_ENABLE		BIT(8)
+#define HAL_TCL1_RING_MSI1_BASE_MSB_ADDR		GENMASK(7, 0)
+
+/* REO ring field mask and offset */
+#define HAL_REO1_RING_BASE_MSB_RING_SIZE		GENMASK(27, 8)
+#define HAL_REO1_RING_BASE_MSB_RING_BASE_ADDR_MSB	GENMASK(7, 0)
+#define HAL_REO1_RING_ID_RING_ID			GENMASK(15, 8)
+#define HAL_REO1_RING_ID_ENTRY_SIZE			GENMASK(7, 0)
+#define HAL_REO1_RING_MISC_MSI_SWAP			BIT(3)
+#define HAL_REO1_RING_MISC_HOST_FW_SWAP			BIT(4)
+#define HAL_REO1_RING_MISC_DATA_TLV_SWAP		BIT(5)
+#define HAL_REO1_RING_MISC_SRNG_ENABLE			BIT(6)
+#define HAL_REO1_RING_MISC_RING_ID_DISABLE		BIT(0)
+#define HAL_REO1_RING_MISC_LOOPCNT_DISABLE		BIT(1)
+#define HAL_REO1_RING_PRDR_INT_SETUP_INTR_TMR_THOLD	GENMASK(31, 16)
+#define HAL_REO1_RING_PRDR_INT_SETUP_BATCH_COUNTER_THOLD GENMASK(14, 0)
+#define HAL_REO1_RING_MSI1_BASE_MSB_MSI1_ENABLE		BIT(8)
+#define HAL_REO1_RING_MSI1_BASE_MSB_ADDR		GENMASK(7, 0)
+
+/* CE ring bit field mask and shift */
+#define HAL_CE_DST_R0_DEST_CTRL_MAX_LEN			GENMASK(15, 0)
+
+#define HAL_ADDR_LSB_REG_MASK				0xffffffff
+
+#define HAL_ADDR_MSB_REG_SHIFT				32
+
+/* CE ring max size */
+#define HAL_CE_SRC_RING_BASE_MSB_RING_SIZE		0x0000ffff
+#define HAL_CE_DST_RING_BASE_MSB_RING_SIZE		0x0000ffff
+#define HAL_CE_DST_STATUS_RING_BASE_MSB_RING_SIZE	0x0000ffff
 
 void ath12k_wifi8_hal_init(struct ath12k_base *ab);
+void ath12k_wifi8_hal_ce_dst_setup(struct ath12k_base *ab,
+				   struct hal_srng *srng, int ring_num);
+void ath12k_wifi8_hal_srng_dst_hw_init(struct ath12k_base *ab,
+				       struct hal_srng *srng);
+void ath12k_wifi8_hal_srng_src_hw_init(struct ath12k_base *ab,
+				       struct hal_srng *srng);
+void ath12k_wifi8_hal_set_umac_srng_ptr_addr(struct ath12k_base *ab,
+					     struct hal_srng *srng);
+int ath12k_wifi8_hal_srng_update_shadow_config(struct ath12k_base *ab,
+					       enum hal_ring_type ring_type,
+					       int ring_num);
+int ath12k_wifi8_hal_srng_get_ring_id(struct ath12k_hal *hal,
+				      enum hal_ring_type type,
+				      int ring_num, int mac_id);
+u32 ath12k_wifi8_hal_ce_get_desc_size(enum hal_ce_desc type);
+void ath12k_wifi8_hal_ce_src_set_desc(struct hal_ce_srng_src_desc *desc,
+				      dma_addr_t paddr,
+				      u32 len, u32 id, u8 byte_swap_data);
+void ath12k_wifi8_hal_ce_dst_set_desc(struct hal_ce_srng_dest_desc *desc,
+				      dma_addr_t paddr);
+u32
+ath12k_wifi8_hal_ce_dst_status_get_length(struct hal_ce_srng_dst_status_desc *desc);
 
 #endif /* ATH12K_WIFI8_HAL_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h
new file mode 100644
index 000000000000..4bb73687ea65
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_DESC_H
+#define ATH12K_WIFI8_HAL_DESC_H
+
+#include "../core.h"
+
+#define HAL_CE_SRC_DESC_INFO0_ADDR_HI		GENMASK(7, 0)
+#define HAL_CE_SRC_DESC_INFO0_BYTE_SWAP		BIT(9)
+#define HAL_CE_SRC_DESC_INFO0_GATHER		BIT(11)
+
+/*
+ * hal_ce_srng_src_desc
+ *
+ * buffer_addr_low
+ *		LSB 32 bits of the 40 Bit Pointer to the source buffer
+ *
+ * info0
+ *		addr_hi: MSB 8 bits of the 40 Bit Pointer to the source buffer
+ *		byte_swap: Treats source memory organization as big-endian.
+ *			   For each dword read (4 bytes), the byte 0 is swapped
+ *			   with byte 3 and byte 1 is swapped with byte 2.
+ *		gather: Enables gather of multiple copy engine source
+ *			descriptors to one destination.
+ *
+ * length
+ *		Length of the buffer in units of octets of the current
+ *		descriptor
+ *
+ * fw_metadata
+ *		Meta data used by firmware
+ */
+struct hal_ce_srng_src_desc {
+	__le32 buffer_addr_low;
+	__le16 info0; /* %HAL_CE_SRC_DESC_INFO0_ */
+	__le16 length;
+	__le16 fw_metadata;
+	__le16 rsvd0;
+	__le32 rsvd1;
+} __packed;
+
+#define HAL_CE_DEST_DESC_INFO0_ADDR_HI		GENMASK(7, 0)
+
+/*
+ * hal_ce_srng_dest_desc
+ *
+ * buffer_addr_low
+ *		LSB 32 bits of the 40 Bit Pointer to the destination buffer
+ *
+ * info0
+ *		addr_hi: MSB 8 bits of the 40 Bit Pointer to the destination
+ *			 buffer
+ */
+struct hal_ce_srng_dest_desc {
+	__le32 buffer_addr_low;
+	__le16 info0; /* %HAL_CE_DEST_DESC_INFO0_ */
+	__le16 rsvd0;
+} __packed;
+
+/*
+ * hal_ce_srng_dst_status_desc
+ *
+ * length
+ *		Sum of all the Lengths of the source descriptor in the
+ *		gather chain
+ *
+ * toeplitz_hash0
+ *		32 LS bits of 64 bit Toeplitz LFSR hash result
+ *
+ * toeplitz_hash1
+ *		32 MS bits of 64 bit Toeplitz LFSR hash result
+ *
+ * fw_metadata
+ *		Meta data used by firmware
+ */
+struct hal_ce_srng_dst_status_desc {
+	__le16 rsvd0;
+	__le16 length;
+	__le32 toeplitz_hash0;
+	__le32 toeplitz_hash1;
+	__le16 fw_metadata;
+	__le16 rsvd1;
+} __packed;
+
+#endif /* ATH12K_WIFI8_HAL_DESC_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
index 56d45785ecd4..076a5a609f8b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -2,8 +2,37 @@
 /*
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
+#include "hal.h"
+#include "hal_desc.h"
 #include "hal_qcn9575.h"
 
+static const struct hal_srng_config hw_srng_config_template[] = {
+	[HAL_CE_SRC] = {
+		.start_ring_id = HAL_SRNG_RING_ID_CE0_SRC,
+		.max_rings = 16,
+		.entry_size = sizeof(struct hal_ce_srng_src_desc) >> 2,
+		.mac_type = ATH12K_HAL_SRNG_UMAC,
+		.ring_dir = HAL_SRNG_DIR_SRC,
+		.max_size = HAL_CE_SRC_RING_BASE_MSB_RING_SIZE,
+	},
+	[HAL_CE_DST] = {
+		.start_ring_id = HAL_SRNG_RING_ID_CE0_DST,
+		.max_rings = 16,
+		.entry_size = sizeof(struct hal_ce_srng_dest_desc) >> 2,
+		.mac_type = ATH12K_HAL_SRNG_UMAC,
+		.ring_dir = HAL_SRNG_DIR_SRC,
+		.max_size = HAL_CE_DST_RING_BASE_MSB_RING_SIZE,
+	},
+	[HAL_CE_DST_STATUS] = {
+		.start_ring_id = HAL_SRNG_RING_ID_CE0_DST_STATUS,
+		.max_rings = 16,
+		.entry_size = sizeof(struct hal_ce_srng_dst_status_desc) >> 2,
+		.mac_type = ATH12K_HAL_SRNG_UMAC,
+		.ring_dir = HAL_SRNG_DIR_DST,
+		.max_size = HAL_CE_DST_STATUS_RING_BASE_MSB_RING_SIZE,
+	},
+};
+
 const struct ath12k_hw_regs qcn9575_regs = {
 	/* SW2TCL(x) R0 ring configuration address */
 	.tcl1_ring_id = 0x00001604,
@@ -40,3 +69,55 @@ const struct ath12k_hw_regs qcn9575_regs = {
 
 	.qrtr_node_id = 0x01e03300,
 };
+
+static int ath12k_hal_srng_create_config_qcn9575(struct ath12k_hal *hal)
+{
+	struct hal_srng_config *s;
+
+	hal->srng_config = kmemdup(hw_srng_config_template,
+				   sizeof(hw_srng_config_template),
+				   GFP_KERNEL);
+	if (!hal->srng_config)
+		return -ENOMEM;
+
+	s = &hal->srng_config[HAL_CE_SRC];
+	s->reg_start[0] = HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) + HAL_CE_DST_RING_BASE_LSB;
+	s->reg_start[1] = HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) + HAL_CE_DST_RING_HP;
+	s->reg_size[0] = HAL_SEQ_WCSS_UMAC_CE1_SRC_REG(hal) -
+		HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal);
+	s->reg_size[1] = HAL_SEQ_WCSS_UMAC_CE1_SRC_REG(hal) -
+		HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal);
+
+	s = &hal->srng_config[HAL_CE_DST];
+	s->reg_start[0] = HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) + HAL_CE_DST_RING_BASE_LSB;
+	s->reg_start[1] = HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) + HAL_CE_DST_RING_HP;
+	s->reg_size[0] = HAL_SEQ_WCSS_UMAC_CE1_DST_REG(hal) -
+		HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal);
+	s->reg_size[1] = HAL_SEQ_WCSS_UMAC_CE1_DST_REG(hal) -
+		HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal);
+
+	s = &hal->srng_config[HAL_CE_DST_STATUS];
+	s->reg_start[0] = HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) +
+		HAL_CE_DST_STATUS_RING_BASE_LSB;
+	s->reg_start[1] = HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) + HAL_CE_DST_STATUS_RING_HP;
+	s->reg_size[0] = HAL_SEQ_WCSS_UMAC_CE1_DST_REG(hal) -
+		HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal);
+	s->reg_size[1] = HAL_SEQ_WCSS_UMAC_CE1_DST_REG(hal) -
+		HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal);
+
+	return 0;
+}
+
+const struct hal_ops hal_qcn9575_ops = {
+	.create_srng_config = ath12k_hal_srng_create_config_qcn9575,
+	.ce_dst_setup = ath12k_wifi8_hal_ce_dst_setup,
+	.srng_src_hw_init = ath12k_wifi8_hal_srng_src_hw_init,
+	.srng_dst_hw_init = ath12k_wifi8_hal_srng_dst_hw_init,
+	.set_umac_srng_ptr_addr = ath12k_wifi8_hal_set_umac_srng_ptr_addr,
+	.srng_update_shadow_config = ath12k_wifi8_hal_srng_update_shadow_config,
+	.srng_get_ring_id = ath12k_wifi8_hal_srng_get_ring_id,
+	.ce_get_desc_size = ath12k_wifi8_hal_ce_get_desc_size,
+	.ce_src_set_desc = ath12k_wifi8_hal_ce_src_set_desc,
+	.ce_dst_set_desc = ath12k_wifi8_hal_ce_dst_set_desc,
+	.ce_dst_status_get_length = ath12k_wifi8_hal_ce_dst_status_get_length,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
index e2dd68ebd82f..5e10843962c1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
@@ -7,7 +7,9 @@
 #define ATH12K_WIFI8_HAL_QCN9575_H
 
 #include "../hal.h"
+#include "hal.h"
 
+extern const struct hal_ops hal_qcn9575_ops;
 extern const struct ath12k_hw_regs qcn9575_regs;
 
 #endif /* ATH12K_WIFI8_HAL_QCN9575_H */

-- 
2.34.1

