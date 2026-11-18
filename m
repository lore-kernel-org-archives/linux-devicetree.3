Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989807;
	b=P0eBLVzHOSOKA+axBASo93j6OhU2lMvMdI94pcDWGvzvwJvV4QvUt3l17tFGnzl6hpQp
	 10RtSUWAYaC1DRj3eih1BJImXyWGgv1tLQi45R5MEf5DXC/7KBhQfxi4rFoVEl0YOwziH
	 sJCHczWbnDQlPZWfesRqMMTBd6bHY8+avOe3e82QctyJQc3jipi6ADPSAK4aqBkx78w0B
	 SST9e/GHzlxBrV+Y1G9DODk6SfixB8xMFYyCictW+Ft0dM7JEwFwRLZsSN5gqZNR5XoQN
	 eOQTpZtr4NIjXR5NxOI2zL86tUZcY31/o3YjQtjrHkH/V4Qp29wept62CALbXW93s+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
	b=csnGTczAsxvIGDrFWEtDFXsupUGU3yBEjE00crWVREyc9MD376CFZrI77DJfRJceSUB/
	 8bFLQv27GEQ7LZpMh+irnIGEnP0JR2LwpwjiuAI2RNvHx83Ia4VNloVRR5miVTx0MF4G9
	 ut0Hwm+Cj4SzSgKXDFsiOE4BSatT+uJdQLn956llcJaXP/oRr8UhJTkOmX+RQlomFnZqb
	 aN8DAxuqG9W+gN08ykWJhcWmt/LPtz1hVTd1ZDJUHPrjxbisKUchH3n2aOeHKX7OYH45B
	 Zkc6P+UKhp4xGtY67AGrjPaZeMEtQC+Ho5foWLI1NWEAdI5VSM+HvPU7U1WqqMY4DWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i37Fqcqr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dOxMvuyu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575FC606A893
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575FC606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i37Fqcqr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dOxMvuyu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2UI764106
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=i37Fqcqr0WtKm1La
	dCTCT8Q8n9GLoaab3+q9uT7sbKLcrOEZiKgW5mGoBoPWE53ksCBnAK69W8bU5Ffr
	zik154VIWhmqetbNcC09qOrkMhOv+enxhywW0B4CLNbNeS4zAH3ZsILH/dFv/OqM
	vNi7jwugqr9VuLLr/oGInFgcswoHhixpoVkVeQIK7DSNNsS+LT19SFrZ2onZsA41
	pRY7UX+TE6NJbmahpIVzvkCboy12o/SYjitHGvSR545i08N0x4V0Jjoxp+69NrIY
	I5jGg62mE3/gHFepn08/5hU9Q3g7JtaE/VBLCzrMx73jdaQ9vHXklEIEcJEX5vXP
	3HpHRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvba0fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a9826f6dso587737a91.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989805; x=1795594605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=dOxMvuyu5RBIQNlpG1VKIih+NhqAh3PonmhVCc0QjfXpFdcuhaSXBwcxVhrSGOM3g9
         QSZ7P9MO7blb0l13bJkSBfH/mlnSgSnU/iniUASRDYfoxJ6fyu7C+/2/U7xSk9zlKuqI
         BOzzrlz7X5eIwDUueTRNouzlYZ8K184ayPo2KQwgL/6b1jAU4PvFSvIPfsi74kJTqa6G
         trIGyfgK9gSxV1Ddorn+cXgTWzNYljAj/vrrfUX6mFWYtL5O6AN9JOnhrVa5AttDLUup
         14C2eD+cRqWgNxrCFtVrhirFdWWKAP/C4zW+9aXDN5nnjpg9NnbcHPX0Z48G4u0MzAh1
         Tt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989805; x=1795594605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=iPsUAMcRipwaTjlBfADSpRaHWDzor3WdWOgcMyu4JKk1yFry91phXR6TI9HikCqaDE
         39dYBRDT82haJye9xYDvzt+cY3aOmdLKSYp1M0P8YN7Kct4nRWw1g35QgGHqY0yPpzhH
         Xdx7G95o9CF9nZ9Zrh/GZr86t7sroF3dEy9S+o+NNWeq+gZ/PYayR5nDvOE7jbX7ODag
         V19oTErv/OgR+aj5rhxHoIpR2V15KF6T7QOgkre6vTOcxqx+B6zVAHmlhE1e2/Kz9GtC
         jqciARPka/DsX/ZtW6DKN50DJLRPfRoaiqcl4A5vzB5VkbFJkfIgE62e7n9FQF71jI1b
         t/EQ==
