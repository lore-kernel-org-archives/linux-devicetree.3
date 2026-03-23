Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D96E3B27ED
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277384; cv=none; b=pV/1FeWve+m4aDozWhlvxpnYk9EV3158cKfm3UJeaGi/RYBd9WwY7aK00PwB/BW8E0kc5jLw2ar+dGtLZIMhlB3qQ13sv+LcAeWdxNgeOU9Csqi2j5SzRqz4OgklmQm7477iTZkLYEY9g5xIV8Gftk1bWH0FnSIFpxWpBpzwH2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277384; c=relaxed/simple;
	bh=0/r/G+0z4yh01mKu1u+OVKk1NLi9FxpmQdTT7aSQh/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRC75X3pPlIqkmAD1AP3UNUaf5vpZAuj+Ndg6tnFmcY0xlbSPqXZpfre9x9v9+066WgPb598V5LGf7WASZmGQijwYBwsy0FCm5Kw91fuhqrG+qq6UY69vQ/7/MSfiOQ2hpf/OJ16HI2Rw73gBRQOsZ8LGblgRKQ62uGr294wOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezOkwpGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcqTrBmk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezOkwpGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcqTrBmk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDl3EQ3468358
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFD/0D7t3HkahIJrCp8Wcg2mwyN5dY4QTfenxFKZJog=; b=ezOkwpGRKkMa0jJQ
	o0RGNwdMo4ZjWPRwhMGTRwDkbKdetlyG3pRb4OwKYDar+Wm5YlhoZHsb8rXH2w7z
	CwC86ZOqIPd3Qd0uo2giPyrmXoOmhb7v9pJFLu0Ja5cu4C/23LaZtu8AvMGVQs0v
	Oa0/UFVX0rUGJEtDeCJ7AMOekaJBFSCX5aSH76DqPvHEA/TVjBX+7KquWaW1CVbr
	4zsyRdOKinY9FncviMcfLlQIvhBlPYzj7v/kSTYzFJHZTRxj/4cmneZq8UqFfq7n
	WJVnUBhudJv3mtGfKfoUhKe1GE65soFR4xeGc/bXDWdKgURnpuxAXCqdnJZo4cmP
	ze/VQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jghgxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:49:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4bd8e77dso17926391cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774277381; x=1774882181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFD/0D7t3HkahIJrCp8Wcg2mwyN5dY4QTfenxFKZJog=;
        b=JcqTrBmkq5B8sI2w/tjdwnULcUfh32/YxoVHLTKYPE3U71sZFcMDwgsi4qrGpouoOO
         bbSTz3Lv+bhdLaWV72kntJM0T3X9z5ATRWTRyGQPQvD+Vy2RzJEiCgXA3VvOMn88/wOo
         oyYf2T+1yk59ytIhZ2iUbXmAAxZhDbUZHqCxGw0Tg3KF/NsmUdaF5+mjZI2cw4QMYw5X
         WLLHzpOos0UuGLuSY6cBDeZF5jKOvu3JcQc9kYhaNd4r6AIBHm2prZUW2R1/9FXpqwhA
         rLF9slPGCJ1Zdl5HJ/1J20xEYKQrj8PgPkA1XAgHi39ikL6ivqLTNKLQJM5HFIkskL2s
         8Tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277381; x=1774882181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFD/0D7t3HkahIJrCp8Wcg2mwyN5dY4QTfenxFKZJog=;
        b=nDuKokIwJTRDrYOYe6McNnbcmLrNEueKINIs4QflW5VH8rKUFPWNDLaFyi9Ek9B3mo
         QCVHGuOeb2ebRm930KLb/CljREp++3vZmeZ+/4L9C/UiEYw5i7QyWIwnUK6owpeKWmk2
         l4k3GsPcKTqoXX4PcE4sBmwPr3q41M75a0+u6wGoDxutfm6mVYNqalcF5UZG18Oc6sR8
         8P/ttChhIuQOt/GmelgEmTNxGaxGbAoCOjRg5j5P2sz3610MLHs2u1FA4xmW6wApCxv1
         eQm2sjvwLtVjh/I3h1nvZ6Wbacaj/bZo/yVlMP2FFQ38R143G4bYmGK9rDRAM8oRAp51
         3ifg==
X-Forwarded-Encrypted: i=1; AJvYcCXCnk9zhoV9bvdRe/mKJuLoqwIndpGhlqTLobdpda7Rc6lYM+Ar9sXgnUv5CZSu8uKZfPcJhRgUFnzp@vger.kernel.org
X-Gm-Message-State: AOJu0YzZg9KJW6Am4se3gdeQfcPhPQjDjZTAAOURcJ6QjGb4joxA/zk3
	sna8BouhmD+aMuHwwFD/yzrkuSk5bKFw10OO5wzWZAe8otbzO9r3bCf/PIgNP8arp/cRg1O3dqC
	h1fpUnnDvfeC1wWMyRy1labv0kF4PAL5Yms7DUqThU42B2FdP3P34j5eTEsU8FHPc
X-Gm-Gg: ATEYQzwnP3r106TOWwIZ3Cp7WqqVdyT7+NsY2TeuqEc2dGwF4rkBDxBp39oyLRCHH/K
	CB5UW8NrQaOTllwYlXH+1Dt/ilNbQKLmd2HnD1nDMlR8MTeVo5S5xD/ZxJdp1QhAy574w79yoIs
	picrBCQ0l8HGTnzS10VshneKrEn685JBkba9U/OT2fs6S+pmoV/caHGp7k6intLz7u4FSc5swsa
	5C94qoNE6xgmAkK7TUFSwfYEdB+QEuasKp/BffvDfqCe6lqRJrayWXR48MZDJL6ZxEV3HjtlTo0
	G8a6fSzsRcXNEE2Sz4ZzC7pM6I0kQ3QERDOLZHOTiBHZoETvCK2E4gfPLpWSdEHKeVYc4mKIpj+
	XHmmyMhZBnx2i6fONTdbfXeGFl8g7+yMQYQKymc9FHN9N05QJoNei1YIxcvtsJZW0jsHSdfeF3a
	xEWu4=
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr10113001cf.1.1774277381561;
        Mon, 23 Mar 2026 07:49:41 -0700 (PDT)
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr10112421cf.1.1774277380803;
        Mon, 23 Mar 2026 07:49:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f42f0dsm505750466b.12.2026.03.23.07.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:49:39 -0700 (PDT)
