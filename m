Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989801;
	b=o3gmMsI2hE6hR2pBG4pgFkVFpAC5gvxWxcFMa6XLjT1A26ERBsQs8JR7FJYEEiGT2y+8
	 h7xaUVXbwCexBCez24P5MSYsm1N5ThOoagHafackpj1LluqW1p/RI9qQzxg9niqz2duLi
	 NOhr9NaX/B2o/x1m3dqyqqwqroHGaXmQXbjdouHThSgjajakmWJg3lnB0prOoL90loE1n
	 vkOWj1FA4aR8ibuAJAn14S4DrZB5AABuF2p/iDlhh977qASrYNqDuWWaTsky5w4HcXBXr
	 opCCJo8YyeDvSqu/ft/OqMgxfBEF6fDIp5JgJVVxuRGAY10mcjz/fG+MgpncXlsPVow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=s25UamltZ2MN39M/qtxnJIl431lkNH1VnNr5CXuD15hWaYZ0N6AnH5fiqQYzTfjyGnb6
	 7j9ySOMe/TJO+GvvJA4wBgGSQpCKW/ormxlXxxlORKicachXDcpz2/PmaRjHTIeTEjuMY
	 T8Qlf54FR7iCUEhBkRlqNM9Ib0d2CLZiSQwcZQe5rhLDcihqbjhbSLtvpCm0MXJNZza0a
	 UoU7u7uttuAs7JG7WqrKfTQoY8BoX292uZSWYDMEacWdjofbGS0U0gwUeYo7SmMkBbyiI
	 ZHf7YkJ0v27NOWzncnyC5cvBc7fPNPSMzfk2dvmDgFdn6XrlsgkBTH8d+QYlaiOTavQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpVrs0Bh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g7cgadLv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8A9606A888
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB8A9606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpVrs0Bh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g7cgadLv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V0PM2602498
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=FpVrs0Bha0w/0rn0
	aXJhKN/JmYwXtN/rPG/vJzue0PU8ZxPmj6NBMtxe4mUsnR8BnqGKZvU9kR1FZVhc
	qtTYZwuc0NDyeaJJ0HeKlg1WS1OitJdRQ3h2vfXeaM9bO/8gqdOJ5z/Nv8sP6fut
	QKa0CmmZbO3qEecQkqbdhQmyOYcr9s6mrguRhpIRd0uSaELLDPOlOTHBLbatd0/Y
	Zq8HYZeNB3LXxIBWfeFDRWXKVMOl/+kCHaTPAA4TGHN0aUKo6IkhR8WxsUO+JoIp
	LtzOPwErN33XFku0tzlH8qXUO9ALcwXp9RB49c1qGAAN8SOOVtCzE1G7ldvZg0lS
	tQsT1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv721e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:16:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so778214a91.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989799; x=1795594599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=g7cgadLvBGI6/krNsIgWiFHJctVowT5rcZw3dPk7GWkaY/f1TqaOJAFkrIeCbckGLj
         wbqCLA6TmsTq1NEIDYnDCzAOwHFUdw8MWqJMGcF89VzSZ84tEUDCrGbcSLazpnBRuHEd
         6Q/Xwtkmzy9DkkxiNPtcjaUaZAjPXlXoJag65Lne1lztZtjSoheH8N5aTRcuSEgPh7Pq
         FXwQxUpcCQeCvyzXfm5cx58VdOvN/iga+8ShJ2Cq1TbXBbSLEIcYW19/un8PGc+5UNAj
         sv8NxGl9fo54fc/oquBM1K/yUT6H+uL42CNq0iHe3AplcDHTbaBFVxD3ypS3jux9TR8Q
         H2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989799; x=1795594599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=W5lINJQR993yyszER4pfkFB0W2ssB2USgau9tn6r7V74LLvLFvoVow2PNj2SX56pnQ
         31Is3HAuHlMYqL4Sijp7szXrO55CNG2EpdMDdVsYw/bvOJYT5n2qFLdGAwIeMOrtJ4SN
         P1F1PwrgKKjPrbJKEJLQVN+Nt/zQSS9TPH6eQ1s6/KG4wBN5rh7MYMbnkas4t64PUWc0
         UqYETq+BfyusRVgTNNXwNdZhLKWWvu/ySvwf1ed+P4fH3JyJJbn1GOGvXEolf9SqvxiF
         gVf/y0+2HJptrILuQAXI10+xW0HCn+xs7m1L6oeaDxLvS8zDUju8vDuY8xNq0aEefxuL
         Rafg==
