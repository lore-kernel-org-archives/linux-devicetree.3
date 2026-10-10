Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E826439CCF9
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 02:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600304; cv=none; b=ohpdg79948x97YShsS5uRGR+tRwIQTgYmy0iuZ5Xl3NEGoLd/CmND1ZW2hctz2biyR9PE0wMBkHHesQUjwiVMSuVY0SoRWa4cgCYDUrVO4FBoHq3fTRy0cZQO1YJmX7pduWNFFgrqgiukB4pxO/uQwNse6U+XBLElzCpafczL6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600304; c=relaxed/simple;
	bh=oeNvN8JaZndlATLMPSf/BWa2wDJxUBqOZUBHSJzcdbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sy5zMyNjrQFb1wQD3Hg8YZchOvWoExcvUhBVqps/7i3UwaBNaf1E26tgFTkANw5MxK062Xjnrg1DnB4jp4un8f4FQqO7pScv/YxsM52wntpD/TX5+SDQXr9LYQTVuX5NQTxRhOE3uF1aPi1tm+XJIuqRCfEemSFkfKtLMM3w6bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esUOpHTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEyHvUHh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esUOpHTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEyHvUHh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2eNMc3438825
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 02:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBcjT05yfbliSeSLqir1H1hI2BWg8y5p7+FWfWM4sKU=; b=esUOpHTpeOeIVi9g
	pN1gyNAoX+09M7ACmGAiJH6+gYwWvXc/iMQLLln8B1TGNkBQzkGxDwOqc8ZMwBYK
	rAMNGxW5OVFJfQx4rt9uW12D9bT+jD84h6eqBPRZFJOdQBM0Z71rIVxBFbzUsgaB
	ohwMLv/KvLt+e6EG0/2vjYKgGv2OhYJ3zpIqZtofHyl7TFb8qH6wyJT4TeGr6eB1
	omxYxAU3VvCgh20EQc7Aq5MFHomrY0ndFx8hA/uL9v8Wsylxrr3SCrnePUkIzkOy
	+noA9Kbj3D2YAwvE++uvG0pCJrr/fhlnSFIxFbKRq1HUzbex0QFj2yFeymmrJGhu
	Y0lVTg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmra6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 02:45:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso512155a91.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 19:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791600300; x=1792205100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBcjT05yfbliSeSLqir1H1hI2BWg8y5p7+FWfWM4sKU=;
        b=XEyHvUHhN8IomHtsWP2dDPoLHgi9qNH4XR6yLYNQcrihqVfrlTj6VUPw5fqF8hHsKR
         Ot1orszy30tSQfnTOcTRXfqLSpcPC5DHw5IXsckwA7jQ056WxqOycfZmbK/X9YnVKcbf
         vxqEped200j+KCIdf2E6ifTgRrgXUzsYQtW+RcHsOzysTMRkVUp0IjjUviQT5Ka2Wjyk
         gL76WsDEHx+lubz1ITUgKPN90FyzE79vQqtK9vlLL5Ic7rUWRETjUV4OMzXCu5v68GUw
         XdeaHW5h6+FJS9GgXXeAbhPbAbC+F80X8UOEklBKkIAZ3cHbEdgipC1SbcPMYZBssHDf
         +k9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600300; x=1792205100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBcjT05yfbliSeSLqir1H1hI2BWg8y5p7+FWfWM4sKU=;
        b=vbsyYf9m9JPaQpyV4ckKp/4pzOQJ5c3DGi1dNyLWZZ9i54I9mRHXhWqMcrD+Mzqvk3
         LWUueLDXFtzx6z13sHYq6MpVPfD4YZVM7S5bjBr+KPtjbmsKIh3f1ABZxWTl4OKLrvHl
         5jLvt6+tvqz9K08pjZJilUrtWSI4bftHSFWdRBT791++fQSu2o56PoCjcadxUKv5pukz
         punoSJMtaBXxydhyCPubh7m8S/ZEUOUAx5KsMN8K10yPULqhdVl2K8KrNzyd4ECtRcLR
         AGmwdIinrZZzZvzeUx7h39dRJHgLmgeGvRq2HKzyaBPPceW0n+DdQYxQ+aEvaAo5kxYG
         c91A==
