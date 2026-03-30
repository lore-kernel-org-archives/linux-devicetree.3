Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AF9399346
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903168; cv=none; b=VeaD7IAkHVF8oXXQkr4uyanJUuiySWdjFrC0owRVer/z1dyOh1U+OouSTJ3CTppWNVnFmOm3LZ+hBx8S6m4cvVW4/+FXxyj39hrRbZ+lrIfZ95hQi9zc94kdp68Qpmp+1BYMOsZ3sQFua+2kdxhJMwYO47Kz0VnwP7WUWO8PoZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903168; c=relaxed/simple;
	bh=NwRUhlRAtpZ7mb+eclK2BJKeHhhHjFl+FadQlbqFxVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d91FEiewaRVE2BxfvxSkEIpIgJ3FP6lbzx9WnsfgQQvqWu8JBcy7RN6ZUzh8WWDNSSfiGEeeRYE2gNzyE3jklRAHcr4EmjTl3kPYk4wiIZyS5CF7hLKjnWbLZJDcKMjQTweYQucSMFCQ3AMHNax/Df2hd81CniqrDzmPYqGABKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPVXb8+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQA9yO+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPVXb8+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQA9yO+K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEOKrj1557463
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYYhjMFDVSGGdtAN/NncaSVaOw76bJQ6T7loTIJqlLA=; b=BPVXb8+bEFLhr+d5
	SNpnVhcpLCp2Eazj+NWzkllPz3Q284K/qalQl4NjZZ0PdORB8ay7ZCuXTbGd+kf9
	yCX9R70sp3yoeq4FjampkQDkOlSQNwu4i8Hxt5AJ/AiHQkMh9nMdYNP49uvPo376
	AZ8SwDC/B2PJmN2+3zKl40WgdD2PEPerJ3wNDwgRhoM0LvBH5zO3D/dX+Lge++xN
	lURZf1DYsYdwvIsCLdE/QWK9CJ/DHUodrCR/ZKqm5eiev5sjk8Q2GW6BlfHGzdNy
	1BiKntiF9MLSTkPCo9N763V10Pmn5he6qATXgPQF3czLmGybfrxIIz09af5GJ1No
	m/l4Ww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7twm1e2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0c30b51bfso131648485ad.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903164; x=1775507964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYYhjMFDVSGGdtAN/NncaSVaOw76bJQ6T7loTIJqlLA=;
        b=hQA9yO+KZtavlgZ3c7VRlzNqNsjJz8SMy//SltnndaBj9AYDDmYDDfDVKeJnKbMarz
         bYCkGodNpEeSJDv9ZiXFBAoKZVnxfg4o7R6pvi8T2UAi2GwMr48u2+PVoshvNopYIX7K
         sR8iHGGt9EU1C7ZB3YK9LHNzAuf6cLK6St53dvQjAPGvm7OKnlnZ9n0M/B6Dn2OjHUNI
         OewQBunqKAC4YYMqEGigM+55HbOI4z6LCd03H/++31GPkl7mhOypusnilvXFkn3H3p3y
         fxLxNNHsB1UJqfl9v14mHaV0AGxKsCOtrLyi1iZ7iMJJPn5fsmh1XtT9cnJm24iisqB9
         Fe5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903164; x=1775507964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYYhjMFDVSGGdtAN/NncaSVaOw76bJQ6T7loTIJqlLA=;
        b=gRM/yXVfC33lZiOwmvWGodcm6A1oaItN8ppNoWcXBd9WYpVoPHALyGd4Gsw+ZENi+V
         jELWiJckTwaXfZORHL2EK6EJKxj6z5ghXrG7cxlT11iqM5gVWMlI7feapyoe6vgGpulb
         Ko0mdrzymXbsozJ+KnN5TsaLQCunIY8Rb2XUT0NJXcKZVfinV/w7Dycfyev494tu7X36
         lBM+rA/fZMsVKc2ebu+HSF3BQKvFWRDhKNu7S5T5WPPwGA27/ir/mV6QLKrrhV6kOxjW
         2nUixtPdfz1NpTiDPOMSMSTwTEzbkH39Zy7mKFNfK1rv9w9zDfRag6Qlo4g75+OO6w5L
         Ao2w==
X-Forwarded-Encrypted: i=1; AJvYcCWmeosgg4QtQyfFaOyIOvXSPUrK7+jBgieIfY8dfsIYcJtQD1vrbIdu70+cMBb5HAzcJcu1/YHrEHOL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzofr7+0/lBQ4pVgzjjBNBQyY9cADKaeiTNiO9YQ56+jZiKb5BS
	0+hGEu+KeTfX2xuA/ITuTIqbw1SchLhcUoOQNNkGWGHK3YX7t7Jc1qvacp3eDkgwEyYA1m8UT9e
	3SoOMu8IhoEc9imCQE4k3mRpakfI2/0z7dlm6IElDs1Sozjy2Q0k6x5DPIWYtw/kHpyDCcPnS
