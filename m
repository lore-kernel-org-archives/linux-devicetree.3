Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870314;
	b=NURXhTkP6jDwq0q22GYLzM3Iy5yVa5KeIh5QJdk/GlKzFUTYojqdjxO8Xv7AVxhD5ewF
	 SmTeGT01DyhbyRM4QUUpyNdboRatI0BrRhJLOq522bqcVwLci9LhBRoDre96swHuZIpZS
	 wCYZw2G4Qc+oyQy/qoJ/Dd00Pf6mBvY0M66SnXuf9I2u0zgQltHrL2uTouCc5VxKBPUdk
	 VxXY6MmR1kLfvJiErHN77n55Idj6lMrl06UlFkG54ZoiSzP6pkWIE+ICXB3mgMIHNJC6r
	 A7clTWLADwbrWv5BDoplc6IaivtkUk0oHnOyYNPAZOhPbRtsJ4DhSQQwtB1UcECRG6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
	b=qg7AN8J8NJZ63U8VZmBX3O29UjzVa6jbMqLW1Yyz0l3/8I0BU96Xts0lJzgTCjqVs0lt
	 ixpsbBQWkshxvMeecm+2DQNJYNi3oZTBsFqMxc0aa9HQQOWY/pZEoDFFDDFf8hE1idiNW
	 T0WLYYWeWYpNlo8QfyvdPkDXSUDtzKfhwjeVnfL4ymagtTW+7VZpHklYwz1PrID2BozYu
	 tc75TJnvcXVFNIb8jmnN+Oq0j2TC8rRl59DA2b4xbyyUcFGXRSfvHgtH5TGuZdfPPeT6E
	 i6vjhbQD9HiKTM8lNaa33T/MxBzdUORYlre1IKxbtttDQ9+puMgYBGCc2n1sgJVH9gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EiZLXGt1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyQWOc3p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECFB606A335
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BECFB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EiZLXGt1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyQWOc3p
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U2PR3073556
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 09:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=; b=EiZLXGt1hJ/xxiV/
	sN1+jAlyHPZbyj2AacOxHz1eean0ky98SRnWvdsCNvEgq5ta4v0sP14YT+Y23/oA
	E7l72eTm+TibUI+BrqviZ8lDF4CiKLUH7dTIGqDOUHYd3C+u9tPwI/PBvUanKPTq
	oQykZpwTANZXI0r9kbNkDHzm+W3sx8IsvZCjN9+gKbOfzdVTss2VlrlsvVEEYbBq
	TA39MNHm3DnLtaBGky4aE1sCA8LWGjW95z1XlA9PVc4uFU5uHwUfUU/ToESV4OsL
	Pt6Rhl2W+/WcZLBmNKrxg/ktw8yszXDGgBiveW3kJKEPj9uEWzd/Q9floDSh+UjW
	A7tO2A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq8vd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 09:18:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso2103052eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793870312; x=1794475112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
        b=UyQWOc3pZn/33nOWjgNlnzJ9xMl1aZoosvW9ZXEBkwZwlUJkvhLNT90vFh1rd9DqlW
         cBT5jFjnI2pVWLNbqOTDcPhTlsBeQT9LR3L0kh5VBtdB7exSXZV5ej9QdrmsCX+7tlIz
         F1Gdxjja3iKjAWQG2iF2U8WV3w8f5W/K5dNigQDARkbvAVDp65gKh3OYDIekRqcNuFat
         mqHlA0rHm/pU49008grbjG8PEt4eL3rJ/3Zjvb4Ho2GGg1zOIMhEEV5r2F4drxf0/A7J
         gHBIjawPPxSrnbSrOE+Ixpdl1RB4g4PZynD/CTGfHN5etFG/UgxzjO1eYBJVXb6Ghw0E
         ScUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870312; x=1794475112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
        b=ojJVCxzQFNtA9FUpVo8E+GrnouDGf2H0lPe2C5f3SL3JoxkAfpEzAVuy8x1r8usNLm
         bT5vbp3C8UNdtlKA5H8rpTLeNt3ltlVjkbbwecHokIqbUboXzWj8TBGsPaFA95E+M30J
         i4XDhXmmZAja68F+sfkvgNRzU0R7ribsmedUpEUiP48V8BXmhw4qFYilmZv/HFZEEHVn
         HKhej7nTIDsY1EMevS75IYKRa1HvNd/6fT3Zmh7xmHK9+44xH2JE6Due6U2mFxsB5SdJ
         /989JW7zIHMup5rriDHZ10GpjLv0X1W7X37rlkRKwmoIFsdGOmMnInANrLuWUUlTnNuj
         MyBw==
X-Forwarded-Encrypted: i=1; AKwUvByq/Z/Qx34EGYR7TT1/+9SbbXBkAvarAfbD2LrPygb1IG5OnOlDM8FhMD80FtJ6owwKGwO3HTIIz9af@vger.kernel.org
X-Gm-Message-State: APuU4Z8qlQQjzq71qeZp+Cs5/fIt12ON+fTbt7MSwnKTlYoZSxIUd2x3
	RYnYSwe/Azt3vSWofvCsMooRJk9zBzl8rvK20llUJY+DMt9kJU2BhrYIGsiq9D5fifWdQ7VM+CZ
	9p6LkgHz9o2ZjfeZgMXJZeyrblKauiTLIrwUU/sY8QNVx+54E2h26OBi2W6tJhaFs
