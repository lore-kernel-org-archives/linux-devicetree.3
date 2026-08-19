Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF27D48B368
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157767; cv=none; b=PNalEXBG3VjDX3uABQ70gFwe9PufZA3uCNFMD3g6saSqNxtw2d9LVORyyXaiGgrxkYpMbm3zMxyi8LoyRam7SoUnKK8FqvO2l/mOKBLAsOjYL5Av2GxBzNDh5PqJ9l1fqwXiRN8bZLkHxI8pJwLN0Leu6JWFA+wEEA1h00XAbUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157767; c=relaxed/simple;
	bh=dnnJsqU4mxv4k6GlZLXQBcd/tcabPrF8oyB8KzBmS/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F90AM9BxwNqQX24FN8hLJ+slBTTlraFlK0HnCpOppvIHtoMYceD/UDKbbYt3VPkLfQ9QtS7a3dUvaaa/8W9obI9+FPpIZAbwpDge/kfhUQ3uSxM8ipNlhjUfAlTT4KRmGCxHsoS1xdcXpwYW1vHkKoQ6BckpJYhYqL3tvE6Zbs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuzZPY9+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7GJlQfq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuzZPY9+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7GJlQfq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbWjP1620528
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRihAgXtPmtMUikBEdmJ4hML3Ufb8kUSAwFw3nA/UW4=; b=AuzZPY9+vKgh7Tdn
	vYf+rDryj3mhfQwdxiDxsygpfGYWymmAP02vTjmSl+uBQ92np7H8OOrs4hXg8hT9
	p8JQoP1nNvOwl1xvsEBGvz4ZTxcr1mbNhDetYjOuItIZ2syVc5KVP+f20dmshNKE
	anAfp1G2Zxo5g0Scvw1YI1LI6AC51irdDCMt6d+VcNZOZqzpK/yuAJPBb5+0ppni
	U+m+DBTMu+3rv4UAZhdK2Tnfwe/otXMtgKkPVjFxcVKq1EyYqMuiXflBRlPOz27I
	K+vMkpbDog4XfhxSWCh5FYQmtSw9v92xegr5OfZbIxxaJeD/qmwyD5P4A9ycmwTK
	C6ZtBA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e83rqu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:42:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so946598b3a.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787157763; x=1787762563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRihAgXtPmtMUikBEdmJ4hML3Ufb8kUSAwFw3nA/UW4=;
        b=V7GJlQfqBniUVLyRmuHYFQDNiNHB0ScTGUKSb+AjUwfSrNuOY+1YOs3fFTNQx45ou8
         FaLLcUzjvuKvtYNZOWZlwwBXp56SDfrM7zzzF3bQj2l+O4MdWQX8hiS8PPakHlzm6C+L
         RDKYzcdUzEZz1tbJ2gI8P8S0u6KykWUc8YImoRcN1AaLVKdv52Oz6JQHmYPo2dupEXvu
         iM5zUEWXrDLqBaYX50Sfa7/cPchQJcEkEiaYwheAhqNP0C51f5opPuc/JsSWsaIFY4ep
         tVeq8IatXVmlmq3ej5XJxVP6B4K5DTd2gW6ACLtWEwsmSijT52iDH0aqp1uHVdudrIJL
         Zxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157763; x=1787762563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRihAgXtPmtMUikBEdmJ4hML3Ufb8kUSAwFw3nA/UW4=;
        b=s1zbBjQu4DxIRYZF8ZKtJLB2Qmn1DDGITsIm8zuHNytQiJCFHP3czphqU8h06iPi42
         Cy87d2OwH/VFx2RCtQ7WH7QDi+bVn3cw7/cCZqifr341WlrXjr42xENF5M8sxPQPkGqU
         qovoNWlzfBr9fTIZ8J6qUkZeP6PCQaEcOuhXwp8M1oxYTWOY3V6O/7MF0t98gFul56tX
         Laf1tHI5s5liIWwJd8UgJEAQ+oC3122P3rXlWVY3nM3oc39EZmMZN8LWlk3IJyLsTdY7
         Fv5R8pUrXJQuZbD8hcSvyo4CvJm+IMHR7dg36zcoxFGemglTO5PG6hZVF8Z4H5Tyfv9N
         VRQw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1nfPwIBIwAeUuCXZTcRJLce8tX8be37iYytfjT22mVlDR6U87/M4xCmA8RM6eQOm/MCkh/PlEQRvh@vger.kernel.org
X-Gm-Message-State: AOJu0YzIjnhKjBGt4jBjfkM7IWrrqMjx7jgNcZPF83zF8AKywwAIqiJp
	sXCy7a6oCPVshpLDOvjM7x6Mlwc1W/oWknW7CRXPgXrRoZwz7Dq01yNobub4wzDfTO3jEkErQ9Z
	i2yzVwWkP/wHBeg2HyJ1Dvj3id818muvMyx0MStMu2DZ+sa+8DORr5DmO1ap6kKiR
