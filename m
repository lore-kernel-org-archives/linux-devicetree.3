Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22A53B0AE7
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 16:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578814; cv=none; b=mpSFHNR0FSXr/AdsrB3Cp7IfN5vs52lM8oGb0KGOy4vrZSFf4gZuktDqrVCefuwbW4KQdrX+z8LHZNK9FwtoIvOl5+MhLPOw3y3ljxmTQiRKDLQc07kqL1IeLBUmE2sUDXt1TFUyMWnVI3jdca7Dl9idIQv3oNRIg6Zj5CGeHbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578814; c=relaxed/simple;
	bh=r4C9S0bv2445jogsNg3miUfs/j7bPhpTiPbkMRI3mEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZb0CIdvjsxL4/23L8vjmRQjZ4EAGY/Cwt9cDdxAaKzZ3JiXeU+mXxNJ+nsARMwtmCay0Hpp/Zlx5ou5HjuTzJWaTVgRzc2khYmjl6qlDMv4y5z7XFuVb+/sHbj8Pe4US7r2Woi74pYsXH2MJtTu1b+GO8Dk+6obl3OC46d3Nuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evivHoFT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hpi3MY7e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evivHoFT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hpi3MY7e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DQ2Ek3402362
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 16:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a0f18Oq9boIMyQuBhUbaPDsT2QYQ1+En6l/jUXzn0FQ=; b=evivHoFT6YT9TVN3
	lTe/Swb3WC14V3UYGg66kwDepgWHvO3tVlIY3Htc5IwzR6n54DHWx4WQBFejwnl/
	WoWc0oiSHb73jfF0lHtwp4l66gj9j9DEyz9YCn20srpm5OjhfwhwFGC8V57vhhrF
	a1ackd15Rlon4vz3QGh8bQRz3Kt7iIcPIqhXjJHtf2p4tiWs2Da2zD23f+5wqJ3r
	vrpOgTP+ysygkOD8812necAVGhDZ/6YjzYYk7ywZDv0Bas5wFucUkw3LFV3xFYM/
	XFYOP6E/9zm5TnPNiV0g+m9EnDtJ3LrqMOXTAY34D5D54AK+AeNIH0f8LO06CzU2
	QMvmJA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhujkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 16:20:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76bb22a8ceso6845646a12.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775578811; x=1776183611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0f18Oq9boIMyQuBhUbaPDsT2QYQ1+En6l/jUXzn0FQ=;
        b=Hpi3MY7ezVWldAA+CmNkC1aWCEGA5ddJbES1Yxh71f5xsowpDGoytJnQHJwhs1R/fp
         UcDH2QbNcq7YXcTWZL4/5AQz/lLnsxgonYy0SJfhhgnAJ6DPOFQ82GRxgRoOM91GFKHm
         71WJ7FHIY6xu0eqkNh2sJx9viW/dIGf9QbZHD8qvGqY5SaE8Y2l8gndqdWXDzgNpcips
         bxR3jl6aRGimQMsMpwhZG9GFiYxQs96mwrkk6M5QZP9mVE1gaJmAk0Unecqq4faBqoRc
         YJHv9Ggz3BZ9K6Mi73mBc02keN5zL24xJi9rmWBbIglLfPj2IsNV/oM1OQYYayO1deHu
         mMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578811; x=1776183611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0f18Oq9boIMyQuBhUbaPDsT2QYQ1+En6l/jUXzn0FQ=;
        b=IYNxecmdkym/7e2SMUa2TN37tDitxVO6/QAMR7KoQTK1UvunZig5P4zbbqyoO3iQFQ
         sXWGWTUCIE/mz7gOvU2RHdynGwSGgAfxwKOq6LG1sNHOYMWvO2qHRHZZM8yGQQKCczH1
         wAT6iJxZnJ+wHcW7DZwyXNOzMqqNJVPmFMseluA2adgTzKCyy/xZquMeHkPSTa7Ml8Q8
         sjlfnjG0He/nOgzf13Ts67mZQ0P1ydzdf02HPyy50DZ76v7c8ArQbN0TOKaaA2EgmZC2
         O9entaYUthexoaSe0lPNJuw6V9vIzv7kpz2E3XFZLnUGZH75OJ/Jd9e87Cty81gCv+gj
         MP7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIQ1FROVniQtH8kd6YT6He0c/YibLNuYWeX7qG2YBBe8dSsImkmgIVa8fbm9pMRQ6FrDf4+UtCRzxm@vger.kernel.org