X-Gm-Gg: AYBFou2Uihg20FY7qntCMr8UzbKD6zbMufTBugtmroa61zD6aO5fQCHQ0X5YmmaCE5/
	wHsv2KAdp9QRpc91DN+tz/vEewtos054nKsR14fyTshlckx82YhRIEmGhgBAEHWBTEKPNtCdyd8
	mbbcKoaBqnmNnRWL/YssG8YU0Dgg45uqN5LXrHYuKw7P6iJkz5CcHZEDSqxxgffj/tIOc0B6gPr
	UkfvkRDfkhktf6ug7jfQHKUZv+vwmCIiztQHdKBfdAJargZN6g3+YmOYXdHIStiYpNsOBiIlGny
	ihEopbJwcJE3aGBjN5OKH2/C0ko4FnihiYDrydsZIjAB2gDwuhRl0wI45eVHMwmOExrloKGKHNB
	4VBXdKZBGgl9a4e8Lg8Uuul/PwQ5gbS1IQTkyu3AqLzIVOwMkMr/+mgYu7P4rIxKF+TrEownabF
	w=
X-Received: by 2002:a05:701b:4594:10b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b2559b698fmr593803c88.26.1793870311801;
        Thu, 05 Nov 2026 01:18:31 -0800 (PST)
X-Received: by 2002:a05:701b:4594:10b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b2559b698fmr593784c88.26.1793870311273;
        Thu, 05 Nov 2026 01:18:31 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm18261870c88.15.2026.11.05.01.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:18:30 -0800 (PST)
Message-ID: <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 14:48:25 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX7ATD+dyraaMG
 LLsTPvKfQy5r53gU0vivcXIbbz3rUVqyY2E6HgoiSOkSVJqw+7aTUip7yv9++IkKcCjuf968lPD
 ojwYI6NsNDnQNXjdLVrv3MZJZ5QunvLnSgF+D3Ch+OPaf+qw/1me+xssrbMGyMe6/9Efsh2IbkT
 ZhIwVkP2CfE2QbRKjaoFpLi0QQ193fs/6lKYo6gCJhSD9rzTcl4gejwLoX8PhwE9fpY87H838k2
 WpJiuLBoLMh3M3Lmj9t2OvuJ1RlEksDP6YBuIS4d5Tjj18fCLzn+4sj4fsvx5ovNKMq/GC1a8Q8
 YgJceB6+1iXVOpItxaLrPlG5ZFhZPPjb1XFfAQJ0vsFhwZpdQUKUyllETK6FeupOHugdAPu7Szn
 Xnc7ylCx0Mo55q7MfpHcpDX4JQph9gpwtSlvg00JvLOgp8If6eoGRvEKrHfK0iscGb1YJ7EhwJT
 iAZL5+3LzT9XkqB6Izg==
X-Proofpoint-ORIG-GUID: 1wbsp0rwSDMATaoAhz_iMaqtJ2-Y6jUJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX3UkrByk5G977
 fs13M7Qj+3VZa1NGPxFtnPknY+n/Wlf+e+7OxU58tu6tPeUH13G8U82fH2KFhXaWTTag4jRQ1ry
 PZZLmaWkqcmfWJZW3ycLfrk51+RgRXU=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec49e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Ck8ZG94lijjEDa-JwdwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 1wbsp0rwSDMATaoAhz_iMaqtJ2-Y6jUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050036



On 05-11-2026 13:03, Krzysztof Kozlowski wrote:
>>> What is the problem exactly you are solving?
>>>
>> The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
>> graph should describe it as port@4, not port@2.
> Nothing like this is explained in commit msg.
> 
I will update commit message to explain it better.

>> The previous port@3 description only worked through the X1E80100 resource
>> table indirection:
>>
>>   port@3 -> csiphy_res[3] -> .csiphy.id = 4 -> CSID selects CSIPHY4
>>
>> New standalone PHY path:
>>   port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID selects CSIPHY4
> Then this breaks existing users, no? Anyway, what stops you from having
> there proper mapping?
> 
No existing upstream user should break here; this is still part of the Glymur
CAMSS enablement.

This follows the earlier discussion that CSIPHY4 should use the
CAMSS-side interface index as its graph port number:

https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com/

> Did you find any existing practice of numbering ports logical numbering
> in this device, but some other logic coming from datasheet? Where?
> 

Glymur has only CSIPHY0, CSIPHY1 and CSIPHY4; CSIPHY2 and CSIPHY3 are not
present on the SoC. 

Using port@2 for CSIPHY4 would require a Glymur-specific port-to-CSIPHY mapping.
port@4 describes the CAMSS input directly and avoids introducing separate logical
numbering for Glymur.

-- 
Regards,
Nihal Kumar Gupta

