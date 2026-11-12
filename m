Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472416;
	b=dBKbFpmNrsFp/5HsqnHIBSMpm/Gy0zdR3mtK+4e1pQZdimJ1l52Gal5O0wuVMq9GdiZb
	 Cz1rljFJsZ9a9wCxBo0U+aqc6gaNT4KxtK9T6XY9Xb9vGbJFx8pJ2pgd63vxeeKkcxsgt
	 tmjkIFcotXh5gfVT+vX7Yfvj3xUIBQ793jFBqy2KMkuF8cr2lth/BkMYgLmpqBr3d0X80
	 0aVEOFOulcVBzdH2n5Tj+u/iF+KRnlt7j6tUMZIFjnmC0oeBQqACjSH6TB5zE7rI72Z7U
	 4STyHtEXiV2QLWEtw2sr0JIxHToP9WCIDFYuQ9tshJSDhEZFjGIqsi415G3OeMxiqRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=IZL6nHdeOzqweuPcvX5bppHXBhvC6AG7aIm/80mg6n98U5IpyHdXEons+GXgkSOZNYzp
	 VktQ5DvIXlyYxKQ5VWsK72EJ6ejwIA8D2mXn4UPw9CF8kDxmd+ysc/C7K6UZ74mELcRtV
	 4Nz3yYZvGca74M1Ub/P7aUgLFgPUoOZwvnfqtgnr8762n6d7C0egyFim6bz4hVqpzU5YF
	 X7HdwOuQMAz8Qt79puR7h01E0PTe3UREVF+6QZaFQdTjuqIuC1O7a2msAP9Bq5ps6YajJ
	 S3na7vt3cRJCtheY3JH1fdZAjNDlaeyNZg7Ng4+p+t0ooMc2eHn1BxzEo9pz8KMvixg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWriODnm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI+7ZvcM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63796606A8B4
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63796606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWriODnm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI+7ZvcM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4m88X3893521
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=SWriODnmPpc/SBBi
	0q6R/aCwq/KQ2bAtKHOgUHD4F81ZtbBCe/1K8PSBm6gtQoOebum03cNuH0DXtNX4
	f5/ATLZ+MmMCYJZgtUn2FWwQ3enjBvucPWgQq4c/eqjNoec0QHrclkcx98GrmCIb
	jtpDFLfKC8CmkalpgileOhawn9axF+crHcwcRwOOSJTfuMHeeG2gMS4ooj/KnErM
	TtSxsxgIAQY0q8J2dFQBDdYMZCjjgMLdIjhScdAoU9FxUeZzaRnPt9qlXEnMH/PU
	7eVa7a5EaFthpT14BwLQoQoWU4A5B9WICjbl4S4HG65n7Kp3OVOthMNZTSujrh78
	10LFnw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re0r7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:33:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed2c307e62so60597815ad.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472415; x=1795077215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=JI+7ZvcMbrotnbi9fsaRXZ7EF0p5HDVgam4Z62NnS3U1fLg1UFs6R/XnhVZ+Ws/s0P
         fvDTGTjVIaDdSZTiVT7o5FmmAUv6MNHaj6KWLIjFHo7RbiqAS+bzVTpTjp+B0xqIzt/k
         epoi8kmSVQLKbmuYRFvB/j6xf1pYbXmyTqRzvyqLIvSK3xWea4ooq+qI0mMP5hVKf5H5
         4+x5l6p7FuzU8E2z1CJMP12CpaeZ/7meHEVvSxyoxYzqBtturPtvoG3jMHpcIVY50IJ0
         B1a2D/fJtKBQCPl0weYDYXwvloox5HFzfws7tTSlmpyIgoJDQFsILiyZkElRSzvAKAlA
         7TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472415; x=1795077215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=cFB8z0BHsxC+EbN2NVN792SfJajIn+QXFZ6Tb2z0+ICXTTv6CaStzdNrc6qPsoD27s
         TCWwNBSm1brAybo1en3awDCknyJKPG7VL+SH9YPXBt88DPSZpgOUUGXvyESRiytQV8vD
         2850t+3QdaR8X9NEXNp80+PvTP5XIGIRCuqYZQ3gPtTT5pIkyfTLND5Z9HN8TLw5dsUl
         WdVZSCfshch08rmmbHDyyifVt0w430JaoDAfjpQqyyJUKrRg4QZZhKj4UUrQdWYRIF84
         J+NZ/dcGKEBrq1MEDLYDcPemtR7BoIN66mFq2bzVtTNCyOzyInZSr+qb35OsMejzTJdQ
         Rskg==
