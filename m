Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A544738B14B
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206884; cv=none; b=bZ9rPRfc2y/U1JYbYx03GfCj7IoqUqzy6KQKRXEYKutmccodQmvbqU9OEC4TUknqIh7AD0pqMzHLA8XEKRTpQHNuj2bX/n1rplzqsRoRQ00kn4JO5/trbpmkQJlUoikg3RRoDi6nZb2/5y64KFI/RkisslLvNFsShBV4Gc8Ary0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206884; c=relaxed/simple;
	bh=cmDriKbCcG9Q8hSVXUoL8k7uqHqqwdQ42AQKkfed4rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9ycNynwgQoDMCroZ9iguxFpRf+PiRmvOyAT0Ggs+Tu/KK4WrFhRkR1dOZAJhJVbAkf1iREk9fb5Af9/vcJYm7QivlYngGuo0DFPY6MvzXk1ZLtcEiX8vaO6ozggx27r1/Vgk+PMstkyEQoCR9juWpTNF5zF3MDOUlLs08u0jC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJuVqINB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H96O94He; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJuVqINB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H96O94He"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63325Ew72922083
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 09:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqFxlfuV8pspBAs2CXOzM9DH0w3Wtyj4158jVPNTSw0=; b=MJuVqINBnD/Yyeyf
	XO0FEH61k35SZ0MZfCZiIaX8buCquv/HA3O8+WCTM+DE750FkWOBICkUnqJzvRPR
	A/5AWn4IoLgMYxcfVtzqgJ2w53TVf9VeyE5HsY73x9inaUN3dDrtYgk4/55G/1Bb
	VXZ7reDiil/wTbsfBOKqJIbEmyqABijJOStLGwj4mNLcKeioOa4leWB1O5CzDLjG
	RQZUzx6EP17sKEraLd4OdMHkQAAS1e1+z/ZQB8g2kmevszH4iNDuD/Uy0YtHqADs
	+qFjWo2B8ecRU2HyvtyMPI3Cjaiy6gaKvu7sYYL1A74zGu09lNI5oloaHKOzdoEI
	pekMYw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9qw0bsmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 09:01:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24e45271cso16220475ad.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775206881; x=1775811681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqFxlfuV8pspBAs2CXOzM9DH0w3Wtyj4158jVPNTSw0=;
        b=H96O94He/O1utMk3KBP8xFgBHnGhTT1ivzv4FZUMuLrMxlc6XCXfP3Z3Mxa8ufDeGD
         ns6pMmHgI4NUq98hgZSjoWVoiKRidlUiAymBAiVLe92WfL0eOraJPvTbhemtKca2exAi
         r5Qi9BetBSDB3GuADraZxOgNFDS2CficIOfqlEhFvpG+qcCioAPXIYFwKo5Jc8vslSeA
         xf+5A8uiqhMF69e2M4N82F1XRJ8N6sEb48A2kSfNC1HGq8tPjIW429Y+9aJlMrjJnvCW
         bMOHUBo9t/Cn4vzWX1ypAlu1y+sePYPWMm4g+Y7WAnfI1RRlku8QogWIv7m2jjNqfLjD
         3PAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206881; x=1775811681;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqFxlfuV8pspBAs2CXOzM9DH0w3Wtyj4158jVPNTSw0=;
        b=ePVQbtzu/bsUJDWwhad3Xe2FeLGuNGkUVLgcgDfA97zuCSLa/MPss9QH9DAM7SdyNj
         ks618gNtlauK0BddkiM5P2ugLWQfONu+LaF7nUpnlon+/+3nRYiVdXYTWPIrwI8jDdZr
         f/nyGJhIed36XHavld1iOksKmtm8ALZQgvYdKpJjai9KcRGhESmbfDBEqtPWOYgndNmc
         VIKSnvxoLs8RTrQmiWOoUH5spKnycXRfVlbPRDxiZDWa1Ye73IITWPY770I3e5H017Di
         M1/UPSNKEAPQhCFQ30ET7G69ywCBM6L96eI92QNIP2z9WPeB8MCMyXoMzjs2SzvKlNza
         axFw==
X-Forwarded-Encrypted: i=1; AJvYcCV5h9Su9FBIPRD+TR+NsRoNW3sYNpn/6LVavtTk04vwntmUAy9SK42hkcztIuYR14rCypfpLsa9u1mA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe52kP3gQtfalVHnRCgNnMiL8JvToa9OxSr6woJ6W47pXMwAr/
	UUZETadDIRKXz7KT3KRWl1pYwNmqFCRieArZcV+IPbiEW8iYciWnyAy3RvBQY+eFKLgF0qVFnDc
	FY5V1WUyXvxHY1b7Q8OpAKjOhHO4EY2c9ya8b5RhK4UtfBmBO+cRPwxJztKQCjUXQ
