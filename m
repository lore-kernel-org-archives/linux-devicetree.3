Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC74B1DDC2B
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782798436; cv=none; b=i36kHsVhk6lU2D9YObNfUKmj2s7wbC/GqaC3cvgK8xAvz0KuCfvGREihsUNYlxbkGg6vQvo9upgM0pUWBJEO94xrx0Cf/QRw8krm0Rr4HlOu79HiTXMwn5ZJaZBWY1wGIM9pYkrW9W5tEuSNoWsc8prxZo4nzyQ0mJgFolp/s0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782798436; c=relaxed/simple;
	bh=mpkM47434tD0wGgOHIo6k3LyRJFJ5GBBtWyy29+bjDw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FU1NWlOwjLF4Ai59SWGQtTdfgT3VHZx4tnExh6kyCh3uGqBBeYtJhsCr+wwNXZ72dHQY/D04vasndj4tc6X7iQbB9f4xJlp7H8zAaM9yhEAHwhEAnEEqpd/n084rJnoiETkjLuBU4sLIgbkOXwHx/xwLd7PtbpwTue+u2bqo2K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+eazqqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtD1EW8j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+eazqqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtD1EW8j"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5c8Ra952554
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ExZ2dZ3mZh0DRvVQCg0gTXdRYsW6Gjpzszbogo+cOM=; b=e+eazqqvs2KdUFol
	lnOI2Cv4+UQK+/sbKissHcvRy//hrtAIKdfHQaPswozUzjxtyTjfNwGbTh5vlTrD
	Fka21daja3ui9CXWCH+gGP6lP2kbUlHj7YQNsj6zrHLGop7bD9FwmFJyGFuVLPj0
	yHdOlXraiHyN673tVHUpynO4L0PsoeLEr5AFClsy8WXkijNFionagHoVppGzOSIp
	VHi29v2Hahif16GK3lV6kelQd0Vb+F0tYZZRYJaZNagrWEQZGvhPZfhqQNhdjogL
	ZTDFKfXdZP8y0qDRG1PzV9tbXWyrOTx1XVGJzhzQpvBT2DS6ryDIikf4cgsKoFcX
	CcGQIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4gmw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:47:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca3b314193so2668225ad.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 22:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782798433; x=1783403233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ExZ2dZ3mZh0DRvVQCg0gTXdRYsW6Gjpzszbogo+cOM=;
        b=XtD1EW8j29tRJeQaRfc+2hSdiXymzeEv/AbtU4Ag4FJfVQcMS97BjtAduOwQMxkY39
         S8EDmUGeoJZ4YkukWn3zXZvjn8eWo9Oy1IBRTCqXQgu50DVeeWUy5EW83OQKzEyZWQ/A
         LIwP+5sa++PEBDtEXHmzYR8smGUnY0JiMZkql6SvbR+jsgdlgliFkN4YbdV29ZMQo4EA
         f+pBfopY5GPKAs8m3GuDI/yxGOexB1BJnNtqbQ5kT23gmHIsQbp7zhhb8CEwpYd8Foht
         TvlWnxq3Na9XBB3mqhw50asuvHeJSyKrEuPZziBvFTyh23Q2ZEOnc6zmdZ83NhLTTWyf
         5FUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782798433; x=1783403233;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ExZ2dZ3mZh0DRvVQCg0gTXdRYsW6Gjpzszbogo+cOM=;
        b=NZrZl45L9vSRZipcPPbO4BpYt1TsrTUQ1kIlp8bxQ9RjerfQfFZO4vIqyyy8MSr2qi
         6Cs2F5NNOTRJqvJEymo4irhc6kxg2g/bI6hg+P+Ye3sqaJbqwoyMgIXfV8pmgj0+vY15
         4v0OXC8HBKocLa91tT7Wc5X5Y5RpjJkZvIOv0MQ3adZf1kU6WUYzs4hYnbleJwJiwMyh
         DFNNZcPVhHXNQC0V8KZ14NzxmKJvfCOw05DmUKYL4M19qBsKhD0EFpqYko+hdKirBl8/
         XujJHnLFGiAZ7xYCWv2R0Wb1gmLsIQNjf/ZzscKGpbRv7FGkR4R21iT4SFoS6Hv9JxOd
         nEPw==
X-Forwarded-Encrypted: i=1; AHgh+RrK74M6NCtA+MY7INcsPfk7PhBQYehKC47HQ5+28/8mIt4SAQUOiE4l3DzfB/4fYK+irIMbmAyufBNa@vger.kernel.org
X-Gm-Message-State: AOJu0YyrQjN+A7vImDtIiErUI3FvgIcSPdiIVtGQyO+E8uyI3XVuLOQM
	YyYLBja2W5xRXDRK4oOc56IH41H3UFpydeL12FCthlikA064FjAotM3gXWwRe/TMf6JXCfBPEx2
	69/lnioShpaKGBjNv0yyYtpjUhPKuP/Wr0DeLT6WnGusG1ZxFu/lD7x2OJMY1cb6I
