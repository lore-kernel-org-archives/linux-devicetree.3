Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A24386541
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258706; cv=none; b=S5Iu4bIJqEEBgdCeKvCrlU9cBXXAlg0tZWvNgFVLh4LSmCeZMSW+J8BFEnjuIBK/RTQXXHwLf3sRzG1OR4LHWNBIbYjPx7DIGdnCJdrqhVDru7zndNALFkdEs9E+YLvWB+6A83ZTfrtHl1H6OrU+QV/LQl6AdtwrKat6LS7i2f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258706; c=relaxed/simple;
	bh=z+POoKyfa8zLBTym/G/260Yp9JlLJyXxuQRco6Ut5Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7wnw2XdaumgIrBJogocYKGlISRUGCH0yezC/h7xMlHLw4WP3bDDWGDUpjKOD32M2xb+Z/1l4K4/FnmzwFWWuaUJuOO5IranrbTwDOZPSowLyUQIYasRW1IBrp4r0pXP6HO12HzkGQGn37f++KQ/+qtXO9lMzf3lGHIXp/OIrz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8PAlXqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfisDMM4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8PAlXqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfisDMM4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N756w7199272
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bw1Ug8t3HovMsDQIBVaZvb1BqvAKmd2sz3v2Cct7ByI=; b=L8PAlXqv0dkte+B8
	DQNNCHL5VeSpfP9p+H8M1s/ccpNXiorCQ+p3m+5ufawR7zV7EUK7YaSUd7TxW349
	iEfLD5WO+hfyKC5adwh7GXiICk2acASnGcVxjhyK6k2LhOzBjPCbyQDZBKw8fJ3z
	KSlnHFwYravPKKP8YiH/nSDI1crNzUmBVuB1r/f2LUoJhLiGNNCwnXYEcgJ2wAk2
	s8VWR0XeYYl9DXE/LCG4XyuD/jC+ecDxwMgvzrjXOXsd1g8CecKg6cZg02WYafm+
	iJUJz1WRjI/vlMInwv/FseFietIWUuueiCLjTbhgaaI7IuXczvLCGHqVM78gEzRe
	n6tgZg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4vwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:38:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c867b7d6fso23634176d6.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774258704; x=1774863504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bw1Ug8t3HovMsDQIBVaZvb1BqvAKmd2sz3v2Cct7ByI=;
        b=SfisDMM4Mg3/ETqbmTTfe6aPI05Em9ErPJ2ITjGVtFjL807w7RdwGoPuMheluuMl65
         12u/FCxJh5HeLBJoENy139uho5AxIQdUkIylqwBnnYBsXRDroZWvXO9XJf6Yd0o/+4Ha
         ri/iUKlOl10PtqUlHv8xMGMeyiV+ffG0ykIQljDeM+OhUc7MOjHOd31MYeH9VhMUEoij
         BoKszskfFgCJD22lP5O144H+fv3y/t4nMwZjjA0IfWjTnERjEt7UaqaWfZH2fmGDDBpS
         qCRWjgr6xmiQDevy8q3FNGpcEGc7d9f4a1uCdmAw/6E/olAJLFNguAeBNLBIN+qprpUd
         2ogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774258704; x=1774863504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bw1Ug8t3HovMsDQIBVaZvb1BqvAKmd2sz3v2Cct7ByI=;
        b=q7OYKyLDUv+E1ctV8cbjR3Zb/xfqglkWGkUyYYmKEhzFo4Phu7XFDId8AddDq7tP2D
         kJifBgXbX/ygigPMIMWfDTrikxd3jiAtUNdD7GzXAKyV0RbEhCpEKS48pNSuLb2QL8kJ
         pnFQWsyzyplk5faIsNjiQ0HskER6VQckjARC+7LITjn/IMAGtEYIwFU+jDIjLYK/RVqy
         fj/MYp4ovgSSmgRIKz8gy/jpvPfPq958rnGWP0LgRj/6lVZuXBQSxGe27zZsJJvbOzyA
         xCcBZwFqAXaAve5D0m4Ah8qY6Kk/5m/9uBBJzyWNcNqAQqMnRWsc5jCBFhFla7s8NsrA
         O6zw==
X-Forwarded-Encrypted: i=1; AJvYcCXGM69dRdDOr6KLlDOL6uKEuvF7TODjLzv0EjE1wM3wJiGdQUCWDPBhwXsWuzhd76Qbu7mUJHo1VHfz@vger.kernel.org
X-Gm-Message-State: AOJu0YxyjkzMy4sYk/vTe2JB7lGEphIBYJ5166wEq+tzcHjuCrCshZb8
	1h08D9cQrjLak1UKNp1wb7lmZ5iZGxmS4Z9FS8H/7573daOnMqgy2vuslK0TRv0TM4DRNGM4Slz
	iMlIy4ggqr6X7gRHpTf93SLo8Huehpe12AfNaBfscNXf/2EiFUn+/z+Te9lWfSdP7Zub52sox
