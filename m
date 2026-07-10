Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A39422552
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686845; cv=none; b=hn1IZfEwveOZlnWGKRefyaaE/brjNM+S3PuIp5MslZSuc9pvjOuc8F7wbjCU4/gVfUv+wZChn5HgEf0bWLls2x96Q+fHBive9riXSHYB4TcoO86I+Z1h9TKl7wSZ0zQv6TNgATTjKWuRgpuK7aFq9GHSDh2reoNlQrsEQ00Uajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686845; c=relaxed/simple;
	bh=gmNJ4oLCqisfWMQ2xkv1odn445Wq7mkxpGEegNDrq9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+WNphlhxGLGaiQGoBt7JkEd+mYWzFd4ysWb2VLzL0nBz6EOPSlI7137O0mL/UhtLinXVmAe4zhrx4eKQ6WL9Zf1O15YinIjXhsIjJbGEJRl8syLc2mY/2zd4L5hHeJBHbWJC2oS4bojNoliUMnZrNnh6TGqfxlyyTsE5HxTZdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRImbWqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCHwbI5P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRImbWqE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCHwbI5P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmVnC605096
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrOo+UhzctHRE8y7sYY3z4m/BCBdD+Ep7OuN8Y4dfps=; b=KRImbWqEJCCBH65E
	35JRXVLMJd7Epy4gVzPxnoEBD4tgtOiLjrGgc7VFqdk9yVX01lX7M5Ot3QGEE035
	eUXk4jd4clXRrrsIelZy++ymfQyUK9N5Jzf2Rzom4EeTvDUmSqngsq8SaE8CmNMJ
	9sL9tVcon5H0RoRxLdfl7r+NX/vwoJLpVny3Fwfo+dUlODNuTOea6KmLJ8693BTG
	M+ICDBoRenJ0ziLRec+cJjVOlhKj5nqS6dWp7yYHPHhunZgkBKgkxY06sd5wy/5t
	Rkt1FWf6EPeUMX8O/qiBXNO+4Ao1H+Q8RGar45jy+jpHySEM1ikcgQ5+gxkWa3ZP
	qUBYAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanweafj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:33:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so4240676d6.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783686839; x=1784291639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrOo+UhzctHRE8y7sYY3z4m/BCBdD+Ep7OuN8Y4dfps=;
        b=CCHwbI5PQ9zTh+vE+92XlwgSXRby8GA+jmEYEOs6V7cPJ72xQon0KwXgXbXWe0lvPp
         VOGIYIrS0QPDNlyo8koE8R5jrDO20zkVOO8JwOMFUDJxdU8YRGXYNgVsDHGaDUX88jhJ
         5FJNdeXm4+Nd4x668gPmvuUL1Gu+oclvuRlQBo9F2H8q4lDmS5fTFq6+C1xCJOfNAxcY
         xGsspz7jBuulZDCLytxoi5XG8Es2bM1ZQjuiHbMs/A5VIC+P3i/lf4zZi1L6XZsh7VNk
         1CLppcSsYy17McMjgP6h2lgItB3zpSa8Fw5PUV5co/MplyQIlsx+jnJ+Upv/qce9lcGT
         2LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686839; x=1784291639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrOo+UhzctHRE8y7sYY3z4m/BCBdD+Ep7OuN8Y4dfps=;
        b=edjqV3+85OVD+I+zYFMuIgyOuClOMlTmkJf5Iu4bCGKoWjX8voIWaVwPmoiKu4aHTj
         f2Hkk7B83wEuJfKEKFNHW1rBMIx9mUcLqrdQ9Nae69w1yevGzcXKGDiBqW9Ttuarz/6i
         ekWbHdkZWSLZ6uCXo5y5zY03QhDijTaS1OTMq+ymY7ytuW9nPcQqHUHyIaKfLWzO2v3F
         vqZweeUqePymZLK7GPNqwRFuWctrYnBi3iRrOiCo6kmO/kNoKndGBbsqtf1yHFnPOIlA
         VJuT+eXP6iCDeaH/f4h++lymUxXsKRzlKLi3R4uQyhsSffvlHdIn5tiAe0La0NJTOast
         NOVw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0KXU3AjnPujL1UzPYrUbmcEyBDjMnsvZGl8gmnnmo8Lfd9my97xDdpeGqe11yBzZRiENAVF0dHKmo@vger.kernel.org
X-Gm-Message-State: AOJu0YwIWQgIoZE59ci8EAgFfaX9R7sq8mHQNSXuhFJQwQHoHTS6n6Qs
	wEQ1o5l3vxila+pRVgsMylR7S2jYWsLntd4cEVKrTYgmbudbpP0SeqKqQ9KCh6CP+/oep6yXSmh
	Dw8FSjtGExLVCfuNRRC6Ie4XfNBtH4npq/WPZ7KS5wDs8YB7gapQ2RvftXXe1bj4z
