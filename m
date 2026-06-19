Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067FD3C10AA
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884535; cv=none; b=rLAAHYQTr3qzIrvFCAxOz8Xf1I0QhYSmCutiAOMHKww3m3q5ELK1rIxiESiAFGzPyfo97KYKrN8nDY7qA+IIUSIWPVFqeb/poBY/MUgYOCTRivGEB998e0JnlrPeV7Jx0XOuDccOOY6MOXvgvYnOkMddxw5aZf8efAElSJaLJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884535; c=relaxed/simple;
	bh=pMJmYZOBYDwHbV4Ahh/bicD3csdehJvP1uBJ0kfk6D0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiYDNMXFh63Vv5fRaxUOUb6g8kCtbzXud+34Y1iVA5Wz5KG36yHINwXeAVjxAT9nlEACvRrkSli4Eu+8Hs3hRwaKR/N4CCDChDT1AgLGWCJCr5QTmeAf51wNuKnwkbb2D/LaRfcoZdkKOi3GHayBE/Nq/tn9cLrgoqX5iAHw6PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGoaJRl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jos20ydg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGoaJRl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jos20ydg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9WwB259720
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1g1S23ckjhJexyxYQNd3mkt0SDMM3VWiwpZ+c8Q7f8=; b=BGoaJRl7RwvGxuvH
	g5rZG45SDJGCrlRiUQ7UaQ0qhijQMwv9lEvEfRpXfZveOfpI17olI4seCqkfQB5H
	0kPlr+FPr6ah+shD6I/snb/2i5652pQeZ1vhnyXbCtrjAImoeu/CpTSBySuWtvPs
	JdIFx1eoVuR0BfRiOmtKAnpO/XQzL7wg182Hb/i7AObm1sVvnnYIkgIi4VafhKex
	Y9PXCgxAVt14vy4pC9IhuHzCulgY9a+xfRgoS4zTh3TWWs+RLV+46m0pweZNlHtN
	PBl7dwlnr/hvo8nl8dwBIL1naFps85k52DnufUB77J2N/wyfQXU1Z+6cUYrgbgr6
	IsM3pQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp673tk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:55:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177b12d7bbso3085261cf.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781884526; x=1782489326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1g1S23ckjhJexyxYQNd3mkt0SDMM3VWiwpZ+c8Q7f8=;
        b=jos20ydgJCKqq9wHwWn4Os1nfQkx2+bzYE1mtpyVBktkCnemGm+ypt6V9BSs9qstp7
         pHks9fBC5Uc/LPeyBEFTGYdGOZdrMWifjhp9zWpjmIXJ1jnxNzipS6qPb3fl1vHG0VjL
         MxlUsOgyq6Vxm8TceANUrZRR94aJ8kc3dOi0uJWQ5rl5b3blLdHQBv4T4upC75af176I
         MUCgjjdgpUdFiVeXWvBbofY2TH5AMSrpQR2NPI+MGC2FeepmQ3zdm8cloZ8N5Ft+BENC
         HpDuFfzeb3frtdbD/Ii32gv0/Nq8Zs7o1972JQbvG1mR14k+dWFZY7EpBk71sKbsu18N
         MQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781884526; x=1782489326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1g1S23ckjhJexyxYQNd3mkt0SDMM3VWiwpZ+c8Q7f8=;
        b=pJFrxy2w6ZWkSSpDx8NXvxhyGDgxih0HLaVjzagVPun1pVKe5mWWe64ABAsmswkyK5
         IQwjeTww17ywteC9NUTKH8b3s/Um59GqXBXENm1mZ0NPdDysGXdTLQeYwRYu2485WXPX
         BpBHDK22nPhKDb2Hdsj+AjBPP6bgboA/Hv0rskXnnAMD2yHr3hDIfB/f3ZJWWw6Bry8R
         FtlcWBNghqp0Jc1jpcI+h3uonSmXPxerOcUlv9oObRmeqVTPpdJLes+pXLlw8kJ7nJlB
         XVYL+vUThjqhM7xJlmDbtJO1QqQcZXJXSt7K9lYiAmmPnWbT3FXi5oapidRFTyXbKEel
         gPvw==
X-Forwarded-Encrypted: i=1; AFNElJ/vd13QeEXGI/RVbppBCIjr3nLKwYr8WJPIxf9/XYfP/SharxB1lyOij6tu859FmpYu203zDwa66jmY@vger.kernel.org
X-Gm-Message-State: AOJu0YytsMl7ITHqx+vT5xs4aD/tz6GpV48Q2ppaF13e+pBq/RtPInKM
	jh4ywYzuyUEd8Zl8PzvyKOtY7k6BYQ1mp1SjbXQT7ktKkkVmS1CrpXBqziDdePS1w35pkf3RNdm
	7mB7j2XWN7TEY5bPkmk8eIYSb5rS6XxXy9X72D84hnqszYyhtku3ln4Y/NN/vHarj
X-Gm-Gg: AfdE7ckBZtCLYJr6uq5skynybUZ32Gglj1XCIZboheI4sG09VB4qH+XLjS6StP5tHEd
	kqwCS82SE3i5DAYGhojoRxSuKoCr9+48a51k/FzTdkV29ICVl2udABcRoTkA3IS7FQy4W1ckMx3
	GrMPCX9XkhcH4j1rM/XVu6xZazD3m9l0IyzszoAkBvaSJGUh+kPNUGkhrV58p+fB5GJ6bYWRu4r
	OgvEvHF+jPz226N6dax3b8i+bn+X2mz1N5d5uuJvHreQ7bLgrRl/Eu9409zYu4o/fGsWZePp8Gb
	KrBjmD7HPVOnvaVIscS+dMcAVMHmP2MmTTH+Bk//1CWRUlJno6i9KjBAR9GUS4ht9b8gwNT/mdA
	O95kBHpylfwKStEn9Us0BpD3BgQXLvUCUCxM=