X-Forwarded-Encrypted: i=1; AL+hErGRRVcRAIuSsShhmxNL3zcAC2krxSiSx9HdrI3/kyjrwCfWSbgLceC/kUcdB4ydEDgNvrQEPi85zVMv@vger.kernel.org
X-Gm-Message-State: APuU4Z8C3m1XtUiR8608mYrvBHPXehYFNTjZJT0lVmpOPtlwYNz9wYmp
	c6JfU5aAHZvboNJOtyb8p2q3xkjO3ryRZz8HiOZyECdGwcqaTm4QC2eOFMLIa9bmDDFmlnyCyFu
	AG8LMdKa9Pm15wR1UZmgbxpvTL7/yQMXcp+rDqoKdPniWUU4lkaaelsntIfiBLxY2
X-Gm-Gg: AYBFou2DSFFeml4RZ4NoxKapswjenF0pQKLPN5wk6LvtWcoG/nUSsDNmBs1sWTkVQMI
	euVEyhMSh1vPhwQ+0nNb76ts4bUWtqXTYNbLKKohf4lt/M02qXzpGqdPqkEQo2RWUeSMt1Y3Ug+
	8wBIfwy99JaFDoF3u0NKGIpUu/edOnCpdJ5NEpHVrxw20N4ujiEcky0WB8mPeJ8EAI7dPOtDyJH
	4wPukRSnzV3GJ9tX4CrsnHX7F18nCDsAUl0lNEugKYffSyi6zk/3IakJWGDN9Y5FTxmZFE6thvG
	MQhuXTzjIt0jJ+aDWmwFVWoHbFALQhwH81BLXdyKEHMbvnZ1vF+NfFVBX8aJx2iEFz2BAxrds2x
	RF4W06uxMZH1AQYi2cazVdXLNclofmUoOsjARH+Jbuw/Lbs2Gt7+nwPGWbcX5zubJfCVib1OZMe
	RzycdAjyaCTQ+tPwkeUTPvTvxD3XcioGI8MbuzNRPIayu/Fp8zkBmJaCCaE+0s1udkpHc4g8Jsu
	Q==
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4554129a91.43.1794472414976;
        Thu, 12 Nov 2026 00:33:34 -0800 (PST)
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4554086a91.43.1794472414096;
        Thu, 12 Nov 2026 00:33:34 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:33 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:27 +0530
Subject: [PATCH ath-next 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-13-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 98xNevJ1DVsJjnFIQjmWAQBP_nbpqyYn
X-Proofpoint-GUID: 98xNevJ1DVsJjnFIQjmWAQBP_nbpqyYn
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af579df cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXybEC1MHd0EhJ
 kKDdfah1FUcYzMnjyG4RMLObI6Lv5QMdxOcKyD/8MgHEhwDE+eInKu0sv/Em59uceOvY7GABL+x
 xFckl8JnJc3rhPMLLsDHNZymyYj+aOw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXwcroxg/YednJ
 R4JwSGHB+J39ipIPWfrCVgx8UDILgh9I/x7NG8QAeLcR952hRuppsN3j+b5EGO+bB10DYufQJQm
 wjOs975xQT26BugtQPDKvgZ2bqeHtgOT8j0jRGRXn+hooKHNSZ+W9fSb5nNYCfXExBgl/iecwIQ
 Z0XlR0ybbTebQtVrO+m8ao+qeALSQ4CxG9GPwvuEosASXTByVLQpwd5MjLZ9IwJtKrMEGUPOke5
 6Ks+5JZJY8YHYcrdPdmRWqMZHzTT9j3njKcZRIZ9L0pj18tu5TXyEurym/UKcJ3JTU8HckTHRRu
 QYGQa+BSNODanfxIBe8Ufgpu91fYXwap1rDlJu5JjficZb2NaGavBixggX6JnTzNtZvtE/VChhX
 sfnXZ17vYbm448DkDGRU9kWf3iUYdAIJlFggJgXIAAIJFxMdTYDJcOvFcBXD+hcIUqqqzLzqEiz
 F2blw8pQuPeCOrVt+gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

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

