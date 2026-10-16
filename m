Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5943B14D9
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120971; cv=none; b=a6AeNrk4fQ1pVZLq9xbjwzA5IKNLzperjil9euVUlh31k6ccezeMPONaTcmy1I7HONrQH3k+Ni+wcw+I5RPQf8dqUCXlkEIyvtf6unyLgqqt1gE/q4bUIh+MKRkPQdMLc/dSIi2ywI5c2PJexAF5wwy/HbmjFQbiMradlPbMT0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120971; c=relaxed/simple;
	bh=yH0gebSEKl8KMIfmCoNHM/L4KD4vVS1Ee4B4fbxGFUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GLex8nwKJSU8VMTq+wKV9M0c3CqKp748BGXFLXgpvP8let4UJtYs1S+7dXXdgDY2yzwZzqgECt/bw6Hdxewbim7pCDcIjPSKIbIqNw4Hu3w2MpwkXkBrHaSwpXR9ePZU3ectGHXdkp3I+cwA1UC+kqrlov9wFwmCcWswAV3yjqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcGTFCu6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eV80EgrW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcGTFCu6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eV80EgrW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNfwkT1635300
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=; b=RcGTFCu6BPSu7NSY
	RJRc/fN6LAyXuTUo2h952EGqCKLDvm1M22sotm2vrTdeEfL9dfUceZYW4vV6fNqH
	KBobJcO6tcPhBMZvF+ucPKaFjFCXwK9SxhLveeU3Rq7855Hn0NrXnM4y4CM9dA8p
	hAz95yNSEDmJCIuiXtvuX74VfFf97T+ztesWjLyfb504IQvdby4TGWGs4D3ZRJCB
	Gq2wX6Fe9FoJb7MYQcv1AuLibGAuDHuxrLsl+Fbh+v+1KtzJ31zhjFKEV/vJfHMQ
	YZTfUt6V15rbgn2N/tvoms8WByCtPxSbEIcWmHgHwCdrYsCC8pGHsyx2k92dkIsi
	I8LaMQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r10m3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so12130521eec.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120969; x=1792725769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=;
        b=eV80EgrWJ6FyKZWMBCkiVGt9L0MSiglar8EQbvNb07soUfz+gGuotGB7OIMGZHzZMW
         Z8KN3r94RSKZePro+viztx8U+VkxtQYYnD4w6bShILuPpmtPuUdsw0HZpEP11zFQqee5
         x+2vu34nZbHNmaMUt+/GpzthJGLYRx7cCdg/gYxluxTnjZjePj1bpDK9OEaJH67r9gQl
         fl3fTRkLKt4o8ZV/n+anbDRFsJQUp1V4a/QyIokJnoWbvwaIxKVDLiGCW0Kv//0QpBJo
         0U20Hr6OVZ/qPzb1tBraPwKNg9JIQhzgAqGToD3DEvetkrQy8K+Ys2dzxP7vqdDrZicA
         Lajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120969; x=1792725769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=;
        b=xoaAgiKkMZH9vTY0gAhcr0y9f/JJov5L2xn5Y9GJeeAz6/CTG0KguLcKg0LgfXORCS
         UdK5ALPsAR80LhOp1ncwut5pee3VQvlhnPbDolv8IwPMySjjoGrWiBNSWeRxLF4BxMe6
         YE6GyNoDfbNnQ67XGMCjzCK/MEhdsUen08meOZJgiarAJkazpX+xYw5v33Ai1FIOdaWc
         J1/p03vNhq3w1Ncn1XbtNlTBqoSvZA3ug0Dy8/YEygQpDxF10RAUcUbDDkd9hyfPc5EF
         mGzecjc2rc35+RstM/op/ap80vPTplaSwimAE6DJXFH8bWO7cX1EFpjXWbdvVEAiYXyx
         XfXw==
X-Forwarded-Encrypted: i=1; AKwUvBxG2O8sBiC84nD+KOKEQuZAwVvBgw6xacYBKU6JRFarUXZRF1QVyf1YIp9qmDlRiW+sIgNYtKPdm1r1@vger.kernel.org
X-Gm-Message-State: AFq9FYLEigEiePdSqd/+7KLvIpDtCziAAHXSLxb9zIFkRKNJ00zksDLm
	6YumOBqBl6Y9f5SaHcTLyQ9NXiV2BGY0JeKKWS1CLfx0DV7oDmMjnneUzPIw6Y22slqS3uOelqi
	MXSix0UOR3iuy4C3v3/QwLdAZ/CjzLWRBplg7pLjNA4Rn4rlwum8gOwLHbQ2PZlq7
X-Gm-Gg: AYBFou3pKtQsbtUcIvucIGDFgXoBTRQ0P89qr9gPFuGt1nPkYRx13kYq+PptxeL9Uqm
	auzZgSyLtNzmeS1ThxKHtIY/MFpcHy2JKdU/rvIaUNqjUIhTHHYy5aAIf31Pt/WLe5Y053PRHVh
	ez/p0r1HPIUD7TuMaJUS7N6inO+GnnTe7zLUuI+rJDbWR9sksAFMYoODNw3RAWqJeKUq6ZhUrlQ
	ANcMI4LnlWJQ/+GK/vxdSYlmSlIkL0oEsGsvmSg6roIR1Q9HYNi215E4l7Fj1KuTvbIburM6vWo
	YZBrXp/jd9Y2l8JK//PqWlInC/ZbJ4nB/4J1Fqf/GBI87Z/RcaWRJkQmsThcaGp2hxKRgqydssK
	wvVoXF8uSKHkc1ubgKo7tLKTi4nD8f/AYUeph9iAUwcyK+ZAWqts2x7AnHCXab017LIU8zqZKNV
	AVANvyvBHLUHbBHJu41ivLpA==
