Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562743A7F68
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557363; cv=none; b=ZbqvO9ThU7QvWK7MIjIvdq3ybj64xaTU1G615RwPUSRk5trXWl5BIyo4t2Y5/2+iNnIGZCp3EfodynynGJXMwkuTzXvhPNwR/JO3jmc0q6eWhNpmmEAopWrWUYs9HMxaAjSeUYBBmE4uaAapoz4tRwyPZHn4qGQbnJb4RjWAxdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557363; c=relaxed/simple;
	bh=3tkcCMkbL7f7CzwQ4dRdoV0cOFj3dvD69MI1Gp49SdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtXbbfAalP8z7e4/LhRHvwTJ9+ZZv/xDv2Pg8yyn5xz/wv1fd6FosHD028CLXBCqa6lDMub2KG61VP+lI6pTTzhVyNmFexzUOK5oPbRdYumxIl44jMJ399JUzURWVbwImF6pEC0b4KG743b4tz5RQfHDhmtvKzUzqTpbhf09ajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzj/N58M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZXRtoGG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzj/N58M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZXRtoGG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376KgUe1404160
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 10:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yt5O/Dx4yJcpZ+lhAKCe2AtNXJI3o9BYQs7ic+KZZVo=; b=pzj/N58MQB/HDos9
	kcdyH4GCyrILdYTIiEpM2SiOffVT03RZYIGwTC1/kPZWttKjzCrzgj40GHxloO2c
	uhKd920gHoZQxKnNJmH9FUek9THHHTIQkjGRaj9u2XnyWDX5xUtu7bdO03T2GDfx
	N2vCT8HoTg6xQHpbUmnJs+gxWFLUf7O4lpjJPTgr9vLo9XcR+I+QAdoWyZHywAdw
	/YTl/K2tsZj4kN/baEiq5KDttBbF/qFn/iVAhOmE0JWxzf1etopWJyT84SGYYaUE
	Jfz/vYZK9avSyL32MJ8CnDuUXpPY71LfRrBjb/MTTGtq+jYY6gWFV/t7AaCVkQcs
	V6y1/Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8a8u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:22:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so20065566d6.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557361; x=1776162161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yt5O/Dx4yJcpZ+lhAKCe2AtNXJI3o9BYQs7ic+KZZVo=;
        b=OZXRtoGGmnW9FTuPUJ8texOwPwYbYmDPCuXGxfsIDAxTHbZMn9aaZIbBqMRtdSf/C7
         odUJZR/F8+Ne1DL/SqLvHjIXhpscfxJeTsTNtwnNJ4jvcsmE1lEzBpwt8o2d9Jn52l2r
         C8shLEFGGHIjSsrJBgESBxvUfoWwD05KMKXsOZ1ueQn0IUvb4OcOnbOxXKFU+busDVc5
         1n0miScxL38Jv/cysEPdC/KZ6zUEVVf2MWbc5CJNydnVI40TgeDpZqh0x7SA/noF1/h8
         B+iCGfSod7JeB84WLbZ4a/StzQOsZ9Fxa0SYGVamihm1jqE5G/3vXXVzDf3blp7IFtQJ
         Kzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557361; x=1776162161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yt5O/Dx4yJcpZ+lhAKCe2AtNXJI3o9BYQs7ic+KZZVo=;
        b=fECMjsUljiZzMvn8uJoAfRSjQ0OPyrJFQVIKixRwdPFD/OOzkHMCWs1n1csV0FcmbQ
         9L30C711SOIHOfi74+VaV6fBHzpdtpOcqqp3eky1N5vRJN5MK37Bpj7nReOJVxb8ktQ/
         eDypaL4Gnmug+W0lGsu9mpGLYcBXI83/2wpGm2BpDaC3fNrswRSU1COeluMzzCAk87mQ
         Ee3RXBQlOMcEXukkCRQCvvhNUlFviBl3gSMMT9bnkTczpA6b9nhp0zHpz5ZGfOkmaO1i
         z6Z2QadI5cWCSvTFEr0IhThRqibSAmAkt8Ha8zjjOfPagAQhwA8bNNtIqVwSReFg92Z2
         oRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu9K7tFNMtKTkE6jMJMQ3w+/qKiSCoZ5KUS0UqSPAVh8darkhSIeqdRnFmwE7vvHlEhkMbj9tIRKTY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq0xKprB/Z01eRdMcr7TCEttal2MrXoA+uGVr4Ag9p5J6G7cSe
	EuiTeNPzuG+o92/LdhBLk81V3Um5nL2X4YU/QCtEWlKsUl5m2/lHtFUMI9xw5qiih7D1tU7ziAV
	vI4a0fEy8mgu2AEXyKMhInRTuQIsDL35nfqClC6+qkWYW//s0pCBW79yl2wbcz4ds
