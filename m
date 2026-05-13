Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F7C3ACA71
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698473; cv=none; b=kIh6Q4JGEB5rG98N2zo2S4YdthW0Qzgq1N++6kaF/jNjguLlXjCdhSYRQ+wKIrggxjQnAcPo1XXdPvL9wluVQ3JTHS/vA3+UUtRt87bH2xVBgyzXjRhh8qAF0jIkmW5YlgRybIe2ziVBHU1G5v6Q8LKoa+uJCYHbVnuiEsD00XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698473; c=relaxed/simple;
	bh=xCtdLJBrpeaBbdoeA7fDJP+UQEBaql6EkAQTt7pLWDs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dqUEwFk6rg8UB4mQdq+dNTHN/7DzbL5JR2fTaa9zmIWt6+HWcyx/841rh8yY++C13eg7RIajONKMyZRHGs2i/qQH+e459xLJrhNTzufIih8J6OESpYUwxv6J0S/B861jIdikbYbm8PweusBnoW42uHPnuZg8vyaqQJbrCPjGbkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+MR1Z8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHN2U8EV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+MR1Z8w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHN2U8EV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGuISY3995530
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5+9ABfiTgEviLVxCigpN8KMZUuZ1D9IOP8UqN/QTG0=; b=T+MR1Z8w2Ehco19L
	k8W2WZq+8GiMn1b3IoiLpIPIOvz8w1hcEIai1BzccQwRor0PXvnh4JOTM3ARB4y+
	vKa/zmLtIjLP2nzKm5bO4nIw5MlY10rsoLF/JUPYzvWgrkq+AsrS3wk52erUuw6w
	t+cGtN6VaxGAkUNZtaT6+9YoIzkb9xhCQEUxKW4MmoSmMIhkZ2RhVmdqjPWoXC26
	y51yVbija1Fr2m41AsPffN+nnDxUueROIaaPhhM9UbCV350PMdNEMRNiY3W2T3Ra
	fA8XObv24Z9g7WXpYCaDyOsA+cT8aKs7sNeklLUTN2HvGyWo1hNZ2P/1O7ldcV+h
	smrO1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8urgq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:54:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-366015bca9bso5665231a91.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698468; x=1779303268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5+9ABfiTgEviLVxCigpN8KMZUuZ1D9IOP8UqN/QTG0=;
        b=gHN2U8EVlrP920+NZ4yAb0PnrKt0jDu/L9g9t4w2vH21fLKTxLS29VyyrK0tB2Rnl3
         dZFbTGL7VvyNqKfccwaKC3MuyMAHkskWpmrL7a1Ab8mw3gxrSpLTTIbMRlcxru81Y3g7
         hgIEaoSsf8koVeqT63Yow3swxRLZjkeH+nPdLo6K/VxQbx2NhcDIeytmzRtpCPLlM0J2
         QHs836QO0Cja9Z8XTN60Xl42ew8veMfuhHIoiDILaIJqWv+XDydRXFeopelqda/dhhtE
         NIvXgQiAiQ8C/v3G+NgUXbZGPsMEwtxfFsPPD7WKnCucgN/bCCzOGL7WikpKUNZO6dvf
         z3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698468; x=1779303268;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5+9ABfiTgEviLVxCigpN8KMZUuZ1D9IOP8UqN/QTG0=;
        b=JeheQH4vhdUk+U1YBdphqkZQ8vjejTKlO2/egL3f8kYySzquBN+aPD6S08WIdYvZLY
         aVPSkbNrZf6U1mz54ZSoD1xHIOPtRq2rlm5NQdrUx11BS8H+39yOnzcnjFb5LThW+ArB
         9buQnClJ2Ec6HoSfw+QsDj3Rsz3A+D/LCx886HTkrrpb6swgT8bGfZVOvbTD7EOqftlc
         P28FFQr2uOeSEPwN6/xzFXQBZU0Frq5rjIlpdMa4NamdpmtPAOztzPio4ybXI/as4bHm
         BkhRUbuwTJnsfy9sjIgD57rct83ZMti5Tu4GKkErxxFA0mSCUJiNs3Rs09Og2MltxbT/
         /aPA==
X-Forwarded-Encrypted: i=1; AFNElJ8Bh72dz3CIhAt15CLN7uLSXAc+1wIXUj9bv6/YVSqdTPMEIMbXSXMipYBZI3H5liDt98chT/QVBm9F@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+frxpHVNloRCf22Y5ErH6r4d9Y13GmleRt5IAR3epUAP9iuSl
	QGx+WiYCzwZPC58WcNMQaFu2mY9uJ/Bf8P9j9jjR+/rDE+KZ2HG4c2Dpvo5md98lDI7OhYyj9QX
	BxbBmYHav1qrdKVlCJIUXe3juiku4T9P4hlPhcNTz9wnzQdJ1zKYY5UXA9GDTZxwF
X-Gm-Gg: Acq92OEJ+vPeMzwviCC/PqjacmACc+nfhl/IN69AIHFmnYdmMHFsy07kiQOoL3Ws/kS
	1JxI8K1L6FNs6y8Z92rgLNb/6E8vcAPiN7DJY3ESdTK1zAMYjRdIjU+7Jc64ArtCO1SLowdOQB6
	d5SsCLao6psshg5FOFw0euAYfQYcAYtt9XBIJq+064IJpqp8ZvvcYp6nki1Z01o2KO1Y8JK13ix
	T4TRvo/zFZYLfTbngB9EXtpFGyMpRyYSBEzAjyRMiq5jkXC29x8D/uO9Sk15AO6C0pZQV0SG/xE
	KHVs7AcEFs9uO8JQ6R7JOlKuIF2AE4V09uoUdcJ9f903nahsreuMiFcQcS95uyVyDUuGk1oyqpv
	72aWQf0IhmNlRLRgWIuuS4rDlfOFVBpVacTTTrgR6ORMaqMjFrnRF
