Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091E6258CE7
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602585; cv=none; b=b1CCURYjWdtzp+qwQOlUgXA7FSXQ8q/4cJLzAXqHGKQ/E0O+ip0CSPI3FnoX980dR25yON64yxNu1PEROtW/R0KMuLCN5rb3RJjPy6lsQgnP3VLUhG9ZMPm+4NffCHpNY52nS9paAJnCLdfL17bOWDEHi1qvIVs0q32qLbXq7VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602585; c=relaxed/simple;
	bh=0t1CQ6bCfFYXWlV5Sj4eNwxVqvgS2k9+lVlmjhzpyiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TV8i2aoGnvR2oQlXG2Y+8PWb+7ueqxHY2mHoAmDePsVpbU25XeEte2cEncr8xbBZDt5CabZJJzxOFl/8H2YmJEpyMR4Ulfi7hPdMQs4eAL/iFzlrVj6jmfPiOQ6raGmNPG1aWprU1OwDas7PUtQSt5mZeUJ3U59ALOhQ2ApYy/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+5KOZhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7NaLcca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+5KOZhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7NaLcca"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNQqh1575682
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WvX4MwB9EPKjTXBQ5bIbcRPrVXVpb2oyMm+1OJuX6k=; b=L+5KOZhAmLfHGJRj
	3oVNomPbfs42uFUpIRmyIpAi+klYxKTrWsSh+B/pQxc3vMrB0SBW0M0VVKMq6DdA
	fsn8wOifCe7uHPy/8yNo5TcFEtsBkrrS2niNAC/QlW2aUlgEVhIMG+YOaQxEjwPL
	fhHHfUFqCLQqTB1Br7Jrx6fS0iXAbBdr2V1hQnnqiSslRc14MltfmByc8X45jeaM
	rgQBEnr4oLGrKesJio8ddeirT0kosG/0OHgirqN4g6GjURpmicfqMIETWGaWeuro
	bCxzLdGs2MozE82/JnlJQyf9H2FaEHXFYkqxSD/dwhauS1LJttWxrfKM9CLOu6EM
	3ehgVQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcb7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:09:42 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9692c7b2054so30831241.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602582; x=1784207382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WvX4MwB9EPKjTXBQ5bIbcRPrVXVpb2oyMm+1OJuX6k=;
        b=J7NaLcca2CFm4D+8IvnjpwLE8oR9rOlU9D/gqxyk9Viwx86QkEIS3oDBwJHrZTwBI1
         zCZz4FgqqPIYf3mG2VeLRxQTpvH1qYkDDeL2qKsqd2wPTaF4aPmRt//UF3CoqR+ZVyvl
         0S+3VBMUNdWGH5fJgnNs+qzMjSGC981wKc1LU0fyWmKXGGWkvTRY7njVm0sy0+CZloil
         gE53B+0wE1hB87K52PUKcwqF23KNL8y/waFtRwKWFVraS/dA0pkht45nOFRLAV815HjX
         SrMZDVDm/dyDmbjsQojHcEVqVl50JcibLkbj6NWXpXcavpQ7mZYVgv1QKmj6Ekhlny2f
         TbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602582; x=1784207382;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WvX4MwB9EPKjTXBQ5bIbcRPrVXVpb2oyMm+1OJuX6k=;
        b=e/8w4wIHDlSTaZDXHqJtHBIQnRw4C8FfuQe0Ys4FPpoRNpm5r8RRD6fl6IyffYFmW1
         J5dSNxWWaJJOWuc5buGw3bBNWzec47CDmy+hJq50HDI1G2AFNW5GKucNk25RSk5Um8wb
         Qk33S7gvy7HGedEHpVoKbgpz/exPA07FkL5+u9vlGGxt/05UaoLPrOMNuk69KSJ2dCaN
         Qh7VmYK/c9ZyEvFs6m8k3copjgDaMI0CV5ioCI4Ch0jCd/P7DX8djnwQ1wJUz9hqDhoN
         x2U2LEZ6FyPeqZ+eOWZQq57dO347Va9mu2yJVTWqcQPnCs/Fi1BMyIEZ9d560f4svQ7V
         QOZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpYHk9Qoij2e7Dtq/5LVDfaOx2TH2NPs5zG+1n8HSeeIwdkPCXHD+YAv6MK8SSe7kJ05zQqfOHBDT8@vger.kernel.org
X-Gm-Message-State: AOJu0YzWLJt2Nw6Na3UtPkvl+YGmLvx+XqYT1usHxU7WyZbcHtyqnpU4
	1LF+8ihv3fb0mJtlpUNKPq0CvNY5Md24pxMLn4uifScWENZpAR6RaSZ/hk1B5xe2SqmCfmiwIHd
	CHqsA59ZyxWsGXwlfdmL3cDivceMJ0g8BfMEp+EBa1iR5HSXGpmRbMJ1sOjHX0fhyVuK6KbT9
