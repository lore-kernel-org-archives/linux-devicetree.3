Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2ED41B355
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423534; cv=none; b=isDVgM1z0A3MotvDXjza0T7lUz/oxPuFZ4L7LuTmmesH6FD0YN2I8X71y7HrbNG/rnGONnHSOrA7acDCJo9XeWIe/nEQ90ReaktWRR7N9DoHxJuupviCjQqygM0QSRrE4ZiwwpmYFhUrv8GNzPjdsPsGbh2pnjmaJBNfnstRkt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423534; c=relaxed/simple;
	bh=xnFgWawnXFx8zIyhj/RPtiiwIwTFMQlexPNBv6a8wJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jd+xICUqpFrv+LZnUCsL1cwIfx/BQvKsA70pPeUVtktzeKmzq/xx+bzH29BIU4JMOzCNJP4hZoISTmKsuwhzdQay4w5OUJNvhT/+rrC+VEVX45RFNSviz1eeCxvmluhLeVKFHzsJPmraECQPFXgwFNkkT6W0CEOscBKRfkfK2q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxvNqD8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IvOZ2CQB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxvNqD8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IvOZ2CQB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6837Lt164124123
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 08:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WmLsN1tIniapFyOpteL0/516X2RHNebqt3JtsolJx1Y=; b=UxvNqD8s2D3kbW3/
	IDzmY64Fxue25fu1Ufk40pOa/vHiAa/hE4PEU1LukolUFgxrWWqUzG+7cBADYgHg
	+TPez7HOeAZ0JHrq9O8gsBxIPoPEbvTf03Zc6w/ItawEcAsY+pizjUWzMF2RcqGL
	6DtOL/Oxp1/znNlGalJb7xOMFydo/si3aexepMeutbZpdPulQDdVotx6j7DvJ9lV
	2fZead8FoYQy8MdAr6vgvIYwnvSxTXMM1eLjvyGDl9pNMLIzJOslfm1e6ysk+K49
	3eXtYWL8k1MXEma8kLzP6m6kIY0XuwXXTgGY5BzXKt5fiIgLOry5ugwkmO/rSSY4
	Psdd2Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekg6ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:18:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so3339664a91.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423531; x=1789028331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmLsN1tIniapFyOpteL0/516X2RHNebqt3JtsolJx1Y=;
        b=IvOZ2CQByYZMJnVcg327FkEd2jqvBTjPSOZqQnj9Th0FfXiWj4r8vUh8+QqL1MH/Ze
         sLoqmzsuJyoHrfxYEWxxy524qd1xOLVyigKZ8yv6thC4hQgmegeJUHDVU+r18EVrwRp8
         v2UUr99xKxYex4EJLMSkpjicvnyAzs2CeVKktomhkCi9L3XT+pUUvSlG9eaRWIhfuuBN
         suWd/KLlUZ9AYeONQ4DP/ExjQS3iy0UC1tc2qvog+N2bvuyC6dF7hp/RYh2JlOXSHxRx
         VT69j1o6sFdjYT8JNr6ThOg6WsPiYO5Xsqc/qoU5qSiRXdAlabHvA1ubw3/LtbXU2qV+
         yTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423531; x=1789028331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmLsN1tIniapFyOpteL0/516X2RHNebqt3JtsolJx1Y=;
        b=PpsNapInl+iwDVRlfCd/u1LoPkF3MvAuf9qkWDrHHp6WLiJHDkdlpmzpPBoS/rKaEN
         rAZOlhcH+4trZ4S/XuPnsm2w7JphZWEncStN5Hft2s0ELGimGen1SeHOvWDfLYO2u0dh
         HHtfj7KOleR4vYdd7ItIIYUhMQJOZYy2n9xA+H1bZAR0cqQ6MW8m1L9TjyYWzmKFO0F0
         q0fowqvWj+FYN29F5pLiCHfu5Mmmkeo/7uEAbBQhmgV4a81tBYGoP/GJKOyUBFXZTsok
         VI5yASzrDaoeeqn98p73nNToEICdWlybLDqRhjBFq1hmf05ZqxIRNeVeQWEnCJYh2w6G
         VDKQ==
X-Forwarded-Encrypted: i=1; AKwUvByyHPvyY29So1y9b8/ZAxCVy0SqjV+xbsukcAM1rtozr9rHd/gM1K6wLVOD9mATTLM3SXc/6MDNdp9d@vger.kernel.org
X-Gm-Message-State: AFuF++kswlEA3fC1N+LtAEm3VUlBLwMWJcwhC2ZsGJX3iCBmF34226NU
	0Q3cLgeElsv+AmSzIfW60V+thvaoC3U8FhpfuBYPFd9ngMRwFcdN154tFOdLWJmpH9E9zfWqDKY
	02HLdaAIHR3oMCs7m2D53MufDvwMdaBhoJZAEv/6DpBcyqGV6TOb9APxD2C94bPAO
