Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307BB313E03
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438204; cv=none; b=NPvUlSHkcUJSTO4NgfOvKZjU2sCXOC1DbwMD/wMjzT4qjR7qevIddmiPIFg9ZqoOtUBu/V/kMaKrcaw4EdL/2Na31mE5PUvLGBsk4oy3YIkNssu2wEr+gNZkwVoyyjvkttR/xFr0oYQmvu8VGYoq+UI1gKJtA32IqVdby5LHUuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438204; c=relaxed/simple;
	bh=9R8L9pnEC6/7D0qx0eTa9FTB2bGqiw8EzNmDTrkkM7o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YYq5dCPCGau0WiJy2V62n7vJsXZTKdGg7F6tum7GBmTDLzshLROo10Az2hrcyIBGmFOrh9q3xJUw8uRAI8IfE+SvXQ+PB6HGwPeotzWPLuNB6CakCr+bmWPcsCFvW7uLqkGZkaTnIO0KnFEGiPGrkIAVrNn0QAaqhaAunNkarFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfko1gwp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrU/saTh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfko1gwp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrU/saTh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HD04BC3439549
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFw7s4390u02QSe6dzeniTny7yN1q34Z7uu2sNp1DC0=; b=kfko1gwpf+VtV+3y
	64tEFrq5mtt10P0ADLXlvcmSqCRLBHXDt5ACIPGiZqG363Aa2d3tR0FL+ddm5wqR
	Q6C5mhhPzWZhrDMP8mOfRMnDoqQsA2mXo82Vm5Ra+5/zzrV2ay/HyYoRc6p3v8K3
	9kFca3ckIk1XGNCpolG6evdGkhD3TWwXQK8oFmQANbRblJRihxgsNTmELr4z2559
	QGLH78DHintV/ntlLW9ma9A9jivkmwcbjz6UOLeAb81zdFUOVQzFeoCErffAGXOT
	mXpUWuZSX6OaXnU6m4Z1y6gfhvQthi9E/GiG0ju4zEE3HEX4dgPm/L6ELsSvaUOE
	C++vhQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88sr73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:03:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4654f9bb6so9357885ad.2
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776438201; x=1777043001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFw7s4390u02QSe6dzeniTny7yN1q34Z7uu2sNp1DC0=;
        b=MrU/saThKCbhmzQsL2DU47W+jWseE3xhk7pOJlf9InzAA2edDtHpcB7lgRDBUw0nSZ
         o3wXtk/hLImo2pS5tOuwyYfGtgE+2Y5KfX/OmB+I2Tn8qtGHmpWRLzdlpR43CEmzB+qF
         PClcljGr5SpdUBuTooC7Y93XjuUbvw45mK1AR6Dvh0lNHIRhyWnwhMpM/QMyyZ9P9Z5t
         jLk0lnkr3iV6DsZP47JT4JxoqbwX0tisZtNm7JAJNino3DtJgpCEV01vrsstir4MVNL8
         rg5dY9OkzpSg1DqUMyye1oxZ6TvAm69S/5+1XQCp1Kee/ArmZL7I6LQlboSaopPIof70
         gfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438201; x=1777043001;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFw7s4390u02QSe6dzeniTny7yN1q34Z7uu2sNp1DC0=;
        b=PXgQZAOuKpxy+XpeVx0mMMxZSgfWbwBrUyERBt1p9kVRQor0QflEL7H4yeaumnYqrY
         rnOd18fZ0HsxiW+y+flsfb9SkL+7hCWTkPJ7bdTPPVde6zde7wUvAWPRr/964sDfFxt8
         OfayP1keIGf+R5FFb0bX8lQlP+lHkFiWSPcxmHZ9xKNmGNU8wPBoavpojytyzZRZHi2U
         WJM+HgRXXRoxaVaPL80kggUDZ5DVcgtLDoZwg0RMff+ss18mjGCzdnYXZvgtoMKOm/9X
         q3mH5GAKjVrnQNjJ3ZB7DumrdRqddxsmXY//aEWbDGV0hGq3S8C6lEz/Al0zPzQ7GJ5X
         vISA==
X-Forwarded-Encrypted: i=1; AFNElJ9UDCMVNqf72jhV/e7bkn7b+GBr5QbfXFn+TxNbepY4L9IxJg9bL0Ss19/R5OV38qzyMh09+YvXnH0W@vger.kernel.org
X-Gm-Message-State: AOJu0YwVbLH7itgstK09i8XL8x3XklH7OLY41T7TwgSOKScT/7P4Rc1B
	L8oXMk6u3PyWC4xuKs0TFoXlDv3lmG2KV5PNxeMX5lu5zRs15LJ6cXSGET8oTVVM3nixRZtF8hK
	1KvsKpmDE3ObljNdYTBffwx6BYW56AkeiJGbT/jbrH9zh4m3YX0CwHuIa3pHIHq5O
