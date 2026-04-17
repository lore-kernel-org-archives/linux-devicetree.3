Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A031B830
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 05:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776403455; cv=none; b=J1N4Daruj4YaQ8i9Hi4yEt2WFU/Y1PEIh9nwD2kUYc23tGfeh7BPZ4PgvM0huFwn59pXBG1UFQWcdpuw4E9cBL19E1OpQCg0XGx5bxKnAmaP16y2x9z1YmI4SPbMwCT5DqyQf3vI8T7ePgZvDDr3oSKhwh/XTazrvm4XhxSYZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776403455; c=relaxed/simple;
	bh=jGOtRlgc7tII7CGpwyewueifmpvFdF9A/vqjXaUAVGY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NRciphGbeqzsGb79uGB9eWu2mJeQJBrwOPHkoXBFFS6mqw+48cWBOXOVM3T2u03NBhdRs75ncat8QpaxAliu8XbeXNBG6t1kcq7HwIDfcPk1IjOpd+BmctDx2hWbdn+gH1XAFogCPh4N/WGtoVjFcOdxPtml5EYSJUisE93bUv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWcbfert; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIDcTTtU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWcbfert";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIDcTTtU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H185KC667583
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 05:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBieD+yFwPB8d0ibsPHTSSGgmXv2ocvr84vGd67hR8U=; b=oWcbfertka83hM8P
	/eKpkATLUXVVJ70pq3erAT62vdBqLkYhTyg2z9ABoLDDve39fAQqiA3pQzV7mXAj
	M+hJtF639MJCeVymUJmuqWSxvagCw7NcucQtLUtlhWVUgwMgdfzSh1wtQH+Fk9Qb
	u3+FG3untQ2BzddvrGAWryC2I/pDDx+Q2IGiOALcfKXgnL8eszuRe7zLX3DQkhVN
	OdHHjrDDuin0HwidygdfoTCrTQ1UOHOSktYi/auWqRYLjWbNIWYl8FDR1t8elHfl
	RQi30FGk5Tdr067TBVhikVoj9wVdS9d7f9FMQqGXcDXk735t53CNqKWMNLRMIrb9
	4iXZtQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkaxcrm1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 05:24:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d83e7461so5274315ad.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 22:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776403452; x=1777008252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eBieD+yFwPB8d0ibsPHTSSGgmXv2ocvr84vGd67hR8U=;
        b=WIDcTTtUkALlmE3W9Lwm27TUr6eseR1ThMhtbze24OkZ1S8yEWZlxQxMTVKKtbtsKb
         BlaZ6/B6kXPLuwIxOGtaERrYbFqxEXJ7UVbzRvBruZG35d545AWQUW3zX7HkA848ypBj
         lPwE012oZQmwpJC1dC4YoYpDhJYC5h13uJinWV5YX4khE8iCPcJ8vMDTtTI+WknKufl6
         GkTWgyg9VaE7pdIsSc9CAIsR+bpCP3z8D2AC84C1JrQfJoF8aLMriHFSn9EreVfzxaVb
         zp+J+U7OOgYgwk4H6C1lp+TeoimUvIkbw4NyqEG8e/s/5+he+5EANbRz2pC8/xCefu5H
         c8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776403452; x=1777008252;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBieD+yFwPB8d0ibsPHTSSGgmXv2ocvr84vGd67hR8U=;
        b=htH03bEVhNbdTe/bHfATQkfKmDRNe8uMfG7/lf/YdDZbhkZMoKcNKBdaRbN5Nu64YO
         F+POBYPVb5wE4kPQf/KZ9eFoxM3V118ufZFkpM/yFgvbBmKOH1GJqpsgyenzk/CNnr6z
         qaQ9G/BvdoQWCGSdnl1TYNeGlFiXqtWCkf2wAlL5fZr5WjS3zMKJUujujNJvdHc+WRUB
         B9B41B4qIgCuVDXe06L77DJMqKCJB9cf/B04yiTT26kBHHwhi/3FTkg4BfZfc5jHL83x
         SscMV2V5/TRnohq6HD/o2UbBnwJbIo0YiIGZZv/qMOwb1l7AWZlHSILNWhpK6ee/b+WK
         m/RQ==
