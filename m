Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7482C3B637E
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 19:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181260; cv=none; b=msF/lSswBp6M6e9zuBrwpGLCCuPzgeqLIIWfPLGU+VhWFYOL6DUOvelPGWAkhizuWFxveMWQ9KYx9zCRV4xhQUWcVU7DgKBao4P1l/dYS0372JuTEPQCpi8LmaAxuxSkgUxvuBmD/J5hNWPuy2oQJosRxbako2wOystzDApHeV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181260; c=relaxed/simple;
	bh=bn6KIAftZFAgu0Fj8bdAqw+sb5cS+6rxHQsH6/lo5tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZ8SnypPn98eYUVlTxy5TOoXtYj2Fh8+YZKPxVJK6eF9NEJOA2GR4b3tb/W80yzG6+Ef7bvwYY8ieqi01OKYwrjp81djC5kpbnk3DlF4AQmnGlXY2uTrChS5/LugA69nHMEdDFQcg56Q5hgxmvMKFiGyTa8SucYXc+Gj56OV8jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YG/o8Lz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AbMQD8pi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YG/o8Lz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AbMQD8pi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647IIu0C1417765
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 19:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	krw9NYPIRjOwvAqsLEaC0tplCBFZCd1N8FeCy+nD22g=; b=YG/o8Lz6gC0410iD
	dtKh56KHWDhifpwwqMiE099T24CGq0lRxrjtkI5k+NLsUoRnmQiIVbzIv1/uYrlH
	XFYTnKSfKMRjh7sMwlyHRCTz3sp3bXAaQSTeykGPMwRPmkAUm9Du+EXmaMcvmf+C
	mDdeLpXm7ojmb+iN4qk26fxLCpuGypRpFAY4ved3m9MlnJkm0nZIUWxnaDHscS6m
	f5ld2/vQlbo9L0k19hK/xeoL5J3io7t7ELAE0yfZKD5cHsqHKszo3jtRv70IdDYQ
	nykRjbmGJc5f/dWZCHOjFWl39eRCzbCgXo4V+pBT/b5m4Ofz1jwXQAsDHWxJm6yx
	Nd69jw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0ywhg69u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 19:14:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3662668b825so1369261a91.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778181245; x=1778786045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=krw9NYPIRjOwvAqsLEaC0tplCBFZCd1N8FeCy+nD22g=;
        b=AbMQD8pik6FhGN8KRrkJl3R4WV3AIwjv6SSpEmWAr93Io6O2pL3CzybnFBEmpgsq6e
         SZO1tkEhiSzxxSljlYj3PfxTsJQ+Or9XNTyvG6dvXi9n/4Z8AX5T27qkt36VTmO3b/it
         oOxytIOGOLaWsunLHc4OpZ6uP0vOklMSH4CwCVygqaO+wpfALHN0OOnliYR7wMBmp2vh
         6EQOv5OIkwaAx3XIgTlqgURV+nfBpf18nEz43PqBbMD06MAW8aet2bElT9m/eii0UXxf
         D+r5c62GUmPa+QA39XRF8bnvygFuISzBbUvL1xXB8L0r0f2oq4ZYny+uXt9HLzH+vpw1
         r47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778181245; x=1778786045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krw9NYPIRjOwvAqsLEaC0tplCBFZCd1N8FeCy+nD22g=;
        b=A6Eu2LNS7nqZzgoYkrAfxIfbml/8VKEVbdju6FCrXHTREBpVIOhLoFTKBQ3ANEiSuV
         cPhQHAfmz1+esJdijX3bXwGktJblPShoP11BxzTcVh0N6YST8OrG0lEMJQmt67IrM0gO
         lQZoc/qIi35vpt7RNs1uBqrYYk4/O3u4xw2/vEeGbLsFz8JxCF3uLDCdLxm5cdkFA344
         2XbtkABNVxzGMEYgZnmsYsJ7Mt1JDOXTLSrJLJRb52CrWrQ4DqsmiSreYCD4wara+q3E
         XkiaZKOfkJM8ZqfNuxR7TraLEEouwMtZtEWnQaQ+yjbtBZMFR82wYC7qOZ6zCraKB0+F
         DwXA==
X-Forwarded-Encrypted: i=1; AFNElJ/7+o42JmoPmn8U26bML1RsqKcD8LbNhLRkqqdxXg2msj45rIf7UqasGde8hClguhLZdARksFy8pkdM@vger.kernel.org
X-Gm-Message-State: AOJu0YyiLVVzhyNNMw5LY9PQlobdzreHt505xJ3w1ezPLyyC+7x/rv6F
	dAB31jnJ2OZutd8zSXpQcj35nU51ghwkbnPH+ABvcJuU3UINRfb33qC3UmjDV4asg3sHjIjhV5T
	pxG8TzKocBf6f7pa+NNt/8HhSvGwMVuCaOX2NnNZIei03vuMqFpflHgnHlydxs/TG
