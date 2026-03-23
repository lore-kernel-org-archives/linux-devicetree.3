Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CEF3A6B88
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269372; cv=none; b=Sa4gwKR1hlvCXGNm/sVhJAgQjT3zCvW+feWcy158Bfv8nrrHDf0erSJlwLb8iNiGPEba8Z4FzEwPFY2TO0FUEeOFxcAQAf54TV7i2j3WElngua6rnOdvXqstzlMORQH2d9my2Eo4ddS5LoAmujwA0n5oi1zHYNz2Zylb4ggzqaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269372; c=relaxed/simple;
	bh=qR9lNg1sQ3u9U/A+p2688KwxIm0+L9Mw2pdv5sD+0Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2I1kMairinGfGVRl7Y7VkEoDZw5kCEKjypsTRD9oBzoyhvxCWsqKukIWVtsnxRsQceBfuttLm+yH7SyB7t/Rc/0qG4evLjGGkeiCsByP4ZVmfTJA/tX8lFAfJekhkIhJ0TInknF6JPq4/xFwDd8ULpnZOaNgq6jZ26IPrNW1YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ar8ZQO0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6lF8Fib; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ar8ZQO0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6lF8Fib"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCV2Du3393276
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GC9YdM4uh/4MoCpxFmDOmembd35n6ZrxZHRpR43uLsM=; b=Ar8ZQO0Wl7BlsjXo
	JNRgvzIGh74vir78+MgVvj7XYyV4+NsxRdUhZ6Gou1Xq3uIfYb1eK8O7w9j3Liaz
	OJu9COFfxJ1Y5z8p6MXQAxXELhCCyEYhlAk3LYKzKLpR69cq47LEG7UQaYEyQndr
	WRjZqIpemyFbfJ3WI0KvDEl/Ni5rtlr6zKkQrAzUlm+7g07I2m9R17qn6TJqw/V8
	fZGwDrGblv0fyZHw79qCqQPSpnJP6+alIy5UP4C7r2MNjf9fxKulREp/qxFvFu1q
	A/tNluD+l5PiHpxw4c9TEqD1tfXUh0JigJK8T0Rb+6YjacWI6ETznlzQaNEWFp87
	sA5Iwg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8k90b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:36:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso149185a91.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269368; x=1774874168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GC9YdM4uh/4MoCpxFmDOmembd35n6ZrxZHRpR43uLsM=;
        b=V6lF8Fiba8W957w1RcpB6g8/+C3qMMTLF64RjmmuJcbkBdV0VSvfXeZx7cMoqATWin
         FWSoA9Ole2fQAPcYgCO9K6ag17Kivq26Mz3Q/WSdPe9nZljqRb4fuEaALlAz0yz/8vdm
         VJf1HgpekMWFkO/Reh6ZE8StnFFrUPz2h77gFlZNaaOoIDTxP4w9RxZRtudpLaZacAjA
         77B/0lp7Dv91G9YCLmcxyq+YVxiPEgTqzzfX2o2EPiolgUVqrt6P2H21ymXfRkPd+gHU
         eG5XJBUcoqfnoltLGUQctU8UIlSGV0CZrYCCUdHYSwm0CtXmCnK66hM+2YWoo9gH7pMQ
         CRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269368; x=1774874168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC9YdM4uh/4MoCpxFmDOmembd35n6ZrxZHRpR43uLsM=;
        b=KQhlRqEbihdnd8sOA+2ikyx+65R6b5XyjodMUiltAJSVtQUsQtVy01yT+/eW6dHnCG
         s92J/VJCbApRwYIK3EJ1ay9qLzQSJsKj5k02Q8xH+/xUisEfgUJmcPwWnnnCpVu7teX0
         4HwbGQnnusQImFY+L99/4fPgfBPtgVwUH4Tfk9uLosTOOPMUHjYXlrc7gYvaiNMo+fEy
         5jVWbpox2TuO3EDoQXFRqNN35AS6cC405u8bLc8w3kiWW66dOGSLrghWVFutHbCwnwNG
         KuhRytfiaaqtnEGNfNIBuw4iNYa9L4vPSE+54zi4811pgBuFYcqlmN/BWAwNd5OewyD1
         44yA==
X-Forwarded-Encrypted: i=1; AJvYcCWkeyL17htozxBcEsK6rED+Q2sVv+TAtelPn1CNxPXevNdrbQRMAq2cU8ZyEeciD0UMjB121DdLGkWO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcd6JPZsg7M7gJBmH+aOYZClMDsAp18PuTTdWeGgorEguKMgga
	tJBpv7+6XJ3o9XlZZ5CwSHCjxWJPXQyuJE2IpIwaYB9MpfjwEIR7vHpcU78X01DF6isWhP42/K9
	GI/N0ubXdmW4mAsAy5+7YHmiud2TprlDbho15kqfEAVwifYhbWFbnnD9dIqR1BKiXSIqr0Vp+
