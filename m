Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEF837C0EB
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872047; cv=none; b=IkMfuhgvXuZy5htB8lgY+Kn3GjYv05QR+dY+Qn6c8L69HK1PMUpwWCIkYBvmFKcBx74t9bad3yxkTaspZdTtaxRHKK8y/+gWE9l9fyQFiL9WpVWV1Qui11Fyy8as5ejm8QSKECf5Gfntec6m1/E+6RoFs7ICKqbFSPRGdNQ32M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872047; c=relaxed/simple;
	bh=fWcd8x9WRUM4AyT61kXPm9zIVnVRJBvv2UiCOqbzvhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oS96W9Sst0beEwi5kCzQYREyQqB6KC1rwlCv/2xiw4/bzaGilSVbh3vfFbXz65knxwXFdtudipQ9lBRfHujsnmGi/gAi+kL6qEgKLay49cWc8/yh2XFgTHapxpJQcvutj1gR1erNiIaRPyKkV866uOoep0yXZc5WBHic8xHpBrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIJvPqJF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccNPBiet; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIJvPqJF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccNPBiet"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Q6am4033854
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJtzor6hok/hXCz+J7+lfRaLPvh76kZDiiQ4BelNFZA=; b=DIJvPqJFgI116vxc
	RwF4jnWvLaUmPOjFuJqAahDqbDbSqrgS6IK3sEJM3Tk5q5F0M3MXXOCPf7soNuDr
	ufo1mB16b9AsMc7UVli9xUiL0aMtwVRgDa9f/48QZ0BnlPXNFMLCaEprSQwcG2bX
	78C1vPZUSCsgsGYdzKCG6l1ZwZp3hHnxaVIAvLvFIFy1ycjpk+aJ8nNTSODzAFOq
	GuRspN+8RCr7GJOdzCmyiiOOYrTLhi6dZ67issct/VS+xLhBln4qH5nD3PDL4iuQ
	wZhK579TN+cKOtNSv/m7CINhZ+hf1zRdIzv6pqbDFjdtozRXlplmqQYAklxTuOrz
	sQnGuA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sb61n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:27:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915a4ca0a4aso52596885a.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781872044; x=1782476844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJtzor6hok/hXCz+J7+lfRaLPvh76kZDiiQ4BelNFZA=;
        b=ccNPBietZsIZGgSTKn+qNQMO1agLKT4Jz30VHHtXot5wzXxj805+NnAeKquXXYJbKZ
         IM49NW5STJxinz5K+MH7XMsXtgntvWGtk6aAYw/fsQdzwlztlUdOULcZv7GIQQNGkPtL
         Ml3VCsRewmTtKwe07WbtmyGKTAkBGKzJAWlxTaR1B84llcgUt9lmdNdwHF7Fj+OzDshB
         V9FBoTpWY7Vr4YexlSRr7vIHKE6DrIxXdBAtzHUsTYR+HP4zqvVSjwWd5DPIDdEr15+O
         /Anx5KFgWgcxMnE/c4H98RmhZu8ZwTu118Jor+IOr3l11/9TJrit4/O60LD2NSVAW3um
         7hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781872044; x=1782476844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJtzor6hok/hXCz+J7+lfRaLPvh76kZDiiQ4BelNFZA=;
        b=GRhYGonh1J4iJRCfIaPkca68Y7PInZoh9pe6tu3mF3RibhcQhEkeSA3tlLXpjOianL
         mHQs9zqZuiqqSZW0OZ49EotvvykwL2lqLkjnUa9p27Je9IvPzTUAY5CMkhWYeOZ6yQi+
         OFf7mQJRZG8ugZacz9yJ37v9mcfDDeK/+7QFwckZY21pvekQYkToo4c/qtlMDDfkRZ/t
         z1+2pctyXnsIeld+41U/FumJ6+al75aDY1oZ1+02saN6PdHD4/fTcowGC4BvtAIEpFmi
         YI+MbVSxkpHcMLJxfqusmvawvmlNhRhSFWOrnsv1cYiA3rEQ8MIoJxJ/hUQOwRl0zlKn
         sO1g==
X-Forwarded-Encrypted: i=1; AFNElJ8HxnQ784vlkK9Y90njn+n/eUQmE4yF1HHm7kATCMYPjOaMQevsKfzMwyGWt4jlHVLBcPJA7KVNOh/A@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7F9oR6NKjfmaoPX/Gs0C0MxSk9cI0tn6A/d1Y8kgT4d/qIqZl
	TAkOgTOZSHMYfbf02j65s6NubetDZI84QdxlsA8quMbQkwZ0aDNj6WzJJtklwLLvNqUCDN6xp0J
	FonhjvvE1r8mFWO/1aHn1cxyrxjIjIyOyejnneP5rCZyXRcag5gnnJv7AgElY06XN
