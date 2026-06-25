Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0117A348477
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782396243; cv=none; b=txNVgYWlbvd5Z0lriCZ2Z0KJDdVaydrZArMQdt3vE0EO5LTrjqfwCCMTbHY67Kgl7c4ljq4cBLUr6H/K0tH668RcPutOAgHaJzD8TgKdbn5Jqt/KzSsz2QFhFg9+geFUCugS2SzDykks061SaZCO8CPfJdGl2Ss0axL6cIYuEvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782396243; c=relaxed/simple;
	bh=02smTb6fZgfg9URvseMu8KamWiY9JYyKfTM6E7OMgUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BRH3TQY9ClHyN1kI30kEDVMB3yHvH2rMbx/19dln+xO/mWltV1MuwsjcOeTihheAnja38QAWbQEtiMo61jcoQY0c6hN9gsHW3tLvVWfW1XnAPKuz9ixTlcVjcxg90t1emY/2ZoiWwQBNzQHZNSZ53NZe/8S8pQKzE1DUnMEsyTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YN+cOeXn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QY+5fWFo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YN+cOeXn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QY+5fWFo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9ju491723259
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PPPUb6wNGYobJTWRleQaNEMOvAdQK5WbWVrze9AWYus=; b=YN+cOeXnnU5YeHl7
	yWBeo181jiyYqiq+bO3YBLSU/i0jQmbG99HndiWzVRYpzVOqQDZOk+Uq9DjW10I9
	UhRHIiXgPv522YDByVNQvy3cMzs0699FVQyxRbKu2dul3FFx0x27een/5p8MxXel
	vDQAo37ooTp34PwWu17H8ZqhYRrO/pARV+dUh4m1tbkFY/HQO+dBNMpf5AFtiXxC
	oPsxIUDRlDlpnc/dBvlhO+BKTU2dXeLdQAbg99vM4AVX0AkvPPxNZB2xWlBZFg/0
	QIjcmYNArTTxmsYgB0XWv+/H4BmDkNV/9Y9HOBBym+IJco8GqAyiIHNExUfQjiOC
	5tc6yg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dvkva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:04:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6bbd0afffso34473365ad.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782396240; x=1783001040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPPUb6wNGYobJTWRleQaNEMOvAdQK5WbWVrze9AWYus=;
        b=QY+5fWFoK5TfiwN2jdLO1SGw9roQSXAsATcNvZj+SQNAFVL0vhMgSUqO/HoqEHNs/H
         Li1Iq4tht/TCPXDNwIcTmNw4LRba12wObOjOw0Thl3BbOl5knKyMiCY75EJiOTvqjAyu
         i35Btu2Cvesy5leqjDMui+R0AIqfpg29xR8gYkfQlbC0sR7D1xC7t7tW2N5Sb6qzzDEk
         zdDuj/WumC9eopJRN6wj5cAHN8j4Frsn614TkBBrILU3WkP7OSJvtYeb2UbR6dnko6+c
         jiiO1iQR8sh08c53ebp2dtQcZG9z9cvoL8nACq4Z6t/E6XcBuMlxyyhM82a0/1qdCgWD
         3Xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782396240; x=1783001040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPPUb6wNGYobJTWRleQaNEMOvAdQK5WbWVrze9AWYus=;
        b=FnN0t1VeSdLqD0kVac5+noqkMfHJ45/F4iaf1wL0UIf/M4lTvngtbur+2oPT6okHU6
         6dro57WdqYwdC5MPrs/7FBYZrjl8HggYEt5DRXNwb5/DY1pgsX+Wy+2upT9BqJgdeae5
         b1LdybMPrJ+3wUuhdww9AY2zwPckt7TqPxT8clqK9Pv+/TdbQusQG6FSAtIj8h2UBWIY
         D7Xzj4hL+qB+tMf0OXkKzln0J7yXB0tu9WhqTnUqCczxRWGzpdrCmlDiv5gzgf0iizeG
         BBlVGdaMHAwVC2W7R+dWMquIPyDFPyvDonI899p9Gpu50P1G3K5ju9iMWIYwr7W18GUz
         /pNA==
X-Forwarded-Encrypted: i=1; AHgh+RrG+0sZmykpr5NPaBXoT3zrrj/h+nx4Zl0dS/yIy5EZQTfdN0W/Dc0TmeFLxm7xMe+UhN9UoEC74Pjg@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZTQWo+wd9BcpagsZ7rpYZk5JjQSiwdY714u4MrlWsfLfYQU/
	xWVT3qISP8l9q+ImOUM4OujVz3evStdahf21KPAtNr8W3X5n8cxtk+KnQ0qUE2osVU4nYFfzMSH
	MrisOX69oaOC1+vxrcGn9HzDslv3c8uZQ7NZadEHuxMyha+fA+6vFdKrRml3uhBir
