Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989770;
	b=nQAuFQ1PTvgTOmtXr+TZwJCHRjfX9OVDlfoVYD8/yORLQkeCHPvUw9A6mIokgRPVrkkj
	 CV2VKbroVK9PyIsWWO5sXt9J5cBFSr66LOYijbFcrJ86LkgPxeM2UNbSotq3GzeOApjhl
	 HbLboNu/pR011jVjqlLp9BliW4A+8v8dGsw8pHH5E2YtkJ8Gq4MUjJ2N/oHl/dNuwgZdQ
	 2jycb9cuCvFq9PBCMml7cXyJ0TUfJPL6M6OGE3Hub8L2pF7LOxNMvdQgKIhrGKPRUlD27
	 qp4ZxcY+jq6xVq91qaxp/u8SPV9VMSuk1CubLWD14ADP0NC3aQl6OrTacNbZZd03uHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
	b=oPHcOfKKnCA9hJKSlBvaV6RwMlxYkKT3Lw/ClzfwuGbgxUGD65rFYY8XC4146bhCVKwg
	 gZNal63kaz0/p2TReprsE/gj+IF21AdAYNIfOicsbpCwINtHTcicMRlaCW8M2i5E0I9LD
	 JXfZAufmgm8KSVJamHmCDNCJUUTCH7sFzXfarI0kY9D+kcPMIuO6uTX7RkN7TRMHCoN5U
	 9VqrNZLGQXxaE9aykWjSGmu/wzlCX6/3OHt7GHbgANwECtfr+qa0o5mR8HDaT+TZl9j7U
	 esnv9IV+ba+HuQrreJ/vIb5NYb1c+PRLwAFVn4nvhm3uEGGWUuWHoXI0ZrRv56e8LgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=df2Hh12N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPdmcSkA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD310606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD310606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=df2Hh12N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPdmcSkA
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UqVc2383039
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=df2Hh12Ny8Y3ZqkU
	lxQZg614F+GVnvHNFFvmArm16i23mPHJvwS+xaFvwBCRTLRdIUJAHlZSYr9xvjcE
	LUhysQkB97EAE/5Qar98MINSM5hqV+PKHJ2Nj3OCcC8vEgbCQjfw69kCpr61DaZq
	doMTzoOb80V1so6CsOIOBPY56Megzkww03MrxEO/qBfWUW+IREu4xXikWpqm7VES
	Cf7cLd1zQnUqfGojrDNr1mc3bYqFq1M09bO3UjiXXXAxHW6ygg0Z10b0tSuVsMnR
	rcDMMVGl5EBGDMBWbtDX20Vt1g08D5wY1u1jqDev/CtjjMCf+/tu7p4uQTFHrMy4
	sNSw1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvat0pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so621331a91.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989768; x=1795594568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=KPdmcSkA8ZOFe9IdbPXol/Ty25K3DjrPu7Mtrrx0ydC3Ho0BgPe1zh2yHr4JKfozeN
         IWRxmqKxwg4KTZhrSZL38EHfTFz5nDn2nGGShQVnQiXTUBQX7NAxFNiECuvhxhWa/ZUp
         WC5vorbT9BhyzwGA/W8hQ2Tka49y1IJ1qsI0DON2QXSGpYL4GrTrmzG9lPoSzuEqiljZ
         +grnI77ZcGzYVh7p69E4e/SBLut9X5zusqeuNCqITezodPrecMPcFVO3rU/EY8VF0n4b
         d7vQiV6nvtgYnrKLNvfuVe8y2QmSbaU2+2objMSKPcAdVHfqYoeaBamQ8KALGfs1yLpt
         KOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989768; x=1795594568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=inNZ9NxtGME44btCRG4ggi5uiS73R1U5qMTuIhX8cb2B9208esSpjNJIGfbOasAyzy
         0t7HxIlgfea3eIGt3OyNHsBlbMiVtIca9tHt9ZD/8am05uLfpiW9CV7vZpiqAIUceqDH
         JfTqwDv+YqSBEvBray2N+aruOx9Wfa4SZQEhsORjBlNgAJzojBBjuX96Gl0nF4/jEe1Z
         pOMiINjOCZ96aqHAeKOsTvhDe7WKwhqvDpFqvTWPJ0ZN2A03fmJH/RUKIE+Hyq4WtBuq
         SuAwFCjCx35Csn5i/1ANWJB+mx29v8N1gqjv7PtfmlknFHXoNQc0FIYe3PVgEHqvsPou
         MedA==
