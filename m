Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564825;
	b=pVcbXPiBkLXaCuDsB0T14243FuD5Pr1EcbMXldOsFfCkWlxkgj0pU9r09JsFNXoZD7Fs
	 OOyfM3zavIdsSeeOXtvxt/7g2lSFJpr7qTgzxFx0BRjujaiw7AGVlQgkPYf64siu9H2CQ
	 gr+ZKoB7RjNWgcz5kKSj8de8751aHp5B7j23N4dn6SuH1fvQlt2+Q0rYOtuKHgyOn2+TY
	 JahZclt8c1DtchNtAAejZDSCXZvV5Q5nj8r2xpb3mtYWdouy80CvlpFkGaBGgdnMsTG9z
	 mHXomRz1Jr1cKiGvsKSdcesuQwPzfQUd4jiPl/bQru1hJ4GUNkOByn9DUwFFfqsmg9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=utB722pG4aKnLgm1naB0eRVd3F+Nmy4KeTzvcR2uhpE=;
	b=x8lxAjyrF53P3iyRKUcZMQQcNMwo5VyG+WPJY43/gahawRFcQWvsfq8YogdedxpsWEnr
	 4+F5r/d1/STzECImOUziK9fkCuJVTaYQJwWdlHNHhmoRT4WDaYficcoDvQ789UMbR6PZU
	 vWhs+0BJn+g+Adbr95XKERbVKGMgiX74dyXHtnBBWey/KviRdAcxEU1P8bG31luI356sj
	 OODvs0ljt7ZAbR2uHn3A8ELTpfrdyH/jc+2/iOq1eTHy++K20kA+MXI8I1yrYeRtFUSpw
	 gPAa7BqZyTNiQH4XEzZ9Qr4YsqGHdCN+INaaqw+QnCswrjUmoVVfzakrmKlthwd0rCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lO6BK1wQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuvOooLg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E13C606A31C
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E13C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lO6BK1wQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuvOooLg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j7sS2411465
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utB722pG4aKnLgm1naB0eRVd3F+Nmy4KeTzvcR2uhpE=; b=lO6BK1wQKiqdV5i/
	zQAoWoJtXWRPGU5Ektk0E8e8/1DZaRYp9Cuqq3Fzlf13OxQX7+vIgKo7k8T2C8Ax
	BAmY6OPZmTWLlulKpPnuWjg6XX5mokYwZXGvhLxqZ7xDr1cpkyza728WHuJU+EfP
	KHCVVzmaB8sk7jDnY3QsD5G7nWIrELxjb3qixf3zoP/e6z3S1kPNkihtKXdsp/kq
	IsHiy5K74XSiHCIq5sAzDBNRkn6UMvZMkmF7AgPEJHN2PQdD0d3PTdgEccmHvbiK
	OcOL7tPEaCQZulRJiWy6B+qw7HS0S7JjfUY0KTw7zstVG5RURDd4ZL2HK77Izxkh
	V7iENQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvbuhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:40:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so353525a12.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 23:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564824; x=1793169624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utB722pG4aKnLgm1naB0eRVd3F+Nmy4KeTzvcR2uhpE=;
        b=TuvOooLgVObjx++0ydC7o2O+TlnQ3oLqj8aVrWjxExZmRh7L9HEbukgoBpkAIqRm5x
         zHSVW6gH6ATKEqRuZ0VLtzgZlijeQRUhers63dB54pTrlGudU+a/WCSdu8k9CX+FQ5pc
         yuejso43gsTWWhwXlaFMeOeLeBfUqHx1HjgMSihkRWnxV7QjiKFaEt4guXZ8iUb2Hsgq
         D1Xd61SchXotUegCSUwN73SSLrqdmgwmfcqihIF1w+Lru0ipBVe3Oc70ReUE7nC8IzqW
         3DL6klobmt2qYkltVE+qxM6nJc3oMyGQcGdimhFilGNmU7+Y3QSNBkwDt5rKsOI4QqFW
         7f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564824; x=1793169624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utB722pG4aKnLgm1naB0eRVd3F+Nmy4KeTzvcR2uhpE=;
        b=DxDjdW9XNjNMRqCgAxfnrZYVkzZkFnS1jXIf/TDtWzLvKw8MfAShOzDlizTKeirBZ2
         NXKLNVwW2cDHGbReYO56mTfJRNCmgINgoXQuI+Th18OY7KccmDNi34BbXuupgnOeS4mv
         Cbvk0tPvGn99r/a41Ke7yxSwZqI3sVg1LmYNw1vcBBwu5oOyXQaPYCifzYam9gOq1dOn
         Sxik38n5Wuldi7Iti0MGOMRvkJ7CqAHa3j08pfyYDGD9ozA75MfOBRot0jLFiRINfR+R
         ez6TEg/SlAuRnQiXGabaOvSpfFjVTGMrg9OAJCMThScE0/6ertb3yDZLKmKRpYBMQgtd
         ElVg==
X-Gm-Message-State: AFq9FYIB3V1O0K7J7UY6KZ9CVQgvGBpg/CiVsTZOhyty145y/+/VSlB5
	czADdrK15zg854xrqSZYsCZLGRhSGxGBYbIngDBJRjyHoYt/VQ2We2mewzgZZdNa9zTbEK4Jweo
	OofHlp72/bU0JVF+t4UjwB710G9AudPPydnUN0pwrWIExCWTRyZzl4VYoT1+bvVe+
