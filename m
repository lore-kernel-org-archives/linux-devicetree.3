Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982763;
	b=DeO/mx5ja6rS/c2dNm/tZI7m/y3tfBjNyRRF5RzFm/dpOIzeB7wXbSAsWwigIozKusNN
	 lMuqQyPczFUHpO2tBzW3ogE8+Xrv4S6iZ1sQsxg1iMhavEscsUOAVynqJbt0iNQ4CsNEa
	 KsH8LBdKq2EDyH9qYuC+07ZUzOO1EwHzJbTGCmmSBXZlkp9oYpGCSMtGHZ4ZkYWcsSALb
	 4/Joo5Fv4n9/QJnGW6jGqTLwJgfPJ3I/s6kxmon0LXo4nchNhy/1v76TsdO0W0fND65be
	 Zw3Jqf9suK1y5iIsugjp++0YxGyANbIRuacNHO2S9972m33JHNGCG7xeoEnqXOlA+mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cwl5U/8WvzlwJlxf8fAQsg9PFS+XirLLo8aTDkNKG0k=;
	b=1a3JOdVDbo5BuGjwV2PbnC0rqA/RdNIE/cf6kuLO66HszFsfqpu9I/RoMzbSNv62nngZ
	 Nv72Ca2DUPPQCTqzOnx+KOHKxF3rYsLxswuPY3vsmU1EaZjLs+r5JFyEQctgJnh5oGktU
	 b4hZqDgguB+opXvN06bVwOKT20hePPonRmM7JpDRqbw/gBqRB3MjDk17jrVBNWRGGUb8G
	 achY7VmoVzQS4n5MZXvqA17PybIH3J+DXsD/i+EwJ7uJffH2W+1sqiOtNbEnTK4uOcVtp
	 kG1wjW2CVfkYE+hEzxgFNOxK7/MknuoMikT11R4bjzhcW43I27XhMb4f0atBi7oo2gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mrk/4rHT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZhLnAwWD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB3C606A338
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB3C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrk/4rHT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZhLnAwWD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Utwc1959667
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwl5U/8WvzlwJlxf8fAQsg9PFS+XirLLo8aTDkNKG0k=; b=mrk/4rHTy1KszPkb
	NEkZqaTUKc0OhmUD7uWMLB5J+Cf+TDyaPnwVl3Dj9h1vxa+Tj+rF+mDp+f7DZfRZ
	JJnY2Emlx8/PL/zxYkqt82Wwpn4yBhz6WE1hJbe9klH+UkMf0Q8mSZb6t6BtS+DM
	dnij9NuRW3VaTHUYlODntoaurKtAaIIxp/H4WtZwKKu0dMip5ih6KZYqfD+S7jZ7
	nzGv728GqY40HErKSegKazLVkLq4MFZWtL7N6WmZOAYDeRKbshivvPL0fy634j+7
	HWzsMtNnAPXvpQC+4Edp2vdSQno5JaYIxybOMHGev6XX7ALbrEc7H8XxBar646xm
	zZjrww==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hgqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso536189a91.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982762; x=1795587562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwl5U/8WvzlwJlxf8fAQsg9PFS+XirLLo8aTDkNKG0k=;
        b=ZhLnAwWDSa+rP5bLXkcEhGPyzG8kpbwgA2ZY7RPnDs2H+rBoNdvwB6oWjyY0fwX7Xi
         QXAtna6kraNci60NUWM7DvGByIxZdkrXR6oG6vJT7/hkeCOhMArC1vtOmRu6t8S0ap9g
         k958G39Ve9g2jh3bFr0zpFxD+xVlG0iRD2lQ6Wdl+N4Dk1JJ+hwTp9m36hcU5XhKCVDK
         1zS7ysdatoDODFpk+VlKf7TqunIQ9jRAwWKBafz3yjRKJmFJi8xwjanpqH6dCkS+0KGI
         INVqYGIheBNTov08WkxVzCUgEDaNYTV1nW9CfhOUvwvYg0pzExrVRv87J0UWFTKnq8W1
         Y4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982762; x=1795587562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cwl5U/8WvzlwJlxf8fAQsg9PFS+XirLLo8aTDkNKG0k=;
        b=GfJY+7CCSYdd3uyvWfs8+I3eZekZIBwh0u9hryvBrt1qqD18bH1JzA3ZwzHMHXhNoo
         yIKlTKT9czhq4a5HOojFmJYGGL9GL47VOJJ8o7Iz+uI4ivFdp5gTHqw92Ezy3B6rgTeM
         5RcXi7esjtlDrIHAUi6G1yqqWV7BKNrDv3WLm6YVXtw+66V1rCV/5EVvyorctX+yvkfF
         jgmwyno5FQD1j6KzXCut5KpsZrbd4O/4GYnGuxHhgoj4gbHcMf7vJhgXTfWw7oK8jifG
         HF3dTtj08rvfmiY2r0daRcIEbNYlGCogQJQO4Hop6WKM7yyyBUwyx5WS4I09zXgrmVhg
         VKxw==