X-Gm-Gg: AeBDiespZkxpzLZyc+HulwkJoH2dej0aWLTEoURq+1M9KQ1la7nwykpgoEL/oMLx/xm
	wh2ScBll6hqm5XZUIPUGIxaix49pS6fT/pdtI46m3rBpEt94i5cIk4x8YXirQ7/4w4VoAZeT77z
	D8+RBMaFJFBtAsYqcFMQDFNo67bjD/83OI3XvVC77H6+Zp7oBu66RBFU19oCV+ZxW9FOrEIyDFM
	FIHQVlEpc/PZ/hUz9Qma9PJgysPMKTxcKu3VwbZXYW3PBcNDiB7ARiTPXd+LPe/1t/MAT576jo2
	L0E9aWtoI+bW7QRmS/S+YuSefmduJKKqfpQzTO7MoeXY+xdonlxPKJNseAeK6t8+wp8uA+3qiNv
	KAg17P7WqgqZVjI6d4XIvlXMaC1US71FNlJNz41Aewwc03ivNMjiJeNJGDh5HkN31OV98QGOo9n
	k3SN4RcJRDhjX8Mbx/Tmc=
X-Received: by 2002:a17:903:1b4c:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b28182c458mr24576045ad.32.1775206880718;
        Fri, 03 Apr 2026 02:01:20 -0700 (PDT)
X-Received: by 2002:a17:903:1b4c:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b28182c458mr24575075ad.32.1775206879727;
        Fri, 03 Apr 2026 02:01:19 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472cdfesm53090625ad.14.2026.04.03.02.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:01:19 -0700 (PDT)
Message-ID: <5fff7189-fee7-4d73-a9a1-728389900678@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 17:01:15 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 2/6] wifi: ath12k: Add ath12k_hw_params for
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
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
 <20260402-ath12k-ipq5424-v4-2-cd1e0f0a6c88@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-ath12k-ipq5424-v4-2-cd1e0f0a6c88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3OCBTYWx0ZWRfX58G9c+qKZFiz
 uBDzG1P4OHpDGOJvQjyaQkILVLB5d+tE5vTPktAL7fNnyHXDFXWEbzYBG3lPU1pa5pAan4rErUV
 rwVFKfyWmD0KGVK1OqVJq8HhavVfmnne+QZFg8168cTCRTqf2WISqhSD8b7LLxbi+jFEmocEwFr
 hikuxD6GR+f/GeOMCLhGo51umm0IgztOntOrbbwsBTEUfJPt/clV6f+xaCQBWA0zn8OdN5Mbkhn
 hi5YgFu3vaRsrCKHaW8zMH+aQrGBqCyFopbR7azh2hOPxADIPR+LgOYaRA9YBnlrNmTd211YkTC
 3Y5KYCaWv6G/7jt8ZAFR9zHQv7mqnhuUNLKo+dZUkGsdYij0JvhQbr8vVMvoM147whMrz/FyoFG
 qIczqjTl6pEk/yEiz3oV4qtz3eIO94rfCtAhau8Qz2f/BFZMVWToAKdHDVol8No5jB5dnuN4yzc
 3KeXFfhYHA4rh4/PIrQ==
X-Authority-Analysis: v=2.4 cv=PNICOPqC c=1 sm=1 tr=0 ts=69cf81e1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Z7WYvUlOW1kuK6QZCLMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9fo7htbS85n6_Q81zAPR_erIxhMeaA-U
X-Proofpoint-ORIG-GUID: 9fo7htbS85n6_Q81zAPR_erIxhMeaA-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030078



On 4/2/2026 11:54 AM, Raj Kumar Bhagat wrote:
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
> ---
>  drivers/net/wireless/ath/ath12k/core.h     |  1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c | 75 ++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..68453594eba8 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -157,6 +157,7 @@ enum ath12k_hw_rev {
>  	ATH12K_HW_WCN7850_HW20,
>  	ATH12K_HW_IPQ5332_HW10,
>  	ATH12K_HW_QCC2072_HW10,
> +	ATH12K_HW_IPQ5424_HW10,
>  };
>  
>  enum ath12k_firmware_mode {
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index ec6dba96640b..9b9ca06a9f45 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -753,6 +753,81 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  
>  		.dp_primary_link_only = false,
>  	},
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
> +		.dp_primary_link_only = true,
> +	},
>  };

mhi_config and current_cc_support are missing, please explicitly set them.

>  
>  /* Note: called under rcu_read_lock() */
> 

