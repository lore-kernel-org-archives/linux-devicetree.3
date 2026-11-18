Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989797;
	b=ZjiEtqLfiR3eTUwIHEjwnIkYFUYwM8ErJDGRSo6QlR62/Jk8h/WaanSO71+5SYIBOWho
	 PG6wRaXGrf0rqf/WiwoeCNIYIH4tDw/0QXyDcD5o0KN36XqXrETTxcaVzEzGgYdofrz6B
	 KsNFU4sFKtw8j2Xwlprkxc02bN46Cn3YUGLsKBkENeNMNu/aX/M0bMRgu/5KphPh3HSd2
	 BRgNnW6wlmNhGBxMoApcS0fKCVcela7LplKbStl3NRGeh4rylDLpfjQbKBVid855kSoAh
	 y7ly9/IP+fBfcn68xOUFAi8ZA2Y70pmgdLF25kl6mLpXdihlt4x51ABGc0NW+/ytf0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
	b=F+vDJom2t6/Sm43JP6f6uVdKdzlxmu2Y7LR3nhTKoOC5tlAXLokilPMVjFPO3DOwjJnU
	 Y2gL/rH2RBwQmBUkvvHyBsrh8pt3Svk8A5VWylKsKcY2jpfvuCHiixp+56XsYdJA8e9wC
	 Jnj8LPLX3D9PnEYMMIlorabuloP3zaTbHgWKUIM+rJFsyYtZZ9RlgxH5USnPXO1wMAzVA
	 awrsUYqJHT5x+QI0pi7weW0+h1Qhmxa43uPCX2+w579jrl68F0H2tEpBMfiKz0HeBoam9
	 waAz86wY9gQiJx5Rcb2xkLIX7C9hoC1IjhioNV5VJghtBWGjweyaNxfiaDhBpR37V2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NM+xRzUP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d63FKTqs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8A6606A336
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B8A6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NM+xRzUP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d63FKTqs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UuBk2453525
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=NM+xRzUPozTCkio9
	Ga3Or0rnc0N2U8LowpUKl9AV6iCNmh7Jkua+sQSU2SfgCVGJOjeb/6eaxUL8QCsf
	A2Hk5eLWetzmefWWNBPqjHHd2W+Qpr2XqRdP0VV7MzMlurQWshTgzoUKV6SdgZwe
	o4z9P1FxfdiyhS6pmqrAF5ZY7Ny8bz5hp39QnyGwWrRlz9dtXQvRdV8D8B7dsFnL
	q4Wg4QnQof2oyi/wxAGZHQA7w5rkl5+Ih22cXn0y8iJHT2Ub/sj0nPk0Tpa+audW
	ZxwQBBJokqCqdiIJwNafszWCEeTkq3ixs6E4BMQbXq/4MP/8DoAIfHvb9gFMI9dP
	OnWRsw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99ycd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso1563305a91.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989795; x=1795594595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=d63FKTqssSXg69EeD0H8h+2XujWhQRzhy/lSYc1IO4lo7l/uIUjzw/aWhfbwPiQJwo
         44+Idn5wgDM1gdEMfM9BanFVMR6AVPngmjJFeySo+tfsl01XWbAFQNKKZ/o0ieLKl0OE
         +FfjRQL0BOIydCTvkHq3LyrMoxv9vKj4XEJCSq7NiOe9x2B5KXGviu/BVoV2vWy8TV7v
         8yM4zrBaSddngs+yTmxFy8beHn5/1BHYWSjc76zdA6pip0HFOuou9PL+bCn4qWhmJWjR
         bleeCW72MFrXh3ivLuRd7Z+U13wl5fEPaFWo/H4AUMtZMQcIJd7JPCSaOtmTUxfxCHxr
         MeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989795; x=1795594595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=utp87Wjvropsc1NcELOLBw8h+7+ZLuKmgzIp59qZgEHVXEq4H9Fl5Csiem6Fmj+6mf
         Jj7K13t0lCFIyyWFvgJ4SPpmoWp9GWR3H1tXzbv0mbroBQ1RmDlvQpeLldMofLo7P39h
         FRWjoF6nYKf3bfYptun/cJA2cL88ogNuNWVvN3ezyUkZthUjJByEpbNX5lbZEYGBe1LG
         631rCTMAODJ6YLEQWxIufA54VLvtihzGSB+DDFDcg3gaHCqLt887quu4n6sBIGzlJZuu
         FzSQcu3BdYTFE37P02pf9z9RMKy0omMJ776NxP0ZeBxwFXkHrCqh3dYlNpUoV7flErhT
         moBA==
