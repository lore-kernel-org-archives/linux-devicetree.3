Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEBA44163B
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789912; cv=none; b=aC+YT2j51LutJrgnrPduk4Cf6rBckhF+WRukwknDu0OUXLQPHNnoAsem3TW6jxwe7joMjD80HqrkfhhRFPaQMxI2oDcqm9E2D0xF4oHmE+wYUZ7Hj9juBqLemH8104T4ER3skGcKY4ipLSOz/vO1GX/tceOkg48YuzycC/ArcJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789912; c=relaxed/simple;
	bh=hEdQqbGZT1mBs074Be6CoQP3CZwoEub5t70to2oEx74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8BYzf4UXI859jdfga1qpiYaYqlhgvdCRmQESqu9Rf6VLwsou7LEEKuBB6bj9eJ8qepmAo0Vxypy9aZNbpg8ReDnqQoY1cnKRjuiO/Ckgbbg1uioAIBzp18E0nmRX7VEr2puk6FEJTEZ+AE2g8wOwClf2EToa1eWB6B1IlK5Z2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuC05lsR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcT/uiKS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuC05lsR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcT/uiKS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55dox1314464
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOLBtsjSgsUhKw91rtETWlZx1b7vowcBkkj5e27BbJ8=; b=MuC05lsRPOh01+Of
	nw58vjwozJMOfVbOoe6pVTiD0TCWH0iuZbvpen7NXuZrL7n22EsvQN3h6gX5IFFo
	fUZneOmOe/SVJ8PgXmWfN1Len3DR1DdQGrBIreOGhomF8ZZbrOufK5v23sCxP01z
	ZB7tFZkKCeSC2unqOfZ6Xr8qAxFYFNkXEsNj3VVoWxSGZ6VvQ2ei6PbMI0n9Tmiy
	CsmRTjxSVgg9561Ht3PHy2Q7VQmaJ1tQfXl9kRFLJHHAJ6A8uTLATzYiXDJf8WeM
	r/Gvv8eLik1JdmRKetXtCC7NCtfRK8kzB3w+v0iqwydg+PtYFyJoXjk9L1iMsPbl
	dChteQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j711j7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:25:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso2401714a91.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789909; x=1792394709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOLBtsjSgsUhKw91rtETWlZx1b7vowcBkkj5e27BbJ8=;
        b=YcT/uiKSC1Q+OPa6QLpDgSEh8qJ+xTazldaFOtKz2i/tzpYEeo+bWExg2/AAZSkg1o
         7IqXqU+tEIpnsGwFqTGEty0VA/3VIhpc24A3B9/S2MyaOcPEif+J+iTcOdZXyXYCCDn5
         pUSWyrNLK9gfCdjwqLgW3tfiVE12G2m3rlq4VKnVr6a1TAtz+E7RIc+N14l1yvlUCWyk
         Pg4K2+7eZ8VsnwRIKkFUMoxlnTV4g9x7j7P/K898xJwGji18jljWI3PoBIukDwVYWORd
         2ZXINOz4ZxQBq/AJZyUki0tl6xsmVgDEFSj+QXXUXGc9e8R7xbYb/IWjQ7lnpWYj3DIn
         cZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789909; x=1792394709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOLBtsjSgsUhKw91rtETWlZx1b7vowcBkkj5e27BbJ8=;
        b=x7/aU/2xDdFwRLFhfeJ7Fi7wv7JykhZTk73wBwPupUTJ5cml66NFJ2XYVQt0+rO6lA
         zcTYy6HYHDXUEyf1z9t1F68NVapPB2/zr9d7FPa32es+XkV0IpfLEFptmOgnEFJl4KwG
         79I8LhWF5fxMf54pRhEZt/A/v9z+pJMqBeyBWdAw6HzdBO7IxZGcSk7ZEmcXKIfH1cnF
         sMNABhjecMGpBG3JQPWszM0LGcD3xznKX8ynLkCAGjikON4e4jk8CYRovMVYx5fn4Ncr
         JAf7uxmO03jwQT//1iapIi561mdZkIoZBkknMppO1LcwiD58tR6FxBGAPK/WzRd2Cyaw
         Pakg==