X-Received: by 2002:ac8:5944:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-519e491df29mr34811761cf.2.1781884525951;
        Fri, 19 Jun 2026 08:55:25 -0700 (PDT)
X-Received: by 2002:ac8:5944:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-519e491df29mr34811281cf.2.1781884525338;
        Fri, 19 Jun 2026 08:55:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69711f5ecdcsm980224a12.31.2026.06.19.08.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:55:24 -0700 (PDT)
Message-ID: <3ca4718b-ee62-4c55-b593-4d6ba543d5b0@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:55:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: gaokun3: describe rear
 camera module information as musch as possible
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Martin Kepplinger-Novakovic <martink@posteo.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-5-mitltlatltl@gmail.com>
 <db441eb6-195e-4018-a84d-77b2d1531243@linaro.org>
 <CAH2e8h4TYEMhjP9Vx7yYpKHAOR627Ovy2QZMT574oZPVDJX1oA@mail.gmail.com>
 <9da6d544-97f6-4915-8d53-e3fde7339695@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9da6d544-97f6-4915-8d53-e3fde7339695@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qyGnn3QAugJNGx8EUvf_fK0I_-uaOIlc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE1MSBTYWx0ZWRfXwiV7mMC4tKSh
 YOLi9ZOV/S5VIWBCKEwyrXdN6nPFV/UgwL27vN7RV5MJoRoX0CiyOaWXWb+IsjNbeA4k2kFcUSZ
 UXr2FnRHrjrORJIwIefln8p/yDifJj5FSziK65+B/XJbi94nYGkcFvX+/kLIlnt2qTQvDeixreU
 yyLVMvnMS4143wY7UmxoSKsLgEsnp9HRL7+ucIXiti1YC66SAZdPefN+XPkvDhIy8i3O5MnZpWe
 E0dR/awD6J5mTwHyyffg0Vk35uwq+cXdt88EqsxRblG8EsK4994jAsAxkM0SJYXL0GGdz7FkGIr
 fDCYvz8torStprXgMjf/sDJ2T4L+Y9JSkocqMPwR7r9m6TAgxmgmLd8rUBiFy88M5r48hc0EQG8
 PKwBRBBlklF8zy1PBx+ahwREpDpq/JF9jbP/UkUYW5/ABr0NGxSUxoIokO1K7djMc4i+NLIDdFv
 dC/uMm6KFBOA+7BwQGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE1MSBTYWx0ZWRfX9wwa9ZmKyyij
 BFMgy8t5cZecCny/EiMkNo2oJ0+062I3mFWbBluj4+jX8tcwLHCu8AbOEP5yhHHqcv25n66SDi3
 7EQB25rdKDQ8PJ6vRAsTwwrooVcBQ+Y=
X-Proofpoint-GUID: qyGnn3QAugJNGx8EUvf_fK0I_-uaOIlc
X-Authority-Analysis: v=2.4 cv=TdOmcxQh c=1 sm=1 tr=0 ts=6a35666e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=4zvQkOs8SCLzoOI4eBsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190151

On 5/5/26 8:55 PM, Vladimir Zapolskiy wrote:
> On 5/2/26 15:55, Pengyu Luo wrote:
>> On Thu, Apr 30, 2026 at 7:00 PM Vladimir Zapolskiy
>> <vladimir.zapolskiy@linaro.org> wrote:
>>>
>>> On 4/25/26 13:53, Pengyu Luo wrote:
>>>> The rear sensor is S5K3L6, describing it but dropping compatible
>>>> string, since there is no upstream driver. A funcitonal downstream
>>>> driver is in comment.
>>>>
>>>> The VCM is dw9714, describe it.
>>>>
>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>> ---
>>>> Please take this patch as a RFC, I am not sure, how much I am allowed
>>>> to add without a sensor driver.
>>>> ---
>>>>    .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 129 +++++++++++++++++-
>>>>    1 file changed, 123 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>>> index 39e559e91289..76b1ecb3819d 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>>> @@ -22,12 +22,18 @@
>>>>    #include "sc8280xp.dtsi"
>>>>    #include "sc8280xp-pmics.dtsi"
>>>>
>>>> +/* remove due to gpio pins collision, skip 2nd instance won't break things */
>>>> +/delete-node/ &cci1_i2c1;
>>>> +/delete-node/ &cci1_i2c1_default;
>>>> +/delete-node/ &cci1_i2c1_sleep;
>>>
>>> Instead of removal 'cci1_default' and 'cci1_sleep' nodes shall be rewritten
>>> by excluding 'cci1_i2c1_default' and 'cci1_i2c1_sleep' from them.
>>>
>>
>> Should we register an unused node?
>>
> 
> I believe unused nodes are found everywhere marked by status = "disabled"
> or if they do not produce a conflict for resources. I understand that a CCI
> IP with two ports are special, but likely (not always though) it should be
> acceptable to keep its device tree node as is.

I wanted the pins to move to the sub-buses as well, but that doesn't seem
trivial - we would either have to alter some obscure core code, or manage
the pinctrl states manually from within the CCI driver

(contributions welcome)

Konrad
