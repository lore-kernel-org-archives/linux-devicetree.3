Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6249B49552C
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455114; cv=none; b=NJTO6vFgPXMGP4s+pWng3n+f37MRLemWnK23rfCOSWmsU/OErRwaEFmtKSqjIbZW21DZingybvkiQX46U6gDF9/yN05DEJR/X27MJ6yhHz1OxClnjrOyJCBosfvpZ0fe2XxWINvNpKg3rmx3mHbKEz4N5OQpr32NjLC7rqAarGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455114; c=relaxed/simple;
	bh=JVDEnc6W/nlFzh2DR6tx5iRhgEzlxJ0zGLIfzPMjx6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HuDTSzqC0xdrpWSKSbLFHyuYHZVhdnEqMuKwpuSVRSK9ISs1ukKru0y3Rt9qwZtRD2uFron0fChN2xNqqPFPVH8T13wgkWo9M6D9rPGOvgNu9F4dB9UYYjsOmQJSNU7hCUfq6OuYJUVqcixIdCMWHk/TIQd7I4JDCH0x26KA9xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WY6Pfn/0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfduoUxp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WY6Pfn/0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfduoUxp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KPTM2167115
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 10:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngNckdozDSqu9shJTPGYVZ5aTGzTKRVmfGVeYRVpnzw=; b=WY6Pfn/0VtHVQSd4
	HSsygYMOlACdEpl2Yk8BtYF9QnbiDvPgFKV/3Wca1RoTJufr7kbGkGJ9lEnJaNm6
	w0LJP7QxQwEEPpDE2PwYjX2VLJzYIZhGR1cVNF+uM2aOEs3Cfw6dh+zuCI0hJAe2
	mzOtTT6K+GT0l3oIXqubsT12OaL+bJxGGv8QcpwAzijxPhHBbacO/CsixpxfbjMR
	3eYaj1IWUMnc5kZx0aXQGZL26X8cZdTvP0H9kXi3DwdWFhEBJCHdQTDcZ6mrLjsq
	25duVrjgV6toHkHAX+ATzi2sxddRZ2wttpYe1/+Rv9QAA63QR+FHqmSIDtAV/2JF
	BxMEgw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tj80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 10:25:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e767948f7cso10912465ad.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455111; x=1792059911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngNckdozDSqu9shJTPGYVZ5aTGzTKRVmfGVeYRVpnzw=;
        b=XfduoUxp9Dux9kj+HEHnJcGK7iF3L6c7dDipOl+azhk56Wjd+GUzPFG4JaNHDKAPEN
         OnkRhhiXhbnGlCJig//cFbA7DNj+sZlRaxFQ55HQc+mZ7m1qXJrg11un3bou7bCkSwjo
         pw/PUDNJ+0JeTi95QczIbzf7sRoLEawX7HUJPRP13JzQpdrKJLUN+vtYXYgq9KmIrO6o
         yCqUjiFgwYjd7Paei4c5c9p1yQte+dj31GjPEP8gPyt6z+O1KWZyx5taTfkrVaTcsznW
         mr2OY0ZPRTo4u4OazOl+TX72VQ9RanP2JAiodUWUGn7VwjbredZHWj+DUftUlP73b+Ja
         r6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455111; x=1792059911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngNckdozDSqu9shJTPGYVZ5aTGzTKRVmfGVeYRVpnzw=;
        b=2eZiVyRvxFl7gaDZzv329Tfdel9HjQ5QQp8AEWQFAxU1JkaYETXD/LyzmR1GKUTyij
         sKdrTz0T6i/Q80cGSYJN+ZgB4x0zu3Z9I0JePCdnzOUZzHaS6mc5H7baUbjjCgEZksBW
         XjHsMHOI4ZzIPIRB7DFBQPp4wWafhBPs2YGE9h5+4RPTR5Gy/xHRrVdZy6uiLGGv3f+W
         bLp2gh4QfEJtd3TVDfOUUHVp9q/0zeF2Q1AgOox7+bH5+Xj02JyjAN3GgPVcbJpMKwbc
         URUagJyApdzbkZsoGQinENHDlFDCNuiXLMXJdmPqtLu+oFO0g4O779oYpij4SxBFMvi6
         gbnw==
