Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928419;
	b=TwVB0jlT/mdKJUKJaJR8m+DPz5WEN/WFVbeU/FmdPsh39SA642PIHOIqz9iHyrPO51UJ
	 fWuvcXgMiBfI30ziJ/ddzutq9wD9n0yJDwXYnwvgIB5xg04Nf56md8p+LRKcSAIw7lAQw
	 XPtCDBDHV07FQ7o6fC/TDEnv+Cvhps6JIyRqcmFmJBVaLk4OqmXfua5UNYXsiF1cZZkd3
	 LfgPJqGN4ePpoqRxuosCj6wtWy4tmGK+B1rLqWYCt7LQoERDNgvMb0Fvg5pRlF4G0u1qQ
	 iwJpSrpNlgoSAouqzpVpsfgMRG+c+9bR3Xc1cTMLU4ctkHqMq+nEesRgN45CTA3MDlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928419;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=;
	b=ib5FV8WucIT33YSXdNtvHGHFHAwRtJc+XYMrZQFiQamWFeIwCckqeoN5/LIiGQagZy5Z
	 ykTxkeLmAu9JYIieDx+yKNOQkibb4Zf52Na9+iCU5Glmm/8mSSp4GYniM6p3E4a9+9MH2
	 5XXnDjh4e/0gY2ZxkzZDkVb/2+1+2DDg039X86yDwF+selObc8Z9lXe+xOX7JJcuoHKMe
	 Nx7/CphGkFDsCSwfYiXjeflPhrjJufQTHQBNhHGMzOzCxoMb9ZIL50ofqNuOdIEPJvdHr
	 qukjb/YxEM9ws3YWrf5c1HHmF06ZrK98S7wYu18zhrdxsVenOtj7g2MvIvSPK5XkP0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hw8wn4b7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUhHkUfs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AB3606A32F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AB3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hw8wn4b7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUhHkUfs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1KLA541629
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=; b=hw8wn4b7vlXPbNBb
	3ELc5vkyLGpCe4P5F8dc1zRe7dK/4lxN75fsIwO/hK4FtcUyVCCCqbCx8Yxzomp8
	cl97GeEu/WxdPNdUJirMLnByyTtIN+XhzSXvRaQzfaWGzgplPkWPHYjadzykE0LG
	z91DkaELUVH13hueRYheUj97SmaUsKr3/oQ6J8Rh2QyLQr2EKjUjcCFKovwWOl/g
	okl4AhPKF6LowSkhwOZAFdTDjMptx29x1xFZoGliV3NVUBoWyIByij/oqCjixIwC
	63DsPZ08qxEsGqCOiL58aO7DbHg1DO5YY5FHVqKB32zkglAkrXq6cbihI1g5HF3J
	ipdeRQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd23d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:13:38 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac74b0596so2484876e0c.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794928417; x=1795533217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=;
        b=ZUhHkUfsm2kMROOMLXw/McLVLTUz3YT4yK8KdMHg9m1lt0s3isER4bbUPcPM5Al4lZ
         uWKzsg67C3EVj689qpAhhnXPXnEtiN/1C2Q4mp5IrzDwDkuboAnAtXkor+zjr6xb83bD
         aI/dJcrUdw2mSGa/oarfwifDxwUsjY5V6ddqN6j20UFi6Gt2abLSah2VrvwkYRvNwY5Y
         Gv5QTziC2F+cfhIaZ79jrMRZe89ekM0AGdK356oL6dOptzJ3KrWdePklK12oyd7u0bcQ
         xiDWTKH9ad3XCO06krGlluHzTljxNnCCehkphmrP4767FOiRCCnpWb+0+5KeX2sMRHVj
         TwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928417; x=1795533217;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=;
        b=P6MaOs+BUgV75O59aa1amzMZycqUFOKJn7qMQoPmLIpXCPQdDew0weLRwtNECCjMVT
         1ovAt+VaUIsRxDuP2AQuJI2G+0gtkrI4Xl80I2AoZAIPV7s0EWBMJSGMf4Zo5QE1oNcv
         VXdcoGDDXo8ZePOrMoliubqjYlFqJjgjEqnlTi+np27Q9uT6GHa3FjP1breCrDGawBPO
         v0C5vaJAhFUBY5BnKHOWH6kTVEqYAjIJUgGFNWFmmUaB64dy63vA6P5fqBsxDJej51P2
         iV9758s4aE+dupVEryVCUwIjohTAyrsbLxE1qAOKtpBPCAkaOP4icNFr4uCQtAGmr1sD
         BsGQ==
X-Forwarded-Encrypted: i=1; AL+hErGL/PrvwjwlUZkUltIndNZcX59byIEFvqqCDcngQQTVQGrOUi2Up4MZtngiRGBcQvZRsnDtOirtO3/7@vger.kernel.org
X-Gm-Message-State: APuU4Z+WGpcx/hpR6FtD/N4aJ/9DY2iqvHoDqG4wqCjsF9hNrcgBca/g
	ldjX5oJwjcUteaJQhkeiSbFBdlLdgPqRxpMFdc0TPPzu8xDofrxid2X1UXxho/TtK4fie7hnVVK
	Tp1Uz9FHrjXvj4zGdVAYPxos4svDMVcERUwfVgCILwrUUpthrIpNI5/DqsWosm69SrCVNpKST