X-Gm-Gg: Acq92OGg+8GKOBJqZI6HRKJqGZyBB5ZfDhHiUdlf6Us7NyWzChl53QTfXcO1PUXzYFz
	WZYbu2qDvVnmzsgURk8hMQoO7xXaCMXzsB8DBEzT6TZfBql97GT8bKRrFHljOARLi9UQR0llGwO
	uZIV0eJ1Cx4dU0z2Gx5UjwDbfTgcZapY5fQPsWjeA+Gkqm9GpLPp1ezLaSWSFo51Cb1QYHwYLiX
	ULth2AoO2bRbXRrP8a9pZx/nzVQlO04Dlek2clzSABfVs1SF9T4xHWWjQeWCnu9iDRv5RHHVAxD
	AR3tgkm++P5tFphy+Su6eILvMLFjzMEiPT+QbVC2bEVXzhNV6XMZQVc9tUC+PejTKj8g3LwE38E
	OUoCf/8TvV/sTtAeHGkLwaUJOdb2DJ/sTF5yZNUZdZNTiGV5RnMo=
X-Received: by 2002:a17:90a:1c88:b0:365:d9e2:7511 with SMTP id 98e67ed59e1d1-365d9e27b9emr4444011a91.25.1778181244734;
        Thu, 07 May 2026 12:14:04 -0700 (PDT)
X-Received: by 2002:a17:90a:1c88:b0:365:d9e2:7511 with SMTP id 98e67ed59e1d1-365d9e27b9emr4443990a91.25.1778181244281;
        Thu, 07 May 2026 12:14:04 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.202.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-366478ddb86sm170288a91.14.2026.05.07.12.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 12:14:03 -0700 (PDT)
Message-ID: <4c6ad0ff-5b1f-4beb-8896-da325961f8e5@oss.qualcomm.com>
Date: Fri, 8 May 2026 00:43:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com>
 <20260504-shikra-pinctrl-v2-2-14e9dcc2d685@oss.qualcomm.com>
 <20260505-groovy-loyal-bee-0cf72a@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260505-groovy-loyal-bee-0cf72a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bMAm5v+Z c=1 sm=1 tr=0 ts=69fce47d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=GlSZ2Rd4KtbczYCFEJIQVA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=4uznfLdumDQ2-nrduUMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: nvCkeJkhHh-KKBCJFo0w12UrnUYQ45WN
X-Proofpoint-ORIG-GUID: nvCkeJkhHh-KKBCJFo0w12UrnUYQ45WN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE5MyBTYWx0ZWRfX4zouIqDGC7Vc
 9uGPmsNh5djYwt7zpnwM7P/YgFcoQ0yHFIPsfQkFQF2I9yjO+DL5bfxqzfMGy/nH1Othr35mNmf
 k9USxiB1vPEutqcwUFPpnp9QyC/+yrJ5lBuPHnDNARRTXKnsdKikr+t1LFrZXBzsitBuEeMrfET
 VCblIvJhXlvlWwF/zYHTceTx4smISNKED9c21u0eBY8RdA3UF6sNP0RFQoCBK2R3w8GlqIsyfr9
 PzZHfOGfQS2PF9U4TdSFtUkWTVsjgMffx4TggWr9S54KrZ7qQ6sZjgPCxdjGGsbWeKUiICFwL5x
 55ngla5eB1PV3m5i5UiP6Rh5BAIpCgbMcoxp8/mLhszrM3iC5VAxECg4t+AjYiq/RjzLJNHmA8o
 RsWVRlkI0ZQg8/JSNNmHciDH6rIcaskNscT71HI3qXA2JDsls6DqYuDSmzUzcb3M0UkwnNZ3r86
 BVFEhQpqV0RMFs2H3Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070193


On 5/5/2026 2:54 PM, Krzysztof Kozlowski wrote:
> On Mon, May 04, 2026 at 04:18:43PM +0530, Komal Bajaj wrote:
>> +static void __exit shikra_tlmm_exit(void)
>> +{
>> +	platform_driver_unregister(&shikra_tlmm_driver);
>> +}
>> +module_exit(shikra_tlmm_exit);
>> +
>> +MODULE_DESCRIPTION("QTI Shikra TLMM driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_DEVICE_TABLE(of, shikra_tlmm_of_match);
> This is NEVER placed separately from the table.

Thanks for the suggestion. Will update it in next version.

Komal

>
>> -- 
>> 2.34.1
>>

