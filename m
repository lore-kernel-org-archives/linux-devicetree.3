Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0244F1DF73A
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874212; cv=none; b=iAdjM/bTbrfEAcv/h6A9pOFkCGVxmybce/LKxz1TjoMNxsiGDmADABtd6E7qQa6q0BfqgWIAuVWLrf6SltG3JtGXy/uCk33nhzcwd1fPvKN0uJvPYQlkv10vcMfeGPl4hx4WQkb4PZGxen711UxDytRk9Rt8BxzUsKjpnM3UKcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874212; c=relaxed/simple;
	bh=3mCTWcfWvUyyK0fH+VyZ3gkqM2ROnFmpTZn7EBA39dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UC1HioK8weG0wkKVVxaFcicfw7X1SRSWQQAQKDH1ruVaKP9PpJ9C81un/KhHrOFS0Zr4VFt7y2nnRxRSgha8umtyzN5dRsaTyaAFe2dSGoRHgT4nsawVcLuf9/pfGJJZbfTN1tpxDbnKSPv4w8okXlDrriK08xrY7VSbWXl6SIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/qEWSCT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTqOHto0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/qEWSCT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTqOHto0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Q6eC4033854
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFCXHDvwe96hDuMd6utugZ6UnfSu1p+eODGwnzreykQ=; b=n/qEWSCTbN6v38co
	epWAJTEeor987ii8LyfuvtA/NDPH15XbGBz1eMfTT4z7RZmIq6sSjLFZaDZUyC+U
	dUgmkYWLg6u3aEGj4aBYoab9m3N1Gifity+rqrKeUuNgvC10hXxA1lypCo0bI0f1
	z3zlodAa9CdG3NWxCv7edEbigklslK2uAKM1fBO6muvAsQsRp4Zv9jBoRfNPdIld
	NpFjx3UlZP7e3neVV/4XBqdy2dXHmoOWjt2Son9riAOtx0+x2K0UY+jSOAOtqwf3
	YSXXsmHgY2u6q0gTSpHTJ72bcJwO85yjPGIIa0GHVMeBZ6dzZDOvmvvCMoVCKZfy
	easMWg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sb958-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:03:29 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6b5a8836bso824192a34.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781874209; x=1782479009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFCXHDvwe96hDuMd6utugZ6UnfSu1p+eODGwnzreykQ=;
        b=aTqOHto0P5k5aqoUfKxbKqcgiioTf/iJYhQdgYsbb4RmqVjtcAE+OAaiIlMhK19Fak
         Lrgl+Bok5V8qLFROf7zxSJw1BJE2FF3RUmaDJOGLq4FAUqHqTHA6JfkVm6GawvDWbmEj
         SOEmfI5Eq7/i/IM8TODJR7Cdd0Sb3l6/T+DgOoY63BfttAOlUZ8gjEt9CF/X4Dt++KAe
         zEDhEL93csWDAkUOUdh8EMe6IIsQu0NzHqsgwzpaMRbHn35o9qzJQw7b4yQjJ90m51JJ
         k5QHzrjSBRrBd1SB+sy22g6ZJfnapFi1biEGvXfAMuvSvdM4BZcnCZLrLS3EGUCqQOX4
         EhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874209; x=1782479009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFCXHDvwe96hDuMd6utugZ6UnfSu1p+eODGwnzreykQ=;
        b=DgKMbQ4nF6m7ZwuZmZ5cl0VQwd0uC7/63qb/MCwNF3fctww8fxL6ANbknDK/qJ81KZ
         Cufq/QcdlVUqE4KKd8UJfhrjYv2DR4gocjO0dIy6cmjWCEzxD76W3/nOGHhMsPzp7uEM
         SJeCnpyfD3BniJ8nd0W/TCVJk5IzEXv1WbhX5YeFmAPZirc7GEHpU4j/LvY79pfcIJ26
         WFrj5i6t0oXFSY9g7v8L6r9n46bhzvHIcGsu7q8lbUgt8uzD8NxLGI2laXd6o3TfuGJK
         UlqMnXIDauX2GfWs5i5/C+eM1ZuQFZ5Tn+87Ti8sVfChR5sv282O8t6xflvXiTORC/Au
         KNNw==
X-Forwarded-Encrypted: i=1; AFNElJ/0nT369cyoYA3KSoDu1tA19IW7c2admYq4B8EAsbOL93cqHPGe3KUPeLXqVRmfFsK4rY53n085lyQ2@vger.kernel.org
X-Gm-Message-State: AOJu0YzaLtOSYAn/SGAB6AJ+X1aSUejTSeAuhmHxLDjL+5fLWLUdTEO3
	QZH7vMpr2wkRhodfNgOiE2UTkqE694TR4b7qIWO0lMt4T3RpNBMkZfSkDL8WjxGayhPyRGC9+lo
	zkWEeeScDw/DUG8Z9bM4aSaBnEtCegwqVOJ91MSQ0vCQWjeMuH5oUsopD9eUFDRoV
X-Gm-Gg: AfdE7clW//HynmhDb9KVKVwjENi2a4+fAbIMt9qFt47zoQvsRMffkzhNhUsfi13NHnF
	i3DcoKef33n4VJ9DJN32Db51OB0iCjjmGo3+YIoqXGtWybMISJ4/UflhVi3+1xJ/gkQh1I5DHmA
	zyVOHopudjD+FO7T/Dzj0A9c+fFnTAPbpDin3eg0U21sQBf2oPQSDIBpvgzUy+HRHX1m3rQiD8X
	b1Z5kfN9gcQYoFS1QzHc35ZleJgLqksfzD6cUhTHl8AbAI8+voVRgN04qhxmsoMzekxujVXFv1p
	Ghz41fRLNqb0boNWV0P1HuyqRmXhtQssYsYlEVAfzIM/XMVVu2Gbg7MK7IybrXQH60nDm0LpiWq
	Tq3jQyYRG6Dl/vjqFNisFXqRmw7mGLrk/u6k=
