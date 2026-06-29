Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F013B4EA1
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726852; cv=none; b=a35ib3zvvefpcI229ngQ4wBTosse2rQFnYbzaT4IjfdlmBWqJJlwvt3zBm94wiqhIcfduwUzf5UhTNUgmGQGVkJRsNYuAQBu6NjrNegY+NIboF8ie3hK5FxhuzIKskKt27dRjZWLu3y0gEQt7IbXRfvHMkMDTGtH9INMzdoFKA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726852; c=relaxed/simple;
	bh=jJs5HXjAjE6envyfFgur9WbBH78XFXKLbcwrpOB9mic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meZCb5j638igMfn7981obJV87k6IZ2LW1q1+SoIzOtodnq6lWxjDhaqV73aIQR0u6ELx5mFdoSBuV11bxmL9UOGu9BORTJub3OLQ+Ob2mTQhCRO/InHOg2Nd0wD9JC8khP87VsvqFerYMVTe+CpGEYg/8Cus17NI2K1WhyUzsN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xb9A6/LA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpD9EOf1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xb9A6/LA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VpD9EOf1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aQmU2368171
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EBxu6i0uZX52gkc9fGScK0SejhMq3Ms/srPUAHTCOKg=; b=Xb9A6/LA+P7zO6gv
	TSHmWreXsuvxIaqNcikwvF5e64DLIRrdk7LaD5QdaDvOsfdkuo3dzdSZIvqH+1pJ
	gfdeltekerjusw2Oew6EsreXon0+bvI7KXOomzN7BNZ4DQYcrfJSUKVfdcejY62G
	Z8uR9ZDwYTMWhs9dNwN0dOgMNkdyOBeQR/EM5IZ/FXHwAXo4DbVZbAF+Cf2Za/jY
	rQzfd/NQx81suVRQykNd02KLMigk3qjFvCEdKQ64FZPOrw5UFQUJz13bDugCHhcX
	xkoj+TiZ4dhGCPm7ynlV8IkSNxEjDQ0mEu+Nurr0dsJeta2bQnB/y9RHBLCj+DcA
	GbUqOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgra61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:54:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso304491cf.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726849; x=1783331649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBxu6i0uZX52gkc9fGScK0SejhMq3Ms/srPUAHTCOKg=;
        b=VpD9EOf1NbxDuuJNI2zqKyDteQ0WyTsLZvLKPfURH7vrljlFKHrjMHvoqloQWztUdr
         bwV/3r6Mj9kg3hIh4wf5BLG+IvDePya8PKkXVNuLwFmtEp2rp1RSNinY+yyeH1HdpMjb
         KHSYNe+TXEWXQ77HEa8csDDCN09xZWRMlOeRwYS8odPp2I5Ev924uOQqoF2Ovtx1EU8i
         hIzgxs1/Yeo5las7+RujzTBv4MJ2yX4LjpJZ1MSCw8A3GZmjyyMLwi5+hB9XU2Ig9OLz
         geEsZdbhzC7cm67UovaRCaDq+KuOOikAU7XJgDrOcZzxoJD+5sCHrjMcJdrRbfsjGnhJ
         QHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726849; x=1783331649;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBxu6i0uZX52gkc9fGScK0SejhMq3Ms/srPUAHTCOKg=;
        b=K3UNc+6uQyf7f/UFUKNodd94iPESGLWDg5oWcaVOkTwLcGt5XxkPU96Aic5C8kdTkd
         QaVhG6Jbryg9y0BaH7GwZpQwIdST2D0ikXrYQMRLibjFLrk8OHkrFPvCONyif22Nzk75
         4n73rTaZ6JorahQMCkmW8kifGMIJL6dfMpevV/XY7rQj2i2hjGO7F7M7tyZH97dZOfBv
         a1JgNcOw9EFHH3QwHbr+fvyRCQRs2/KTe0BVZgfBPe7USaPt73EqcRQ1edMktBMu1Mu7
         Loy11uI1NU3E0GJ9zKpdnWtd/u8bWagG6sHUDKMY1fut9D1W88tQ156z2lOLZJ6/HOxT
         +3CQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eVOwiPz3dM0r9ohb2XMX8OnJic1jcvzSnDiUW9NR6tpNq4HimPHbbHu/lf46y/+0tvWCVJWoLXzZ9@vger.kernel.org
X-Gm-Message-State: AOJu0YwwcFmTy+dkszL7e5MiwWkDT4nYX3Qq6/WvWt4rz4es75A4v9Li
	JeDD76A/Hlm8ufzq8P9Lvhq4Y2XzUzYbGA3NmDK7iT3Fk7si2Cz/XgmhAKlrRoOimAsY8c4Iaw1
	9fBcAp8yHMsqXhClg5hUCMlJokEwOW223ZwQOkEBA4N+H99kPe+eCWrM+v1M+27BG