X-Gm-Gg: AfdE7cm2dWmHaFIuP/TQFiZtM2yu/bCWgDdbix2xWYMDhRHXXsv4YZtHq0pm/dgQcqf
	WoI5eCbcyU+TlXBahpg4uam4d6ap3sgfhKUh4+6PuIBVSp6v5AUFtQ1Hdshq9f4dLZ8M4b57JCh
	8oWt5uPW6cLJ6KYIY2Lrro7+V3vh1irNJgAAw0jd+KbPZXNB5gCqZocRL96b7tQ2rXG61kLPEB4
	88AoXAi8wIyMIiOPfQaEYjK4ImvrreaxKdn1xuRNeg5jM/DR541YMmG+9lXGIvsrfb/638hUDvX
	WBuEshc/Y6dyAQ05QddPNrqydFSdGIWnn/cf25z6otZItWG+kGyKAcmkWdQz4VJ/4XgT6mdq5XA
	gcooXAx5+1wyf2bA/xzbtMWaMcsE4rWNsK1Q=
X-Received: by 2002:a05:620a:45aa:b0:915:79da:a898 with SMTP id af79cd13be357-9208ddc459amr314791485a.8.1781872043989;
        Fri, 19 Jun 2026 05:27:23 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:915:79da:a898 with SMTP id af79cd13be357-9208ddc459amr314789385a.8.1781872043521;
        Fri, 19 Jun 2026 05:27:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc75eb7sm848648a12.2.2026.06.19.05.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:27:22 -0700 (PDT)
Message-ID: <5621f70b-984e-4a65-add8-a9bf42e6c0c2@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:27:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4>
 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4>
 <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
 <178073918523.417326.15121723011916371966.b4-reply@b4>
 <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
 <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com>
 <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
 <12a8cc4f-3c45-471b-8a0c-f7473cefa190@oss.qualcomm.com>
 <926a0fe9224d73e0f5e3f58f3769c6247b1cabd4.camel@iscas.ac.cn>
 <7ac67f89-c6b4-4e0c-8eec-1e5c757777ce@oss.qualcomm.com>
 <ab5c5f53-4119-4bbe-88ac-e2933bf6f8d8@oss.qualcomm.com>
 <cd1910faf5b7b20d9154798b05449fe30cb1cba1.camel@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cd1910faf5b7b20d9154798b05449fe30cb1cba1.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2EtfEsTRMoifsQXDvD8tHY40OTDp3LnG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExNiBTYWx0ZWRfX4L65a6crDYoO
 GGGzZ1XkRmKJkE8eLvIY5ds9APCQud8GhcW8rgk8vYy4F+fQUAZielnAeKv22mhvszjaZhWikyX
 IBt/7SpTidNftvWYrxTEceHTZoUn1SqSnCO1L7aq30k4w1CBGKlyKCoMxIK7/0PiIY+FanIXRNg
 bjO/3orkmTAj3PNY10XfqltB2JWxkcX9dmBK455Ezqp8R8RGEXVyO+f0OOGDvuJ35FZT6Gg+3BP
 2LuHFh+yfwbTM4N7j8l02rmaI4Bro8uSlrab0d+tDuAoqWANtgjWy6zCCLy/ilr5HDcsU4R19h7
 lVfatw+ybbrY5nVwGFKmbvUG3gAwQmGHeguEbtrkI4+hXS1kZp28dFHPkwJ2aSutQYBD5oZVV3Q
 npW/w9c4HLZpFtMniqNIlJdmC5PyxwGYTbnVDQ2TgoPY7OVGvtqGxllJFEtg2wryDABoa/j9vA7
 T2/ucWNblpnzAtAZfOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExNiBTYWx0ZWRfX6mE52b/jYlw6
 IevONJ85ExvVnx3dryZ2YqgkUj1XeXe9dUbpk6pCujfd48f5bqp0aaJE28GtH6DwupW+DiaDhzg
 zsmxByyURCiUIF78if5N6ba38LER9wc=
X-Proofpoint-ORIG-GUID: 2EtfEsTRMoifsQXDvD8tHY40OTDp3LnG
X-Authority-Analysis: v=2.4 cv=KbzidwYD c=1 sm=1 tr=0 ts=6a3535ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=fGO4tVQLAAAA:8 a=yin6UPGNur1Ke3XWWOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190116

