Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7484441B36E
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971899; cv=none; b=IDvPyLrMBERuVFjKlZB5cRU4Z0C5wl1m6pqB16Z5IC9qyd0ZMzWodEG2GAyKDHhhIl3dXYmpEqlqZ25/8ouGW7/CiZga3faeab/sJS3aR6vwu1Kon62t8gLuvciWqbGMrnp7T5135Qd1eyVjpR2qIvsnwcZKw4VKJLF8brjcliI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971899; c=relaxed/simple;
	bh=zsWxXgcpZkumhChwixLQ08Fep1SFTO6kUnz48gaC8yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNqUx7GJ60ZuikChH83C0Kld/qsg3ihGarw506sqx+5+bC9yBx7fTgqflOedBwpieU4+0kARQIAnerj1fm/ceRmYCvmyoeT3WDOIYR7leHwdd2zPvZlSbgyqT/aUq2bJZ1LoSkKywaj+7kn2va8BeY/3UVyTMavQtxNQSmTjIyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HbOlMG+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fL1DbZpz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HbOlMG+g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fL1DbZpz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VEZP8i4053797
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMxnpJ2ojtNB4SMJzye1+MLh767fll1nF+AZ7c5dMu0=; b=HbOlMG+gxXt03AxM
	91Qu+18NcxLUuEcu9ukfrA+u2WB9DYL0OMTvFNtpSmifhbzE74vJSvrXXEw86ZS6
	8UMwDfeJ6QrtnnPESSKWQc494tNO+99j3hR9tFDHH2MeVM8r+Xhunj4DTgQqptpX
	CLSA/zMNHZ7VAySZPVbR9HwSwX5V+MyUvxMP19FbjRT7tS2Mdze8jpbws2TyyEib
	Nk6OqqUYNXqJfDYwmqznrhSUfie+zrxpTMGkaNnUXYCAQzdipAF+MolKocQ5897a
	xYn8ZwYW8rTqk0+AIiALYV330oCLxuaUNYfRHBWk61dzFAX8jZ9nlGVHYyFkOoB3
	NTDMaw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3ck98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:57 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12721cd1a2aso6887766c88.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774971897; x=1775576697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hMxnpJ2ojtNB4SMJzye1+MLh767fll1nF+AZ7c5dMu0=;
        b=fL1DbZpzjL0grxjsdFNnuGauAe5hvA1U2hDA5R0NCNSNVn+iqYNQNJfhtnJosfx1Pm
         yz55iLP/Q1bx+Mo05EUw6Iuudh8O5iNnbaXUGigyNYuVgVCHr2gFqt5Xr5XCRyFVxwzV
         uuNR4TWd5MHJZ9BDxuUdSAuH7fpYgLFarmkBj3gXXNxhAI3BVgJYm+YoCYO/GtMK9OcR
         D4eEx2YiSH7ze0gwQcvxBatTsCClRtNqNXJgiFx44w2hDIplwOILxoNntrfmq/pVXAHa
         10juRXxrzeu7PYVVa+/IkloZ/CCd6s/JMoQxHHyukONs9GWR6G+EPJy0RU34MX4k8epx
         l+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971897; x=1775576697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMxnpJ2ojtNB4SMJzye1+MLh767fll1nF+AZ7c5dMu0=;
        b=r/mkg+MmtvojT0LQ9P7TnuWQAOBJ1I6UGtOBTpA6qdfMp3kgFJN3rXnMbhCF7X6NeZ
         1RlvzBgjPGZi0f7VfvxTPcjvuIYSXRDpJnjBtNb5WXb8xUrQ2hlmKjr86Zv7hMryxY/C
         /myQy8bdTKRwSN0KiMWOUFHMhS9bQJL/Sx7IhqPt9E3MlFJ0b7g74cQpoKvXRdlA57T7
         ldgjZ2Wh0k4n/PSHqRBV7ysu/scXfnNxhju6HJVOwTSvVjs31Qe+0rSF5BwjkOlzbeG+
         XsUJHxgBYbqAqT0E/YbIuCWN1sO074V/ZvKfCOllJzp/2qEwVYF1dOdftPzBA2METYcL
         zTeA==
X-Forwarded-Encrypted: i=1; AJvYcCXaZqS5FC9qZ7WVaQV6gzNXbce+M4MmY4/nzUfrwf6WkGPBOX+/jANuZnj1tD1P9mBbjANEzXVSS5DM@vger.kernel.org
X-Gm-Message-State: AOJu0YwhCboA9GlKVFTk/Xtxn8gh9L6ajajwtgXSaOcakXsNJQwhZ8qX
	eLGyqLbhE4bSNMbKuNO6N53JCW83fOiCxeq9naAAb1SMiamdSTtGraUsilFA5j7V7Tv9uJTC+By
	WfOGxiXOQsbu5SzOxzWmjyQOTE06ZZ10YKw8SoK5dBbldJBTlFw8bfF7aQl57aein