X-Gm-Gg: ATEYQzw9V6E87S1jbV8V2lpeDl1AZF/gWASLabXFiB49QBKqsGfxZMOQlxzTCG7k8aD
	C0IVdVD+YMZGPwFqePMDpaxG0mDVfR9ALfMjSNH8pyF8wI/cRF7h0zDARDPoIzf1C5vKw9Sjfn8
	irZN2ZU3qfKCp7/DUuahdjaLTPjFK02+KoPE6Fc4SLAEFTnPDsRsJQcf/1mgxmD4RFxnVbBqbJj
	9ohuE0/vK6pdhyW8cpgZyKXwqfeiPAVcPG+G2CqqLixPZ5xFSMhulReV9g/+JCeDxc7XC04KVTJ
	8GQ8bB/VngpxYh9lglL2f30pBjg4d1p5mmZpJobxsIAVc6SxiSv6Lz6Ft3bEnGrwrnKdzH39mJN
	b4cR1dl5nBkMtE2MaPVFOAQR1QEiR8D1DacvbE0C/er01RPhpH01Exi9ifhlwonT85nLqGY6G2l
	KSs7Z7dynpPouxjNr3QnmeLCdKeXWR+p/zb4CxYV8=
X-Received: by 2002:a17:903:28f:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2b0cdcb0791mr138534405ad.28.1774903163975;
        Mon, 30 Mar 2026 13:39:23 -0700 (PDT)
X-Received: by 2002:a17:903:28f:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2b0cdcb0791mr138534135ad.28.1774903163479;
        Mon, 30 Mar 2026 13:39:23 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:23 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:09:07 +0530
Subject: [PATCH ath-next v3 2/6] wifi: ath12k: Add ath12k_hw_params for
 IPQ5424
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ath12k-ipq5424-v3-2-1455b9cae29c@oss.qualcomm.com>
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
In-Reply-To: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69cadf7d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=vBmMNsOPyRzkxF6eNBIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ujeKnvAc8RfLsgTRn_26kTdGFrRRPU5f
X-Proofpoint-ORIG-GUID: ujeKnvAc8RfLsgTRn_26kTdGFrRRPU5f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfX8Vx4izpQ9DW6
 UoJzY1g/AdJGIdUH7NGwr6jEcUm1dUsB5JEMMNMWexpZW8gh7VUFuNeeoF+tDVMTo0IafiACtCE
 11H5+drPS95JJDIKbnNUuFUCgfQ/qwSIqho19A7YrbPWBqa90CuO6ARm9EMcUkUtS/+9hjHd3xe
 6G7uXwHPspQNRaOYFVCwNPdp++2aXjUO7qZS3J8PdBTrcaVvq/bAAMhwUa1/cGnZIvglazPf7pg
 lYlQ/hX2Izp0zqWyzloMKVNqSV1/KMsa7r/W0q+XxAPXoa36OohI88tI1l3arsdOo1Njcz7HHHR
 DBJu+ISdlozq4As00KuWKFWWNoWNt8F70OxUD9fkpHsjCXIhl4WNx42HluOUAhcEtpX9d2nTf9W
 vZU0jeKrEx7bV2tBRKGIc0Vp1xUcu5UD/Nxex5aavJ06Z1OrmH9eY80hvow1q9fIAsbJkojbjr8
 vkWI3kLZTk+evgPrNNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300174

From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>

Add ath12k_hw_params for the ath12k AHB-based WiFi 7 device IPQ5424.
The WiFi device IPQ5424 is similar to IPQ5332. Most of the hardware
parameters like hw_ops, wmi_init, ring_mask, etc., are the same between
IPQ5424 and IPQ5332, hence use these same parameters for IPQ5424.
Some parameters are specific to IPQ5424; initially set these to
0 or NULL, and populate them in subsequent patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h     |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 75 ++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 59c193b24764..68453594eba8 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -157,6 +157,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_WCN7850_HW20,
 	ATH12K_HW_IPQ5332_HW10,
 	ATH12K_HW_QCC2072_HW10,
+	ATH12K_HW_IPQ5424_HW10,
 };
 
 enum ath12k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index ec6dba96640b..9b9ca06a9f45 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -753,6 +753,81 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = false,
 	},
+	{
+		.name = "ipq5424 hw1.0",
+		.hw_rev = ATH12K_HW_IPQ5424_HW10,
+		.fw = {
+			.dir = "IPQ5424/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_remoteproc,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 1,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
+		.internal_sleep_clock = false,
+
+		.hw_ops = &qcn9274_ops,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+
+		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
+		.ce_count = 12,
+		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_ipq5332,
+		.target_ce_count = 12,
+		.svc_to_ce_map =
+			ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
+		.svc_to_ce_map_len = 18,
+
+		.rxdma1_enable = true,
+		.num_rxdma_per_pdev = 1,
+		.num_rxdma_dst_ring = 0,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+				   BIT(NL80211_IFTYPE_AP) |
+				   BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = true,
+
+		.idle_ps = false,
+		.download_calib = true,
+		.supports_suspend = false,
+		.tcl_ring_retry = true,
+		.reoq_lut_support = false,
+		.supports_shadow_regs = false,
+
+		.num_tcl_banks = 48,
+		.max_tx_ring = 4,
+
+		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
+
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+
+		.rddm_size = 0,
+
+		.def_num_link = 0,
+		.max_mlo_peer = 256,
+
+		.otp_board_id_register = 0,
+
+		.supports_sta_ps = false,
+
+		.acpi_guid = NULL,
+		.supports_dynamic_smps_6ghz = false,
+		.iova_mask = 0,
+		.supports_aspm = false,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
+		.bdf_addr_offset = 0x940000,
+
+		.dp_primary_link_only = true,
+	},
 };
 
 /* Note: called under rcu_read_lock() */

-- 
2.34.1