X-Forwarded-Encrypted: i=1; AKwUvBy+cJklgR0dUTED+4bW6INM5beEgsEx3H0Kd0QUFIl1RoN3poYJ53wtWEiYnwMdOtD6WDp1+0LJPB30@vger.kernel.org
X-Gm-Message-State: AFq9FYJlo7WqEHdvXHWb7Bi3W1tKCD8MxUzhsT9LWbE7V+g9WduA1grX
	1+Vdzdazi45y4mR0lym+sSb80HS7O4Unp8ZJKSxztbwafd+rfTDByjZAnE8pAp2cIt+OstWHU6R
	LWA3t4Acn+t52rwIt7EXmwYmtjzjTvFt7OOc2H7EJhtJrmL7KrUbnaQ/7z+J6gbf2
X-Gm-Gg: AYBFou0IvUcRz8gcd2Bwz0LLA16J/fICC/oVLLSksLWMSDiY87HNjuUIPnIP9nYM+7h
	J72HHRKqSWpgP4MsMJqvawuxFWEakUJq0BCOznhbdnpPVF+3FxXYKx4r9F9YuIBhMSNC/mqpa9V
	lqIbF5vCCcSOjFAst8D75aQ11SKyf8p7FEnFpKK3k3y3tUZBv9CV4NeA63XfONZko0EfZJTgpj0
	UYg8KAL2K4cL6Rk22eOaaaYFxkzzOkl0Ma/ZuyVLgZ6CV1zkBSPJbH2ZsOMxAhcFTqKNbjjYC8I
	m8DKy7xWSXqu93kedwy4tY9PgyK3KPBQWyyUxN3+BweWM1P9vmbmg2zaFDBNP5FeywoWZRE7YKb
	b18yLvHUyflLStKKjV7bZg+ovDo3bRVbwG7fdYaGIb7JgONV6aqGDY+rS+xAcwn72kXRJGUwR2r
	h3tiNgSIrLnTgQaQy3xuW3uA==
X-Received: by 2002:a17:903:2b0b:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2e6003c0633mr43801705ad.31.1791455111180;
        Thu, 08 Oct 2026 03:25:11 -0700 (PDT)
X-Received: by 2002:a17:903:2b0b:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2e6003c0633mr43801505ad.31.1791455110634;
        Thu, 08 Oct 2026 03:25:10 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:10 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:09 +0530
Subject: [PATCH ath-next 13/17] wifi: ath12k: use CMEM write for PPT on
 hybrid bus devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-13-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac76f88 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HzkBA2_z9QidxsSae0AA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: QVrDk9oe4XLUfi2fPZIaEshqz3i-ETRZ
X-Proofpoint-ORIG-GUID: QVrDk9oe4XLUfi2fPZIaEshqz3i-ETRZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXzMwhrQCxPpGp
 gMozyUZJ12ciETumFsWVl14a7f9Oa1zK3RZpv3YqPy007GCw2VCSmtVNOLgi88NGeQjPC/mIiiy
 DnPssE3xm80Y7jSXmQOxmGXOQ2j9qEw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX3fw5KwL+q/DD
 YJ2tbZJC1xKkMSGHIsCr5sBXjrftgbfu2rO44neK20YD/2rI2G/vV9IcuFKgVNH1ZrbTtY5m1R0
 it1a5pX7zQWjSKAzDq/9VMFH6ZzJJM6N3lkuNsx5/JjI/ugSRw3qA0I5e35wUxNG94k8Q4SDUi8
 e4Zs9nt5nDsqNMhb2knkxvuifcvtojsoKUG8BNFLd11opl+TNG28IBpEo7IyrNVrCIGHgVb9M1x
 nlxyhvhIelq4vrijo69L6kQPSrBfGtWSw3o5EyqMcmv2R2+fvKkyieOK9gVO4xGN+F8QkaMO8vw
 SJfXstM/bkj7pGSu94lS2q1LVGHQ3md6akQd0WF+qO5wh81+/lp8i1EbdW8ECP2MqoW/QbwS2gJ
 o3gJsO5Y86FqB4jydm+TzPRGncDDC4ZrWR3IzyssxBI5ZslCxz8ME0ChsaVKyCXCOxoBXuU5scz
 qbSxI1ajCMzxVwNaUjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

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
index cc1c31e216bb..e9caa9216f77 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1140,8 +1140,11 @@ static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
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
index c53eac20b989..b3a00e7dbf56 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -731,7 +731,7 @@ ath12k_dp_rx_release_ring_size(const struct ath12k_dp_profile_params *p)
 }
 
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
 void ath12k_dp_pdev_pre_alloc(struct ath12k *ar);
 void ath12k_dp_pdev_free(struct ath12k_base *ab);

-- 
2.34.1

