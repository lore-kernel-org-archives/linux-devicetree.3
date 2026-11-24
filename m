Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538684;
	b=LoFijcaKpqtDu0pkQtlQpVJkvO7Iviglj4EBGjBAi+XhIMe4pdCTTctmo6D8uYK/Mld2
	 0RJ9Gdzbm5OYaChR8eNFs3YDS5R3yc+A5hinDzcAoNbHXUApH9pIWMR4r3adspOwK2M2I
	 XiAP8Vm7KcyImIKuVDB2gihGx487hB24qb3E4eF20Uj0m0pvVNqEKBAgn10Z0wEEMus9S
	 sn1LEeNxwGRFjPK+Ch8xGpDS4uSllfO+jKdM8jrpopqV/8n0N7z52H+fSl+m7TyhrlE3i
	 wJoQcXqdlKS1xm4EbzHzWcTR/sSwFspjS1W6xUr3CM73ess6+LzxAFpLD4h+tnOW6MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
	b=pfgnoSQbyKhZLA/V/Y0nBllPHagJ0MN3ez3uB04TODKuuwMPvmXEmyUtW0iEn6gb4jRW
	 0IMd+gUL7N6a1tR+usp4HST1vQznbTehWdnGixgZYQg5fK/F+BbijaliP6Yxfsmc5gKms
	 J/WR7tR2H7yGgUdQqJKh4AJk4w0mqo/T6XsitcmrEYkhhb9GDRA7hgU0o3Ur8bCswjVbf
	 TO13k/L/BXb/USttEJYq0+lsflTHBdgvbjV/ea8LidftTvKMt0R3e0RoIpiTH8xKHKf11
	 ZS3OjQIeBb6rZ5uKEQHcyAiF4PaXkxWP7asGkoNJdp1Lvdn8f133HzweigXRzxQ83mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FjBgYfw/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ExrjBLMT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714CC606A323
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 714CC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjBgYfw/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ExrjBLMT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKtmf2569554
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=FjBgYfw/UuQ0Gigp
	+T2S8w0NBV8TzmUzal3sfMRjAwMh9ySrHe1fyG1MA3pYOIRCO/D7BGQzb2JuFPuQ
	UF04CSih9O1MjRsqR4gupHuNMYAR0lp75ETxJbmsSsgNU6YtuHK1tahTJSzz8Yhb
	HMP8TNks0bA02rkP/bcapjJwz9Vsm3FcVnKOZk1c8Eq/xPsbPwuQUGog6zbiSxS/
	J1wU4CldLAg+t7sbOHKuAWPbuR7h9ZxjG6GUL+Dqa7+8Txn+SthJIzsFAdhOwXin
	UCsbA26gszoDrLHsVSLe0mjQVixdD1ZZtfTAXlTuhMrMm68o+tIiC8xAig9Yy5qt
	iTXdbQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6svemr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so4817350eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538683; x=1796143483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=ExrjBLMTv+Ia7idKpKpumrSUuIN3D9XfioMwaWmL9U9NRM4kSVz6ZiimGzErnpU5yC
         eH6QIt9HwLwtkCdwFtpP5c9Pt/8ic3shcc3sLFF7h7P9NdpR5S/u2y1vmlUh7+tX+IyX
         pw1n17pyPlLWQTeaqKochlBiUjRYPcq0mYbrr/eLkOgkv5GOMNvrxDmfWAKmMFZyFooY
         uqeveMC7dnMEQcPiN24sNEwqiERoJXl7mZQOqd50h4XF0yjjLKXQQGrADsFhXm41bNon
         yVxEtUQXAQjB3xjuCj+feGlmJVWgobY+EMSnWg17yfR8l9TzSWlW/xGXz1TQu8+Z9tL0
         8cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538683; x=1796143483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=p1oOirDLMzMEnRUtjtqD9aDEvvcYQRHlxwD5nGKNKWis5FKPmBnO6Mltl5FdmundQX
         N4o60c481RgWGSp8KkG54YkraxTDxYJAkENoNI2nwSJzVWDTjm8u8BV1v+UloZWeP9jp
         WPzA1IJXfJRPaPmNsVBDBQI8xExSF5jj/WcayTWJTbymb52VkhtbIZ6SAnzGIYI0Lxb0
         HYeMJ7uHuJ31rQblRzMv7D0Ta3ZLBctvtkugix/w4ySnpcXbPgH1IirfrsVq36YdpsZ7
         u5lT4BNd+ZQR37cYDWzY/J/37kJqL27WayZcSLact3LW0Yaowcu1k2Brxw6C5djuLvRs
         EVtA==
