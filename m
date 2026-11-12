Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472385;
	b=XP86GosdxyTHyMU2Vwx1P66Gsc8UjaVO9BcfEW6OW70XAZc1CcUMy8YopR5xg2NY08kp
	 OHhMyd+DRXiDUNzqFqtpKKId5rNbqu8ELdyawlUPw2XVJg44tl2W4i6MCGXZBmQR7re4e
	 Mfb7t6KNtIZJ9Ra0mo67BoHX715uE5OQYiw4OxXD1sAWGBfEOjyWp9Oznf9/imI20skR7
	 YXctt0jmP5JLK+iKpDjolAFO54tGpl0q7wAhhJLa2Ex0EY/pUjv4hZrDsNAMXbk8p9ol9
	 29F0/SuhOoFQaVyXWLDqsRNTA/NUkOF2UuwA6Nsvuf/lJBjCqUvR5LCP2PfBK0g11uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
	b=DxsgwCdATgGQGzggZDsaZjy4vbBWrOy1cpj31REPQBN4I3/BiP9rYvPhntym37g3sWQm
	 P+/IcaT5geSLjlKYOfcIjmUl3oGhOVfOn+41iJ7767HTPcK8K13GlfCjKn25ZozATXpyB
	 h617c/KZFjz+eHAuwgQxS1dANOpm0XkRy9bdB2YnJmvgj904O7O88iLjcmiMmA1x7p3eW
	 EjcMDay1vYL5n7wizsDk2fpdCNmBd2ZVF/0RSY+BPjv4X346Qw7F7qVD3Z6KPmV5uBfqi
	 utKhVCOisNSGeDlEAMWWryuMQEknnyUYcpzroClQnKS2bHaFcXYsJRUaLdViLL8Z4PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EBLvJdlc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hru4glXq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C4560A5BCB
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C4560A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EBLvJdlc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hru4glXq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZhYR3813251
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=EBLvJdlcif5PJ7S2
	HDNYvyDAzk78Q58mjRvxbW5EQunW5vGKQuWwjY0GN0ZpMWmz3U/OgvKSXkXa3+kw
	KLEjxSlK8Mu1cJHeF25V5+TIxgmpatU0gE2/0TXjzFlCfh8olqGu0gn6ldVA3DCE
	J7CSbEktQcP3ljEfpJxPJB26PQS5D5pL0q5w7a/s5zhSIGy690RhT/VKLW58kSLY
	BP3CtwkDhgWlItwlbLyb9fHM5yLL7ioemJGz1IVKqUJDMaqnZkynFB02UBw6JW1o
	a86Sn+f3iFDDz7HX5bZnIHZxnWhrEmSyecCtunWcNMmEprxKbUS6791rB2/DNekO
	fXLUjg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0jy7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:33:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd65070d3feso408777a12.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472382; x=1795077182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=Hru4glXqU7Yv1LacmClSWs1xVawwpNK8fgsdAHGg51SAXiA2xfea6+xYcc/Z+fx+Fq
         s0tLvj+VrI3XkWLhzniai8VX7PSKr3+dyKP7yCXjlAD9LeR/V0+bSmYVsjBoYOjSx54E
         8owOV/MIOAX3rrreaUThasCrdsNocQqxg8gBtvCB7BVaD0IyVC6qL5d0nxiRA2ETFhpA
         myT5bPilF/PtGGmbdCPXDAh2XuW3VxKxId2Yg11OlptaBflD5Qj1d2YxF74whFmNtH4B
         8e5ksWNpx7i+UXjtTj78d3d7UUzp9xE7C/yWZr1Z3rd2NBVm3fDMHge7EP+w5R5yslbK
         eEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472382; x=1795077182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=SF43rYQQQMb2+8chS6hOPIWv02tyEvSQByiIrDlzzFvO0ztwmOmxFqj+1xATwJj3z8
         hGJYd1OEDKRihBXR9WUGsr1asaUw4UbCt5ro2tkiqi/CZvCviFYOJc3rfD1W/wUJvWUV
         n+vqwsqUNnxxYLHBghHn5mhhSCz84MCUeenXh3o9Tk61mh6WenYHfYI0iXO6s+UXKiPD
         RSvJC2JQCYTB/yu4cUtPrGjTly9+idmlktSxUK/4RwXp6TVyIi3jhMbo7ShKOJ0WXcxS
         bbbDbmKtG3jJDKFHQ7JItCrxl5vURzA9i7vk8q/bQvd1lmfRpBbS8llj7v4wb8AAlqMm
         kH8Q==