X-Gm-Gg: ATEYQzxEkGaovaM9Iy4M7q1ezb/mJVo844XG5gGgeghm8jw9hGdCQEhigR9mCw79MCe
	HybVuGvOMsvb9Q7bEJkA7jWgWSTuxqfuWczwE2bMUycn0UoK5EIY1ybH5uuEtYHzSEGi8EH6L1Y
	H81CxaA96tG9MfIICeAMaqHqih9DmLrJ1Ca0mcwWLYslC4uunBloUuAfmxw70E8/Me2gGsM0a6B
	Vrvv7dlrcNIEiypio7ApOJ6IFHkKrFS8oj9D6qFl5m2DvcpCLXbfUDlbj5tdWRQZbJ8JYT6Pn3x
	SQZz6w2v4UaiQaC1FJXmIAivTw/Fb5QH8OAMxkKNKGu2gmVn4nrFr5YBAZmjb1z7lGsq/LAqgC4
	r3sYzj/TZsdepEIAji08ANokyFBJgAZPteVYar+d6DEOnOWUFgDjGWLSlRiKxiXA=
X-Received: by 2002:a17:90b:3d02:b0:359:d54:846f with SMTP id 98e67ed59e1d1-35bd2bbe310mr9718520a91.7.1774269367678;
        Mon, 23 Mar 2026 05:36:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3d02:b0:359:d54:846f with SMTP id 98e67ed59e1d1-35bd2bbe310mr9718497a91.7.1774269367020;
        Mon, 23 Mar 2026 05:36:07 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a801b79sm7520948a12.3.2026.03.23.05.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:36:06 -0700 (PDT)
Message-ID: <42b80288-5a3d-454a-bc1b-c80bebe2dd03@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 18:06:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Enable UFS for purwa-iot-evk
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20260317071311.1696361-1-pradeep.pragallapati@oss.qualcomm.com>
 <lmmlmpu7h6rm5ddi6aaspayhaibeyr274xjqqquaxtrovusnps@5p22xw3vcbnk>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <lmmlmpu7h6rm5ddi6aaspayhaibeyr274xjqqquaxtrovusnps@5p22xw3vcbnk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OCBTYWx0ZWRfXxNx9D1CHvubQ
 oG9k/+OFpCihKqbBjG8sOfuyu1n0QuPYfrUgD/cORgXmIrLbdqCDFEMbmpDnL86glLADnFbsIf/
 9pXHjK0tnMt2ipwN8QfOkQVY0eNDZiBddoWAQ+e9cgfhNdaZeSD2DoJGqnIQda1almhWqn2xjhx
 DPOfi7MqMxL6iz04JH2OBB9ZDVgVoroL0Vt99zDCMCZCpgQEw9MljZJMqXGZRsuH178J4JJE0T6
 E5z7RaB6pwG9EAzgeol9fq3AR8iLvcOeOJnV8SZQFnyoLJ4rw3T2ar5d4infQuM6ZW9wGADxIK2
 YZIUt/fxLrOQDKKN+rT1YGVZhiHmbirPFZUSD+kFGN1sEmoMqWQqgBhCVcAGAy7qnkhwCGWFlhI
 5TAZ4LTydu63FS1+ykXGfWojhJBth+tgZqURAU+WI/tg0fzmKMh0WqJHccaBu3qCBi7rtsIUjnt
 W46crBoJchhFafM+IuA==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c133b9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X3-CQwcXODtUerY8amkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: E-deZRPvj3CYdLxRu9Phq7P0f0TetaFo
X-Proofpoint-GUID: E-deZRPvj3CYdLxRu9Phq7P0f0TetaFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230098



On 3/17/2026 8:17 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 12:43:10PM +0530, Pradeep P V K wrote:
>> Enable UFS for PURWA-IOT-EVK board.
>>
>> This patch depends on [PATCH V5 2/3] arm64: dts: qcom: hamoa: Add UFS
>> nodes for x1e80100 SoC
>> https://lore.kernel.org/all/20260211132926.3716716-3-pradeep.pragallapati@oss.qualcomm.com/
> 
> No need for the cover letter for 1-patch series. Please switch to the b4
> tool.
> 
Noted. Sure will use b4 going forward.

>>
>> Pradeep P V K (1):
>>    arm64: dts: qcom: purwa-iot-evk: Enable UFS
>>
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> -- 
>> 2.34.1
>>
> 

