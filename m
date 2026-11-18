Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979435;
	b=UqYyr0uQzNSNrO0uKK/znJ29fc9c6vbWI0KmLzUiJOj93FWYsXn6nYeH2f+uhZQl54jF
	 IkVfkS/OZbi/zoyoyBSiLrAW9TGurBsKg6/j37mKos1+MgzHYVnOBc0YFwzrkPR8MYyFL
	 cASpwQw+5nP3ykmVwK09KSWqiTgLRgk1mhoQH2f6qhbefMdF1rHkVo3j4o/a9xMFEcqgk
	 qkTRxRn28+n6mDbVPa7dc97jn5Vky621yCW46CnnEvSquXOSX1P+1fAKXXTUf9x9wHmQT
	 ++QNliCgjMrv7SsgHmQjo+SZIF2pFpvanR32tEo8jTnhp9am773riaMJL8uTNMVvaJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/xxDnMiHreRzE4y4EglUn8HJtByKaIRrNnJe+dPZ1qY=;
	b=broHQc9LhBjwTKnb6KQSuft3dW1ar1ID3dMQmP4xtp3kdu1Xh2ZXxN2L+xkXH41QMhnk
	 eXQexMSXd5juc5ZHRB3KHKDYbwjipvyVodMG5BNgxiboM5zONT/dMfyGCyMStC4UjJopw
	 Qvxnxnt5orgj3wKu5DTzGUOkryWLd6BxD2cV0y/SDSSPbSZX0Gaw8pzCiKuPOYg/ghATa
	 MohKW+8CaWOYd1CwxU5JjNUJKEheAtQ49fi8Nl0O7TdHoJFYiBvi2GVYFPLO2u2Wn8nd9
	 Ir/5efWRcOJ97NgItFDK0g29wln/uog2YMgBEG2JatbcpyyxRUpDIv6s5ncdAbVRGuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=igqf0lAp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdCk4bxu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6DE606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C6DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=igqf0lAp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdCk4bxu
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxYl2453598
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/xxDnMiHreRzE4y4EglUn8HJtByKaIRrNnJe+dPZ1qY=; b=igqf0lApBH0VcLWF
	JwSt2q24SyQ3dQsd3zuAdOXhyaOVyxRXyqbKkXU76L1ts0eFWSS7yO9vP0mDSGUQ
	EZ1Bqf2W+cT9Gfmt+/k2Ng/Q4WY7hed0Ea1LwABu4NPOe9WoYq6cFxkERTIndBhf
	SEy7vhDT7fhh1hqT9b82yBjCQdJZq0JSCopTKIHwXiIYFHMKXNZ3Pq7uAjkYrT0G
	totMnQbW2bxHVhZuC02FWb7hfWY8a0pwFNyppqY7xAzBGqoIs7K2O0kcFUk9zJod
	4KPZn96UnYHEIzcg2DNfD1BIrNLqg6uLD3JN9J1saw4q/NQUUU+hHOO8GH1IbrXQ
	1xmPeA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99aqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:23:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3b74351a4so607575a91.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979432; x=1795584232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xxDnMiHreRzE4y4EglUn8HJtByKaIRrNnJe+dPZ1qY=;
        b=bdCk4bxunTCNbnQKzm7DTETN7H2PXyvt46xp7EGbXBzbjRDghJ4+a/dCrahpEKWYL5
         DYLJ0y9tSeswkc8hy9BGPaoC6jNVlQ01+wzfPxDtuRoygpuS7odn9qysRE64pJAiwFmh
         hsscxV4oxTkQ77Sq3nLaKtk8o0Og+Cr65vGb3bAjWGFwTUdc2//7zJmqor4JHFeQ4Vum
         uPwcopYdwM+SsjpcuIss2UF+TTvffgJRJKvx3zyPw8J7aA93ALpy1diNZNQuBZY9RyP6
         lqv6h4sTlL37w+0IrqjHoOX8UjbvX7j/YmIMmhv8lj7QW5l2qZKl0fkLgxInviQWldR8
         bRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979432; x=1795584232;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xxDnMiHreRzE4y4EglUn8HJtByKaIRrNnJe+dPZ1qY=;
        b=aZuiZzrhmuSOTsHli9/rBLu+ZXOIUq416YeMFzNeSqLe/h+l5rqjQ+HnzNB4QGVMvN
         nTRN5AJ/1634QhtRb2T6i+bO7ZSFI43ejknma60AJ1TMd4WaK6xN3T4FJ50nclbHw5mM
         4zzJrlOPl4SM/PKEvGz9Qv6r4/NXfJkd6PL19/jYFLT+rMJSvhmQduE+OaCRJ944/Qnn
         FsFDqmQA1acvQ/Z2PipDAt+G1MQa6ggLs7ATx2sxDrVQhZqBW2yFiXEx3taFBz0XOOJy
         gG6mFh5CS4QvVagyz+ttutkhDj5/mnQ4HlrlNUNnbMT1VQRkyJSO3OhCZTrukSK99Jv8
         tNaw==
