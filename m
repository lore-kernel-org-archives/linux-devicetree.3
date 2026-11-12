Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467614;
	b=k30QcBXc3r2vMkLtf7By2MGCRTP+bMnnfW5TkufHjttUaeVfZqC+FMr9EC5iZvOkO3n7
	 Ci0d9aAq+1SfuECgxuWCgb+XLGHanEwBUWReWFla/3xK404DCHODBneXTW0YNdXxMnFow
	 wc+ukzlnzCHTYnbuaLlnH9T9A0gBUAyeziuFKZaAzeOw2IvDHHIOIjwLjShSNzQ45AHVm
	 EWlElyFcZ6NjSPE/DH0Vwrm2q6wwmgKoq3S5XqO+EAxxXayWkMgaS/IQP2NvOOie0yzAj
	 tLyIB1d9a4GVcKmjcLSIJ4qbynAPRY8iFgiY+lSowsrJeS5R06car29ucJhYZYv1Iyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9nxCH1icZ5d38W7PQLiQh/Z+YfmZLqkO+OjM8UBgv8Q=;
	b=UqHQHewS9lF0sQG7IIEewba75vASueGSqzLYlKNcrXdmfodnzNsHrbQ6r+IsIrGZAZSN
	 fxxVNmNelc8AiKwByiDMdrsibHqpWDLM4leDVSvZTqJJx4sHwEHKetZqFLMY1ogDYxusB
	 /5M0DDCYjM+KV2XLMeKQQ4Z06HVzRaIxHC4saSCO+HQLhj5rw8IAd8AwghN6af3MjI4oL
	 fJ1edW7MXjWOAIxgIZpUkSTpfPWjBCCEIehk0cboQuTKwmBKs4N+rRPaqfR7tUkFAEXXc
	 Nbo1mpShUK013bAIv/3i3xnHIIxBy5tkonR3YgYot25H2e4/O89O6v45ePKo56hc8Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jazGjcAO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctrctzE0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133E3606A32E
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 133E3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jazGjcAO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctrctzE0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Za8t2135751
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nxCH1icZ5d38W7PQLiQh/Z+YfmZLqkO+OjM8UBgv8Q=; b=jazGjcAOqRmdO8Xh
	O790Fya1/sTIHC4jP8JVwGjzkiO67C4LEP9GHm4C8LmkZl5qFKxcy4DvEe/9pGf3
	q62ANSz+htC+FoKAeeGodPMELa/nHOGthJBeo05X5EnZjPSIcwjBUMt64r6Y9rAn
	Bhv5L9PRyd8l9YPHW87DfmnL3HcKCoHBsOVQkqr259uARPHCrdpcCKyVX2/thdJb
	+di3Ot+f2SQ/5T9xEHlEW+1t6MYFcFgyhhskoKcorjcf5n5UjqvJvwfvDl5vedFs
	MZacteqZnRl8BMQln3DcrWkM8azyJLZdxy65Ecr12gMUPqo/df01eFseTwulpsA5
	gWKxYg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjvj4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:13:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so6933067a91.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794467612; x=1795072412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nxCH1icZ5d38W7PQLiQh/Z+YfmZLqkO+OjM8UBgv8Q=;
        b=ctrctzE0QhR3gm/nk5INZAfLscEyUd6gToy5F4n3Wr7LB622wKDpi2McWrtiDCB1wY
         r2VSUeLXzh+B/bEhFbAYe1he7ehpcu1RlJ0Jnv+CKDNn0g8NBoiT1jOmJXNDegihpNAA
         +o0ZhkO8uu8uA6DXvruANMdmsJzrjuHrvAIhxT92G9byyQWnstkjwtaVBYsEmeXVeoDH
         Z3MS7Nj66BT8esNlCQX47ECpMtGxeLwi3CA14mjriYn8poG/JMMDD6FOJ9QUJqiEnl6p
         iShTBPOHRzCPBe9dZNghM6ugvJEfLHumBvEdEe9Lu1hyD4C9VvK0dC4VIZViVroRqS19
         PkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467612; x=1795072412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nxCH1icZ5d38W7PQLiQh/Z+YfmZLqkO+OjM8UBgv8Q=;
        b=rZY1H6PBAjjglSBthilbNv1/B2Q4XfFef77tWs4L7Kx+RwwSlKNSsja4/MPJXRDJG3
         yrzdhxPEM80deFr4M8uS16+0U3ETQM7heRNc6F1sVoCPUsx60hcCF7+uJJNcwrfkWBx/
         wSPovY7rPWCTZwTp5umh/SKUzSuR+DPmUplag79brHgl8ZY1fV6Myvqkqor5YL9fVUT+
         NUelPVaESyIiVbb4GcUnNhuXCGYGKuTZKXuhSGnMJa5AxI4XnApTH8FfoaAfA9OFP6SM
         ezIy2a5k7tzuxjIBPmeFj+tPiAHAuma2RrRJyhznwLJBr4jKg0R2I5kEDIsBU0qE7/0X
         WAYw==
