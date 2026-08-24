Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FBE427F97
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581071; cv=none; b=YnO8jePMTZiHAOKmuJtFVRzplzTdbE3IkjEgvoHl463/8sBYjAA38Anr4UH9BWcL7XiuSc3Yx3p/1jo7+NVx8nH9SocBK+6zlGC695Rus7HYr/FxDXDHEKLOGw7HLsf3DaxloE9cl22GsvzRcl6r8h7qX5YwZ2jQQU4b0NUQ4Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581071; c=relaxed/simple;
	bh=TvryIBgvCG+IvPSiuyEqxDbZRXao9oq5INN8DtPiqn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnNXf8dkQ/uECj9LjOrqWDACewGPGvOnjRFT5JxiFApCV9GNKfnNG8c4ZYigHSIhILdkl51tkEQYnUl75KF2Bgjnl9wPdCwC2G22gVNKcjuULKtozvxLWPex77fFwGgZLocIHA6+nwn0YT/md9C4zWTBzPV7MUcCe/53sSZyFIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3GEejuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJHjevcW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3GEejuG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJHjevcW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvHHh2006969
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nay4ph6sJ6t9Vrb27RfArGCx2cz1q5GIFB5U1F0+RMo=; b=V3GEejuGocWXPJoy
	sGgGnF0VyB78kCLJ4VxL9tLOdkRyGFUSQfF+kPpPU57toCLoobkpE7pxvUIzOkNY
	lj6JT2yxWOEVIK+4Efza6iyzHR16ZN9e1b3ZvKS/ogJ3/IvmUMvj7bneP7hA18o9
	POg2Y57s5lPS0MuY1oBLsgf+LzSfLdYAiKTfNz2OqT8m/5kpJA7mfKfnvVDU/5kV
	1vZSy6x3UMpXO244R5qV/yZmGl0EdKf23+qUseVkBwvLMeakXxpz/ZfY/ZLqDJHT
	cnAVxDKKzTj5jRlkh0RdbKrJYMBvG7Q5OvFUTmGJJ/k7Yr3qp+uAzXnShUCQ60S7
	xjmzLw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv7904b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:17:49 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97c3746cd0bso48185241.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787581068; x=1788185868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nay4ph6sJ6t9Vrb27RfArGCx2cz1q5GIFB5U1F0+RMo=;
        b=DJHjevcW62oow1w3kWq6Dvil6k/O+xu9yTD+0h6CHkN1qeBKBZSqcnKYkCRsR7yu18
         PHyQgOBX7b3sMEjNf7+FQ7NDoF2MGNmge4fnrySO4e6wcAvkL+fPXg5gHZot+CtPXjmY
         J2UKcKUsYU4zM3gwQ5YzjZgy7VoVQz9uD12swBTnbbsF8qL5stG1Qe6/Qk4VrVLyJ/lf
         OyFB5FyVZaZjiV7/+LnNc0es67r6uPdDsMV+sMY6yQ/HyWRRl75fU0fZpgs23StTic9D
         mrXKIxa3+OX2Ovr+NePLlioNf6Uw4fNIOGfKK2AB+nqOGgL9U9tu1bRJbwMF/N5DxGxb
         TrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581068; x=1788185868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nay4ph6sJ6t9Vrb27RfArGCx2cz1q5GIFB5U1F0+RMo=;
        b=MqvejTO4deCKd+7Q43T57gbcUx40agDsB46MOSqY5Ar/Qo5ftVs7GsgE0ZplWW2o9f
         p3iZHsniezgzsnAQ550sncZC4vLvomNiqkyaCKlp4Lun8u2HtADsD5U+WyhYVBVWw+1N
         pBNX3WYscB5a2fPWiYE2y5ocKUFofLSgM22Jjx4dh+6lnTpr8wWBUUtkpLrcYRWqj0iv
         2lPzF5ymSJbRtv9iPA+ICt1ykzThVJr6eL2juyYYOAsfd2mI6+hBrbu5wDERgmtrXYwD
         6zDhg2Rv5JJQ87x41zgwuvS8aPC36gd6FIahUDXGfeU5GmVOs/4878ssdAj8nbgkrXGh
         rcag==