X-Forwarded-Encrypted: i=1; AL+hErGHb+kkDu4YdUsQfzqiHaFqHb3wSO38sKCrG2ffg6Sk5K/xWYenMAaeJf5hNdXgJ0f3DSNqyrxnW2U1@vger.kernel.org
X-Gm-Message-State: APuU4Z+9R1Y6XU+9ZFOMuhF352Z4HSy3B/C7prjEVhJXJVoF29mBi/da
	ePaT0yLkcafjb5mfB8xQxlP/sg5/xF/I/wAV2g61flb5iFQY4+eB8sUk6sEtR4XAOBYGi8u3zXp
	p0atJJ6u0SmpYB26TN9Kl0qiHjAxtgFAsntJF+6AjCttYXOlOITOeBMefTUh1Lyys
X-Gm-Gg: AZFdTZcis9aVQeiAMByvCwQFTgsbs3ID5L2yTTx+BiD2/ajk3CkcoRYWh/1sN+pYIbb
	sSEMyCKkCDXG5z9H53Dw3RM26pZb5Sf1OzfbLPwuvZDzMR2rP8RTUndl6LJSKRkFcC2lpnNZaU3
	kwJtbuKdMHX/ScF1eOv6yOmMrAkaawPXZv+iwkxzEOqpVAsKUQKp+FiDLG1EzRZWcFrCN2A0Fhq
	DwFjhQVfLOv7/DviQ/DiQdjUkkPzxXdkPvIhUecBHMpVZvMrNwDLNT/bPKtybtTF4e3OV9yKAsn
	J5mpg5ZkL2ry6gHNemPXx1KqaeH9OOZBhJZjYYd77SeX/6vuOUnp9ZzOWZJhP7E13Bt0ZLH2IsB
	dGviLR2HlU8YbiDwVOjyfijh9WNoU0bBLut5a2LYXh7/TBhN1ylNDSgZDHMCZTOYMbkrLUXTKtV
	C/4QY/65DfUfxOiijPOLA/Q+3rkTYP64Sy2KL6e74v6P0OAC2eewB1Ekhgcom4KhESbCyZwwDrM
	OI=
X-Received: by 2002:a17:90b:4a04:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b3d07598damr1560756a91.20.1794982761423;
        Tue, 17 Nov 2026 22:19:21 -0800 (PST)
X-Received: by 2002:a17:90b:4a04:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b3d07598damr1560723a91.20.1794982760826;
        Tue, 17 Nov 2026 22:19:20 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:20 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:05 +0530
