Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE05A30F7F3
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880746; cv=none; b=kDE3bEUcDvwZfv1eDal3JYO1dYxJsyQs9UtL8ncsIdgkjP4Yc+GqpGBjjwHfuWHsvS6itjAE1xIcK6r2WairhDp9q2kNCwo74WBKyFBr0UU85X5TQvbejp8Gec8ysjlUd7IIobIF6Ehidqv7SyESdHB+MRQqSGWesFQVKTEcSx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880746; c=relaxed/simple;
	bh=/NX+up7++QBsfX+DKkSvYEgv8gH3v/yxVfCr6DOJpno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGZYcUL9mN+lnnq/sz/YXW4kzhOIennnBPAsxYPoeOmUBBywaTpg/H5GRgXfiqFrlHbVR6FMzJzc5+XemLLTwDp3XaUic0+UGBtxjMmpr9phCyG1YWGcuLYW8pDqUNFlOKnYkuUMl1110DZUyaY1ag3GvbfNCyAMUFu9o+hgJ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfGwnj5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhvaUY4M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfGwnj5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JhvaUY4M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DNti875835
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 07:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FEhjnVz8B3YbTK0kWp6u8teq7DGCVzqV0sQmkfjGa0=; b=kfGwnj5PujYZ3NxA
	XVs9AaHavli2R/NrFOAeups3Ah/W9UJhAQnunglsHgdt78u4aCTIEiXgoiN5IMs/
	4xVBz/psEr+cLbsp+hF3cxSkb0C+VdO0x8wD1PutYG9vmNpM7Xns32ODjaLNbNq0
	IGUNkXgG6Z1OuoS5Jnnxq4oJqyN1mqndUAmFgSDRXEosdcehmtLQMebQTR1YF2nr
	GG9PF79Wd3QkfiaHAcjs9lenN3vcKdPQzXD0/rUI+le8+TYsKKDpLS4vw/vjQqoq
	9wDSmu5fK0uKqaZsRsyu80g6UrjRNeC8ZxpkGMkFcWb3w2PRocmgjljMxVdDTj60
	gHzRPg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1emqf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 07:45:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa366fb79so4125426b3a.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 00:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777880744; x=1778485544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FEhjnVz8B3YbTK0kWp6u8teq7DGCVzqV0sQmkfjGa0=;
        b=JhvaUY4MH5Ful8gNW90AIExiEZwIhKxj7l8bsH3e3e50nNyTVIIfWLx3MJeuo2Zy2E
         AmSpi0lwQOd2mJQzMa+VkXXhOIz+J5ANDHJl0WqM0JjiWEUsY/rmBdV8RK3PADl6S/qD
         cpEPW7Zbbju/6P+N5Hy+pQB1CCuFCdCJ5Z8A0vKDABFIU6orof/mKCR80sqgLv9Uup/x
         GieDmaRO3z/qeiV6Q7pW9jJRmlpQdqrtjrW7qJsPIU4jT0rOPs+AE1yqC+rGvcBz6vbX
         eWq6fIOmuJd6pD1RhAFq5jeNBZwFHniERg+ZguY8G3uoPmliyCwWEqCOqwJlS77COCAF
         2leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880744; x=1778485544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FEhjnVz8B3YbTK0kWp6u8teq7DGCVzqV0sQmkfjGa0=;
        b=RYu29loKDDywgs4trf893dZV5HhAXzL2NPFMggFTNxq24HRnK72NUS30q0yrdWPxSJ
         LVLRzIhO02B1x8yvxpmx1kjexTpa6UoGNzunwdFPwYwisW26xnFQi3tLUW2OTVcCFidr
         ELHpyJvWIsIbJYvkgxTLe2JnbHBTJRmUmHVh4v00Tvksu2K1KABT6G5lP3qOTQi5tpNl
         OQ2T5WiUT+XBCUD6j11OQGa5xpmsCzOrxWgfSBEoi246zbpc24xJTj7C+QCEGHQRP7C0
         ynThDGI6sqgO6+IlGVnT1sgnFzHEdokSRG67wVAhu4gRaFYD92vM+Wz0HmcEJkWwcdBB
         lmRA==
X-Forwarded-Encrypted: i=1; AFNElJ+OXHnNAuiEWeCjgGmTiw9DTnr/VuO0lVm4IDt3CSM5jw2k05Uim/q7DT5SWdav7TefJG3tshn9va8E@vger.kernel.org
X-Gm-Message-State: AOJu0YykQ8Fj40o+Nmn5G4r/qZ1YHDHs3rLa+exNryrkRd4eqBr0cqlx
	K6pPiIdKmaH/DdVPK52aGbWa1VNoiMlsOsZ1ENhqnN0DJNAr1k+yZJ8i5ag9jc3Idxtcb6mzEJA
	BHLWWpbCtLhJ58EWqOTh+Zukiq4c5jPr0HGAaxqh5KXgld2fhma/R/j+1E3hTleDS
