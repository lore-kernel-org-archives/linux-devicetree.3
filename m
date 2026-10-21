Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577738;
	b=A6Ck3lTqeBUKzeMCfHR1TGhvKFjMIETHNTmPtK6ymdFjHOjvopHlJdYMcPHTx91MrfeT
	 a0RZOd/jwNSt/JB67Cs5TGqsEE1edJYcgRVPHPWGBvRgk8daySAQ0Xh3DLZs9ewwBY380
	 5fQnk3lVsOHFmf3xh8NIf1oYZvsfFBNN28JX205U2qenVoPOXrRZnLQMdkUjyDlYPeI+K
	 QdBol4XDSCEjZhGAu13YpEphHpztI/RyBgVq20gAOsOf8EUixolwd/wY8ZFPWAjC6Ki4g
	 ZG68Xqz/T0BSFXD5UtMX1scdAw5dY2P/XGvZ6ICmMt3cWMLjjneH/4bVpyYBECJnjqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577738;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uhoI8znfXdGm+yPN6uFO9tAaso3xMr1cOltvpbG+UDI=;
	b=V8KAtvzU2NXzRc4si68iIc+1XM+tbBD7Fkix0AenApu/2fGSCqPzlJ0nboqQEWuzeZAx
	 gdIEZH69BJCncBM2Qd6QaBY11fc8gH6DhtK2B6O9roUIXqcWuQqBmhkDZu2HjjSkkOR5R
	 L32JtOYNH/IcJqYUAY3TF92zKwwREh8G9dcYV3G7w1TF32U2FLKwxNQbgALZ0N4Ri9ZZT
	 sx+ZlojzopK0zgupHNWPPHlJqEcNMegH2krwyhKuWFgQV4SHYsIBsCiOD1LCyXM4q3724
	 OaHC2y4lezse2ty+6B/N4g38HjAyE4Sqvs7MdJY6czViE4jXq6S4iUGKwvT2YHZdvDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjfTWkdO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWHifWDP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF75606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjfTWkdO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWHifWDP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6RqS282269
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhoI8znfXdGm+yPN6uFO9tAaso3xMr1cOltvpbG+UDI=; b=pjfTWkdOnXjiMyxe
	CbrTorlcTfm6p8dazhPPSx58tDtspamwDRmSZiuvaFxMztwQadG4+WM4nWq4JAJj
	fhkMSy/XUf1ad4RBE49udduBMwH0eMQM5KqtwbaLGb/1mXNd5gloiAgxr6qJQ7gZ
	J1WBPtzazS1v1C11CWxeccYMtHUXDDda2GNgHxBjlUTHZNYTKyngBIl2EEt8STEu
	OTGSYV0qWiKuemGnrmFfkDjgn55yVEu3iz9C8UVHUt7CZVWyVoLOrVghloRHmVa7
	SI9yH00apE2DNPmX5NpfZCUs+bvukzQWrDmIDYHvyq0TIRKWxD4b6DowNTxte6Ks
	42is+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2h4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:15:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso664246a91.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577735; x=1793182535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhoI8znfXdGm+yPN6uFO9tAaso3xMr1cOltvpbG+UDI=;
        b=AWHifWDP/svAWzhU0uiHGaUBBbNI8ItyTa84nmJsdIs02t1ytrMfqrmt842RXCYgxv
         xqAPSKfVsTC9+IKrI2MOckCI0gQq5dswc4/eFD6YbQeF/V6tXPJfSkOuXdYLxDPyQQyI
         5EmjE+88HnjtM2Mw3PhFBpAnWnXQkAId5Uj70Z9T57FbXL1mxvLuVhM+A2pX+lXOYnmt
         BnNml/c9y4TkapGBemVWoC2AOaLaXRkU+5ZcR2I9CqpzwxnqgGRK3VTmXqahLTgF1wae
         HH1mxEssr9QcG7dW7dwqqH0HX3db+Jlntz8aW+cnygYrhm6zJf2f3fhbykCtJtSpJt/H
         Wi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577735; x=1793182535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhoI8znfXdGm+yPN6uFO9tAaso3xMr1cOltvpbG+UDI=;
        b=DZByknerXRX4dCHJ6O8w2vUjQC5rWTEHbwNIJSPjBwwU0c4gp7yb4xBJSs1pJyuaX2
         yLjBz2Mbi5gCp1Kan/Uy6OTEafxGp2sSL33XG9crdaPJJD9ZG4cETGNCibL2ZAjBdMe8
         ae+3aYKSNnWdsESEARkEn/R0OZsO2ZepUtCcDujZe/Lh/PL8bd0p5GczEg8p6EsCnHdL
         49+Uq9+IyD+4yN4k6M3rADC7K4cueroElOcasi8XWaad48VCjFuDTzihaoYJo5LK2dMf
         nkcLKNzX1lvES04EHJeU/ChGS2lRLbmJU1yDhs9UPIyCOmfYmDBRBJv/SUS+Yna/S7sF
         o7Yw==