X-Forwarded-Encrypted: i=1; AL+hErEciLRp6cAvmH3VMC9vQ7XnMDeJ970mBrBLTtgg63sQUGW9pdgLYfq3/mZljRFEP0nrad7wf8A67WzM@vger.kernel.org
X-Gm-Message-State: APuU4Z9rLn5xlsXMYDf3i2PAve1Hn0wm9zEuZmT1r25pE+OfjMNdoJ40
	8LlsIGnKzFLMMyu/7JLKHU3wzyLaFdvt7qxsGYW+GEWhSvGB3cuNVjMKRCZdAsyn3YlAzF4DOMo
	KBmcK1M810XDWo9dypWTExS5/nJgdwfVGWdmtgLDhCmMdy3TmBIRJqV5biDmK0Bcn
X-Gm-Gg: AZFdTZf9qaPDL4CXn8yu24upqCjTuRRZ0t5+h80rbyTyzUAQHoh9Ls5JdWeqyaJuR2h
	vKkOjvUxJVFC8BHYrVPVbbCbNv+xTODQ9cyl4gUlRRlLa7uTYkrak25UtH5CngvnF1UczJ0jK0l
	wOYtGAReSNuMYjXldO3iSObAjnX4+0Hu575OTTwN+iCssyx3H6rVJQgTcLjZMOWLTVqsIIW0B59
	cPta8bUKUoPY2CXhkpvvMWsVyQ1W3I98PwrmBwJPzgxYNb5m3Nx+01tuFp22CGv5X/CULNIWK9k
	0FOCpKAwpz9ZX4HAdoYV4H/CmkoYK56UCAp3PiawSGnsPu6zb1UmU7LufkaeCpT2zdeOMxq0Dh2
	7E3zXyhTeljFa1A+WMM7zE+rT43myd4vLeCf8c1Cvw23cDR+4aVkhMd5S4VOd0wTjuCvamqMXJm
	R3LDVoLMOqGQDOsS4mL74X5T8sspViwwYn1yc4BfXs4BlXYEBMWxbTcYEIYUs4WEaRBCMjFwVMu
	Q==
X-Received: by 2002:a17:90a:d2c8:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b3d04c9de8mr1312798a91.0.1794989794281;
        Wed, 18 Nov 2026 00:16:34 -0800 (PST)
X-Received: by 2002:a17:90a:d2c8:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b3d04c9de8mr1312777a91.0.1794989793795;
        Wed, 18 Nov 2026 00:16:33 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:33 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:35 +0530
Subject: [PATCH ath-next v3 12/15] wifi: ath12k: add Wi-Fi 8 WMI init for
 QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-12-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXwpHO/ZVafWom
 pwTggfMGoc+i1Zay4Jn7vGHLmNq9BzBHCtoR42NyoG4CdzHn8tuQ/0js/QHwqOW1M+lypoMRinj
 eG4lHe14CL7OXWhu7Ycuaakz3tqqdqs=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd5ee4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXz1hgvI/qtiHk
 lgVSgcRAgF0Fghl/i8Jpwoo9SX2D3qvtYn17YzzEAICFcRZFikv56h1zdgtHB4RI3Txp1mFGid1
 d2uNHkGL0bvfhR5i3dUa2A4yIF268DjFITluQwvz4zkpzq/gLxY5FfFGV4Etn3Jw9be01YXaNfh
 n/Ybrj02dAoyvvRgYPcOLuyqLrM2MLdM/N38unupjVBxleu7ePWsnc/kqNhN5cnLwc/v6byXgCT
 F+B2EelSUopzst6XgK8XiMYz40UI9fZdaFmL5pK0+z0R7BuEktOqvuPgkCt10gwoIAbVAXiT06B
 mU458tC0F209sduj+gbA+mSX2ff58g7ebRsJrbgjjCc5OeTT25CEdMljF3qQaLIfekVvrOxUO5q
 tLeI1zu+w2tsD1RsZgeHhHWSkUszAesCOO/tKBKCAPub0aHLLPjvn2ssINnlVUzQuTb0zeZA4bz
 otXCXtlPTg026hMaVqQ==
