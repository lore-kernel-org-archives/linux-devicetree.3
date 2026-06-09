Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FBA274B44
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013413; cv=none; b=aLPqLdxovGNrgEEDIwfXJv2nl1tjMG8u1W2Eq4wcjkftxqzmftIb6Y2JgDpPSgLLvXmTwR84aqzPMybc0MPtROKbE0R9PoPZnqCEXClocdUeCG82PTZgrvf/4lqWwDlHnIQBSv71eaIPAjBEsG/1LBqsgbxltZP7wXn/0hy36bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013413; c=relaxed/simple;
	bh=CcTmWN8DXMnz0bJC6LqxK6vabFMTBrDgJ9RFOo72kwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxOR4WKMy2H8XxaBBCkHQAtI7ldsDL5CvKWqyxm78IBaJ4GoYJ3mkcE9bwFvl+SLDB2JiGByyQZBU+DdQzBedvjVemxiEopO8r52Uhp3Ph/82WEnCWWl7W3J5WjjXGunZ8jVm0zazgEGkuHNZELlPMOqf896v3AyVsxB9+20lgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuS5faaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gf2Ye/LM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuS5faaK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gf2Ye/LM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Cmh1q2700863
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQFDbwlJhHCcC9ke64p/rWctFC1cP9UborZW73WRcTY=; b=WuS5faaK+4G0mZQn
	U6/kr0u8p5GX7ocW6M3Ube4BuASGWKKawEZqTYCc2RXxdK0dR3g+5a68E0q2F7ST
	P0m9Ru0908pbzu68tTlZTVV7o51t15bZQagrt6P5n1MRm8vInyXhhazXXYrTN/pK
	mgCQWnNwUcDHJA5uBGoYWrIB9SSEm4FO5UWNoA2WIOswdzvCDwhxn4of+QLWLw4z
	aEJ2M1mVHB1RB2mo9bxvGcNBCm8gwSy/3RCgT3c9sKwErrxR487DRW4+ilGrXz4z
	3bBvPKk2tKm/EvkYxCw4+3+S+O0lO0nRAIg6APSh3qHrEp01PqMV3sRzxfBrV5pf
	as63fA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeaspsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:56:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915737aaf0bso138419185a.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781013411; x=1781618211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQFDbwlJhHCcC9ke64p/rWctFC1cP9UborZW73WRcTY=;
        b=gf2Ye/LMvnk08jnI+hp25zUoMJnSgdHAgJ3qVUxUxHFbMNGDILKBRNAJ8ogLsbchrg
         XGZrZ5/fcN9jr/ykupFlffY3sF6thKGGSuVg7wMpoSxbjV5hUAHd69tYVvmgHjKAoBgI
         4MPJIhKsj1R/9ZfIaAZE9uhaDutkpahOhVBmEX2BrEsoSlGkKYKAOmVN9LdyzS0DxSWT
         0oLNeSy0PuXNs5hmKmH9FVu7pQVr9EIXKS2dv4v7BlifjDp+Cz29a3HRwSRbEsGFCd0O
         rcnEIQsUxc5qWZzhvOoHISPMI6S1peYvY9FwgFbjF/Tu2VIzrr2SOPk9fWBtuSHcjsYU
         dXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781013411; x=1781618211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQFDbwlJhHCcC9ke64p/rWctFC1cP9UborZW73WRcTY=;
        b=Dwtu9GiCVDF6FSPTal4dfcD46XPmuZjjdiVL32s42RAqN2DUtGQgNXUkYzfCZo3aQo
         GIkl8q8M+XPBiI5ocHs4VbrNvik4uhpkmSFFac8Y20mYiaHWQG8y3ZmoV0HesGSqQUSW
         b+A7oQHLPhvUe6w3dSFu6/cTa9txmZpvf9n+XS7FnKPeu87yHgZ844miMOyGEPDhRoI0
         FUud6yXRrd4MIMUYZCm75Vex350PNFh63ucTwn7F0uMyB8JrJdgpcF63+DwbsFl/4irP
         xNnWyDVyXGO2xyVwYwKYraO4SBQ2P3vAZqtMV7iCI9U9ZPMA0WDWzhTED7/NXbg5qYY3
         Ux4w==
