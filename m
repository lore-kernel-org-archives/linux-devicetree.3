Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7B39E6F8
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069813; cv=none; b=pYytKXzM0y+oWG+to42iPsJI99ty0KSFUzRMbqnSkemJLTefGN2/CFxRhwYWWvdNiKycebVgtI/Ih+0Q9qzCbz0QWIt1uI4+ON5CGqsm4pqMZDV7QpU75oBy6k9HWs0GM2oLGagnPllmyFIaftJ6944A/etotcgipn+Gr9rq9VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069813; c=relaxed/simple;
	bh=c+KE0T0IcDDbwoUsTTCmKZqT6Yfzi3GlkZpTMj/zRDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTp8T2AyqINGnnZpcSQi/mXXQj47aBMBCEIV1re6FcqWzqaYSDIYiy/i2OCwJrN1Q2hHRDYj/ISgYdlTz8Ewiio5vaXdVj/8PCizEgJIMqNGMgaZY2BGeXdOEXocvKtkc8qu8UlDVBTXino7lNzOhCQ5AW+kp/RkMhzgM9rPppI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUXKMz4o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIIQYgOb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUXKMz4o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FIIQYgOb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rdYc3087978
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 09:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYViuiGlDPKweNTZktoxsCGXzpo6eRi1FKY8gO5F6bQ=; b=JUXKMz4ooq0ieK0M
	z7F8OIqACMUia9en66hni9NCbfzgLR1zqdKhMriSvxPfRwmB1ZJmDfiJbBxpVP2f
	Qn8wwfkzyPNNLQ54zofShvhL4p5ll/x13+Z5SWlBcsCvo6mgQWEjDHZIB7CM2XBR
	4nam5hjJ519OUOtKcslVEFOSlowAsfOubCGMbgHnqMsY//Z9ocV4SuId6+IeMfaf
	p/YGnVw7z2PPtFvYWCm6Q6cM0vJs0uStOYOU58fUMLIN0jE/sKwii7gMm6xk/p8M
	8vOWClrSp7dTdtt4TwVjJkQTVIrD7eylw2qhowifXShdH8G/SGCE9bqsngcIEwY8
	jLVPkw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2547wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 09:10:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c8284701c2so4697575ad.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 02:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783069810; x=1783674610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYViuiGlDPKweNTZktoxsCGXzpo6eRi1FKY8gO5F6bQ=;
        b=FIIQYgOb/OEAD0kAP/uQ15uMSDcQ2AZPFsCsfVb8k3uLoFX3Ig5ZE3MOeuh4NI7PF6
         BHOxWITpUw7Xv8NKTZ/TXw8d0z/CwRFZPPDodLtjkUdVAiK/d7vZEWEhxx1V5CRvTKEM
         iUCEXGBMelPmMmHhwB1UylzRPNB3mcws5hIlubE+vEknpoTzq/SwytpOXmkUS8HgcYTL
         qSIapQhdxjphIgfsgHFDxKhbiM02eyw95DRgosum8NLoKskh75oiRK3MnxUeSIKk8Oa8
         tsDwMoUzNmjTu/pULq3jQF/TXpL6wQT1o5KpKCkM7oiU+6qForE+t3jz1mPHfvw6b1a/
         Kwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783069810; x=1783674610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYViuiGlDPKweNTZktoxsCGXzpo6eRi1FKY8gO5F6bQ=;
        b=Ecqz/fHo3IYu9dSHPUjlJ4kQO9kkvsjvnXgu8oPokMEjvoB6NQP85fPHNbW5v0/wU4
         jts3UB/LJ0fkM+bxruW2draDSvsXAqxjNzex6zhXhAFq7ptdAxm/bXLRE1A+Wf6AglGi
         OLF2P2ZonWdNAcMy9k0m1Ltiyp4Knoltb+gtt2pQY8JcjjlPw+vPD3eCVkqF/gycJ49O
         YE7AZRq12VAkU4+T4UsGAU1xReqJwuUhCgV9ppiN1zJRLRKkT45Q6b/Gp6oG8I+W0RwK
         a6EJ/inYZkc5dvigGA7Y+F4ybZIM2VUeBahNU5h9UulyBNHbnX7yDSyjDnTPFYk9pUWL
         znjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkKfNKvq6gUrTOn3LIfGw0dM0q+kb/gfFrrk9RbtHWFNY6utpgR8HnSfgFooQo0QD0Z29xZfBdSoNS@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXs7qQ/JeSW4tGWDTU73ili5DYRDPtR3diwksB9xl+cP6ZK/v
	yocjnZwTkqPjD+AXzzcJgJHFvVz73lXz84hHwj2FOqHOp0GVwY8e5h+IxFuFWaSNZl61iY1OMaY
	NZQgEVNtrErb338ZEKe2oLyayZj713zuncoNNKQjsNbO1Poze3AWumECyrrAEgF/E