Subject: [PATCH ath-next v2 02/15] wifi: ath12k: refactor PCI window
 selection to per-device layout
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-2-d81a3046290e@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd436a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MC8DN0fT8aYryp_U8K8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Wafn_o8d3Lm81TILKxfc5j0aG3Wmrz2w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXwkwXKdqnhIr0
 hlHu5xVL1FaNla5HTy/YXWeRYnmMTi6WpnTxJiuPB/8LZMfAJcCGYTxhSm+sgLHwg9WvSmdqkdB
 zeGOqttKvpJBJ03QemqtuAdwXGCE2AJbvQT+zH4CtmH9QmwWlUur2jqakZEJ5eV+I7Gd2zXFIcW
 qgLaybhJ0afjb03P57U4rQ73ZbuW7Uzgq/qT7LtIqtQ6wowdk86KlS5WgaYaTszcc6Wp8Oy5eKB
 G1NQQpvOND3ord56ejPRsuQK4svXwa2sTRRVQAUdd49hLASTWRutulV3ETsxZVDu3hkAPM+W5SU
 eq/Lop6NGsZGm2TxrMP0tSw2HwEnbUq/wipgt9v+7q0C0O7q3qtQvhv234ml0Ne/XmfGT5+tE83
 95y+RaTBFQTGTyIVYKuBQ+8r98W1xRz9Kdxr82QM2Kcab/ywqWnggzGDaLGoYWjxRJ4jrIio9+I
 +yZ+KTSGaedDk7Yg1Yw==
X-Proofpoint-GUID: Wafn_o8d3Lm81TILKxfc5j0aG3Wmrz2w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX/V/MJuVSzeCF
 edAGdffZBBWWXJuXUxpsA8aNA9V/pqmmqpf+Upag3/ueNWuNDxK3HepE0nzk3WAtnsyAtQVTwc4
 +a3lSHqJLWIvNmVpELghcnqK+mhzM7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

ath12k currently assumes a fixed PCI/AHB window layout with value bits
[24:19], CE shift 6, and UMAC shift 12. Those values match Wi-Fi 7, but
QCN9575 uses a different window field and shift layout. With fixed
values, ath12k programs an incorrect window and breaks register access.

Move window layout parameters into struct ath12k_pci_reg_base and
struct ath12k_ahb_reg_base, and use them in ath12k_pci_select_window(),
ath12k_pci_select_static_window(), ath12k_pcic_config_static_window(),
and ath12k_pcic_select_static_window(). Set the Wi-Fi 7 values in
ath12k_wifi7_reg_base and ath12k_wifi7_ahb_reg_base so each device
family provides its own window mapping for both the PCI and AHB bus
paths. Move the window register address into struct ath12k_ahb as
window_reg_addr, mirroring the existing per-device window_reg_addr in
struct ath12k_pci. Replace the open-coded u32_get_bits() calls that
assumed the fixed WINDOW_VALUE_MASK constant with field_get() and
field_prep() using the per-device masks. Remove the now-unused
WINDOW_VALUE_MASK and WINDOW_STATIC_MASK constants from the common
pci.h and move the Wi-Fi 7 window constants into wifi7/pci.h.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.h       |  6 ++++++
 drivers/net/wireless/ath/ath12k/pci.c       | 15 +++++++++------
 drivers/net/wireless/ath/ath12k/pci.h       |  8 ++++----
 drivers/net/wireless/ath/ath12k/pcic.c      | 27 +++++++++++++++++----------
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c |  6 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.h |  8 ++++++++
 7 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index 373dc3b92728..712fddb03f6a 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -14,6 +14,10 @@
 struct ath12k_ahb_reg_base {
 	u32 umac_base;
 	u32 ce_reg_base;
+	u32 window_value_mask;
+	u32 window_static_mask;
+	u32 ce_window_mask;
+	u32 umac_window_mask;
 };
 
 #define ATH12K_AHB_RECOVERY_TIMEOUT (3 * HZ)
