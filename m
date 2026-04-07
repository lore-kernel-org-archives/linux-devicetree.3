Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F60231A23
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 04:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534822; cv=none; b=e953VqtDITVd0HQGhjnGbd1Ho7UpvfUcLCcbdfVzV2Kbs1t6ybZCedcyJImEe1g5/YBWxaDc2vfV2o4+hmJYLS09Pd5nc6ypa3659ocHes8qWBT73y7O5DzWTfS2voNqnfFDspvH4GmjeCHCcUtvvCrhI4lw84eGiDQMI1mpbHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534822; c=relaxed/simple;
	bh=/hfGQbtesKRC3lit+F91bIJfGvVZA63Gc2j//SRpkW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IRpPKEyBSpB0sppY4SO0jk8y6yseqZMSaNEO6mui/uP1IXjBPx2nyI7LLE2gvco7lSI4322tKpGxX/d0HZdmdSE/X1WmLezDN81Yn12/6b73CFVRX8+dRd/EuXlDb0nsa81damdpy13aVJ8JJuYSuJmWgnc/JGYt8vuM3wf5Rpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMVrl8Ag; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFa2i5LW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMVrl8Ag";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFa2i5LW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQPnY493369
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 04:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5OG6lICsmuX05QyL4RIPqB/8SW9MLBfBau3CiAnvoY=; b=NMVrl8AgoCNV5rTW
	sHdkBslP0f3lNzkrbFcRcpeTpcg51I5aBbQbtnWuMj4nIJfi2jifSFja+qHxgOaW
	DHIuZsIbsu8ARY7snOG2xGXGer2xWLbI89K+aU0krpy935k0ToEWDGCNGC+iNZEv
	1T92hZhmFJMz7NAu4fEwFdgJCfh774IVxAKBfhpsG3Vb4q9fPRGO3eWSe9ZazTsr
	kzbNIKhnFtY/CJejE/SoPCOrvKIieyUrEYIAVCbm2m2gkRGoxlAucz/X6++o9D3o
	ddt9HWnWQn8KBGkVVwblaVgkqJ74qzT354G+9q/WikrrHakHvKBZ0hJbguLGKXxk
	bEvJJA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8rx7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:07:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82d02942266so5795875b3a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 21:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775534819; x=1776139619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h5OG6lICsmuX05QyL4RIPqB/8SW9MLBfBau3CiAnvoY=;
        b=EFa2i5LWdiAIwbOHTo2QAV2BjMrRvmXnl2NCl50u1pZIp9bnUw+xxoQA9/OjPTSQft
         fyXStl2+F5zVFHCc/FKc2L+vy0FqTb/B+vLgewE49E579pNluwad4TbdaQyzcCZgD+Gk
         brVgeamTywC0MbdCjmrdI7LeiDW095PUGhWo1suhb9Jr2AaGHjnZA3fakxDBOW87P7Ab
         IPQlH1ypr33ADK4AAPvm2UuPp25kzDZlWQWt9tHJeHXmJBQkWnK7oqnt8GC/PJKAtFyb
         O1wF9wQSKoXAgMRwY5CiflYMy0wYG5O3xHC0/iwxQuD4TK24PEc3EXIDwq2dMXhdJpUs
         9a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775534819; x=1776139619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5OG6lICsmuX05QyL4RIPqB/8SW9MLBfBau3CiAnvoY=;
        b=hXX9MVtBzVNCyOK73AkN0oCzdu0mRT2ozDw/57oXiZ16swOomnPf81o68Y2Xn+0D5i
         qpWRp76qBfdKEvWyMBP+pthRgxTicidJ60SM/zjNdiI+WKa79WADES02jfpNTERzKeJF
         atRK564LfSSTe06Xe4PWrP0IZjVv/KvXVat8B1tVEMyJa40kDT3gSg9KJ05FsLTmtOv1
         BV98idJBvkohetvD4iwivD1zCsREIGmS9VbMcMDZs3h8jPNNImMVKz42rIUrdeNvdRwK
         514C1MQFjfyvfuRhJ2pEVoQF1ESuFGwTPRT88wrKSMrfZcJWwyGI3GtjPNrKUg+OhctP
         qcpw==
X-Forwarded-Encrypted: i=1; AJvYcCWOMdUeNVKSLGOh+XeTwiTK0BVdwp/CTGBBBslwKFkZu7SVfUhhXC1OcL2Mn1n8MU+cr60lnyD5+KAX@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3jvY2eeKxMMFnXoGbvehFNRsB9vqlg/dmr0zmvJ3otYM1hiy
	9/Y34wVlw+QdvVifQTbn/j2ujsfnEipbcU0HZmRwmUCas0iFwHkKZ0Uqd11vvj9R/mxL4XoIjlg
	L7GKqMGkhdQvkvxfQbZx2xAahav8UJnXCs7DOgsV0RJbbl34ssL4LcGjzsc61Mv99
X-Gm-Gg: AeBDiesF0PvNCkkD3jlvYsAOUYUaT8H4X0pnT7RpB+fABQyG9Oe7di+Xre+OcHRhd0B
	Q0BoESATs+ThfRQLM1YTkNuePj9v3JsT3ZsrxIal47O16iQLpVflMtZYBBGtkIQSSJyzJLrjKxK
	lg1TUKwPbk6Mm3xYVX0PwvY/JyjAue002symEfNoC0VS7BByiB6RlQjMT0dwFI9RAhxyl5pMreg
	gSXlskToWArj5F6vESJIH9y6DQ9cO2SPN2W4/pSCUcc2Ifs+JFGvD+Z/5opFOD7ihpPdfLTJnl5
	eAZl0f22anXWsP9qYtWEx+xp2vWWoznYbC0+MLOXEtGGxN/CxXfcNB9L66sS9Ewf9z4i2PvbaaN
	fhj7WeixzOOfFbCNzb/g3zqYFCRJZCy6YyzJ2K1dTaT2SsDsgpg==
