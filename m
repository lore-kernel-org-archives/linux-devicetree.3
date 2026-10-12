Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B850345CCE
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785888; cv=none; b=E4t2IpoekPCqexW7B/QflT+/B8UmptLx2QMTWDNvyz3olHdaEDtUtrfup4/3MtCIBTyAQg41vC2vZCsonTlStQXc/7nA9lQYqgMo1ceeZ9Zj24B68VepYI8zXXWL/f0MIvDk0Pk3wd/kJ5lj2kPx8SyoQURF9etI9my6QPtVJiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785888; c=relaxed/simple;
	bh=bpejG+CiNbhijxhuzI72Jd2vP8moLJ/iGX0zEl+3sVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7StmrZmnTDiUqpKGWZ5THZVWczbVsFRMxzIUV4rDPgNQUrHkxKp9ZgQx07FfSAyBHprsFSEm7GRY3sez0ZZztxnYnfYXfHRmA5k0Hb4DTiQeRuq7UQCV/CfSI/6FoRQSLn5niZkV2970fqH51MPWukHJkeI7Za8FFyEtq4wKhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cn8hUM4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgmXRF0C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cn8hUM4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgmXRF0C"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55w2V303172
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5WUPplqDfO932T8HETSyOqNnzvpg7DeYZKhN0l8jpc=; b=Cn8hUM4vWCtDpe2E
	ymdUQ8XfxpeO1hrFARUAN8PuGHifvXVHqDUGjLfgl7AzedtfJPo6rizshpP+Pqmr
	asR3YFvtMkiQlD4YA1T7zlJQttiWj1vwat/O091WKQXP4lNv5dB4n1YLKEUYMcaZ
	I6IhVWYCH0tVa61Lo2tpiJuFRNsF09P4lqrV95XgCW4b/z5TifiEWkHW+VSLjOJf
	25ngpFOT8J1xZhLRwCKruTsEbWEGu44B5WUq2V8+5TOycBrGuO7ZoSNIMuEiau/N
	FDCjqDe8R7lPexu5JtIFphsMikpZVXy2xSqKMgMPysuw9j1QsjD5DHRbQU/kcko7
	ENxPsA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dh7dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so1413578a91.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791785885; x=1792390685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5WUPplqDfO932T8HETSyOqNnzvpg7DeYZKhN0l8jpc=;
        b=dgmXRF0Cvne6VvLLUQUQ8X/P1KTzwR5BasO9nCkN7bWojuq3z44A+1a4rXyuJlIFL/
         cCfx5fCzU1Yz/6ZJINBlG28P4FIMCKPUtiTll/QgFo4TzZLZnsDnAd1ggVb/LN5FF2NA
         szbvlkAbmNKSWy7LR3YwBtiGfUBpkZqz3xclAZjK2xMqldX7CQ12vEVeSRVtly1bTgRv
         sjV1ILoA4TDFHLV6JZeNz+8O0AppmmN6T+5Vu9SGpO58y0C5ufxJtL8SNG9adgwvPxQK
         heHtu14P37VQc93pMMPj3F9sBSq8EoylVumCiDNDEZjWEtYepMsljNSwYpfD9u8JoqZV
         f1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785885; x=1792390685;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5WUPplqDfO932T8HETSyOqNnzvpg7DeYZKhN0l8jpc=;
        b=vR1Srx+tBFBPK8SqRJLlcyFt9uOLLK+/Ce7LDyALwX0vUvpDnQxqmGshLOTSQpD2jJ
         6QFuRI4SXaAkoPOohr0b4wRnp5KIcFIgBeQ6ZYFLuZ2ajtwxdH6SM1ay1fZzM3UKbT+3
         shvDABwoly7gCUsQEJ1DIIcxtiCETDIsEstOb3PkCehPSUGCfyNDqaCDu/x1yuNzDc5T
         5940DzD652OtfJdI0pGvX7FsphgLdjuBE/ASSnjDc5Qb0NElvXv7KrYfweftChL5d7m1
         XzJUF6qcWeBxsojEsWAu5g3H4DhkLweGojlvdXr2p4SYItq2z9cqArFjqLepB/egc8a2
         UBOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO/7MFvNRXvvFcmgOVHbw8sm5M13uncHX8PuGyTnJ2L0zkhIwFizklD5AhIGXZ7mlsRlGi5PmJJIDT@vger.kernel.org
X-Gm-Message-State: AFq9FYKU6gx/4PXSFO1K6VElDDfccAbWGihjGGVGInizZiRMIKrl8gpb
	d6dZmSnoHNXk3qVrgoS8QqqLG2KayEZ1dwVemINq60+Y3Vgp4V7eH7bOkOoPOGKh9i51PdhH2Tv
	prPBhVpPW+OgJbSZ1/xHcQOqQ8hqhGCqaYCm2UjpX50PrEeV+GjpBrJC9jEzvanG3
