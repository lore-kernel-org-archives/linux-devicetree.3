Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ADE45C6F7
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144111; cv=none; b=EDxeYqyn/3gqyMlFhQvXSQo0xMbsaJc8LicNzMtR75+N0GEZT4kh2uX4/Hjy9Ugx8CJr8RUwzQ6IZNF+J4ajMLBHYThgUpUWqLRMsVcBD5oSRO4VrW4Y8JRFyiwYz3MW/qltnO4myElESZewA2TIvDLJpi4wfyYNSbxZP2e35iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144111; c=relaxed/simple;
	bh=IPB0oQRuXmO7WrlZ0VQqDmLES8GViOkLv24cXWQmR8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJaZXRIy0+rADDHpDcBR4zzDMBHWNk7d5rS0zxgSq1zlYYr6ai5KTVw5Ueps/Hv+FYMNaNy+pEDBd5npT638oCBMDNs0PpDMePtfd4izb/kD1lJgy3zG7zW1SLEOas7t9nT9+6B0a5BQzxDccBYKwX9JNwsGDaQmRR9x/1aVXko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSb4TIyW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKzrgj26; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSb4TIyW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKzrgj26"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m62m1465434
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJbrPeFKvJFiVY/OMn0JYmUGNzmjz8KjLkYWLdPrWY8=; b=QSb4TIyWpH4wxXgH
	K0gXijTyO6bMed+/ymp6jV1C75Aa6WU/VXXbw8e6KAnUXVPhuPsVytnCzU7W6Sdo
	JkZfwv8uqUMW+giH6QDETVu345ny+kR24LFb/iAKtrUE4MTu3RvMHCqcZUJy++D0
	fo1zr174gi3IXyz52a2c+paatz2acUO4QY63dXnpLv1ZVXeLgfTRRcWFudjhMxA2
	cFpfykhr4hktMESrGURyuNx1wcmG2xPqY3woU90lCj2yIuBTwnfR34H3SsrIOxQt
	/KkqUjy1LyKQxMzMhYcsG6zkvECeIP5r2MBlf2wTsm7vBczhxYaloDEirfg+rgmj
	sQq8+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wunpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:48:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5350d8a2368so13769791cf.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144106; x=1792748906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJbrPeFKvJFiVY/OMn0JYmUGNzmjz8KjLkYWLdPrWY8=;
        b=UKzrgj26N65x94kJg+EBTHoGuCd/SR0AO3L86u+t7XvFIz6oEUXEeh2x6uxnmlNd98
         oJm21nTXduBY9ggfbwkGdHx3ju1eguGYCvQG4o+XaHtb7KfAYdM374s25soMjBpBrXGS
         R0qh77Qxc++RQwuo4I+j+KjXlJ26iWNEY7kmT2WWB0b9yeiK5WlsytSp+7fzck/wmzdw
         LWTibiDdW6nfGpmYYQOdKnO+YLVogDjRsbnspB92oNTlM55NEx8nSwyYOok+xktUoczJ
         NuDbx1gg0ZGdyYD1xzOMRIDucgvbnYyAbvkOkzDmRDar+d5jAC0HpxCbmfXASxIfMMeV
         Q32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144106; x=1792748906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJbrPeFKvJFiVY/OMn0JYmUGNzmjz8KjLkYWLdPrWY8=;
        b=DdFbTzHuHC1PekVDK/MSR1upGgmMLYyrOQ9W5/mQG/q/u6vHHmMOX/QcvNNiAif8RA
         Bup+Hdn6D+DlqOH+IaErKO1iSO5+CSHYbtxrA/k2lxiIvaoaykfe09mqxZwz/zftGpzx
         qjqU2kHj1aidFFKtK4GHkhg0qDDwn251GFyUQyAMjw+B0ovRxd+F9JeLROZG6A12vdnF
         7v6udvMFgYcQ5Vairs8/oSNPJgzoPq23Yo0nEw/bEAn4rPEk8kzcJExBY8vzv7SoTVB5
         2HJYtLQh5Uor7V4TkyTkfUOG4ejhvQ6+mKZb5TqHdtNEhaDwtNTWuh8NPaEC1MaDprdK
         IxOw==
