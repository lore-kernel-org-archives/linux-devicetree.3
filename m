Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B286A3446CB
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305389; cv=none; b=R4lo1YrevMzpJLHuMHHsjWkfBKWBb19sM6QVLQYDIJd6sc76fibSUeubUNMiANm97d32ypCZjT0VcLKWn/Hl8rv2v66w/JcHK13nDP5/Jgv27OLX6MyDNLfYAcdz8W1gRZLZE+4e7iiYDLl2IW0QQV9n8n8B5aC8yXnFftLKbl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305389; c=relaxed/simple;
	bh=jV+l/ln54usxG9jh8frPqYQTime6OgiVuwvA3I9HJKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Moil16w0+PkbT5dfz02jihpC0qikIWrSs01qZQJuzA60iWG8viUQi96KYUoCrEKA44V5yBBo5I7yJc8m/rA19EcBZtspyXJpX5xY5XWI44vb3eXfe3Xf8hzEw9T1Nex8Y2FdPiWPlDfTtwWpSqLh1S6YclNi66S+C5mE5HQBqVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FkegNzc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dieBFE2e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FkegNzc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dieBFE2e"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLGYY440351
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6SGrR2X6GYsOw64vZ4A03N2KgXAQ6MkmwYXMLDZQDyY=; b=FkegNzc7Xd+n1am/
	NJ/pkpRhmYVcdA97E2dR6T+6NBBM9r+bu+1fw1hbHsG6R2mHFPZjF/DeMiRVzgFI
	+geG9ANDvg97QXivL3uPGzrtKHkrqhTTNBtPGkOhsG/U4JjpmTxnKCRP6syLfpm9
	uMzqTYlDA9QBTmBOI+cKbdPSL1Yo6zurDXNsZQmN2h8BtSYY76zznNRE+zRNOdL8
	ZmRixyWChdgI1lmsZnJZLUFJ2xVviLl5/6hoozOlHDxS58NAZFh0b0PWuAltYqiX
	SJ9TfmW9hcCmCMsr6it3+ZFt4HeJ84hu6DW//F2TTBl2RtaZm/dynn0kg8dO1QY0
	Uh5fLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac4042u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:56:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3c7b989so117292221cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777305385; x=1777910185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6SGrR2X6GYsOw64vZ4A03N2KgXAQ6MkmwYXMLDZQDyY=;
        b=dieBFE2e5+KLx2J5E/69sMzcgvwN62n1Sxjn6DvWng1k64W9NL2FdgkziE/vqrHrm0
         ArU/CxEpejlDSvTaX6ltLOHuNRgInkYyK7F8FkWW31AzF1UR5U7hQa7fSs8cP+Zzv93w
         zMFE5PZtxsbM0AUoaFJHlepZHg4BXfkLnpqW+MVxtf1stdc+hCylIYDu/PtGO7Th/p1B
         JJ682SLaAEm9+Eb8eWwo0b7KheGkJW5uKwJr+M/UqbR8EFpn+LjZtM1bF0f5P2jdNbb4
         6+8GTBFUMwbqM/XDGC4GpvyWNSqEtOfdHlH5hJlJv3g/NSVOP5Yv64ioikRApBz5oybR
         io7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305385; x=1777910185;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SGrR2X6GYsOw64vZ4A03N2KgXAQ6MkmwYXMLDZQDyY=;
        b=Fl8S1Bjjoi5wupTeJQHv5cu53rnGqngPbX250WwlgnB1nLpNPVXliOknn242Wtoyz/
         hSCcXD0x5BIFVUbKN2c9QAfb1JfDBvphohekcm/4GUrGcWYMGPgLenddI+Ihn4ASUURL
         5mWRH9dkhlddO/PbzxyilPD+C4RBO1P70ead3CpcHXGadExzDZOzEYJ6uR8GI7ZH0Nw8
         diKvdRjTB3jPVIZFV0SAVkv3DdV1vG60D3Fugod8SFywIKjMCByDLkxcaK8RUEULNdhM
         /RtGOOksWVWfnHAwzm68KwBWpEklgKqXKrrGI0GAYyR0bIX7Q/YJcyA3VhU+3Aa/kcYN
         WeXA==
X-Forwarded-Encrypted: i=1; AFNElJ/zbREjM4GvfR9/VwaB9VvJcmUZcWPvJyW5jgdsFpujBT7KQ7NiULd+0erX3EYwGN5KEKPM58fNI+eV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Xns65Fk6TyjoqWaTbr8+8VkiWK2J+rSp/AOlaf5ze0fYdLne
	tDBRB/HAJWBCt5j/YcWlZPqFU+WTKUsjDdfUfsm1/3/LspUuW59V9UKI2UPsC7KTRQAxL0gC9/8
	N+XoCxAm7DW7MdX9HJoXTjzs0J3ZZ0E6vr3EzAEnVRHRrs7PfmuwENCZWZ6jatnEh
