Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472373;
	b=BVdUVovvpnj4QpXGlKiQDKmulVhcZSv4FGa/27M4HJVUkFvVeWYRSHd3ewKC/Xmy0Lm6
	 gnV2IMj6f3PNAP7Ua7btISfaaYqkURcdEYNHi2ge45aUAfynWyacfxx2ifygEW4qfNEUF
	 UKlHblKy3MIDYFYijRlTMD8Rvg06O1sQr8FAnN41m6U13mz/inXnM2msMW+ldkxtq5N9N
	 VZDy4tZZyqAUtAh+QAqFjcZwoYfhYPJwwUGIzD1Y4nPIM89VmIF09G5M6RcELbTO7GaQH
	 j8k0Ntm2+kjprAcsVtW0xHfCapNEY+goIPL33MKPS0e67ps2b9cNMJRNI4Mr5gnqyqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472373;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=GJ+YNQZcXC4u3bmbehzYq57svEohid9Qbe/IKU7gswHV2ZHgPBgcUyQo43SPR7a2gHgR
	 Qs72bH2BGnynOYU5KHwWeQNIUq+hf8EcLgtqD0WtfuzJNRLA2PtdlfxMR0PpwQevSJHV8
	 TyoL9w3XJeryDpDqvKm40OP+Vf7jpEMrLI74Oydlj0dWEnTqX7RLc/tlMb7//JP8R2cI5
	 NIByTFC0aRxnSAf4dPQSah/O7jLf7itcugjA4Qp8svmntj2Q/fU7e2GM/KSccMKiOW8L3
	 +l95kmvqNIIANf9kePsik+j+zsp39qvtNBH2XSSQad4RYXsHpTCA62Oc0E64/7zDRRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UY1mprCa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iLAopL5a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76050606B709
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76050606B709
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UY1mprCa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iLAopL5a
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zfwu4149469
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=UY1mprCalcSCyaMg
	MmkNtghlBAC0H6EiCe6XvvllNqmTib3KbZm9udLxwwIKi473iAeZmCO4NbKVBY8J
	2nDvywiAotO5zhBeUFWdpag7pZeUttW9/qsCyd1SE7nV7erVjhtJ2Li6HFQpc8CQ
	99rg4kAo0xDPHs3Xh12jSSaAkPxQJYb46l5CHLVtiDsUWFgDd3kylGzYV1TDH688
	sPLUe+PsICH27xpQZl7JGizW7J5ZKyR/n5QLTkR86tOQmcn3rpiHv5Ec/ucNcROj
	nhB1iLLxYlVO+qKXc0J+54Az4Qu9uodyKQMLQzYwuxusREkSNQQBrWqpdX+tYMog
	5ZFPcQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62j1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:32:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so7076555a91.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472371; x=1795077171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=iLAopL5aqh7mzFd3D4JtKs5qsZsACT7O9nAlKxzUifS6muGYpTwO6/cBkhMWG6b+g8
         mJ+h+r+E3ebeXAgIVH/kLIw/31/ma9c8WohmunJXfoNSNVGI395eAPcb4vGYeH7sHng6
         y9LHF9uGeS+8E16X4SmyuQQpnoM3syXmWGaw7CVL3qb1vG6eHnoH09ltbDEcuIyBqSub
         Eusb56trNU1xjxStdvl3oBQZZe6YG+JmzQMmXjq3NimlnWrVex+SVKLjWEqiWgKSwntK
         AwtCCgahVCo/2pR7fN+5mEqgrdAGR9yIg2jfgNEdhSLq0qZ5bSvxDHyj4sfCTTagnKgs
         P6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472371; x=1795077171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=ejDqJNJreu+2cndo2ay1qLq5ya/2HavpMeLtEwnaPIOZQPpCvGAYO+48qe1f8kA/Eg
         nsZnfBU0SOf4oDCym6qgLIT1JeATXdaZbZ6a3zwtWqv9+xBk1iQgipZ3bu4OhAycm204
         tg3y+JlO20XEE1ztBhi0gCnVtuLPmJl2gJGOibS+lthEyREfhRGerWVqw/DG9vCb/K4z
         8EiLxAMuKm8Ug/IlcjT09RtEZgXopmT9e8ACbWK9vnMZN9f+Av26tQDzgf7OthjtJ8O6
         ZTOvpKjFNw28y+JKTeIGIYnjQfnprKXv5vEEL46BuHakLHxo99yjp20J1u3qBQyNa/A7
         rN8A==
