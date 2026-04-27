Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3976386C31
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291689; cv=none; b=DW4qtVhiAS9wOMi1oxJE1ayjWluqfKOVYv5RhZopyRwiceHj6COJkNjsnqiOQqe0oN4ma12O+OMuRCQgd+368BAb1W6BJNSncQgzr6ySe2Yi9DqRKhlv0gJlJmP2Kb9KqglvQnfJDdMnODcoUAUzlEGnGo3v/vyIq7LyFQ7NZmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291689; c=relaxed/simple;
	bh=fm5CdSFWH2gts1XSzN9LOLLdkXFIsyZlJCPnuFWd7ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kugC3LDuBaHuW+Aof1cCMfJ7vEOP6s+NJ0WT51UOikS+hprTHQGQunS8K1Ro6vyyCTbmyzA00qoUFlq4IVygAu3vaBpA6TgvI0EUL5LejVOoSLvOawI9Y2+AyVTEE4JkE32A1kgy6JrNdTYGCAA7blf+IDtzJhsXk/4XFszv84o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoYa1Raq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLg9lzBc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoYa1Raq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLg9lzBc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T9e71762094
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHua6HX1regkBEurtpMi1d4OCWJUsb8/4s2U7NhCHbc=; b=OoYa1RaqoGylt4Bn
	ceR5jorAivst5Xx2Tjx8kG1aOeu80mZtbiVBzqmXgGPxTqZEwQ4gWwzmW5njCcQ7
	6Pse8JrCnvforMTNVD7MI6itpJSz8NoXoGLKj+qnpetB0YZi5aIT8+vlZ/OqQO5d
	c42+ZfhLLnmjAEQrlj7pcgMvX6NcYMaz2oQgn1zyZdwEk+VNANqJiY3aitoihOeq
	p0i2AKOjHdl8MZU7kgZQyWa2XeH1SN1muoDAqVgU4yp1Lhmcvws0LB6KHeV9kVvQ
	kCb2hFyPXoDQbQisTO+ZDs5TMZa/m3BMuzsl5LScCxAWGN9FOcBlQ7/eejrEzfbr
	tspsXQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9dy98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:08:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f71af9dddso689560e0c.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777291687; x=1777896487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VHua6HX1regkBEurtpMi1d4OCWJUsb8/4s2U7NhCHbc=;
        b=hLg9lzBcoeqpMzYcDrstdqx9M80SbkZk9LhOM8Kx/Li3IEud+EwhrkDi8aQTS5M+a8
         Mm209JTBcg+tCyanHxok9+AUFC1vOxbh56+x8iZO54M7XpLrAu/vI2+SEepGIUF2GtuV
         rSyKjgrwzKglm2YtKUsBtGwVuQKVaQiq4hadcLERC2RbiaRM8cR/k4YRKt/hQgfXoEcU
         0NYByUHZvsO+elOujj/FlM25e+5kFh/YuyBF2qxALzSIbVFoub+PLrFvr5fQVLwpwsI+
         XNKFXfTgDW4ie80LpbY+RjztJc1PS4pS6Xn6gB/vuomnhb+L0OwAp2FI9yCNJfCICaj/
         rlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777291687; x=1777896487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHua6HX1regkBEurtpMi1d4OCWJUsb8/4s2U7NhCHbc=;
        b=C1ezRBhiYTLmkRUOQ707sy0UeY040o7+f1rmSDSD/pFCHPBN4GnAjvqdtojOHH6nTx
         +9eIepRM/OVhJOKWKur80+RgWET0A5/RItFxCD2JtC2TGu60kRt+K4GoodX3701OPGYT
         bIxNb0O5f90hBoXgJMd/ycPbvesOdbkiWPxHHXfkPtaF5vjk4IDCKQc9ETBO+Qc8gcb1
         hut5+AkBPkpyWht3Q5Ewxr/kP5xnM92hAp8hY5gmAWHT4tigrs/9ALbVow/7mCmfbcZP
         U3XL34+0IdWAb6ks+RiqyDuVvjGo4n8TOMfkzlkiAf/yj9ktp0Mu4bqLu6Cg76bMoZzM
         C7gQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JtTiROhW1vg/xNezBHblhravwiSX4zcyzfrvsBVwyPzhj/3EPf6tvFkmS+AbaErVBS0VpI8DXy6rJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxAcu5bSZDSD+6T9Vj5mCioU61dzG4hmn5YVpXLqYcKm7eSmwVS
	XGQQlUDZhLqoEv5pWydcAUg99vQod+SdYQsz9W365SnY82sjJ1RN3ZYqjirTfm9WMNqQd2Vqybh
	LiCxQiggoc5MGpUE4g4ZKLwTmnOZ463Yj1vS4GQtxaCfu6DCjHy7TGkJbtzwRIxqS
