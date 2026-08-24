Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8617379987
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548301; cv=none; b=YdLJ0lLanKHAPwVp/WyjIFhXYVajx1ssq54mHe5NWR1D2JppeWbXzJKXNJ6SfJ8KDcpjy4/tQfrQRFZ9RLWkx7tnk2Fv3xFd0mxGOSgL1ETZzSSfewpBv/G7RZLfMR6R6Su3mIh5gRPqHLITdzKLvvDhnanITzwFo8EaAGuHn8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548301; c=relaxed/simple;
	bh=4+VlY2D06jTHF5E2ToUSpDtRWNDTChr5h+Bq0QmCch8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2x/4mom1Z5ty9kqKDu3wgIdQbOaSwDPpj3/skRhM0bVMc7+Q+h2JIVHfHlEva5EtPvJBsb864UJMz4xVOY1426FiAsNm+r++yFXJ2S8ZqF7stjjCecv3aoXwpRFPjcMCGD67Zbhm8XurB2Pk7tOa78C4Ii0D5G4nTOAAOwpAy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C752QwXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9qSvyAa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C752QwXk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9qSvyAa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0mNP3984211
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+VlY2D06jTHF5E2ToUSpDtRWNDTChr5h+Bq0QmCch8=; b=C752QwXkN5e9Jl0g
	oMZCfLm7ekaP237CqxsFn4SHeEKMqrw1iybu504nplBNW6AdHzhYKtpQzm+KoCex
	xlq6SDWG14eeYwXaYZbiwKDk4AWN10KCBzHt5/wicQ7cL+AyQlPC6iXtJW7uPyU6
	jmrEtbOsYWYz+K+HSzteBX6yp6XE5eNSRGX2B+ku9r8CeZxN97ovc1plDzfNIc14
	UN3XQnJIjn3f48HS3rainwTdWdqMWwJzhOiG4BScPvDUM02Oat8eaHDorfjRO1O1
	OOCQjkLDriruU7zOt7XiaHsiBB0KyWDqhZH744ThHWsaTXHDLCsWbrZ0jlLEd/Dt
	+DpsSA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7456wgqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:11:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3447153a91.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 22:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787548297; x=1788153097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4+VlY2D06jTHF5E2ToUSpDtRWNDTChr5h+Bq0QmCch8=;
        b=M9qSvyAadguaGqKwqOPbYb3YiiCNKIQLVMN1qLMowP5CTyPF5n3Wzf0xWpDPB+RWG5
         Mv5LnvxVuORyTmvXltI+A0fgq1t1hO0iPp1wy4dRzTWfdFIbn0qgG1Te8zYTPYcaGKfy
         QmPxfFcqP3DTDivXR2B2gcjUwwRrahW6QABkoN1BECSxMXWJUdTrI4xwTkb66Y/wQ7sM
         aL4M/fET+bcryLagYuvX4M42R/AK3y74vIJTcviyGqlr+K4JaDTVswOP8Urh3u5Pc/BG
         7DbfRbaD7iPtKKzDh2C+NvbOXaZ0C/hSoqaTeqSHZwfoO8R+cr31dxjLsQYyo0rR3czu
         vxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548297; x=1788153097;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+VlY2D06jTHF5E2ToUSpDtRWNDTChr5h+Bq0QmCch8=;
        b=SvLOJF3FfUcChQ6d3G4wZrk7FlM0K3dCTsPwOAvng0D0KsOi9PJB8enQpe/f38FmnI
         rmgiRJy48qwRgAhwk0wIePqYDHMfGOynYk7nokvnKD2xU8gi/R628VMJjoQo3Voed/rV
         BNS7kouL84EuGae1ZGxTce07tvmURvWXhcXx1wPUA8DSEncT77a3kEB65zwOfNHiqtvH
         /kiJ2VmC2OafnnH/dRBzOQfzP0g/P/s/meZkTjV2lZ7DHpjpmsk+Y2c1xJ91oO/xGF9S
         P6rI7JYcVtqaoZtFbHT+tsESoBBO8y++Z0sWJPRFdjYjYJM1IOSQJ6lPiWTIdKN1NcFA
         7dXg==
X-Forwarded-Encrypted: i=1; AHgh+RpqQRfa78BahlfzxglQ5Gy90655BGsVKorhifo88jpFCyz/ckJcYbQjynsxoz7tKndRPyjzhYZtosfI@vger.kernel.org
X-Gm-Message-State: AFuF++lzGWzcEltLuiRhxTkqG+Es8e4gEvVSV3YfY1Fthnl/e245dxxF
	tRQ3bCS+JJuvs62KEw1OBNZPuqf9eMJrilUmLdvJwBMtFA54Camw/V4B/jxBisWgQu+mQblhbsT
	J5y/Ro+XNt+YXAoqcucqIiaQQlRcrn6dakTl5WwLP0f3cqX+H2NvHuFK1mRrNFXyO