X-Gm-Gg: AR+sD13VHeBK6VfandWUjE5W56UG3Ah3DvZddH8TpiuMYrBVP/H2PGsFmUP6+tio/+1
	UsaKdtY7FmzWJBykc/WCzydvIyxuP7sKnRLyd4+RJTuy9BZtkvje4wrZrD7snn3CIalpn0P8pIC
	n+jQp8PDRtE3Fa+64Knj9EESFBtKtviq0K2B0zAL9R7FeW1xuuDy1QMrWOj5wmwf4AgSuctdx56
	G+rwRMTNsudk0a9cMS7I2VLAENG1tqGka5jAYA6ZQR42g42YtSoQ6u41T1TGN1UDeCt1PWqxa2Y
	JJO5Fpx51HH0ESx2A76QlqYc1F134+1j8pP8C1DELMRL1w4hkIxNLCXFExPzK50NK3ojZNPyDzM
	BP6hSFIA3vAv6vyJJxC3EAVPVbWjxlicF
X-Received: by 2002:a05:6a00:2e9c:b0:846:bc81:3e29 with SMTP id d2e1a72fcca58-851d381a661mr9382992b3a.2.1787157763456;
        Wed, 19 Aug 2026 09:42:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9c:b0:846:bc81:3e29 with SMTP id d2e1a72fcca58-851d381a661mr9382902b3a.2.1787157762897;
        Wed, 19 Aug 2026 09:42:42 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.111.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d33b635bsm881060b3a.26.2026.08.19.09.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:42:42 -0700 (PDT)
Message-ID: <15e37bb5-db13-4c09-b5c5-a9e92030eb60@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 22:12:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com,
        Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-0-e1c9e0dabbda@oss.qualcomm.com>
 <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-2-e1c9e0dabbda@oss.qualcomm.com>
 <09f10e30-f613-4a22-941c-1db63b190186@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <09f10e30-f613-4a22-941c-1db63b190186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXykOS5217LDVC
 Z789ZA3UgdvwENpNMUSbBZoIT+8t+mTwphnorFDWT53BSmQsoJ+hGFMYv9oxpR65ksDF/fJIJIz
 2bt7d445VcVGXG/3TVwD5xXPu4drpUM=
X-Proofpoint-GUID: nAmSwYf0RW80uX_4zPLBhpBEUa-epTty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXzruCyx5d2F4M
 fkUX5SNWUtRakIbrxrn8WH92dNPDThxje1bGySCoFueUCYAr+TE5vtE7X1cvQq/D1Meio3Q+q4O
 GUIVWntYk9QzORUC9e4PMksDvZ+TURsCvf+y6NF/71H9N3jJXPbaV+I+uJ9JG4lglS2JY3mdIwe
 Q4UszaKhW+SY6jxcomXTeDlxc0n82j+1mXFA5BwtYA+CWo5WfuVN/iHwEolKnUaVqFO8s1tW/c8
 LCIFlO6LHF8UWWRdQdQ/K228ODYye9fR0VWdICNmG+kySydNMKi81OPs5aYYXvvTxlexs9ILl+Y
 sVlf125NJqEDU9E8X6yarOzkk5ERlvbWQP9q90f3V1CiDSJviMeBsAMKliSUh+wr8mx4a763O/I
 2K7D6/COuXu0zLKdi4DenpIljrr4HCoJIowoUggwv3hQPNRwbgwAxqFwH3xO7Nr4+rw22MbW/L5
 QTkWdXnDeWNP/boHGQQ==
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a85dd04 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=HCveIaAj3rmBjkKtjFsTTQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=C9Icw_Sg0KBB5CD6VC8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: nAmSwYf0RW80uX_4zPLBhpBEUa-epTty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

Hi konrad

On 19-08-2026 19:30, Konrad Dybcio wrote:
> On 8/18/26 3:38 PM, Praveen Talari wrote:
>> When operating in SPI target mode, the GENI controller relies on an
>> external GPIO to notify the SPI master about the target's active state.
>>
>> Add support for an optional ready GPIO that is asserted when a target
>> transfer begins and deasserted when the transfer completes, is aborted,
>> or hits a timeout. This allows the target to explicitly signal its
>> availability to the master and ensures the GPIO is released in all error
>> and completion paths, preventing the master from observing a stale or
>> incorrect target-ready indication.
> [...]
>
>> +	if (spi->target && mas->target_gpio)
>> +		gpiod_set_value(mas->target_gpio, 0);
> FWIW it seems like the gpiod APIs can eat nullptrs
Oh, let me review and update.
>
> [...]
>
>> @@ -1131,8 +1144,16 @@ static int spi_geni_probe(struct platform_device *pdev)
>>   	init_completion(&mas->rx_reset_done);
>>   	spin_lock_init(&mas->lock);
>>   
>> -	if (spi->target)
>> +	if (spi->target) {
>>   		spi->target_abort = spi_geni_target_abort;
>> +		mas->target_gpio = devm_gpiod_get_index_optional(dev, "ready", 0,
>> +								 GPIOD_OUT_LOW);
> Is there a reason for the get_index_ variant specifically?
There is no specific reason. i just had choosen with index.
>
> i.e. why not just devm_gpiod_get_optional()?

Yes, we can use it.


Thanks,

Praveen Talari

>
> Konrad
