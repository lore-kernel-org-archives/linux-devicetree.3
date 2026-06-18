Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D713EB104
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783919; cv=none; b=mtNMKGQhn/BdTz0RblAh4ri0RD4l92Mb3IP0ZnYPItqaA3DH7TPkrjZK+cGtEOcKZ6V59VTQzfcX9I4+YNoulotT5x6J+N6FvLrYGexMUMpOOk7+VoCgZmyJs7rYPMA3l1ZHxuAYHafbp2efWJHZCKVR3NsKzwEciLlUURurYzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783919; c=relaxed/simple;
	bh=KZ2n6uHf9sALlO8azO9QIykYyyZQYitsXVJH6IWYZnw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=d6zg1uUb8ih/+SsPyDDVJet4uUbNkeeBIr7kMTXbtjyXAYIx4GKE0MfW/zqMmjp5HeJQXaPMfqPybkWTywHmw3ThAfJTsgxqa9jtAf+XSNp+K8yJMUlX8/SHLHMlmVfSINcg4Y2V4oyLNUQpMMW22zkNHcJoeVBmaoA63in6h8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EznYjMPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WplL9qt4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EznYjMPK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WplL9qt4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAra4u1054833
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ewl4h7yTa+CJnsF+C3UlKgDF7RA9ieleZlORZvvMj6Q=; b=EznYjMPKmetpcu21
	gX+/j/d4J7/it8cSNiw+GlxErMSn1uhiQqJoEi7dBY03FY9ZVnbfhjMirdsCqKAX
	jZDTCMeJ41hAMR/+V/+43E6Wt/pL/rAfNFu2anU5He/PK8CCDeVVvLhcMQVu4CW1
	LgwKMlZFgkjZ5rSTuO89fk9jocYiqxQGVphW3GpYBaHGrVaiZkW7f5Sp1+gsVhXL
	U1DkhLS15MhR+mPeejpI3v0Pfj5u0dIlL7zqm+RdtO1KpM0BN/n9Q1VgeuCe1Yrg
	gl4V7VPO5EOrBljZ74mMEzlXBqzG3gqKDzXY2cktGxUFK3PoYN82QhaT7tK1Qfum
	LrfNFQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2ccc71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:58:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37ca4367860so1507021a91.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 04:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781783914; x=1782388714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ewl4h7yTa+CJnsF+C3UlKgDF7RA9ieleZlORZvvMj6Q=;
        b=WplL9qt4bh2hHHh15kttoFU6bvDls2YBvbfE7Pvgq464704ely82fPt4GJALcJxJke
         1k2+J4aKyXrM1+3b8BROJWMsUh02XgfLg4nGDlt6r1FXmixjRZ0SSvXtY8xfHmUdaBTm
         CnO8R69xuxZ4wPoAE+LZPygTFiVFRgJPaD+WYUQF7lAbfx0zXxVaw3YktJPjOcb99eHC
         33aFVC9S6lT+lrbNSvgtwGSQHKdC6um3hQNYfG6slAYVbEvzRNEhTVK/G1OBtdLsMFpW
         iw8UBlwQ1f+7EbcPyoXtWgNY92orgH+OYukAD6w6orJfx59N4U5uXXPTzq/V0+Tu99ql
         QdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781783914; x=1782388714;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ewl4h7yTa+CJnsF+C3UlKgDF7RA9ieleZlORZvvMj6Q=;
        b=ZgDDFniCHd5f4V0GAh+yVUiziLUfJKkCZ900tv6cy0DqjN6mthKrjpjB4a2AOZTVf1
         WKb0waoP3gjsagw/9F7uyuvokkDy/Ck5MqnJKaC6kv/Dg6S8mWkS7jXqbZxB7azQq//j
         uiSatAPLqGY+o3/Hzgws8asbQA08WzwF8NuP+YLH51JkLEM4s1KnanzHy3NuV/XL4Ngu
         43utJl3gv3AiLw0KwM+F5IOtnFLj5Gra1W0tcbmI29Vaz1q+Aj9FCV3zbr1Qk8VHgeSb
         griXntjkNf684D/Dnsy9qh+L+OiLMcWD2rjnmbKKJCJHbMNcAhpB2oXKTmCI+pKxH4bb
         dtDg==
X-Forwarded-Encrypted: i=1; AFNElJ/pvZdkPfREapv+Qt8BRqIwV7VB7GlDVC2eCBglutTN4t4tXas9uwK4OWxC22rU8sVIYDtYyP8BZ+Mx@vger.kernel.org
X-Gm-Message-State: AOJu0YxpBOnKtlrwD+4tt2pIHysax7tWxDkK6N5sd/6uQlw5Od2QQdwW
	zdBCnU0S0M/vmAHri17sjB41iuK5Hx+iCxEXt36MGjst5dLuFHTgWIpg0Gizgi4Qne5DezvsgT0
	zsmOK9QzcX52lR2MiJTa3V3XjFf2zT1y1s7PjRI4inrXD144cs5JFoCkpXhu7T5Ko
