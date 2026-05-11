Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970EB2FFDE3
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490861; cv=none; b=mBGU18WBAT4I/Y8FjC/7mtpQXP3TRorJSPJWzDqUCFyqEHyYm2gZ0vdXDPD4ncWyy/MFxkajcq+4KR914Bn7PWk93XsVPXYhf7cjk6YMHvd4qkt45PMoMMIRGBzuNnbcwz89lxh20WOijAvcLiM21oxFvq7k9mpJCaDj6zIG6/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490861; c=relaxed/simple;
	bh=ucB7W3Ztg9rQ6q82LIGwjNZXafkB0JrLouAd5gNQIms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqliUpQqS6jw3aKOHeS52b+qmGSMsDnTA5q9gi415KdtX2rFEqxNuZ6v8IlikwwSJfkumJ1fgVQeDeVcDoZwshlTA+6UivDanKB88Tmn5p4iqa2Uv++sG2VkNuiFuDF7SQLGrky9/XMUFBUd0AVuxlq7i6pzYoTRaj/Ag8GKO3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKaiRrYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOTYF9v8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKaiRrYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOTYF9v8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4Gl6X652807
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T+RbmJy7CU+A4W8ZISw/GL0n1oGkX3YC5BIPsAMPBJU=; b=EKaiRrYzHdYBBTBY
	BWkRfTyNT4jNPs2dEAcOJBQyroDjPgdnTOasPqHk6oAI0OBopB1HWes2HxHcvGwu
	9hEPcB8bUcZppkixToqFqRw6nCqQ9z7+W4zyjee7FW+J2GugRbYBtEC0Rh/bO+Nq
	eSXHS5ldZtFGJrJBQ5zGsSSpgIEqkX71JaK6CUD+ryjzMq1WDyZGsJUaYxRPMakB
	NrJ9a5hTogPQneDilGorgr1KoEGdVefaW2ovHPYQDAtJhOXOrT9NLVmFtCSnHWTj
	QqQ6QG74ZpjozULWDCLBFhHAX6hHdRMKD3Jv5nE/gEN6zW5z9Sb4S4ixDTA+iDYR
	Q0qOSg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu90t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:14:19 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95ccc6c5b49so170198241.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778490859; x=1779095659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+RbmJy7CU+A4W8ZISw/GL0n1oGkX3YC5BIPsAMPBJU=;
        b=bOTYF9v8QAcXyu9ardcpqzBWSYkryq+l1naIHH/Bgl7FSH4b/TMaTEddnuDb/XfAqZ
         pbxBK5jxPACgmTK18F53I4q41bKR/j2ZFpm/9ElRo9SikHv9DXFaI/4Qot1uMu7Qu0AJ
         bRE/AirunbMQVJL8oTuvNYtVDCwUvzRjSDUHPYSCuljv0PnJDOAtHyLE13d8I743aCvY
         aZbMHn0zGcg287TC5wkOhpdm4P88uF0cF3uJHYD9dzx9WY15buMOg0H/SPnUH3cGDH5Q
         TNEtGn6qETiEWnsnGu21w60OwP+HBW8C8INvjZJ9ZcoETIy+NNwHbVc3YSbm0z7wTx7Y
         nnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490859; x=1779095659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+RbmJy7CU+A4W8ZISw/GL0n1oGkX3YC5BIPsAMPBJU=;
        b=gmeJv4n5Hi19VVEM+O5tAZ4hsL0e5BoBfmk48tGC97YkT87C2Fdo5Ziqr6EMhDP7yy
         rmcGsVkrngBED+yQP6gZisVFjNTC3CGFWOuDfy0V+tH81rbZjPweFq/ooKhK2Z28MnXo
         wYkBxujgMaVXKSfIqlLsJCuLzrVfSgc77NvlT/WT023a8gTkcoUpKL3WQjV4jZCyPuRW
         jr/7fFM2ziIbAQL8j70pW4M/zx+S90vhYEncyESQrqhttxL7SJBbgZAUZ5pYUlLT2xkL
         Y7/VcGnbXGFosdnU2nHji/twm+NgJXNW8oaFEUVqlfe7jekw7Q5MMVZDR7hKfOsLL/x+
         76hw==
X-Forwarded-Encrypted: i=1; AFNElJ8aI9/GnmFN78aKEqUdX4OBUfsEdTa04c415SfDG+cqaemROMf+U4z7OYhJO+PUm5S+IsZJr/nR+XiM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2SCXXGYW7C8/JESPoZOpGVKBvPQf0WFTQ7O1Mh2xNmHZEJIKJ
	zK3MlEEZzOuVNwibXeXNYzWA9uuIRKEYFD4guJJgHPQ8fh8h9NgdPcNDPMUm8UX4I1Mbqjo1tkF
	+QFpQDokLGGcu+//an8IykbHQtKyb7Hp+x4l1DJBaRzS0gEEcKKwM3CIzYe23qyNX
