Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D930747AF6B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391284; cv=none; b=igLy26bwGMLEKdq2LwZkun1zWgaZl7gslqvnMK+jc6m0icNrk2SryvL9d3RIkljNBPaOLvTsDa+RDoiOCd2D/4tMtTWIj/vJyCTSsRG0jWjy+KxPjLTxnd25UgU/KQm6QmThVwwdPT+Tw5RrWwCBNEDw76unrmrj043qpuc4WRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391284; c=relaxed/simple;
	bh=H3ad6YJKI8vO3CC9hEJWwrqweWLV9XGtKF7p3FCoEC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eyOtgJCNKuKxXIm1Q6CQ4W+mmSXZdcxYu2b9VznWTZtXBhJgmEKPTv3QpYXhYcoEbdRyIs757//9lCNK74vBVCc/kkxtBozBa4IE4TqkXaoWo+UZ+8z1d6nL9VL5b9aCo8l04tZF+kqe7AGMDCQAvJ7uajJ9+lbyKuSstVnylBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jViqdCmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cA/H0xXz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jViqdCmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cA/H0xXz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j3v62264935
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	67TJvhbaZTj047hnnY+jwvd3c/L8F1Raj4MzGVBymyE=; b=jViqdCmOkP/Yo5J4
	jNtrSgh8ZvwZbvbhjMSTcT1yx7u93EdmfW2Samf6H4hnumFgDETsj10LWVasU1nx
	ObS+/Ly7fj09mYekvou7veL2zQWENH1j0ZR4LVahA2o3jSA5m3ACAmiMsw7H9zRX
	QmULRsdN3d4fgSOlz0wlNRCjXnVqO8YuQdaRea0zI2mSBkLe0uUp6WsRlkZzeh3E
	Um3p145rjpGcVQXU2RSA7ug5OyRNd61CFs0PBtfLKCylxTVP4N7Amc+nzJlnq83t
	Ujv8mzHe8+iGwAHi4kPVo09C9UBypzZrDuiV0A0tS0G9T09aDWivANzhlPwDWef2
	HUx6Ug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxn9q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:28:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab9850456aso3057976a91.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792391280; x=1792996080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67TJvhbaZTj047hnnY+jwvd3c/L8F1Raj4MzGVBymyE=;
        b=cA/H0xXzErSmXm3+FQKdJiyXNqATTNWVhunt6PLTyIxutDdhOwu4+hxIQFDglCeafI
         tlZEX55sDkQ1rjPjyy25ufZvP3o2qjMOtPv8Nyg2uSirQ+rzsOMnzdE4WE+GQkZmGm7K
         zaFECLk+pKc9893co0MyMCAaGf4p/4f6Mpm1KeU2RVsF0XsYCqvVRwHz2wYk5S0DGlPl
         ppsOdcTmhIidvq2WB1P5UXBP+JptsJMmYfrrSx4nswmvvLB/frOd7r/9FyfUa7zykTx7
         6CbtdEQdEzVbzc13JL646F35yxa03aIklEhK6JzdEaaoigTT4WFiD/6Zzq7VC1lxsfXx
         woMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391280; x=1792996080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67TJvhbaZTj047hnnY+jwvd3c/L8F1Raj4MzGVBymyE=;
        b=qf7eeQ308GWXUvI21cjvtlECT4UNggruN2/Ke0Ko+aygK+gExHshta0FNmx28/1X88
         GKTa7g0gRQDvFz24A6n3MOP9FL2v7hig5Rknvj94hdOBWxsPMLD/mE2lfGe31RftnfId
         0xuKyTA3b20IyWx3ij4FZ/fE6hvuGddt0H51jFoqvSdundBVeE4/x3NDQ52Y0cqq26e0
         aGpIZdfwQsBn0Qz/EXg+oJxSEytp5KAgKlGJAa627Cb4ZlbWWMlZMyrT8dwVp7QQnReF
         5htDzLCqC/q9mqAl5vDb7sg5PoTB787nUXI4TxjJrHzWh7LLO8HldBU3xcA+Szd7EAzJ
         bYlg==
X-Forwarded-Encrypted: i=1; AKwUvBzpR/v6Zpl01jVBHM7xhDC8vNwf3dyUfe2xwfg6oAXO8R3ZOsaERI59HzkOVT91tQR4Ymlc8dgfdfKs@vger.kernel.org
X-Gm-Message-State: AFq9FYJU40qtvARvJ082irvOEqhJikwGs3ky6BkfXVZrhE6R5OJmfp2r
	MH2E0b+RTuDH+eEZhioGwu3lE7UKZ/JcCnf7yDDeP1KfXeY68YlAO6UPHLCTX/djsBJUPlPRF18
	MYaMAecEDdx4ilG9O1rxPSZBgqkyw4/2MIFq2HlHOvpK0HNHLHACg+NiGB5JCT1Mc