X-Gm-Gg: ATEYQzzfBkdjSlkoMli/DzKZtvaLB+1O8RLG5BZv7SZUZSghVBUB0UXXUDAjFzKZZjX
	nl4Fwrg5H44EjPiE4Jbr2oRHBzQr7SlRVZQVknoOqS+g5ihWYuhJGMqcQuFby72mAvutBzme0Yb
	UWOLk0zfY1p9+lrYLY9XFXoCNK0cuH3+S1nP9RT0MqU9xCE/oDCEPh9FPhBU/IFK3qZBL2skX1L
	JeJNsQ35cIRtP//jGRzVLR5M1vIZVmDTjyICgg2CFE/JJpgIwgWGv2bLdvlO6jy/ZlmTYnqeZl6
	rQCRykhkJZb76l5/YXo5KKxjJHHLENUWf1+v+hP2VFahXZluK0jLuV4GyN9A7I4tMjsc8f6KtvO
	DPHELoCGCf0Pxps9JWTfbR/f3q9iJIlkvndZ5LwVZD/U7WVqDaAylY0ptFjIC4GiT19DxB1omji
	lz3p1r1Q==
X-Received: by 2002:a05:7300:ef82:b0:2c5:ed1b:cb3 with SMTP id 5a478bee46e88-2c5ed1b10d5mr4986305eec.6.1774971897072;
        Tue, 31 Mar 2026 08:44:57 -0700 (PDT)
X-Received: by 2002:a05:7300:ef82:b0:2c5:ed1b:cb3 with SMTP id 5a478bee46e88-2c5ed1b10d5mr4986280eec.6.1774971896516;
        Tue, 31 Mar 2026 08:44:56 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9bd48sm9935249eec.20.2026.03.31.08.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 08:44:55 -0700 (PDT)
Message-ID: <cf1d8b38-a5d0-46c6-8016-b366637d6c72@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 08:44:54 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
 <20260331-ath12k-ipq5424-v3-1-1455b9cae29c@oss.qualcomm.com>
 <20260331-fanatic-elegant-wallaby-913e35@quoll>
 <b1194bdb-75fa-4f2e-b4a3-9565b11bb3e9@oss.qualcomm.com>
 <0de0574a-04ce-45d0-946d-5fdc1a7b8181@kernel.org>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <0de0574a-04ce-45d0-946d-5fdc1a7b8181@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cbebf9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=I2QDpBo2NW-_l7N_WEoA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: luYP5E6RFBoyCdMolkTXqzm4nf3ZZ6md
X-Proofpoint-GUID: luYP5E6RFBoyCdMolkTXqzm4nf3ZZ6md
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1MSBTYWx0ZWRfXxJJcCBK2MGzZ
 7GjDrSby/Hn7m34tsRMY2xPpfuN3lPIc4x1EMsEIY/RGikErTzhW9dyAdTxa+mbLZhcFO34chg/
 HdNJ8PrEnSdrOZe6rQN0rAl+p0zLHK1MpMR/DIsOeoV9uRWN1faOTiRbC4HUtWwfflbEbD0Y5Bk
 D6XIeSBIsZpC/k6Mx3s+4ZC2sU4sccYy83v6iAfjIqjrMSsCXNp2SxGYST7LauPdvMHUxKlRxux
 xDuT+63m2Oxjc3ttrQ34WEpT8uD8IHriyvpS7SlPInVf7ndReMh70rgz5T1lS9tXA0GUw8G5Ec/
 irUA7qR1/TCElkY/PdjjOMZgkE4T1JAhyDIap0zH/33J4kWjWE20+f3lTjXinS+ML65apsFvyhr
 JM7x8UPBhzX6VTxHgpsKQoViMsTLAWoNGSEoEALTACuQ5DP+o6Bse2Nq2FYqmY8h/8+6PhY089X
 OqzpDuBkzDzIgQWXSqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310151

On 3/31/2026 7:42 AM, Krzysztof Kozlowski wrote:
> On 31/03/2026 16:23, Jeff Johnson wrote:
>> On 3/31/2026 12:24 AM, Krzysztof Kozlowski wrote:
>>> On Tue, Mar 31, 2026 at 02:09:06AM +0530, Raj Kumar Bhagat wrote:
>>>>  $id: http://devicetree.org/schemas/net/wireless/qcom,ipq5332-wifi.yaml#
>>>> @@ -17,6 +17,7 @@ properties:
>>>>    compatible:
>>>>      enum:
>>>>        - qcom,ipq5332-wifi
>>>> +      - qcom,ipq5424-wifi
>>>
>>> No, use previous patch.
>>>
>>> I am annoyed that you keep making changes even for such trivialities and
>>> require re-review from the community.  Previous patch was correct. This
>>> one doing whatever you want to do in copyrights is too much. You don't
>>> change copyrights just because you wrote one device model.
>>
>> Krzysztof,
>>
>> FYI here is the guidance I received from Qualcomm legal (links to internal
>> documentation, removed -- I've forwarded the entire e-mail to your Qualcomm
>> mailbox):
> 
> As I explained already more than once, legal can engage in open source
> discussions directly. I am not going to discuss with them via proxies.
> 
>>
>> ... Repos under copyleft license [...] QTI copyright must be added when we
>> make significant changes.
>>
>> ... Repos under friendly license (BSD, Apache, MIT, ...) [...] QTI copyright
>> must be added for any changes, not just significant ones.
>>
>> ... under the regular QUIC to QTI open-source copyright transitioning [...]
>> all QUIC Copyright instances should be replaced with year-less QTI OSS Copyright.
>>
>> I'll follow up with them on this case where there is a dual-license file.
> 
> You nicely removed the quote where they ask to follow what the upstream
> maintainer asks for. So as one of the maintainers I ask not to change
> it, because it is churn and pointless waste of my time.

Although I feel the latest patch correctly represents Qualcomm legal guidance,
I'm not going to insist upon the copyright change.

/jeff
