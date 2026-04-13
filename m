Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73899359A74
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076100; cv=none; b=GYGLEnMe7VR7iW2AgO7QKMuQFzXyDlNJjGEHtvnYEdf1zkVHWerbM7vo7u/kgfT85l7JYDT7Jqzli38Y0vVaTgEaKPdcLC+D40oAo4ZbfgtfuR24tgy8bIHvYZjstSYSK0xbyjDlPJLuI5zXvw8aMwwg2uYR7b4jgqf/5XpWUAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076100; c=relaxed/simple;
	bh=520HCNzNl1sWOG6nBPlnTcUG1Z5hSl2ONS7atA+WwXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awH51oAVmsgegdmVzYS0rKAh7d2F89Th/cdUJ0gjXLXvfaeJGopitdFbFv9cHNhI4s0g5T/8hLutMyjiN+4NIZPvLQPQ6aL3YFZFp+z3I816dzbRLe4CSk6z61mp5MnqVHkqDSeggiTPuIPO4LX35UgHLJSkcLd8oNsp5eHUlus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPTLfc6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWDOJVv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPTLfc6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWDOJVv4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7G1v23715533
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POTznDhCFEZb5zSxtLI3VxuWht6Xmf6BEG55kx/hiMo=; b=JPTLfc6ihCvUXklV
	zPsQByhevPPGW8pbJThF21oDNzBTXVf0tTaUAmT5EDIr3ax/BKyTKOVOMk2HP/pe
	Awi3MU84hjIPqg1ioEkOIFOzMUnt8PhK00wDXQjqjiSXDResir15DCzbUteae/l4
	/VCbMjoJr8B55X3NL21uZNXIqE00vBGThzuXvh95g/OQuqynQWENXV60EZ0zrMqJ
	nEEtBx8uJ8exF3zW9wsq/uoat1CyvptM9FWj5vY3hcSkGHgNUEb/TrGu9qoFcKgt
	wzgUKbd9jcgKqnHfnlPcSLBKLsnki7VxM0OFQprO6jGG1wdQQLU+Jprn23GFvfG6
	F6ilXg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcvur2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:28:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5073ed1ec6fso11273271cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 03:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776076098; x=1776680898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POTznDhCFEZb5zSxtLI3VxuWht6Xmf6BEG55kx/hiMo=;
        b=WWDOJVv4CgWY3L4toCFM3LKlaZQ5V0+pJpClckX/6Qu/Oex/O0eLYqD3BPqRXX4r31
         +8w5wzfaTfHseZWwdzrbMAZwYkaVGe3lKv2t1KavQfJvkjVccPXINUvt8QDFEdV+F4+m
         EvimDLj+gcflKj7orZywrdgsG5zMGACW6O3W/2QVdGbcQrk11ODA4EWzITu37UVCfw8G
         pW16IerHdj6ZatNCwj6naP7aa3Z1jhpEqBdXEkaP5eYBHYdFSF+cqw/PGIvUqE/HCk8F
         RIxbBcqmXwRnzrFFkEbNoFEc/fN8mBAqymQS8HbJ0rCH1DPoAdhMiUETX0YM6s5+G8R9
         6rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776076098; x=1776680898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POTznDhCFEZb5zSxtLI3VxuWht6Xmf6BEG55kx/hiMo=;
        b=gD478OGYWUxmHunipGIcPIvr2JlFWePqIZa5Lpjq7wVR3+Zn/+n3VNqG3P2CT80VKi
         PTTIZJ8uTtkxiAWaAVdVzcuX+N8WQjuLZ1IKz7IJcWRiJjyauGombmtna41K21P1Tt4i
         lpigvTiqCB41Qx4KNIafMa14E5dtBfyfebydPN5njxqF69s1RY3yuA6WHh8cdyfW7UD7
         Dp80ZcVqILskqiSTvEzk8nCrRgUyGkQPjR+zGcKK04uhv3Qy/2RLnsFHfgJ5O61QPPhu
         Iy75H8IHayT084Jo/F4aoVwXvoSg2EXnGdX90RwfZGEfeZtH2kKI4fRPdn862OPYbrcT
         gZMw==
X-Forwarded-Encrypted: i=1; AFNElJ9Z9ShB17/aiqo9aesFjIj/NZHa+4IzaD/4V4hj6ZNlXVCAfjoY2QvGhYqOZT16z25Z1qXA3BYwYswv@vger.kernel.org
X-Gm-Message-State: AOJu0YwS0kIG6chwK1mdbx4+/Dn8eolX6kF9jnYJpTN6NPyt8Ntan0U7
	3kzsjOGEH0GOFHrQVOMJ3n1DHh8jgYcbHJtr8D+ZSwTJ7gKOq5q6IiQJU+RT+YHuuZ9elidKJN4
	yIkK5bx58XQpy1HSy4h1xosnjtTUhxu9WLXfxBScUavywMTmXdJmCWDn0TRMmMbNL
