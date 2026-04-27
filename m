Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7593D564B
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301135; cv=none; b=q5tNARrOC/SCBv46IWWqh31cQCjGlw7/pxbNhFqIQOGFc78qB1mJZr17jkhYqvry4ybrFJw3OHRtYxNdRwAH69uKR+FJPDXTdxBP/Xsfvf08+JrtxVNi99JJFj1DaETxLsi3ks8O9wQouwaa25Y40dpYDColZwgeukoLouoyIyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301135; c=relaxed/simple;
	bh=Tbp6zFTemwdFB+sjm3tx1ZLlhzj3aSFxl3wEDbt/whI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASboCdyuDShcjlIEciouKPvDfsFh7J2Hx+AOarGh8LGRDqN6zQQNMuZco/nzciO8hMh+Zj3OkRkEd4cfaoc18rkmrPvHXS8Nj+156T+/p3C5w8nuiHrl8Od7bU5UTfbVQKJXSMa/zAvjx/mUQN2GDZYsfFhjedZeeUZzZEkaMGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJWVvD32; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjxN1Nkz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJWVvD32";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjxN1Nkz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9OrCY3825535
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2vDB9/tNboObFtIH2QS4N0i/f+XkLXN/IhOJkiEFb60=; b=UJWVvD32Rr2fa7y8
	3p34j12AI0A6QMKjczF5RELKq2PwPSi1vTMN9ggZuI69XokqtlQbEbalTXUGPBbM
	8kZDlKwQXMZT0+ocCRcoB2DUglaFsjM5uZixh8WNUUOjN/fDFadW3IFtU8TW7fe3
	L3K/eaj9Io96ChzTPvm+1kkiNUS5K6NcFRw4szSpshdaVWvIwzK1vlJeGMZwCpeE
	drunj7MqKLS4ZikTj+9LDM0I7Ns7Xqdy+YRhnSZp+tdGUFLpZQYnBCRQdTuVAavk
	722zxJEU3iAdGnAB6Ugb963PAmy6nllcFBhLwXUEKjvawk1FxMpHVta1dBHsfrBl
	615lfA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5551798-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:45:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ffd4f8291so3266711cf.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777301132; x=1777905932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vDB9/tNboObFtIH2QS4N0i/f+XkLXN/IhOJkiEFb60=;
        b=JjxN1Nkz3epfUtWfDNs6voN6woLkwwcVR2gkDMv68nCAGnH0sKV6imgPZXsaLCOlML
         E6yUu6e5I4UNjM0MT8gpq0cfYpOY5pYmfarhUzyLdsToZL2pU/kdDkDCY2m/ss8IQaIc
         4jnJ4zhY6Ie0Z1yWEsvVJGQ0z2MH8Dw0JopS1c8RooRzeP3Al/w0W2A01uOsfim/LPAa
         Yt8Ytlbp92jZ6IiU0C7EY/x3OAdQVmeLFPPzIaOUJy8NTFnD4aRlyq7z68R6OGeCWGzK
         bmElzW0y9QNvsLzYpUaAWvIIbRlfsPxKXl2bJAN4kofe1/ucMdZyjomWc46qr4ydDT4Z
         2jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777301132; x=1777905932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vDB9/tNboObFtIH2QS4N0i/f+XkLXN/IhOJkiEFb60=;
        b=BPkE1GfwMmes9V+kv29JxhmdZFkjZumYsmHbru5R4dOQeU5FLNeavK5nGBI3350FSu
         XQkVoYim+e2lNWqAm/6m7RZa/DASk+2bfwVvWy+1jnC6G9sqk7ZvwWzhd8gaCiuuEOdI
         APypTgIKwknNVjd8/RbDt87Hrt5jyoecgiSN2Jm8gKC8O7gC/H5NUnK9guFhSWi3FZ4Q
         WUckn4vYf5zY5GVEY4wgi7Si8pOfJ1GQBbTz97ESfgeE/PaJdWIVkapbYfmWDAIyQygP
         mjsBxGfSu0xIkcxm6VLnDmZWTZo30g9kEh9YfNg38+nXkEn2kTTnc0iJwruGyg9qe95T
         pycw==
X-Forwarded-Encrypted: i=1; AFNElJ+SOs/8D9WXjCH4rCGROtRERug5Fu1OjJkh0CnCgDj689tVfU4EUIQRK+9Net525Op+tazqUALlvtQV@vger.kernel.org
X-Gm-Message-State: AOJu0YyzGbWvekrCB64R9QUmWRoLW/QnwJaJcfg8e35XZixonQIVbcSg
	5gpJEiJPk/oVHwvFQiOLlwpSvDlOYSvfiZ1/PTwrPofneZp3J4IOoFBpZeRwNtKGLHEbmMfxIhr
	QpVdEtgK5b6wWj2ygmaRKl5TMqPeWKc25qpSjtNpGiEe1w5l/qhjpDXCQ7Cj5AE7N
