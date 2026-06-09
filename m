Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C9D3D0BFB
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989129; cv=none; b=lboc6URI1zUDbGQwk/x+bqTlpETwjgK8AQSANxs2X6BcRtFrXHeWYgRRVnv7wKV87287cxDinCFx2Z2FvVvHmBYvGpjxbF5Q7r02U/JlQBTYviJOLbV5k9BEjV4DkFc4P6mIsgALT+E07i76DvuKZvMsVLtqAh3JYFDGCbsk7Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989129; c=relaxed/simple;
	bh=Di9Uy9wM6dm4NQAVkyjXVPUSJhqJc5J0i9cLaf1DGxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSZPfWjdK2F254MzurF4iXwfhW7V/94BY7wtc4/svu+onBddKlQ/bnVNKOrByXcoJ7DjKIWpsW6YeQmTpF49l3+Axn9sdi4wOpaNKURfqxa8CaHyuptHEocOLXg2fDrjhTv+hrL/OsNk9afCq3Bg3w8irLYIQCAbxu+vQYN57vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uo1iqkfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0iDg7CK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uo1iqkfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0iDg7CK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wr7c1498513
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 07:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XSEYIwz5RHp2qgsZn++HUntrNJgTOGYlGnqOYr4W1c=; b=Uo1iqkfXK2krkuOZ
	xCHzlZr7I9Odrfr0rheDc+2GIjlxkt7HIUBkU7iJY5u/waARSBfZ2iowbIsrVvuF
	Om+edxovn6edbLZC59gOL6dr5rR+Rr3QCAQrMKklfANf4NUEhZkxz51Li8QEaLTu
	iwJB3/4IskH2kQt6S9xZGkfQZn3i9YhOi33z94cwFqj8DYHLTgx588iR/oRQpH82
	ouaXziYvqVljb00eMh1mP1tY+6vzvWN8bG15VL2i+huCSd6xjnRVAe83xy0OHrjD
	r6nHBy+WmNkjTCTV95Fbu7ZAQn1PUW4oWV27pBcBBb5ptxLuEXr2IX0oRVfc7rRz
	7Y63tg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8n07j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:12:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so38370845ad.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 00:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780989125; x=1781593925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/XSEYIwz5RHp2qgsZn++HUntrNJgTOGYlGnqOYr4W1c=;
        b=M0iDg7CKDmKWHqk7UBv3oS8SS4rP4NytOoF+kSHG49g5+31FYmelFaa3vsicCx2AB7
         xQr/jOv1Z8UYSCNSV8d7OnxHFUgtFtAWJK4j2vpQ/yvjZnfGLGvqAw6HLtJHJewe2ZX3
         1VIcdD3/Xb/dhjMXxe+COQazfqs4E2rIJ5pWTeePVZk0abiHgHNEovLLYXX7s0iFiH+s
         SHwlbjRgZUdiWsqGdliC5TP+Sd4MfSZPbBtzfl1wHT25t46TiTnCQDfkgAwyhB3URYWa
         bZedPtmG+63s3u3UaBO6ZZQ4iCqS3T2po4u1uK59f+tvdBLfvjudI/D95qhCWv4FOlvp
         dM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780989125; x=1781593925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XSEYIwz5RHp2qgsZn++HUntrNJgTOGYlGnqOYr4W1c=;
        b=T2Neoup7ZNOgbGcZNpXIKgITzCAXt+G+P0wioFmfZYXgKQYcb9JzoyhjjjSNiINn7a
         zFMJSkDfZpi6BYhu/Gf9amIn7jwIKDUgxbRz37cqvm2zFrgjHaMYf/QnvBOEEInLsu5W
         2b5BvvqIdHif+Ih1arIktiqaH5A/KsBeKQCXkPdiBM5IFzydBZ5kxooA5BBmdjtHBVdd
         OjXPvcez3v/l12s4WYnmg5X+VFObCUz9JcIk8IPmQWRE3TGJs9uC40MmWV40d/U4Xi86
         HaRaUv2FupRZIcK0U0RFZqr0/SkC7yedpm6eBTR76C7NaYCMlvnbBmdqWZLTlZHf2ml5
         1W7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+jjSEttH+aROBhLDjR5W841eSyiA/jzIVemqxlixvhin8/IsUY0L18rgKu6rSULuPN7CnSUJslBQ5N@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcWmbeDwRpC1Sp8oMP47BOH010xptKZaUbVFqCPGat7wz7KFy
	ZBGz3PiCZtuO8BigceK5+JzjsdMLlCm1CuC/W7Lw+tE9K8dH2RLK6SUGR0gDq5e5INN9FRhlTqv
	mIAaEoeoQK5ZDixlBHUWRUGy/dRC7JqXc+dVSVFyHT+VkbTWMZ/87xKUy/nt1a3Zu
