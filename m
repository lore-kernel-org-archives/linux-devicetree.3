Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4959745A29F
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142815; cv=none; b=PSu5yT5RXuIKGm59CIgIN18vaSO6zy9w4ioYvW74hrn+J+mQYgSjFJRXfBZ4857iLitFogxaMn8RkgFmvLX0ovjeIoPSIWG14BB7r05rCTOyu1Q/S34IhipVPKaPcckwvu68Dt8ebSqnuiobeIF275Kh6OUjAvMM5KogUsr7+UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142815; c=relaxed/simple;
	bh=Eh8D8+hdHAw0uaoyYdUJ7w8ojcJniOA9KSkBoPgB37w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgsrsGoPapMu3+9u+48KoJslgx2hEj4zY6E0uRwlGXBwRBgudFqWnqcoy3hBwvsTKRDbgVzAI/USRnwM7aImCwdYFV+Igr+hCkjq7Jm9a9vJoebpl4b8hPC7b3S7s+2TMjejUxQDWdcRdU+oXRuCexsL26pDzKiI8ku68kHD+hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuLnzm+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFYRAPDa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuLnzm+B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFYRAPDa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lCNu1761412
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0mXq9SsEMF4c2zjn7YAZ1SKL/E/fKdDfWM/bk/8SfY=; b=OuLnzm+BerQHtwer
	XkrUhZ9Y37HuXJT8L+xAat3ARvQGijgXk48l2FegLkCmX3FKdBo4d3oced4pcEJf
	l44wKqteOznEOkut79/5g27joD2jSdm9/x9tQZR+XY1d3V0ZpSjfGYgnEkpGy9+o
	rT9rEujkOYzleVZ9B02VO9eznXT4Dl+6gFy/lOWBDpUZAn5mQZE8YuWbDRBMkhRs
	AydcYef63U5H48RIBo2n/r6ja1iXyIxfw5gVgrwYRaKcyiy72W9CN0bAruaPI6yA
	tbPaxovQ1ONFwK2k7EG6ZYCurlkMbX6bR5i1Z5v5zAoXtIX6e3SsQ4nOnwg68lbJ
	IX0+Qw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yr9mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:26:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd61df4951cso3951667a12.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792142812; x=1792747612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0mXq9SsEMF4c2zjn7YAZ1SKL/E/fKdDfWM/bk/8SfY=;
        b=FFYRAPDa9eM5K12rWozi5PIibkchgJ+ID6U1XQfipYnrF6fDlQHX/Kkds026Kx1LuW
         RRR01ddRTdS+SMTuW8DRemR4AufLRXtK08bcmVYMI/loK8AbAb0Ut7eeUxFCudTMN9UU
         yQpiX82zhbhsd9idjs9s6jXGGHjjOoYLsBsEApBPpJmaH02LgFFuR8CuoLtb3zgyiC41
         NN9dR090LPwI3VscjMoy+RY1N4YmOTJzHX4K6LG68mjp0mJpp7MIGGaoeb2PaB8RFK7z
         6WDOuwcCeUMsOsg+asodZ2Jb8botd8Z0l1xTjtrI74BMpGNF2+gttSZ+IQjOM+QslndX
         1PJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142812; x=1792747612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0mXq9SsEMF4c2zjn7YAZ1SKL/E/fKdDfWM/bk/8SfY=;
        b=jQIo61d0kXOg24MmaboWcWsl81z8PBR0YjpOWq2TrcEd4yv/pC+9x3IclHsB8q5Mp/
         1eJ3ohxBb2amz3Ct2GBV+1LUPyhBoiDA4aiX9ClFI4DuS4XfZPvK4cmwepS8cLv+4sgk
         NlJXhuRxelDJN5TmlzmQ5CjWFJ+W0aJJ1RVLegRfKoCmvmEWA8ctDA9Jy/Har2Z0gLBj
         cKKV6sYFHU07xZDNZyQbv+Quk0Vman0erKv8TS710DS5nwFXo9fakXuJxFEi0fl1aOWU
         6xPyCW9w5tDqlmLB5/kV9HBSq9BZBQCfQtraeJbDREZE0irI0x0klV7uvuAJSgeUdBGy
         dm1g==
X-Forwarded-Encrypted: i=1; AKwUvBymPaNSVNrhwC0pvTVpBYOFpM9b5xfYuIwrW7MAxvsVqzWo2/vDfr1ePQo5prpX8Eg6929tQiDy0Cos@vger.kernel.org
X-Gm-Message-State: AFq9FYJqi1P87uleb28LefkQPjkmyP+GhijbPAn7XGZfkPkjtl710nKt
	kwQ/2h06yLOf8LpWdqbNIuaSi5+Gj0H+7bcjUXJIyrm1xDKfk1VdcoKyGTKS4EziM5JTgxSpqWz
	G/pfY/evpfsPjyoPAp3I+bQngkNH1t3tZYP3ahO8Lk76Jphh0gWZBosOnYy9lclyO