X-Forwarded-Encrypted: i=1; AKwUvBzfqCbsCPUAzbBAixHN49oiqB/hzwEauFy0zTNVyo8E4KG4dr4WhBalG6wOW8VM6wu4V1T4iBCMGaTx@vger.kernel.org
X-Gm-Message-State: AFq9FYLvpi7FjGixXUZDJRHJWF24a563gePbZlkdv070DfzkgKKHNrj9
	Z++DLy69gYBb6b4KOzArRsnSoE2yLjuoSuQyY3tw9Av1SypzNdsJvmj1Dwso2jBrgOGgRyleuSl
	NOq7tZIJH5TslfrH0Il5xI3dFrADHhH3ZUvJydmUBUbQo5Yosv3B6gst0c4kAeeeg
X-Gm-Gg: AYBFou0sj1i2cgUYo3+p5LNIZJ6bSfyNipLAIlsyqPn4SGObJtAMYYqjTWsBhE0mhFB
	42jwgRzIGL5gscy4kpuKW73+bghb3yX+X3HJQZPqRTX/tvLlOydcm9rF6f0hSojADPz1d/oU+6j
	/bl8CI7NLPyIbq2zhBFae6GT6SCnonJkKg1hXU0mxGy15UWJ2mXiTY+/gBUi7MpLJ4E2vIXb4dG
	4CqyyH9X7PxHZET2Z2ki73yWLxO1OhJ9CLbwRSy2QRt+j7kcWmFCOQ8FaTiMnxPbyb4MU7nArds
	PRU6fuTKd33NiZyq7mKE9lizNV/WTXwpUHnwNXkddnk6DSM+1PzrHWS9C2shbHSPWd4txLPz7Y/
	ZN0CQ267i5TMjxP6geBRekdp2vwzHdPrblw==
X-Received: by 2002:a17:90b:4d86:b0:3a6:d851:21e5 with SMTP id 98e67ed59e1d1-3ab3a2fe72dmr6631477a91.4.1791789908518;
        Mon, 12 Oct 2026 00:25:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4d86:b0:3a6:d851:21e5 with SMTP id 98e67ed59e1d1-3ab3a2fe72dmr6631459a91.4.1791789907913;
        Mon, 12 Oct 2026 00:25:07 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm15769738a91.17.2026.10.12.00.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:25:07 -0700 (PDT)
Message-ID: <67892660-8ad2-4d53-9b87-dcd81d06e746@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:55:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-9-2c5797b5e4ac@oss.qualcomm.com>
 <sashiko-outbox-164021@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-164021@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXx7GkDSlh6b3h
 BJCIL6L/+jCHL/s0sc3r92q+9as6ZGMTxHWLnv1ZG7JNcV4dmEByX9AbOWp5ZAiMdZ6sBC0cLam
 NQdEYrnHpICqKCkU5Muaf7HZp3FMnD4=
X-Proofpoint-GUID: yTvbGe9mKN5xIpnthC7BihVk8mGaef3P
X-Proofpoint-ORIG-GUID: yTvbGe9mKN5xIpnthC7BihVk8mGaef3P
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acc8b55 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LXZuLjuy80gFrzuPV9sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX69IYeXOC7wIJ
 dTF1Pg+fbzSaUhoQlfLSdVhto5+jf9MTGJwTCuuMd1z9Ik8lrs1XSlngRftUiJC3A+2qAYq2aXj
 1RfxfP/k5qfCOMbuVNBOLR+NARMMl6IeY8Q0u4dBBqTGF3RzKqPElFXnr7UAZivo2OSF8g184lf
 7zhnIzjWsfhXjPa8IIO+QykDgF1LOFfj71hidaVmB4Ee5auDAqgOa9YkVPANh3D4qC79PqdIb10
 +EIQx72s7zqOP5KWdW/nPpDRM1R56P5SJ/GSEEMimRlCyBim3kfbcIlNMNWyeZZr+0u4EWNjQ5L
 MBjwsRbhtLhisZxQ9mYZMO9cd1Rw/v8rQhv5KdLVQUGQtCG1/ufindbvjHeLvg/b2fXJo7DOcWE
 8cWjI0hTXZpbFf9QE9sZhN6mDNkGlm4S9PY+LMYvyIyQnY9RZvauoMODfC8uaB1GvfbbIOtxQ7d
 DXYkduxfMRphjfQZv2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029