X-Received: by 2002:a05:6830:838b:b0:7db:c389:648d with SMTP id 46e09a7af769-7e92d47d882mr1423044a34.0.1781874209154;
        Fri, 19 Jun 2026 06:03:29 -0700 (PDT)
X-Received: by 2002:a05:6830:838b:b0:7db:c389:648d with SMTP id 46e09a7af769-7e92d47d882mr1422886a34.0.1781874205309;
        Fri, 19 Jun 2026 06:03:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a84b0a00csm88117566b.25.2026.06.19.06.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 06:03:24 -0700 (PDT)
Message-ID: <162da512-1142-48fa-bf7d-0b2393467a75@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 15:03:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
 <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
 <CAH2e8h7aGiF1g_LgG4WxEj1eGbUp-T_U-yZVpoHgU8FsMOrWTg@mail.gmail.com>
 <423b4e86-3837-4d69-8f56-d8259be53ff5@oss.qualcomm.com>
 <12a89ab8-dc43-4b55-9c95-36d44c75dcab@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <12a89ab8-dc43-4b55-9c95-36d44c75dcab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uVQcLvlYrqismxzsireNeh0N7q8C_J-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEyMyBTYWx0ZWRfXwo7DG5LOWOp1
 aNJFve8cdACGsDYOGk/zBIzUc/FiZekIuhlDeq5z3MAhlvOy6CdC6ah+jUUti6HG4KWqhSfDmZ+
 ghcy7EKW3Op7JGa+xZ8dVlW6E910Xj+hZOiQVoza2pjR9K4N7NxZ8nxwnB3QXeVB/d74yI20eDN
 9iQxzvelBQaVNeyGkHYoq/K5Ncyvy1uMmycUqsOcLeZnb2KiO7F5lOoxgkbAQt53oG7gVbePP3X
 q55+WiaNpvIRbefYv61rS1RDkIDEirEwKL4pqLdnyqnTPYsuaQm1j9ADTUyKyHx408doogZla2v
 5zBROgaHrPB5jTW1oR+UIHP1Xb6vt2LH2n4Gp9EBh6Md7e20U0gFI19R7sOVIJrCVXENuTB2J22
 v6TfBVBO5HPDNXDjRLMYxCFhcpF/mlh69M9eehMHHFUWLFv5FG9frKCrcyaXnNbYoAHqX/YqhEY
 60TCGfZ03bJ4Fwl4qtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEyMyBTYWx0ZWRfX2yq7260jkMSb
 ZJXdZnmH5QvyyzgJwl3yrIs7V2soaiwSlpRArvkt9Q54NTiY5Q02FgTCh1IM9IIwfY29G8/zEcv
 z7ShGnGP3qrkTUWRFMw1BbAEVQ+8qr4=
X-Proofpoint-ORIG-GUID: uVQcLvlYrqismxzsireNeh0N7q8C_J-e
X-Authority-Analysis: v=2.4 cv=KbzidwYD c=1 sm=1 tr=0 ts=6a353e21 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=JHF-0WCA65l3F0HK4SEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190123

On 6/19/26 2:59 PM, Vladimir Zapolskiy wrote:
> On 6/19/26 15:35, Konrad Dybcio wrote:
>> On 6/11/26 7:29 AM, Pengyu Luo wrote:
>>> On Tue, Jun 9, 2026 at 8:17 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 6/7/26 6:04 PM, Pengyu Luo wrote:
>>>>> Define pinctrl definitions to enable camera master clocks on sc8280xp.
>>>>>
>>>>> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
>>>>>   1 file changed, 56 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>> index a2bd6b10e475..0dbcd3069a3b 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>> @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
>>>>>                        gpio-ranges = <&tlmm 0 0 230>;
>>>>>                        wakeup-parent = <&pdc>;
>>>>>
>>>>> +                     cam_mclk0_default: cam-mclk0-default-state {
>>>>> +                             pins = "gpio119";
>>>>> +                             function = "cam_mclk";
>>>>> +                             drive-strength = <6>;
>>>>
>>>> Other platforms set this to 2 by default.
>>>>
>>>> What's the value set on Windows when the camera is in use?
>>>>
>>>
>>> It is 6mA.
>>>
>>> Let us get ctl_reg first on Windows
>>>
>>> lkd> !dd f111000 L8
>>> # f111000 00000284 00000002 000000e2 00000000
>>> # f111010 00000001 00000801 00000000 00000000
>>>
>>> ctl_reg => 0x284
>>>
>>> in msm_gpio_dbg_show_one()
>>> ...
>>> drive = (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 == 2
>>> ...
>>> seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 == 6;
>>> ...
>>>
>>> x13s should be the same as gaokun3 in this part.
>>
>> I confirmed as much and I'm willing to believe this is a default for
>> all 8280 devices
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> for the second patch, please mention in the commit message that the value
>> will now match windows and please add a fixes tag
>>
> 
> I believe the second change cannot be tagged as Fixes in sense that it
> strictly depends on a not going to be backported non-fix commit, and thus
> backporting of just 2/2 change as is will break the matter. Reordering of
> the commits placing the fix commit as the first one should be fine though.

The Fixes tag makes the patch eligible for backporting through AUTOSEL
but is itself not the same as "please backport"

Konrad
