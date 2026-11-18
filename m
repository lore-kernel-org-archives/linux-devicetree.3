Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982825;
	b=3xgd8jZgElBIHnKoRxwcPaC5gPTV5Ag3Oe+H2e4e5j2Idy5PBHZgzCyMeqdO76Tj6fbb
	 eHU+IiySHlXIfmaZw3tM8J1rZbPw1fOSU/Dio0iFZGS3XRrOIAhLYLtVyrUusn4rwh3fU
	 s2UhbmLLMqz79rHRvHue8jpcfw/Ii2z9kE9n6dH09w7ypgvPzc4DRw1ymi664Ot0v63+g
	 K3QvMQQbA69xqrH3MirSwwPkhysm594vnTsNRTEB4pxBfLbP6Tjb+8xWsx6AqjIaFDc4k
	 jQXRbPn5x3mwM0v+8IYlc5fhw8Ei1E5oZ/VXd9PT/oWWCJxuDsD5G2saLbgWpS5DKWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
	b=2Vs0R9/GuNg3uGsQVHYyK6h10rcr3Wed8owJZveeHCxQOItdb/dnXiKpOySx3ML5uacM
	 5G9BemnXth0Bp2BZAXIJOQrpOV5u7wl2g0IC9m5syPealJ75MiWSn7OBkHlDFHr1eZrxD
	 wV59akOYD4K9OU1GASFugMizqsIdSKKYUDJtZcG6kOxwuf4EpwC6gl8POt3+Nh1bKi7zu
	 6HrEzzGIvdEv1QnE8YFM5TQKFbfeCpJtIsLXsMm6hMFXVA+zdUmKRXIK1oJd3CohMWcJI
	 me9PcS52qQoXVdG8jV75UkLGmYiAxjK/E+X+maZHpma21cAZoah5EWMC0/tmF79XCTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dszaCtyd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyJ4CnAY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EF3606A89F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6EF3606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dszaCtyd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyJ4CnAY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V6RE764294
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=dszaCtyds8GmMzRu
	NqD6eCTgNjKoLD0nH7upIT1h1ntWT6epLgYzGDty0aregqwoDkWmhB6/5MpuJ80w
	s+15kvbwQX8Y3Ue6DE0GQr4KgZSo1ItfsZUQrEnHP88PGqByHXjvyxn3lhJjKBhM
	5kqK460fUsQ9/ydIzndcUmWNLRgvOYHYfQGV+LfwBooW7q7TmLcrXtDMcunAwBBW
	TVje+G1iha8VjAN5jpc7qA51QPsLQq3GJ/Lo3rhIleNBWTRl/BlJmL84+jwY11Tq
	ZfSrzps7LX3mH6qsRfHiLwmJWZzqYKxlPEuh0o0gWys4DsPisHJ+/rJlzEqgWDUx
	TLo6FA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9h6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:20:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso691502a12.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982823; x=1795587623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=TyJ4CnAYvTdbne83NklQM9RvnGrNt1L1ZLrIFWGWRt47F7yxug+bh15XW1bNaC5cYp
         zer8tUlG6OWimATSqda5LypY15iAY4x46SiMec/jR6FcgMMF5XXfFQHx4+hxTs4IOWjS
         SoGYAwV5bkcxfZooonLROwLBbUqebz7BpMKIzHbK/kQNHj3qFfn3tn7JcWCb2tGT5Nqp
         rXoYYXC3Ld2QmIZcZLaDTqGbi+/xeSglCXg+ehuAhr105a/kFsvP9XrGxLqdCzH9fzST
         WRDBFYxd9EL0OlBHC7TsHK8LGGa0IV+mU5lzxTmDjFp3xJ4D/WQkIeokCF7XyW8fFjIA
         Zm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982823; x=1795587623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=ENIiVMdfO7YJdprxrlMifiMZrBvjqjWEMhpAGgVeYTeFFQa2k8wtRJd2ExY1hwqhvP
         WtD74CIZ+It27f0RjOtfZdIoWvVrvyykieLoj6o/u+5gW9E/NU3fx6b+FVgHIl8+snp8
         x04m/uvaSr65Nh9Ugn19TJaLvXfKCEh5EeouCWBO+FB9pjHaTyHsnIJ4X7gBP+jiCAJ8
         INRe7RqJ/TfpjNZoalKYBKOTXTqzUYLoeG9G293BgzF/biq7AEoM+3FvS7MnsNglhKxw
         3nexel3M/8FjS1gOGmpc01fnfzJUf6/wF2CEw8rUAIyid9VCk0u7gBttzzD4e5uEtVUu
         I1Tw==
