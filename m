Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576923;
	b=Ip7T6Yowusn+I9zeiPNOfafrIbs7axl3rQRPse8+YhpdTvV+598Fqz13+hH9UTLqxrdj
	 mv2AH87Zb18etJv7/dbiqoSHZyrJ3HDQHWdUHqqjJsDxxhm7L+EVSjJ2a2TyDIcqAI49b
	 SYHz9w+mQO2TgwUecNF4I1aTSzkOUnKCGAe6V0NWed6x5Z4wEgvyPFJ7vj94qqxpxXbdZ
	 4GYoCuBxML5hfh7QrzhBlb2WrIccAL3m7ATlV5Nu714rQ8qsDaYkBGZIgv9zscIesOG7G
	 i1bOuhcvrFqYtPwSHMBJ/DqB35F+20g1kLRL51DJ8fm4t+Z4CEvvEYh7FUDTzWR6j7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CJOiUgrxjc+64U0G2mkIKbgMGJKdd6rz8j2md+6Y6n0=;
	b=vOgiHwkny/KGtHx0NMnj4KO8KIHZQSwPxKbghpWVCc1xUy8JYasfEPHBegQHQpQ1gbwk
	 kNlMaybHEFUlqsm2+nM9v8ZXKdGSz6nA05b8N66r2TCPkjjp6buoBlz3u+PNmGByZx1C/
	 +lie50PBUxgNabURbWbL93okrmiiRk1OefNC4dslCNVTqkGzUmsbrvChJhYNdXkLCOot/
	 m02SEWaYk5M1PRZ1f4Pf4X25BUpNprjI5l0keztUiowi2QV7DmL7iZCm/HYyJqU4t8yFR
	 A+2goOGKMpfGBxRrT0aR1zLziTufyKILzdnk3Ld/kknsfgSDuCwbXBTULpK8orgzV5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jw1qjqgg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9wYmdgd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C58606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C58606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jw1qjqgg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9wYmdgd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0E2756335
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJOiUgrxjc+64U0G2mkIKbgMGJKdd6rz8j2md+6Y6n0=; b=Jw1qjqggAC6SQMwo
	wCMcOCaj+FZz0W6Rzn3sjUodPfIWWDb8DHeh3p0qFhTjiIdKubwHLuLAkOZF4sb+
	wZ9VyGkBobHnwxwjCAFOY4u7UCS14z17tdyoboIna7tlIZtZQA3VwMWbtwNTp2oZ
	D9z9LIODIif4MxLyyf23hmaHuyifkyBDB9UHzRmp1XwXKWo4GC8ulvQGkNSXEZR4
	COqcQfdzxazU1n/+y7rtspk2AOqcWsiOAnIf0xxXTGHjNNE94c0j9rKlBsc+8CPh
	d3zYQkt6EFhCEt3NyasjqPJvfjxH5Iboh9gpWA9zcClQkvHHdmsgcCLZYOJ1G/r6
	/laOzg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ubm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:02:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso908035a91.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576921; x=1793181721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJOiUgrxjc+64U0G2mkIKbgMGJKdd6rz8j2md+6Y6n0=;
        b=B9wYmdgduTVZOg5bZwGwNVK4wYHMJX6SNIdokcx9VScYMa1OM9YpGeqI/xkQTgfYd9
         PH0CFjtLgCxEnBj5o+wXs85daJd3ks/UFXRbL4+L+jdxcaplu/USZrO3/mMj+FoPLSCn
         YXLHX5/UU+8S2KPrVbXZfTk0j+wxrLqH+FVf5IdaOZxhY25zslIN1l0YIQRfAjiji8/k
         yeL/pDW+hYZiVQJP+k8TbQDC8sFRlEvjoOBuYzKUA32PWxDYgkM6KIFREOOfrwsaM3pF
         JG+hU929cYNhraA5wifxsjuz0+d8yQbBq4A2og78wEmjmvayfVzJx+PI6zGJavlXf5jP
         4Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576921; x=1793181721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJOiUgrxjc+64U0G2mkIKbgMGJKdd6rz8j2md+6Y6n0=;
        b=Yl1UzbAJfWgSyk3DPH0fWQ3cy3GdeHlFeTRtlDj3VsR5OK6sRp46n7+HJownHovQyt
         MvIm1gar1io6Vc+azDKoOUCrLtxnJ0gU2FvWVicG1BK3kB+1M43WwwqZkIcYQbztZZpA
         8Bv7tKA3kLvTHxjQ3yeyltAYwbDDbLOCcreao0C8cfRuHwTbxFQCuNSVBMEuoYdOZR1d
         4jy4bdzQMEbK0wJ1lnXJwX2qItCkpLYWv7Wyr6gEPbGHEaHTGuXqyw1q6dO4ynGpYjOb
         SthaoYY6EEFsopyz2Yoti/S3eb9qi4S052vz8OXdeGRk3Ruc6vuSWsdgrszXqwNT4SVf
         TZOA==
X-Gm-Message-State: AFq9FYI7STkNB1zlPWzZHscXPMrh50o0133AWpZPSjltUyg5dvNmKnqh
	wj6E9giuM1wN4GBnGzGtYj4403zm25OiOYz61Fm85+YpQ2y8KuWxnXB+r7aFyLun+zcK3TJwWLZ
	go2j3foEZ8GwJPOPl+JExS5IPI73ah9ktvTcMDmbuN+ad7FNgO5QAEw4WAk3gxmWU