X-Forwarded-Encrypted: i=1; AKwUvBwiMXa0dmm9I2PKyXbrT4QLwrGRhcg+g269T17JamrhK+efFIRfFqDQHOz5S2/uraNJWeITsssbybSD@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9FfEzADoo9u2CT2FjVhiRigsMr+L0ticyduU4XRt4QK+3yjCK
	BWqfkWWbVk4EzxbE1ZIqJV/cC8OgHmswp06jBSA8P2Nn3RSDs2ooWOpAZjMXMmKF5RhRVBtdMPr
	Nj6oySrEjUMcYvMsc2grm6QYD+SiLBqgmpiW69QQqJ7a7lx2oKHahJ6Tf7qwIPVpa
X-Gm-Gg: AYBFou3r5/KgzvG9B/ZfJw32ihLztGOzACSwt4tShpBThEs3c5RYKe6UOfyX1zjYucQ
	papHcPkzumzTyI2dyFAb6a9Vcjjy4+FoV3Hp/5kqjv0d4uXJ9sAByrkO35YdIFr60NEdE6rA9S/
	zfMOKWYvC/A3tkNk7hpJ2x6za9+DQJgnJPrbExEKCZsn9hZ4LyZmdSAXmVabyUIrkQhg/I+h1I6
	Vidbcd1i5dmuXUFhXjpU840N2hsiH2bEQPkajcUYwX9+Zl4MiRw5nDdruqb80tYyYHVGyhAckan
	fEK4WIiHjDFwfUbpDfKOq13V1eKQ02OUsl8II48QYXHWWCel9JTzOuGeWYvgHDWcJ6tDAHWjqHJ
	vODAC3Z2Up62v3/eR6rIMNulf
X-Received: by 2002:a17:90a:e7ca:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3ab3a8ce801mr3460718a91.36.1791600300299;
        Fri, 09 Oct 2026 19:45:00 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3ab3a8ce801mr3460699a91.36.1791600299701;
        Fri, 09 Oct 2026 19:44:59 -0700 (PDT)
