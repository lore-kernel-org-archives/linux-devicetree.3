Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538640;
	b=Ln7iDpK99x0YFW6m5u2lOO9XPp7lAcVIhE9whq9xOyKf/wRws9LRTJMtPcWclLgS6hVT
	 ZqGRSAgDSKWjrgcuAfM1ZeMKpMFWD4Ln/+5fZZ+nRdPiR2OvOG2V4bbrghhARpfV0fHu+
	 mXXowRR63OZwFhdaSpQbo/yV9vDdcKcGtsuzZVND2+15L4ODO9M7JJMlUK9e8UYSlB2kP
	 1u91wgvC5SqUSSUhSu6hWI4kBzZKH/tPEa447gHBYdAPzoNdjZS2OtG1vOwcioFjq2ojI
	 bDtls6B7iISdJnEmwUhQLBEXB8DTXj7YdradZl82dSj4sHbpr73wxj0QfmNrTXQdNfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=QJqtC2rgimzZh8VDlfbJvE2mxu+kpauOeBdwyrer6ONHPgzCvpQ0es26WWrsgO2giRcJ
	 DdXRoRSjW1DS7H7D5PH0ozUHM9zW62CujPerUABkw71ixT9DSrDOmmdt6ur893b5swO/o
	 B220+kJ7+FxfwNo8f40hg/f0KmwDyxCY8QP7YARir3pEOBUY0xSVOuVfVtgfXQytfLptj
	 CAxnLIliltuHaaBr/69pxupGsHYXMYlVqWaAvGI++KWWc+8RgBkGLS9aeMyrVXWQl9hV/
	 +eazj7TQJWIDc2KNVoaxmXrQWPjDeRzxtrjkloE5DyW6Wb1HgG/Niy9reepmfmVGgzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWwCqqvm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cryb7+qr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBAD606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBAD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWwCqqvm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cryb7+qr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL0vg699934
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=WWwCqqvm0H/6V+XN
	+5OtzpUE6C6N2ABlGE8AQ+cyjy13MueChABpPBU5MDIhuSCEz5/sJewspvbVuj8R
	PHZzEXZgPaCMjYUqTaBJHAc+lYiyfQ20Ao06hSbgo+GjGrEZclVpmnx4WRDlP6hW
	CfRPpL7DM4IyhjQrfDb+ITeTbz0m93nrtjkYh9/u+mwdb1xPtyCNf6qnchBhM6fa
	vENDM04+KrjgwgzoWeQOkOrXPUIT5gU9LOTQsMdDj8dlfAA+S5W0SOCx8eKL5pPw
	+cN7I+06Umm83CDR427FeUQSCiyLHeOngUP9viWa7qQtme8SLfib+2Z6oXT+54fM
	Th4CPQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f46w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:43:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso8286083eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538638; x=1796143438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=cryb7+qreY4PSXa+C3icUF3rBXoMwrXgBTAx1z2bZ6tBisvXM4XOsTDEU4xPty29An
         fzeAfuOUcd928GRDM2XnL9LxxZ2n7yhzS5KnFg9wdR7zYHYo421AdbSD6F1COhMaFRKh
         bgNyACVznkTn0SJQo0IIHwosFdN6MkvOBywRFrC6JfrcYHP44e2TV0/5ZcMNzjEJNGi7
         p7MNegURZX7NRa7Sgt1oKbPlVxzf6I7UkIbuV4amVJp0a311x0jleACGQUB1Pa7KK6cx
         pRAvGM2B/Ihr5nr+Xj7i7OI8gADaNgZq8UllCCsoVRqxjmcWuliOKTdsu++3lRWEYit9
         lEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538638; x=1796143438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=fXyCcPcnl6GmLXO+MxGVry5itBq9IL26qH9y9S050z/dCnVL6H7rRoCINVFwsyb7Gi
         VuH9XRWRypugmlV/b3oncjJX7u1ElOJ6e0G/ebFew5dn+QUXq7kpx+bcSIevGWIvM80q
         VV9HW1E4hivQnNoUx+mmZwaxR6kgcKQGoeW6GJnIpM455nPJtf7W6+9193ughXm010lm
         eecnjJTkqaOkOIJ4HwwhD9qej9VMGzyTixauM/dETzfuIGNN2u5YOI0+TNgdj/oHVYd5
         8jnbu4G6egQtv0lq+HYapkEruTnyVea1U7oLgjKf7Y4CA+wa4DNfAqsJTq1GCmr2lVYm
         vmmg==
