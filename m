Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43A93B42C9
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120976; cv=none; b=fW72ArQPIaC4s4gplI/jrTXgs0LXDEB9oCj+CaonvsEDDHH1aDz9A1NhuH9C2DOgCta+XcqrvILarOEs7yi55M/WWUrnbBEvtZMeEt6CNMoQ7618CAJiWcpZQYA/ClAidIQ11YvSnQZ5Sroe2MRNS64Ho7K0D9YoyLJJZ23Xyj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120976; c=relaxed/simple;
	bh=5GtUpasBb7+e1V5vQfs1cJLRArknloYK0iYT1nRYXHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLbc2dVcnPAjceC/eFiSQfQW7A/Di0ys1D+Op+VHAkJrlsyUwa9p4KtVK/XaVraUJsLsWFt8v+ZpfvaWx2Jf64ao6O6xXdefbYsh8tyDTSBtedqfyuYCr0ALBP45zrp7pR3VvNkE8gIXoWRSG5c0zWlKMi3LJT24NaoRvvwY9Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHS9v6IB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TM9hVniX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHS9v6IB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TM9hVniX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G204oC3202312
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=; b=AHS9v6IB3IaQ0++Y
	4FgCfLf00lSxGcC3jhJHfnIaW77kMAPBb7tM9qAl/JCfX8JGCH3tVg5Ojl+OrAVZ
	5ZVzXaWh9xv7Yv2rqc9hOiGH6tta/9D16gluQM7W4aLS8Z4NcttjSxljaEny4Q4P
	YmJ7h3zFkU80BJuB7jB3T7xFhz7sZQW+kNJKEQnrhuFN2QxfEvuZ5bJJgKtZGn1v
	OGhRibPRXQBYF2O8UzNjlBlqsgZoaeRPzj/vJfaDjjOElFLAMqgBRycUr1W/Oqmu
	RLvZS08WKxEmxADSf6H0BHoMz6QvEqdNBQQ+8iu+dUbXwk/fkp03HYUPHj+GDz5Z
	PUfiJg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r39u24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso6045223eec.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120974; x=1792725774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=;
        b=TM9hVniX/FJjrUjZOk7cIgwkXgur9kVHo2uBvt0BXalx1DXBjhVbqizlzB4JnnsG2q
         lot70uh7v7oBnDoIGD2iBnBXqWUQhOfS/ovbzq8Z4AZLPO45y/d72usPJ5nGS5wBHkqZ
         RRPshdLi9uKTTdCJ8YEJVGBwFCAbm5Brlvgg+9xdRH0+7XvoX0hoVRx5OqzH2dIBrL4W
         4TcldlmA8BN7JtGua6i+LdJWNVvkoePN+m+IrIi9mT2LFqBwtR08VfV1yY609MQfMImK
         jJwvSHOsE+GXa8SFKapuNIz7pe5u55G1Zf48xXZdBi67oBPunHtZPWiaAZllboquN59V
         5/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120974; x=1792725774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=;
        b=AB9dQyESPnfpzigitSNQUgHw+ngB3R8SCKTJSzEOOXoBqb7Yp7/PNVaNZRIW6JcO4A
         XGrnqh2DT5tOG//DYGZdNpKKzGoBu7fUkJtaS8S25u6ZZPv95HBGGT9JAfpMEvBxvLYY
         biqUDHzAhg84BkGAUyPcPhd4t0ooXyCw6uEdA8Qn6F2BJQ2t8vBL7PWHo7xs1NAnKAEZ
         FmNrkBeXI+YkvUkuIA3PvgbHGE7xvnpp3K4yzTcJ+kJgIdTvHfPcHOk/zFWtkl/aUbY3
         uLY041VGGB/Q4y/FRsVcexQIpGvCcQejczY62dkfMQTR7gkt3Bgsc6JiDvHx1KJ2+vsM
         TUaA==
X-Forwarded-Encrypted: i=1; AKwUvByvQRfAyRAFoxYWNyocb2s2FCsV9JRBPaIVhjTT2R0FggZv3JfZE9eBqdfEnhR2OhiG9fZ4AOoFZfxp@vger.kernel.org
X-Gm-Message-State: AFq9FYLI+IVNvX4+hCHslZoIGILydFT43iqMygmd8d+O78ccCCqYKtJS
	CTMCE5PdxSxHR+xIawj7QILKoyaaPkW4n2E2/KNFCeFD3UAeu2y7YAxYqoHN7wc0LDW18du+Leg
	HsPkVD2624C9zu8xwf3u0JDV7cAYJLEPpCax//5nKiPqlwgwEBtjuTgI4nKCs3Uby
X-Gm-Gg: AYBFou0htrDu9gOuAIWLLbVz9bMLWu4KwKQyByOqK4Lf90HHzJwI8/8ezcf2Cpk+v5H
	wAmmTC2vZqvhXchVfPEFnGBo1OnKrVsRBAEPiHbgwp+B9Z10PeymQvFFO/PFESvxi1YF6er9tgB
	WPol2+aFdYivlz9wpYREnw9wTZ9kf6VVXjI0d/0d2I0sueNjhoSc7o0Dm+uvzRFsZ6gnyADDtuY
	OYHmv/I86UV90Kkh3ARIIOZac9KfufFP+elwIyk8xY0xFnABslp3w7gn2m/ccx2uq5XsH9qhXEC
	Ei1HVK893hKTHVpr+X+PgdVG0MNim5zNE8oNrPbWJ/H0N5jJ5Gzd+c4CGbWxqdDo6nzQvXlLCWx
	oU6QT6OMHIgUJyHI/y7U33z7FYlaYShZAE3nBOPcchjYhJW3mRJh6/KHlaJFj9EkXjkhVnqx5XK
	2JGo6UQbi7Z2zrndydjLnPJg==