X-Forwarded-Encrypted: i=1; AFNElJ9ApHwpeH7TuCZfUXAKNZ540jGY59QykGZCwM0DIpRESt+irzEq+wu9RmRQ1s2nNb6FZ05IwvdEiiuH@vger.kernel.org
X-Gm-Message-State: AOJu0YxzYAmyhHvoMQZoTNeZro3Cw7ec0sg+h1K2s34vOSdls5Df9vpw
	TNl3qPqMU5pkVJ6BkDLuZHTNfggmh0+C+QqgPHOCcva/fbBwML96McKUKNMPZ/+wuFmT1snLKUj
	pidOQJeXDHdBnszEeZPtpPAWzYCIa2V1TvgXpwS1T0onFPBo/BsKAipmyzxJpC+MZ
X-Gm-Gg: Acq92OFIRp11XBVPKMb9sRqK80NOo5YXBL6TBZXrPoONvjNvDJLG0NFwQOKgfbVybUm
	jaUjOGPLjmiyJYP/U+7RP2aBTib50Ac8TRNzb4gF5uDpYj630GzHNlq7qWE8detnBxYC5eS+lkc
	3Zn0x9k8YlDqPRlYXqYToGjo5D+E1k3vlVj84cT80MIUjWnY+1NC913vvk+K/QiNOUaTGQuIB6r
	oKK+4/RvbR2TuYDWdOBbEgxw9QPMPpBgTfZR6LmUWoz2bQL4NqgUZyAv/d9YTrPRba4zmSEwxTY
	QdKknoU/o8CyzeMnoYHXec1qCQ1sKYvX/xJ/EAAVwkqzTACL9W6p8QmSuloCKJkwgdRNNJ1Bc62
	52jmaWoYFCn1KEllBnjSgG/1Bh+5iO3c7kPs3LABYxG7FunQhLteFsbEx
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr268373385a.8.1781013411114;
        Tue, 09 Jun 2026 06:56:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr268368285a.8.1781013410622;
        Tue, 09 Jun 2026 06:56:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e29c0esm8900211a12.7.2026.06.09.06.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:56:49 -0700 (PDT)
Message-ID: <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:56:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B4NaWIzNbQCM44QWz35IVkHTB4c9y02j
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a281ba3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UD-L-AWZVG7rN1av56QA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMiBTYWx0ZWRfXyJCEfCE9qZi9
 xUS5mm/KSGpckJaJ+RDtFX81z+w0LNKbLI8uxd3eWeB2dJjnro+dnrbNkwjnHtWyshP9+rVGp63
 gY0sGq9RE4eJG17VkYQZaDRyFg5OGyTUD0gPx3gScsAsHu9GlRxu93H85FmNJh38rQQ4O2/Op93
 YOZytTqT5jSs91h3xMf+zkLGlFqQHWBrY1Z7zbgB+bb2sRjV02tCWCC41MULvZJ9yIvN4sijqES
 NLvzRPL646tgshjv9Q+euCnSklJQD/OG1WTYoMTqNGmMhY2wJYn6FljMM9MbBzeSv6PjAY29k1Z
 WwJ4S4JT2lk0rHpafGwMCxdSuqPh2sZrIg1oEuSxTpXW4SP6ZAeQMP1BBx7oQgPbM7Bt2Ub3eD7
 xYtouq5zGkwevvP+GWJONKlKV9q5cK5IuFUyXOppJXujA9N4/BxjnAWsiskYEpXk9BPNu8B2xG+
 86he4afPiGYvTgNxoCA==
X-Proofpoint-GUID: B4NaWIzNbQCM44QWz35IVkHTB4c9y02j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090132

On 6/4/26 11:06 AM, Bryan O'Donoghue wrote:
> On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
>> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>>>>> described as subnodes, then likely none of power domains are needed

[...]

>>
>> CCI is not described as a child of CAMSS, here the situation is different.
> 
> CCI probably _should_ be a child of CAMSS given the design we are going for here.

Yes

Konrad