X-Gm-Message-State: AOJu0YzOxQKe7+tfqb6MdsBkQVwzKlVvyHxLvxDfY4DicPPhF0bpPLmX
	MP29WhZU5dcwei7X3cLA7KiMMKmwfZ2VIjxlhmEjalTPr2vSe/JJIgXFV2eBFwMdaaLg5PXq8hN
	bc6pTRZjmyS/Q0TLIQciYnYZQDM7OaagytSC9ZjfPIExzw8nAGB1NHtLGmK8BwxO6
X-Gm-Gg: AeBDiet7GUgXeIoA5Jy6Vp2dQnmm+e5Ngg8q3T0Yzj6zivDQ0QvcZt0sXC7QNXlXPgz
	EbHdGPt9oJcJUCb9C+MGwR++40c3U3ExtGMd/E3KhyVaqDG8AxguX4YBNH8lNTxNll6XvpnKODm
	ZHKLWUhbhr0HMzd3p2H9uRwEmxzpgKJ0Z+1cBStbXuAnjYX4prSUQbLEBLPAJvAoqGQ9e4gt35I
	0JOgBIS4KZFB9rV9RLNM2BY8LHvnXAADb4iAjmdXkD84xzwr+oOAO9lykAexxMcbdKZs4VjS+W2
	Z/VPrUqzUeZ/YyR0U5SN8WaMacAzgnAajFc9X8vwhOu23ugrbARs1Ai+42kDEbuQs4N+PhOYB2R
	/UEY2X4IrNC4LDj8bkCl4jLpYsmxcHw79wdXN4ZIpCfM48guQcPeajykRV22q77MEuw==
X-Received: by 2002:a05:6a20:430a:b0:395:ccae:d494 with SMTP id adf61e73a8af0-39f2ee10e34mr19028492637.20.1775578810747;
        Tue, 07 Apr 2026 09:20:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:430a:b0:395:ccae:d494 with SMTP id adf61e73a8af0-39f2ee10e34mr19028445637.20.1775578810093;
        Tue, 07 Apr 2026 09:20:10 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm16286043a12.31.2026.04.07.09.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 09:20:08 -0700 (PDT)
Message-ID: <3496f9c2-fe73-4732-9ffb-513ea51928df@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 21:50:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 2/6] wifi: ath12k: Add ath12k_hw_params for
 IPQ5424
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
 <20260407-ath12k-ipq5424-v5-2-8e96aa660ec4@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-2-8e96aa660ec4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NiBTYWx0ZWRfX6Wr+ZxXvUc8R
 Fu8wNR0OMAk7KvhoMDP0/Gm3/jCRIkHT4iPkdBT52jreLNm5dDkH2Evuj9VXbryO379AYd3/HK6
 kwEQYvK7fUDonFWBB//exsMFl9zHqq4PDWKvuS9Wgep5J3KTrvrwm6/tmGVGytdW+EDdhQyMWWs
 wuyOQLd88RhCdP9MyBzlyO94pyIab/EazeJ2+Y/cPGug04oq9hy3OmfpUni/XK+dPpXk+hUkza/
 JC8BoQOub388Q7a/PM/97ZqzvIVBTbI5Ku179riLl/jlH7rRex68YoILlnoWQXVgoP2nzN0HQuo
 alxGBwoK0TEARefcmQ6O3cIA+w/5CgFJJf1528JBeDK5wcIALQNnsD+nVJAC52qpXSSNc3y15fe
 Eoaa4MXv4YbPVx2Igr/ZavgCHIukTkyszEZVzfEhDSboH2b2KameBlEoO5Ny634l5bjtLL0oAgG
 8tfNbG8vkFq4GfaXUOw==
