Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1745A3C3430
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868464; cv=none; b=JuNo/CaCN1LOG6NecURjet3ygNy+D2/kpGpan58jZYP0+L8vkt5syIruMiAbnfopFyDU40n4y8o6twKUwXBxPotM87qe/skJLXYJuJMJOTrmYsiJ8SlF4wBntcpShL8VjnX9TWcQAR7ZNxDHOmLljUlTz9IAA53cVOlxVKG+LMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868464; c=relaxed/simple;
	bh=ARUVX+Cz/NcKZ51ywPohYIei3R+mpwx9bHsCMmPwDWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bx1IrsG1pJQhYWzJ+8eOAu5N0zX1/tNBbZPTr176Imlh7uPodcSiTyfWhIEjBbi0FSmytt6sPM0fg4uSbDHzVFirBZSIBWol7vLPYZckW4gotHC7ytPwWBJ98JubA/GBEuTJAaNFxRBYewPx5plW+/SbasByvx5ZOAd27Zf3kME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TI1svWKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fl/8zFck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TI1svWKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fl/8zFck"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6R9RJ3332318
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EeRVAsSMkhzdHJKHnccV+fvO1GvVVfjQQqXJHoRadb8=; b=TI1svWKZ2e6f6EBC
	m8B2CZZpIX0Srh9Uop7eBAg2IuTrQnsk2WTtdWhbr3xlgBkG1XTC+GNk/pi5+WtT
	alYsfr4B9yyQUev+R9nnmqbbk9aQHsJE8BTzb/HCktz2UCT29y2Y2TdL+VeGuinz
	yDfy2cwaAzM8GtmD3DcnIrSlUs25qEtPp7PF/jcZYm5A6NZqrjc+AYx5yYphVCyn
	U2jcV3X8QnVZicWbxwSgjOschcxj+rJus0ljoP7TN+2CC77K57QnqLgx0MS9Vcu1
	b42qvM8uy1gt4N9/wClwhXzYg0bdqn15kouBslbJ7IvDTmMQtbD9/l+XV53fmz4S
	mZXVDA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afwux3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:01:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a016b99579so4980806d6.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774868460; x=1775473260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EeRVAsSMkhzdHJKHnccV+fvO1GvVVfjQQqXJHoRadb8=;
        b=fl/8zFckIpGFWZUveE3jIUOKFYVqMlHfod7wc7GIgc5kkUrCT726z/3dTCzUSaDfVu
         x6IMOqL4i0p0wtxUw9gzEcMncc9Uzurn8jQBCBfBa3gvZ+TXY4LamUaw/JMY2N1r00+7
         M3141GdvMl5AUm4NdyQyBu5btZx7CJj/JUoiaqZVvUb797dkn8RtdBIbd2tcP5I9+Fg7
         H/XvmarJGwYr81GRuAIl82rH5VGHisi1A2kVHYXxEzR6pXa0LnyUFfy+uRf4E8HgJm5Q
         37aC8WOQRtEgt4lA9kFBqSQBTGXAVzQzJV+UOiWElFZ/mtZl3TYwBDOWrIjpZSqLY3Yo
         fq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868460; x=1775473260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeRVAsSMkhzdHJKHnccV+fvO1GvVVfjQQqXJHoRadb8=;
        b=Gv8D6xkGwcyKTiBWAQrQmiYNHLo0S0mVGB/Axo+yqBPnssWbkyOFrFr2C8YSO/5a41
         Q8pX/Fq6/Re3ikB4OMUVAO7vHQAxhMj+2VTAonKS9YBsdWJYpErZQI3MQbjt40EnyiHZ
         bDjZiNJm3dhilmkIh54BRKbQ39Nb7HuEX07aiDHN2GRp1HzuzrsqHPy7IeN1XKhQVsTD
         RvjLNid0U9Hmm+Ah1UXJgtD1NZu7QaPYu+mWKFAX+qmv2yXCwqLFOtiV20pulwjBUiND
         H0f8rpoZKsQ+M+A7iR+Ee6TSgD9sp+HhNfZU06oo/bxE4HVivCiyjfcA1pt+pKk2Z6KY
         EmDw==
X-Forwarded-Encrypted: i=1; AJvYcCWdZF4nNc360efiANeWWGNPfRhIO4BldQF7COoz3sznb3975p2MvSMtqyP6kw46cmCutMW44WUKLCp2@vger.kernel.org
X-Gm-Message-State: AOJu0YytoPx46bP5lBG0eFVmZa5q78de333UHmMr+Xwl1vwpKP4TvKqs
	SiyKGL8XgxL1onk9nnBt/tFF07mtjibwdluI0FI8GdJWun3GIA+PWUAN3griyM6q9t8XukVqOsm
	XHsJx9zJODgbizuHiXQhwyFwrJkwi1fwqxACBA/ZK/8macqqamxTOuGXWkp4HN9l+