X-Gm-Message-State: AFq9FYLalACM8GgWDx3zKVqHqf+WF525YQesklBMT4DUgG8Lv2REYElq
	KtWmRfYdp+qJ00vAeVHF+daPH2vCoBzsrPVYvG31La2udganP2QSiKe9fvkaRIM4IP3t7VMP5Ia
	VchOkAUYTk5uZdeQ0I04LLSlr1E36cnE3ABNnJrVPVyqXHO8T4mQHHVQyEawY046m
X-Gm-Gg: AYBFou3pg+xDoXa+kYPe+5rzEmdIJiRMDWPEC5zvwR2QkvSf9Idk3IkXbEgzdV0RXq8
	BxTCxLxfISOSJYlwkBRSPdJvewmX/9Do4tfuUCkpshAZyL3MdbCxmB2pjbiIQwC9fWD8vGsepva
	O3WCijk64zr2JCOOb5lb8vdMOPkIXT5M4o7JdjJ+KhhWKHU8DHMXCthdyyYpF9tiUR39i7jp5bS
	gU66le5Sc6a9vcWp4Nu86ySrHLjVbPUDWkqjGBfqiyAvgd+lEeSJp7kUqFI+nQHC3kbXTc9xKzo
	JmIAHWDUg8kvpadpDAy0mPF3WbwOY/sCfCxSwqVFkXdQktg8vRptTaaqjrM5VcqUkKJXjZJFnAe
	B2IDf3uUOTe7I/3zjZYRhpvK0sZb0ojscng==
X-Received: by 2002:a17:90b:28c3:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3ad86a44f73mr1374794a91.0.1792577735392;
        Wed, 21 Oct 2026 03:15:35 -0700 (PDT)
X-Received: by 2002:a17:90b:28c3:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3ad86a44f73mr1374758a91.0.1792577734155;
        Wed, 21 Oct 2026 03:15:34 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813de463sm3759170a91.13.2026.10.21.03.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:15:33 -0700 (PDT)
Message-ID: <40f9ba00-929a-490e-b578-f88867be383b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:45:30 +0530
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
Subject: Re: [PATCH ath-next v2 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-9-f510c33bfcf5@oss.qualcomm.com>
 <sashiko-outbox-173678@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-173678@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad890c8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LXZuLjuy80gFrzuPV9sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: jjeb5JaHGmS6-EKtDzAlSoBa9pZfgT1u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX0SloOVXRQrOS
 ghmzRqcdxQLZZUp5dklftDhfpzCEfa2u36LKKVRGt08kfy7Pz2RLg6rY+IPr8r1yOxsmf7RHP1H
 4Dq8rHHSRmAwnDAfQA+mjOv1wuqCEb0Qp2kJMPZFvlvRuJXQLUIJ6VOCzgAyQXnTYWLJr6mrDDk
 m4YMaK5MeHdrypkr/NypiCGb2S+x3j+k1XHt7AVjcIcwaVBvlZErapFi3xfgi2phJC4pYUS3RGe
 SbPx2QKvuEMH90uXL0g0i9DrMsEaOZSmyLAhqSAKwn9H+m9NCNQZEHjvymcaFtoYqRGdDO839gV
 iJdSpseYXy5Eg62e9gibjhntPsQH3vkpBxnlcOXWut3X9H7CeUOsxHkT84U+jsGNMAhWUF2zZ70
 IJ2tHNf/u5xQoeXNlcmsDSbSWJbO/my8TlimiUUevSs9kkBwLytrCT0g4ZUeJ9SDMePV80HITaj
 dTQ7sdaDNpIi3jpdF8A==
X-Proofpoint-GUID: jjeb5JaHGmS6-EKtDzAlSoBa9pZfgT1u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX9DMXMJGIS4Kg
 WG39gXZz1K/PgbJP3wjKgTRovJc7LRZKoN2zSt/yRja3diMXmUpLu4rYPLI7HEdg4RVASybnX7a
 v18cwrRELexNVyzjZhxsddbpI8XwJv4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040



On 10/16/2026 9:05 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ath12k: data-region loop incorrectly intercepts all memory chunk types
> --
> 
> commit 1f2202b158e5c8168f0cae90faae57bce35a9612
> Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> wifi: ath12k: add support for unified data-region memory allocation
> 
> This commit adds support for devices that provide M3 and calibration
> memory through a unified data-region reserved-memory node. If the
> data-region lookup fails, it falls back to the existing per-memory-type
> allocation scheme.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> [ ... ]
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
> The commit message states that only M3 and calibration memory should be
> allocated from the unified data-region, while other segments continue to use
> separate regions.
> 
> Since there is no check for the chunk type here, won't this unconditionally
> map all memory segments (including HOST_DDR_REGION_TYPE, BDF_MEM_REGION_TYPE,
> and MLO_GLOBAL_MEM_REGION_TYPE) sequentially from the data-region?
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
> [Severity: High]
> Because the function returns 0 here after iterating all requested memory
> segments, does this entirely bypass the fallback code below that maps the
> dedicated q6-region and mlo-global-mem regions?
> 
> Could this lead to device initialization failure if the data-region is
> exhausted, or place hardware-specific memory segments at incorrect physical
> addresses?
> 
> [ ... ]

The expectation is that each firmware memory region is allocated either from
the data-region or through the fallback mechanism, depending on the region.
> 

