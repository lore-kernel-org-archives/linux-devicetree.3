Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11E23DE454
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349015; cv=none; b=l/PJ6C083JQ57TGqWS3nqB/rmi4UAtz9V5eGMbfguPmRjP19v+qTt0xMUUzlO1dRPDQsgVz9Azk8UMHa+aRSMupqbkNlcqYRI+I3p/POMcSo45YKsRcb2zc+uHX2z/kD5lJ0DoFJ+aqHkPir7x5O5ECV+0ZS7bA1OT5JvtT4Dnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349015; c=relaxed/simple;
	bh=JbFBCT8jFnYJL+nZ/KPFkxCkA7Qi+D4qGi8jvZyWkDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvDsM/0MiqMzYfTZDBA9Ke722Bp/vPLw6tuV6S+u8zIcC9Y5ZlmyNuuK0IIJYcINKWYd3RGNyvZHSMwXEzHKeKZBh6oHtS83MItyRKyHwQNThrAw2dW0oqVEZafkp3OII0h/2zKiLc4rsZFtxl9Kxe5ZY6MAlh6jS7oYlrYoc5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=efSusFmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5IalrMh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="efSusFmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5IalrMh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9aeZC3903752
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjrQ4N3C4WGKmVnqtVQBZ0cZ+zjNbsG3zeFcavLesCY=; b=efSusFmwgP+aFv45
	FpvY/zNPMqMLSkCMiIxNzFlEdwPMjaBMIZtm5hEkip7P2FBaJ+9aV1COpCrGRSfW
	K8Zd0Ug0I4FzZgpzkowvp+ff9THc9SkGCFrnwYFRR0wu+9DcGGbWPiXCQ16cWrQ1
	4ZCuz9AIo/DNFO60YTPOMHm5mnPzdC5uqeuwMLY78vkxdQ5HZ2u2mX2A6iWH59RN
	6I/kYXe56IYORltCeOmgqF3UfRTOMXa95csSAaKaXNf/hamCS37cNkjKkDbdT3/a
	K9ncYpLIZznX+Vet7vPkNUGPcvFeeNtwEKma0PMlEM9y23UMoMf3Csnnim+kj3KZ
	C/NdxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0hg5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:43:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b27636835so49898831cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349012; x=1774953812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjrQ4N3C4WGKmVnqtVQBZ0cZ+zjNbsG3zeFcavLesCY=;
        b=W5IalrMhQ3cOEotPm1GrpXolr6zUPEhUbIFHCSfdT9sFDcZtx2LimbUdH+wAXkIybn
         C3843uEgetK4hwXb7sAIYAbZpiv8a384d/xSl3u2+/ptI57IXV7jalIyfy/2/eLiYzlI
         J6LHUdGxe5pflvP8zpJQw7lhu0oHEHd/RkWW3UDNREUF3kLw9XE9d+J/sgIsqJE+yVRb
         MVAv6IdeHon1XYiGChM2pn60Sn2jlqizfMDnufgo1hB/Xk+5DzfsEkb9fdIj9lmjZNmU
         qaSU4rRKbSf5P1YVVNu6RPZ2z3b3oIngOf++VcknaDeAXGrNEqfY46yjSpuZvz3cZP30
         fiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349012; x=1774953812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjrQ4N3C4WGKmVnqtVQBZ0cZ+zjNbsG3zeFcavLesCY=;
        b=Vt9xsn/7aiBUjKdWvNoWsKF1GT6wO99S4ZRpl92q66VuF+oayQ29u7MFsiKB7KDEhL
         WUexppa9qGnfKvzdur9wWh1o/k1hd0fSPCMMCq4G+Y5ZbOc3g4ZR+zIkcXSDxKfxJPwc
         63FKMQe/tYYwI3dxmH51DzTl04/YSWI/OZwF9hDsOOK/W3yjLswvXalYBJMxtUxSYc+y
         IS3o3A2lc2txZWlDR2FZTrbf9U8kwyOiOuPDoPncjxW0diUU9KjmRFn3igPrtWOQxAp+
         hHJnV2qUHNjNAUYBywie5SDWkdAw4wdcBnAXGlYbdHYQ6HiumG7MZH703PnXOF8oI9su
         ducA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Yv3lqosFlsmvXxhuM6AfLC5fTfj3rAVgcd6wA8iiOQAwl05pDxzMSXP2tbII/MilEi5ZZm3Pgtym@vger.kernel.org
X-Gm-Message-State: AOJu0YwabIOCumRjhWO3gLM2ruw3EK42qZLEtBLrFh0N0Ft1MqYLtZn6
	oK+erGYioONvii1Y7631YHqrYypTa027xgGg6mzOmDJqvhU//L9OQ0DkJIM1VnQpJw5JSzvSj62
	Z9y0vsJpAlIJafDTXgX8kVRUmlhI0QtQr1fHsGA+1pvslAj0AiUXsIVGedoeRaTdD