X-Gm-Gg: AfdE7cksBLHkC5K8MVwXvYgKnHcsR2S3QX4YZOxaEgoDjDe5BSq7EfETuC5THPGYhes
	FEZrTsks0TO7h0cnZ2ZfLsR4g+jZgcF31L10Oyrst+NPT10oZEr8urTim+y0GjP/9Mn9kORPSeq
	i/PbWT8Pz5HU8ijBRMymDuXJ6pny/ajuUmWJ75G1l5HxeBkY22p8mg5EAnqh18GvanlQ4YZf0+N
	h1hSKdDq6ByWiN+rN2D/SveRMQrvwGfJ6oRv2CqqyyFqwr7D+uzWQ1UQqY8f58zrIPiJEqP1ZXZ
	oLjQoegi0U/eXenZRjU21lymo12V7usA6/QEZsGjD2fbmS2xa3vEShBB9y48UQgLX6MWQD0UbGV
	g/AB3d+/OS0WmdOu4bUNuvTZDGeQFPjxRXmM=
X-Received: by 2002:a05:6214:4907:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-8ff957351eamr82841016d6.5.1783686838732;
        Fri, 10 Jul 2026 05:33:58 -0700 (PDT)
X-Received: by 2002:a05:6214:4907:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-8ff957351eamr82840646d6.5.1783686838278;
        Fri, 10 Jul 2026 05:33:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10705561a12.10.2026.07.10.05.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:33:56 -0700 (PDT)
Message-ID: <1921023f-da03-4f3d-8489-bfa2c5fe4f3b@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:33:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
 <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
 <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50e6b7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=dFzIMAVjCySLt-5DOyQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNSBTYWx0ZWRfX9VQ2J66RR8al
 2WRz2y7Te5b2sofR9lrlKWj9S/Q4UlkzpcgswQznlF3Ydo1WLQlWupSw2Mz75B/EzoCSEoN08c0
 AyDWK3mXzgjVBGAfa61gKbwtIYjavdmSBXl7BK7JwP098mlq/aY3vm6NGpvBbuNxNMqXjOpzr8n
 eXXzhtYk5TP2SMqdidipgTgxd0N4U/QS7p/ngSA9sChwWWEeu9kNBRfPzfPF/lYSpBElGcOwASB
 4LeNd1efDP6wZArn3i+kOyMTLUmhtNzFs248Ic8j9rFS4cTQXWv6yxY5bkZGaU4kVUzlZnvqeYD
 N1TdaR7XzEJXlifvqBewR8MCh4GhQ1ffiPTI5/7QS3GSyRt6iJ2kIYXQslvG+W2XWwuYa3jeSu0
 aW583uAcKjoQa2gdkZbkse3hNqcU5LuSDPe8rT/Ed+iOZ8ZIl6blCW3i/P6MXnm2b2eBai3hIU4
 KJ1t76ErI77Szfm8nNA==
X-Proofpoint-ORIG-GUID: oBE1jXI8tVqjlN9yAYwHa7GO_IjshYzH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNSBTYWx0ZWRfX6jRpMkZc/aKr
 OKCgvs6m5Q9yffYvlNpieCcjRz58tsFDRjwDpA9AColXY4xqA9DuzmjKv7OBR3ReSJmxpVaTfW5
 LJ0wXvjrCxr4/PYNm136HCpIDH9CVTU=
X-Proofpoint-GUID: oBE1jXI8tVqjlN9yAYwHa7GO_IjshYzH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100125

On 7/10/26 2:28 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 08:16:21PM +0200, Konrad Dybcio wrote:
>> On 7/9/26 9:33 AM, Dmitry Baryshkov wrote:
>>> On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
>>>> On 08/07/2026 13:19, Konrad Dybcio wrote:
>>>>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
>>>>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
>>>>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
>>>>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
>>>>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>>>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:

[...]

>>> Which way of representing device nodes makes it easier to migrate
>>> existing platform to the CSI PHY driver, while keeping compatibility
>>> with old DTs (yeah, ABI, old DTs must continue to work)?
>>
>> Quite frankly, I don't consider the existing (meganode) description
>> any valid, and would vote to rip it the second a replacement is
>> available. But once, not N times.
> 
> Rip without providing backwards compatibility?

Because the existing bindings make ensuring the required performance
state of power domains impossible, yes

> One of the options would be to follow the 'venus/iris' approach: land
> new set of component drivers, which target new platforms and provide
> minimal support for one old platform (maybe via autoapplied DT overlay
> or other similar techniques). Then continue migrating and phasing out
> camss driver for old platforms, while adding support for new blocks in
> the new set of drivers and ripping support from the camss driver after
> some migration time.
> 
>> This is not to blame any of the original implementers, this might
>> have seemed like the right idea for the tiny subsystem on msm8916.
> 
> Maybe...

Interestingly, there's a number more peirpherals inside the 8916
CAMSS too, I suppose some enthusiasts may poke at that one day,
there was quite a sizeable developer base for that SoC at one
point.

$ rg @ arch/arm64/boot/dts/qcom/msm8916-camera.dtsi
15:     qcom,msm-cam@1800000{
19:     qcom,csiphy@1b0ac00 {
41:     qcom,csiphy@1b0b000 {
63:     qcom,csid@1b08000  {
87:     qcom,csid@1b08400 {
111:    qcom,ispif@1b0a000 {
155:    qcom,vfe@1b10000 {
212:    qcom,jpeg@1b1c000 {
232:    qcom,irqrouter@1b00000 {
239:    qcom,cpp@1b04000 {
273:    cci: qcom,cci@1b0c000 {

(there's probably more hidden in magic reg accesses)

Konrad