X-Gm-Gg: AYBFou2qKYV1d0no1Y0bJ1rgnOdv4Br7+UPqyXgSPtqmfIjc16GdqeQ9PfGYqk7tZ/8
	GCxOIrkUFcsl8yoS3i5rURjIJaJHhoXtpZxsSk0k50l3S8kaKM9N0KgH8NqDSybnx+zkOYtDs4H
	JnTFroRkciZEgXjjsSmgjKbaMOwVqD3chfqJqiDg4AL5EKEjGaI0qW7l8jhDSQqlF+TrNKIPUAk
	/yY1iJTOSqT3Zg/nQkxHqSjMOqCHEqiC9iwd7v0qZhCTdfV7HEyFdDJEbwLMlkcKOmKBgmkVUuq
	7tztWLaXAH9EAbcY2Ezi4s0Bvc6HFF5Ds7iD485TLJgtGDyggEZsDZ7clbguBI3yb9WWrkPvZyg
	iCKdx98VdSH85wPG1w8vzmbwENb1fAZqd6Rv2zsTMb98MbM70jCyu4JRpMUhL06ZsyKF5eOxOxy
	E=
X-Received: by 2002:a05:6122:21a5:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee34a469b0mr5819007e0c.5.1794928417384;
        Tue, 17 Nov 2026 07:13:37 -0800 (PST)
X-Received: by 2002:a05:6122:21a5:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee34a469b0mr5818968e0c.5.1794928416943;
        Tue, 17 Nov 2026 07:13:36 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7840b05bsm108262885e9.7.2026.11.17.07.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:13:36 -0800 (PST)
Message-ID: <93acb3fb-98ae-4dba-a3de-fcf1772239eb@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:13:34 +0100
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
Subject: Re: [PATCH] arm64: dts: st: stm32mp2xxx: Remove undocumented,
 unapproved eeprom0wl alias
To: Marek Vasut <marex@nabladev.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
        linux-kernel@vger.kernel.org
References: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc6f22 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-9-fYqzskX8NnebTxdYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX5iAayY2yiSfN
 VOdT8Y/BaD9ZnCSJ7/t+ted7Kho7VB40Oa3hxLcpv5QrFe7kEslAJ57g28K0/+waojT+byQCHAj
 o6kqVmTSo/uXBUiIYOvNk1qAB/j3+DM=
X-Proofpoint-GUID: 5v4UhyejZdouX7tbXHHE9aezl5vcS63N
X-Proofpoint-ORIG-GUID: 5v4UhyejZdouX7tbXHHE9aezl5vcS63N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX2JSTsYyQAlpE
 L3Xh95XHjthbbZluSd/7JVyVfw6OQhsaZ/OXAkRbjv45DWGudopEIzYsCTemgxVKqQVdKYO4v2B
 X7YzqACUMHfrx7UnOBqTx08tQw+zNam5VgUteJ4tspA5/uRsrAwv5QSsdA3UPNIPpCQRfMPjl0W
 TJzlBWvJcZ6vzWJ8KhF2LqfJzuJY1BDgSwtjSFiNV4KiqI4Y5N7LnpFyZWQmHhNxIwk2NYwuzS6
 U1oAjCfS7Gng6Xh1/yVQ35V96dDwwhDuh0GLvteXfc+DwYAf/g28RExHvJzFaYrte3Tw12+mV35
 LX/hCp0ta2opIAZL7pJX4jQ5lF/c4OONlOOjt94As5QZVSI9fzOcKI8s26l6fxHWK2n0B+hZrEP
 9/cIG1c/1gyjaGHtMpMmCjCluvsHqMF/zFnEm109F+txF4z+rxh+ehZTlXXHoPLYdDnDMTNlKEp
 EFqxgan1hteUl+r8Xiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170060

On 17/11/2026 14:41, Marek Vasut wrote:
> On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
>> The eeprom0wl alias was never approved by Devicetree maintainers,
>> because it was never documented as actual ABI.  There is no in-kernel
>> user of it, although there might be U-Boot.  External DTS users cannot
>> rely on undocumented ABI, thus these are pretty safe to drop.
>>
>> No new custom aliases are allowed for years now.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>> index bcf63e2ea989..5795b352fccf 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>> @@ -10,7 +10,6 @@ aliases {
>>   		serial0 = &usart6;
>>   		serial1 = &uart8;
>>   		eeprom0 = &eeprom0;
>> -		eeprom0wl = &eeprom0wl;
>>   		rtc0 = &rv3032;
>>   		rtc1 = &rtc;
>>   	};
> 
> U-Boot depends on the alias, so please don't drop this one.

As explained, U-Boot CANNOT depend on undocumented ABI. U-Boot is not a
user as understood in Linux kernel policy "we do not break users".
Especially that U-Boot does not even consume that DTS! We do not break
U-Boot as long as it is about documented ABI.

Here U-Boot won't be really affected, because updating DTB in the
kernel, does not update the one in bootloader. It does not go that way.
It could go opposite, so from bootloader -> kernel, but not the other
way around.

Best regards,
Krzysztof
