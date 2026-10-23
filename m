Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738937;
	b=Yt+EWyWdp4+hPumtERH11uV4Tsbd4Yswr4Yokje1tdxWdLRjoUCcUS20QM1OpVwbWPmd
	 LJKVK6jS/UII0X5ncZ6Foec+8TnfeXwYqWpC1Cyq3UoAY8AoabMYmJrfmg6itCA+OV30C
	 m3PXJVu344lO6PEbBGr12XnNk0FlaFAGkMG5Ix3CNdNkWLHGGvi2lFfVfm/lvJyazYP4N
	 R4dbiqPxFHU87APGsuhWr1f/vCF1/GcJAIsPnmCJStavBSPFMFkSiZCSrXHX7u39/kj0f
	 yHf5TBM3OlcrYUjEf6aVtbUQrMT7T3RmE62CIRNqDLpumN9Dax0an9UtmtESv0EpO2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=;
	b=mX+uYn7V9dp+i0oLBp6bhT2QbxBYm7Lm1tjtB8vNjphvLnjNqiMtGrfAJVt1sKyg/hIm
	 CMFUl9nSO0lW06QM6IvJet8c5uvPhg1dn7zaazjZHqgLjTXX1J9tAk4UhjQ5p2e25Lfaq
	 ZJfAISqR4xTqo5XBQol+22m4CzrLYsbBqYgKyo6mby8Dt6HwKbscR8Rzw32J05YoNvB0U
	 a1SspENrAzy9H+Hz3RESuL6TirfMb5X4EahU5957/hoSVcuGkJc/Ey8BX9E1x9w2b/phc
	 cIKpP9z1OSIhCKrrRN8TvyDh5j20Y7ihvPYvp/NSQi76vmyk6ZylZnjeBX+psKzFeFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKk0c5K9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W/PKEIU1";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93365606AC95
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93365606AC95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKk0c5K9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W/PKEIU1
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FEoQ1792477
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=; b=oKk0c5K9CTS6MWcB
	uGpmgNrpK2ZpAp8fPf0KP0nt/WdcO8gBvQ+jdVWHV3aRAKiRDqJedfa30en8I4tZ
	VPx8KrSw4ywMU1rxLf2EGmHA7KzhTgCwGO9ens/U96SDXq7rz/SC+xJ9ewhHBac2
	YtGR2OfA8stWhXFzKG197MXVZhb8zCU1Bzr7QRpz5bdf6wRaeSpRC42A9lDZrKTc
	dz7926Y2pTTbchPOax79XU3QvGfJtef+As0fgZjUExC88RVGt0tsgFQDOb5wPXId
	BN8SAMDRcx792542lgG0dDjFS+MaCcooUKyI/cX9ocSxMEHaIpTI32Nin22VKclA
	DWKgmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0jwj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8e16d22d8so9435235ad.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738935; x=1793343735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=;
        b=W/PKEIU1LedZt3ea+MJbuG6AcUZtEfDP3sD3o9uoNZ32PQrUTQuzw8Ea4fPYAvI7rU
         4R3TPGhkEbNvepHeC8JkG+/lnj2z27cIv/CN0d2KZMP32ySnobfxIDPtyyIW7OXEQJMm
         tITxgvX41/s9nnGVVZR67iYCTbkv5c4CQLKoM7OCoI/mCiYn4A01Yu9NR22n4td6u26h
         PJLWP186FWuYAqj2XWUWt9CFQydwCh2ADI3UngZeAQwJBhnlE41MoV4bosDmu8i0vEHj
         ahtDH3FbcSlfa+OoWLHwqFChbw4JJ9kymJ2GAoMRslSp7z1Vi0IPwrnikDakzrFRzY4k
         rM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738935; x=1793343735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=;
        b=hpVs2F9JCh4+KicKNhOYKsLdv7LN5zTAgx4tv12QK4041st5U2B2DCM2Rm9pGYBzeP
         YGinQigmvsL2OuMsgiaKhZmEmTKIWfB91epO01ysd2z0fs2XuHwD226vG2UXLpbYhfxu
         ViNmHQd0j9aNXndNPzOUrPdq4RqoXJo/FXDmTXXncrCCvl6lAOxlSrkMVsalRjuHHXxA
         McfnIy2wZgO5kTs+BvGLfNqGDeOf8PN3EIKc2DFIrwBR3pItKDWO5Ka6aS6bllR+UX/g
         eosSf4MCUidc5xk+tbk9LGjWR8PLItiMwaDP7UHVy+3n+IylhWhim5t0/i3M7WEXgL3u
         fiaA==
