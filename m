Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437285;
	b=ijP8VVKdfmz50uEWCjwDfI6Zyl6/Fc4Vfsfa+mYH0j7z3Xukme0ohQxQVeEa6e/qzMx/
	 K3EEFlbcNi+m8bysb7LCxo+mLidx6TQx3O8stniNVPdUUIKicA/aNifHf+3k8dfprJplW
	 RrlH/KotxTTfY9hWz3jWKMErBUrlJwT0VvfdYHAAyo/G8P1xa3GJcss5iZe6CJyfFT8z4
	 LK1d1Hp/EaTkzDTVZkiwYeiM1ihlpQGYbZsufflJpwqNjbE6uvffUaLb783HLXQu0PWYf
	 +4qTijM8X5cW4GR+IUGQ0/kHM0sibNBuDcQ1CTEgK9KaJzk8SSjUUkO9cVzruyMMnBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=;
	b=rC24d4domTZd791Ohug617ROm3vJITC51YPxTWWGM3RV+FbTfVAyyG9Vmyi1/0IdBxVr
	 lQhui6WgBJpAucsq5a+qrtEtcXIZy67XTtEatJjalaMMGr20wQkSvmpssCPTEVcjZ/cd2
	 cUMMN6qi5mvmLtFNN2LBcHOQW9nwj20epMSY9QDYxWn8VvvgRc5apBhyV01K6apoz2OFz
	 aiq5MMajsiz2ZTv2Utgkx67QQAcXt3cnQdQ45rvv/tlstgJuxoBk2RmQJeKBj+QTXkKVa
	 Fy+YYIH7jtdFN2Q9tZSeZo0Od9p+d21F4N+CNIO5LlKLLurLO/ZN5Qg8xn/kgaT0Y4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eAlWEAIt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvYIAkT6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F5C606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F5C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eAlWEAIt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvYIAkT6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCFxse2928081
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=; b=eAlWEAItlWqboMBz
	ciU3eY1E/tLoITK5Te7/rhaxnoqWgCcZjMOp7WX82wKy7MBaPcgxEmujxuAVNEMo
	nPUFTP5zeEkMwZb0z96CfZjgvWpjrq8CZUROIvviR8b3jdS5o8+xqNHv/92bTb4Z
	Ieeh9bp/p+Mobxs4G5duNUn8oBNjFv7wJYMzgvLHnZZc30YNioaXnmVaW/Ryhoz9
	U8GEIDX8/smIoUa9xwM5ACaKGUl5QzDevUAtsSsXDgAWC/2ypMvkJC4j3xgw2+3A
	rxnFTAO1U8CAJ+J6vOZ+JNgmBnDUHDNWv67ZstdjJ/ivR7k5z1YqPw4lyiW6xKGf
	XMjcfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7s0gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:34:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949b0d322fbso473387385a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795437283; x=1796042083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=;
        b=AvYIAkT6EmvKa84bvblmRoqN2zEXnr5evixmbno3916dFKkFtnZFuECgsbcnpbQGuw
         Wm4IwMIHWiTxZgeCCB7NM2fNakAjRlnALskG0pZgfDNmHqk2YdyskB1oQ7H3PfmxIKKE
         S/RCjLqhv0UvG+TgLNv7MPFc2sADFJjXZVlRgEt90Lx6uo4D4Z37Bs1+i0+mYXPc/ZnE
         YSrnLcNkM/BoHefdmRLVd6EFgS7uiHpi3KpQdpAleLu99qQ1yMbaKhl+SlGkLJ3KFGVI
         pHlj8KT0GIQFqP4PyzpebchhIXyWOajysiVqAVJSHkSl4c0lQRPe+TbgJfzznO334Sa9
         AcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437283; x=1796042083;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=;
        b=Z81L4tI9+K4dAKjPM5U2rbT5/QuJi2f89RMy18NiMJDOhPienyrBCezZg6sC4vCsvC
         WD7H7ZlPmBwExWdeSH08n6HOVMCcdNgQAEqKeKH40b2aebfdiNUddwuvYeprFRc0SySa
         Z3vxOuF6lh46oOjml0NbOWlM/fpDJhVq6kHDYzaTS9DcIiwgeM/iB8UkqZw5R5Mo16Mm
         aOAp4QiUvgi7y5rsfHK5MJPMiRAp/PVVttQOvBmZwVNhsMtxY1f9krf3BR9i+9EWGXRP
         KC4la+yz3d0WrRatpFl/4I+lBfopW4G7udRO//rMMpWQsm6zOlnXorMReaJZLelWnDw9
         0A5w==
X-Forwarded-Encrypted: i=1; AL+hErG0OI77550LKQAvNLxYrMNcuNiZxKNiiB5TEZoA3IECd3fUYDvNjwcZx3EPCnfZaqbdPuIja06MhRfJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/tmBXFtkjqnTKh1TQ3KXvruVNQXeYvc9Vecdke/PruWKBq4LSM
	A4XdR66yN5qaC0S+CwYKq0dBCzV9jrblnBWwdAuRuFkq4snAu5++bJ5nl71f3vz6loxEaSbFJlL
	GMMjcP0UydBd00ovo4nEZoT7VkT7P6dwAE/svZDvkMsTtkDwMffF9sr65Y6Eu4hgs
