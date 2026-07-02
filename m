Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B719838E8B7
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987764; cv=none; b=oA3BsM1g0YlgAAfcTqBA/NKOl3GDpfTKQkZqO5w9pueE6Zf8VgAW8F8cMLTZHjAa7K4WVA6evH8W/4MAeYxQjvNHHVuTA9h5WsSfwbGFd06jvU+Q8ssjWQ6mFNKCQDC5F+eaYtJwCSm4Wnm3g2NqtMOfeMs3yICkO8YrYXqJFwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987764; c=relaxed/simple;
	bh=o9tFLmNsR/+FbAtqghIZ3r5O3LeY6k36CTWd36OTwh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPzcPM2ShRgCUcMTzdnsJWjnUysbNZmr3uCODcqtnJx8lISECBzvr2LeBOnmD/2aCqqcosJYtr8YAM1ue8zl5ecMo82q4jNqhqmIN1oJW/gYd6nTuTvjknBELr28MvUrCa6EFCDKLJwwYMW2sUwOQAvfefIA5KNz6vp60nt+oSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWTF2z/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YuXX1ZBE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWTF2z/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YuXX1ZBE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628aPUd3047252
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ukcBbTjMthKe2GNqJ+5N6ofiA9OEHfabMRs+DdH7aw=; b=AWTF2z/IkMlVsj0I
	kaKuoJVOXInwToOv58Uv+dB9TxSgyw3vL94GBLBC2Mfp8LdEz+ZfA6X6dXVYYUUA
	NWCFR5c8S3t59chmihgNX3kdg1GI5qDH/+yE4mKuYfYrqS9zJuR65wH5zWxGVSfR
	j0s6ooJzh2mZZKdNufhWi3wlL0t/M8eqDzk8YpXFqj9CDM/Nd8PthpdX4bZThkUN
	LM8JIJCAxI0zimjPaER2vOc+bsg+NUs5tMyq8bQAl/KfHK2Ts4gH1tPJhua5sLkT
	64i1KEFm+BntBGuSsaxs1Jap0R7rplT/sTKF5JmYjDU+T2jDj18cl3bJopKhW1FW
	D8j//g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f58k3b0v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:22:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380cf335604so1754506a91.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782987761; x=1783592561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ukcBbTjMthKe2GNqJ+5N6ofiA9OEHfabMRs+DdH7aw=;
        b=YuXX1ZBEUsWVuZPbXegg5h8dgkp9aIbgZuiuETaeZWDUIHzO0DDP90FzhK4QlTy8K0
         0Kuzq9QUHoBph1HzS8X9SoOER2GsWwO8WDxaNa3Wg65frTl/6SV6HLg9HirJW7V0P9rL
         mEAQMpCFwXQtNr74dTvLxda1KZyjXc4ADHp6x9u1peWUXfnsLbwgT8L/5HMPOMaJAIeg
         whvwlGXT1OOAf5EpUSdfwe9et8W0eY9AJY1vpPvcknJkp8467QU52k5sdrNDVzchmQQ5
         xkcey7lWa8OqMchli5BFOenVwPValoP3jaqvWxdZB45MdfTE/Xs2mwm0/dllMWRfU+yZ
         0BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782987761; x=1783592561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ukcBbTjMthKe2GNqJ+5N6ofiA9OEHfabMRs+DdH7aw=;
        b=Z0qch0y3pd3tojcCzmVToGiLkz7tqEfnskM1VOTQjIiiHY7m5A6PEmvl7COnYD579V
         xhr0ArXntPAqGSUC7FZuvs/0CygtHTT+YpV426efV5/8EDzdF9gd9FKkT3zmRxNOtL45
         MEJs+djYHTWi8hewQfeoCLT1TLTPo+N0WtcmFZvuLC99hsq2AcUB0TDzB1aTiKrM0GwG
         7ejZO6FmJX2Kl8AjfP+8qPJhje1nmJWtSyQ9RORfRK1vlOm3xbhPipVePwMfk3z0dANd
         I0vudLfUIA1yI+t633VoBJoPxIEdTWQYUoaKZZ+GoctYP+dTqu9+0UPuVLojqDYxuDPA
         QSTA==
X-Forwarded-Encrypted: i=1; AHgh+RqWHo0jTh3g/rd8bwNXKUQgtSa3KFqdezAQVMY03j5gOT1FJQkXJU9w/Zuu8wZPjSs9+KvaTtNsGKLO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4yMaiEQ8LAP16a+SYDe0wuGqQ4fSCfUmUz3lsPFs3gwxFFFdT
	CnI37ZXyfCQy5t1mHp2no2bJU3rZW/fOyXiMJEHvVsFYY1iLebnvBbz86xR4TTIzicBqWPdS8iP
	npivXY4/xzth9tmhq6tC5slqOIxNZW/AUjcCXeAzDASoXMN79JaVObftY6pR6dkx5
