Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989760;
	b=gQuHFNxcfj/OisYtGOSLATACmzFDgYvsO4lJ6tTs6AwNLroumkj94rzpW/SMEqNGj9JO
	 NDFbzOiOv+GulgDQwLKCiD3y0TXOLTx/1cramr9BFoxUMlLuYIzZxHANNOLHJsg3htgBy
	 W5tgu6jJ3tJSvIXJ7quFCMkfwl1/+3B4qTDlxIvcUIOCkBkCsTYw5NYsq5FrWhjZ91T7F
	 MY4AqS4tu3Qiu73SEVCwIH3sMICUnIaRrY1w85UB3f+yhXAM/WmvkWrNIp7dYlrZ2W3f5
	 bQNmj+wSup8E50MPqvJAEQlZvib50IfeIagt5jyFAG+c28O5GEPxvrudFKuvQDSmA/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=KCNlFEuyCkOYKdi6k5Xjr+hb5Pwgo9kCnLAkupw3zFFhCf1tPdU0T/6DYbL9RjXDanpn
	 CfXdn/X4rXr4WLd1kdLtDP0SXqaceaBx6qA0mhMxJqwh9EiqFuIC/tY5kGnaXkCxfJc+X
	 IMnaDThJ/KoqGTUe+jMbYyRDYczfZgfYHJAgwS0LcFJZmllec/R8qelLZB4nfmJ/p+a10
	 uOef+1WT5vKdNzLblpkWf6KigAEWIJ1KxolNdapIdUwKGuUJCTxdRJzCHMYgOyarSRaM+
	 wVbk66Av2A8nbtpUF1W149ez3YJtQ2EGqnYhWbxQB45YJyMxgNzbvgABY17zbHCIfTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kdvNyEWi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d7/buKu+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F4F606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F4F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kdvNyEWi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7/buKu+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmcX3371238
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=kdvNyEWi/U/p+6+M
	V6KYr8FfRVflyAMRZndqMoFsRh9Jb8IFHGO59POUAAQ+AQwXw0v27Y6M/BPxQciv
	kHEFNWT6V0FJAS0w7vrHuwjU22dwrmR5A+08r+ajss/Uisw3zqqm1/DaqdoeXraX
	67fpFcYFyIHz4wu3H2SZ0rJgybsXhIHbDDBfEMrAy+Bc1mbWmr9gS9FhuEGY2kA/
	p1hjkNdRCVmxHXztf672tTfCt4c5Yf/1NeJzGtQIbqcrBAtyJ8upjxzn1vB4bUfk
	jOSvqAbWINAvTR3xXdw7EgS7VW4Wb5j27Ve+9pMAdgVt+1Ga5hm6mToY0gDn0kxy
	ihwaLg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sygf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:15:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3a9ee822fso949022a91.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989758; x=1795594558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=d7/buKu+2TLWfIRFAah+Zm7YsSCh9xZ/HkrrTI49vqzofgLjXQ9TgbV2ocW0lRbWpn
         Ohz7lyYHxmqjTWQCPsNryiLLW7QnXjpxrMN4aodx0WHVfV6ctfGCB8pRTnxbQcs18nDL
         jItk2F7lNqYEfpF5RfZUDu3/IgU4M96sppWf3E0AxjqjZmiEoaUenNwIkKXS4Y4NWla6
         F2MUlSPINpOCxm9bZbnL6sGtaR50M2d+DHbedQ8Bls1ZdxTw/yqX9VGYYDNsWRvmFGUW
         SIHkTNP8FC7O5CnfR2ddaBQn06ASYEzfBc7ZvUekV9ev4GjEMhhInIQ6FSsBd5id+pVg
         4qoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989758; x=1795594558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=kot9Y/PLUvW510+u/rttCIIUT7uoKnoTd8fJVWSmjCtA6n7+1r5ba5SACU0KQticwT
         uSEEB4KuVNm6zvv65qxHBeT/QmLUGEfS/3EXBOjLcn60tSE8yWm979+0YGxKOBVM+A5D
         TRHVPo9l0eD5Rf/6JRam0+4EFraMaEwGD+1lwYj8u37BxV+PIZxZIx+dUHI6OyMYNPfJ
         t8srHK4Eg1iYxErR6pi9vkkpRAHHKhvbSO3nFAwtI70r4NlK7gf8dlVm7m6v2KZbXzK7
         +xus/TTZ7osx+bg4QDwcVoNLWm4IWdaLCVsI4lZSKiyKRp90d27prDb0aoJlkPoLFsM0
         QTIw==