X-Gm-Gg: AeBDiesFAoVFTLRh4y10EIeQ10YGE0OWqpQTyi32FwS6lsNtV85wfVaA0tGbF6n6TD0
	wBe8anKQQ0YmdxED480kx0H0qh9i6wEwHdVWCS9cJVIYVen5cxqqGRqPu0OoQA7whE+NqglLb0I
	Ha+HM51A/2kP9dKTRb2otSHFSrxRf/gMT0Oqlcz5jOYGi7n2QUaS+Sywhhsg0WPTcjjyr0b+1/M
	bfwC9nvlEc+S7Rkbac5kW+pI2Zfki+TWouQBAUFnBvuSOV6Af4/M37iv8CZz1payUpIMYEokSEm
	e4npa5ZJdnpI+gNuTf2aVr3u7o3fVfTlTmU9kWJtP4M8yi5AaZQvRtcyUprGfz6qVR+qvsJ21M1
	Hz1vUM1ClLdXyG8ZVf85wuT3vNdYZicxAJSyNj5vctrAgEKesPoF/i9Xde8rcXOnNiV0nA11zmo
	oNLSuUJ0O6IUlWFg==
X-Received: by 2002:a05:6122:ca7:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-56fa59b864dmr8922084e0c.2.1777291686848;
        Mon, 27 Apr 2026 05:08:06 -0700 (PDT)
X-Received: by 2002:a05:6122:ca7:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-56fa59b864dmr8922062e0c.2.1777291686396;
        Mon, 27 Apr 2026 05:08:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480d735sm6859937a12.7.2026.04.27.05.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:08:05 -0700 (PDT)
Message-ID: <f0e5e2b5-d050-41d0-9798-c62a9e59ba14@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:08:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
 <337d362d-93de-4e81-8141-a51fa75d615c@oss.qualcomm.com>
 <6b936613-4859-4f73-8593-92180aed16e7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b936613-4859-4f73-8593-92180aed16e7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hULpRP30CGAU26GUxXm5blP7FVdqzMgb
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef51a8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Gv3PURsRAAAA:20 a=OuZLqq7tAAAA:8 a=8E5acIoqQbxLt5TPCTEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyOSBTYWx0ZWRfX4+29Gdpmn1ut
 2n6J0g3hOw+agBWsRAX6XrIbX3ByDwZlDf8AHRuqJyySrYBc6UxGoVJ5RBL6WEYx9tmd4qO5VQ7
 itwO8JzIqxI0cpdRPWvE93gWGEhWz4nRHVQ/R56AibCVQvJ36YgJeyiq5RzJqCrozjWlPy10J6o
 y+zESEdsDrJvxlJtnMGauGJReH1afwOWZG1b8EG2IFQlJbaP0n4RSDnIjJjQy3wldTgxKJGgpbO
 mEd3ifL928ycnFEXz2YKoV+Jc0RGi7CMeRvS7kDYoyfFN+DLgADYPYUGz/xzC6HpwAmr7a41Z+0
 eyIzyEcP1Vja+D8Exlc3azMhF/bSl1eZ0thTBJjUtqjXVGxc92l5g7ahx+b81fGhnbu1VohADtF
 QCVH5oGoyuP80OvvutXZaHa/2WCS5Gpi3QdPIYJtFF6+CXSxTyjyRUxYruXb9TsSg8UScgdP2Ih
 1bTreUGE9xRmTRIg66A==
X-Proofpoint-ORIG-GUID: hULpRP30CGAU26GUxXm5blP7FVdqzMgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270129

On 4/27/26 2:00 PM, Nickolay Goppen wrote:
> 
> 27.04.2026 14:49, Konrad Dybcio пишет:
>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>> Downstream [1] this region is marked as shared, reusable and dynamic so
>>> describe it that way.
>>>
>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> index 4b47efdb57b2..36b419dea153 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>>>               no-map;
>>>           };
>>>   -        adsp_mem: adsp-region@f6000000 {
>>> -            reg = <0x0 0xf6000000 0x0 0x800000>;
>>> -            no-map;
>>> +        adsp_mem: adsp-region {
>>> +            compatible = "shared-dma-pool";
>>> +            alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>> Please make this = <0x0 0x80000000 0x0 0x80000000>; instead, since the RAM
> Maybe you meant <0x0 0x80000000 0x0 0x8fffffff>?

No, <0x0 0x80000000 0x0 0x80000000> means "start at 2 GiB, until the end of
the 32-bit address range"

Konrad
