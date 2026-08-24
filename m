Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63923E7179
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553917; cv=none; b=KDmdLWuYNJSd3sm5svvqWsmfJxgnOChCXJdvHfYo+W5U1IeKh4I5Io2t9gRvIfTwrh5vR8KTzcMQIy1gedtKvY/KGmQJatJycHJLPOdm2QpOsd4pjVzejQLjXYEc1Mht8I5gUSJ6iBeNvdGYrRahnju7cWcseWQCDpYAOKWZlBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553917; c=relaxed/simple;
	bh=WZ3tJX+yLmLG4/RcMOs4NAbfrXX9rM/iECf9M06v8qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XEUMosSISFU1uRvsK3DF2V+hcY39sLFKFAnfo5RlKAxfuEPdgiPk79QACN09wPoUT+zVBHA4D0A96wpbRjcopPZswyI6WowwmdJFSfZOAOXdyUEtQgi6/aQB7Ywi3gc5M+Z6MPhf69zBfZUPjcU0gNSnuPJW9B3feiOj0kyAY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pY7CJ/AC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdWoN5T2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pY7CJ/AC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdWoN5T2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5Qx522041216
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCM0rJzRNUvpi4o+b/ryRKlYNeynIIXpwQqsF7Efo6Y=; b=pY7CJ/ACoRLKcOc+
	pLNfV+2ApxikdhRRC+NUcJGCyUb4skcC2pW8XTlolB56YQse1eSznvotqM59r924
	pmmPVexA2CNmizTO4jdACvYmcn+xv9krvf171gqcpbXcFFfDAS0No7JwuV327eWG
	yccJE+2wlJeNrQLFP4+hUxCDmByO7DPoN8lpo58nGXH4Ti4nC5/B6rL8Ijk69Xfu
	t1nXidK39M3j9Dz5+FDf2Sum78KfH4l1kjYTYQL0HKlkUNtkB+dfWVs1oV4ANh3F
	f/Rug6obIgJ6GgGB/o23QKhxCxgO0EYhdYXi2ZYGTz5Y50/iCDfhmhLUhh2NLpVW
	AD71hw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7h76f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:45:14 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7674812ca4bso43853137.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553914; x=1788158714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCM0rJzRNUvpi4o+b/ryRKlYNeynIIXpwQqsF7Efo6Y=;
        b=NdWoN5T2smh1YWZiq+uzi+Sh2Sa4MW1+2zuSSRFdotwLnC3mkEv2a8BYLIWns6mBXS
         yTq481SPweHaNrJpDGvnMscFSkXuiMyIV9USauiGBnRlIXgVM2o7rHyy5PZ4b9ztW8kf
         xwJ94Z151oeJFBp1wOrWYfItpqTSm5sZD8d4r3CHU5ZUgsmlOrnCb+3fLExo6WDrSOM2
         /C9YIOzNfnhfWh7H/v8YwpJhG+WBBx7kSwckv1SFDxA6QhSvqMbNo1iNEhT4bXiuBTle
         y66Ix0ldDcs/T9UqN6uT9L/8Xq5w7+XSZ6ARBtMPunRhjYahpYfDBuQB7Sxm1rnVNn1T
         j9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553914; x=1788158714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCM0rJzRNUvpi4o+b/ryRKlYNeynIIXpwQqsF7Efo6Y=;
        b=DYfIm9sPQ9UX7UBnBRAOcBZkdk2sUuCr+6UhT1HCj+WF3ehiDnIoh3YYDkAHY1BExc
         g9BI1mctNnMSxKK5zeQsmOKCuEwG6WpeMRyiWLvZARvvF62isCzasyPDWoQrlA2bj3t3
         DN97Rnx+wOTedPiZrfar3A3hoxy4jbGsc22boa68p0zDKtRQoigvjNtSoAOg8db0fD6M
         MkYPYaUXtkPhQh2C4VTaa4eMT+OMwniwVvRmHQJOIlaKwL6VnvGamUjdWVz2WOJiCrs1
         lPMUhC6g8Uk5BLWWivF24/PCDDjNanrC7EmE2CPBa7shBmHpc+ZIyauEtpeV1mLNgx4B
         RuZA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2+vHMmOZkdJZ9xoi1MxmraBzdz1WNIp7bqu/A0Ur2OtDag36LVdfTwL08OjzLHMA7YuFxPu6ZzDPi@vger.kernel.org
X-Gm-Message-State: AFuF++m2+TtKZiMvupseCz5rG7JcG4pev7lMCmJcSx5fVRkmlnRKNtLQ
	GJfe/fSglg2sMmw7TiFvAJsjaHIyFxNNgSswaQo/buoSvWNS09U6fCm4onez1BB5qWju9fRbQjl
	aUDA4h+OWFOkIQoUDRTbUdHZxlMTxWzjaS+sRm/J+Ugb+0svO0ZHOv515sEbKCI7w
