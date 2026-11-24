Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538651;
	b=b4I4/kak+ryatO3YyY0Z3T4vjDacY0UKjm1sYiR6obwBb8mRi3UULWdOam4vtGraGsFV
	 NmDH9PsKG/zk2cGsjCiuc2DsRYtiOadVyfwdu4aCpni8CkiY5x7FpwXBcNrvOg3u9ZV17
	 fUlTsYhAM83JqcRea2JtZb6XAezsAn+0uAoSi1uYF5tzpTgbM0gh8DYx/UPM0R4t5e018
	 HZ+mh4cJos2MTUNkXYdLj6dEPg/wMgPYMUrXQMq+q2dfw5cI6LZel0TyBDgub0W3W4TvP
	 Kn+sfVHlCkPU3N+wZeTpdfpy0NFOn3PjvBIqUNFTXmAUokOT+RmbI4I6diA/iFA/IAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
	b=EsouFMEhojd+7c8UP+/1ilFMDcs7p0tEwhbFTANDaqbIOxXY/MdqKentjxA16YG2trR5
	 aRJ8yo4qKrJgWpDnK3fWOgSCbFKY0cqyh5eA/TWYiqaABpopPaTNak9b9lTa79+iff8Rj
	 UW7gmPj10LoOYrumwB8Cu41nvDus1+jHe0qzFXxf4Sbjgd9ojv/lLxoFD0lDM+8eeidLf
	 wXdyL1ucmX7flp4U8peJ6HqUKr71u2Wzly1+IFMbYSt8F6aCeUHSGkbtqcqXtzHCjMNfj
	 844rceXADj83QQ9562T0PBYw0wLGG3DgRGXtax9nYLKt5EtvJCa1X1thZCWLpbF6Xnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgsz5mts;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAjBpALU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59827606A685
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59827606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgsz5mts;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAjBpALU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLVWY1331862
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=Mgsz5mtsbM/YV7L8
	vevAtQYJmK3evPgUU75EUO/zGexMQvfuhN2MPiDhUc4p4Hqq1yy2NJUSioln4enh
	NKkslAnb7JvPFqr/b/B6cvLeCY/1oQYi7py+DDD9QfkeUr4n/qsQoU6zXx23iJ1d
	p69m73mKlZA9wMXFrSeW8MSx8jtaLq26V/bZ2KnONenwcTQoSCRcnODhfFCCoLTa
	aKrdj+t0T8e6wdJCUCBEi1p4jFPcFqi19Fo6zlBw6eaa921mxdsbfyYKbryPYWGH
	plGNxf6nhVnkf5UOcxDFXpXnWRXyz3LKIfRlKH5afB+Bw8S+I2E7lpVvXYQdOnl9
	znefFw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb3v50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so4051523eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538648; x=1796143448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=CAjBpALU0ayznAHnq9U2b+VP+pCCML4I7mMDHJhNUH8wdGcGzzAG4+xV/zhKSU5gjS
         UE5axrETJ+8HwI/lUjPK0u4wvntc69MPjVbSiNmFOz70rdncZMtDDbBKpnVriyivEQxs
         Pg9/twQ1bsRx1goAMsbrdSXnDf6v6vZg0lNTFPlav3L82OuGZVBIlbxfLVRo3XiAZZOy
         RAxn5FQ3w311c84zYAN6HuDcOzdS/JD+FqAhGOC8SNELKb7iUZGQR2NxHuvegsKkkJ6b
         k3FBjPsBFoLvXc1HcImjV7MY1qrEHuBy78kKED9KbLzNf20QCMj59F3ml2ds4sTXTAk3
         RWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538648; x=1796143448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=wz+UAym4GJK7gYB30hVu/1150G0+xA2PtHpHpTe9e1hFh0jF0/S3msXEVdVhwVokTn
         NztrFuVYfCm6hKto/76/+b88r7Ja8JV2104GUqKmGKH6ejpT/dg+QVpObA42cV1HpkBr
         90YqTuN2Vk1cCijSCdVYAy1BLOfFfqXpzQeX6hBO27b1WS5zRw6SD2UjOdUc1ttsLh4K
         cIbW9BkuC7QIoBguC3XqUkjCHeRowqAfuHUuGyKGvYm6iO4CdpzGxRwwA5NUZof4UXGB
         46SuQsIOOBd5/ugsXLB2t8kHHJyGcqLI+2fPt7Ld/bc4ERVv0ne7JF6hmuexsF5t5hRO
         cXHA==