X-Gm-Gg: AeBDieuCTi/8kwvN8tiQpFmktcQWEhP18X3QKanAQd+KSwDyKax/LrDNeT8yYLZXzt9
	sljVr2/a/9Cn3crH8Nf+MznExo8LBhViKQAwee76o/YdUrUCD9rxr9+I1BszlGtQ1eL1RUm9qIr
	K0FEdKaVCj6THZ+oEFhcRSC8A5LIZk9PEMikVLhAY2FhbYAhsOOs4a0+8EvjI949SfcD3W6Mmbx
	YGN8F0iEP+2xuGrSDAw9M3WT4bjPcICE6b4NlfKuT+EI49/IkLzYLkwq5o5eZeXq3+MSiy6CRCf
	u/TNJvWRLGQKSeNf4MskJX/GmMTGYKOYe4s9fDI4m+pchbdemDRasSDmeZcBJj6Y+4J0qhw7tfx
	ok3OgjktGpGP31Nl4ik6jxATFM8tw2Aq2JwSXtyLm/YmPIrxBH9MozDBOT1Y6OWHqMwdqCGpIdj
	vR2mxNJGB+s4ygNQ==
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr432629471cf.0.1777301131435;
        Mon, 27 Apr 2026 07:45:31 -0700 (PDT)
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr432628541cf.0.1777301130665;
        Mon, 27 Apr 2026 07:45:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4520ca202sm1103240266b.28.2026.04.27.07.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:45:29 -0700 (PDT)
Message-ID: <06cef5c0-3473-4e3a-81f2-37a41216f67a@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:45:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
References: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
 <20260408-ayn-qcs8550-v5-3-c90abeb7a152@gmail.com>
 <de40fcbb-f5a9-460a-b9f5-482b0c245c4d@oss.qualcomm.com>
 <CALHNRZ-8r9KSpAEsv6F1YfSjWUfJihwKfzdeDTkRsPJfwr_s5Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ-8r9KSpAEsv6F1YfSjWUfJihwKfzdeDTkRsPJfwr_s5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bxtghKxhGIVfTtaeCZHF0qx5KTuQcmoV
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef768c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=UM7KGhH_uoedJeHknsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1NyBTYWx0ZWRfX9p7N2J/Xe6yW
 mr6AOdNWP3b97SAaCJBEpzmVolLpOOMUtbXiNaCCE+KKm4g/aCqJLIfkrZiIgLAlAuTmrRTln5h
 t80l1w0l4gtk4wIHLyJ9ZYiKg9eNQUSZIizSoo3ejxtR3W5I+8dgQVr+E6okmqHxME+3VD6ILHa
 /fodfBLTNyqIt4AE9uqtoHade92qDAlX6Ggs4ruLJRXVl/CfDawMZKYAqe7CWyZoQF98SYJ6Gp9
 xTgLKpyXQDxqkF5IgwR5M0/QaCknXhAIWCTjb6MboEEJkJFBc4Bn4ZcyTMcK2PDbl1kR36Gu/mY
 0i5/Gug47g2gnLRWNcxZM9cSR3fgwCy7aZmrxWxKvk8vIYGrt9AmTML8EQYhaBkrQrxJ+aYXzvo
 PvZ8RsnyxxvGnyMKGXFjC2xOPqJaj65iBNfvqzc0D05vevaD/V9UP0kdo6bTSzdr05CRP2mcVLP
 LVvz//FO9Box0S+NggQ==
X-Proofpoint-ORIG-GUID: bxtghKxhGIVfTtaeCZHF0qx5KTuQcmoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270157

On 4/27/26 12:01 AM, Aaron Kling wrote:
> On Fri, Apr 24, 2026 at 7:11 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/8/26 9:41 PM, Aaron Kling via B4 Relay wrote:
>>> From: Teguh Sobirin <teguh@sobir.in>
>>>
>>> This contains everything common between the AYN QCS8550 devices. It will
>>> be included by device specific dts'.
>>>
>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---

[...]
>>> +&pm8550_gpios {
>>> +     fan_pwm_active: fan-pwm-active-state {
>>> +             pins = "gpio8";
>>> +             function = "func1";
>>> +             input-disable;
>>> +             output-enable;
>>> +             output-low;
>>
>> Looks like this should be a regulator then, probably?
> 
> Mmm, what would it be tied to, then? The fan already has a reg. I
> presume just modeling it as an always on reg tied to nothing is
> undesirable. I also have no idea what the voltage would be.

Or maybe it's some sort of reset/enable GPIO. Or an enable pin to
whatever feeds into VDD_FAN_5V0. It's hard to tell indeed.

> 
>> [...]
>>
>>> +     wcd_default: wcd-reset-n-active-state {
>>> +             pins = "gpio108";
>>> +             function = "gpio";
>>> +             drive-strength = <16>;
>>> +             bias-disable;
>>> +             output-low;
>>
>> no need for this property
> 
> I'll start with saying that I know basically nothing about qcom
> hardware design and what the average pinmuxing layout looks like. But
> I do note that a lot of existing devices have this exact same node,
> for example the sm8550 hdk [0]. Is there something that makes these
> devices different? Or is this unnecessary everywhere?

That's my understanding.

[...]

>>> +     usb0_sbu_default: usb0-sbu-state {
>>> +             oe-n-pins {
>>> +                     pins = "gpio140";
>>> +                     function = "gpio";
>>> +                     bias-disable;
>>> +                     drive-strength = <16>;
>>> +                     output-high;
>>
>> This is probably not required too.. unless there's a hw bug?
>>
>> fwiw 16 mA is a very high drive-strength - does this come from vendor
>> sources?
> 
> I do not see any pinmux for gpio140 in the downstream dt or anything
> matching pi3usb102 at all, I'm not sure how it's handled there. The
> original source of this dt was written before there was a public gpl
> code release from AYN. I do see other qcom users of the pi3usb102
> doing similar however, for example the sc8280xp crd [1]. So I've got
> the same question as above: is there something different here, or is
> it possible other existing copies of this are also wrong?

You can retrieve the settings from your device at runtime,
/sys/kernel/debug/gpio will read back the hw settings

As for the CRD, I don't know. It may as well be board-specific.

Konrad