X-Gm-Gg: AfdE7cn/QnXovM0/eS+iI10an3OaBAogMsIeEUaViNO8uvYE9jpRokBFR/ISsBnW36O
	W7hXnf6kaa4pBy5kTArp9am6iuqArgB10SJK0fcepEFNSuVLAadE/7e7FRdSyppe1ugX2qMTnbh
	Ju29NUrmNM/YOlFOP/n6bH/hjDIuJ35AQgMrpe6SO5GGMafuLS/wfTO6AVUk5bvlIujkvBvA9a0
	JKnFc/XjdrSpQ2OXQElTrIYcObaYdW2AnEzSnRz7QBptimX5LLltMiAoynQEv7tFWJUz/KgKxFC
	g06Cm+aW25Xl1Xj2lX1opSjYFJdjZeZvA7UFy85wqgK3Q18Iz+CHh2CbI6dzgsKu91HYAxSUkya
	MB/6X4p7J9Xv6buvoiBCT19qtIIY963DW99KOWkXLQBqzRy0DliZYVvIv
X-Received: by 2002:a17:903:240d:b0:2ca:1bd2:d57b with SMTP id d9443c01a7336-2ca2d3f0965mr15937235ad.0.1782798433273;
        Mon, 29 Jun 2026 22:47:13 -0700 (PDT)
X-Received: by 2002:a17:903:240d:b0:2ca:1bd2:d57b with SMTP id d9443c01a7336-2ca2d3f0965mr15937135ad.0.1782798432810;
        Mon, 29 Jun 2026 22:47:12 -0700 (PDT)
Received: from [10.152.199.171] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca4bae1e2asm103195ad.73.2026.06.29.22.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 22:47:12 -0700 (PDT)
Message-ID: <5957b2b7-270f-4fc4-9b06-adbb54a13cf0@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:17:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] Add support to read the watchdog bootstatus from
 IMEM
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
 <1ab3a88e-29e6-4e24-be83-7c8891addc9c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1ab3a88e-29e6-4e24-be83-7c8891addc9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mmzVEObPjFyztkj4j6qXp3p_XLP58Yfy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfXw89xZkrbjWKp
 ny2sTzoangtEvstqS/5EILVw9AcuXkXkcIP6iTdVxG3INaVCioVRJ5tylPETExRw0wlWZvptfzJ
 reDr8Ziu6AhbkpRSsKVfXtjrXxqClKI=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a435862 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g9OaShGYrvlb0wzR15YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: mmzVEObPjFyztkj4j6qXp3p_XLP58Yfy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfX+Vc8QYpURdUy
 cTJkSJHIw6CItFUAkR9MfLId9NpdQFpZnh5BKLchUu0zslpGkYTQKmIi9PKcbNE6o8AsPlav6Mv
 cnArsInWpXJdNRnPA0kJJA+ucCQVcqqp0z0ymvutCR0flE2xaeWlfeHtqG1wC9AqH10qyp/cTFx
 Mx5rBYSJBIEqRlspAqHPPHgQrWIt3jDu6hhUQekxjQzBOKG0tBKyMFkUa+H8Vmdz1iqDaDUqEL+
 bk36qwgBcPPWvJ3wUxd7CGoo0FuwZ/7b4snTKItuNhS8IGbm5fS3kV5Yl7x1AXLMtSa+8Nefrgk
 HCGmvlfS0DkHBTsqran0AeFqu2537Vk1LuUzwLElMhR79D51QWUXVga4bgpq/Gulp3P+wxloLyA
 /Yv3jEacwUAztjExq2iXYUSicvoi+dLl9sczx6bLAMrAGdkUNDYSdXcxoUdNGTgvpAY1jvMEDcc
 Bq7JlzdCz4KmsuPqONA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300042


On 6/2/2026 10:39 AM, Kathiravan Thirumoorthy wrote:
>
> On 5/13/2026 10:30 AM, Kathiravan Thirumoorthy wrote:
>> In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
>> timeout, there is no way to identify it. Current approach of checking
>> the EXPIRED_STATUS in WDT_STS is not working.
>>
>> To achieve this, if the system is rebooted due to watchdog timeout, the
>> information is captured in the IMEM by the bootloader (along with other
>> reason codes as well).
>>
>> This series attempts to address this by adding the support to read the
>> IMEM and populate the information via bootstatus sysfs file.
>>
>> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
>> as below:
>>
>> cat
>> /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus 
>>
>> 32
>>
>> Upto V9, this series has changes targeted for both qcom and watchdog
>> tree. So V10 was sent with only watchdog changes and it is picked into
>> watchdog tree[1]. For the remaining DTS patches, sending it as V10 again
>> which needs to be picked via qcom tree.
>>
>> Since the watchdog changes are not yet reflected in linux-next yet, upon
>> merging this before the linux-next gets refreshed, below DT binding
>> warning will be seen
>>
>> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: watchdog@f410000:
>> Unevaluated properties are not allowed ('sram' was unexpected)
>>          from schema $id:
>> http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=watchdog-next 
>>
>>
>> Signed-off-by: Kathiravan 
>> Thirumoorthy<kathiravan.thirumoorthy@oss.qualcomm.com>
>
> Bjorn, Gentle ping... Can this be picked up for v7.2?
>
Bjorn, Gentle ping... (This series cleanly applies on the tag 
next-20260629.)