X-Gm-Gg: AYBFou39361QItZpYG9/PZlhrZBehDPgNqzd/zslQtiPUWVLPgnNAbQjmEcCsYf5ynU
	XSMILpzlpBqyqnJaMvJuaH91q1ZofPK9rUIraxkeTpnkzJtnKpZC1ad3MV/BRHCFNakvCLly1G9
	5NJilBBKCcnXdlEJpuGwk2GZ4tKubxXqMg2Mf76WSB33HmFypJ/DYg7oADTgrPif+ORGhRG1AAg
	eAFrwq6YoCV5SPbaLT8v9rxK0kALUMF72JaS0o3ZkJt1mL9UADu8sBSa5+079N6WTHUlpvOcO4G
	TJhpkJxVnA9pSBk/Z5PO10GtPj//tMFY812ttPNMKtESZ9gXmdDvheR/pAfvOeqj804kphQHrrt
	9HJBQ+yCNP705qDXwCkI9vDZGmkFXnJdYYw==
X-Received: by 2002:a17:90b:164b:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3ab3a97eb66mr6399537a91.29.1791785885184;
        Sun, 11 Oct 2026 23:18:05 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3ab3a97eb66mr6399515a91.29.1791785884714;
        Sun, 11 Oct 2026 23:18:04 -0700 (PDT)
Received: from [10.204.78.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm17543736a91.11.2026.10.11.23.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 23:18:04 -0700 (PDT)
Message-ID: <926167d5-e912-42b5-a040-be2bf220adbc@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 11:47:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB headset
 and Type-C accessory mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-4-6faeac3a6d59@oss.qualcomm.com>
 <ytqzmngqzb2ear5ovqexrzcw63t7plac7hvsbh3ce32krt4mfd@e3yyzs6y5anq>
Content-Language: en-US
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
In-Reply-To: <ytqzmngqzb2ear5ovqexrzcw63t7plac7hvsbh3ce32krt4mfd@e3yyzs6y5anq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX2irpOUnhrA+O
 oSXslDdPljsB8pt3HYBZFOo+TzVmIoV4wi18Mr/Mg9iA+DhT6S4ql4VSD4KtDv0Yu26NpaaPneh
 ckxI/ojhDyNQVhsCbyYYkzFEcGJu2Ar1bgyhjPHY4U5U5fZV9kpqyFx/ociR8OgmuHmLlz2Wbni
 12Z2SxEI8QaGFc7ZJO0yIEwZ1kx1fYazhuarwTbBE9wz2ovIC2Gh9Y2koXMZao/P3VWZhRAVITR
 /5p5ebh2lSSZehxcWVyh4V9J+YIWgNewaFGJV7yOD7BqqLTNrXN/HUFZOCNlaJsT+1tm447XDh9
 2ff2xLJBkCEO7yOE18VKsW/TqsinHl4dx1wFBHYZ0wJKbZKQmwqF7vO9QtXqrLJbHLWQQYJRWLy
 y3BPhF4KGNKtfG6P/nGgtICShCAXl9F+tdTM8z3Nlt7vQCDQb03NxIFWt0l6XDvMEUwaCwLDl0I
 g235eIIv/EEW0pJeFHg==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acc7b9e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=84AGO2jvVljra0sjFOsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 1pxK7OsTIuX-CGQIcaQILtiC9IkswlFk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX25rQoAv8X6fR
 FkcLh0CAZ117dMGvggAqlJo2ma0VnlGTEQwZRlPxZ6jTve/NbqHkWhqPp/V1iED05ilbqJtiwtj
 YK7qTCtPJa+P/W6rEgKjHpK1im+34pc=
X-Proofpoint-ORIG-GUID: 1pxK7OsTIuX-CGQIcaQILtiC9IkswlFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120024


On 09-10-2026 02:04 pm, Dmitry Baryshkov wrote:
> On Mon, Oct 05, 2026 at 12:54:29PM +0530, Balaji Kalkonda wrote:
>> MTP does not have audio jack connected and relies on USB mux (WCD9395).
>> Add necessary nodes for proper audio headset support along with USB
>> Type-C accessory mode and orientation.
>>
>> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 51 ++++++++++++++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>
>> @@ -916,6 +926,42 @@ &gpu_zap_shader {
>>  	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
>>  };
>>  
>> +&i2c3 {
> No clock-frequency?
>
>> +	status = "okay";
>> +
>> +	wcd_usbss: typec-mux@e {

Hi Dmitry,

The default I2C bus frequency for i2c3 is 100 kHz as configured by the controller driver. That is sufficient for the WCD9395 USB Type‑C mux use case, so an explicit clock-frequency property is not needed here.

Thanks and regards,

Balaji