X-Forwarded-Encrypted: i=1; AFNElJ+M1RkVjhj+14KkjK5benwIGxKYVJNU0WCxCTtbXaVZWjINlygkKDfqYJsi2SAmLKDt6ow3AAyPdJ20@vger.kernel.org
X-Gm-Message-State: AOJu0YzdsFi884zgBIVcFSMLBZxy/hZEaCPIivt08xsDuTWB2xVAYexi
	jN5JnuO0QGCF8I3jqQACCdbN3FqUO33+eY6E+aSus9wV45c24R8lxRpOxB/MHjp+FutQCTTli9t
	zW0uJOxH1UaNsNSrLdBRW/rhGhtvGFReldzfaGk5bpcNknkWKVnHUU6LRyI2PFJjDCxJe8N6FOA
	M=
X-Gm-Gg: AeBDieuhNJXklsbYLNoDG9R/ZbM5mZKkvFxCxf3Z0wOLE7ctbRTBHme0EnkRCu0lHwJ
	DDXBYtD06zZAIwnG1FYA5PBrOMCjKKrRmtoAzcO6gD7UnrJIn+Mmx8c+NJ7hmX2l99boXEWduO5
	e8ZnLC9b0zAajxwWM9UeFMuk+TqKOBTYklt0XLZ3yWVDFqY8dhasoQRG9fim1DCbcSOUDcIWdE4
	6z7JtGS9k6izEFPIIfM0ZnbCvafnMKQJDpaWdjl9ZXvopvX5Sb5tHIUuSJK9tVugClW1bt3rU2c
	P4ttJVn2+HpYXdoq7lkTaeTicbTK/lzJ9UVeh+OEvmVmjMoEvcfVGQTI1u4ekqoP/Rye43d1H8/
	QgWHzv2xV9z9TNLTP/j1u7GzF2uxXU3ANK31e+y+E1nmd56HiJQy44E5EinjD4+qFNShFi5Z3KD
	Bt9UKefTPDU9QD3sRLo3R4BYt1Cw==
X-Received: by 2002:a17:903:48e:b0:2b2:aa93:cc5f with SMTP id d9443c01a7336-2b5f9e9a38fmr10441085ad.10.1776403451838;
        Thu, 16 Apr 2026 22:24:11 -0700 (PDT)
X-Received: by 2002:a17:903:48e:b0:2b2:aa93:cc5f with SMTP id d9443c01a7336-2b5f9e9a38fmr10440945ad.10.1776403451333;
        Thu, 16 Apr 2026 22:24:11 -0700 (PDT)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa32ad8sm7118215ad.31.2026.04.16.22.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 22:24:10 -0700 (PDT)
Message-ID: <48bbcc34-f5bf-4ada-8210-b115f72ee850@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 13:24:07 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
 <mxawruvb2p6svks3y4rab7feyn4dhkwe6dosjyc6yt2ozdaual@bvvof6rzm3jo>
 <c5d1578d-729d-4c09-b761-c67e6d3be745@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c5d1578d-729d-4c09-b761-c67e6d3be745@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JcqMa0KV c=1 sm=1 tr=0 ts=69e1c3fd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nEY8QQf2np8axcGL7LcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA0OSBTYWx0ZWRfX6sjMyQwh9nBB
 3c1VG6YTHlGnYGZIp+4ivJTCGpeifYQlKH4cWyJkOYFbH3t/Ij9ijtNDoYsUhBz0gLdIUdvxsq6
 BP4DJ1KppdmZm7dhrKn1ginyMcZLRakwJ/ZBmftxodIpshLR7KFRVH1Rw10tC4t0eUAgHMT4xbo
 ZT/PIgWmNgwxEaN4lCeo8nieOt9lYD6g2QoG1BjE7Mpcq5H4dDLxT6nOjD9LGjiiDcIYDhx6N03
 8fYDo6OsVYXiPui9JVjXo8qYhSSti7FfH9tWGxx+0bBBSmUJwaAJ+pSMZ0ghFPvLNfTiMGzRLiH
 h/8glRECJOhHyAOyiDylGfC9T7+/vFwDVjJriRagXPpPDoGdIOBpeqFvbHlgug0ZslM+12V+Pbq
 Gfo4sA60IyqhdYBVdi83Z1q4EpfMUx25WOcA+VPdoe5fLtnc+BznDzLlPr2I8VmC2yToRjxCaBW
 kvSyv61XvDVOO+uGqTQ==