X-Forwarded-Encrypted: i=1; AL+hErGamY0zedS/0ooqO+tyAiNfcb6R2L5VAU1b38/ph+1yzefFzZR8VgYvUAMeSSSSktCGSwURhb4YZ62q@vger.kernel.org
X-Gm-Message-State: APuU4Z/HRhxY3rZigVjibM21KerbzzarGjijSIunZ5M0j2gb7m+ysJM0
	keUgtFlHakeMNGPbZq1HpOq47KoavTtw/qOIstlD5tBGbGLI+Bn3QSAkrqEYtQ2y4m5GkBqemYi
	m2qHRsWTbYLXRZMkBnDAANI8k2USr707uwDI1s16vM5eEStY5aHNA/jqWCH6NoybK
X-Gm-Gg: AZFdTZcmGjSU1wtHStEjW/q9CYk9KD39+mLfr7GApJQ8i+99vja2d/OikzC7s7o90Dt
	dKY7uImxc3Vl0mDJQYxDesNJsZYiKZlLW7s8K/kiUhyNvYOB5ngMPtBG0TllThOhHVyS9wwh1oJ
	D3RNpe/NzvH7Gl0p81GxC79cSF8rHKOpQZhTUFlwNQwrTo4cLD398il72kbWay+G9E4WwdNqkNV
	wgH5QZwKVUqw+7Bx13AReoPKssy/bqG6GXvwVlwWNDNmh3BzPg9w+GDlSZ2nLBdYTjbQCJ1WO4T
	QI20IvWTZs0kohqFzGOB/K/ENRRV8onVSYxQHhb+ePEHnAd0EvTetgVpYEpz6ActsmeeQpuKHBL
	28yJaeQDULuKhWh7QLnsKHuwRfBDXIlPfof3WDjY2ayo39lztFxOBBMCbc6h/fn9TmTnCzL5UFo
	UwKndM5kGgV/P7UTWJEHt/0ZQ3uoeK2pmCQIl638oMkvslo6opUJH+AZMTjI96QbmrCb8ttSFN6
	w==
X-Received: by 2002:a17:90b:518c:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3b3d07a24f6mr2014443a91.21.1794989758272;
        Wed, 18 Nov 2026 00:15:58 -0800 (PST)
X-Received: by 2002:a17:90b:518c:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3b3d07a24f6mr2014405a91.21.1794989757579;
        Wed, 18 Nov 2026 00:15:57 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:57 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:28 +0530
Subject: [PATCH ath-next v3 05/15] wifi: ath12k: add Wi-Fi 8 directory and
 base module scaffolding
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-5-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd5ebf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: rMIqAJL7orIfaJj_1M3gkN_NG8GNsp_s
X-Proofpoint-ORIG-GUID: rMIqAJL7orIfaJj_1M3gkN_NG8GNsp_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXzx7NDbRmq5EA
 wKigKpH02v4ABD32x3ZE3cJl+vCX4U3TdP51ng7GicyEtKc3RDvMCzTttzW1TILkH8h0s5mtQ7y
 K0UVfBAGvsRbAsFO/Rq1Xer0h/BmxYkv99B+eljVcoykP0JsS9+UczTwXV6xMysCaih03IEj1XO
 WZRGwFVOBVSTzFJcQ4vH24qv3yM7rFA0gR1haNT94r9vnfkPEilc2EU6grhbMmj2AeJ4v/DlGHA
 UZSIFsX+HLHXJbZ/wL9sXFrtvGc3Hx60vw1iDh+2cOMZ9xBOXcDsGpwbMvr3947CS0xWNdDdbVD
 iQXjzJd4HI72fABXGKiuKM+x6osvcJlj4HfTdl/uSn26YI3gBmeYafxH0bNbnbX6qPQLak7LqZC
 AyE5ZVUFA/GpMM6vgqIuXsKt/RtakxUenuJU82DLHcSWEZKl52LRP6gsm7D90NxpRy3fXKqVZZg
 p+nHFD2LKyRx9gF6MLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX065j2Rw3Tcwq
 J7XtV7cztVodtTn1EsYOv5CEHGV5MFNMsPoZKXaq11Q9qJSCOH20gpY4YvEjfiFxYCTcvclUqVH
 hbVZXDFeEgGBQERqU7FIs16bDOv27R0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180032