X-Gm-Gg: Acq92OHLZVy7ReLoIvVJ/6MugnLSoVyEXa6Tq165aNQM7X8D/F+9/Rn0t6tr96n1NNH
	hsp6NYU89HRu2rD2YoWI+LG3d19eBwE481ZOeK/PpF/xxqiUFilKtTO06Y+xr40OJ2/OoKHGgyk
	ksWqmbT1w0nACVEAKD8WJFFAUajz/FitThD3334oHnH/cwueS3onHBPlOfiWyburPM6TmNGGYSI
	qBVAXEfpZi7KycenxNrkyEyVQMXtcw9hpLF8Xg17pP0DCrbt17DtPWaCPbnLrulm4BekubbdKWQ
	+kNWqMdr870woqp1B5oRS3s35aR354JM00VpL+iM+UWQeayR9MBX/EQ4N6bFYgyQjMERnbEGvIU
	u2rLzh1tJRwH6/l6Pv7TIB+YXDE4XknftNt21IaFtW0m2oM3J343iFpwVp+VhD/MWWnLUfyH5kW
	A6sOA=
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1444460137.8.1778490858798;
        Mon, 11 May 2026 02:14:18 -0700 (PDT)
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1444454137.8.1778490858380;
        Mon, 11 May 2026 02:14:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd09513b8cesm81361966b.38.2026.05.11.02.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:14:17 -0700 (PDT)
Message-ID: <45d8a780-2d02-48aa-ba44-077a4c30bf8a@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:14:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>, azkali.limited@gmail.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260510-pocketds-v1-0-cf05acec06af@gmail.com>
 <20260510-pocketds-v1-2-cf05acec06af@gmail.com>
 <9f7368f9-f6ea-4b97-b8f6-2e2f2e62c261@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9f7368f9-f6ea-4b97-b8f6-2e2f2e62c261@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a019deb cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=0O2ySSlGmDdbU-S61yQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwMSBTYWx0ZWRfX5W1aL6ZfEgdx
 OtWplDyL0/LiWikus23NwVVExdLPweqmhY7iyroaFMjbWQeD9Jdis1MqHA9MtEhMsQw68UvTlIV
 oDjzXUeMsFU4wScazaS1e5Uk5aAMvKDzznUapu+ZfW8A+1h8Q2FXzPmzOsXm7VvhHf+Sr47gwo4
 2J1YH8FRSdNChYzUKwra+aibq3QpvMR4rO7kdaHrUWWypkMXIOhm94njs/oQflchYccu0YB5zIj
 9svRTzeVLzkWEal1Ihk75oAQ2RX+V9EmfWKyWhMgsgmc51mPUR4JY7mMLoJ0jo0OZTMvvRzDTyB
 2fJ4O/OpuOhACIgHDhlx1OxHonXW6hBi2UizYyBvDv1jw3NNZcqa8iefvih7fSob/eqY3SYGu4Z
 idfJ4yRBfbdGWOyQp+8oxmm3IfU6s9b2qPzM1aNnSwSHmjpp12hrM8rZyjbk22CI6Lt/6SzKE7T
 9lF8DaN1OYtVD/O+I6Q==
X-Proofpoint-ORIG-GUID: WZas-T1wHb_WrI6TQPKe8AzpNv6mkaz4
X-Proofpoint-GUID: WZas-T1wHb_WrI6TQPKe8AzpNv6mkaz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110101

On 5/11/26 10:19 AM, Neil Armstrong wrote:
> Hi,
> 
> On 5/10/26 18:05, Alexandre Hamamdjian via B4 Relay wrote:
>> From: Teguh Sobirin <teguh@sobir.in>
>>
>> Add initial device tree support for the Ayaneo Pocket DS gaming
>> console based on the Qualcomm QCS8550 platform.
>>
>> The board file is split into qcs8550-ayaneo-pocket-common.dtsi and
>> qcs8550-ayaneo-pocketds.dts in anticipation of additional boards in
>> the same family that share the QCS8550 base. Only the Pocket DS has
>> been verified on hardware so far; the shared dtsi is intended to pick
>> up sibling boards as they are submitted.
> 
> Please don't, this is dead code, please send a single file and then
> split it when you introduce variants boards.
> 
>>
>> Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
>> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>> ---

[...]

>> +&i2c4 {
>> +    clock-frequency = <400000>;
>> +    status = "okay";
>> +    touchscreen: touchscreen@38 {
>> +        compatible = "focaltech,ft5426";
>> +        reg = <0x38>;
>> +
>> +        interrupt-parent = <&tlmm>;
>> +        interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +        reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
>> +
>> +        vcc-supply = <&vreg_l14b_3p2>;
>> +        iovcc-supply = <&vreg_l12b_1p8>;
>> +
>> +        pinctrl-0 = <&ts_int_default &ts_rst_default>;
>> +        pinctrl-1 = <&ts_int_sleep &ts_rst_sleep>;
>> +        pinctrl-names = "default", "sleep";
>> +
>> +        touchscreen-size-x = <1080>;
>> +        touchscreen-size-y = <1920>;
>> +    };
>> +};
>>
> 
> Why 2 touch controllers ?

DS = "Dual Screen", presumably

Konrad