X-Gm-Gg: ATEYQzwmEASQk1dd7H7rY+DHE4CvS/tXX1nQcYxbk+jcyuNmAoinq5nHsAsc7/zcQGM
	GIWh1eT8w5XaCCnfSAbFNZtB3rMm0nNBmfzsWGTfWOCC2s96qD/Rq7CJk2TBTOK+1770MJlmBhA
	zGfF5thus4sSUAk8+UdJWD/JnGdFWIXsR3lrtm2QqXYqhbIi2emx4rlMmr/kTHR/Oa8tnP1vfc5
	fHt5pnhqDeIYyj7ZqNzDRhP3ghORA7DjZxTEJNQu8axRAHguJjLx3ahp+DrCSC04yo0/2ZJ1zEw
	UNSKzOy2YPg/6lTeSY5PfYsHcCHzBdvyjbO5g2z4yw2lO/BfE1oC7Fc3kmF385lNN2kA+9JGnVP
	nd1MhhpG8WXcy6AWnei4RR4YBhuQ2o4BcOUEBA8cnBD27wIhS/NcOYEgq7oK8d6FXusSJGwaq+O
	YimAU=
X-Received: by 2002:a05:6214:2484:b0:89c:83a1:6a2a with SMTP id 6a1803df08f44-89c859ab0c5mr156614346d6.2.1774258703916;
        Mon, 23 Mar 2026 02:38:23 -0700 (PDT)
X-Received: by 2002:a05:6214:2484:b0:89c:83a1:6a2a with SMTP id 6a1803df08f44-89c859ab0c5mr156614186d6.2.1774258703411;
        Mon, 23 Mar 2026 02:38:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43bd6sm477368966b.10.2026.03.23.02.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:38:22 -0700 (PDT)
Message-ID: <2f801f66-68b4-4515-adaa-092782082162@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:38:20 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add AYN Thor
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-5-e66986e0f0cb@gmail.com>
 <16211bef-2360-4bbd-bd2f-72c1d6993a1b@oss.qualcomm.com>
 <CALHNRZ_5_2zypBAeZT=YM6ZUq=wv-8GO+DEJTOgtJ_8nrB2REw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ_5_2zypBAeZT=YM6ZUq=wv-8GO+DEJTOgtJ_8nrB2REw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BLrYgQ3XgvpDTqjGiV0fkiM2XtC465e8
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c10a11 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=G69qOPBZkNddxifnoy4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NCBTYWx0ZWRfX0lLa3ZXmYnRP
 L65evyo9/tQCYWjUgjr6I5udIH5qRX4C+jbCkuJLyRl/kxZ6snSFHzLxwMkxft79Wyz54G/50+Z
 PaIiHyr1m3KnQHHxhkCr/8cJ7+FQWUp/hPDsGhp06pNnEpsyBG5Eq3maIMbtmRxG4ibw5C1/86N
 R0k0koJrza6VxCHq4bxg396n3+gBP4kmoxxP22xU3KWkPJdpe7rrRqT+o3P5roLMyTwtDCkH4CN
 aN+VPEjf1h6nJn9MuM7VzgrwGXUDzu/4ZgCfh7i4YLtNrpe7EkUrSIsnMflf+iag53bhVISgkKT
 jrNVfYrG8D6UsFKZltQvqTHZt7xGJtOo4kx2zq3JIjeNPGs7bQvuUNBXoYht5JN+AtlY6xxW5hR
 F3LBdTKDg5ZKVBFui9ZWmqMR5y+lvCoM+A9DgyS2atYe3QbSbfBSfIRwEvbsGhz6K4TvEvnvozA
 daKyPAjvP5xVsRm1Rtw==
X-Proofpoint-GUID: BLrYgQ3XgvpDTqjGiV0fkiM2XtC465e8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230074

On 3/19/26 6:48 PM, Aaron Kling wrote:
> On Thu, Mar 19, 2026 at 6:32 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/11/26 6:44 PM, Aaron Kling via B4 Relay wrote:
>>> From: Teguh Sobirin <teguh@sobir.in>
>>>
>>> The AYN Thor is a high-performance Android-based handheld gaming console
>>> powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
>>> AMOLED touchscreens.
>>>
>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&spk_amp_r {
>>> +     firmware-name = "qcom/sm8550/ayntec/thor/aw883xx_acf.bin";
>>
>> That's perhaps a dumb question, but are they actually different between
>> the devices?
> 
> To my consternation, yes they are all different. Most of them are even
> different file sizes, it's not just header or signature differences. I
> am assuming they contain tuning differences per device, but I really
> don't know much about what they're doing.

Yeah I would assume they contain device-specific tuning or whatnot, but
I was curious whether the vendor actually did that

Konrad