X-Gm-Gg: AfdE7cnPm2zkKbdMz5r1+61b4VszCe0IcpAwOuEQcnr4fOzanTucYueiMMMNMY8R0og
	0vlx/VFEC20bZDszAqid6QDC+hiuVYmDhPC70C+IcWvrftKGH1V8zczkKg5h7GoQX/IskGaZyDZ
	MKVDl7tK8Ce4u+rMbIr60TxBdMjUMUdoBNa/mrt84d3vhfMvxkrvIOvqsrnn30n/wyF5Wmovom2
	Ck9OilIS/JKX89nyHFQ0vWTIDLiIu7r+a7Eimnquddp27aP9Bp+vcPquIpOMMa9XgGiyNOt6DGQ
	JwqQ29nD+Pg2vzhrOC780xRjeQqAPIBevu+Z1Pdy3wSCAwcuSsSzMoNx+Unbqp9LkoFNRN7KFil
	VGBRHJDOSFMSgZm8kPEb3IOJKEgECpZ6xfBy5L7s=
X-Received: by 2002:a17:902:fd86:b0:2c9:97a8:aff4 with SMTP id d9443c01a7336-2ca91232f54mr96529885ad.45.1783069810462;
        Fri, 03 Jul 2026 02:10:10 -0700 (PDT)
X-Received: by 2002:a17:902:fd86:b0:2c9:97a8:aff4 with SMTP id d9443c01a7336-2ca91232f54mr96529435ad.45.1783069809972;
        Fri, 03 Jul 2026 02:10:09 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7126971sm6279575ad.18.2026.07.03.02.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:10:09 -0700 (PDT)
Message-ID: <580d67aa-9a5f-4fd0-ad15-f57865b79477@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:40:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-3-449a402673d0@oss.qualcomm.com>
 <cfb45d95-7bf1-47dc-96f2-2ea4e9be9e70@kernel.org>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <cfb45d95-7bf1-47dc-96f2-2ea4e9be9e70@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a477c73 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0nV3PEHnMKbNZb7KTqsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hkPjOogjk9V4jx_H-pOauXreAaIS0W4x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NiBTYWx0ZWRfX3UiYDo1IwDNq
 AAD+OA7CmMjsYhZlfPbUQT8jDdxdyhK5HPc/JL0/jfbI7H4XoTz6N71wkLjo2CcB9Iy+AvHcmkS
 idHVOzKm21xYPFxWze/CLkL+vH83HIX9azAWeaTfJIPszRmiVEwzxyCCiEG1GK3JNsIY8UcZsmu
 8UrmU/qnpdj1swwehfhMgc3aRnx28FLZqXY1CemKOmZyfGcApUTkVSveTkrogvf1HIg/zuQOSqf
 xijeud/qmfnmeQo85c7oA9u2ymwwq8HIeJnXKPxoDPyIsxKNl6fN8cpcTSPlMnc/euiG/OSfhrm
 JmR7XfzmkaEMErWHTY23ZwVe0vN8R1AvewdM9gJsx6k6h44LUBgGQAcEDAlcQ2dO0aZ7k/S/7XQ
 daV/jAa6auGagMr5QhobJhUK09NkeYsz3DDHHo4gyG0Hajf5Il15z6CO5FTpc8FW5lIQBJ5B7co
 Lh8PIvzRse8DTr42MtQ==
X-Proofpoint-GUID: hkPjOogjk9V4jx_H-pOauXreAaIS0W4x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NiBTYWx0ZWRfX3fB0ixxiv10J
 95gw3I0ZWyfuS2WeAVrUG4xbr6NsXp0EOQTsj7pJO20Q1F/5AMEp/FU2CAbfYaZKh+zJzuE301n
 9hlqFge1J6A1lc8miBlMYktJr2mmkL8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030086


On 6/28/2026 2:14 PM, Krzysztof Kozlowski wrote:
> On 27/06/2026 12:01, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
>> used on the Shikra board.
> So that's a v4, no changelog, tags ignored, comments not responded and
> also ignored.
>
> You got yourself one NAK, now second:
>
> NAK
>
> Address the comments before you send the next version.
>
> Best regards,
> Krzysztof

Hi Krzysztof,


Regarding your initial comment "Does Samsung Shikra CQM EVK have it? I 
guess no."
I checked internally and found that there is no Samsung specific Shikra 
board. Shikra (CQS and CQM) boards have this panel and i am upstreaming 
for the same boards.

I hope this clarifies the concern. Please let me know if you have any 
further questions.


Thanks,

Nabige