X-Gm-Gg: AeBDietaXX+E/WnqL2KD4UdjXodmsnaDdi9EfglruQDseGPbX9Bt7QWl6ZExz455KPQ
	TvP/PjA5Ijj4tvjXdx2btDLiZaU/2k1e+DvbnclxJ+aNtMiLGvpJvi4HQkvfyvXRLi+7jMEzn2l
	2ITM5EZ66dy68jJarDozPttfZlAekUShUkjcFOSDcNIZ15Hk4MlFJOZ5+u63a9l4mkkfqFp2Tli
	jx7sUGS5WwdaZ+YQ3sbWvs0CeOhzyVDSx+9tyTH5wNzg4Mowq9kp1ucZsUp6e9CZzZ2cr1lVcgo
	IvHCb9w6TBhYVI6xbuJCXa5chK1L09OfL0tWRnbj+2Lg5cU6eetQFOenoLW/4R1HA1sxUMYMMgL
	oOqtgx9v9AntoVlA7OX2DRO09iJJKCyPYbo5+/ec7Jg2j3VajrU830pxa8AnJEnv6kEUFUSW69n
	WbyQI=
X-Received: by 2002:ac8:5853:0:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50daae17569mr4543981cf.1.1775557360617;
        Tue, 07 Apr 2026 03:22:40 -0700 (PDT)
X-Received: by 2002:ac8:5853:0:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50daae17569mr4543631cf.1.1775557360128;
        Tue, 07 Apr 2026 03:22:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99fc09sm545037766b.17.2026.04.07.03.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:22:39 -0700 (PDT)
Message-ID: <f6791bcf-f90f-48d5-a104-89988c2fb8a6@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:22:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] arm64: dts: qcom: sdm845-lg: Improve hardware
 support in devicetree
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
 <177541802142.2061229.9094394728986735362.b4-ty@kernel.org>
 <f63f25751b5db2ee5420ec4c12e36271ca22a864@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f63f25751b5db2ee5420ec4c12e36271ca22a864@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tECjvFw99yLzXfMrCKt7F3yao2ROs0MK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NiBTYWx0ZWRfXxoCodz9FxPvx
 2ibhxEO8S9/7WOdV2Gz3d14F3qhINNGrXb3W3ei00T04B4bBN/7/mHAUQ7tly9ftRQNupnAtBTs
 VBkI99bwNH4j1PLXtqhgro4kohh0Zeqski3ArrPg1t038Bq6kuOpKLRQABc9SasCXD8fABCuYEY
 iuzGyvTIj0jxbSI1XRNV8Qm5FwnhfXg3PancJei3jzjoTs2gH84rlv2uKoJtLBjW6SR1UuSD3BU
 eCoy4y/+QjfF2QsGaOmGsWldZSOGARkiGD5QVb7LlmNVxYGVnjQ0ZDEdApvyC3vyfCWLxYrWmaK
 IaiPs2P9tAkkiasrgQsyurRF9hWhAp8jJwO7450fxWjW27sznYFs/FhDTXcCED5b3sMhk0jz02p
 IQzOLTgmTskeovJO+CIXz8cDpQbwvVn/ckp3S3IY9ei4pl5+LRsoNbAm/UA4EiEHb/2cwHzxxYV
 W0EFFZBhH9zu3xoU1rw==
X-Proofpoint-GUID: tECjvFw99yLzXfMrCKt7F3yao2ROs0MK
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4daf1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=y76pSr6RzozYTy0f4XYA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070096

On 4/6/26 5:30 PM, Paul Sajna wrote:
> April 5, 2026 at 7:40 PM, "Bjorn Andersson" <andersson@kernel.org mailto:andersson@kernel.org?to=%22Bjorn%20Andersson%22%20%3Candersson%40kernel.org%3E > wrote:
> 
>> Applied, thanks!
>>
>> [01/15] arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
>>  commit: 6a9e8df732014c1c758bd3cd6254b5b4cb273c7f
>> [02/15] arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
>>  commit: b9afe8581c0e14b7b56e2314dc7f9597bf23ef67
>> [03/15] arm64: dts: qcom: sdm845-lg-judyp: Define firmware paths for judyp
>>  commit: 8f4c53ae286bd6a113245ad53ce957e623374cf0
>> [04/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
>>  commit: e9f611de7ab51540c0cf246df6b7d4d99f4cec64
>> [05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups and their dma controllers
>>  commit: 4ec3045c969a326c458c53ca65bde5749e575d52
>> [06/15] arm64: dts: qcom: sdm845-lg: Add uarts and Bluetooth
>>  commit: e746ed5af3084e9534135679c55e69eced0c657f
>> [07/15] arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger
>>  commit: 995c258982429db93db103fc26fcb3a0acd6a5ee
>> [08/15] arm64: dts: qcom: sdm845-lg-common: Add LEDs
>>  commit: b49722c8a18cdd11f49357f3b8be23549f76a506
>> [09/15] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
>>  commit: 2e7cdd400b6a4e67c27fc3e839342824b51d01ff
>> [10/15] arm64: dts: qcom: sdm845-lg-judyln: Add display panel
>>  commit: c6c66aa3ef33dc3076c6dac64003b29bd9515b58
>> [11/15] arm64: dts: qcom: sdm845-lg: Add wifi nodes
>>  commit: eb8fa32085261a07d763e9d616b3c206d0be82ff
>> [12/15] arm64: dts: qcom: sdm845-lg-common: Add chassis-type
>>  commit: a5a5ad9848980e1019ca841fe057afb83debecfa
>>
>> Best regards,
>> -- 
>> Bjorn Andersson <andersson@kernel.org>
>>
> 
> Please apply 13-15. 15 is the only change in v8, so what you've pulled here from v7 is fine.

Please send incremental changes on top of -next if you feel they're
valuable

Konrad