X-Gm-Gg: AR+sD12kO2ReP0ASOP5rkpRZso4T/seojeDS6rFAuQejDSVGUW/j8J+dBL1MRTqYPQI
	7tfHQF6md0vNhv++FiZ1qus78y57mEElJtvHvjO220Mm1SLUcjpldFePmldjswcAwZqs+RTG+bl
	fwXUM0LXJU8idLIuMcSLWwFGGx3osPxf/LJ7mrclobPIc8Cr1vfxsZOwONbbIEJ7wT3rMZvcNc6
	JgsKRP6IcY6JorSouoY7FdebEdEASwHglXzmREZ2zTwsGOnP6p+dnraWfnoKi2wd56KCJVQVrbB
	AdOLwKJTEY7K3jY9Xct/b9+JdAWJFaSnFbj2vjjjPd68MIyI9MM3lpKEUSP2RoUqGnWZ5osvXeX
	xrJhBKluV8Qsbp42mYTGhggnFR3YVs10t
X-Received: by 2002:a17:90b:3fc5:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-395df5ec7a7mr27572430a91.11.1787548297493;
        Sun, 23 Aug 2026 22:11:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc5:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-395df5ec7a7mr27572358a91.11.1787548297002;
        Sun, 23 Aug 2026 22:11:37 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ec7f7sm22225790c88.6.2026.08.23.22.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 22:11:36 -0700 (PDT)
Message-ID: <a281a8b7-79ae-3f68-1c4f-0f50bb0848e8@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:41:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 5/5] media: iris: Fix frame interval enumeration for
 non-divisor framerates
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-5-8dc8c4b3880e@oss.qualcomm.com>
 <20260819-fat-shrew-of-agility-16bb0b@quoll>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260819-fat-shrew-of-agility-16bb0b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0NCBTYWx0ZWRfX1cHJ0J0dI8IX
 7gOZTnQObAQVoqyaR1aCqvIudl1ABSWc22DfbaIm6KG3njfs1iBd8HJswWRZJ3AB6YDf1HRePIl
 JU3XoX8SqPF9txFCDyuQkuodRT3FbUc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0NCBTYWx0ZWRfX6WSH2WX6+5xy
 UaXZdhpq6e4ne9BAhPGElkX04+RHtXTSaKjwny7b4kn155fUUYnxzFr+7M6hVTlw9sylWrvluxB
 EqpKGKxmTAEzWvwBnTmy+F5eCxs01E835YD5+HwTiQGWLnfin8V0YYXfhWA+ewGjzNXVgsWhCa1
 YDCzY2z9hhYtqe72solIsbNlf9Rgg4LeeFqh0p+rFPkou6bDXy+M564WiNvYhkfqYQiRCrAekdU
 LhMBdSL/pzAaVKLhV6CTNaCnIlSaw49hCSoRUeZ9hsshh8lFpI+YBGLiEOGUS9ZlAyPSINs6msx
 7Y6gArG1NLbLJTDUaAlDNSE97qPzLXJs5UVes1d1BYSHfGp8Gu1mdii6H8cz4VSWFh61A0tFsMZ
 ZhAr6ySvquyovngKBWO3wa3pIsBwPAWHJlek9wMuuIQGfI6mhhsxDf6EmzNg2Alb/oF9dwMg91o
 dSxnwPoub0UTbY0/giA==
X-Authority-Analysis: v=2.4 cv=RtL16imK c=1 sm=1 tr=0 ts=6a8bd28a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=_6ABqccX2T2vhF0wR04A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: N1Y069w24zv2wg5vwMj-b2x7fjYRHQvx
X-Proofpoint-GUID: N1Y069w24zv2wg5vwMj-b2x7fjYRHQvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240044


On 8/19/2026 12:47 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 18, 2026 at 09:24:18PM +0530, Vishnu Reddy wrote:
>> iris_enum_frameintervals() advertised frame intervals using
>> V4L2_FRMIVAL_TYPE_STEPWISE with step=1/MAXIMUM_FPS where MAXIMUM_FPS
>> is 480. This caused client to enumerate only framerates of the form
>> MAXIMUM_FPS/n (where n is a positive integer), restricting support to
>> exact divisors of MAXIMUM_FPS (e.g., 480, 240, 160, 120, 96, 80, 60,
>> 30, 24, 1).
>>
>> Framerates that are not exact divisors of MAXIMUM_FPS, such as 29 fps,
>> 25 fps, were excluded from the enumerated list. There is no hardware
>> restriction to framerates that are exact divisors of MAXIMUM_FPS. This
>> caused GStreamer caps negotiation to fail with an "internal data
>> stream error" when encoding content at such framerates.
>>
>> Fix this by using V4L2_FRMIVAL_TYPE_CONTINUOUS. With CONTINUOUS type,
>> GStreamer creates a continuous framerate range [1, max_fps], allowing
>> any integer framerate within the range to pass caps negotiation. The
>> step field is set to 1/1 as required by the V4L2 specification for
>> continuous frame intervals.
>>
>> Fixes: a6882431a138 ("media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder")
>> Cc: stable@vger.kernel.org
> Why is driver patch AFTER the dts? What is the dependency?

No dependency, posted together as a series.

>
> Dependency on DTS is in general a no go. I looked at cover letter and
> could not find explanation - where is it?

No dependency, this series addresses three independent issues in the iris video
and I mentioned this point this cover letter.

>
> Please read both submitting patches documents.
>
> Best regards,
> Krzysztof
>
>