X-Gm-Gg: AfdE7cnbEWrFAntiwRnphY4kHmPCbzG3hCdUbu0bYuplhNDez5QV2rIWxdAhG3Ajtdd
	EDB0XS0SvNLKrgilXSF8s4mBNdH+oPkBFyEfs1DqpuBe/pjGna5Ch2HiVTARjEf4yBb4ZGEkyZo
	/6e55G2sKVtXrxSc6X698w0lbcAMnTUQ/f+7NhZ2ij9pGXhs8RMSP+6t8WmKM90phBqLGj9G5oH
	b5hi7uDLZZUhFbl7NHiwdAYwV53Gmpv2ZM4zDJskzPhZGHJe5bfGi/qY1Wto/fCrJvkIfOc/bOS
	6b+Og7+Q50jYwLT7iuVFOORLWSLMosC+qBfb7phDT4IitiJk3KbcGk2v7qrV5HW9JDTuQ60tNHR
	AI1MHTb4Hj/6+Itvw3XHZjurvsn9QOtHFDxBSp+l0imc8
X-Received: by 2002:a17:90a:ec85:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-380ba868183mr4639874a91.10.1782987760679;
        Thu, 02 Jul 2026 03:22:40 -0700 (PDT)
X-Received: by 2002:a17:90a:ec85:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-380ba868183mr4639854a91.10.1782987760158;
        Thu, 02 Jul 2026 03:22:40 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e160b4c7sm862810a91.11.2026.07.02.03.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:22:39 -0700 (PDT)
Message-ID: <65e9d52b-d747-40b2-a6d0-424ed03c9469@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:52:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: i2c: Add Qualcomm I2C slave
 controller
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628-i2c-qcom-slave-v1-1-8b0a5c01f9f6@oss.qualcomm.com>
 <akIQFAX8LcZae29l@ninjato>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <akIQFAX8LcZae29l@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwNiBTYWx0ZWRfX/BqZSgEilbFT
 Lrb/rxOvWDqT75KBAxywYFGghYef4mLcULnwfzR63Cu5ARmhxti7tz+RHPBNBKhO/NcKXjJ1F+U
 FMF1BZhzY8PQHOScKwkEimUXzIDb/izIApmkvT70bp/AVr/pZQl7WVGex8Kap/R1Ddrx4urzloe
 zw4+q4vBS4K4/x90DNYz7NQAh8cocJLS5iHI8qm5qStNyoeBbxHVq2gp1s3T7S5xIVJTcUBMCZb
 s/9N0laZ56CZ/hACSqCvWdTOqAIMZVh2uu3r0pwszc5ikVjWtvK/8taotj16N7l6i/eX+GxKlYu
 J/HmHSPt6v4L3vVE9JnL73kGQnv/4Ve+RovdHFF7qOtKzlAT7TSMIMc29HxjdVB/M6UfUMO7oSh
 l1RExI2kpovbXcg1Re5M/qT/fyzt0E9F8FJ/XfjSqP+28OP8Allr03haw3RChPaQAzWeoqLLpI9
 /FyvruF9dbay3B9TViA==
X-Authority-Analysis: v=2.4 cv=SuGgLvO0 c=1 sm=1 tr=0 ts=6a463bf1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NyuSsmef85SJCTiwSksA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwNiBTYWx0ZWRfX8KoBb3bdKJDG
 stX37K0vJruBQQKEWd6519pZ5QsGjoB+MrLwbfjqWSofwewOR73IeHtDwkY+mgbihsZTiOzDW4C
 znAsDd1bTfP+tn8KV8R37K8L/IyAmag=
X-Proofpoint-ORIG-GUID: uJApIQxOGgcccviB-KoDGM-Cml2ADB59
X-Proofpoint-GUID: uJApIQxOGgcccviB-KoDGM-Cml2ADB59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020106



On 6/29/2026 11:56 AM, Wolfram Sang wrote:
> Hi,
> 
> On Sun, Jun 28, 2026 at 08:09:04PM +0530, Viken Dadhaniya wrote:
>> Add a binding for the Qualcomm I2C slave controller found on QDU1000. The
>> block operates only as an I2C slave and supports FIFO/PIO transfers, so it
>> needs a binding separate from Qualcomm I2C master controllers.
> 
> The official naming in I2C is now 'target' instead of 'slave'. Do you
> think you can rename that? I know the Linux I2C core has still the old
> wording in a lot of places and needs to be converted. However, if
> possible, it would be nice if not more of the old terms would be added
> which need to be converted at some point anyhow.
> 
Agree, let's change to target naming.
>> Document the MMIO region, interrupt, XO and AHB clocks, interconnect path,
>> and the 7-bit slave address needed to describe the controller in device
>> tree.
>>
>> Use the 'qcom,slave-addr' property for the slave address because 'reg'
>> describes the controller MMIO range, and this slave-only controller has no
>> child node where an I2C address can be encoded.
> 
> This should not be needed because the backend defines which address is
> going to be used? Can you share how you tested this?
> 
> Happy hacking,
> 
>     Wolfram
> 

