Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7D3845BC
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244911; cv=none; b=ajyjRiauHAbbhzU8ZoxkfnBJgVNe5lw6uPjytINo+Wpm1wEYqqlOGMwsWggSd29Wl1iLdsFT/Eqtx1PIFfkSc9C0GSZUkHiFf/3EowxlovC5LMfk1OZnK1QhVSrc/lpPbiY3m62gVK+bHhKxZSCerFlrMKpiTA3q4uQd8bmZ3f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244911; c=relaxed/simple;
	bh=yv25dNvbmF2jovmXJltSt/bO04w7YhADkudbSxNFdrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frNUP18Di1bMnFRo6QmSrC/NRwI86XOf5pZ5K1YkWKsb5ocWMKn7O/go3vIYIXK15U6bZ0ZISM8oU5MjrgXRrZUVIEhaT5anyE74zw3q374FJsPUfIc/AT73GKNeAq/0Cci3TdYc3LxYSSU7DNCjyeZUOnfKNttkpOq9T8cvYAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzZnW15Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+3ItXHH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzZnW15Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+3ItXHH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6815EGMx447753
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 06:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBmtNPoEtLv53P7QYpUKrlSYDCg6uvRG+fRo+D5U/VY=; b=BzZnW15YPjfK1/GK
	txgN0NKCskhKY0G9d2fA6dL54E9CMiOouIRoPsTdB69JsYDzpyFnF7f2wCL4Lf9X
	H027rHofqsmnTRILUTq2XQVynnQiTEwluH1hQT+xX1/1o5Sbf6iKl/B3dvP4jf0u
	5aSUeoC7YJgBrG2swSAQWaaUdvtIf+XxzUntRuigB7D7mqMBqZXQ69DphM4l+IWI
	yvNcnAhqucROg3zEuUj1eVSvFCsxsUw8pqM35PBEPo9qeqFAG8uWBxS7bzh6Z3av
	dbGPrFMAePuvRveV2sY9eZQUEtkYhd5wGJdTI3sKgksl093WjFP0HXK7WdiPs+ZD
	64mSaw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsgam0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:41:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396638f9a18so7496604a91.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788244907; x=1788849707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mBmtNPoEtLv53P7QYpUKrlSYDCg6uvRG+fRo+D5U/VY=;
        b=Y+3ItXHHu78H+jWhsOOwiOpzEvrMzpE+ATtl8W9VztbDAV4In9tT7EXJ7aiyVv+bZB
         TUAlt77RomZ+w5/15AZev2BCVtDBULv8ySFvTuZZnI6LJTXL/y+4BZ5PVxIETTOrCWjv
         pBfCMzeV10LiNUvFbVLyr7li1XqQjOUkwtp4j5DSk2bZlw3UScCJ/TYqLuo5fANFS2Qv
         9voo93vWYzxVzWiSWqDylNx/x26h4KJUgz24kuS3QN5DedQzPlwpYqyYgwYSSuNQia1h
         j+ilfPV1LBGcSM6RgUGEUBklFcaWfKDFfpvjmLluS1goG9WLT9MgD+bctvl9LUXS0WFg
         KTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244907; x=1788849707;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBmtNPoEtLv53P7QYpUKrlSYDCg6uvRG+fRo+D5U/VY=;
        b=UMU4TmLEuk2pow4nara6wOQHFqxG4M7G2PnAt3VycN9unhrKm9XRJvShhiOsFmo+UZ
         Ro7xLHjb3L4VDQirfZrvJJypv5CLFu/d+0W6Tsg4LLvB2ryGU0luxzlofD0Zz4p2fPii
         wEmNyOWuBE6G3+G30wCa5pnS/t5UKsWucX9mBQIbkfMcguo3VJcuKF2Xkux3vQ3K26ki
         Uh5dWP7IppusXzqIt0FZf4wBMREaoKrkITv/7zjomPk/gmHjoSo1MWbwucVEP2pi7Ueg
         574HfIEDX2aw33CQZHlvNAAc5WuWXj5HMrVfVA8ul/r2uFmg4MwE6p6LmVFVqUoNosy0
         gblA==
X-Forwarded-Encrypted: i=1; AKwUvBz3NLNETjiPYIDNpzpPin9kMT7/aXSeztAKgIIh2FjzxoV1CTVfIIlfFERAW1q7NVJEm+FdfsVDahh3@vger.kernel.org
X-Gm-Message-State: AFuF++mjEUL7iLzhkYOrRrmDKvCfP7mwv8cQ32bbO860lffZqWkjnRS0
	NIXFE7YB2t3Mn8s5x+gJeWDouPdUeYekHfPjm7LzpZo0gpP50qYntG5298NgUxyOOM8Kvfb6wvU
	fOlbIKzOymkh538zg9Pto1WozTdZ2iWAb0uOFUkene+VIYwSwMJW8rYxlC0yJ2HEb