X-Gm-Gg: ATEYQzxdVCCBUP5l9jJeJnFdkL6CibEK9IyFtESObvbu71XJ/gBoWGueZ1JTf9OS9uv
	KPZao0IgjXJGe7EQ7VSzBRhnzRaTaqnxt+F048OPKFq4gm3vZ2LbmZ+7+je3QHDtlHJ0dlkaOEW
	KYqBCpJGNfhv4CmZzFb9esvX8Pn4ogpGAUyJ/0ieCK/dzEVST570WOlvTSW3yl4r3vmI3RqDssU
	sHq/QNx3EyMvYktxOH5y7/MGLY0NTJcPSUGb471M4icENVPQwgX3HL2FGhVMTFpvlCwJPiZJafB
	AKFGk/g4mi7OgLhAzRohZEQm8LQm3HH6BMQx/UvLBil77wJUkMyEndonlwf3u8iy2iir7PmVW7X
	TymOgDpye9xktHO8KjjXJ+OgrHALIbtYRMVIblOulFluewKluUti3e3GeMsEUA40cv0a4vllVvS
	Dabr0=
X-Received: by 2002:ac8:5a04:0:b0:509:a3c:e390 with SMTP id d75a77b69052e-50ba3932f17mr122293391cf.4.1774868459829;
        Mon, 30 Mar 2026 04:00:59 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:509:a3c:e390 with SMTP id d75a77b69052e-50ba3932f17mr122292391cf.4.1774868458967;
        Mon, 30 Mar 2026 04:00:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae7416dsm278302266b.28.2026.03.30.04.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:00:58 -0700 (PDT)
Message-ID: <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:00:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com>
 <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
 <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yPP5KrkCoterP-_fYEmbfbxA-luC0zRT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NiBTYWx0ZWRfX4tm2iA4xWNGw
 wLbxWZ+qt5X/PjaU/OCSYZPACI6qbi+ZsVWIAmv4t/Umdmu2E9RrHH0PzsDJOlfG0t08yGQoVmc
 PU988FdawGL+Mteb8HLi/Ml/5YEsjeca3eTpaiPEN8WmyJjAwj0YVlqaTB4LoOo4pOa+7yTGrdW
 xnJKQcAD0z6LvcjbrXtrv6u4cGkRXaIppCFVqYyULm90kFJWFwzGd+mchQNLO+WM+aRsO2Pg0g3
 apEsGskyrHqDedy0cBopXaAtDTMteqR7N2n7K0A9egrXLm5E6y6JMCxN4DhxXzlPqKFso97VFMR
 hkwwuUiZVfoXZqz1TrSX7IdtBBhOEm3m1j647OI4KW2ZTLWy+ypWvTzfxKeeYbrwVLWv/D5KLP3
 l+RIByGa42yHfkTRbBeqp3PeBAttGj1EzRiszHpCVxGzqZ0mewtUb2UQF9+lVgxLIpX35ICPtR8
 MekyL0FLpyKissrRvlg==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69ca57ec cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=5tAmg9hwAAAA:20 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=2ZCcOxo-1ny99ew3dTEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: yPP5KrkCoterP-_fYEmbfbxA-luC0zRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300086

On 3/27/26 10:26 PM, Aaron Kling wrote:
> On Tue, Mar 24, 2026 at 7:36 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
>>> From: Teguh Sobirin <teguh@sobir.in>
>>>
>>> This contains everything common between the AYN QCS8550 devices. It will
>>> be included by device specific dts'.
>>>
>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +     sound {
>>> +             compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
>>> +             pinctrl-0 = <&lpi_i2s3_active>;
>>> +             pinctrl-names = "default";
>>> +
>>> +             model = "AYN-Odin2";
>>
>> Is this enough of a distinction? Do you need to make any changes to the
>> one with a HDMI bridge to get HDMI audio?
> 
> After this quesstion, I tried to verify hdmi and am unable to even get
> the connector to come up. The lt8912b driver complains that the
> connector doesn't support edid read. Which per the current connector
> node is correct, none of the devices list a ddc node. I am trying to
> investigate this further, but vendor source release unfortunately
> appears to be missing pieces related to this. And no other current
> qcom device uses this bridge to take a guess at which controller the
> ddc is on.

Go through the I2C buses that are enabled on the vendor kernel and try
inspecting them with toos like i2cdetect

> 
> On a related note, I'm not sure hdmi is covered in the audio topology.

Since this is a DSI bridge, I'd imagine it needs a separate connection
to the SoC's sound hardware. We've had similar occurences in the past,
e.g. this on the SM8250 RB5 board (qrb5165-rb5.dts):

https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/Qualcomm/sm8250/HDMI.conf

Maybe +Dmitry could help you out

Konrad

> What I'm using is here [0]. This is in a fork of the topology repo
> with aosp build rules added. Speakers work, headphones out and in
> work. DP works only with the pending q6dsp fixups series, which I
> should probably narrow down and ask for a 6.18 backport for. The ucm
> config [1] I'm basing tests on doesn't handle the built-in mic and I
> haven't been able to figure that out yet, so that's also unknown.
> 
> Aaron
> 
> [0] https://github.com/LineageOS/android_hardware_qcom_audioreach-topology/blob/ad67f3777b1d4dec5289bc7117f2ec34521be7e6/AYN-Odin2.m4
> [1] https://github.com/AYNTechnologies/alsa-ucm-conf/commit/d33738b93e9560e8d9e08a024cc84c8055bb7eb9