X-Forwarded-Encrypted: i=1; AL+hErEhPwMn4rVopeAEjvIgtY4gyUxYHsZU4an0vJlib+78Lo7gzU8aApTRMgiuEgL7d0Fnugwf/wzr9cEl@vger.kernel.org
X-Gm-Message-State: APuU4Z/S2mMfv17hijVGzX3Cxrs/dxlZlJoEA2BQ+Qx3OPBGAHlU+dsf
	MNzkUlFPRIPOzazoOVO9OsVZudb3+PHC9TEzYPTLJFBx1ygN0uw8HCD0CHT4tnQ8U5IZEwU2Ic/
	GNaqZk0878NwZVxY/obwy2WjLEWEl6LfdIRlBLb8+JakeDd9ZlR6tNw3jlACTOcQwqkjvS1dU
X-Gm-Gg: AYBFou1jUlrZYxu1N9LJiSfMlewSh3KcNZwi+k+IsG1fGbOxpQ4SH9mASh0tGI7yiZS
	BF4/sYh7ykXTJdfwQkocxT1z1epxL+2rXv2UHVe6Aar3RBMf5Wma50vlKarSfGYlbnhYDGu2Jl1
	Y4pNSreafZ41Qr8OEHnLXVxZ+G93GIScgd0UmtBn1jgeVjivJb2yF5rcV/da2N02kanrKGlkZf/
	8/E2hauupZpBr2lpm8yoGvHNje2uwtpDimiGkM0dvFugW2j+okBevpmV8IU5NLycpEHazIBPdo+
	adbKNAkXYXB2QVj/b0isYh2CYVc4IIeEqjusiOkaJ8iJk/Q2mCaoVB1az5QCj4v0q3FKvnJIZfv
	/1oYWGWIV68OrwVLfQvg/zR0xXJEvIrz9LiILO2DejdymMaOvkVEAtoo9Sy8AY+GGr93UkYS2Cm
	xySFE8u3fMba7JbEuUpJ2+q8x1KnHGQvEq7i5HK1S2E/J1eiG/Sd07CuuYDiSpgGnpIwgPzvu43
	A==
X-Received: by 2002:a17:90b:2d08:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b182f26e76mr5031308a91.49.1794472371415;
        Thu, 12 Nov 2026 00:32:51 -0800 (PST)
X-Received: by 2002:a17:90b:2d08:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b182f26e76mr5031273a91.49.1794472370879;
        Thu, 12 Nov 2026 00:32:50 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:50 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:19 +0530
Subject: [PATCH ath-next 05/15] wifi: ath12k: add Wi-Fi 8 directory and
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-5-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: t0pnML5FvdfH1PzBKRd3Fe4AlSqyNiiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXw9gFcDrEG8fc
 5EcOpWecQU/46hpf8lYZcG8JT6OvbUr66ouxINl/CEhlYqygnYnsmlolAYGFykA+iGEslhjvtmP
 kNPu/x0NkaVpowfiymF11ljec79Xnd4fLtIFkN69Y7JoVXWu0DjvlXoKEkHsRPaoAaN0htMT9ez
 Q1LwNL83aV19qH+93mMHzoxY9wqabtxa/4afbz/cq+pInJZ95Teg3M3w3XoB6++LnGhJSMKiU41
 UUC97bm6Btus0PMQHFIfTKTwYqZsWJeog0SXy0fl0SNpp8kbPlTvHa4LwH6T3x4weNxOrrdOyDN
 gj7ERYUXpFmKgFqJ5l9Gecl8gFjAfBvS/CKGqHG1b0tr5klyAvG4JbGuFf7S4mk0WztOxNTg19K
 cSKjimyfs+gNVKxh7fAQjdT6NjfxcTGVHywSFze9pvnSfWAj1UvFVb5grKuwB5f2uQICvRnB1VC
 LC9oinjCLR6mw0a5TUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX0+B4GXNN7euT
 XUcPtHlYTsV1VHSeAv66+LsrDd+NQVjzVd4LhDVliJa8RuzVctMJkJ+vJAlnTsl0GGzc9lXCdQa
 uHPFFTdh4Zb0e+UBqiaUGhUrg/ci9cw=
X-Proofpoint-GUID: t0pnML5FvdfH1PzBKRd3Fe4AlSqyNiiF
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af579b4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

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

