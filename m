Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC2B37B021
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548814; cv=none; b=YqYiHTkasUv4ioiG0Sw8GRVMgjbgqO6kJNg82IrvxCj7Prxvv9PvsdOrXk3vqH75Qzi5Vi7aF7rxW9yDOuUcVoPErUwuimbzZe62UaBr7xvXxihHdMLulTo/n/IypaWMPxb5Zi5K5krkMW9CfsQxzRCY7w+kucmSHd+DJUoy/gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548814; c=relaxed/simple;
	bh=ynIytkEvM/lMzfKzFdYH3iRosnEOPxFxwdPCPHC37j4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gEHVqIuy2Vq2lvdhR7a8cEWGXMrbP+oCg0LyFwdiz/mCre6v8DwYePpG3J30E4ndlV4be1noL28VgghDB234Yd1imEgQuHYwj3zrmPEcm7XBMcf3l6d5tfMmO/w0llo2S9QZpd/vbmh7Sm0n6u9B+t1IYwEtdcoQQEnu/276dqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kI0Bh9Nr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4fwxSfU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kI0Bh9Nr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4fwxSfU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0lkRc1795516
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXhzU3fn87QzANhw6Sren4mwXyOi+1Ud/TWTf2G3FwI=; b=kI0Bh9Nr15e+u2Hu
	PtTBwNv/yt6FP4PpCKZa2RtGJhHqWvQiMYyyKOogIBEqIs9DHiMguaMTOAgbIMCO
	gLQ1wODPI6YNCI964JTI/lZAA1C+qYLzDaDWpAd4PYjkfLqVTb1nyParGOvSm0TW
	MI6y6tw4QTfNGeS6CJiP5i4LzaJyh6HqoMwh9Bp0qJ1fXvZJsmLc5XzyPp1+D0Sp
	WoemP66OK1LnLQiV7L9AnHs08qzvpNpzjlaDg7IEP0nYM0Ne0vICLJEiirSGHlds
	f7E5LYVg49IkeQCf5XKUAPs7Z7TjHTzwzFzbjHwRNt+Jl78LUFPhD2txPiJOQzyX
	PJ1k/Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740a5h7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:20:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d04908139bso42703205ad.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 22:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787548808; x=1788153608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXhzU3fn87QzANhw6Sren4mwXyOi+1Ud/TWTf2G3FwI=;
        b=I4fwxSfUqWbenX0aHi14TlvQd1iJs24LflahuTBiNMW/ZbGQPdaTs335eNmDY5WMAg
         juUTQoEU5nQORE+aF9YC9djbgxDAkS4smlheW322PA8msCDZJJpEUpQt/bgCv66GPRve
         L8tqe2ZBAZFEFkDRuT0UXMc3Ek8mh/2WNQh/pvm0IEOnx368Zcb24pasxq327mMOPdPF
         wHMmxkPYShKX0hrHGin8XF+skEqCG0FuhSg1vnciZCHvK5CW6RLSWBZ+PqpMMX6Zr7JD
         OGjqSKcfrcVASfqmlcMpbvvZbIKZNjVSEEZ9CQ1Z8vB2KIfqavL0+obXwjt1iMX0x3s/
         RwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548808; x=1788153608;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXhzU3fn87QzANhw6Sren4mwXyOi+1Ud/TWTf2G3FwI=;
        b=quRw6gGJKZi2+hkPFo4rQXkmSrmvhFhiIx6szTEqu9wF3hNgqmREAqrRugH2bCZM7b
         AfQE69I+iNLKWEGoW37TOHFjuWa6BIDUs8ulql71xENmmWzJa8ipuZ9X0RKFWc0QVaDp
         2DkJepXpw2dsW/6C96kCi+Y8Cnb/mBXOYwomssV7zQf7oTqawDXIV3C4dUHOAX5ML1aI
         /eTY/biTc73j7D6///l0gYjB7rBHWuPM/uo1i9kcUFwpRWg7mnGgoL7wugBKj0CWgbHS
         D5qt+z69/e/NOfg6IbsjNHQHZv8jYK525HkNv8gzbX/G99wMl1L11ElQZvGB1Gbm7hwq
         KiRQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1lN3CVVHlutSFt8vGV4rteYqoepuIUVBzQ9Yu/M5uoUOpHR7g1oG/wa/f7uaC90bjpwTocls9uifx@vger.kernel.org
X-Gm-Message-State: AFuF++nXY0Pz3t80Ry0LNbJRnS5YCRjx9PI4UgPihWz88g+DE3osBM9N
	yDdDEQzvtsT4N/60W/a0WGZ64dTFj4IB2Bt5U8tUuNMTiFsQZYHLY5hUgs+cHjBmx1l5X86qMNy
	yofKM78UN0GCVHaiARTgGqPd767BcDvozrZOvHXh/qHNHG2vi9wFiM226agzem3qN