X-Gm-Gg: AfdE7cmHUpujbfbtlUdMS9wOWTPzoII03tr0Nfd69OWHd7/VS+HKmFSEdZYV+lN1teb
	00e6T9SgwPdowDeWsJg8ifA5D7ywIYhk1D6MYcw9I7+C/nD/Y0yBoZsYi617VizsGGH0+JutzQ9
	vuGElwOQP+xr4MAydnQl9NBDeUcqv10vJRHeOyLXgw1pGnYPwOHgRkCCnoGg1K85jivjKvyDU7B
	hPYDAoC/A3Acdaua2nbvUaKkn4Z1ms8d5SG4I6Qs17EJTfMd8E0H+5tU22T6GglCORuupCIhghM
	Wz1uvAlqEiFx/qS9mkkQZAHtS0cS5VaL3k05mraZhR8uBB6Juid1F4F/p37NUOjSTEtetP0yuv3
	c6fZXcmR6MFEaBy8IpPDeD7nL63Tsrv1iygc=
X-Received: by 2002:a05:622a:6804:20b0:51a:8945:312d with SMTP id d75a77b69052e-51a894539d5mr58095731cf.0.1782726849466;
        Mon, 29 Jun 2026 02:54:09 -0700 (PDT)
X-Received: by 2002:a05:622a:6804:20b0:51a:8945:312d with SMTP id d75a77b69052e-51a894539d5mr58095641cf.0.1782726849091;
        Mon, 29 Jun 2026 02:54:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c126ed2de5csm91319766b.7.2026.06.29.02.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:54:07 -0700 (PDT)
Message-ID: <d3e48ff0-e43b-4e02-87db-d734421cb9ba@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:54:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Val Packett <val@packett.cool>,
        Maulik Shah
 <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <439b81a5-b13c-4f1a-9c55-a8b0b56a4de6@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <439b81a5-b13c-4f1a-9c55-a8b0b56a4de6@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dEr5HHA96PNwElpxQVsdm63K26qt_UAC
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a4240c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CzlgM8hXaGG7tx5CzA4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfXwpovfhor5gdE
 19VXsCmFOz+nAyZpIwi8JofGvdjTtGo2C49Ikn1nGhSxf8r53wONBeuL/11b6AvO5LpyZ3Xf9D6
 vhxxkgP/mkNaLMimc5tegZbKX+1vMl4=
X-Proofpoint-GUID: dEr5HHA96PNwElpxQVsdm63K26qt_UAC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfXwkMUhWyIcR0v
 nsN609hscSH9B1ffK5EtrOc/yU7k0dD2Eqj+qcEyDUqvstEIy8KWJSOmBTGWG01TwvSKAvbQSEQ
 tAPn1257UGtdqHthWnKwgXYz20s2ehNoFP4zt4vD/rGBiR+bQ+rCeXoSfcBYDBFtPdYDFcOPTuA
 pMlo/+8kacMa+GSx8T/eB81yUPElBr95W/D0xs4/Lw6JszrQioLjUMYrCL5v8jqyiJfdQWLZ4Nh
 Y3YodszEr/N35bLoKM/7IjCd6RDQcaYm/w3wDCfvypPa3ZzqYPSNgsu6qqfVLb+Mc2a7O4SeuKq
 q3jVLj+Oa1ymyRGWSRp00BhTuVJw5zyIAtytTU+wycryHraM6xBe5dgRDHi0ox5Yd7znE9dwPtW
 BIi7IKflV4UKW1UeJupI9MqH69L52nPteXFMe9KQQe94MdHd4pjbU5k3nXSb3IA/H8wTwsk2De5
 +g5L/lQzJIbhy4IfK1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290079

On 6/28/26 8:39 PM, Val Packett wrote:
> 
> On 6/16/26 6:25 AM, Maulik Shah wrote:
>> [..]
>> ---
>> Maulik Shah (7):
>>        irqchip/qcom-pdc: restructure version support
>>        irqchip/qcom-pdc: Move all statics to struct pdc_desc
>>        irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
>>        irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
>>        irqchip/qcom-pdc: Configure PDC to pass through mode
>>        Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
>>        arm64: dts: qcom: x1e80100: Add deepest idle state
>>
>> Stephan Gerhold (1):
>>        pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller
>>
>> [..]
> 
> Something about this series breaks the touchscreen interrupt (<&tlmm 81 IRQ_TYPE_LEVEL_LOW>) on sm7325-motorola-dubai :(
> 
> With this series, that interrupt only happens once (stuck at 1 in /proc/interrupts) so events are not reported. Something something level triggered..??

Could you bisect which of the (hopefully first 6) patches cause it?

Konrad