X-Gm-Gg: AeBDievwwsegTRNyDANJdWdSjSO1vt3C0JgP1t6KcMtwvl8TS0f9hPW6SJBitNTIaMa
	wBaCKUMPUUMN8wJ2v1IbvYqcfAMd1tSSG+BQThK/09Xla46hF8mcsMCTeiUgkK2J0IvMeq3coYM
	a0YvonYle5QwGxTEoUsiVSeA1D9pLf69nbzSSksBZIHQDAPu1cWqTRkqzxS3CC1GwsXUA+c2AYX
	+jHlxFwUoV2uzO/ggod3Wt0ImeNaH6ijHZ84ekoF6JwYz7/x6w3QqYIr/dJPtZV3tyQ5NxA0gHn
	LfohXyFZUrmRZCR9OVGg8DRAX2Lgs9QavrPR+dA6vwiZuGkxRAUUvzStsQt5US4XqKtzwUunSLS
	q00sBKBcygyUF5Pwlj/jbJw47bS0PDpR42sfJcfDT9tGZRiv/M8+7dtfuFgv12QMR
X-Received: by 2002:a17:902:988a:b0:2b4:689a:e420 with SMTP id d9443c01a7336-2b5f9e7a9c1mr22893135ad.8.1776438200993;
        Fri, 17 Apr 2026 08:03:20 -0700 (PDT)
X-Received: by 2002:a17:902:988a:b0:2b4:689a:e420 with SMTP id d9443c01a7336-2b5f9e7a9c1mr22892455ad.8.1776438200160;
        Fri, 17 Apr 2026 08:03:20 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa507cbsm23809775ad.37.2026.04.17.08.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:03:19 -0700 (PDT)
Message-ID: <9d97d9c8-29ef-3419-464c-2db642759d39@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:33:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 03/11] media: iris: Add context bank hooks for platform
 specific initialization
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
 <3vuensoscjzsjuh7c5e3jff5cej66iwboiau7vhnpvtmqevexf@ouox5cize3fn>
Content-Language: en-US
In-Reply-To: <3vuensoscjzsjuh7c5e3jff5cej66iwboiau7vhnpvtmqevexf@ouox5cize3fn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EE1l_GxhxpPqvI9te0O28JQ3mzWoMlVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1MSBTYWx0ZWRfX6xT18LW8Xzse
 RQgTGoNTrk3iqTssE36fyNF/Wv9NIBy5xQ9/qth7ayz3YK1VWv7PAfE5d4qT2RGAQmqawXMW3iY
 qJGdHxW+J5FuKlBRJP1Lb4G+/rfKVCdKGdoOjSfraKLXmbNMg7G4ZTDQI4CVX7AhRd0Xw6NYZ+M
 uZhYtaXDJLj7EQeBw9IxaenK8mPRPdZQ1OZmLC4t8mFmHpoIoS+psDF8pIqgY16jTiXyrkrXN3b
 GWn+ImgumnpHRoUPl1hMzmu4nu5jag6CPJkR4G8akljcuNumMkwi3GDbaoiA7Rffpz8p/cTS+JF
 Dvb212pjIBFmX+Wsz4qk5x01snukGyuLOda2z8toldQzTJcINxAexL0ZQu2G34KiOz3xxIx0+6w
 qMrN0IjcPYXpyBNmrWFPd2YlTAGOJ4TrtKn3oMmn50Y3hy9wuG+tLFNcWHbwzbEcC1l8xAYU3R5
 P/ps4/6wcAsoJfzsR1g==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e24bba cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Gxg087mSlOwoK-wMwRkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: EE1l_GxhxpPqvI9te0O28JQ3mzWoMlVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170151


On 4/14/2026 8:46 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 10:29:59AM +0530, Vishnu Reddy wrote:
>> Add init and deinit hooks in the platform data for context bank setup.
>> These hooks allow platform specific code to initialize and tear down
>> context banks.
>>
>> The Glymur platform requires a dedicated firmware context bank device
>> which is mapped to the firmware stream ID to load the firmware.
> Change the order of paragraphs. You should start with the definition of
> the problem rather than putting the cart before the horse and starting
> from the solution.
Ack.

Thanks,
Vishnu Reddy.

>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>>   drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
>>   2 files changed, 24 insertions(+), 1 deletion(-)
>>