X-Forwarded-Encrypted: i=1; AL+hErGkEpCF1qBzycpwL/G2TDTuVgOKYfuMJGP5JD56EvFPFb2hEW+u1331icNNOigufVRkrDpoMSZLPmIo@vger.kernel.org
X-Gm-Message-State: APuU4Z/da/XYp/hfTlHuoW9IDjsfULHxUQO00BshiascMJY2kHu7cVZY
	3g/NkpkLePMtTkzwmgLxeXfu15b+t+zOkHuOF1OunnawRvRyFcp/w/t+909B0gP0mHuMe68Na3k
	vMW9+H5ZZBbWZ3Nh/YLrBpVKdVdDfsuVkkEJihRfXMYLltJ4Je0YC/yPbh+WmYkTo
X-Gm-Gg: AZFdTZcHVy6kaEmrPOCe5itfRKsM6XlIXDclKKzQRFLMIC5XtjCGEj4375m83GdHN2U
	PDN7abuf3EACaWta9bav1WEnuGitXbk4p6NbeNB7hZoUN5/DsRi5zxLiC/CcdxfjocZBVLvfhSb
	tKU97mps4GfL7kC/2mpdwjkdJRab+92LcG8RXjYH8x759RYWl/wyrTlnWoy62twlb8/FVVHAohf
	NmEXp4LHgfQYGbJ9uFyIYExXa12pVgeDzKK8Cqjo/nGX4uDb70+kVPatn+ZKsH8RhB52SWN07eV
	Cdpesatg8maGafVby5E1wumk17sB6005WfPMQxW3NFSJc94Jy9V8poPvaKtsrmKed1+V2iwPS3V
	qRxaYhP9mbpcWS5xy9XZS/gYtOgSUJhlCAIjW+HuFKV8T6yp8h4I5XPVIc1/k0nccYmzPVi1Tow
	VV6EDubrrnBX1Wyx37dCTxVc9dY8fCznOnZpQy3NWzqpzXu6Z9YosSnGb9agqf+omf12O+/FwcP
	3E=
X-Received: by 2002:a17:90b:4acb:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b3d07b08a8mr1866339a91.48.1794982823201;
        Tue, 17 Nov 2026 22:20:23 -0800 (PST)
X-Received: by 2002:a17:90b:4acb:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b3d07b08a8mr1866309a91.48.1794982822752;
        Tue, 17 Nov 2026 22:20:22 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:17 +0530
Subject: [PATCH ath-next v2 14/15] wifi: ath12k: add and hook Wi-Fi 8
 mac80211 ops skeleton for QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-14-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-GUID: nP-AS9q1b8LKjpkIJJsYL0KhHBpUFoJL
X-Proofpoint-ORIG-GUID: nP-AS9q1b8LKjpkIJJsYL0KhHBpUFoJL
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd43a7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX32xBKolHXPf5
 QdZ7ksCptiVU7ITXIgdYnkN8R0uySIzRkvFZ1f+bszu3ofJ36DolhdhQVrk9+c+1nT7WAuVS/+n
 2aDx1IWXBla6J3BWXQqVvaAY0KTQdko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX97knsMvAyycJ
 roy2a9azK/ObpCxkOgPYQHdb4w8G8M2nKyIIRkw41Mvjx51L1Sq8kgntPOPcVMHsq1GVKbGoRm7
 CaSKPtqIpBtRfhsElHLrIdRUGzzoqmCvd+DY+u1HZDT3uGHlrWnR4GDLX98E9pWuvneSeoSYUqC
 4eHjOvBwXB/2EK4f5wKgza21Gx4bPmcBP9VKew/XPnJQ2C0+v9J5EXBXHwnVl7aLJCad4xv7ggf
 i27YGe0Cuk3ekmR4SDU1zSKAuXrCaX/1y5GvzxMhwBR3UjnBcYyM/OeovmUacrRHufH7b3ZjoLK
 IRsdvSzFMU1eJdQCp7+ZfM74K3XO7h+ZXKPPc5lgzQ6evEwbvXBYxLVjjRYjwfWWz0C9jCsDhJn
 rHZP99xK3o6PEFG6wrK1aYQNIDUXinh2EZkTLUqTKG/UUSkBNaQadEbCnYU9B5u9zwExWAbJ7rg
 illACocIa0W2tvzPHYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Implement an ieee80211_ops skeleton for QCN9575.

Add ath12k_ops_wifi8 in wifi8/hw.c as a dedicated Wi-Fi 8 ieee80211_ops
table. Introduce a stub Wi-Fi 8 TX callback (ath12k_wifi8_mac_op_tx) and
reuse existing common ath12k_mac_op_* callbacks for all remaining mac80211
operations. Hook ath12k_ops_wifi8 in ath12k_wifi8_hw_init() so Wi-Fi 8
devices use the dedicated ops instance. The stub TX callback is a
placeholder; a follow-up patch implements the QCN9575-specific TX path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 92c897de16f4..30188f4fae02 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -10,8 +10,11 @@
 #include "../core.h"
 #include "../ce.h"
 #include "../debug.h"