X-Received: by 2002:a05:6a00:298e:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82d0db8f8dcmr15118558b3a.42.1775534819425;
        Mon, 06 Apr 2026 21:06:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:298e:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82d0db8f8dcmr15118528b3a.42.1775534818855;
        Mon, 06 Apr 2026 21:06:58 -0700 (PDT)
Received: from [10.152.196.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cfebe5b23sm15802821b3a.59.2026.04.06.21.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 21:06:58 -0700 (PDT)
Message-ID: <ae47256c-053f-474f-b799-24274c68dfd5@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 09:36:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 2/6] wifi: ath12k: Add ath12k_hw_params for
 IPQ5424
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
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
 <5fff7189-fee7-4d73-a9a1-728389900678@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <5fff7189-fee7-4d73-a9a1-728389900678@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: naECawatHlL_JQ2_TPjA0-dBp_dBdzHO
X-Proofpoint-ORIG-GUID: naECawatHlL_JQ2_TPjA0-dBp_dBdzHO
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d482e4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=tZNLRw8BZbjVNQK_SNEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAzNiBTYWx0ZWRfXysAeWel32UIC
 KvIgArgfjdyjgfKLiUpZNISxcK+7MC6gx2neLCutrUB0LKmRwhsKpq/7M68Th0zpXRQpwBHc58J
 L8LwEtTOVJnwhDUVNfH4MTby2/mRXdRVW1p1cRXtvr6JfS3ez/j8bq2Z/Rf+DJKsp5PfLYxQ5T4
 qUcCvP3EUmr8JQNujGVNaif35I/SZVjWOJmUSSaMmFDPUWAXCA/z/pEcxeKNyYsStXvIi6VI786
 i86mxirSGDfRBusXTw7CXOccG4FzAkguWRxDGKZuGvNdB5yU7REYpVDdleL3ln54CC38Lp+p3MA
 RcUK9eYVkDwWTjZvJ/S1eveVzXwkBCvcXyUFALC3DlNySGlcmxbB2rPKimSMY6jXYpOuSehVSfN
 3y7rKeM1u+GohQeUQCBmYqYyAPMjC/YCNNulvIumO8KtDBRNF7mSy10xi9DLU0h4JnlBpR9Ac22
 s52Ip34HAsoHeFl+RHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070036

On 03-04-2026 14:31, Baochen Qiang wrote:
>> +	{
>> +		.name = "ipq5424 hw1.0",
>> +		.hw_rev = ATH12K_HW_IPQ5424_HW10,
>> +		.fw = {
>> +			.dir = "IPQ5424/hw1.0",
>> +			.board_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
>> +			.m3_loader = ath12k_m3_fw_loader_remoteproc,
>> +			.download_aux_ucode = false,
>> +		},
>> +		.max_radios = 1,
>> +		.single_pdev_only = false,
>> +		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
>> +		.internal_sleep_clock = false,
>> +
>> +		.hw_ops = &qcn9274_ops,
>> +		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
>> +
>> +		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
>> +		.ce_count = 12,
>> +		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_ipq5332,
>> +		.target_ce_count = 12,
>> +		.svc_to_ce_map =
>> +			ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
>> +		.svc_to_ce_map_len = 18,
>> +
>> +		.rxdma1_enable = true,
>> +		.num_rxdma_per_pdev = 1,
>> +		.num_rxdma_dst_ring = 0,
>> +		.rx_mac_buf_ring = false,
>> +		.vdev_start_delay = false,
>> +
>> +		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>> +				   BIT(NL80211_IFTYPE_AP) |
>> +				   BIT(NL80211_IFTYPE_MESH_POINT),
>> +		.supports_monitor = true,
>> +
>> +		.idle_ps = false,
>> +		.download_calib = true,
>> +		.supports_suspend = false,
>> +		.tcl_ring_retry = true,
>> +		.reoq_lut_support = false,
>> +		.supports_shadow_regs = false,
>> +
>> +		.num_tcl_banks = 48,
>> +		.max_tx_ring = 4,
>> +
>> +		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
>> +
>> +		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
>> +
>> +		.rfkill_pin = 0,
>> +		.rfkill_cfg = 0,
>> +		.rfkill_on_level = 0,
>> +
>> +		.rddm_size = 0,
>> +
>> +		.def_num_link = 0,
>> +		.max_mlo_peer = 256,
>> +
>> +		.otp_board_id_register = 0,
>> +
>> +		.supports_sta_ps = false,
>> +
>> +		.acpi_guid = NULL,
>> +		.supports_dynamic_smps_6ghz = false,
>> +		.iova_mask = 0,
>> +		.supports_aspm = false,
>> +
>> +		.ce_ie_addr = NULL,
>> +		.ce_remap = NULL,
>> +		.bdf_addr_offset = 0x940000,
>> +
>> +		.dp_primary_link_only = true,
>> +	},
>>   };
> mhi_config and current_cc_support are missing, please explicitly set them.

Sure will update in next version.