X-Gm-Gg: AR+sD10HEabHFGY+THta7hgG43lFV0QKw94SdNA0RcYHrBCov/H3pWw3yXzjZSpvBe9
	YD5o2GVX8rBOFzQ3ILJWWwRrv0zavhHKJWT18RV8FdQGNmfXhpYn5UNU54DpN+seVBC6PinLGDn
	9H9JPe8auz5ngcDjnihDKoNtO+XOORSMkjLY3dEYDJFaPxZPw4A4WOnV/YDtuse00qbKrC8cDoI
	bz86D1Qui1efBw34TBw4Uj5SrlCxfcEf6LON3HNOecWxR2vgKN+cS9146DnatHuVhVaaZH8Twb1
	FWr/6jodNRqcEb0+o1qYFVYqr8JJ3qNJZGCoxA0s7koiBMlj6ua4gwZbT1VLrr0SRny3IVSXJRy
	Ma+coqkrslpcNd3IDh1Q8SYCp8r3XyWUz
X-Received: by 2002:a17:902:fd8c:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d64addb782mr456974275ad.6.1787548807974;
        Sun, 23 Aug 2026 22:20:07 -0700 (PDT)
X-Received: by 2002:a17:902:fd8c:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d64addb782mr456972895ad.6.1787548807418;
        Sun, 23 Aug 2026 22:20:07 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm21977055eec.27.2026.08.23.22.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 22:20:07 -0700 (PDT)
Message-ID: <e63f8895-a9e3-46a0-9e37-54a210d03262@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:49:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/5] dt-bindings: media: qcom,sc7280-venus: Add
 dma-coherent property
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
 <20260818-iris-fixes-dma-pseq-fint-v2-2-8dc8c4b3880e@oss.qualcomm.com>
 <20260819-neat-prudent-chamois-aa65f2@quoll>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260819-neat-prudent-chamois-aa65f2@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0NSBTYWx0ZWRfX2VGZqlvqT05p
 IlgB0vPfVZYYpdfouhkXWDUrd+sdz+L2gLlD2ciB5GVSkqr8ppBXVr2U8O1fcMl2Vx9aLB9fGqk
 XRl9tVYGLuYBZemKZEZ+VzE6Zb1i1g6xixR0CuOLG6qa+wAzVB+luXRA8rq8FAhIFjILMZu1XY1
 NwIH8gMvKZTl1wiHH7Uaa4tVXrn+Rz4XdlLCf9/qLiZ7+eZNP8CP06uN7xTOh1v/3l9O9jZs06O
 p4AdHaXchlhnNSJfLJNrNVhTJoHx3859ETyr8DyXeBLmnpghQ+BK6kw434+FPzdH2FyRihSKiSM
 U8NcCVAIRv5QBK9fPPpiuvKaECP/XPfcdZcVLe1pUwfSjN5YB39C49K+j9/RSjWC2rYMJZhiAuB
 gDYxFBzF4dZCRsaE3Mrpf+mP1df7ZoKyhRVjIRBDxOGdPEtfJLz5kvEWo4wRM7IzvUcmeLAjkzV
 UkVPHmwZ1CI2VuNSEIg==
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a8bd488 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Pek9u8wmD-f72TQT68MA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: epWj230BsHLj36DOz55Q4V2jwm2nZo5X
X-Proofpoint-GUID: epWj230BsHLj36DOz55Q4V2jwm2nZo5X
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0NSBTYWx0ZWRfX7BNZZR/tWcVp
 gUWcD+wleI/69sZWY8TpQ/AHg0VII5DNVSnFb2c5EWCOkMn+7DDTnau0IXS7E3KH+wdslJWd3Kc
 ynMnkECcXsTlviKyYaTtZm/yh+yg9hk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240045


On 8/19/2026 12:45 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 18, 2026 at 09:24:15PM +0530, Vishnu Reddy wrote:
>> The venus video hardware on SC7280 is IO-coherent hardware: even though
>> the driver does dma_sync*() calls for the input and output buffers, the
> No, the driver does not.
>
> Anyway, explain the hardware.

Ack.

>
>> venus node still needs to declare dma-coherent so that the DMA mapping
>> layer relies on this hardware level snooping to keep the CPU cache and
>> the DMA buffers in sync. This avoids the unnecessary cache clean or
>> invalidate operations performed by the dma_sync*() calls, which are not
>> required once hardware level snooping is enabled via dma-coherent.
>>
>> Add the dma-coherent property to the venus node to describe this
>> hardware capability.
>>
>> Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
>> Cc: stable@vger.kernel.org
> Nothing to be fixed here, I already told you.
>
> NAK

I'll remove the fixes tag in next revision.

>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
>> index 9725fcb761dc..cc31f3ba7e7e 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
>> @@ -42,6 +42,8 @@ properties:
>>        - const: vcodec_core
>>        - const: vcodec_bus
>>  
>> +  dma-coherent: true
>> +
>>    iommus:
>>      maxItems: 1
>>  
>> @@ -85,6 +87,7 @@ properties:
>>  
>>  required:
>>    - compatible
>> +  - dma-coherent
> ABI break.

I'll skip to add in the required field.

>
>>    - power-domain-names
>>    - iommus
>>  
>> @@ -119,6 +122,8 @@ examples:
>>                          <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
>>          interconnect-names = "cpu-cfg", "video-mem";
>>  
>> +        dma-coherent;
>> +
>>          iommus = <&apps_smmu 0x2180 0x20>;
>>  
>>          memory-region = <&video_mem>;
>>
>> -- 
>> 2.34.1
>>