X-Gm-Gg: AYBFou0cXvalX6KFJ3VQ/XNV+GmRTbzFS4YVS38Df4FS2k8NTXE2XTagmDFDDV8DVfA
	Rr1bwjjEnE0b7ohyWj9YgfSD+6Ms58PgJyhWP4O2rPD7cSzddbxyN2uyPglMkTCbP6rmJLUGnXU
	TSNDaKXC0m04b9xQpUSr0du3vJkQ+xWFdcuKPHh9usYmmxfnEfVVzdX0qLJEg/esNzv7vPzeuLX
	emGc1VcQG71STzKmai3KfXnwALnhZMon4yzEI5oXzj34M3DCLx1hH6V/pZ+rNEFMn4hBZAKpI2T
	WcOJP/kq2gVwKLM8GQgNPQWtVna0kAa25Cb3kH/zKnaWXfj+CmLZqAj08aAT3E4hJJHg0Tqak1m
	FiBcGjWRNu5uN0Nq7ATP+
X-Received: by 2002:a17:90b:3d48:b0:3ac:9df3:6b07 with SMTP id 98e67ed59e1d1-3acef0c8753mr5686892a91.24.1792391280370;
        Sun, 18 Oct 2026 23:28:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3d48:b0:3ac:9df3:6b07 with SMTP id 98e67ed59e1d1-3acef0c8753mr5686875a91.24.1792391279887;
        Sun, 18 Oct 2026 23:27:59 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e7548sm19362196a91.1.2026.10.18.23.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:27:59 -0700 (PDT)
Message-ID: <8a2f55ed-67cc-443b-bcfd-fba9c6f646e9@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:27:54 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
 <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
 <b410aa8f-c4a0-438b-a02d-765da25dc160@oss.qualcomm.com>
 <686fe87e-63a2-4358-a6b9-8b2107b369e6@oss.qualcomm.com>
 <1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNSBTYWx0ZWRfX8gIHzboUoQ4t
 7KyeeuYIKIbAuuSt27xrbQtgg9k82XJaRNYmMANi1vr7x2+c9q5rBUlP+zgteoIJIZEXCbAxXrB
 K3ttZJpC5zBy9Riv0w1SPg09wE4hYb0=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad5b871 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=oXeLTmZ8f4T6MCm4ZgoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNSBTYWx0ZWRfX45+KTX3iC4ld
 MkndF4t08Zm+C1pun5N4t3LFmC9wFU+0HHdBlc119BX3tdbZwBnISETZddtZbP+5J3RRuxCheBS
 E2yGG3hv4h6fKB8D9fDB1rozpVj+6UQieDQVgw2paNysnzCCpRS48hL9rWXZp2sM0bsXG6lvF1Y
 nd+/fp2kJPlz3E9QA98Rqx4Q2efmzmdf/uHsBM5/fXwu4mtHv+ciPYALILYmR1io3PPiZcZhBMG
 prOqVk4lFG2cun1JywBBXaZgwJIZO3kDoyXomzujlP6RLTbC2MSY+zlqFzBDJARKUFa6dC2fuuo
 svDDD1vPdTDqhP3P1mG4pfmlbM8Zd+fT+cqz/I5kwuilP4HWzgTCdAIN3oSbZ9tvUjPGYEVler1
 9jXhwY2QUkps+9ORhm02MSv5cPgmiOt5ju2U+O8Oz2jMEpK8IDEAkJO9AQ3no/+J3onvSkZFiDi
 Jyb2m9xOx+NK7Qe+wSQ==
X-Proofpoint-ORIG-GUID: MDwENRo75SeW2jCCGaaS-UHmt0AZZvyG
X-Proofpoint-GUID: MDwENRo75SeW2jCCGaaS-UHmt0AZZvyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190025



On 10/15/2026 5:06 PM, Konrad Dybcio wrote:
> On 10/15/26 4:26 AM, Jie Gan wrote:
>>
>>
>> On 10/14/2026 9:23 AM, Jie Gan wrote:
>>>
>>>
>>> On 10/13/2026 8:49 PM, Konrad Dybcio wrote:
>>>> On 9/22/26 12:35 PM, Jie Gan wrote:
>>>>> The APSS debug block is built with CoreSight devices like ETE,
>>>>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>>>>> ETM trace.
> 
> [...]
> 
>>>>> +        tmc@1d029000 {
>>>>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>>>>> +            reg = <0x0 0x1d029000 0x0 0x1000>;
>>>>> +
>>>>> +            clocks = <&aoss_qmp>;
>>>>> +            clock-names = "apb_pclk";
>>>>> +            power-domains = <&cluster_pd>;
>>>>
>>>> Is there only being a single cluster_pd a mistake on kaanapali?
>>>>
>>>
>>>   From psci map, KNP only has one cluster_pd shared among all CPUs.
>>>
>>> Hi Jingyi,
>>>
>>> Can you please help to comment this part?
>>
>> Hi Konrad,
>>
>> We have cross checked the cluster info.
>>
>> The PD configuration for these two clusters is identical byte-for-byte and is based on cluster_cl5. I believe this is why they share the same cluster PD.
>>
>>                  domain-idle-states {
>>                          cluster_cl5: cluster-sleep-0 {
>>                                  compatible = "domain-idle-state";
>>                                  arm,psci-suspend-param = <0x01000054>;
>>                                  entry-latency-us = <2150>;
>>                                  exit-latency-us = <1983>;
>>                                  min-residency-us = <9144>;
>>                          };
> 
> Right, the configuration is the same, but ganging them up in a single
> power-domain prevents one of the clusters from going offline
> independently from Linux's PoV

That's making sense, we need fix it.

Thanks,
Jie

> 
> Konrad

