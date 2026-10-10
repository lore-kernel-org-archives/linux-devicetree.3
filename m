Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE143043CF
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 03:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791601236; cv=none; b=r+7FQiNT0N5tEV/PlkXmjleawfRW//Qt19DMurNooY94jEiFTMn60aJhtGNME9LFCdNdeGt5dZDef/dSXI6Tuzi82ZOvcM/33cXwV6GwYpLoUE3LM5EC40HSIKhIfB1QgOlIYt7H+POjL0yIVUiN6b7ctSsJU5kF5MA9ayrqRVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791601236; c=relaxed/simple;
	bh=9E4ucci8nIPDrzlzliEd3oyN/nOwLsWSVKKoHRh6Xak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jw43unYD8LXsL4uLn8HLS763tb/CtAp4rz56GgdE7oAvgTEhgHk0sFzNU+3KiUDLXd6qbhCF4mRVguh6vcj/mQPaZKtwCplUXnkM2lHieXKppV9XsIgJwPPYTI2T0jHS4WnvD31bJlLVPZabudyPqwGdclwbOyUwrxy2+WxvSpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbSjJX9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hE9Kimlo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbSjJX9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hE9Kimlo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2eR9V2585446
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 03:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gD0ERVfebnTT1rddUWcpPNF+flaDO5Uk16VHXeNxq9M=; b=JbSjJX9rbaSGDOns
	8KuVibu2M+dRDXtHsB50jwkhD5c68C8/MA3Vr7qlKxvx6kFHww/KGjeyVRiwAZgX
	jXMeacVqFJZMvHoSWgQbf6mrsSck3JQ2c9k4MThf0F6tBv/Vt4KMK6nNpfaOFWvN
	Kv5LCTO+pBuD6gvNNrsUWfgUKMFF1YkMSEAebZ+EmTdhZuBAVqxUjX01rlzCQnlT
	cAE4Dr3eAxyoFQKH0IWwxC1Nsk0BiAIoiPTIRyHoRw1NbszQJ/Nmm2I6hIBIJIrU
	xmuQKj8Aw+AAMyk7hcYoohjy87Nt3Q2yp7mT0yJO8HCGdpASar0DTAPbRTBQvmpA
	9GVw0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74tbhjt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 03:00:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab82fcbc27so239133a91.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 20:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791601232; x=1792206032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD0ERVfebnTT1rddUWcpPNF+flaDO5Uk16VHXeNxq9M=;
        b=hE9KimlokeQ6uu1kfpyERYCGtjy9yNYw+PDcoPQbi5MpwykJJYmsK2B2ePlCkrifm2
         bNEBQGkOCRCTrx5TIbCEs8cYY+7HnX3rUnZttWl8mTkXBfZJxnZyLiFFh4OzoY30jnLx
         lI7F1H9+M++eJ6S4CeYyb1KYKOyiZzbkcJ7D5YoOftvmgm7LdzeVJNekkFw94lWFkpdU
         apttIkxkxPw6VVRTFJMoL5miIGN52bdHCQEt38BauFhx9RVbXSLhQMwoLuBEdGKsNfDX
         rslco+HDnxb+1rOjo8alRpqJoOlb/EXNS4alYTJ5mDfqJs9EAKHLzYyesL8aYCpn0m6G
         C2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791601232; x=1792206032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gD0ERVfebnTT1rddUWcpPNF+flaDO5Uk16VHXeNxq9M=;
        b=ZdHe7qlDneBXTz+VmSw0Uqemj8x69z53apQm1FlSw/rnZQchv9UE2jzFIcBLHcIwg7
         uPQpKRFEbrLZ+L8DXNzriXG5CXgpHGrAwNRA23yru7ygAw3aTl+ZgXsDFGUyBZJAxOrS
         p+9MQsbI40Bn7Xs3UAgN6000dbSPlLKg3UWS4g0PDk/pdIJXsJtL5CkOqHNUMgT5R0q5
         /dt5qEChq0xVepnVLHA2+VixAEeDxFg44IcePEcL1eCghWUddI3kx3gYWjpLGBYTTdbn
         15qIRKGf+zj4aU8WRS/IOYENKSjbwMOOmi7kqeca4FotHmKyYHfBLqjFltp5AnO04Kst
         Un2A==
X-Gm-Message-State: AFq9FYLl/B//0xG6K3zk445nWP2zjDU8+jghDayxL7zh5QcMcgBcByyf
	M2eEPsl8gnm3258gGAka9xqLZ6KlySGvt8hvoBERRfIyHUgz1WvdBGaUNawKaJYDwtfCl51hSUa
	POQnc8E8fU77n3A1UUdxMvB11/W7TUBg9JUutqa5K29AepybaLsKKF1V9EZ/j9LQR
X-Gm-Gg: AYBFou1Mobkh5XzERJLbPkHbSCpAC1r0Fam0HSGbtN1kNjC//UZVj2T4lfav1VnReQf
	7kot2Mv5vQJEtQoEVtyxHLDx7O8vlv/77uReEGs82aHrmPhQCVNwnlkPWgi011TI74DLrAfc8Su
	Y9m80muR9iM+WUTmRjT7x3jIbtueVZNdYuzqFNBmjbDa4O6vzLVWQgSeT5jjomZeGFxB96fNMAt
	Yc8AvjfqrM8hdWs+M3pFGVKsf/UPJU2l3pHjUGcRGDETwRcuN2r2Sr433TtAa3Z8JE5v/dX2m2v
	hk4dEm2FtqmojjLA5sOtl3fZkcRZhabdtuIcGSsv53IQDdZ/4KQ3EPjbsrRum49O+d7Ck54e23p
	MSvfK4mGYD+B1EULeEeoWDP5v