X-Forwarded-Encrypted: i=1; AL+hErEIpJ4l5y43zm6qrtiVT45RlZkfTgiIgdDqcXHnk/jw0Pj+KkTfLZvdk4Mv0GLStmiijfobC5nyB6du@vger.kernel.org
X-Gm-Message-State: APuU4Z9rPIw5/aqhqeYGeD5E93xVwHXxKggjv1nPKfUw348l74tHe/WT
	eUpFsE1htkBsI7LDUZy5rfRhbrqz8TxBoKh/8QPQN3f8Ri6WKd+2P6eQlNPgiFHwXSHLXMjasSd
	5qy7yLbvbPI2jdTqvdIpMDyHD7axKTxOcY1ugzQd8jaVSZMqSpopl7JGcY6KE9t0O
X-Gm-Gg: AZFdTZfeMHIca/++uwBi1nzVF9zrIGwPAn31HFA5PWrUsyyDoXaYzjFUut5CoYhYu3E
	cucfcdefBBgvQVWFNKS0FLoljvIV7O5Gc8N6HFQdqbrt5AZevJhWqf7pGdLvz7h3Hr7/7+DadP+
	Iz0h42v9xsWsACvkaXVGovOYlHs2cZ0N0upIqaN4XMATiaP673lqqz2pIkSE2cPCOJ/nlEuFENl
	v/c+C7bClnl3BU9b201eFk8PeNoQLEcFawqTePrCMCykmiMcnff8T/d91YEcZznADoh53mmhvHe
	DmMZT2lbgNXxb4cHyxXICPkBNgyq6VmppQL4qX7yin3O6RVTNAEF3dHOKssYWjSQaBitLzakXxv
	z90HJH4pDJWieOYaiwnAgUmuibLs7P/l7DawZrcxmMmR113J7JNxJD7GisLdAhVCYo4DUa4Z9ly
	+v+hM/a/loNoR4Mp2csKdhkbOppzJRZLfvuL0m6qusltGbgThaSuSCqSe5XDwWxmXOrGZn/95LT
	w==
X-Received: by 2002:a17:90b:1b12:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b3d04dd0bdmr2115734a91.0.1794989804505;
        Wed, 18 Nov 2026 00:16:44 -0800 (PST)
X-Received: by 2002:a17:90b:1b12:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b3d04dd0bdmr2115693a91.0.1794989803982;
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:37 +0530
Subject: [PATCH ath-next v3 14/15] wifi: ath12k: add and hook Wi-Fi 8
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-14-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-GUID: ZHDO0ex1YY-mGhvMdt1D9I5PG139cZpy
X-Proofpoint-ORIG-GUID: ZHDO0ex1YY-mGhvMdt1D9I5PG139cZpy
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd5eed cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX/Xc94BemHm7C
 zqJejQkB3E/SRX1r21Lqo2Gmjh4v0RsoD+T1MzX3KcT6nIhGNZxHcgyQwY0MhK+RSBGP1m4Y/wP
 iefYTETj3xktFo5TXBoElH9/ifHxTCY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXxODTWR9txxd3
 yHwKjeGuAIqpHQ/3Wbbx09YFOM6JliYBI0buD2WqSOk1y0JxYZzM/OLfrwyVK1W23Q57+uI7bHM
 C6KUBOhgwWgizqV7G8NYyAWUk1Cj9zBy5ZvofJhGzQ0GFClf5p2vRR6FuhLAarWwzwzHO4FVU1Q
 OiUsmSYGA0i3KviwMc4Yhhjjxl7MNasrf8ABI1svDTZn1Ud2fw+V+IiUkmU2IMR2aGWEWh2m+lL
 2Wcj+onFnswmI6j3h71CyGBWXE7uTnhlJYH03+Ky8Nmd9VIf6xaPDA1hQyJFULLHwK9UNwM1Lsp
 Y7Xlu3T2H0ATMMgLfCeSYiMft9VyZ59FfBJuNRH8uYqf1RHg/UJq0D/+px6+AXTx5uwI2Odblhb
 QEYTG3sQrKeXTgMnfWq8qyaGK45VJVRItbD0e/c7nlNaDlmDYmQNkrr9qKhfuSYU3CunlR5IE7h
 WqBh4GSIhr17tN8qiaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

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