X-Received: by 2002:a05:7300:cc14:b0:353:7b68:4f6e with SMTP id 5a478bee46e88-3537e03ce89mr37864258eec.12.1792120968848;
        Thu, 15 Oct 2026 20:22:48 -0700 (PDT)
X-Received: by 2002:a05:7300:cc14:b0:353:7b68:4f6e with SMTP id 5a478bee46e88-3537e03ce89mr37864218eec.12.1792120968280;
        Thu, 15 Oct 2026 20:22:48 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:48 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:50 +0530
Subject: [PATCH ath-next v2 13/17] wifi: ath12k: use CMEM write for PPT on
 hybrid bus devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-13-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: gPDb6giLCvEVKLufZIN3a4cSwDNbPAtm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX5DQzpS+gruTA
 7sIXHE0Fhp59yArAmYQt86/QS1Sf8YPaoBnFky5JaMIG19L651ltF3XPn/ywAoz8GOmJjuv4Jix
 lFCUmD4pFuUiRdjnDeqPQWEa9kiwjTo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX0qluIewgpUeH
 FFzJ8YK3ujVhKJkdzG9N0lu9lCz7E45Swi4S2lrpw0NoRmQkwtE8dnYPVpbr2JB5oNqzXP+7hdH
 N1eJQY+qlwKe95WNEzobf69MQ/eDlTNtQ/g0YwIjXkbSFQImLIIQRn0JWehLiw7EeaFqjhQoo5I
 Kglm9uqHpd1qC37tW8L69QRfnFS5k2AkpDExR3kxrPlPC/WBucSp+GTLymWhtJ6pFb/k548NPgC
 XayaYhmBvnZZYrqn59V/CoBj31ljsLTwypQtuyisRv71IsbO0YTZJWJqH8AiOwkOoMjW9sxwUzB
 r1x1u+3i1tHsBms9L51bAuPfG0IuM9RN/jFCG6tjDsUpmW9CHjUFLA75Lvv1BhBP4dJmz+Xj028
 vNAZ8j20Mn1jRBTr8IcVl5uSOSjAZViKkKIlpWsuPYWa6w6UUEKTNsbTZMx7kT2k+u3zgBkjSyw
 PwPVFF7UROUZ9af6qqg==
X-Proofpoint-GUID: gPDb6giLCvEVKLufZIN3a4cSwDNbPAtm
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad19889 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HzkBA2_z9QidxsSae0AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

Use CMEM-specific write operations for Primary Page Table (PPT)
initialization on hybrid bus devices, which require special CMEM
access handling.

Propagate errors from CMEM writes during PPT initialization and
partner copy cache initialization. Abort MLO setup and perform
teardown if partner copy cache initialization fails.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  7 +++++--
 drivers/net/wireless/ath/ath12k/dp.c   | 30 ++++++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp.h   |  2 +-
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index d2ce01e0d7ac..cd0aa24848d9 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1174,8 +1174,11 @@ static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < ag->num_devices; i++)
-		ath12k_dp_partner_cc_init(ag->ab[i]);
+	for (i = 0; i < ag->num_devices; i++) {
+		ret = ath12k_dp_partner_cc_init(ag->ab[i]);
+		if (ret)
+			goto err_mlo_teardown;
+	}
 
 	ret = ath12k_mac_mlo_ready(ag);
 	if (ret)
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83f9edfabf69..6cf254b2d2a7 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1307,8 +1307,8 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 			       enum ath12k_dp_desc_type type)
 {
 	const struct ath12k_dp_profile_params *dp_params = &ab->profile_param->dp_params;
-	u32 cmem_base;
-	int i, start, end;
+	u32 cmem_base, val, addr;
+	int i, start, end, ret;
 
 	cmem_base = ab->qmi.dev_mem[ATH12K_QMI_DEVMEM_CMEM_INDEX].start;
 
@@ -1328,24 +1328,38 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 	}
 
 	/* Write to PPT in CMEM */
-	for (i = start; i < end; i++)
-		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
-				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
+	for (i = start; i < end; i++) {
+		addr = cmem_base + ATH12K_PPT_ADDR_OFFSET(i);
+		val = dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET;
+
+		if (ab->hw_params->hybrid_bus_type) {
+			ret = ath12k_hif_cmem_write32(ab, addr, val);
+			if (ret)
+				return ret;
+		} else {
+			ath12k_hif_write32(ab, addr, val);
+		}
+	}
 
 	return 0;
 }
 
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab)
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ab->ag;
-	int i;
+	int i, ret;
 
 	for (i = 0; i < ag->num_devices; i++) {
 		if (ag->ab[i] == ab)
 			continue;
 
-		ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]), ATH12K_DP_RX_DESC);
+		ret = ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]),
+					  ATH12K_DP_RX_DESC);
+		if (ret)
+			return ret;
 	}
+
+	return 0;
 }
 
 static u32 ath12k_dp_get_num_spt_pages(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 108e27dd5797..5e9cdf72670f 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -737,7 +737,7 @@ ath12k_dp_rxdma_buf_ring_size(const struct ath12k_dp_profile_params *p)
 }
 
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
 void ath12k_dp_pdev_pre_alloc(struct ath12k *ar);
 void ath12k_dp_pdev_free(struct ath12k_base *ab);

-- 
2.34.1