On 10/8/2026 4:05 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] wifi: ath12k: qmi target mem data-region misallocation
> --
> 
> commit 889e203c71e56c91154908ff956ce486dc098cf4
> Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> wifi: ath12k: add support for unified data-region memory allocation
> 
> Add support for devices such as QCN6432 that provide the M3 and
> calibration memory through a unified data-region reserved-memory node.
> If the data-region is found, allocate each memory chunk from it sequentially.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> index 817bd820623d2..cc488cfe2b2fb 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> 
> [ ... ]
> 
>> @@ -2851,6 +2871,48 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
>>  	const char *rname;
>>  	int i, idx, ret;
>>  
>> +	ret = of_reserved_mem_region_to_resource_byname(np, "data-region", &res);
>> +	if (ret && ret != -ENODATA)
>> +		return ret;
>> +
>> +	if (!ret) {
>> +		avail_rmem_size = resource_size(&res);
>> +		for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
>> +			chunk = &ab->qmi.target_mem[i];
>> +
>> +			if (chunk->type == CALDB_MEM_REGION_TYPE) {
>> +				ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
>> +								chunk->type);
> 
> [Severity: High]
> The commit message indicates that calibration memory is allocated sequentially
> from data-region. However, paddr 0 is passed here and the region's offset is
> not consumed. Is CALDB intended to be allocated from the data-region or
> mapped to 0?
> 

Since ath12k does not currently support cold boot calibration, the firmware is
expected to provide a paddr of 0 for the calibration memory in this case.
>> +				if (ret)
>> +					goto out;
>> +
>> +				idx++;
>> +				continue;
>> +			}
>> +
>> +			if (offset > avail_rmem_size ||
>> +			    avail_rmem_size - offset < chunk->size) {
>> +				ath12k_err(ab, "failed to assign mem type %u req size %u avail size %zu\n",
>> +					   chunk->type, chunk->size,
>> +					   offset > avail_rmem_size ? 0 :
>> +					   avail_rmem_size - offset);
>> +				ret = -EINVAL;
>> +				goto out;
>> +			}
>> +
>> +			ret = ath12k_qmi_map_target_mem(ab, idx, res.start + offset,
>> +							chunk->size, chunk->type);
> 
> [Severity: High]
> This loop maps every chunk type (other than CALDB) sequentially into the
> data-region without filtering by chunk type.
> 
> Since the commit message states the device tree continues to provide
> separate q6-region and mlo-global-mem regions, won't this incorrectly map
> types like HOST_DDR_REGION_TYPE and MLO_GLOBAL_MEM_REGION_TYPE into the
> data-region instead of their dedicated DT regions?
> 

The data-region is defined for QCN6432, and MLO is not currently supported for
QCN6432 on the AHB platform. Therefore, the firmware is not expected to request
the MLO_GLOBAL_MEM_REGION_TYPE at present.
HOST_DDR_REGION_TYPE is expected to be allocated from the data-region. The intention
is to allocate firmware memory requests from the data-region, except for
MLO_GLOBAL_MEM_REGION_TYPE, which requires separate handling.

The MLO-specific memory allocation can be addressed as part of the MLO enablement series for
AHB devices.
 >> +			if (ret)
>> +				goto out;
>> +
>> +			offset += chunk->size;
>> +			idx++;
>> +		}
>> +
>> +		ab->qmi.mem_seg_count = idx;
>> +		return 0;
>> +	}
> 