X-Gm-Gg: AeBDievTtbWe5vcQQm1BDp2F2XK4BzB8iAk1GHTE4z2vWhMHlqoFcwuYWwVwSnem3rV
	0c8I+R+kF9aFsHvKieBEtw2SE7A1DPslaWZkNyTlVNejJwxP9K0GVu/YIeTi/RQWl0CZW0v56dY
	/yAzQ413HcfePe9H5a6S3uGIzQx5YATaLpl6NKfTyk19lg6iDlBPn0s8Q52OLE8VFDa8mssmOHU
	ZQTm5k2yJIWvoNFSmjDfBNw/zzgT/Ri+/7/WILXmBxamizMFoxS3iuV55hD+BEccC293a7YIWhG
	6xzH/37NfyhfBWrYB6bFuVooRYpT+MMb2hiG4HxuLazgEisa1Zd1f3/Epm10yfmjZZcJKHrJu1J
	xx2VRhAaFVzYS1xwP7gT8ziEpd2QgQPtZ/OknXP9kKig58zjkdpYFEKkbzBs=
X-Received: by 2002:a05:6a00:369b:b0:834:df57:9d6b with SMTP id d2e1a72fcca58-8352d28bc1fmr8161748b3a.24.1777880743574;
        Mon, 04 May 2026 00:45:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:369b:b0:834:df57:9d6b with SMTP id d2e1a72fcca58-8352d28bc1fmr8161727b3a.24.1777880743078;
        Mon, 04 May 2026 00:45:43 -0700 (PDT)
Received: from [192.168.1.143] ([59.96.95.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b543b0sm10299368b3a.53.2026.05.04.00.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:45:42 -0700 (PDT)
Message-ID: <82bf6986-f3c9-487e-89cc-366bdf92022d@oss.qualcomm.com>
Date: Mon, 4 May 2026 13:15:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Document Shikra Top Level
 Mode Multiplexer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-1-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260430-esoteric-badger-from-hyperborea-1049ef@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260430-esoteric-badger-from-hyperborea-1049ef@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jvJLqMA4jf5U5t86umUtI3JZh2UhyF5m
X-Proofpoint-GUID: jvJLqMA4jf5U5t86umUtI3JZh2UhyF5m
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f84ea8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=d18XUvOkrfNYrh/LwM53Ig==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=2V555Vb6lIzm2OLpEQsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4MyBTYWx0ZWRfX8J6sz+7/R72N
 fni9ODy1Hs+dyhncSZEG4ctw54pHMMsAdGaA/cZtUs94NhDZVcGO7o2ReByKrkblPTvtAze2FOA
 iga+LFONz8+mRizOjTFQz3xdZIySgSra8Nmiuy8OOhwWkhpBIkYsizQygcq+gYbdy50u9IphfWe
 j0uFzbYs+wMRas3L2WfaLmPD468g9zQXdEQdzfUeXMbiC1GjNXiiPaMnt8a1RtdnQnyl0xbTlRC
 o6DX1+/ztTtjn09n6XLQ+j6HoQs2pzIxrZqe3k3swzfomW9wzF1IvuR9aU50uJJ+iFdK1RZHPKB
 G/oOLD5009p/S3Gl1KtX4pUW91tBpRYb0+za+TyUrYcfRdkANH7DqnPNmwaHJDWF5CYLJHa9utS
 YO8PnQyOqrHssPMZ6k8eC40keeUMOu+VjqgZYJrDnl3BrjwcikHm7GJqB+sj2BIVlrDsTWXmcl6
 BV3Yqp8meKNjjnbOebQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040083

On 4/30/2026 3:42 PM, Krzysztof Kozlowski wrote:
> On Wed, Apr 29, 2026 at 06:41:56PM +0530, Komal Bajaj wrote:
>> +properties:
>> +  compatible:
>> +    const: qcom,shikra-tlmm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  gpio-reserved-ranges:
>> +    minItems: 1
>> +    maxItems: 83
>> +
>> +  gpio-line-names:
>> +    maxItems: 165
> Further pattern said you have 166 GPIOs.

Thanks Krzysztof, you are right, it should be 166. I will fix it in the 
next revision.

Komal

>
> Best regards,
> Krzysztof
>