X-Gm-Gg: AfdE7cl+BPZStkVL7pU+gHarBH2cFOMEb0+NYouOo+sNDYJBXifNSBg4ptP2tajd9l4
	LFakYD5oCIPEyedDe4LNT2PLKzIl/gFf50Lf6FADqrJUN0aiLuhQHWSehRIfjgYfRkDThcNhvNs
	nTBHxarfchXjpVGe/yQ9erz/wYzg+t/oWJR4du0vJX7gCrApb6Wdc22l+1jTnwnnUsmP5uWduPD
	E4Z1LvYRgNISziwzMgic/LfwFzFNJBUoIhYeGQXBapOMNzWlz56PFK3cs9+FUtAOwBsxihe8sSq
	rtlm3W6/YQMnn7uA/KYdCsNMCbVGX+goxCeDMhq71kaAJEPOB9A8EtMVivXTJmWZ8tW0grEOZN/
	QjjLaP/n4AuVwHItMiOXb2zJtj2fNdVLIyPYLOmxk
X-Received: by 2002:a17:90b:1c92:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-37cdbdb5acdmr2858161a91.10.1781783914118;
        Thu, 18 Jun 2026 04:58:34 -0700 (PDT)
X-Received: by 2002:a17:90b:1c92:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-37cdbdb5acdmr2858139a91.10.1781783913689;
        Thu, 18 Jun 2026 04:58:33 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228ecd9sm9012749a91.11.2026.06.18.04.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 04:58:33 -0700 (PDT)
Message-ID: <b4794e93-0fd3-4559-9ecd-02d679bd06b5@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 17:28:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
 <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
 <0debc1fb-f6ae-44c6-aa87-d5ef3e39b47d@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0debc1fb-f6ae-44c6-aa87-d5ef3e39b47d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExMCBTYWx0ZWRfX5bMyYnNGOogJ
 tRZeVAZ9GSn4aQhrncqR/xF+pBzrl8B25a4QElhJUmwRd6V2LF8gjbYShxD8jgSKY2+3x/wFJ9D
 9VW0frW10BVV4HaoFfdh6h2VHG5sE/cs4xyZbSDLaSSn5KTSEfV+DXP4fo7G/mgkr5AECC4dT3J
 56kmfCtf/J7KVd0okjwITShVJRuLogSOc0V5DvhD89MDH0nKsEQ+zqF9MRXPqfYIX1W5ELNSSPh
 nZjO6ouVg32vLPV/K5k576g73Wi4pLzjRkhhqbWVYx7uDD5x/Z9DhSiGjG/aBl4xFOVC/0uwjN1
 afs/6odI2+i2IntRAKwVxSOkEh3cN0oQIkpAqKZroNIykYzmyRgDXA7dykqlDaS9OXvU4cUMJx2
 Wadm1MNgrnr5WE/a8ruMBiw54FQtY+sdKqPsLV+k2Ynx1bjsokc3KO+C3lfXDGr7qaD3SA9jOyq
 ZJuSoRFh04LOm6KIXNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExMCBTYWx0ZWRfXy7o3j+Hb6WBg
 45cXpMYFqenK/D7k69MAoPfQB35DmVfj5T6bJVlCHZMOes3AEMWg8oq6XXshXacpwVhL2f1vhBE
 XfsKjlPk/uonNnQ+EAuZqY0i9u/NPdg=
X-Proofpoint-GUID: TVMBjDPpdRjK9_enCfXGzG0lrPzug7u1
X-Proofpoint-ORIG-GUID: TVMBjDPpdRjK9_enCfXGzG0lrPzug7u1
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33dd6a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Z0BHpR-UP7m2DiSvRn4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180110

Hi Bjorn,

On 6/9/2026 12:06 PM, Harshal Dev wrote:
> Hello Bjorn,
> 
> On 5/18/2026 2:06 PM, Harshal Dev wrote:
>> Hi Bjorn,
>>
>> On 4/24/2026 2:05 PM, Harshal Dev wrote:
>>> Glymur has a True Random Number Generator, add the node with the correct
>>> compatible set.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> index f23cf81ddb77..64bbd5691229 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>>>  			status = "disabled";
>>>  		};
>>>  
>>> +		rng: rng@10c3000 {
>>> +			compatible = "qcom,glymur-trng", "qcom,trng";
>>> +			reg = <0x0 0x010c3000 0x0 0x1000>;
>>> +		};
>>> +
>>>  		tcsr_mutex: hwlock@1f40000 {
>>>  			compatible = "qcom,tcsr-mutex";
>>>  			reg = <0x0 0x01f40000 0x0 0x20000>;
>>>
>>
>> A gentle reminder to pick this patch for the 7.2 merge window.
>>
> 
> Another reminder to pick this patch up in-case you've missed it.
> 

Gentle reminder.

Thanks,
Harshal

> Thanks,
> Harshal
> 
>> Regards,
>> Harshal
> 