X-Gm-Gg: AYBFou178MAbSJ2eyBFtxTVnTT1VRbtDpw0fDvqxTjPMynJS8fKvFU2XuUrBYhe1711
	mM7j8O/0YnpNBWkxWYh2eg/pQbbZucH1zyM/2HnuozvjCOX2HQh33JEKqs6g6WRob08rEhWdtzM
	nxd2ZIOghe8gvVVepz5F9q4XIihepQiUpSIfNn3JyBTONLbB+UPGsiVMX+4Ir6u18thLTsFEQ9l
	sXNeiBum07W6Ervi6ZumjP9/GPQmSn0G8ZUqNZa42GYD01OOSRbuh1WUEyvQ2a7Pu+2lDKdT3/J
	YeamjGtDiL4r0EadXmycRx9ujA4x1MrvscchH9985FmGNjMegLfPpVZdiOMKSMrZLs27v9skrL9
	F8hRfMyJLY3wNQJLgf8nkoh9/oX+jqAOyvA==
X-Received: by 2002:a17:90a:e707:b0:3ab:b39f:41ca with SMTP id 98e67ed59e1d1-3ad86f397e5mr726746a91.31.1792576921473;
        Wed, 21 Oct 2026 03:02:01 -0700 (PDT)
X-Received: by 2002:a17:90a:e707:b0:3ab:b39f:41ca with SMTP id 98e67ed59e1d1-3ad86f397e5mr726729a91.31.1792576920944;
        Wed, 21 Oct 2026 03:02:00 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad811c515fsm3426879a91.9.2026.10.21.03.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:02:00 -0700 (PDT)
Message-ID: <02c95465-fca7-4324-bb9a-5bc2b34049b3@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:31:57 +0530
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
Subject: Re: [PATCH ath-next v2 13/17] wifi: ath12k: use CMEM write for PPT on
 hybrid bus devices
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-13-f510c33bfcf5@oss.qualcomm.com>
 <sashiko-outbox-173688@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-173688@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9hCMMghHzlm3H2wNWo9s9rkd3MwXr2o4
X-Proofpoint-GUID: 9hCMMghHzlm3H2wNWo9s9rkd3MwXr2o4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX5GjRZqfaK1qM
 FcYI2/8l1FHqrNfKTxtQy3ihbzC4gZw7LlPWMmezMUJmBE0Bbf039phN3M9SDioXa8ebckaa8UU
 YYnQ/ddtAoMhSv2PzD4+pA6YsGsolh8=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88d9a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=svsrqo6iM0rPbd9dxYEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX6jYL5LQcpr4K
 K95IHkc4FJYdpb2YMrOWtnGBiZnhv+Uk/sse/Un9am/zS1jVf/SS1uIJqgJ4buwCtdJeTU27Q6V
 bhvJE4kZSIKZ57R25y9OYlW5t6dXOCu4kIkbSZjzClZoLieQSDAyl+YJhrWHIe+M9ava7QBwnr6
 bqp3XNOJZLxVnhoXJzJKeEJgWtovopXEZNeVeR+ST5V4Hi8YxjsWnAIBqNExLb3sgnwRwMQnsue
 8JkiiiX1sMw5k+mttmPFcpqTQT0Y8ciBxWRsld4ZJFt5Hoo731SuWofRs/4vjlIwEtfwq6XfeIL
 VwStLhH1jkTJ37d8AkLkqeCovtelyY5TVhFv4IEs/RQmrsRhc5CwU9GcIm18G5O6NYOydDOfrSG
 6A1lDM+zAOooWGn9EuUamyf+MOlCFofcOsKp+ddzbSilbJsLWj6vOtpdP0vTRp5YEIxLe2k6yUP
 wxdZ6YMVa2aROqGWivQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039



On 10/16/2026 9:11 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] wifi: ath12k: OOB array read in ath12k_dp_cmem_init() due to mixed MLO mem modes
> --
> 
> commit b4813e2e272b2801865377c6c50ae123db10e5d7
> Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> wifi: ath12k: use CMEM write for PPT on hybrid bus devices
> 
> This commit updates the Primary Page Table (PPT) initialization to use
> CMEM-specific write operations on hybrid bus devices. It also propagates
> errors from these CMEM writes during PPT and partner copy cache
> initialization, aborting MLO setup if a failure occurs.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
>> index 83f9edfabf696..6cf254b2d2a78 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> [ ... ]
>> @@ -1328,24 +1328,38 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
>>  	}
>>  
>>  	/* Write to PPT in CMEM */
>> -	for (i = start; i < end; i++)
>> -		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
>> -				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
>> +	for (i = start; i < end; i++) {
>> +		addr = cmem_base + ATH12K_PPT_ADDR_OFFSET(i);
>> +		val = dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET;
> 
> [Severity: High]
> Can this result in an out-of-bounds array read on hybrid bus MLO devices?
> 
> The loop limits start and end are derived from the current device's
> profile (ab->profile_param->dp_params). However, the array being indexed,
> dp->spt_info[i], belongs to the partner device.
> 
> On systems with mixed-bus MLO configurations (like an AHB radio and a PCI
> radio in the same MLO group) and constrained memory, the devices might have
> different memory profiles. For example, if the AHB device has the DEFAULT
> profile but the PCI partner is using the LOW_512_M profile, the AHB device
> will calculate a larger end value than the size of the partner's allocated
> spt_info array.
> 
> Does this mean the loop will read past the end of the spt_info array and
> write garbage memory values to the device's CMEM Primary Page Table?
> 

This is not expected to happen, as all devices in the same MLO group are expected
to operate with the same memory profile. The profile (DEFAULT or LOW_512_M) is
selected based on the platform's RAM size, so all devices on the platform are
expected to use the same profile.
>> +
>> +		if (ab->hw_params->hybrid_bus_type) {
>> +			ret = ath12k_hif_cmem_write32(ab, addr, val);
>> +			if (ret)
>> +				return ret;
>> +		} else {
>> +			ath12k_hif_write32(ab, addr, val);
>> +		}
>> +	}
>>  
>>  	return 0;
>>  }
> 