X-Received: by 2002:a05:693c:821a:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-35c813a23b6mr14072753eec.18.1792120973528;
        Thu, 15 Oct 2026 20:22:53 -0700 (PDT)
X-Received: by 2002:a05:693c:821a:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-35c813a23b6mr14072720eec.18.1792120972992;
        Thu, 15 Oct 2026 20:22:52 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:52 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:51 +0530
Subject: [PATCH ath-next v2 14/17] wifi: ath12k: store and use MSI data per
 CE and DP interrupt group for QCN6432
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-14-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXwlwlpNLnxXNX
 aFIjS+3zLaNFYcwy/Scaq/dEwIABXrDdhu0Efv2Xku8StQy40QPRFb8TWebsiNs0pCaIKvUpXgW
 MRAG+F6UOeQ/5EveZgtUD9+YvPM3e2ncpJ8ZU2svGvvJgAWxOzaoFddiNLcHJNw8FdaL22CjiXv
 8ZT9tZWqV720s36C90uI3O9UOYU9qD//lgL+5awf+uNUNhRnwWad7kAqgL77N66jQQRkIzQyrqY
 N/dayuSRSXnIiCpADBbaDa/EGzJTVFcbyfRD7J07GLLq64+HaiCVe+CQw/ht2U6GVmWZE2GzwPh
 e/d5myuFYZwumIUyRmQQznZgaxiTj22m2NkwTW0gtzz5MmwfzXxNJpqSQKF68HkCdFVZcrolOrI
 BT0Q1ij+y9X60SlYUtABiqTfrLEoP4xx+6x6wX6QLmMV3KWlOD9Blr0B9pvABXUVK+rKwEJzLDe
 6b9FA82akuLFK8m6r8Q==
X-Proofpoint-GUID: vg3WEpKa7MDdzCJzqjDMKcvL_8G6ri-I
X-Proofpoint-ORIG-GUID: vg3WEpKa7MDdzCJzqjDMKcvL_8G6ri-I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX9Mcz6oJL2QYj
 CHsNVcGKsciWK2ipB/Rri6PJzzJMrrivEDseOviIld9b1llkwMFd2nPpYRybyKHUaK4gUtsDSCt
 uhZ4HwEJc63VjfFCvv1uYhjhTBcfJNY=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1988e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JOiqKhmsGJDeROXOrEsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Store MSI data values for each interrupt vector during configuration
and use them for ring setup on hybrid devices. Hybrid devices require
explicit MSI data values rather than calculated offsets.

Add ce_msi_data and dp_msi_data arrays to store values captured from
MSI descriptors. Use stored values for ring configuration on QCN6432,
ensuring hardware uses exact platform MSI allocated values.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Co-developed-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.c   | 7 ++++++-
 drivers/net/wireless/ath/ath12k/core.h | 2 ++
 drivers/net/wireless/ath/ath12k/dp.c   | 9 +++++++--
 drivers/net/wireless/ath/ath12k/pcic.c | 2 ++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index c99e915e3885..cc8ed8451a2f 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -270,7 +270,12 @@ static void ath12k_ce_srng_msi_ring_params_setup(struct ath12k_base *ab, u32 ce_
 
 	ring_params->msi_addr = addr_lo;
 	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
-	ring_params->msi_data = (msi_data_idx % msi_data_count) + msi_data_start;
+
+	if (ab->hw_params->hybrid_bus_type)
+		ring_params->msi_data = ab->msi.ce_msi_data[ce_id];
+	else
+		ring_params->msi_data = (msi_data_idx % msi_data_count) + msi_data_start;
+
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index bbbde9f05ea9..575139555dd7 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1172,6 +1172,8 @@ struct ath12k_base {
 		u32 ep_base_data;
 		u32 addr_lo;
 		u32 addr_hi;
+		u32 ce_msi_data[CE_COUNT_MAX];
+		u32 dp_msi_data[ATH12K_EXT_IRQ_GRP_NUM_MAX];
 	} msi;
 
 	/* must be last */
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 6cf254b2d2a7..0f0800388935 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -225,8 +225,13 @@ static void ath12k_dp_srng_msi_setup(struct ath12k_base *ab,
 
 	ring_params->msi_addr = addr_lo;
 	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
-	ring_params->msi_data = (msi_group_number % msi_data_count)
-		+ msi_data_start;
+
+	if (ab->hw_params->hybrid_bus_type)
+		ring_params->msi_data = ab->msi.dp_msi_data[msi_group_number];
+	else
+		ring_params->msi_data = (msi_group_number % msi_data_count)
+			+ msi_data_start;
+
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index 13097cdf2794..b6d306fd3b99 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -275,6 +275,7 @@ static int ath12k_pcic_ext_irq_config(struct ath12k_base *ab,
 			}
 
 			ab->irq_num[irq_idx] = desc->irq;
+			ab->msi.dp_msi_data[i] = desc->msg.data;
 			disable_irq_nosync(ab->irq_num[irq_idx]);
 		}
 
@@ -318,6 +319,7 @@ static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
 		}
 
 		ab->irq_num[irq_idx] = desc->irq;
+		ab->msi.ce_msi_data[i] = desc->msg.data;
 		ath12k_pcic_ce_irq_disable(ab, i);
 		vec_idx = (vec_idx + 1) % num_msi;
 

-- 
2.34.1