Received: from [192.168.1.227] ([183.192.31.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm1896587a12.31.2026.10.09.19.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 19:44:58 -0700 (PDT)
Message-ID: <702b0ccb-6b33-4108-a4a5-5e9a2181514e@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 10:44:55 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 07/11] net: ethernet: qualcomm: ppe: Add IPQ5424
 QM configuration
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <20261008-qcom_ipq5424_ppe-v1-7-16caf43e44ee@oss.qualcomm.com>
 <sashiko-outbox-165734@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-165734@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMCBTYWx0ZWRfX36jPHDjKwyus
 ZGXDMEYI9mImpg6wBYesu8oVdJp7pALID2qFG8vAhmz6YYtDYevLjICjBaABrCSrWnhJDl5j8eG
 JVP3DeWqLvh+1wPG0rb0qaniu2DSh8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMCBTYWx0ZWRfXy2JNawqyBlsb
 UsnoLVY56EKUaQkwuL8LGLj4zzovym/TqSKGxJGyl5tZwRFip+3oP9Eek3Bcy6xule70DeDeRK4
 D2SEjNK/QQSuoGEI8mamdJSd6/FLMA8jfQk3aD6I+i1RI3u5tVIL0iSaBzayAYEIVfVvxMASoht
 OMjBN3PtLHKgsUz1xVogA/cfPEYeUgIE2i0cWFMJY+mLDp3283X4Zy6SLwTTCgaTBxs6FSoOGff
 pAd8qeLHKJdIvoy/NUEs3rY/ogZArjSZE/SW6TJB7qc6GolxP65P59X9BbULCS+fnoMgXZTw2Hk
 +W+QJiUf0DS+Km0QOAaP9C9BTM9kIkbkOq40ZhZ9QtI5wSLUejUr3asZI/nskulTMba6Usffz+/
 LS70WmNlpOREnyhWcxKC97WE90qCAOxPzSvjXSDY/u2ufE6AZXemGWQnFz4plnU2gx7R8Djf6GD
 JswRNWXXzjgc3wYniZQ==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6ac9a6ad cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=N18iw5ntM+1D/B/PUaPCgg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8gpwaHf9ndjPn5a6IY0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 9Lz2P_2SagOOdx-WX3zuEbyWhKjXJ83r
X-Proofpoint-GUID: 9Lz2P_2SagOOdx-WX3zuEbyWhKjXJ83r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100010



On 10/9/2026 10:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ppe: debugfs queue counter iteration reads nonexistent queues on IPQ5424 causing bus errors
> --
> 
> commit 4fb437e4b3cf979efa2cd54481de8f5ac5e4963f
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> net: ethernet: qualcomm: ppe: Add IPQ5424 QM configuration
> 
> This commit adds the Quality of Service (QM) configuration for the
> IPQ5424 PPE. It configures the unicast and multicast queues, noting
> that IPQ5424 has fewer PPE ports and thus lacks multicast queues
> 284 to 299.
> 
>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> index 3afa571193238..dec8eed772539 100644
>> --- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> @@ -314,6 +314,37 @@ static const struct ppe_qm_queue_config ipq9574_ppe_qm_queue_config[] = {
>>  	},
>>  };
>>  
>> +/* Multicast queues are dedicated per PPE port. IPQ5424 has only 3 physical
>> + * PPE ports, versus IPQ9574's 6 PPE ports, so multicast queues 284 to 299
>> + * are not available on IPQ5424, and the buffer pool assigned to the general
>> + * 'group0' is larger here, 2010 versus IPQ9574's 2000.
>> + */
> 
> [Severity: High]
> Since multicast queues 284 to 299 are not available on IPQ5424, will reading
> or writing the debugfs counters for these queues cause a bus error?
> 
> In drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c:ppe_queue_counter_get(),
> the code loops up to PPE_QUEUE_TX_COUNTER_TBL_ENTRIES (300):
> 
> 	for (i = 0; i < PPE_QUEUE_TX_COUNTER_TBL_ENTRIES; i++) {
> 		...
> 		} else {
> 			int mq_offset = i - PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES;
> 			...
> 			if (mq_offset < PPE_P0_MULTICAST_QUEUE_NUM) {
> 				reg = PPE_CPU_PORT_MULTICAST_FORCE_DROP_CNT_TBL_ADDR(mq_offset);
> 			} else {
> 				mq_offset -= PPE_P0_MULTICAST_QUEUE_NUM;
> 
> 				reg = PPE_P1_MULTICAST_DROP_CNT_TBL_ADDR;
> 				reg += (mq_offset / PPE_MULTICAST_QUEUE_NUM) *
> 					PPE_MULTICAST_QUEUE_PORT_ADDR_INC;
> 
> For queues 284-299, this calculates an MMIO address for non-existent logical
> ports 4, 5, and 6 on IPQ5424.  Does this lead to an unmapped register access
> and a kernel panic when a user reads the 'qm' debugfs file?
> 
> A similar unconditional loop occurs in ppe_packet_counter_write() up to queue
> 299:
> 
> 	case PPE_CNT_QM:
> 		for (i = 0; i < PPE_QUEUE_TX_COUNTER_TBL_ENTRIES; i++) {
> 
> Could this also trigger a panic when writing to the 'qm' debugfs file?
> 

No issue here. The multicast queues 284-299 are not functional on
IPQ5424, but their counter registers still exist in the QM block. They
are part of the register space allowed by the IPQ5424 regmap, so reading
or writing them is safe. On IPQ5424 these counters always read zero.