X-Gm-Gg: AYBFou0s0QnTVCZGYwCgFZTRYMjoQUVDq/kd04Pg5JpeyhvUSpVRXSrUqD13RuMby5b
	sXNUNyYKUbmR+E+PujyNHytTEarh6b/4HqT1eATxogBnTojkEo6FOQyvFaAzZhvS2TXuiOSVpu2
	50ic5+Dy5WuvEWT1C4ONX8iDR2UDKGHfBuJNLDCFIJo+gk/UREwKBaj4IQf0lW6sIMJ8q+zTUJS
	CZ3q0M3gdn3L+4lzEAqDKKw2L9iiesBmHcbb1EHAWft9k6+wEVftwWXUEsZoKuC8MrDBxbTSwi6
	oBJH40WXklOlZ/hCNwyuwCPy0GxtBPXvDir9JkEICvTDAP8vqQrBi8vhsueDg6DnOcqO7RD6eAx
	x+SbYzqFx7XmDXzK/EOvGUTWbFzp085F5nKHFdNh187b1DUMyBKDpI4EUQxm/ekCJKg==
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-396d0fccf78mr50804733a91.13.1788244906828;
        Mon, 31 Aug 2026 23:41:46 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-396d0fccf78mr50804616a91.13.1788244906377;
        Mon, 31 Aug 2026 23:41:46 -0700 (PDT)
Received: from [10.133.33.152] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d29af238sm6427732a91.1.2026.08.31.23.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:41:45 -0700 (PDT)
Message-ID: <f7bf3408-6d07-4933-9610-d0719d429ffe@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 14:41:41 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
References: <20260226054113.4156874-1-xin.liu@oss.qualcomm.com>
 <abqrLY8mLiAGugPK@baldur>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <abqrLY8mLiAGugPK@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1OCBTYWx0ZWRfX4iKMn16YyUmU
 Qo1Bvy5jHinli3T/pP1MqYajx13iKQ/LBXVAlXcBocu/1SPFes2FC3yPkvS4NhXYCAO/ahsXuYe
 45PPOtmxTgu/fHuSMLtklAvSTk6jR0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1OCBTYWx0ZWRfX7bLoL6urdGfS
 pXn4zFYsroMx6L6lXJ+6wGVAMR0ilDCOmmIFQJ1F1jBjT2LAPWvWk4gHFFWGzzY/io6e+5jACkY
 ujNfiqbw6tptRQ/Xs+KkczJVxnIgdQHGnObdhNPntINYJyglr0rbkRgnCI/NV81UzJc7rjsk54c
 j/qQyiZoRreCO2ZHHFy2hqF7PjE6U3oeZdmprHapXMijpE0rVPvRY+Ghs4Bk++efNwQWd31A5SJ
 qkWkwqpLI5osF1Kq5/E05cmswqwrZaAv10dg4I2hrdGOmkzSyaAFJQSAoW9tsqJZnzMVKUEXNEA
 ON9z8tWKjkqPujzKssaMstaQexx0eO2XasumBP4ftKte0bmgANAH3dUn5P6J+DMJq6ZLxDfSWRj
 Fw+HCUFEKQRphIqV6tBNxl4jyky72EeHdYf1eX+HCNMXdq7G7FUZ7v+dDV9+5097M+4upq5q1XQ
 93Dc896hYlg+b7mwWRA==
X-Proofpoint-GUID: zDAywj8Nmh3lc4MF31YOdY0PjIpGCg7u
X-Proofpoint-ORIG-GUID: zDAywj8Nmh3lc4MF31YOdY0PjIpGCg7u
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a9673ab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=msPNAV2qm2yT9iC0_akA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010058


On 3/18/2026 9:42 PM, Bjorn Andersson wrote:
> On Wed, Feb 25, 2026 at 09:41:13PM -0800, Xin Liu wrote:
>> Add support for SYSTEM_RESET2 vendor-specific resets as
>> reboot-modes in the psci node.  Describe the resets: "bootloader"
>> will cause device to reboot and stop in the bootloader's fastboot
>> mode.  "edl" will cause device to reboot into "emergency download
>> mode", which permits loading images via the Firehose protocol.
>>
>> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> How did you test this? I tried to apply this, but I'm getting 52 counts
> of:
>
> xyz.dtb: psci (arm,psci-1.0) 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
>
> Am I doing something wrong?
>
> Regards,
> Bjorn

Hi Bjorn,

Thanks for testing!

The warning is expected without the companion binding patch. This DTS 
change depends on:
change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf
from Shivendra Pratap's series, which adds reboot-mode as a valid
child node in Documentation/devicetree/bindings/arm/psci.yaml.

Without that patch applied, the schema enforces additionalProperties:
false with no reboot-mode pattern, causing the check failures you see.


Regards,
Xin


>> ---
>> Changes in v2:
>> - Fix mode-bootloader and mode-edl reset_type
>> - Link to v1 : https://lore.kernel.org/all/20260209042700.1186392-1-xin.liu@oss.qualcomm.com/
>>
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index db65c392e618..a1bd8c3e4061 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -450,6 +450,11 @@ system_pd: power-domain-system {
>>   			#power-domain-cells = <0>;
>>   			/* TODO: system-wide idle states */
>>   		};
>> +
>> +		reboot-mode {
>> +			mode-bootloader = <0x80010001 0x2>;
>> +			mode-edl = <0x80000000 0x1>;
>> +		};
>>   	};
>>   
>>   	reserved-memory {
>> -- 
>> 2.43.0
>>