X-Forwarded-Encrypted: i=1; AKwUvBwWkc0jYI0xMfSO0mt7fd9rBqKz8Q3Iw05Yd/JbEddtckRXRNzLPrSxBNRhoU4pC+butMGAT/HdwGbQ@vger.kernel.org
X-Gm-Message-State: AFq9FYKAX6P5pI5wgVLhjcu51BkMtw2EpQYY5GRQFKlZpCbHfbbX5IXH
	cQnliY5bF0NLRsQw/FgP5fT0lezHFjvwmy5YrxIydKMTmo/omZ7snZdrohBKMxEYvwiM4BMmdHd
	iHgzp79ODj978s8CjIndYfYPYYIz0rGbetq2E29Urnru+w5T0jJTAiRknfCMOktlr
X-Gm-Gg: AYBFou28Ri0K0AwgS7GU4giv2i9fUW8sabpFkIuvR6zWpnp2QUbGmpDyU0yBG2C/LU/
	DKnGlObpZcw2cpnlSzGV96r2dM93MHe9tOtz0nntX5N6PPyQdl+cW8y/Ik6VVhnDXQ48/bAP6nO
	FFDxcREORBNI4uL1m9qJdHNEeVQ3VocwXpI2ivUOm1fv8j+inohzBx/u0zRR2tBKdGIulFk3oL7
	Kp6IYfviSdeNQrByviR0trSkK/2SpQM3dGXfJAe5+JfIKKlSnyh0WLGpF4MW8bw7k1C2/4A/jaN
	KqpVrph6f//oQLk8swIUPK4lcRt4wp96CG1jd2NajPEB2PlIO08ziHR30pClb+lcqvHAV04e4Ik
	xphDj6JOJq9kLz05azmzGBg==
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr283776471cf.1.1792144106488;
        Fri, 16 Oct 2026 02:48:26 -0700 (PDT)
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr283776191cf.1.1792144105858;
        Fri, 16 Oct 2026 02:48:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm57355066b.11.2026.10.16.02.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:48:25 -0700 (PDT)
Message-ID: <aedf3717-338f-44fa-9fab-9dd167aed1b9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:48:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: agatti: add LPASS devices
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <30285f0267cacf2dc2f7c19cfbb10bd42d50310c.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <43344f93-26ec-4a00-9249-6eb9423759c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <43344f93-26ec-4a00-9249-6eb9423759c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: imKnE8YYW4LwAACcY60E3jv80IeY-bch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX0YMJznHRQmWY
 CVVsQQ+9yGLq/XgB7D9CJmkkPEdb0WCkPx8aCfblap7c3PuCYKJoxDQdHimvRx4dVKYYoXsCqgQ
 RcFTKu5VfQUUf4urQJDThtPngCF+seCdpeSIiAVBzoCt96FTt2WOQlEh1tuRNZm26TaND2wsD9W
 owPeqNYGC3juOWtLxQAF28wyhMeFqnuC0buVNanQrai1+tIKNd9ueFlsrtqu7jnJVF/1fs7pBHG
 THynVkuJ4LHt4/EzCFE/86nAO/hxP4pp3brQ+08goBWeQ7gxdlMl3aFmqHiqIantrJ/cKURmnjg
 PPrpmTwerxiv1AJZRwvB5j/C5kVW/RvImdCZnRpCnHeb8Zlc2xVrtEU4UFWLPhWsWJNGFgfWBB1
 2bVhdx7bIZ2esYqNe16czS4ZqlX3JKxYojgAxtvUSzHv/B3nTJ8j+SmaaIUQPU1RgWlLxvkJi/D
 UoGyyPLO7ZoTQNcZTrg==
X-Proofpoint-GUID: imKnE8YYW4LwAACcY60E3jv80IeY-bch
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1f2eb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=N_Gd9SB1QsfJXT2d5d4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX7Tpd/F1EvIwn
 qw/rrUp6wQrhq+Yd4hCuAGV8LmGKfXU97uNV2/OW+R8YPWoK7s4t25MY77HU1rupfnAU84Bk/vD
 ICDwvCNpqTDkYLQfgKqn7oJLtDi5rHA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160038

On 10/16/26 11:44 AM, Konrad Dybcio wrote:
> On 9/23/26 12:11 AM, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
>> controllers are required to support audio playback and
>> audio capture on sm6115 and its derivatives.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		lpasscc: clock-controller@a7ec000 {
>> +			compatible = "qcom,sm6115-lpasscc";
>> +			reg = <0x0 0x0a7e0000 0x0 0x12000>;
> 
> The unit address must match the reg address

with that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