X-Received: by 2002:a17:90b:3902:b0:368:7d4e:e778 with SMTP id 98e67ed59e1d1-3692384ef65mr526989a91.11.1778698467708;
        Wed, 13 May 2026 11:54:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3902:b0:368:7d4e:e778 with SMTP id 98e67ed59e1d1-3692384ef65mr526949a91.11.1778698467148;
        Wed, 13 May 2026 11:54:27 -0700 (PDT)
Received: from [192.168.0.17] ([49.205.251.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee626a04sm3662992a91.14.2026.05.13.11.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:54:26 -0700 (PDT)
Message-ID: <f1fe6e8c-9a16-3103-fbe8-de772bc4728a@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:24:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/14] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
 <35zfskmyogpazxy7wsw2jg36fvpnnc7hng23j4heq2jy5ookai@q7d2vl7nn7ck>
 <fc188af5-ec7e-bebb-2654-62312d79e60f@oss.qualcomm.com>
 <kdbo5d2wibjfnchfw7xn3wcgcp5r6ff7pw3ibkpbqzjgfhkovp@v4er4hdiytks>
Content-Language: en-US
In-Reply-To: <kdbo5d2wibjfnchfw7xn3wcgcp5r6ff7pw3ibkpbqzjgfhkovp@v4er4hdiytks>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04c8e4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=UdqKVphAFhxg2bWZaUV5ew==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0w2scXXJ5C5TvUHAimgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: klXBqpjwuPyBK7zwtriES9pJlYtUHtBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX6qs/h7OeQWvE
 cSIaEVfo3f2tek2fwbyzojoLZeizlfKGcGZUf7mhPqZDhc7odV58Vvto9V8ZzpkgpbxQaSpdjcJ
 0pIkijNhUQCAQhuN6XiMAJPQwtP57w0mWwVdyoGQ25hw4NnZz887uPZJ1MpGbrhX8RvCGfw+oHo
 kElOec4pT5IigNuu1RONTKpn43DUjM1d4Vtr6EW8LQFtPeOXvt4PVInIk8xi29CK8pWLnX/I9RJ
 soO9Cz5MVPH/b49K2pW53VwDp8lOZhasu+FGESlq51oYhx3+c/U0GMMw9ilYeqBCNh+Hl4ZRwtb
 I437ryQ3xVlfcwROkUJ829rSYdZs4CNaVGLX1U+dC1GTwhfVbjQUHT1RQ5vLiisiCvrqWg130c/
 AQkEUXDcVCa2A9wbpnrZbwIwR3A8l++g5oDE8Gs46TM2dX1PX1d9ealesEgbSzBS+dEIaeaX1+m
 PWv2eXyRoZ2d/BVJLdg==
X-Proofpoint-ORIG-GUID: klXBqpjwuPyBK7zwtriES9pJlYtUHtBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130186


On 5/13/2026 6:59 PM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 10:34:15PM +0530, Vishnu Reddy wrote:
>> On 5/9/2026 12:52 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:29:53AM +0530, Vishnu Reddy wrote:
>>>> The common schema defines minItems and maxItems for clocks, power-domains,
>>>> and iommus. This suggests that the number of these resources can vary,
>>>> while in reality they are fixed constraints per platform.
>>> It really doesn't. It provides common definitions, while individual
>>> platform schemas tighten those.
>> If a new platform requires more resources than the current maxItems listed in
>> the common-schema (e.g.,Glymur due to its dual vcodec core design), we need
>> to keep bumping maxItems in the common schema every time a new platform exceeds
>> the previous limit. That makes the common schema a moving target driven by
>> platform specific.
>>
>> I am fine with increasing maxItems in the common schema instead of removing.
>> I can set it to a reasonable value (for example, up to 20) so that it
>> accommodates future platforms without frequent changes. Anyway, each platform
>> schema must define fixed constraints, since clocks and power-domains are
>> mandatory per platform.
>>
>> Could you please let me know which one you would prefer going forward?
> Just touch venus-common when new platform requires bigger lists.

In the v3 series, I followed same approach — bumping maxItems in venus-common
schema to accommodate the Glymur platform while keeping fixed constraints in
the Glymur-specific schema:
https://lore.kernel.org/all/20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com/

I'm fine with bumping it only when a new platform requires it.
However, I'd like to understand your preference a bit more:

Would you prefer setting it to a slightly larger value (e.g., ~20) upfront, so
that it accommodates a few future platforms without needing frequent changes to
the common schema?
Or
would you rather we bump it conservatively each time a new platform exceeds the
current limit?

I'm fine with either way — just wanted to align on the preferred approach before
the next revision.

>>>> Remove these constraints from the common schema. Each platform specific
>>>> schema already defines its own exact fixed constraints for these
>>>> properties. Additionally, remove these from the required list and update
>>>> all schemas that reference this common schema.
>>>>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> @@ -64,10 +44,7 @@ properties:
>>>>  
>>>>  required:
>>>>    - reg
>>>> -  - clocks
>>>> -  - clock-names
>>>>    - interrupts
>>>>    - memory-region
>>>> -  - power-domains
>>> Do we expect the platforms with Venus / Iris not having either clocks or
>>> power domains.
>> All Venus / Iris platforms have clocks and power-domains. These removed from here
>> and added in each platform schema.
> This is a sign that this is wrong.
>
>>>>  
>>>>  additionalProperties: true
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