X-Proofpoint-GUID: -59nG7Zp03P_woKK_gTxGDqWN3WqTT-t
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d52ebb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RSpPW0pkKGs0CHY-rOEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -59nG7Zp03P_woKK_gTxGDqWN3WqTT-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070146



On 4/7/2026 10:56 AM, Raj Kumar Bhagat wrote:
> From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> 
> Add ath12k_hw_params for the ath12k AHB-based WiFi 7 device IPQ5424.
> The WiFi device IPQ5424 is similar to IPQ5332. Most of the hardware
> parameters like hw_ops, wmi_init, ring_mask, etc., are the same between
> IPQ5424 and IPQ5332, hence use these same parameters for IPQ5424.
> Some parameters are specific to IPQ5424; initially set these to
> 0 or NULL, and populate them in subsequent patches.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.h     |  1 +
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c | 79 ++++++++++++++++++++++++++++++
>   2 files changed, 80 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..68453594eba8 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -157,6 +157,7 @@ enum ath12k_hw_rev {
>   	ATH12K_HW_WCN7850_HW20,
>   	ATH12K_HW_IPQ5332_HW10,
>   	ATH12K_HW_QCC2072_HW10,
> +	ATH12K_HW_IPQ5424_HW10,
>   };
>   
>   enum ath12k_firmware_mode {
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index ec6dba96640b..2b5d1f7e9e04 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -753,6 +753,85 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = false,
>   	},
> +	{
> +		.name = "ipq5424 hw1.0",
> +		.hw_rev = ATH12K_HW_IPQ5424_HW10,
> +		.fw = {
> +			.dir = "IPQ5424/hw1.0",
> +			.board_size = 256 * 1024,
> +			.cal_offset = 128 * 1024,
> +			.m3_loader = ath12k_m3_fw_loader_remoteproc,
> +			.download_aux_ucode = false,
> +		},
> +		.max_radios = 1,
> +		.single_pdev_only = false,
> +		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
> +		.internal_sleep_clock = false,
> +
> +		.hw_ops = &qcn9274_ops,
> +		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
> +
> +		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
> +		.ce_count = 12,
> +		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_ipq5332,
> +		.target_ce_count = 12,
> +		.svc_to_ce_map =
> +			ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
> +		.svc_to_ce_map_len = 18,
> +
> +		.rxdma1_enable = true,
> +		.num_rxdma_per_pdev = 1,
> +		.num_rxdma_dst_ring = 0,
> +		.rx_mac_buf_ring = false,
> +		.vdev_start_delay = false,
> +
> +		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
> +				   BIT(NL80211_IFTYPE_AP) |
> +				   BIT(NL80211_IFTYPE_MESH_POINT),
> +		.supports_monitor = true,
> +
> +		.idle_ps = false,
> +		.download_calib = true,
> +		.supports_suspend = false,
> +		.tcl_ring_retry = true,
> +		.reoq_lut_support = false,
> +		.supports_shadow_regs = false,
> +
> +		.num_tcl_banks = 48,
> +		.max_tx_ring = 4,
> +
> +		.mhi_config = NULL,
> +
> +		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
> +
> +		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
> +
> +		.rfkill_pin = 0,
> +		.rfkill_cfg = 0,
> +		.rfkill_on_level = 0,
> +
> +		.rddm_size = 0,
> +
> +		.def_num_link = 0,
> +		.max_mlo_peer = 256,
> +
> +		.otp_board_id_register = 0,
> +
> +		.supports_sta_ps = false,
> +
> +		.acpi_guid = NULL,
> +		.supports_dynamic_smps_6ghz = false,
> +		.iova_mask = 0,
> +		.supports_aspm = false,
> +
> +		.ce_ie_addr = NULL,
> +		.ce_remap = NULL,
> +		.bdf_addr_offset = 0x940000,
> +
> +		.current_cc_support = false,
> +
> +		.dp_primary_link_only = true,
> +	},
>   };
>   
>   /* Note: called under rcu_read_lock() */
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