X-Forwarded-Encrypted: i=1; AL+hErH+SNOH0jL3cNHvfK/VMeLRx1m/DDDxezINRyRie4o8SpSicncWZWJJVjp33+Bb23Ne0P78YHqyfE3t@vger.kernel.org
X-Gm-Message-State: APuU4Z8yssFgl/qyoni0zmHEAm1mdwADBD7eaqsxRWSfQQsduwe3A0xH
	/ycUwtyN3kmjyaEa+SxhsL6gebKM8+JFpqcy2EDKetyLCRSNJcBeQHpaKIG/9q5R8f5YK40hfjp
	ZqRjMNQvPbZI5Buh0kqqtY9ZTyonObrezc3iyGi9ehLtfkuVDxNNEQmoI/iDowxfo
X-Gm-Gg: AYBFou05DYIC0Ww87Wv8O1kPdMPxy/CjqWDbQwVhbu0dtuvdV6wjxGkJNwUTP1SIZ11
	BudvE5ExnlV55dyeQL77gtTuqqkNiTJu+MseQOTRtsrONsyiLkePuPj6dwSNojMceC7f7MSTey7
	LumGAsX7OijBiD2tIYftQXDo+szWVTtFQotJCDKJKNc0iiWMQMFe0g2ghzZEbMpZQVqkzU1uJ/y
	fgNF9jdFlTOg7D4QAObTviNp1W4xr0CpcrwOQxJIPCkaF5nis4KoFeLk6Vbqgm78tAq7wATM8bk
	XUDBAjN+VYAYJ/PqKBsIRCbA7Q00o1m2LoKedXI/TO/HxkJ304OV+TZjo5yQSC5QwayFq9Ul/Mf
	cJd1H0YpfC+aOc8Qmsx1zZwKEckUIRZ2SNCdvxo0cuXr8BlmTkum+h9jjL0z6XeHXyxNYjGP45K
	pD
X-Received: by 2002:a17:90b:4ecc:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b182eec2f2mr4479551a91.36.1794467611895;
        Wed, 11 Nov 2026 23:13:31 -0800 (PST)
X-Received: by 2002:a17:90b:4ecc:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b182eec2f2mr4479529a91.36.1794467611476;
        Wed, 11 Nov 2026 23:13:31 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm3143116a91.11.2026.11.11.23.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 23:13:31 -0800 (PST)
Message-ID: <01f33d97-ce2f-4cf9-8672-63effc90fbe5@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:13:21 +0800
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
Subject: Re: [PATCH v5 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joonhoe Kim <26rote@gmail.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-msm_gdsc2-v5-1-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-mammoth-of-delightful-potency-b1ede2@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261109-mammoth-of-delightful-potency-b1ede2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOCBTYWx0ZWRfX2/RCZX36oVWj
 1b67lbXk9BoSo3s8Z67KQw7tsF3Z/rxhYo2SaDclbrQKpiB4Ze8In6V2BfVU2FPazJPKOqks6sw
 QI+N+kFAIVTPAmYdV0af5TPD/bom6xpi17TcvUQ5ZzEypS6Xk4XE/MuEq9Q0XTfXh34hBIJcvaZ
 Uu3mEc195pHUQFqrUN5H6T04DGb902bEGc0jjhQ5P6ZykV7ImvLt0EgoIWKRUfRposkMB1ri18n
 sxHP2ahMNV7Y/Ylmz8WDBxnwrrzEPnIZ/LV0qd0eyRojKb5jpgikNbrUJoDmvCpDrdX56RI06Yd
 Bc6W0JZCEME0i768oFIu9aW+Se2cqYBb0UlRqE42NHOVKYnuomyDm2txozLaWW+YOUSUn3R6ly2
 XlB6uTEnAqgXZyPbltHoaEdlPJUeaeBAPy6WbxcOeCLL+QVS2D59k5KPeySvQPABS7E1AzvAODu
 XNdY2Mo1w28R4d46EMg==
X-Proofpoint-ORIG-GUID: k9X3sKV2vsgzC8lFW2Jb2mlKF0blP1EA
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af5671c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=MxPvbxFPEjud-wvEnLgA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: k9X3sKV2vsgzC8lFW2Jb2mlKF0blP1EA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOCBTYWx0ZWRfX4VQt8u2yOocD
 1IQkv/nbO2ZkskX8b3fjDDhf5+LFTGeJmVQoAannhfABPlHFI0eopyMQ88BwN+XPPoEeO1Q3aFM
 Bv/n+bxq8+mvQd8ii8Hasj8GCD2nT7w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120028



On 11/9/2026 8:25 PM, Krzysztof Kozlowski wrote:
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,kaanapali-dpu
>> +      required:
>> +        - compatible
> Droo required
> 
Got it. Will drop it.
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 2
>> +
>> +        power-domain-names:
>> +          minItems: 2
> How did you resolve my previous comment?
> 
Will drop in next version.
 >> +        power-domain-names:
 >> +          minItems: 2
I moved the items: list to the top level in v5. Only the minItems: was 
left, which is pointless anyway since items: already fixes the length, 
so it's gone in v6.

>> +
>> +      required:
>> +        - power-domain-names
> Why adding this?
items: only checks the value if the property is present, it doesn't make 
it mandatory. The driver looks the domains up by name, so a Kaanapali DT
without the names would pass the schema but fail to probe.