X-Gm-Gg: AfdE7clZfIvg6Qr6CMW+1WhrtG2tv4iUX3yuJ6IM1ZQhPeJEPTlCPFo4kGvGGu5SoZk
	xXoAiNLvbUIvSlzU6Gh2ckMrsI0tSvsnVj4deztUE1tcVCMQfUOBPEbfow8YA3z5T3BhBydbs6O
	yXieHwg7ANrG51XHysZqswmguEGQjtqw4+Xttrlu3U+5D/Z3lnxUf5dUxiUAdGjaVykpPNkEm5W
	C/bRYvWOHjj9HQPrjDW0+jOAIDSIEYT5US8FPGba8tBYsdNQN+iOM3trkKkQiTrlA4gQBhWrxNo
	P1oUgqXFfdQrEtJ2Px9SI5M/4zKlndiVRHwF9gP127Dx7wmXKdrE7YYa+MehhqGJgcif/cJyQ3S
	Zcr8up34P4udwtHQSMbXIaZXI0axwzAHEQwcwfUEQ2y0=
X-Received: by 2002:a17:902:ce82:b0:2c6:cf81:74a8 with SMTP id d9443c01a7336-2c7fc8ab639mr29959685ad.30.1782396239694;
        Thu, 25 Jun 2026 07:03:59 -0700 (PDT)
X-Received: by 2002:a17:902:ce82:b0:2c6:cf81:74a8 with SMTP id d9443c01a7336-2c7fc8ab639mr29958985ad.30.1782396239136;
        Thu, 25 Jun 2026 07:03:59 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba862asm208137866b.9.2026.06.25.07.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 07:03:56 -0700 (PDT)
Message-ID: <560888a5-fc36-4495-b8c3-66edc3f126f2@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 17:03:54 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
 <20260625133828.3221781-2-atanas.filipov@oss.qualcomm.com>
 <e65358b0-b978-4672-9691-705897bcf209@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <e65358b0-b978-4672-9691-705897bcf209@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: prEyef2ukCyO4oaZNP7FRUQWsrbp1vqB
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3d3550 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TRDuFWLCCM6zB3E9pkUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEyMSBTYWx0ZWRfXzmKvVpyhSL6v
 d8qZmFXH0R1rsrVswxwcVJFdqNvL2Ec4qU7SZLLc2SEYCDNbMJ4RlJoVhRktjNiWdWI378BPK89
 2EamejT8TqEERq8CN7iCyVgHG+iVAIY=
X-Proofpoint-ORIG-GUID: prEyef2ukCyO4oaZNP7FRUQWsrbp1vqB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEyMSBTYWx0ZWRfX8dtR+kudeLyY
 sm6WtbZxQr4nb5HQ+aJn3GpbBIf7MQuPnRTzY/chGkkoGBJVKWus9+Xs7DpVrUytFazu6GuV1rj
 /CEg7uG+JBjLxYhxmRMSw6ECJ3e+AwndxRGDc1eojFz5oMgJDAZtOy9JsWw3T37fYfBmoZSeLfN
 dVYvcH9vD5NmskW3ONhlL2cZCUgwsbY/Ti912hkzdjsRFEKww0EHJ3pvJbr89IlrWECt1mA0Nc4
 QJmpUOQs/g2W89xggGNlrn0md78CaPoyFrOwCaE2uXS7aEdLa+u8o+nqOG+4cGQ/KZuCgaT9FQY
 oeLTc3HBfpyWuYnM7KZqpH5lZGD9cLMQJDI+PRTOsWRtAQC6wA3kuly/VOJlO/DbncZBy9ythmy
 zRISvLlHOrX3BhxuV85Z6Yps+y6bZ9/g9it+We1bgcXi83gWUTh77UxRAeJcOymUickNWRYPQZK
 e8HYor/ugfCoFM13coA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250121

On 6/25/2026 4:55 PM, Krzysztof Kozlowski wrote:
> On 25/06/2026 15:38, Atanas Filipov wrote:
>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>> present in SM8250 (Kona) SoCs.
>>
>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>> that performs JPEG compression in memory-to-memory fashion.  It is
>> separate from the CAMSS ISP pipeline and has its own register space,
>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>
>> Properties documented:
>> - compatible: qcom,sm8250-jenc
>> - reg / reg-names: single MMIO region named "jpeg"
>> - interrupts: single edge-triggered interrupt
>> - clocks / clock-names: Common clocks and JPEG core clock
>> - power-domains: TITAN_TOP_GDSC common domain
>> - iommus: two SMMU stream IDs for JPEG pixel and JPEG DMA processing
>> - interconnects / interconnect-names
>> - OPP table mapping performance levels to clock frequencies
> 
> Drop, since when commits have such text? Why are you describing diff?
> 
> 
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 135 ++++++++++++++++++
>>   1 file changed, 135 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>> new file mode 100644
>> index 000000000000..ab8d8951d21f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> 
> Nothing improved.
> 
> You actually ignored all the comments from me and at least one more
> comment from other emails provided to you.
> 
> This is not acceptable.
> 
> NAK
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

You are right, I apologize. I missed several comments.

I will address them properly in v3.

Regards,
Atanas