@@ -111,6 +115,8 @@ struct ath12k_ahb {
 	bool supports_multipd;
 	u32 static_window_reg;
 	const struct ath12k_ahb_reg_base *reg_base;
+
+	u32 window_reg_addr;
 };
 
 struct ath12k_ahb_driver {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 4bb14a95aec9..6617440954b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -125,14 +125,15 @@ static const char *irq_name[ATH12K_IRQ_NUM_MAX] = {
 static void ath12k_pci_select_window(struct ath12k_pci *ab_pci, u32 offset)
 {
 	struct ath12k_base *ab = ab_pci->ab;
-
-	u32 window = u32_get_bits(offset, WINDOW_VALUE_MASK);
 	u32 static_window;
+	u32 window;
 
 	lockdep_assert_held(&ab_pci->window_lock);
 
+	window = field_get(ab_pci->reg_base->window_value_mask, offset);
+
 	/* Preserve the static window configuration and reset only dynamic window */
-	static_window = ab_pci->register_window & WINDOW_STATIC_MASK;
+	static_window = ab_pci->register_window & ab_pci->reg_base->window_static_mask;
 	window |= static_window;
 
 	if (window != ab_pci->register_window) {
@@ -145,13 +146,15 @@ static void ath12k_pci_select_window(struct ath12k_pci *ab_pci, u32 offset)
 
 static void ath12k_pci_select_static_window(struct ath12k_pci *ab_pci)
 {
+	const struct ath12k_pci_reg_base *reg_base = ab_pci->reg_base;
 	u32 umac_window;
 	u32 ce_window;
 	u32 window;
 
-	umac_window = u32_get_bits(ab_pci->reg_base->umac_base, WINDOW_VALUE_MASK);
-	ce_window = u32_get_bits(ab_pci->reg_base->ce_reg_base, WINDOW_VALUE_MASK);
-	window = (umac_window << 12) | (ce_window << 6);
+	umac_window = field_get(reg_base->window_value_mask, reg_base->umac_base);
+	ce_window = field_get(reg_base->window_value_mask, reg_base->ce_reg_base);
+	window = field_prep(reg_base->umac_window_mask, umac_window) |
+		 field_prep(reg_base->ce_window_mask, ce_window);
 
 	spin_lock_bh(&ab_pci->window_lock);
 	ab_pci->register_window = window;
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 55cc875f9ce0..62b72558c0e2 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -77,12 +77,8 @@
 #define QRTR_PCI_BUS_NUMBER_MASK	GENMASK(3, 0)
 
 #define WINDOW_ENABLE_BIT		0x40000000
-#define WINDOW_REG_ADDRESS		0x310c
-#define WINDOW_REG_ADDRESS_QCC2072	0x3278
-#define WINDOW_VALUE_MASK		GENMASK(24, 19)
 #define WINDOW_START			0x80000
 #define WINDOW_RANGE_MASK		GENMASK(18, 0)
-#define WINDOW_STATIC_MASK		GENMASK(31, 6)
 
 struct ath12k_msi_user {
 	const char *name;
@@ -118,6 +114,10 @@ struct ath12k_pci_device_family_ops {
 struct ath12k_pci_reg_base {
 	u32 umac_base;
 	u32 ce_reg_base;
+	u32 window_value_mask;
+	u32 window_static_mask;
+	u32 ce_window_mask;
+	u32 umac_window_mask;
 };
 
 struct ath12k_pci {
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index b6d306fd3b99..c10e21d68830 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -15,13 +15,19 @@
 void ath12k_pcic_config_static_window(struct ath12k_base *ab)
 {
 	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
-	u32 umac_window = u32_get_bits(ab_ahb->reg_base->umac_base, WINDOW_VALUE_MASK);
-	u32 ce_window = u32_get_bits(ab_ahb->reg_base->ce_reg_base, WINDOW_VALUE_MASK);
+	const struct ath12k_ahb_reg_base *reg_base;
+	u32 umac_window;
+	u32 ce_window;
 	u32 window;
 
-	window = (umac_window << 12) | (ce_window << 6);
-	writel_relaxed(WINDOW_ENABLE_BIT | window, ab->mem + WINDOW_REG_ADDRESS);
-	ab_ahb->static_window_reg = readl_relaxed(ab->mem + WINDOW_REG_ADDRESS);
+	reg_base = ab_ahb->reg_base;
+	umac_window = field_get(reg_base->window_value_mask, reg_base->umac_base);
+	ce_window = field_get(reg_base->window_value_mask, reg_base->ce_reg_base);
+	window = field_prep(reg_base->umac_window_mask, umac_window) |
+		 field_prep(reg_base->ce_window_mask, ce_window);
+
+	writel_relaxed(WINDOW_ENABLE_BIT | window, ab->mem + ab_ahb->window_reg_addr);
+	ab_ahb->static_window_reg = readl_relaxed(ab->mem + ab_ahb->window_reg_addr);
 }
 
 static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
@@ -32,20 +38,21 @@ static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
 	const int max_retries = 10;
 	int i;
 
-	window_bits = u32_get_bits(addr, WINDOW_VALUE_MASK);
+	window_bits = field_get(ab_ahb->reg_base->window_value_mask, addr);
 
-	/* Update window bits [5:0], preserving other bits */
-	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits, 0x3f);
+	/* Update the dynamic window bits, preserving the static window configuration */
+	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits,
+				      ~ab_ahb->reg_base->window_static_mask);
 
 	if (new_window == ab_ahb->static_window_reg)
 		return 0;
 
 	reg_value = WINDOW_ENABLE_BIT | new_window;
-	writel_relaxed(reg_value, ab->mem + WINDOW_REG_ADDRESS);
+	writel_relaxed(reg_value, ab->mem + ab_ahb->window_reg_addr);
 
 	/* Wait for the write to take effect */
 	for (i = 0; i < max_retries; i++) {
-		if (readl_relaxed(ab->mem + WINDOW_REG_ADDRESS) == reg_value) {
+		if (readl_relaxed(ab->mem + ab_ahb->window_reg_addr) == reg_value) {
 			ab_ahb->static_window_reg = reg_value;
 			return 0;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index ae5380eb6f8f..8552f403864e 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -15,6 +15,7 @@
 #include "dp.h"
 #include "core.h"
 #include "hal.h"
+#include "pci.h"
 
 static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
 	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
@@ -91,6 +92,7 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EOPNOTSUPP;
 
+	ab_ahb->window_reg_addr = WINDOW_REG_ADDRESS;
 	ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
@@ -112,6 +114,10 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 static const struct ath12k_ahb_reg_base ath12k_wifi7_ahb_reg_base = {
 	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
 	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
 };
 
 static struct ath12k_ahb_driver ath12k_wifi7_ahb_driver = {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index 783c5d020f07..6dc674e045be 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -167,6 +167,10 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 static const struct ath12k_pci_reg_base ath12k_wifi7_reg_base = {
 	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
 	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
 };
 
 static struct ath12k_pci_driver ath12k_wifi7_pci_driver = {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.h b/drivers/net/wireless/ath/ath12k/wifi7/pci.h
index 662a8bab0ce7..1017975b4c9f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.h
@@ -6,6 +6,14 @@
 #ifndef ATH12K_PCI_WIFI7_H
 #define ATH12K_PCI_WIFI7_H
 
+#define WINDOW_REG_ADDRESS		0x310c
+#define WINDOW_REG_ADDRESS_QCC2072	0x3278
+
+#define WINDOW_VALUE_MASK		GENMASK(24, 19)
+#define WINDOW_STATIC_MASK		GENMASK(31, 6)
+#define CE_WINDOW_MASK			GENMASK(11, 6)
+#define UMAC_WINDOW_MASK		GENMASK(17, 12)
+
 int ath12k_wifi7_pci_init(void);
 void ath12k_wifi7_pci_exit(void);
 

-- 
2.34.1