X-Gm-Gg: AYBFou2JPkjdA7CjVSrU0QNIWVzhjO8aznTeLkcdLF73F6v9SVzB8OFJ424RavWlWvL
	XDs676r48d867+4pcP7X7NlLlQdYAJTZ9oym0Qcb2xNBMAYfMt3LXV4TN7mgq21Z1Md1/A3vKGr
	K3RQ86K5hdbfl2X+WhyiCGtNQCXCDNWXJZgEcfr4cq8jQZ7MfCzLWXy2uB6qq9jEWV+whxZGedc
	uRE9CRuR/2Wo6MgFJ84LLvhDzQoWNnGcn3CtOBP4b5M7jQfFFIEB3v8IFv3o6KNd5FzlxbYhMJK
	rjIj4hxFTao/yvdeBEe8poLVdzdM2PiCplIzW3VNrDjsLra0pd7O7aWkRUE0mws1B97a0oDDnDD
	SDPsoAWTlK9f0mTrICBtJ0ZA2iCcgt2DGLg==
X-Received: by 2002:a05:6a00:1f12:b0:89d:e6e2:b2a6 with SMTP id d2e1a72fcca58-8a089d37713mr858462b3a.45.1792564823796;
        Tue, 20 Oct 2026 23:40:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f12:b0:89d:e6e2:b2a6 with SMTP id d2e1a72fcca58-8a089d37713mr858448b3a.45.1792564823308;
        Tue, 20 Oct 2026 23:40:23 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a089611088sm441564b3a.54.2026.10.20.23.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 23:40:22 -0700 (PDT)
Message-ID: <5e649ec5-48f7-41c5-ba61-78fc7c26dba1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:10:19 +0530
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
Subject: Re: [PATCH ath-next v2 03/17] wifi: ath12k: Add hardware parameter
 for QCN6432
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-3-f510c33bfcf5@oss.qualcomm.com>
 <sashiko-outbox-173693@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-173693@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX6E7A6bLMI3vz
 MreyB+iAHV/Gq8YA48DQzVCCe6wBx+2YspsJZDDnAlwXSVbUTpHL1FePFCS85EIY+iWwEzHLcSW
 udl45VnRM+/Y+UTpQRFmwAckTY5lJIRkzzqatiyVa3DLjczJj4vMjj0R+7cUlEHKUl1AyqZUrnx
 63HTwWGSc4xX2DRkeMdZ2sTkkGHQcQEHYpKdAy1V7vmfqn2Q13uNyGcraFjTF577X/lTwv4elyq
 B6733H8GYLc9uTNhxz5Md1isjitUD0Tmktr6+jOtvyXWcwAT7WlSoSbpS+/NGXP8jse+u2rZWcM
 Lfm9cL6cfDX8ES42hpj8JNeJbMD0vVEfMedt702CUCBZDF3f1yBbF/jYE05P4web/tGtubnX4Ey
 1mKubY0SsHUjZYtgoUE0TTslDrZh9c8ePAN+YSmUAOXiBhHpDMHARzb1NvevU7YxnPbHaks4jej
 1nLSjNtIdWf1wyRW6Hw==
X-Proofpoint-ORIG-GUID: -XAlU1bmSNGcjHg9EY94oRmdSV220NqI
X-Proofpoint-GUID: -XAlU1bmSNGcjHg9EY94oRmdSV220NqI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX6Xtc+40sWOsk
 1NOHw4j1jP6xIOb5+usctAXBNC2SvhehEVanjksjpHlyM6GZcXaeNdmhzJA/Xf9uCCmatPLo7Kw
 7D3K/Z3OelCTxeZf5+vZLGhfGVXf7pA=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad85e58 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=TF8K1ITAIdH5bycUbigA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026



On 10/16/2026 9:11 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] wifi: ath12k: missing qmi_max_chunk_size for QCN6432 breaks memory allocation fallback
> --
> 
> commit 417c2f74682574a9e982b5753b7747e20b63cda7
> Author: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> wifi: ath12k: Add hardware parameter for QCN6432
> 
> This commit adds hardware parameters for the QCN6432 WiFi device in the ath12k
> driver. It introduces a new hardware revision definition and configures the
> ath12k_hw_params structure for QCN6432 by reusing parameters from IPQ5332 and
> QCN9274.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
>> index b1c17cc197dfd..494c7b3ae1acf 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
>> @@ -906,6 +906,91 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
> 
> [ ... ]
> 
>>  	},
>> +	{
>> +		.name = "qcn6432 hw1.0",
>> +		.hw_rev = ATH12K_HW_QCN6432_HW10,
> 
> [Severity: Medium]
> Does this struct initialization need to include .qmi_max_chunk_size?
> 
> If .qmi_max_chunk_size is not initialized, it will default to 0. During
> firmware memory allocation in ath12k_qmi_alloc_chunk(), if
> dma_alloc_coherent() fails, the driver falls back based on this threshold:
> 
> 	if (!vaddr) {
> 		if (chunk->size > ab->hw_params->qmi_max_chunk_size) {
> 			ab->qmi.target_mem_delayed = true;
> 			...
> 			ath12k_qmi_free_target_mem_chunk(ab);
> 			return -EAGAIN;
> 		}
> 		...
> 		return -ENOMEM;
> 	}
> 
> Because qmi_max_chunk_size is 0, any failed chunk size will be strictly
> greater than 0. Will this cause the driver to indefinitely return -EAGAIN,
> asking the firmware to supply progressively smaller chunk requests, rather
> than correctly terminating the failing QMI negotiation with -ENOMEM?
> 

QCN6432 uses fixed memory regions specified in the device tree for QMI memory
allocation and does not use dma_alloc_coherent() for this allocation path.
However, I will initialize .qmi_max_chunk_size for QCN6432 as well, since it
is a hardware parameter.

>> +		.fw = {
>> +			.dir = "QCN6432/hw1.0",
>> +			.board_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
> 
> [ ... ]
> 