X-Gm-Gg: AYBFou0ovbnSawD7SIUMHOPhDAEKdTeb19IGgiOODul2iVDET6CUgxtSCQihc7oSVEi
	PWUdTmwKNTjee4toy8iNdY9JqK9+p7uyW8T+KqoF3rvhCUxMFevwAY3gp2paGByqlKvX/wGKsMg
	nyodJMJkaZOlatM/Rskz1Jaej6vc6ps+qFGAmI3NDWhpCYBMYxUbt72Myhhw5CK1xdhrgwCkm3b
	UrEqXUzludnXq0PkvGpPm8K1EJZgdNDUr+DLB/jHILEUX7XbcUXZuNBUWFlLn9nb6rFQLr42PJD
	uuUoKAUSE6N7wzgo8kPXTBdO2304XJGeT4G2rMelGUsQclpPvQlQTDh1i/BPuHMDTrqghovaT2M
	ef3KCCIeJmGMJo5h9+smzt/0e4hyznw==
X-Received: by 2002:a05:6a21:2d46:b0:3e0:e242:5ff with SMTP id adf61e73a8af0-3e16bec70c6mr18001894637.56.1792142812183;
        Fri, 16 Oct 2026 02:26:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d46:b0:3e0:e242:5ff with SMTP id adf61e73a8af0-3e16bec70c6mr18001878637.56.1792142811682;
        Fri, 16 Oct 2026 02:26:51 -0700 (PDT)
Received: from [192.168.29.42] ([49.37.217.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b42b8sm738437a12.12.2026.10.16.02.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:26:51 -0700 (PDT)
Message-ID: <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:56:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
 <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
 <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XuaW3W3QSVDhOYLuNmW7BWzEmqqb1Kgu
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1eddd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=rThwyMTpgoa+SOOJ7TDuHg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=8k6WQxmsAAAA:8 a=uT7-Y2yUXYoXKl3sUa4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX7hJ0ttOV5ANv
 E6FvotRkMOasijCpHsU7Km6uwOUegHn8neG6k+6SUmwMMp+atcue38LyGQwHOYc37Hoo5fz3ZS+
 outnOROFYxN+VuOuyVATbWiUDZP0T4U=
X-Proofpoint-GUID: XuaW3W3QSVDhOYLuNmW7BWzEmqqb1Kgu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX6u8Nbn+Lfyvd
 LzCAAKpHy+zNPqn+J/cJLU6pduvIfUt3TFV+f/YmmidUg+VlDxSZ1ysvB03sjHYznSzn2/oX519
 3WOwU5ThIrRINg8CjydQoOHpOQXI8E8Xm2st/n+wtjlHbfF6zsRWN7OpNr4ACaf3SQQrhaC78qE
 HPMdvBCRX8e7OutuZdVSsA/zFFPTHSXgiuzdP1TUgpQVd0oxip2Ub+7TyiNy2V5tr5/CehsKCBF
 6C6mMfRvnj1SgYdnusHJophSWxdouCPNFjsqpS7ThE7fGIfyINQSgmYrzjqUYiwUkAAqC37F/h4
 lO02lgOh8YI2OE0e4hYXR7h8sDaxlYKpz1JHNwXXmmfUVXslefBIq1fc9QTvxCzmWrelIApK8js
 o+izhnDCGFZUHUVWjRUZmzp+MjLex9jqwhsh6GhFmIcyDB971cJQucTEGRUWiz2zpvQi0YG1V1A
 i/8j4Pj59GopBk5FLtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160037



On 15/10/2026 19:02, Konrad Dybcio wrote:
> On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
>> Hi Konrad,
>>
>> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>>
>>>>
>>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>>
>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>> ---
> 
> [...]
> 
> 
>> Thanks for checking. The only matches I see are in the MPTF thermal
>> package, which ships"883ROT13Inch.bin" and "883ROT15Inch.bin". Nothing
>> else mentions ROT.
>>
>> I also checked all the ACPI tables but didn't find a codename there.
>> The tables are here:
>>
>>    https://github.com/aarch64-laptops/build/pull/176
>>
>> Following the Lenovo gen8 naming, would something like
>> "microsoft,surface-laptop-gen8-13p8in"
>> (mahua-microsoft-surface-laptop-gen8-13p8in.dts) work? I'm open to
>> whatever you and Krzysztof prefer.
> 
> FWIW the "gen" naming comes directly from Lenovo's product name,
> i.e. if you go on lenovo.com it says "ThinkPad T14s Gen 7".

Official Documentation say "Surface Laptop, 13.8 inch (8th Edition)"

We have to create a dedicated board file for the fifteen inch variant
since it is expected to have a sd-card port and another one for 13inch
specifically to enable ufs. All of them will have only lcd panels. So
how about if we go with the following?

microsoft,surface-laptop-8-lcd13
microsoft,surface-laptop-8-lcd13p8
microsoft,surface-laptop-8-lcd15

With this is mind it might make sense to create a common
file mahua-microsoft-surface-laptop-8.dtsi that all these
boards can import from as well.

-Sibi
> 
> Konrad