X-Gm-Gg: AfdE7cneCK3JWvg/X1gWzSd6lvPl/rIqgMyGlSDWcmeAFLc5Be9eaRnEKzm0xHUe1g9
	l7Zs1OrjmY/crFM7qzPXSZ3kUO53+SH7icGrOhns+PeBoEFwQW5/IwDrEJjV4KRsPSGlAsikP/0
	JZvo9etUpEtJVnRaUmlRy5rouwAXpuBE177kQ2GYiCZm6Bbe7MJt70jzL/5exSiA6P3CeZVeJ4z
	fdgMOq2YAp99pvfqWo+ST9p7hQdJ092Sl7TFUgM2QVJTU+KoOY1km3ZYvPigCaYaHRQ5iZA5CPD
	OyaRqvYvQ4HrVuaOXZsaR+F2nckv4m4NLsp3TGvjpbsA2EbhdfyB5pibpdttjhgh5hfXHWRQCa0
	mCDWhahBobElA1Lks5Biz75a7dCKjJKrnawI=
X-Received: by 2002:a05:6102:a51:b0:740:2974:57bc with SMTP id ada2fe7eead31-744f073fc4amr982306137.2.1783602582244;
        Thu, 09 Jul 2026 06:09:42 -0700 (PDT)
X-Received: by 2002:a05:6102:a51:b0:740:2974:57bc with SMTP id ada2fe7eead31-744f073fc4amr982273137.2.1783602581725;
        Thu, 09 Jul 2026 06:09:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb30f98sm500037966b.55.2026.07.09.06.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:09:40 -0700 (PDT)
Message-ID: <a56f13af-d506-479f-919b-8a4d2e09bd90@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:09:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 2/5] arm64: dts: qcom: Add device tree for Nord
 SoC series
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
 <65467777-27eb-4b8e-bb36-ace91ad27e0a@oss.qualcomm.com>
 <akhcTp1MyjGnhXav@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akhcTp1MyjGnhXav@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX+DZEO0SRUTB6
 7s5NiD8uSVssFp2obtIS2wvyphfwy4dPebIUSwYypEmJ1h4r47UhRicT9An0I3umUl9XVs9ZCo8
 YDlm48K1YuuZ0tsRB2PGI/rPaTwrx+cf19fLSdYCVblGEeXZr69YFWsPVqjeYHkILT1XcSA9R4r
 BSh5GulLRBlXEgPAEBaQpFXha7DGOolkdRC1DZ+DLRP8nq7+xp58VniJ1wZmFgT4iBoymcC7Gh4
 B3ntSJU7bYGfTBbXYDKVuXjcBYnzWW0eJR2AgXb+nFZIYDJhvegwgTDGbt5GAmIs8wuoUia0Ree
 JjLbxL586aLjB5fHtWvFcuw/6FT+PKQdeG0wdb6S3kP6oUybTnDa+a1nQ+ie9k+elrZrFPjQ3vv
 d7WVDlXy6hyNscAZZqXMNajc4xWOZpN/wr2KjYV3JinErTgarOUIgvVWlFUMS1nr+Cr02qYGnyf
 ZWG0WzXG+x9dfKclcbw==
X-Proofpoint-GUID: VV1Zf4PzevmNPVjwuElJuRvvRY3wa2F7
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f9d97 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NU6Q5Yw1M9mtJpQV3egA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: VV1Zf4PzevmNPVjwuElJuRvvRY3wa2F7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX3k7v6JQy7Q0h
 g/EoRr0rzPndB7nRbIlhv0o8bKAfHFHUv/uTGzkwLxQaYBFeRoVPeNh9f3GX35Bky8IojxrJcg8
 Xm3n9rEIk9HVK/1epm4VkcOLR3oXYUg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090128

On 7/4/26 3:05 AM, Shawn Guo wrote:
> On Tue, Jun 16, 2026 at 12:57:42PM +0200, Konrad Dybcio wrote:
>> On 5/26/26 7:12 AM, Shawn Guo wrote:
>>> Add base device tree include (nord.dtsi) for the Nord SoC series
>>> describing the core hardware components:
>>>
>>>  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
>>>    power management and CPU/cluster idle states
>>>  - ARM GICv3 interrupt controller with ITS
>>>  - TLMM GPIO/pinctrl controller
>>>  - 8 TSENS thermal sensors with thermal zones
>>>  - 3 APPS SMMU-500 instances
>>>  - 3 QUPv3 GENI SE QUP blocks
>>>  - PDP SCMI channel and mailbox
>>>  - Watchdog, TRNG and TCSR
>>>  - Reserved memory, CMD-DB and firmware SCM
>>>  - PSCI and architected timers
>>
>> [...]
>>
>>> +		dump_mem: mem-dump-region {
>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>
>> off-by-1?
> 
> Yes. We have the same thing in sdm845.dtsi and sm8750.dtsi. Unless you
> think that missing the last byte is functionally problematic, I would
> rather be consistent with the established pattern in the tree.

It's difficult to tell whether it's cargo cult or whether the hw
actually has an issue decoding 0xffff_ffff. I would skew towards
the former, but I have nothing to prove that

Konrad