On 6/18/26 12:34 PM, Icenowy Zheng wrote:
> 在 2026-06-18四的 11:05 +0200，Konrad Dybcio写道：
>> On 6/18/26 11:04 AM, Konrad Dybcio wrote:
>>> On 6/9/26 5:54 PM, Icenowy Zheng wrote:
>>>> 在 2026-06-09二的 14:23 +0200，Konrad Dybcio写道：
>>>>> On 6/7/26 10:49 AM, Icenowy Zheng wrote:
>>>>>> 在 2026-06-06六的 21:51 +0800，Pengyu Luo写道：
>>>>>>> On Sat, Jun 6, 2026 at 9:21 PM Icenowy Zheng
>>>>>>> <zhengxingda@iscas.ac.cn> wrote:
>>>>>>>>
>>>>>>>> 在 2026-06-06六的 17:46 +0800，Pengyu Luo写道：
>>>>>>>>> On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
>>>>>>>>>> 在 2026-06-06六的 17:22 +0800，Pengyu Luo写道：
>>>>>>>>>>
>>>>>>>>>>> On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
>>>>>>>>>>>
>>>>>>>>>>> The magnetic keyboard (USB HID) can't be connected
>>>>>>>>>>> somehow,
>>>>>>>>>>> others
>>>>>>>>>>> are
>>>>>>>>>>> fine, such as the spi touchscreen (not upstream
>>>>>>>>>>> yet),
>>>>>>>>>>> which
>>>>>>>>>>> utilizes
>>>>>>>>>>> DMA definitely. My config is here
>>>>>>>>>>> https://pastebin.com/SdjuyJYk
>>>>>>>>>>
>>>>>>>>>> Is this a defconfig?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Yes.
>>>>>>>>>
>>>>>>>>>> BTW it seems that CONFIG_ASYNC_TX_DMA needs to be
>>>>>>>>>> selected
>>>>>>>>>> too
>>>>>>>>>> for
>>>>>>>>>> exhibiting the problem (because there should be
>>>>>>>>>> "public"
>>>>>>>>>> GPI
>>>>>>>>>> DMA
>>>>>>>>>> consumers to trigger the stuck/reset).
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Is this still necessary? I checked the fedora
>>>>>>>>> discussion and
>>>>>>>>> your
>>>>>>>>> GPI
>>>>>>>>> DMA fix. And GPI DMA is only for the QUP-supported
>>>>>>>>> peripherals as
>>>>>>>>> the
>>>>>>>>> binding mentioned,
>>>>>>>>> devicetree/bindings/dma/qcom,gpi.yaml
>>>>>>>>
>>>>>>>> The devicetree without this fix seems to be still
>>>>>>>> incorrect,
>>>>>>>> because
>>>>>>>> with the device tree fix even if the GPI DMA driver
>>>>>>>> misbehaves
>>>>>>>> the
>>>>>>>> system won't be stuck (although it will iterate all GPI
>>>>>>>> channels
>>>>>>>> and
>>>>>>>> then fail to function at all).
>>>>>>>>
>>>>>>>
>>>>>>> Back to the start. You said some GPI interfaces aren't
>>>>>>> available
>>>>>>> to
>>>>>>> HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did a
>>>>>>> quick
>>>>>>> test,
>>>>>>> and spi6 consumed it, no stuck or reset. Could you give me
>>>>>>> a
>>>>>>> unavailable channel?
>>>>>>
>>>>>> I think channel 0b10000 of gpi_dma2 could be an example?
>>>>>>
>>>>>> It seems that 4 channels are tried on gpi_dma2 before hang on
>>>>>> my
>>>>>> gaokun3, but as gaokun3 has no known serial access, it's
>>>>>> possible
>>>>>> that
>>>>>> 0b100000 or 0b1000 is problematic.
>>>>>>
>>>>>> (The reason gpi_dma2 is checked first is because it's the GPI
>>>>>> DMA
>>>>>> controller with the smallest address)
>>>>>>
>>>>>> BTW I just took the values from Windows DSDT, which is quite
>>>>>> conservative.
>>>>>
>>>>> So, with DMA_PRIVATE set, is this series made redundant?
>>>>
>>>> I assume technically the trustzone is still protecting some
>>>> channels,
>>>> although the system stuck issue is fixed.
>>>>
>>>> This series should still be relevant, although not so emergent.
>>>
>>> So now we're down to the case of the TZ reserving some of the GPI
>>> channels (presumably for locked down/TZ-driven QUPs) crashing the
>>> device on access, is that right?
>>
>> i.e. now, is requesting these channels through (wrongfully) enabling
>> the devices in DT the only remaining concern?
> 
> Yes, I think so; although I think few devices will use GPI on these
> devices (usually only one or two SPI controllers according to the
> DSDTs).

IIRC there's a configuration table that lets OEMs decide which ones
should fall under the secure umbrella (although most never seem to
change the defaults).

I don't think we need to care too much about the mask being ultra-correct,
since as we've established only QUPs are "valid" consumers and we're not
going to enable them globally by default, since there are conflicting pin
assignments (i.e. there are many more QUPs than allocated GPIOs)

Konrad