X-Gm-Gg: Acq92OE4KfUNkokH76X1kQmn+/ZHI7HDK8ID9s2mv2ijc4xZBgYMxA4bpT4y1mWKaww
	ISb14dBPQF8Io5AdBnEPO1i+8KrExVV/9m4w/GuMGtapjyXea5lO5vX73oVJQWWxK/ORo/Mf301
	Y7sWdjt+TL3nB/7Vweae+jSyl3vR50Dv/pexrTeVocAoc9PfzOmFB+4M1LEU5W/9pGDppzOr+VL
	S2/Ey2AeqJ3KvycaGs/wTKWV3d9pA3S49K7VGxjDpL4xUztTuAMJKBuRmqNw1O+k+l9wUovVrzc
	4/7v1cybJppKNOWH0g29MtiUHWgCBxICEgd6clc3PUDAQuVoX1sLb2K7AbUxjGBBhj7zSCaPu6k
	39If7pB2nul9LqwHs/V7l+lK4uj2cn24nVYz4JlFBptfCezAxGokCy+YHn1oSuyKhaMo=
X-Received: by 2002:a17:903:1aed:b0:2c2:245a:3364 with SMTP id d9443c01a7336-2c2245a35e2mr142420915ad.32.1780989125605;
        Tue, 09 Jun 2026 00:12:05 -0700 (PDT)
X-Received: by 2002:a17:903:1aed:b0:2c2:245a:3364 with SMTP id d9443c01a7336-2c2245a35e2mr142420525ad.32.1780989125021;
        Tue, 09 Jun 2026 00:12:05 -0700 (PDT)
Received: from [10.92.193.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm200849265ad.2.2026.06.09.00.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 00:12:04 -0700 (PDT)
Message-ID: <9e3f3f9a-e176-4f34-b9e1-1eb90751c096@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 12:41:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-1-75356d1b7f94@oss.qualcomm.com>
 <177921242050.3254832.4034348981825996968.robh@kernel.org>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <177921242050.3254832.4034348981825996968.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2NiBTYWx0ZWRfXyZs0e4YMLMF1
 vx76uhDP/3hq1QgqE7KsrdkfeSb9xIEhPnCZkkO6n1QceyMmIyaf8NZ+qJClT4nJDaGKbxctm5U
 OelEzPVNya+KdRX194lZ3140xP8tQFAq70RaEM4amYxjBgUsYgGlqJym6MlsTiLbuZ80AeHFbC6
 DlTHdGo3eSZ9MtxpmHtRM10uUviss5/9+UgZEAjZ/NoaHZ+bsala4bdlCpiglB/jYqC+dm379rK
 JImTPzmMg76GyuvAWn3NZW3zl8Q1mmzKwUFGERTQmnVF3NaYPJGEz4dYh1Rezw3PJfsebrWFr2p
 bT6nxDAWB+ZWZm6wwoz+uWjWegv6UNn83/2lKywQa//UboIelm3GKZczvnQpG0/DFb6GBl4ZZ6k
 bm5JZNSjYzKEny5d9hWANfGYg8LjNfs+/gavO1TcQh7y0vjJJ8AMkLPOyfdoFO3UnZ+bKtMZK62
 7dxyRIUbB2M/F0casOQ==
X-Proofpoint-ORIG-GUID: vFgxCV9GGVdKuAsUa7LCAjASMSq83ym7
X-Proofpoint-GUID: vFgxCV9GGVdKuAsUa7LCAjASMSq83ym7
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a27bcc6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090066

Hi Rob,

On 5/19/2026 11:10 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 19 May 2026 16:19:49 +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various domains.
>>
>> Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  6 +++
>>   2 files changed, 53 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/limits/qcom,spel.example.dtb: power-controller@ef3b000 (qcom,spel): '#power-domain-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
> 
> doc reference errors (make refcheckdocs):

Ack, Will move node name to power-limits instead of power-controller

Thanks,
Manaf

> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260519-qcom_spel_driver_upstream-v1-1-75356d1b7f94@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