X-Gm-Gg: AeBDietbTrgD87SncS/CM4qs7420/HiarI2OtR/HjjfYEgctqgVPYHSx2fLwT1LeNgD
	FM8pc5lZ4YxUFflx/fZWm4tTmL9p7Xy5X/0qdtidN6Z1+YRY32YVejfdbRTLzUi6ww/gj7oX2Q8
	6uEanqaY8D/ZBp4Vw7mHru2f52MYrBgvCKqCRYF2C1s0+7/OaOKCEjiJwGP3Ta/gXWyAC2DVjC3
	bT0qC5rGmqQiqI0YAFCjzzUFbzrFeua4uq/uTIH2IoUQeqiVN5WVsjl5WMd6oNHMaUcd2jiVzs7
	u2D6dJptd4iQ4HTjV9oaba+s6ZHF3V1NljjeXXY0jjAmxptw+4l4nrxQA6/YDY73tO/bTQK+new
	EXHK8+Jmqlopy6tM+9mBkPRuWanlf7zFXEd/MGCtYjNqpy1s54jaELBVm/UXF
X-Received: by 2002:a05:622a:5149:b0:50f:ae44:515b with SMTP id d75a77b69052e-50fae4453cdmr459417201cf.37.1777305384883;
        Mon, 27 Apr 2026 08:56:24 -0700 (PDT)
X-Received: by 2002:a05:622a:5149:b0:50f:ae44:515b with SMTP id d75a77b69052e-50fae4453cdmr459416491cf.37.1777305384261;
        Mon, 27 Apr 2026 08:56:24 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8188sm862967375e9.2.2026.04.27.08.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 08:56:23 -0700 (PDT)
Message-ID: <7776a506-62d0-4cca-ad36-70cae8573ed4@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 17:56:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: dt: writing-bindings: Extend compatible fallbacks
 guideline
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415082113.22775-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260415-rinsing-pushup-ba81cc249086@spud>
 <20260427143750.GA2491314-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260427143750.GA2491314-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3McvJxR17TFi8EsZQU0iGmuAHAshBKcN
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69ef8729 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=r1NGz-dz-RQI755fX4UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: 3McvJxR17TFi8EsZQU0iGmuAHAshBKcN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE3MCBTYWx0ZWRfX9vyFdLeMbGHD
 3plr1M7UhoBPiJD+YOiCe/npcIVRA3xt1abjzWqrV8Vzyrdf96PMQQtihDrhPzercrVZyuRpqQ/
 5fWkT63qjXwYo+soGCCkxzT6INavAvKoAy9zBlEgHgCJW3S0ryDgacBssR18CzVPihxRg68PPol
 UmtlpCMwZmJnGb+38INeTQnHsC1naNrdQDWJTLWmkehWfHD2rC1yj7XA1v+NDcHtTa+stZd34Dg
 spUM325HoLWEF7HfQdjmKlLZaPp2ueqaTHcD6+R23u5DuHrQOFhhkIF9WhNpTWKm54ZpxcdAaUK
 zwg+sYUHkr+MteLlGjQY5tUTVkVIztl3uF6TE2yZAu4p5Vb+gxkKVpSle1+7ke88JUGDEfTLVfI
 Dml2nJ/+m6DhYfaGo7nzBW4I7bKcVK7TLAf6gxtajC6tE/+zGnmXSyjF8scqbvN1XjXeGynaj/A
 zwvuSmYDphjRPwoT7oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270170

On 27/04/2026 16:37, Rob Herring wrote:
> On Wed, Apr 15, 2026 at 03:46:41PM +0100, Conor Dooley wrote:
>> On Wed, Apr 15, 2026 at 10:21:14AM +0200, Krzysztof Kozlowski wrote:
>>> Extend the guidelines when to use fallback compatibles to cover to
>>> common review responses.  Devices are most likely compatible and should
>>> use fallbacks when having:
>>>
>>> 1. Compatible programming interface, meaning one is a subset, and Linux
>>>    device drivers can use the subset to correctly match/bind and still
>>>    operate with the subset features.
>>>
>>> 2. Device variant discovery through some means, like registers.
>>>
>>> Devices are incompatible and fallback is not suitable when that
>>> fallback cannot be used by the drivers to match/bind.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>>  Documentation/devicetree/bindings/writing-bindings.rst | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/writing-bindings.rst b/Documentation/devicetree/bindings/writing-bindings.rst
>>> index 667816dd7d50..03e29e2d50af 100644
>>> --- a/Documentation/devicetree/bindings/writing-bindings.rst
>>> +++ b/Documentation/devicetree/bindings/writing-bindings.rst
>>> @@ -53,7 +53,12 @@ Properties
>>>     - DON'T use wildcards or device-family names in compatible strings.
>>>  
>>>     - DO use fallback compatibles when devices are the same as or a superset of
>>> -     prior implementations.
>>> +     prior implementations.  Fallback compatibles are applicable especially
>>> +     when sharing a programming interface or when able to discover the
>>> +     variants.
>>> +
>>> +   - DON'T add fake fallback compatibles when software cannot use such to match
>>> +     and bind to a device, and still operate correctly.
>>>  
>>>     - DO add new compatibles in case there are new features or bugs.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>
>>      - DO use the commit message explain why devices that may appear
>>        compatible in a diff (e.g. no differences in property use) but
>>        are not compatible, are not compatible.
> 
> Can you respin with Conor's addition.

Ack

Best regards,
Krzysztof