X-Gm-Gg: AR+sD13+2j8edssQhAVynKCSJCb5scsjX80vT8pkBTtLCb82Z1MdWFqAJKv/jwIwWsM
	pb5veDA/827/vKBQMUy/EH8vkS8andjKfbVJcha2zcrFMhc26LiLqf3a7TrwejKg2A614JAXhUS
	bf/wWtyH0YhupQykqYEnPtHhLhaoWsUrJOBXtMIuwnoIUXYtQ76+29+CjUqxm7ohIXdlLChmHF+
	HM8zZpfpVNZYqb/6v0ECmllhH2XPVGxAdYDzT7NK/qdijsiQ1ygY7axKnyIkH+4BhsRyMme2vvh
	7neSatD5EXLj+iZrvOrAZd+ihJwnFVLlmC2MRlIqjjpBefqb4zJWGTnvj4eMhmdzoSn8Sx1T1PI
	NCu19mEv7N8c+OT/PBcR6kZ4b
X-Received: by 2002:a05:6102:6893:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-77a643461f0mr3448821137.1.1787553913896;
        Sun, 23 Aug 2026 23:45:13 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-77a643461f0mr3448811137.1.1787553913450;
        Sun, 23 Aug 2026 23:45:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm8250933a12.1.2026.08.23.23.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:45:12 -0700 (PDT)
Message-ID: <dade4f36-e79a-4196-be4d-ae88ccae04bc@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:45:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7325-nothing-spacewar: Add ath11k
 calibration-variant
To: Danila Tikhonov <danila@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
        Vasiliy Doylov <neko@altlinux.org>,
        Achill Gilgenast <achill@achill.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260802133203.259734-1-danila@mainlining.org>
 <2a11fedc-94a5-4709-871d-c63c46d0106d@oss.qualcomm.com>
 <6933112f-dc14-4c3d-93f9-662c36987786@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6933112f-dc14-4c3d-93f9-662c36987786@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8be87a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=Jfs0pX_hlHZ1VWsObv4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX+Pfl8XKRT9Nj
 lVfRbKgNMX3nMEBekr+FRLaq5IX3xYL2YEl3dsSn8B8TZj+6EZPLLSp0TAMi5mq2tQ72NMeo77P
 0Q0Cl/ZAMK2HQAtT5B76Rs7u7kncOKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX2nwyot7+bDOn
 EMP/j9Yu4OgD3c8zt8QHubUkBO5/fAhG+hiXHUHQxnt9lbycp+h9PDA+aVYCZLSNP/z6QGV/hSi
 20uAw06jVBeZgGStkESLXUZXj+6E+j+enUHr5hwrGnDO2t7yxEw3/4TEh0TqVl/u3nmJdfnMUc8
 FJjRCInZ1Y5dUj3ALKUgbndAa8ulnLIDF+YAPsDzquk0LTYrBbukiF5uxMAfk9KWsHaRspTmVOw
 6ixtFEtzE+hJzIiXQeFPMpKQkp8wjwxlyzlL/i/cupwgmq6pBymZGGkHuClWCEqAWxpqS2kXCae
 QZ6x6lV/I64K5kBb8jlQgskGeVGgwAry2/4kaMqY1yhzVBf+Aot4/JfvKFo3tF7qBx9lwN3WJ8k
 oJgDG+eIY5zlXq4kyWuOfxQYoG52Klkudpoqx/pgrR6S8yqcNXJs3iOpIWnGDfp1yU+ScXTgK+P
 MwivSQrJt/Mqw/u3+OA==
X-Proofpoint-ORIG-GUID: NGG3uXfn2MKXCmmuJqPFwEcJfhnpKFfo
X-Proofpoint-GUID: NGG3uXfn2MKXCmmuJqPFwEcJfhnpKFfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240057

On 8/24/26 2:03 AM, Danila Tikhonov wrote:
> Hello Konrad,
> 
> Thank you for your message.
> 
> On 18/08/2026 14:49, Konrad Dybcio wrote:
>> On 8/2/26 3:32 PM, Danila Tikhonov wrote:
>>> The Nothing Phone (1) has its own calibration files for the WCN6750 used
>>> with the ath11k driver. Add the calibration variant name to the DTS so
>>> that the appropriate calibration files can be loaded from
>>> linux-firmware.
>>>
>>> Nothing capitalizes its codenames, so the capitalization is intentional.
>>>
>>> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
>>> index 1e78a42062c7..85811b5de4af 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
>>> @@ -1546,5 +1546,7 @@ &venus {
>>>   };
>>>     &wifi {
>>> +    qcom,calibration-variant = "Nothing_Spacewar";
>> Have you submitted that variant to the atheros mailing list?
> 
> 
> I just did it and sent you a copy of the letter:
> https://lore.kernel.org/all/fc1ce95e-f3a0-4534-a315-b091d389197e@mainlining.org

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
