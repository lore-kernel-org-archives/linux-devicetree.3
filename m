Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C66D30E0D5
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868508; cv=none; b=ZtTQgtOZwG4r/9nolIyCQwjVNnJbwP/vXQh1nB8DosJ3vSH3g8jSNN/U4pKLEAMV+DOEjKmKeAWYEmyGi85SsVzBOKUyDc9SKl1TrjlEXmWv9soNQPxD/Q63kQLgP70QV1dEdWWkhZeRCpCkZPn3YtiX3ib5ayvF1m5i3ifkmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868508; c=relaxed/simple;
	bh=JFh+xNnoKLCdx3iWAbtKukgzFgVO0o+uzr7hE2HnhXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rI1YdizzoVg86MsP+6v1oSEL1/YYBQWGJo07a5rp3+IRB6aKvPabXv8teb86ndzQ9zURxxRxaPZVnYxRnh8kuaXtO644WuPLkarz1Q+ENzDarFtSpnGmvycs+xZVL57H49bXlyNV5yuO9p3/CWyJPry4NPhsx+B4ERg4KkpNaB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5hrkdmh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtNnn6c2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5hrkdmh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtNnn6c2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U8Q0KU2458393
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NLbhdNcu5UWnfkVoa3B7Nk2/0oy/YJznAwccPowiRbU=; b=A5hrkdmhuSnQl46N
	ZPNv0tcHe092Cmwp+RzU9avGWmGtHIVmPEt8zDjfrJWSv9jNwZ/vAu9YQF7St9GR
	8hSn3/K7C9fdiiD0BBmvxNvYH6QKkNbpzqrRdKS2Z7HxwnghLYuGiUzTFQ8MQ0LV
	HAMTtT6zT4k1N+yZcYhcNw0RFfMBxKJr0zi6zSDEiR4csGMkBlMjvaOpyv8Gotvy
	MIg+LDNFqiFF9bqYy7w6AxnvVcVes/MvKAIgWp7PNnZN6SjE7vm2EqJOpEQF+Tbe
	/X9hbHC9CGXnI+eed+TLo/yOVUSv8lLxZvFfnW5yVtGIfYG4N05DfJwG0FV6+Z/2
	PcBCxg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmrm5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:01:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56cf5690c13so272068e0c.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774868499; x=1775473299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NLbhdNcu5UWnfkVoa3B7Nk2/0oy/YJznAwccPowiRbU=;
        b=AtNnn6c2dUd+/sCf/+JS9RvLbB11P7n9qcrmi4ga+qJPckhNVgp62Qmd2o3F5uYP/j
         XfQ4yTOnrbNC1UCRbSiVGN/74cj5i4G6d1nwdBIK6B+71d0KQTb/PmZ7aFrSELkqVvuo
         vaUjLjyzE1bgM1Oc5prtR+CvMzjFHJyJYRWjUgce4GU1+bFJWKVEdGJufvStSeKmNN5i
         jaE41kG7LwpD2an4VytyNadBKM6TONT8TKRWTxDl9clgG0VIjYMt2x91KKapFgeHFr+U
         dSzvBGp+8oCRTRnzLhJYGjQpju7sQJbf3PgJRhAFXf1pBmStgNOGKJ29eBZYo3VPJ1le
         ylgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868499; x=1775473299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLbhdNcu5UWnfkVoa3B7Nk2/0oy/YJznAwccPowiRbU=;
        b=HVyEWRPzsEUdDRmLc+IMQvK68ZgZjukuQzDyHK6fxY/JpHFJpZ/eMAvIiB43/zKF2p
         4Menw397qAptHjQN/wiS4YNyY3yBtEEkJH+//kiwR8U9zW4iMwooIEwzAJ+LZKgDAuLi
         UOXCJLLjuQejVmsB2l+7P54cc5svt8S1lFC1ZLuva5u8Pbgc/kyD/LgpXF6rSoxpnkjP
         igIDTVFWGC/7ZQnfnnBcBW9qzivMzMPFivCiZc72EPbmcv5aSf3wpLfuNZeYVfC0I8ET
         ioB+FNOYjzFXohP5K9WIuhxoqbWJJC5fwnArNKh+96G7YfRZcbJiOHBKHmvSEUAGdFAK
         stAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx9mY7gLXb+GfDJDh+357/ffsLlMKQnnuhr88QWkqA+xeWKm6SrWNfg0gIg1TE3y/kXIM5G6Dgh803@vger.kernel.org
X-Gm-Message-State: AOJu0YyvFWSMl3G1wo701D2OkQYWHBlvx9E1+qLcqofOiEPeNYb/xvhQ
	1QHPRkOs6AXp74HFhjKlUpRBMhd0kEPt/1DcTVNWC7C4TUBFktiZ1Qbgq6sjCa5EjU8eXrOmo5X
	MqSyy9re8js9jzR1+oHVjiOHRTiybEUxsWHI2aB1fp1xQEmfmZ7pjQmAt7/SA/aBvE1IMUntt