X-Forwarded-Encrypted: i=1; AKwUvByGGHa/1H4qIRT8u9UVDmuvp1emAHC8pXp35ZxNfULuIBOlJUakQ8uCcecKsSbJvC6Z+nLuWEWiGayJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLWu9rPTXr6BHnZJf4sSsQZk4tsWbZt5SoXmKRDuDh+lo96ulwh
	PjodglsgwnjmzuopdfcGzSjFGRw3mWV+zzUnumTN5K5EZUrJ2aJhhERBpvBHAw3r8usFRoECQeQ
	psernT/xmrYaiaaFsnZFYkqifLCeKoDCKJWtjab41IFK3Kzwwq6q1s2ji/y4A2v6u
X-Gm-Gg: AYBFou29t//eNhkcmuBNDA2usNnA05kh7rDANDLJDLLW+s8dGDKvnqWK1sujd5xfihp
	+pBNmAaaeecze6WG2K00+op2xvwyz4JpTX5h2Mr3m5JCTduQ4hcGiKog+YPT3g21Gmro/3dm9fH
	RRg3PIM+xbd6A35i5XZKnEEnPwdFAj75BT3NP7gN4+jad42dgkZPhE3SDQXW00gYaG8oAT2wryK
	ZjTlp7/PVapzoxLw8CX+LVdEIeQB1+CtPWLaoLPSCF0PDZiwH0NP4cBA0chPT+9+oCoAs+8q5MS
	fB2Y4WalmWvGOKuGAB1MFw9Z3urAty21zPWurJZFDDP8l2pGNwKdo+sZYaT8bheGB5cHOV1HVYw
	qOOvNw33JyoSlLxkGGPuMXau8/L8NaRiygQ3rr2Jk5BFld3m/TZWsQqeTvAJQ4lqc7Vino5t0Mn
	E+Laxme8sPNJBgC6IcJg9TRQ==
X-Received: by 2002:a17:902:f690:b0:2e8:3cab:3af1 with SMTP id d9443c01a7336-2ea7d0e1aa8mr12883625ad.23.1792738934459;
        Fri, 23 Oct 2026 00:02:14 -0700 (PDT)
X-Received: by 2002:a17:902:f690:b0:2e8:3cab:3af1 with SMTP id d9443c01a7336-2ea7d0e1aa8mr12883465ad.23.1792738934047;
        Fri, 23 Oct 2026 00:02:14 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:13 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:17 +0530
Subject: [PATCH ath-next v3 14/17] wifi: ath12k: store and use MSI data per
 CE and DP interrupt group for QCN6432
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
Message-Id: <20261023-mpp-bringup-v3-14-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: mkXv6nMpHE-uun4OMX6MUY8iFVfAmpnG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX6TJg5fdqrsK4
 y52I45CyqU31B2RDeFS3qmA1bvRwvTkxudqLv7Ex2S2qdOarLWjc/vLSBC7dtFLg4xq2NBpr/X2
 ALWcxC97wGcxUY7rj7fQTrjNXMTFcN2kdEjIh10T9E+Rft6L1It3DkZH1RSC1Ruqqtg9GvxuRlV
 w+HkHiZGIwznFx/BscO2gZgxnCoG/1G9jd8wEeu9/RzDgl8xCrIrZo8Ho0vg6B5R1ZVyhBvJQUj
 scbUANrWHLHv3MUpqukDbCLaj9wcJuwGcg1KX6r1Kg9/Tn/4ppimVRM6thhCgtnOlCbwurekRaN
 +9W7jbcI+/8GHXXG7uTmIM4J7AoNZNqmuUIdf2qXSv79t03agv/dU0GRVMkfl5c0uvUqO/LVcT1
 VsPsQHAuDQfzXVfvG0IUPN2mPcd0P7iueaBxHeBeQ1+x4/yfAMcxe9z2tsdt1fNikXhn1hWWr8P
 BAB7wsIwSLS3kYF+sRw==
X-Proofpoint-GUID: mkXv6nMpHE-uun4OMX6MUY8iFVfAmpnG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX8nZDpT+nK8u+
 lxegCt7CCdTak2mkZqwXDpmx8zTDH+gFNMdcEWdetrAOSfUZTsvgZNIgJT7HmiYkWuTK9X4wV7E
 +zCcZg+GK8R6mDhPseKbVPBuoC2xf7o=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb0677 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JOiqKhmsGJDeROXOrEsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

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