X-Forwarded-Encrypted: i=1; AHgh+Ro9kHKM3L6oSUyS1jA7pglmADs2tyUm+sS5xYs7xu/5o1tnQ6DV2QZI+bluUDFmOqwDXjPuabmZyl4f@vger.kernel.org
X-Gm-Message-State: AFuF++k403LqCEVSR0zYWZJYz6LNRT4CdmhzFvKrHvNi7Iq8hlJXhPPm
	uMQlzSDKBmzcOecC2sEWEIpoTAePoiyZkNNVQBx0khgtXCx392UIgL1h1N1K/VC842llGR+wZf6
	JV2lfeSgGkGBRG1DZIxmqTKRfjOZiF5+jQAklrHPd7JM+RcRggKtGj1tjWTe/yQxW
X-Gm-Gg: AR+sD10a9uqz8TcxqBxMNwe0lO+3mpdfEDBZPrcT7KE7wiPH5borzi4ZqpVJFpC9YbL
	wDKO+2+Iz5y5smPYZJOcwUYMlWdLlNqPDT3c14rgqLHaoULhC5zl5nBbQYLKafEIN597c1zemhI
	OrmqDp3cwkWacfnn8zmT2n1vtrNKd47rLKv1CXai+5Jycfot9G1hXP5ZHhyc4EHtr5ZaBbQiQ72
	8pSHYfQ9qBS0LBGwvNY3aH0UB88IVgaT6LA4cqAPbmOlFRamaFuQbgSoV5xj9ssf3z1AHoMR1il
	CES103dYd6es80P1LuUARQ6fVvoR/vhFTQ7AXCVwsFT6hpmEjLAjyJzV27tNjGrFi+Ez4MppeyV
	Nx2Z4DLL6wHWus95Hj6+/sq7p
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr4020960137.0.1787581068110;
        Mon, 24 Aug 2026 07:17:48 -0700 (PDT)
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr4020939137.0.1787581067732;
        Mon, 24 Aug 2026 07:17:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001305sm9565004a12.4.2026.08.24.07.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:17:46 -0700 (PDT)
Message-ID: <b471a134-397a-4f0a-9d79-1777ed067c54@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:17:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c528d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=mNkqgjryeaPBWjMOkUYA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfXw5KfG43ZxHKS
 RttMUk1YPy6cpzulBY+O+izPhV2XxSsSOm6G3B1uQW6nwRw/X9di93I33As2ZG6czNZUdLU1AeS
 +BsJpqtFWMQyRp1p1OEjh41q3W6qrMs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfX+G2sv+kr9DrW
 qoSmI+K3Z5389dmLaU9GXg9vKJWDZmWfGmwIW5b7HjJQnrRea5/O5wuBLjR0mWTb0YEGdZGHjaI
 Ct8rPB813mpV4sBi+rFmXwWhjlmdH3Ls04GG78WaiXlHPTbWvKSCSDRTaZhYoccRyiZMqUm5Lb0
 Lxvbfe4lQX30DHCfyleEDWI7Llinr8CcFX+zCPMPMY6PaSJwwTs8nOkXAfT2dvFFC82SytSkvCI
 3906pTV/KaJGVEpC5C8dz2sdSkObdkH00jrEAY9rTGvmkkc0jIdL1MDbMApIyPLl8UTbdKrM+AZ
 OChZbpdChKOCJAyaDl8u2seYQwUFp5uEaBN4B563lO0UFFPr9CBm9ZG+XHghBX/3ygcCwIuU46S
 6BQz/BUDiMPrHk2kAadBD3d5QAAZM6XIC3zwssZevj/i8ft6+SkKtmJRMiz0gZ9qxV8g2Avdicf
 kqF9nrl6JPW0QIsVgiw==
X-Proofpoint-ORIG-GUID: LsxG8ziOAhVyDEhYPEhE46inDxkw8-F1
X-Proofpoint-GUID: LsxG8ziOAhVyDEhYPEhE46inDxkw8-F1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240120

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in talos.

[...]

> +			cooling-maps {
> +				map0 {
> +					trip = <&q6_hvx_alert0>;
> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		mdm-core-thermal {

Should this sensor also be bound to the rproc?

Konrad