X-Forwarded-Encrypted: i=1; AL+hErHbJ/uso6k5fmW9ul4mbe1sHwTC2YV531jNdIbtdZ3jqO7SUnYqj+2RMaWdVilg7axhNIqhRcxy0Nco@vger.kernel.org
X-Gm-Message-State: APuU4Z9XXNkm7PnQItGDfI7przYBNlULq6eEivTZZD2oOy/3xcprpSu1
	EEFGUWd1xP99NIqahWwtDPrIkEQFefgSBG7kemlB8QbcIXuEve6QXADQQfNf6+/RkqyZPquXZb4
	DndY0qxnqs371uxe/fAArfdy9mwow9QAgzwidGzTVq1YlBWWt0O05b8NCJVom/mEu
X-Gm-Gg: AZFdTZfj622Oe8UXlSyjfBDQHaEFZUs/3vHTdGsFgkWW7PvtOQZeuMypLtTgpgCLVBG
	+Tqs2/d0NzFAo2/r8/VVmjdIkScC78fRjZ0qUm/JPOPg6mLTDdx0Y908o/k0BQ7U7lLRg2p+/IB
	eoQNw8Fh3P1rH3aysbBFlOr0hQh/9aqeNPWpI5I6bdV8k1pKu+O7CfSzo/FKnTjwGuqp2Z8oY2R
	vcWWo77tov09ibv34YJ3EpC+qCg12rC6XEpZPSFlJfIpgImoQzzz8SMuRuNzKvaoMG8A3JHqbj7
	dDEFXJS+FNdNFa4jcf4i7Egc2Nmn1RCH0OEGGgqYPxWA5derFxQ/2yAixVQvBx8Zl4/BIvGYsrv
	YWdcha+u0Kot/uSNWtL2Z6YI7MHpBF2ktQ2Mcp4Ic7S00tNWimQ3C6cXcUtJ3XGxLsaUhKypAU1
	kQ7JiHEm4pt2PmobcHiCo+P4LYPy5VqFx+tFKtefOWrmUjt7loVVHrofktTZZmQq03ZNdtGLdJG
	38=
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr15111450eec.30.1795538647896;
        Tue, 24 Nov 2026 08:44:07 -0800 (PST)
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr15111421eec.30.1795538647325;
        Tue, 24 Nov 2026 08:44:07 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:07 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:32 +0530
Subject: [PATCH ath-next v4 06/14] wifi: ath12k: add Wi-Fi 8 HAL register
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-6-1f5b87ece6a3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b05bed9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=k5nCMmGC1qFvne7xG5UA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 4UxZaDHzWxUdXQVX0uoe9ntAUWX_VIHJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXxCrWpNBklA3w
 xCo37jJ2x2wwDTbNJJmsOsJsJ4ypTOTit0FAwy2ZNbDd1i4ebC98/cnR0LWuKYhq4dXxPlC2AEl
 nANARNqRTrWMzWn3TVLYcARiwpX6Q/I=
X-Proofpoint-GUID: 4UxZaDHzWxUdXQVX0uoe9ntAUWX_VIHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX65QK6zGo0VH5
 MHw8Oug+aAFl+i+JS/MNyK17MxOCD471WTEItLklLdXxR3WyQjEzDVTuWbo1RR2pr2pRa/c+V8a
 H4GPVhP6JabwwdfkXEG5CN8iqjnPS1pp5V14owXH6ATcJL9Bji9A0YkoDftqwIWWxW9dtgndLVy
 OscJ6G8nxf3Lpb2RDG96TaZ8Qy6NWKsl4rcY11USgHEJfOe+i1ZdJ7lFrMeww0HVh8TdWOV53I/
 gE/z4XUqAYXZy1VRte6E/Oj5yZ3if2fczEN7TtBb3yPMpDj4T78WQ2uL6vgZILzJyM8YoM/37xr
 x0L2Jky0FupgU02E+a7sjXl+tp3gZymgoHOHX2JyySNo3/G6JC+R6ZgBOKmHldVQmWznKyqqZsJ
 kaLeXI9R399Zo+talnqm0P9timMMREGhR+0iRs+y26YyJRQ3FI4ob5D35GQnJJXyPhOdev9uf+0
 ZZbFMsBkVqsrUXZkcEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

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