Message-ID: <df086652-a715-4299-b6bc-5d253b7bac39@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:49:37 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add glymur BWMONs
To: Bjorn Andersson <andersson@kernel.org>,
        Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20260302-glymur_bwmon_dt-v1-1-f4939d75bd47@oss.qualcomm.com>
 <fcd9de7f-b65f-4a30-a74b-57bdd690422f@oss.qualcomm.com>
 <2d6d813b-b2e7-408c-bf58-86d25859bb40@oss.qualcomm.com>
 <acFLk7i7FMFBTbQS@baldur>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <acFLk7i7FMFBTbQS@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JUbtmreJObKpiaPBiU0Uk8Wn4-xyckgv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExNCBTYWx0ZWRfXzLDA6IA3/ktN
 5ScDfaJS27OjoeJoFgNL5U9ellFBTBzpUiY18B6zqOi6mgSvXAKLFIn/U5RgemDJj84Qva26Hd3
 4zvZpLe4v65n2HCF+eGRbVYTaeugEpxVLfID55g+S8JTwSTZqyGm/MkICbY0I/z0e0R/4KE9G/h
 p0LsU/9Jm1EWGp33U7fAryjwVOqTFwELMJZcpjahhbZ5aHd5xLmpMwl5+9/hXaoppQqpcZTbAG4
 ZTcCb3iWICk3JVL0umFEYzstvEI8qzA3CGB8SCPNlz1Xrj9D1wAZVM2opDM9GXralrhnirNWRVd
 0yIXjrYgkeNL38FNcpaX6vNCC1GaRWn+I0kTLOKLkw/wrdAaosHPjNH0e1yQN+78LwmG8GUqr9+
 V7NXDZdqe+LzUyfwP3+RG4J+kc03OUdsTmSYl4EfYelsuhz7RkkrzuRqhMvgBajkQwrvmWfaN0E
 yMz+UtB8NAlorvPZ2JA==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c15306 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=T3UWdygilXLZWxFm05IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: JUbtmreJObKpiaPBiU0Uk8Wn4-xyckgv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230114

On 3/23/26 3:21 PM, Bjorn Andersson wrote:
> On Tue, Mar 03, 2026 at 05:52:53PM +0530, Pragnesh Papaniya wrote:
>>
>>
>> On 3/2/2026 6:27 PM, Konrad Dybcio wrote:
>>> On 3/2/26 12:46 PM, Pragnesh Papaniya wrote:
>>>> Add the CPU BWMON nodes for glymur SoCs.
>>>>
>>>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 87 ++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 87 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> index e269cec7942c..fd947b1a17dd 100644
>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> @@ -2264,6 +2264,93 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>>>>  			};
>>>>  		};
>>>>  
>>>> +		/* cluster0 */
>>>> +		bwmon_cluster0: pmu@100c400 {
>>>> +			compatible = "qcom,glymur-cpu-bwmon", "qcom,sdm845-bwmon";
>>>> +			reg = <0x0 0x0100c400 0x0 0x600>;
>>>> +
>>>> +			interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
>>>> +
>>>> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
>>>> +
>>>> +			operating-points-v2 = <&cpu_bwmon_opp_table>;
>>>> +
>>>> +			cpu_bwmon_opp_table: opp-table {
>>>> +				compatible = "operating-points-v2";
>>>> +
>>>> +				opp-0 {
>>>> +					opp-peak-kBps = <800000>;
>>>> +				};
>>>
>>> Can these values remain unchanged vs hamoa? Glymur has more memory
>>> channels (as reflected in the icc driver) so the values send to rpmh
>>> will be a third lower
>>>
>>> Similarly, hamoa has roughly the same values as kona, which has half
>>> the channels
>>>
>>> Konrad
>> opp-peak-kBps is proportional to bus_width and is calculated as follows:
>>  
>> opp-peak-kBps = (Hz * node_bus_width)/ 1000
>>  
>> All the existing targets do the same, since bcm_aggregate() in 
>> bcm-voter.c divides max_peak with buswidth.
>>
> 
> So if we make the bus 100x wider, we still have/want/get the same MB/s
> throughput?

Right, that was the question I tried to ask originally.. 

glymur ebi node has 12channels, 4-wide
hamoa has 8c 4w
sm8x50 has 4c 4w

bcm-voter.c then does:

temp = bcm_div(node->sum_avg[bucket] * bcm->aux_data.width,
		node->buswidth * node->channels);
agg_avg[bucket] = max(agg_avg[bucket], temp);

temp = bcm_div(node->max_peak[bucket] * bcm->aux_data.width,
		node->buswidth);
agg_peak[bucket] = max(agg_peak[bucket], temp);


Most notably, the channel # is only taken into account for avg votes
(whereas the BWMON OPP table only has peak votes)

Perhaps the question worth actually asking is, whether the code above is
correct, and if so, why that's the case. Somewhat frustratingly, all
downstream kernels that I can find seem to corroborate that.



As for the immediate, this patch is indeed correct in that it creates the
expected behavior.

Konrad