X-Gm-Gg: AZFdTZcb7d5dgsgDQksGJopo6IStUkG7YSq9wginTtZr3UpBygpOxrISQA0PAE3vnys
	XykniNufcjIW9WloC8uJD9ms1PzuF6m7T+ScKp2GAoB7EbVxgwchZb1nt5SMD9kPdp68iCGz4fY
	iMU1LD96FX39+aFnakvkSNyJ29sjomrGQZOEAyaeuccvSktNnOXmeAt6KFAOD/zt1E6jRo2XlrY
	+4hFRCwZLe3kquDT4ENjzqtx3WCmwgkGVNrlgLqCYT1bg+/qmGHVwJ6SFyh0p7Kh5TKZ5juNk6s
	weWjKuwtdHk1LHbwJ/g4jiknB9iPbWPPKq2Cr7rFcng+AiK0LC13BJzKCcVAP/PreBoFhTaMzWg
	M107vX194DmZRoKPwQZFsy0V7AarMkklZXueI8PH+hRtsa5m+8x3ZOBp4Xv5mPRRwBo4QII4GDS
	B0LQ==
X-Received: by 2002:a05:620a:6493:b0:940:e34a:aead with SMTP id af79cd13be357-949ba80fa2fmr1754286885a.5.1795437283022;
        Mon, 23 Nov 2026 04:34:43 -0800 (PST)
X-Received: by 2002:a05:620a:6493:b0:940:e34a:aead with SMTP id af79cd13be357-949ba80fa2fmr1754280885a.5.1795437282514;
        Mon, 23 Nov 2026 04:34:42 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm542505485e9.14.2026.11.23.04.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:34:41 -0800 (PST)
Message-ID: <2ce99966-6813-47a6-8d0d-11f3f6f2f2f6@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:34:40 +0000
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
Subject: Re: [PATCH v2 2/3] soundwire: qcom: add multi-master support
To: Vinod Koul <vkoul@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
 <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
 <586046f1-8439-4353-b60d-dab6356de3ba@oss.qualcomm.com>
 <asCxoMbtsSfVcX_9@parshuram>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <asCxoMbtsSfVcX_9@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0432e3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=TNgizOjfnv4wsRTjD10A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0OSBTYWx0ZWRfXx2rG+5QMoLKS
 jmcFG1K733WqeBmdrcq7fKpjDSSoJc6B03W4bg5ojP7JWDW3tmDTvbb9BBc+GQLdjmNlJVgcA9i
 c4ASx8cOFbxkHHBZq1itg8AWazmVsnem1tqvvGvKnt6vP6pfWSjOVu8g7NVbeb5RQJb9+hVAXSD
 8uuwrw3DK4PTSmmmbY72lDJ/vpKbVn2WOeuDD1QcDPfNsMyOBpeGSCqifC/kxuS1Y8lmtBPqzLS
 /VAy3YfNfxJRwToeydPC3JqSaI08m7NLLMZXd0LItfYUIaekn+GQqZdf/O84oz7jlhzNkv2nihO
 3kKzvPKpE201Wi/emcdffC6fSyzfkniCtqfDLkVWenHa7dqmA/95kovbT1hsq7WRFzRYsjpI//w
 KRNevzrZilUT2az/y0dA5kOGZ6m32dOO2qyqOjRjG4/szsSkEYRPKbLEEGl2c08msiPVU7fX0Oe
 mCelnw0litbim/7XDxg==
X-Proofpoint-GUID: tvAIVyGn04ZyNzn8INQi8G38aS5od1ql
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0OSBTYWx0ZWRfX7JEd5CNidBO/
 iIpR5E6IH3ayV4ktReKKKa0CR2YdK5sBA3VQlq+15rVTvvU4iZ5Gu/D0hkQk9EbEawMd7ujOrpd
 Yz0EQ0AtmDblmFpoEDlD3s7nr1h5A6g=
X-Proofpoint-ORIG-GUID: tvAIVyGn04ZyNzn8INQi8G38aS5od1ql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230049

On 10/3/26 8:41 AM, Vinod Koul wrote:
> On 01-10-26, 12:06, Srinivas Kandagatla wrote:
>>
>>
>> On 10/1/26 11:53 AM, Pierre-Louis Bossart wrote:
>>>
>>>> @@ -192,6 +194,13 @@ struct qcom_swrm_ctrl {
>>>>  	const unsigned int *reg_layout;
>>>>  	void __iomem *mmio;
>>>>  	struct reset_control *audio_cgcr;
>>>> +	u8 num_lanes;
>>>> +	bool is_dependent;
>>>> +	struct qcom_swrm_ctrl *peer_ctrl;
>>>> +	u8 peer_first_lane;
>>>> +	u8 num_peer_lanes;
>>>> +	bool is_primary;
>>>> +	u32 peer_dpn_offset;
>>>
>>> nit-pick: do you need both is_dependent and is_primary? One would think
>>> that a single variable would be enough, no?
>> I did try to do that which made the code bit confusing to read.
> 
> I am viewing it that both should be set always for this mode. Do you
> have a case where it wont be the case..?
these are mutually exclusive, will add an enum with in v3 along with
role member.

> 
>>> also without context it's hard to understand if lanes are independent in
>>> terms of transport or not, not sure what 'peer' means in a multi-master
>>> setup with a primary controller and N dependent ones? Code like this
>> For now its one, but Yes, technically we could have more dependent ones,
>> I wanted to keep the patchset simple and right now the only have one
>> peer and i dont know if we have other setups with more dependent
>> controrllers.
> 
> Lets add the logic when we have such scenarios and keep now for one peer.
> Does Qualcomm roadmap envision more controllers?

There is only one dependent per master that is supported as part of this
series, there is no platform that i am aware of would allow me to test
or support the multiple dependents.

I can add a defensive check to not support multiple dependents if that
helps.

We can always extend this as an when we have that usecase which can be
tested.

--srini
> 