X-Forwarded-Encrypted: i=1; AL+hErEMT9ggx6I/shnAGqiualUBUl0Wt7pt17GQFixEyjY6NxNaC4LbFmtrluVBXBHiSX8WeczLlLUwhb+P@vger.kernel.org
X-Gm-Message-State: APuU4Z84iWBkfFCCVYgjO64L0wRSAmU6CmpSH4xr8tlRGxpKtO7YNbq3
	43v+++pbhaKXT7Y/Dkzrxxf0pN24ZattO6WZe+MX9nf0voAVNz/g2lCJXXYZNRHA/z59ime4Ow6
	ZPpP44o4Q23S2+nly2DLpfQVLXpVx0IplpngFXRv0PchxJ8mifm2uQoNwRwvH82Ep
X-Gm-Gg: AYBFou0Wk7/e0NAK1A4KhjOizEVac4807E6301gXAnZ9ang3vTuauvxFeCvj1rgBzel
	rH58seiOg7haAbOXRpiKaLT6ee7F1tLmmgUkCXR4rToO/vIDiQB1D2I/ARI3/+WmgkgwCRD+Ik4
	MzzBXIrthABZkTgZsUxqiI3iRV8p1EBHO5gS2JVlo3IHGLMt7EpNfHzzezyAY1x2CvaauYU9h+6
	IT1WPguk8z6Zhc+PszZuiVBWzLAsc2c0hrJumcdL5C8hX7ITbmEWhwOy0EGSkUi4+g7M+Yz939z
	Pq3gTpO7KCejWuP6krQTbH5+iLg/d2PEPXsCTHrV6TJzTtRoxnN82ruJvLg4YQcfjv/WcrOQlfh
	xlUK3kQREtaXJ7m0WWqwL5wMZKsvLVsfo0TTTHW8Zz+y9vmmvc0J0v0m7NqoLsN476fXwyWL8Da
	7YloymdfCRA/2hvL85bHQ5+lQM5Bih7qw9ahlOX0jvqcXf09/L3PMRFJmuMU9yepJb0OKaRmIcv
	Q==
X-Received: by 2002:a17:90b:540f:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b197caa480mr1248044a91.21.1794472382261;
        Thu, 12 Nov 2026 00:33:02 -0800 (PST)
X-Received: by 2002:a17:90b:540f:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b197caa480mr1248026a91.21.1794472381784;
        Thu, 12 Nov 2026 00:33:01 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:01 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:21 +0530
Subject: [PATCH ath-next 07/15] wifi: ath12k: add Wi-Fi 8 HAL register
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-7-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-GUID: UXGozAwgXlXSPps7lu7GBrIfURr9OGhH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX/CcSsFCfw93T
 8PycbwXInq0Km570wsml0Kt2KrWWHLjzPt2F+n8UCPOUauNrb2vxHlb4hiGSKLD5Hbt7cLiicVy
 VkaorZ7S6BA9mSNcAe3g1N6c0jxA9FBdf6OKc4l7WlYyWVQ7C/wE3vcZOywLiUqFFYKcNSkakuB
 a8bib97SOyZJZJwTi+n3ht5eWSQnOwrXu6QFi72EpM+7J+NrbJv3M1o4fTNnG8JYz5GHucSboF8
 HWjxSLca+UvgM3tQdNlCSVWoi6IkmuzIwqwP4GH2Y11Zc/kRTEIrNh4HtHx3+c0cQDlqA7/ciVF
 ESboiq8H0bexbIeUOfXTDnenhZ/d+46rSFNeiWcamXLWiey22X2KOU23AmpwG2TKCjz6CP02Ru/
 jB+ZYlB6t0tpeUF+NZAwTZ+06B0/1pWLxVo7D/Vzt6TpUSPmmnNUf6Nj0hEjjvNIS/SwwW/knnr
 wu5srLkj6IlfY3CfYRA==
X-Proofpoint-ORIG-GUID: UXGozAwgXlXSPps7lu7GBrIfURr9OGhH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX60IZ8J8tw55+
 Xf2n69ZVwmmEMJF+RvTCAMEqbeR05XKUIOiXu4iPUJiLlnP6ZXMkK5gqgAsTWqFJ69WdixxXqPV
 xcOMAy95XpwOPl6OypFhpKQgBK/GK1o=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af579bf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=k5nCMmGC1qFvne7xG5UA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

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