X-Forwarded-Encrypted: i=1; AL+hErGWWVXT0cpUxtdeasd2doIDRbnGwVO+wfWaaVeeCeCwHkvL3Nc2cZpI1k5X20Bj/ta876iXVGeMV+zH@vger.kernel.org
X-Gm-Message-State: APuU4Z+Og+G1lT1dRHIcVRLxxHrhtSfE4z/AJIQT5DsG9Z2smiNh+Eu6
	3qFBVYu+O7lRQcx67hsjyt7VxbpcZ5hSVojyz0z4tcv6fENDss6ODMJ9WSGXR6cXzHAu7xWtZ+m
	MYljo1gx83I1Q6NEkffiw/tLYaipXR2L8hDNZ5FwEy+/KkUfwqvkCnO1B+KGgmAQx
X-Gm-Gg: AZFdTZefwNULp2Uwo576ZcT+f9DOgcLx4dd0IC+i9eY0GFPNvDWfPuEFhT3hvH3fGrg
	X6ozxyqzbmmmX64A5cW4haDaFFzSu4F2bkh7urlq9XUKc7lYO0zduUCz6wodD4LKcX/EFJ840jt
	6Un89EG2QT9MUbGrAJ54MoVimi9Y8RKO4Yk/qmGWd4CX39kRy8JokMVQO4uTcBWQSZg4cKCmKrF
	zBmqKaleXZ8qFkYzqVCQOpR9N+zmNi816gUAKZ+b/CrvTA+Vuj9dh00EDBfuhULrwiWXSZg0DHr
	pi62sN2wl89JCRprgjTdt11qQQwn2YqywWobH9LcKOFNBAUqhocVLLqSbEmBy8X/Na4/QArPKxW
	xRxBv/tiUvCgZPd/lJ/DHjJyp9MUyK7cmpGihLAnQTC54ORiYPQ15nvhyoVrQOW1e9DXQjkXNPF
	ms3X5BJbSxOD4zauQoWx/AzgQ/8R1jgqvn//ZGVqQAjlNXtQhmqNpUiXjzJh35XJtOJGUYpe/bM
	60=
X-Received: by 2002:a05:693c:4196:10b0:386:a97c:f80d with SMTP id 5a478bee46e88-386a97cf86cmr9886156eec.27.1795538638043;
        Tue, 24 Nov 2026 08:43:58 -0800 (PST)
X-Received: by 2002:a05:693c:4196:10b0:386:a97c:f80d with SMTP id 5a478bee46e88-386a97cf86cmr9886121eec.27.1795538637480;
        Tue, 24 Nov 2026 08:43:57 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:57 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:30 +0530
Subject: [PATCH ath-next v4 04/14] wifi: ath12k: add Wi-Fi 8 directory and
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-4-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX8m+6/W2sT6Yn
 E38sojGC0H9I7YODbaLSz21uscmgAtWFfV1DueLGXFGpQi5ZTfYQ/KGidGnZEdTCFOtlLokndOh
 B61XGsRjPETud4Rl/UWfm3GaTWoRRmM=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05bece cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: A2cMJEtBd5FPWLtcVu3nc13SpuY-TqBw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX5DAZNYLW6H7G
 uU3c8LjB5UI5Z9+L8mZPeEH2nkRoW9kfZOlitXCQ+3JyfOKitBtle/D03Afh7JWRNWAzkLEijvS
 QxUo+9HQboHpN6+igdJlFA5AE3FK1LXpffvdqhliQkPHpDPESBzJaX+45HU9lFnNFsinFgRUO/K
 kNx7zfOJGK3dyAWdbqc6hrm3kRsnvAltiVA+09CFBoUpT5jnuHwW4/67PhKlA6odKm8OUZECVwL
 9NDPXR/a1yEc7OdVhl3likU5taEB+F3wBstgt6SYnJ+mRw6dnngYHfpEw9xO0oWupRMRDL7t59i
 INjXW0jRXP4l1k2ooTC/As55O4pmF7gGR8kGh/Hlm015FYra5aO6eCw4GLt3rGeUc2edtLR4cah
 sHVVtp4RDe2B9Hd22UqDZm3HgZ08We56dC99eTle3D6DondvYKfwshn4h0C2S3B+fWCEbp5iChX
 fjoM5l+2FK3B0dLN3Gw==
X-Proofpoint-ORIG-GUID: A2cMJEtBd5FPWLtcVu3nc13SpuY-TqBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

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