X-Gm-Gg: ATEYQzy8LsYPR8aVaRk9PI5jm39VbK8jZE7f3zgkFSab6c8w9+InUGztfQo26yFo+sj
	g/pCxMrsaeC8c4yq1cv32wbfEcsMjA9TBsZkT28qEZXJl+Rf3G0MBCBU/yNBfDw/PySxksTrpYe
	Td8XefxL57fhEugJRduZivwocHA7EsH/K1NcMkXq3XabsLnzSR2Nb0hEP6CTdg3/x2Ew9K5ykz5
	/6ZO30qOKVwQ5nyAHdoPpoLOnvbD5gdSKR0F8b4GzGgXImhUDVF2K5+7itdv+GSgsgSPDO5/IDv
	K7hXfwlOHpxNwtWGu/+aiWILhnbrgwqZdVQhVMN39mreIFmPHRbCyPRRHi3Sc0ct4NzCxOpBhLU
	r250AjA1vCvNqhmkgzIvMO+OxTNWFE1qxh/ebgE9NbnmitvQQ8eMerefJa7oT+w6We0/niOBNte
	N9C00=
X-Received: by 2002:a05:6102:750:b0:5df:af0f:309b with SMTP id ada2fe7eead31-604f928b9b3mr1466269137.5.1774868499471;
        Mon, 30 Mar 2026 04:01:39 -0700 (PDT)
X-Received: by 2002:a05:6102:750:b0:5df:af0f:309b with SMTP id ada2fe7eead31-604f928b9b3mr1466242137.5.1774868498817;
        Mon, 30 Mar 2026 04:01:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24d81sm284138466b.12.2026.03.30.04.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:01:37 -0700 (PDT)
Message-ID: <801f089f-7d3d-460d-890e-b0b170bd3ec9@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:01:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NiBTYWx0ZWRfX7jpbRrkZdkI6
 IYuEM/4yMO50xSLCiTb5YNP7E5bqZQXD1eyE+YU3jioHLG5WrCACBE/RHVhjncXdNygFFQlEFGr
 bWNCict1WG22gD8g8orpxLuY3JduW4l0IpIuyCqJcPSKlP13pSL/7yxzjz5CQNQycrApgRbml6J
 Qjf03yOEM1bT+IA9/ZSD0EhuA3CqKaqkfDok1/cFMsz/KWQ5snIoiJD1BRoEqIcr7qAYOVaqxsi
 lLri/ackxhY7SSGNutFHdy8iMliVeJWpiwUHwyqsuxhY8BM3bgdOi7cNglWCxvWN4XXb26acsJE
 fVbSy5ZK2/bbeorIaOUlahv8ap6QuwEKhRGK6CM8Cz3YL0wvl+EXdQUV8ftQ4pig9SQG/24ppTC
 XO2Zxf8CA0W2uM+MmpROFZ+dw96joZOSp34m4e0ZefG+IwqPt+1ws2MKrqV530Fg96UicWh4uVS
 E7bEFwyTKlQ/dth9Wjg==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca5814 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=5tAmg9hwAAAA:20 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=g9K1X23dYJYEkdOYvrIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: j4qsbOU-kuYiD4X3shgsOpcVsxy-qm1W
X-Proofpoint-ORIG-GUID: j4qsbOU-kuYiD4X3shgsOpcVsxy-qm1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300086

On 3/30/26 1:00 PM, Konrad Dybcio wrote:
> On 3/27/26 10:26 PM, Aaron Kling wrote:
>> On Tue, Mar 24, 2026 at 7:36 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
>>>> From: Teguh Sobirin <teguh@sobir.in>
>>>>
>>>> This contains everything common between the AYN QCS8550 devices. It will
>>>> be included by device specific dts'.
>>>>
>>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +     sound {
>>>> +             compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
>>>> +             pinctrl-0 = <&lpi_i2s3_active>;
>>>> +             pinctrl-names = "default";
>>>> +
>>>> +             model = "AYN-Odin2";
>>>
>>> Is this enough of a distinction? Do you need to make any changes to the
>>> one with a HDMI bridge to get HDMI audio?
>>
>> After this quesstion, I tried to verify hdmi and am unable to even get
>> the connector to come up. The lt8912b driver complains that the
>> connector doesn't support edid read. Which per the current connector
>> node is correct, none of the devices list a ddc node. I am trying to
>> investigate this further, but vendor source release unfortunately
>> appears to be missing pieces related to this. And no other current
>> qcom device uses this bridge to take a guess at which controller the
>> ddc is on.
> 
> Go through the I2C buses that are enabled on the vendor kernel and try
> inspecting them with toos like i2cdetect
> 
>>
>> On a related note, I'm not sure hdmi is covered in the audio topology.
> 
> Since this is a DSI bridge, I'd imagine it needs a separate connection
> to the SoC's sound hardware. We've had similar occurences in the past,
> e.g. this on the SM8250 RB5 board (qrb5165-rb5.dts):
> 
> https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/Qualcomm/sm8250/HDMI.conf
> 
> Maybe +Dmitry could help you out

(mentions work better when you actually add the people you intended to
- fixing that)

> 
> Konrad
> 
>> What I'm using is here [0]. This is in a fork of the topology repo
>> with aosp build rules added. Speakers work, headphones out and in
>> work. DP works only with the pending q6dsp fixups series, which I
>> should probably narrow down and ask for a 6.18 backport for. The ucm
>> config [1] I'm basing tests on doesn't handle the built-in mic and I
>> haven't been able to figure that out yet, so that's also unknown.
>>
>> Aaron
>>
>> [0] https://github.com/LineageOS/android_hardware_qcom_audioreach-topology/blob/ad67f3777b1d4dec5289bc7117f2ec34521be7e6/AYN-Odin2.m4
>> [1] https://github.com/AYNTechnologies/alsa-ucm-conf/commit/d33738b93e9560e8d9e08a024cc84c8055bb7eb9