X-Forwarded-Encrypted: i=1; AL+hErEu4wS9PcmMhoCF3geEhwoI2y8ltMRjUe0+noSJfYHtzg3rZUZS+5+OcgtfviQYzZUoyGyTaA4MjzJl@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pn9D2ZwrTxKhFR3CS0zuyZEv3ez2NmoxmMKLvwOIWKyGYlql7
	myoeZlibq0Df37qGrW812wDZMIafG0ZqqfUpPSxon3yaMZVz8FV9Q7wizRd5qKAbcIVnpXSg5AM
	gfY9+JPz7x7J9aU/QIqEJaTXMVj8SdbxjFcn0u2uPZdnQMLxHI0S3bhTMKtSUxS9A
X-Gm-Gg: AZFdTZeiVzL/Aj525g+i6t5z3MDtscSRijkBnCXhe2kVZNo5QTbswQH48fuzJUh5zE0
	3U/bX56PzAQ8Ug+fyB0qh/8OGZxs0u6bBvZoAEMbgepPEiW7sB2cG1a5ihhgBAnsLdGvPLAIkcl
	UH3gFmJA7bnpXsQeekf9jIY7PkAA4IpSM7FN8T5vg2iC9DCcHFxAaFAtoLey89uCgjxUWI7oQxP
	vInSyx8JVPeSL17mvU2y51bY0F5Hf5nc73zCo9LOx3lNp/5wXFA4rO7sG+v1KK1oimpcoydwKPW
	Ou0GZ0bXBiB+O+9UH641TwbCIBzso8jiWPtClF/0LOUg+0eLIHBBF9CMzIAYmDazAz2X6gj0R7G
	N1N26KUQpzL7iTg6tYhehJRvMaMRJhMnXtMl5Zxk51rP5OWSyhkStyXEpMVwS/HUoQ6ga2UGwxQ
	73lZtanLiqNKgE0rYEFxBLmKsSf2PO2cXEhlELAHTxq2ix2IYjmVBcMPt93rOI/5ABLct2ruFPy
	z0=
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr17562838eec.22.1795538682957;
        Tue, 24 Nov 2026 08:44:42 -0800 (PST)
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr17562805eec.22.1795538682417;
        Tue, 24 Nov 2026 08:44:42 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:42 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:39 +0530
Subject: [PATCH ath-next v4 13/14] wifi: ath12k: add and hook Wi-Fi 8
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-13-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-GUID: W8JrmHEqZYOp7yB2SKqVl33fmjqD-155
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX0lBoQlk6vNtA
 LMe9PAGqQmDtRlpDXxlXRCLVXHONSf+/Llx3IGO8tTkBwvPFCTI074WzkuEdULS5qFX50M/N9uX
 FXrtmABRAAei5/IgViMMrYsDaxtkf2s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX2BvTeXDCylR3
 XuZXdqSyevW9edTgIPtyCNsD0t6prZJSeQQ7OvzrcnibSz+d5XrqhfdVCJ5ND/N+iKdYAHyoVFW
 LhGOpVH2d8Bquc64pZL+ZcYUyLlup6Yct6jliVjJUQgTb7/XN/aHqlDI1Xh4ZPyUhyxsnu2J+Bx
 FvGLH1oKslc2/mz3mC9gOv/jRu5nC6EC65Tq+ltKeANG6EI5LSKOcDVNIUU4M9AIAcWWNxFNuPo
 MDUdoIhnCPLflCOWxizVqxd1iW4y0u560iZA3DxzhDfR3XXa0hPRYr5ufLXHDIBUMoXGBYtnui1
 x541ZFPO97/DoinT/5TfHmIr0C8Kn2mWITjBpmKkbdKUb0Ggig9oaVshuz3/NMyvQEzPN7Px3xG
 kdA6FFpXbbPf2LZV+yYf3CNPjaGPheeLQU7jKwvLRGJanj4sTrj2SA46ViC88AhPL923hMgbbTe
 BOl8SE753ckLOAwwvcQ==
X-Proofpoint-ORIG-GUID: W8JrmHEqZYOp7yB2SKqVl33fmjqD-155
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b05befb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240065

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