X-Gm-Message-State: APuU4Z9+8G0GqrOvtS+DJFE0Redf/DlR1nL8fjSismXjkdNIZiwVtNif
	sCQfWo2vMydVfWK9DqflfZb575T6wAENwg/0TXUsM+J0OErZMJSyM8NqRkfPyfx/0/86eT9WfeI
	drQk92wbJBxiegT6gHhtfmSyYklJWAxciaLvlvs6xty7djXWHTfgRAdDWVJMzMQuvjfQNpJjZ
X-Gm-Gg: AZFdTZduxSonEh+Gn7v6S+iMZyr857V6YN3g4s3UzG7NhR0jKzKOLsk5nbuncBbNMpx
	wkNF5FIAz8YtDPGKbByA5HwV9h3udpx87aAir19DmdWDlskAO4hk7CnQTDEl+qQZ4m4lambFqpU
	8GHKMtMLVnGqUtMxfXxS2Bip0EKbbWRr17/a0TVJqUoV4WmjVBlb0aaavSwWf3uDEjRsCMoMd6y
	XcCp+oDqC3NnrhAL91Aoo0clEjPmM36v5JOYT2QMKEgmd95NawHXwv/CC3oah+RTMC7SU2x2F4Q
	kFS8p2aew8z3JWadV3hz8zPwJPlnoSEso02iD42x1EX4q2cy8wg5USZuV0TwNHmzN5mYwWsy2rj
	63AZYZqv01dnYjk9yc87TsYYmjlKZIbuG8fqtU/j8IpELHiBKoaXVa0BnEBi2TGTLDh5jfbPIUC
	Xqzz3/6SWs0g==
X-Received: by 2002:a17:90b:4b82:b0:3b3:b632:7f1b with SMTP id 98e67ed59e1d1-3b3d07598b8mr1726896a91.12.1794979432219;
        Tue, 17 Nov 2026 21:23:52 -0800 (PST)
X-Received: by 2002:a17:90b:4b82:b0:3b3:b632:7f1b with SMTP id 98e67ed59e1d1-3b3d07598b8mr1726866a91.12.1794979431674;
        Tue, 17 Nov 2026 21:23:51 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm2383976a91.14.2026.11.17.21.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:23:51 -0800 (PST)
Message-ID: <c32bcfe7-4258-47b0-9f71-c26bb232c23a@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:53:48 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 08/15] wifi: ath12k: add Wi-Fi 8 HAL ops and
 descriptor definitions for QCN9575
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-8-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210876@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210876@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX+WIoW/WZ1jnh
 iSH7EViufXCXndMtKSre9f2DHzaFShrVUL6QhXgQzwnuZrbs4z2AeCtRoMuPqATCuWHY8wvrIsz
 lcvXjr8bJwmLdSturWslBl+EM3Gnj2g=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd3669 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s3KEoQyvBckcJShn9SoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfXxoqi6pUkYZJM
 V1ULM5u6q48SZT5lFDAYixgEEksspnOwz0sL3Fqe0XlRy10MO+Nydgz8Ok6VxTrRzNAJHedkO7D
 sR9XpvCifCA0kqpl43xntwFO7wK085uyCyO9JY/77CVXnuIaXwr2KcxOCfssMBjscIqFtjvWnaw
 mYkREHugW+9Oij/FOssFmFRAimdqKqmXtembVC2aAcnf/UUG12i4YdL+u2B6Tto7NIbvcRYWa0F
 vXwhabqds667tTrHqks/rF/XJmHASSo3ZGZeogGFwMLC1XOh6FIrCJviafO8xnJSOQsTW2yhSh9
 Vqlunzzz/ZFxf6SO9r+hes0kuFbvnHGCWsigw47k4f68vCvUtjeck58/304Z2OZzDigI+9IgFWM
 tJkZhktQUElt8I8p5KK6W5nlM5qCU33W2X1DozBmLpDomBPUe5t8SGFjFSBuVrym350T6mj24EM
 a9fL2Y73i4MvcZjMLPQ==