X-Received: by 2002:a17:90b:384c:b0:3a7:aa1c:476b with SMTP id 98e67ed59e1d1-3ab3a747d90mr3583197a91.31.1791601232416;
        Fri, 09 Oct 2026 20:00:32 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:3a7:aa1c:476b with SMTP id 98e67ed59e1d1-3ab3a747d90mr3583167a91.31.1791601231914;
        Fri, 09 Oct 2026 20:00:31 -0700 (PDT)
Received: from [192.168.1.227] ([183.192.31.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9633fsm7555871a91.6.2026.10.09.20.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 20:00:31 -0700 (PDT)
Message-ID: <be474e8f-1921-4789-a373-58321f9b94ba@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 11:00:28 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 02/11] net: ethernet: qualcomm: ppe: Fix
 multicast queue config table index
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <20261008-qcom_ipq5424_ppe-v1-2-16caf43e44ee@oss.qualcomm.com>
 <sashiko-outbox-165731@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-165731@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RcEFmFtv c=1 sm=1 tr=0 ts=6ac9aa51 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=N18iw5ntM+1D/B/PUaPCgg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=alxY7H8S5tj6ej4i5l4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMSBTYWx0ZWRfX2/d5fDsoch6Y
 5+YRR6DhnMv+j2792zDAlIO+2u01iCEIb2C+4EJFgXO5AwpUrIUrq0EKnLRAzfWiCgpdKE491xn
 eH2BwWdgZvLYkOITellA0vBe6piAPay0eLuBjO/akTYlPjfPg+WM9fsz4YVDnn25HBUdQ35N0Tn
 FssNPGCx/GDo5Eq3zEL7B8xt1S+4bckCBsQYTS6nw78kYOL2B7MEXRC7e5g6W70SpJDbtDqb0WI
 jEBX9floGz7NktVqvlrUrqhx2s+hSFUy51LlOrUssdxdwXE+4Ddevd22njXt+Phjhwgt2yN2ql7
 uVUKWY7CvzwLzupu3b6Z/ShetuuuvBNjLOWFfwGNb5NJhG3W6MM6BeRGljK/skDN2eAsBWTMyh0
 BMOvLTkrFoEbrUTgFmV/zP/qSJf/Rexg7sZv8ZpOmMcOougcUc8mJp2nTijiI/yCeKTUuE7MTDZ
 B/75XG7rEdoqo1AOVPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMSBTYWx0ZWRfX65vLrEPEnp3Y
 Fq5lfjjVxoJ7uWso+tWLT5wRc7E/1kXdKz1yldyIXS1HbHtW8BJSMTEaNaftWO6+rhmXRHGUFII
 sFFi5BmnflqL0NXXLiHPvD/A/BR7dVs=
X-Proofpoint-GUID: 8-qxisUFG5FIWngMxvH90Z-U6L5gKG96
X-Proofpoint-ORIG-GUID: 8-qxisUFG5FIWngMxvH90Z-U6L5gKG96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100011



On 10/9/2026 10:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] net: ethernet: qualcomm: out-of-bounds regmap access due to incorrect multicast_queue_cfg size
> --
> 
> commit e63c30c06634bbba4d742f77aae5726bcf70fb62
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> net: ethernet: qualcomm: ppe: Fix multicast queue config table index
> 
> PPE queues 0-255 are unicast queues and queues from 256 onwards are
> multicast queues. The multicast queue configuration table has its own
> index, starting from 0 for the first multicast queue. The driver previously
> used the absolute queue ID as the index, which was out of range. This commit
> fixes it by converting the queue ID to the correct multicast table index.
> 
>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> index 125b73be92b13..8a553902ffad1 100644
>> --- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> @@ -1530,8 +1530,13 @@ static int ppe_config_qm(struct ppe_device *ppe_dev)
>>  				if (ret)
>>  					goto qm_config_fail;
>>  			} else {
>> +				/* The multicast queue table is indexed from 0 for
>> +				 * the first multicast queue, which follows the
>> +				 * unicast queues.
>> +				 */
>>  				reg = PPE_AC_MULTICAST_QUEUE_CFG_TBL_ADDR +
>> -				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC * queue_id;
>> +				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC *
>> +				      (queue_id - PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES);
>>  
>>  				ret = regmap_bulk_read(ppe_dev->regmap, reg,
>>  						       multicast_queue_cfg,
>>  						       ARRAY_SIZE(multicast_queue_cfg));
> 
> [Severity: Medium]
> In ppe_config_qm(), multicast_queue_cfg is declared as a 5-element array:
> 
>     u32 multicast_queue_cfg[5];
> 
> This means ARRAY_SIZE(multicast_queue_cfg) evaluates to 5 words (20 bytes).
> However, the hardware table entry increment
> (PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC) is only 4 words (16 bytes).
> 
> Since this patch changes the index to correctly target the multicast queue
> configuration table, does this regmap_bulk_read() over-read by 1 word into
> the next queue's entry?
> 
> Additionally, a few lines later, regmap_bulk_write() also writes 5 words:
> 
>     ret = regmap_bulk_write(ppe_dev->regmap, reg,
>                             multicast_queue_cfg,
>                             ARRAY_SIZE(multicast_queue_cfg));
> 
> For the final queue in the loop, wouldn't writing 20 bytes overflow the
> 16-byte boundary and write 4 bytes past the end of the entire multicast
> queue configuration table?
> 
> Can this out-of-bounds register access trigger a bus error or system abort
> on the SoC?
> 

Each multicast queue config entry has only 3 words of configuration at a
16-byte stride. I will fix it in the next version by accessing only the
3 words of each entry.
