Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB693A6B68
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863099; cv=none; b=NMdhuzxx//AspeEP67fDDpvNin0aJPtrPRhqYr71Ka8Yt8z2x8uag72WVdunzqAjEOEplnyCq9nUbZbE63Xt+L0/0h0LAr0Wh7H7fYqxC79PBldptnOYZuA7S6WqECNKppSBENapaZ9NdmX4rDDuTBkHT1PmHCQC8jY5K85Yi+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863099; c=relaxed/simple;
	bh=Uje/lb0LP0zR6TSRyLR0D2Pu8TUWJgrjXuMKENG683s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbjP23v8hPtIjK72pxyGCy+ydOQiwKFPYjgAhCqa346+ujIrzuTshfmQ0LcjBJHppRKkIgHcT6Oo3UcfwwiEn6LrckMZepNQpy7YSoa+Wz5KcX/6h8kETFegpIDExEEC3mwOXT9pqR+7bp9Ly+0toKocXZDFtdJYHYbiiNqutkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndwaexcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICSlxsyf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndwaexcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICSlxsyf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAcwGv2123520
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0wNo9oUApJdUS22sohODrRZpFaVdXd2aEq3iFjX8xo=; b=ndwaexcSYb2IjqOi
	6QgFa84ab5YNYy6Q91lMnn2vC82ZkUBLGEV6kBA16fwca4JtmD805v9DruPhuoCN
	gpJkcwVaNwA6GIj6eLwCDNBI8pzwSsGRfoQMN27jGPETxNp/QzowMRnadXQyB+KM
	gD2em8nGnGm3RSzvVrT6V2nWlrn9IiFYIZPRzAObgQ3OotMJvNLO98PPJKtJyq4G
	gMirSg3hHtAo+CJBNK8xRKUdgKNQ9+OW//O7Fd/Oh596aaBlZ7lwlkxqfD2PI3Mx
	nkPNILov75KBAz+XfMHaMLWpG03nV6jShchOgp+QCzmw3c+L4EohoNsxPfCOZtyv
	RWc8lw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfufca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:04:53 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4638ca66624so1337461b6e.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776863093; x=1777467893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0wNo9oUApJdUS22sohODrRZpFaVdXd2aEq3iFjX8xo=;
        b=ICSlxsyfUgs+GT6ycJLHb1jO/MiRSgti5ixFpkA0DIig1li9i5z8woHeNgh0oP3ekO
         Z5SReHj/qvs1+YG/mP7KLLOtBkdTXLtTfRUb9iTnbnJREt8R8DNGcugRJlt7tgKjyYaf
         oMoSqLia7aSoYJOo6M1/Y1J21uXyPJpgAmeayeBedp8lLFdhsKAOYHXl1tZUYyxgEgeC
         Z1C2A+0cVj+8Wk8nTdbcEWINV+1E6uCe3NpMbMxw+Oumc+WgvLWORsnoUMoOSNhJ4vjm
         jU4TahOUpgV1wseXFl7PrS4JYgjXcw5ecgNSQucL5yhXrtsooe+ugw8FSBFxGbvqz66Y
         q0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863093; x=1777467893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0wNo9oUApJdUS22sohODrRZpFaVdXd2aEq3iFjX8xo=;
        b=KlGgIRWobfwTayLVgrmCLS4GRyMFDCeVNzxdHKSYtV9JPeY7+zKFFeV8fVjdvBXKdA
         VLRdOCMeWCsSScSX606jZcD1rpZuG+K5FKriJb7sFDcNNSs12W+mJHJqgH5DBsdFo8R6
         bYiEa7buQLBhnf52lWjY/+EDY0z8mc9V6li3GVcpzP8jqQjAu/9ddmpWkgnuyLfrg4Ha
         xvqjgsdwd3C9VOcRhz2ZXzVCKCS8TL846OErjIuyzD/l3sbhDDQjGkJmNTKNtHLpTv2M
         RJwaqeQeOU05R9De/MgDnFuHUpa+2GgSj5tFRe7VzK3jjdqkBPj4Ptdgls699L/0jLQi
         ak5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9L3zyofRBzbl7hMOFz7drEpZe3ETSNDh9gGap2WY+zzbq1iCNutst2HslNDYSC+6JWWqYkTRz+seHy@vger.kernel.org
X-Gm-Message-State: AOJu0YySkObMkfXovhfPVCoysDUzUzqjkIxNo5O98vatWQNzxofW/yq9
	p92CD86kXEy5JSD5R/f6q10FcyH9rMYhW2d4pRSmRCm0fG8gXGqXsiGHTyDO2Y4m3VqkrsvPEDD
	1cFWztHUBTBwcWWMQZoLpec4KUWiNldQt8ffMZ5yp6gKYgclNyl5uCQbQbcHTuxed