X-Proofpoint-ORIG-GUID: io1_cufNzn3f10nfOfKz5Zb30Hq09Ako
X-Proofpoint-GUID: io1_cufNzn3f10nfOfKz5Zb30Hq09Ako
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021



On 11/12/2026 2:55 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] wifi: ath12k: undersized srng_config in
>    ath12k_hal_srng_create_config_qcn9575()
> --
> 
> commit a0803bb7ba2b3bd95c6970f62088631be5af1b5d
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575
> 
> This commit adds Wi-Fi 8 HAL operation callbacks, CE descriptor
> definitions, and wires hal_qcn9575_ops into the QCN9575 hardware-version
> map.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
>> index 56d45785ecd44..076a5a609f8b6 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
>> @@ -2,8 +2,37 @@
>>   /*
>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>> +#include "hal.h"
>> +#include "hal_desc.h"
>>   #include "hal_qcn9575.h"
>>   
>> +static const struct hal_srng_config hw_srng_config_template[] = {
>> +	[HAL_CE_SRC] = {
>> +		.start_ring_id = HAL_SRNG_RING_ID_CE0_SRC,
>> +		.max_rings = 16,
>> +		.entry_size = sizeof(struct hal_ce_srng_src_desc) >> 2,
>> +		.mac_type = ATH12K_HAL_SRNG_UMAC,
>> +		.ring_dir = HAL_SRNG_DIR_SRC,
>> +		.max_size = HAL_CE_SRC_RING_BASE_MSB_RING_SIZE,
>> +	},
>> +	[HAL_CE_DST] = {
>> +		.start_ring_id = HAL_SRNG_RING_ID_CE0_DST,
>> +		.max_rings = 16,
>> +		.entry_size = sizeof(struct hal_ce_srng_dest_desc) >> 2,
>> +		.mac_type = ATH12K_HAL_SRNG_UMAC,
>> +		.ring_dir = HAL_SRNG_DIR_SRC,
>> +		.max_size = HAL_CE_DST_RING_BASE_MSB_RING_SIZE,
>> +	},
>> +	[HAL_CE_DST_STATUS] = {
>> +		.start_ring_id = HAL_SRNG_RING_ID_CE0_DST_STATUS,
>> +		.max_rings = 16,
>> +		.entry_size = sizeof(struct hal_ce_srng_dst_status_desc) >> 2,
>> +		.mac_type = ATH12K_HAL_SRNG_UMAC,
>> +		.ring_dir = HAL_SRNG_DIR_DST,
>> +		.max_size = HAL_CE_DST_STATUS_RING_BASE_MSB_RING_SIZE,
>> +	},
>> +};
>> +
>>   const struct ath12k_hw_regs qcn9575_regs = {
>>   	/* SW2TCL(x) R0 ring configuration address */
>>   	.tcl1_ring_id = 0x00001604,
>> @@ -40,3 +69,55 @@ const struct ath12k_hw_regs qcn9575_regs = {
>>   
>>   	.qrtr_node_id = 0x01e03300,
>>   };
>> +
>> +static int ath12k_hal_srng_create_config_qcn9575(struct ath12k_hal *hal)
>> +{
>> +	struct hal_srng_config *s;
>> +
>> +	hal->srng_config = kmemdup(hw_srng_config_template,
>> +				   sizeof(hw_srng_config_template),
>> +				   GFP_KERNEL);
> 
> [Severity: High]
> Does sizing hw_srng_config_template[] implicitly cause out-of-bounds reads
> on hal->srng_config?
> 
> Because the highest designated initializer is [HAL_CE_DST_STATUS] (10),
> hw_srng_config_template[] has only 11 entries, and kmemdup() allocates an
> 11-entry buffer for hal->srng_config.  Common HAL code such as
> ath12k_hal_srng_shadow_config() iterates up to HAL_MAX_RING_TYPES (25):
> 
> drivers/net/wireless/ath/ath12k/hal.c:ath12k_hal_srng_shadow_config() {
> 	for (ring_type = 0; ring_type < HAL_MAX_RING_TYPES; ring_type++) {
> 		struct hal_srng_config *srng_config = &hal->srng_config[ring_type];
>      ...
> }
> 
> This reads past the end of the kmemdup() allocation for ring types above
> HAL_CE_DST_STATUS.  Declaring
> hw_srng_config_template[HAL_MAX_RING_TYPES] would ensure all ring types
> are allocated and zero-initialized.
> 

This is a false positive, since the CP/DP changes will complete the table.