X-Proofpoint-GUID: 3v6dBGEYTwGkxoxJo7UdT9HZFIj41iyg
X-Proofpoint-ORIG-GUID: 3v6dBGEYTwGkxoxJo7UdT9HZFIj41iyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170049


On 4/2/2026 12:18 PM, Fenglin Wu wrote:
>
> On 4/1/2026 7:22 PM, Dmitry Baryshkov wrote:
>> On Wed, Apr 01, 2026 at 02:41:24AM -0700, Fenglin Wu wrote:
>>> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
>>> the definition of the channel status register bit fields. Add support
>>> to handle this difference.
>>>
>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>> ---
>>>   drivers/spmi/spmi-pmic-arb.c | 69 
>>> ++++++++++++++++++++++++++++++++++++++------
>>>   1 file changed, 60 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/spmi/spmi-pmic-arb.c 
>>> b/drivers/spmi/spmi-pmic-arb.c
>>> index 69f8d456324a..deeaa39bb647 100644
>>> --- a/drivers/spmi/spmi-pmic-arb.c
>>> +++ b/drivers/spmi/spmi-pmic-arb.c
>>> @@ -28,6 +28,7 @@
>>>   #define PMIC_ARB_VERSION_V5_MIN        0x50000000
>>>   #define PMIC_ARB_VERSION_V7_MIN        0x70000000
>>>   #define PMIC_ARB_VERSION_V8_MIN        0x80000000
>>> +#define PMIC_ARB_VERSION_V8P5_MIN    0x80050000
>>>   #define PMIC_ARB_INT_EN            0x0004
>>>     #define PMIC_ARB_FEATURES        0x0004
>>> @@ -63,11 +64,34 @@
>>>   #define SPMI_OWNERSHIP_PERIPH2OWNER(X)    ((X) & 0x7)
>>>     /* Channel Status fields */
>>> -enum pmic_arb_chnl_status {
>>> -    PMIC_ARB_STATUS_DONE    = BIT(0),
>>> -    PMIC_ARB_STATUS_FAILURE    = BIT(1),
>>> -    PMIC_ARB_STATUS_DENIED    = BIT(2),
>>> -    PMIC_ARB_STATUS_DROPPED    = BIT(3),
>>> +struct pmic_arb_chnl_status_mask {
>>> +    u8    done;
>>> +    u8    failure;
>>> +    u8    crc;
>>> +    u8    parity;
>>> +    u8    nack;
>>> +    u8    denied;
>>> +    u8    dropped;
>>> +};
>>> +
>>> +static const struct pmic_arb_chnl_status_mask chnl_status_mask = {
>>> +    .done        = BIT(0),
>>> +    .failure    = BIT(1),
>>> +    .crc        = 0,
>>> +    .parity        = 0,
>>> +    .nack        = 0,
>>> +    .denied        = BIT(2),
>>> +    .dropped    = BIT(3),
>>> +};
>>> +
>>> +static const struct pmic_arb_chnl_status_mask chnl_status_mask_v8p5 
>>> = {
>>> +    .done        = BIT(0),
>>> +    .failure    = BIT(1),
>>> +    .crc        = BIT(2),
>>> +    .parity        = BIT(3),
>>> +    .nack        = BIT(4),
>>> +    .denied        = BIT(5),
>>> +    .dropped    = BIT(6),
>> Would it be better to extract generation-specific callback to decode the
>> error rather than defining the list of masks?
>
> Are you proposing to add a callback in pmic_arb_ver_ops, like 
> '*check_chnl_status', and create separate implementations for PMIC 
> arbiter versions before and after v8.5?
>
> This approach would add more extensive code changes with some code 
> duplication, especially for handling common error bits shared across 
> all versions—even if they only print error messages and return an 
> error code. Is that a concern?
>
> Fenglin 

Hi Dmitry,

Please let me know if this your preferred way and if you are fine with 
the concern that I mentioned.

I can come up with this approach and post a new patch.

Thanks

Fenglin