X-Gm-Gg: AeBDietGZbA8bBFLxrPQL4+77pxmE1U2lfw63l4jubiqQeydBbiawqmJ6FmBwMTsQVq
	PChzk4Cm9LNkTd35i3HmUuTRpSdVoTCMwvekv3WEetduC+lMWAsJSGF56IB1k7GQgYm2Zofn/vU
	ice2ynL7TcjML9SQ0KmzmB+zMcbEqkXCQag+EF2g5+W+A1C2C3QgiIxwG5z4aExB1rDOxeZdClg
	gtPFf5HNV5qbj3uizPnEiBnMJbORp/Zr2KnGytHKsYt7pbo+3Q1u9T1iVZyF2SPn/CIHGZqYpCl
	4jrheeRwEdwjaEc092IFuoPHRCxSSBzR8YK27SAhLrdKTd4xs0fMgR5/tUPYAeNjdz4IcKeohXq
	mTppH/exdeS0/9VCNnC7q7C2nUXF8cXGlREzczRI6wEkvC/45CVqG+ow6lMxDJ9lPrkdgf9ovMW
	zoSHQ=
X-Received: by 2002:a05:622a:13c9:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50dd5c80b59mr136426461cf.7.1776076097872;
        Mon, 13 Apr 2026 03:28:17 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50dd5c80b59mr136426291cf.7.1776076097418;
        Mon, 13 Apr 2026 03:28:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1765sm288699266b.56.2026.04.13.03.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 03:28:16 -0700 (PDT)
Message-ID: <17466128-d838-4621-ad23-21b0975d85c1@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 12:28:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 USB 3.0 and HDMI ports
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-3-14aca49dde3d@radxa.com>
 <eb745e3f-4bc6-4713-97aa-1a1a584c9a9d@oss.qualcomm.com>
 <63630053AE2A689C+fc86c1c4-8daa-4af8-bf64-b432fc8dc1c0@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <63630053AE2A689C+fc86c1c4-8daa-4af8-bf64-b432fc8dc1c0@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEwMyBTYWx0ZWRfX+fZzmyY387dq
 QZWWIQsEBM/CbphPqvmqbEWZ5LAQxomMLVvOCQh40As3bd/v8do++Xwi4ryF3JJyw55gwaW6K5X
 IEz//8p4bbszGltRZNzkeEbVBvGsgEbs7wq3V4x3XM4UMDw6YdawAkJQLLdQy5Uo9PBJ3jCtQ43
 fGNGAwVerQmKalCYn/hnPMaD8XGDU4XhAmc8XWhyM7BS2vCRUx8kNUTL3bRTIye02dZOrJ3CctA
 r/xBwSivAiNQ/QmP/Tb0Rc4J/kHQUm8GM3LcHzQ+rSAMEse5eHoBnR8gyoAgaQ/kQkEbLFAkwRy
 lcMWgZT0BpFrhPc1IjfU1w4tMpbn6GVkUJmowj4cAA1crNdRminwOyNQyeuMTO1ybJmb5NBazQW
 o8mcPFhf9ocCm2nWi+Om15xT5eWJc50U8eukD8Hy9ZuRCll/Mpvn7hD6xrKTVbQOmcmH4OKgrQW
 uH4B6FNokXOCdZC9Jvg==
X-Proofpoint-GUID: ad68lkyoomzdMRQJqXqBnLAuVXU0i3Et
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69dcc542 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Asw1XGY1sTAMn24vslgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ad68lkyoomzdMRQJqXqBnLAuVXU0i3Et
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130103

On 4/12/26 5:14 AM, Xilin Wu wrote:
> On 4/8/2026 5:03 PM, Konrad Dybcio wrote:
>> On 4/7/26 5:19 PM, Xilin Wu wrote:
>>> This board doesn't feature a regular Type-C port. The usb_1_qmpphy's
>>
>> I guess the receptacle on board is power-only?
> 
> Yes. The Type-C port is power only.

[...]

>>> +&mdss_dp {
>>> +    sound-name-prefix = "Display Port0";
>>
>> Hmmmmm.. other platforms call it "DisplayPort0" (without a space)..
>> But I suppose this name needs to match UCM..
>>
>> We'd also normally push this property to the SoC DTSI
> 
> Actually I don't think the name is used in UCM. I can rename it and push the property to SoC DTSI if necessary.

Let's do that

Konrad