X-Forwarded-Encrypted: i=1; AL+hErF1f/5WduVHmfhVV13vTuFS0S2lAHG9VY1BLoQlHL6iugp+kZ8xtyiaho6DuDF+GV8s+Btq1t8J66vK@vger.kernel.org
X-Gm-Message-State: APuU4Z8H/ByaGJIknSf0SVKGqUCQcBmN/7n6+sm/C9eB9MErrfa3OAMK
	pFxgWYEI+sauh3hGC3yVPAn7GXMQRIjJZpSyBYwfMhasXD3c0aWYiW/aDvTejk1ufG+cnU/PujC
	XG14LwjbBgf/JilzcUjo7pZgbgc6SqRISU0WiBYymaWSpkydN6iPHEwL56JVjM2zP
X-Gm-Gg: AZFdTZc0XjI5pgpWgKYufvqYDt64aVz6+IPsVwFe0pzfXlPejIMz5O3jm1QBFXNCAVw
	0ZtYcftJqTiTzTbziDoMzyZpnAv8qz627964uwZQvV3BQprUeosqXwOFoOJZk5G7GG970r+5s5a
	yPu2wszGjmxjM2CHxPofwkfnik68WcjvYutLi0v6MU0ezutQOGu2nfixoH9V8xEuneznItzeU51
	bim83KvxVJiYXUkQzN7PkxhvpF9UtXajF/DMYZV9A8gh39CsLtXeu92b3BMO4qM3p1t6x2+7Flc
	yveMxbN3DCw0mbuTegVD5t9q0FL/NMPS3Cs8rzbpzrpBf6EfVBvoCjR30gNBmYS7mkxzc3HxU60
	5qA+fOV9JZBL2izAaiaUGg4p0bFzxNjjK1v0TEukqS2BBhH0ZGz7/hJS5/w48TYWGD8XsvZcBkh
	J6yyXUargNcFX9oyjyzjJlZlfpEwU6nhWNh67KWXJtuEedhBFVhbsoCazmsmu/PqYYTGL6reVxZ
	w==
X-Received: by 2002:a17:90b:39a3:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3b3d07a29camr1893092a91.38.1794989768254;
        Wed, 18 Nov 2026 00:16:08 -0800 (PST)
X-Received: by 2002:a17:90b:39a3:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3b3d07a29camr1893060a91.38.1794989767716;
        Wed, 18 Nov 2026 00:16:07 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:07 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:30 +0530
Subject: [PATCH ath-next v3 07/15] wifi: ath12k: add Wi-Fi 8 HAL register
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-7-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd5ec9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=k5nCMmGC1qFvne7xG5UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: h4Xwuo5DouIoz-q3LRYAy5yOu89P_2c9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX1ZdHywnwHAE7
 HiT6EoXF6sntLchjVmKPXhIhotzlzNsOP42Uoy+MfBQsUTs6bJUybm/BKB31AyFXqa3MLQfhv71
 DMXDJMa9DGoRrd3ZpBycqf5cDoNQC8G4gjadsnX1Dx9/cIuAPDB4RMD8bMyzjIbnx0pKQO3RYvD
 bp4D6TrEOB071UFEjXqxhYnIFQKLmBKcRf8sYuUq0xPpAgp0+kCf4Y30ncy4tT8/gFIH3+k+dlH
 iL8zELmKq8xpF6BxhuVw7qK+OtAndLuyDjyAc6xvkgTzpIY5ZEvytpD96Y/WcSzKLY4D+766koH
 CxnAyvxhSmopjqZbEipmGy4H5k075Mtqi9aiqshbHfSKuDXgsadA8I35iRjOfnUSZTB6UQvRSip
 nx/0SP+yc39j/puQ+GZIiDeOSMQRxb2YVeCO/LZIsA7b2d4LADQ++tbkW8MvvK92TC3E/B05Thk
 X4ZSN0+ucOJM+Nv7v5Q==
X-Proofpoint-ORIG-GUID: h4Xwuo5DouIoz-q3LRYAy5yOu89P_2c9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX1EjtXWXCMsJa
 r93WAeVZM1kyXVE0EP7bEIdwoUnBN2TFYIeaI/9yWx4X0W2S3UjOGF1f+hpDh6nI+fK67LJPS7n
 BkNxFKQhH7UJSZ6y0HyMAJAYkxgDNU0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

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