X-Proofpoint-ORIG-GUID: I-xmziLfeSzKzRPlLeHkQNaRdCepZxBu
X-Proofpoint-GUID: I-xmziLfeSzKzRPlLeHkQNaRdCepZxBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Implement the WMI resource configuration for QCN9575.

Add ath12k_wifi8_wmi_init_qcn9575() in wifi8/wmi.c to populate the WMI
resource configuration struct used during firmware initialization, setting
vdev and peer counts, RF TX/RX chain masks, scan and power-save limits, EMA
and TWT parameters, and peer metadata version. Set the QCN9575 hw params
wmi_init pointer to ath12k_wifi8_wmi_init_qcn9575 and build wifi8/wmi.c
from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h           |  2 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c    | 57 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h    | 13 ++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 96776c6e2050..b8045b33ca0d 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -77,6 +77,8 @@
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
 #define TARGET_EMA_MAX_PROFILE_PERIOD	8
+/* host supports peer map v3 and unmap v2 */
+#define TARGET_PEER_MAP_UNMAP_VERSION	0x32
 
 #define ATH12K_HW_DEFAULT_QUEUE		0
 #define ATH12K_HW_MAX_QUEUES		4
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 3717b00741fd..989e640c7b41 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -6,4 +6,5 @@ ath12k_wifi8-y += ce.o \
 		  hal_qcn9575.o \
 		  hw.o \
 		  mhi.o \
-		  pci.o
+		  pci.o \
+		  wmi.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index fa64b865b931..74873fc5f3f3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -16,6 +16,7 @@
 #include "hal.h"
 #include "hw.h"
 #include "mhi.h"
+#include "wmi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -70,7 +71,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 
 		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
-		.wmi_init = NULL,
+		.wmi_init = ath12k_wifi8_wmi_init_qcn9575,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.c b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
new file mode 100644
index 000000000000..c575cae2582d
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../core.h"
+#include "wmi.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config)
+{
+	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS(ab);
+	config->num_peers = ab->num_radios *
+		ath12k_core_get_max_peers_per_radio(ab);
+	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
+	config->num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
+	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
+	config->ast_skid_limit = TARGET_AST_SKID_LIMIT;
+	config->tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
+
+	if (test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags))
+		config->rx_decap_mode = TARGET_DECAP_MODE_RAW;
+	else
+		config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+
+	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
+	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
+	config->num_mcast_groups = TARGET_NUM_MCAST_GROUPS;
+	config->num_mcast_table_elems = TARGET_NUM_MCAST_TABLE_ELEMS;
+	config->mcast2ucast_mode = TARGET_MCAST2UCAST_MODE;
+	config->tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
+	config->num_wds_entries = TARGET_NUM_WDS_ENTRIES;
+	config->dma_burst_size = TARGET_DMA_BURST_SIZE;
+	config->rx_skip_defrag_timeout_dup_detection_check =
+		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
+	config->vow_config = TARGET_VOW_CONFIG;
+	config->gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
+	config->num_msdu_desc = TARGET_NUM_MSDU_DESC;
+	config->beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
+	config->rx_batchmode = TARGET_RX_BATCHMODE;
+	config->peer_map_unmap_version = TARGET_PEER_MAP_UNMAP_VERSION;
+	config->twt_ap_pdev_count = ab->num_radios;
+	config->twt_ap_sta_count = 1000;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
+
+	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1B;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.h b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
new file mode 100644
index 000000000000..a66ede369ba3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_WMI_H
+#define ATH12K_WIFI8_WMI_H
+
+#include "../core.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config);
+#endif

-- 
2.34.1