+#include "../debugfs.h"
+#include "../debugfs_sta.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "../testmode.h"
 #include "ce.h"
 #include "hal.h"
 #include "hw.h"
@@ -152,6 +155,72 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	},
 };
 
+static void ath12k_wifi8_mac_op_tx(struct ieee80211_hw *hw,
+				   struct ieee80211_tx_control *control,
+				   struct sk_buff *skb)
+{
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+
+	__ath12k_warn(ah->dev, "wifi8: tx stub is a placeholder, dropping frame\n");
+	ieee80211_free_txskb(hw, skb);
+}
+
+static const struct ieee80211_ops ath12k_ops_wifi8 = {
+	.tx				= ath12k_wifi8_mac_op_tx,
+	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
+	.start				= ath12k_mac_op_start,
+	.stop				= ath12k_mac_op_stop,
+	.reconfig_complete		= ath12k_mac_op_reconfig_complete,
+	.add_interface			= ath12k_mac_op_add_interface,
+	.remove_interface		= ath12k_mac_op_remove_interface,
+	.update_vif_offload		= ath12k_mac_op_update_vif_offload,
+	.link_info_changed		= ath12k_mac_op_link_info_changed,
+	.vif_cfg_changed		= ath12k_mac_op_vif_cfg_changed,
+	.change_vif_links		= ath12k_mac_op_change_vif_links,
+	.configure_filter		= ath12k_mac_op_configure_filter,
+	.hw_scan			= ath12k_mac_op_hw_scan,
+	.cancel_hw_scan			= ath12k_mac_op_cancel_hw_scan,
+	.set_key			= ath12k_mac_op_set_key,
+	.set_rekey_data			= ath12k_mac_op_set_rekey_data,
+	.sta_state			= ath12k_mac_op_sta_state,
+	.sta_set_txpwr			= ath12k_mac_op_sta_set_txpwr,
+	.link_sta_rc_update		= ath12k_mac_op_link_sta_rc_update,
+	.conf_tx			= ath12k_mac_op_conf_tx,
+	.set_antenna			= ath12k_mac_op_set_antenna,
+	.get_antenna			= ath12k_mac_op_get_antenna,
+	.ampdu_action			= ath12k_mac_op_ampdu_action,
+	.add_chanctx			= ath12k_mac_op_add_chanctx,
+	.remove_chanctx			= ath12k_mac_op_remove_chanctx,
+	.change_chanctx			= ath12k_mac_op_change_chanctx,
+	.assign_vif_chanctx		= ath12k_mac_op_assign_vif_chanctx,
+	.unassign_vif_chanctx		= ath12k_mac_op_unassign_vif_chanctx,
+	.switch_vif_chanctx		= ath12k_mac_op_switch_vif_chanctx,
+	.get_txpower			= ath12k_mac_op_get_txpower,
+	.set_rts_threshold		= ath12k_mac_op_set_rts_threshold,
+	.set_frag_threshold		= ath12k_mac_op_set_frag_threshold,
+	.set_bitrate_mask		= ath12k_mac_op_set_bitrate_mask,
+	.get_survey			= ath12k_mac_op_get_survey,
+	.flush				= ath12k_mac_op_flush,
+	.sta_statistics			= ath12k_mac_op_sta_statistics,
+	.link_sta_statistics		= ath12k_mac_op_link_sta_statistics,
+	.remain_on_channel		= ath12k_mac_op_remain_on_channel,
+	.cancel_remain_on_channel	= ath12k_mac_op_cancel_remain_on_channel,
+	.change_sta_links		= ath12k_mac_op_change_sta_links,
+	.can_activate_links		= ath12k_mac_op_can_activate_links,
+#ifdef CONFIG_PM
+	.suspend			= ath12k_wow_op_suspend,
+	.resume				= ath12k_wow_op_resume,
+	.set_wakeup			= ath12k_wow_op_set_wakeup,
+#endif
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.vif_add_debugfs		= ath12k_debugfs_op_vif_add,
+#endif
+	CFG80211_TESTMODE_CMD(ath12k_tm_cmd)
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.link_sta_add_debugfs		= ath12k_debugfs_link_sta_op_add,
+#endif
+};
+
 int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 {
 	const struct ath12k_hw_params *hw_params = NULL;
@@ -171,6 +240,7 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 	}
 
 	ab->hw_params = hw_params;
+	ab->ath12k_ops = &ath12k_ops_wifi8;
 
 	ath12k_wifi8_hal_init(ab);
 

-- 
2.34.1