X-Gm-Gg: AeBDievovOlvr9x6ttljEwAW0niNP2sOYE9xH+cKq0Cs8l8QbaS2s3FpBklyqBi3f7f
	qzrZ2Gdlf3t3gPhDUWTwnZ/TTD9J0FE1/mhI4bex/o+u7vpRa7Gs1Ij9e09diZsPBxptqaPi0N/
	PAEk4VtqnR7lW8Cq/iTvQQnJupNP8Qo7UIRXBqyzb2o16T5HWR3tjjR6CInkqZgMX5eqSzU1FMx
	TLXRRzvQ42yiR534MSPP9TA3UFRlKE+6d/533ZFzQKesMm/RMdqD+k02P+PWR9OLfUsJhOlNXah
	PguvLWjXdaZCOhuV55ZpyndckDnWHCl6myEw6/6Rg3jyHNMp5CBUCTYDEDkZJrJ7WurEfq4vBSf
	TQx9lcMj6K3dIn4cLtfwRwanuJfWCYocO55kdCiVIDg2Afyt8Fm7wTHduEf1Dz93707G0ZEs0az
	7li35TN1mp/AiWiw==
X-Received: by 2002:a05:6808:2209:b0:46c:e542:cc16 with SMTP id 5614622812f47-4799c615876mr6919277b6e.0.1776863092632;
        Wed, 22 Apr 2026 06:04:52 -0700 (PDT)
X-Received: by 2002:a05:6808:2209:b0:46c:e542:cc16 with SMTP id 5614622812f47-4799c615876mr6919240b6e.0.1776863092101;
        Wed, 22 Apr 2026 06:04:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bbb1sm534393066b.38.2026.04.22.06.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:04:51 -0700 (PDT)
Message-ID: <fd01ea28-e23a-4a9d-bfd0-fb5ad0b3d72a@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 15:04:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
 <82a32de4-82c9-4494-838d-48900dca49ad@oss.qualcomm.com>
 <8eef8d68-b059-469e-9004-39bfe44667cc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8eef8d68-b059-469e-9004-39bfe44667cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e8c775 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jWp9Vnr_aMZy7lUlAP8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: s9LLIDsX_JxtwZn3vRigoFedUWvflZbJ
X-Proofpoint-GUID: s9LLIDsX_JxtwZn3vRigoFedUWvflZbJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyNSBTYWx0ZWRfX8m1eKzVvYOrv
 kLGLujFTp6/8vOGqY+rvJvYjzfLsQiWXzNpioH9A667Nm28QrNSpXZ0xPln7z6YLVoyH5dwWVW9
 qJGTh7VXg8Sy+crJfHVR2ACxXUCYcmJO9PUesxRledUesXBWrrOyCmLMUJPKj81aUfsUQUAumob
 Mt7AJ15wCY2XnMZO/mG4B6kbY8Xz1EMQQAXOo6KfmkQtjZyAenuEpTqJU1CROol5WbmUwMD+cgB
 4cqVvfXG4bTpofU3tQ2EDSaRNWyNL/SVSUSABb+OrSfO0T/UP69G+83/FOOS0G5y3wMDm1kLveR
 5u+AVdZAA7LqeIAo3jxJEWdsF39qhk+hN/xSylr9hDm5TnizahjeLgvU/R61X+uCHm0fQap83um
 fc7017QZHrxSZjhknCPBh2PWFCpHwmODyLN1o9hsqkUXrr121uML5OMIr62oFnNg8IsfHHujt7k
 A6XUT/2hM2dgfgD2s/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220125

On 4/22/26 2:31 PM, Mahadevan P wrote:
> 
> 
> On 4/22/2026 4:19 PM, Konrad Dybcio wrote:
>> On 4/20/26 12:00 PM, Mahadevan P wrote:
>>> Add the mode-switch property to the QMP combo PHY so that mode-switch
>>> events are routed to it, allowing the PHY to enter DisplayPort Alternate
>>> Mode. Expand the DP data-lanes assignment from two to four lanes to make
>>> use of the full link bandwidth available in this configuration.
>>>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>> index e393ccf1884a..0c180e49816f 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>> @@ -789,7 +789,7 @@ &mdss_dp {
>>>   };
>>>     &mdss_dp_out {
>>> -    data-lanes = <0 1>;
>>> +    data-lanes = <0 1 2 3>;
>>>       remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>>
>> There was an issue with this on a similar kodiak-iot board:
>>
>> https://lore.kernel.org/linux-arm-msm/zjmf27y5i6ypba3nvsxxceuxn6yogp46lmtrjua37qa4ibrleq@4qv5s2wirgdh/
>>
>> Have you confirmed (through debugfs) that 4 lanes are in use when
>> running this on r3g2?
>>
> 
> yes

Thanks for confirming!

Konrad