QCN9575 is a Wi-Fi 8 target with a distinct hardware family that cannot
share the Wi-Fi 7 module. Add a dedicated wifi8/ subdirectory to host
QCN9575-specific code. Introduce Wi-Fi 8 build rules, base module source
files (wifi8/core.c, wifi8/pci.c, wifi8/pci.h), and add
ATH12K_DEVICE_FAMILY_WIFI8 to ath12k_device_family. Keep Wi-Fi 8 PCI
init/exit as stubs so the module builds cleanly and remains bisect-safe;
actual PCI driver registration and hardware support come in follow-up
patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Makefile       |  1 +
 drivers/net/wireless/ath/ath12k/core.h         |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi8/core.c   | 31 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.c    | 18 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h    | 11 +++++++++
 6 files changed, 66 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 861ec85eebed..332110d72a1d 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -25,6 +25,7 @@ ath12k-y += core.o \
 ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
 
 obj-$(CONFIG_ATH12K) += wifi7/
+obj-$(CONFIG_ATH12K) += wifi8/
 
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
 ath12k-$(CONFIG_ACPI) += acpi.o
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a8e8a55aa718..2a4b5e5e1af3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -956,6 +956,7 @@ struct ath12k_mem_profile_based_param {
 enum ath12k_device_family {
 	ATH12K_DEVICE_FAMILY_START,
 	ATH12K_DEVICE_FAMILY_WIFI7 = ATH12K_DEVICE_FAMILY_START,
+	ATH12K_DEVICE_FAMILY_WIFI8,
 	ATH12K_DEVICE_FAMILY_MAX,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
new file mode 100644
index 000000000000..b8c5b6d3a7bd
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
+ath12k_wifi8-y += core.o \
+		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/core.c b/drivers/net/wireless/ath/ath12k/wifi8/core.c
new file mode 100644
index 000000000000..9253ef9d9cf5
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/core.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include "../pci.h"
+#include "pci.h"
+
+static int ath12k_wifi8_init(void)
+{
+	int ret;
+
+	ret = ath12k_wifi8_pci_init();
+	if (ret)
+		pr_warn("Failed to register ath12k Wi-Fi 8 PCI driver: %d\n",
+			ret);
+
+	return ret;
+}
+
+static void ath12k_wifi8_exit(void)
+{
+	ath12k_wifi8_pci_exit();
+}
+
+module_init(ath12k_wifi8_init);
+module_exit(ath12k_wifi8_exit);
+
+MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11bn WLAN devices");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
new file mode 100644
index 000000000000..3975081d167b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/pci.h>
+
+#include "pci.h"
+
+int ath12k_wifi8_pci_init(void)
+{
+	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	return 0;
+}
+
+void ath12k_wifi8_pci_exit(void)
+{
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.h b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
new file mode 100644
index 000000000000..efe02721e470
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef ATH12K_WIFI8_PCI_H
+#define ATH12K_WIFI8_PCI_H
+
+int ath12k_wifi8_pci_init(void);
+void ath12k_wifi8_pci_exit(void);
+
+#endif /* ATH12K_WIFI8_PCI_H */

-- 
2.34.1