X-Forwarded-Encrypted: i=1; AL+hErGJUjhTWo9KnH1fFh3klf4LrameebgceJFN7NlgXusIgZvBuyZOAWxjFj2MMCZg/3ZeklEZRiD4L8wT@vger.kernel.org
X-Gm-Message-State: APuU4Z8iYrJxCTTChS26z9z+c9eu3NYmJMeGyCXpvlBMFtuFU/3nPCXq
	f037gEMPcOdCJ9/3/wRrj18WzY9SVrBQcUXRxtzeyhyBjIlkdboSES1/W0b5E9wD8RiPvuMbvvX
	n3ezqWNC1HKBnegbis+xerFXBuYPTeot14EcuvM/3NL2VfJh2R0YzgBqR4BDDZILM
X-Gm-Gg: AZFdTZczbS14vYssRe6ZwJyS2t8qxKtPE4UHh23oj3nAUDmAcpVKZ5YdDR3LvjKO+I2
	TPRBu7Wjtow1v5Iq9RqR2Kqt5oKX6wW8ixvG71J6mY7mD6NA+Rt1IgBSAyWaNdXxbPwlBCxe4AD
	b0QqNR8UQWb6Kl1WZGJCQRJXzKk+BCyrjO2F/SBWwGMhPSzwlC3sD7RU7PVkbUJrhXWUU4fWQHC
	HEXqiLwvXyY9GcZ05jRlp2YN9ubsvXYj23hs0GvDZcN6vFfxwszaeRxERf3eE8e7168NICxp8Uj
	dkz5bCO5/8bPTRAnddYNJD7SPB6SNsDgGFcaZvwz3uz74NcJWe5yDBhKOmRv60ukex1+2cTMu48
	J55H4Mrz+A2MshEWwDEMPqgC7wm1uvwfb7KZjO7psKM3IxVet3KWlkX6nVoGXnlInfVTdbaizD4
	Z9hVkb695JeiD20CY1kIELpxK3YQ9UDlx823OGpNBqAkegv0ced4uLt1HGg+0LD+WK7tJC5mCuo
	Q==
X-Received: by 2002:a17:90b:1c8b:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b3d07a92ffmr1922926a91.49.1794989799343;
        Wed, 18 Nov 2026 00:16:39 -0800 (PST)
X-Received: by 2002:a17:90b:1c8b:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b3d07a92ffmr1922910a91.49.1794989798904;
        Wed, 18 Nov 2026 00:16:38 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:38 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:36 +0530
Subject: [PATCH ath-next v3 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
 QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-13-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-GUID: nMJRaOVFnChQi6TrObov_c4RVzaI_3Rj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX83T4VVz8kRXR
 R3SqHDEC5Xsg3iOjlSv6ij3EFVtiE6XjFgN9vqIkzGK+s0vHJ0cgxbwO8Pwsh/R4h2GnsIMLIWU
 9StLKAecWz0vbOTOLt4/2aNbYNBprd5xAUKTv/0HtBnd2OzNUYWoF491YHnG/jTmUAtVFB2k1oM
 zDM/AuKE2d9X2lk+Zc5Gl5hFDBaBnHCUnDtNp2BgQ3kIiXPdVTLhacuhBQVOMEje3Fvu656r+Ki
 k1W4bJCGkxR9JpT7clXylBsWPsaksgHDdWXHZYOTCe6DPBpatTObxklZHu+hl8OfGI3Oh8vykKk
 0ELkVo4vAgpVpc+iteFuQ7bISxyvberAPiTNJfFHr8tjTYV5X0BW9Cb1kixEhuJCofSCVtJBNY1
 TTZa8ijBTMiEw6VBwoYdCm6lIJLjLKz6oC6eRdxsSkzCLO/tp2v3sVXgXHpFymEbgTD1raTH2FT
 KPn005qDnbmLokZDw5w==
X-Proofpoint-ORIG-GUID: nMJRaOVFnChQi6TrObov_c4RVzaI_3Rj
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd5ee8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX1ignAdH8zZvD
 Ny9RwW9jBvFXDuYsw+/nduqFStqN/NsDV16CPUrqq8afDELT7dABD06t19zElYyLIuTqGiJK85r
 050A9DCroZMbUa+tqumQ8jcnluCo9jA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1