X-Gm-Gg: AYBFou16tsYY4Qactj9zfO/bpD+UnIVvhNKoI4tT8sZ46NlvFAuehfdMCHnAnVy2U6S
	FDRSa3QVJC6D5es6b/bDZchh22WtHA+FEE3yJ6u+qGoqSQG52TFvAnI4sSJAHSSEhBCvK5mDhrD
	KhNfPSpak8FBGX3uFr2Rma4QTNaNA5hnVbpGfV1zkF5JTJw2e4tLeetSfX2jHZdL7TwaUDJvEgO
	1p5I6PlaphdlwLB70M2GCx0XAg/lGHdZy8xbqQJ3qawalDKX6ig/qbctxe6hR6aCbOnDwZmwUED
	+z5G6Naa+xowUZGjU7WX501anc1YQibZZBZDbF0na41XrbV6vm3FuM7HltLeEe3j9mjQadKGbzG
	QKw2pMl5J/ppplVRQKQ==
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr17457515a91.23.1788423531406;
        Thu, 03 Sep 2026 01:18:51 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr17457457a91.23.1788423530935;
        Thu, 03 Sep 2026 01:18:50 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08300ba2sm4456477a91.1.2026.09.03.01.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:18:50 -0700 (PDT)
Message-ID: <2bdf5393-e684-4db9-a408-a821c7dcbefa@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:18:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/15] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
To: Andre Przywara <andre.przywara@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-7-ea6397bead59@oss.qualcomm.com>
 <99e2cbcb-993e-4f83-b7ec-c333407aabf9@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <99e2cbcb-993e-4f83-b7ec-c333407aabf9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: d6jz1l1CVidDWb3BXpo5q8DNa29DzvnB
X-Proofpoint-GUID: d6jz1l1CVidDWb3BXpo5q8DNa29DzvnB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX6yIAD/QUUECw
 lzXWT0qJKm/Ut+ZbQTTCavwQvVs4pM7be1UlEaWCf9L/h5X1IyVsWAYwJczuzwuA+X1Rx3Zfxqx
 3MOcxcWOGOFN9hjuiqT28xnNNnGWUxSn6x9b9+2brQlCFnKS8Szzi6PlqWIhPItbR8YobWIpxCr
 WVUz9/YF2MY9jo2UZG6YMs4LJ3a1UGAZqLPHcNA6JErpMTsgyoT7VtYyWOqcKcdr411rCFs7PgX
 qbFhxnJWiFWpT6NxpD3oBAU7VgZPpP+20CMcgGtHSCPj9k/hc9Uv2h84p9SIGjtoOjvZrHicdqy
 ATG9AHeH523BKUjcrG2pZwBY+tnRrLiTe+Jq9EzvmlBl5Jwcg7ODZqispljv6YoVZlJEM45+sa1
 ZwIT2a/GbdSHLogJhXdyXWqM29MGf9lrglbV2mFzu7Nvw6yvhVeNj/nk0JvtRids9Zx82WrrJJQ
 5SF0lhgilaTGxHAtKDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX1tS64txQopY9
 TqKf67UHsUMgCsPZn2t3jdeSRqAamc5ae4S3/HsBCVBxcpLP6m5U79oHwsTtf6n3v4TUto0EhmE
 R7axep0YAcqc13KtK3xxLDVRi92S6Kw=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a992d6c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Zjq2ePIxWaVxvOnSyN8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073



On 9/2/2026 10:50 PM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
>> which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
>> is defined as 16, so the check should use >= to reject index 16 and
>> above. The previous > check incorrectly accepted index 16 as valid.
> 
> Indeed. Either the maintainers pick this one independently, or put it up 
> front in any repost.
> 
> And add:
> Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures 
> for firmware described ris")
> 
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 

Hi Andre,

Thanks for the review and the Reviewed-by tag.

Agreed — this is an independent fix to existing code, so I'll move it to
the front of the series in the next repost and add the Fixes tag.

> Cheers,
> Andre
> 
>> ---
>>   drivers/resctrl/mpam_devices.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index ddc15249ec1e..cc9fa1d78925 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -725,7 +725,7 @@ static int mpam_ris_create_locked(struct mpam_msc 
>> *msc, u8 ris_idx,
>>       lockdep_assert_held(&mpam_list_lock);
>> -    if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
>> +    if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>>           return -EINVAL;
>>       if (test_and_set_bit(ris_idx, &msc->ris_idxs))
>>
> 

-- 
Thx and BRs,
Yin