X-Gm-Gg: ATEYQzxfvzDbfArr2WQbVYiYdXKph6qPWbOZjoPOBz06SPIxa9p7gOOdh29aAlkFyZ7
	E+47u/9J9E95XF5O9QZhWQXIAcpD2CSR1VJH8YddFcLB6eJpHh8rDAMQrUv82owOe0Tc71acfcH
	pIS0Lba391i+xjLo5nj45yGhAImhYe+rXPSL92mkQxX98X05VaxOe0V/OkNDs6a+NvgcEKmQ/qP
	b6Le9pveb9mqa0qCBg0DaHfJRMR9ycXlnmmCLiR83iPTW0RecVS1kXjy9p8hqIpzXyKHBwS/WhO
	biaiVW8SPppiCUn+lUBiuAvq3xjRJ0h+ryN/PEER3fQr4YGTmvBmeKQaCaCStrEu1NM2U28hxaW
	3HD9yKHT/dNQEQkEadX8v6wgX7RLRPyI7H8eRAdGQKYyPQdtxqY5460/DE8aTsZR/sCw+OUNYud
	5gu/0=
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175375221cf.8.1774349012014;
        Tue, 24 Mar 2026 03:43:32 -0700 (PDT)
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175375001cf.8.1774349011548;
        Tue, 24 Mar 2026 03:43:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f42c8fsm613885666b.9.2026.03.24.03.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:43:30 -0700 (PDT)
Message-ID: <33f95784-7ae2-4ba3-ba85-03505a2c125f@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:43:28 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
        mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
 <76edd04d-7bd1-4b42-bea1-79f4b149c0bb@oss.qualcomm.com>
 <CAFEp6-3R+O_j+g39oegS=WHUTxnF2LzPx0t-C23+PA8zUhCmjg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3R+O_j+g39oegS=WHUTxnF2LzPx0t-C23+PA8zUhCmjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1e2OUzQjPZcoCLDeCCi0O1Z2Rwo1a1NZ
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c26ad4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fUXq9ZcRc7bERpTzZuMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 1e2OUzQjPZcoCLDeCCi0O1Z2Rwo1a1NZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NSBTYWx0ZWRfX/O/huAZw/0O6
 f7Bq5YWZf2FbhwCAeIo2UD849hqoPuJIS5HPzExJ7vUxaNXfs1W7EBbdFZPDNckTC1KfOWZFvJz
 T3TFEOwCxmFD2YMBTnLbOI4vJRGAMnUK/Rtuqp/6FeUsBkVkmI8KgIR/jx6GFzvaUyfPxVLHZRh
 qAG3J/JFBwzR1uBXCJFxeGYdm4lbUbNhO58bEAxiErp3BCFHVMR62GQVEDkrxEtMcn0s2PQ8gIa
 qW3nN2CBqEOM35Ev+y/jlNrHtDapQXGTKrOtoRT5+CVwcliDCrxpbaO+0GqV9Mc3AQhtcNqKk4w
 m7pmvP1ZlqaK6RTD29mybIL9Cz8UEUNN9A2cXPBtNq3I0Xm92TtQX3n4gX9svj98gr5cZbpTZHB
 Xc0E0p/BYK2ai/HI1xk0vYoSk0qw+G87NiNcOVsnUrgN8UzsJ25ppxrpVRFPJkdi2wQg2YptnOg
 /sXpaRtS/ys+cLOrBXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240085

On 3/23/26 5:31 PM, Loic Poulain wrote:
> Hi Konrad,
> 
> On Mon, Mar 23, 2026 at 2:24 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/23/26 1:58 PM, Loic Poulain wrote:
>>> Add the Qualcomm CAMSS Offline Processing Engine (OPE) node for
>>> QCM2290. The OPE is a memory-to-memory image processing block used in
>>> offline imaging pipelines.
>>>
>>> The node includes register regions, clocks, interconnects, IOMMU
>>> mappings, power domains, interrupts, and an associated OPP table.
>>>
>>> At the moment we assign a fixed rate to GCC_CAMSS_AXI_CLK since this
>>> clock is shared across multiple CAMSS components and there is currently
>>> no support for dynamically scaling it.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---

[...]

>> Similarly, in the arbitrary choice of indices, I think putting "core"
>> first is "neat"
> 
> Ok, I thought alphabetical ordering was preferred?

I believe that was Vladimir's misinterpretation of the DTS coding style
(which is admittedly convoluted so I don't really blame him)


>>> +                     assigned-clocks = <&gcc GCC_CAMSS_AXI_CLK>;
>>> +                     assigned-clock-rates = <300000000>;
>>
>> I really think we shouldn't be doing this here for a clock that covers
>> so much hw
> 
> Yes, so we probably need some camss framework to scale this, or move
> this assigned value to camss main node for now.

We do need some sort of a backfeeding mechanism to let camss aggregate
various requests coming from the clients if we want to prevent having to
run things at TURBO all the time, so resolving that early would be a good
idea, even if a little inconvenient..

[...]

>>> +                             opp-580000000 {
>>> +                                     opp-hz = /bits/ 64 <580000000>;
>>> +                                     required-opps = <&rpmpd_opp_turbo>;
>>> +                                     turbo-mode;
>>
>> Are we going to act on this property? Otherwise I think it's just a naming
>> collision with Qualcomm's TURBO (which may? have previously??? had some
>> special implications)
> 
> 588 MHz is categorized as the "Max Turbo" frequency for the OPE core clock.
> At some point we may want to enable this only under specific conditions.
> For now, the OPE driver does not make use of this property.

Fair, we can always get rid of it later if it turns out unnecessary

Konrad
