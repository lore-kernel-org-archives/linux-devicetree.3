Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6501331A6D
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774502681; cv=none; b=ZLQAA1HGHGcoiu/Fzyk82fFZ9CPpx1QiudaNRMk/CSoYrj4U+MjOgKvrMIfRETgyHAL+RQXrWr5FXhZto7+npHOMKKO5vjqfk/GkXyDervrhMX5ubVmfURPrnYTa5SFYgnUAGsupR2qPgntc9oUnswVLSCXFIcvWBGNdlWBpINg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774502681; c=relaxed/simple;
	bh=OqJuFXqPfGGwofAAq/knlS+h8ypVV1lcV7YK9G6pq1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mi7xzbucg4StP0Gh8RnNMR2xLsVQ0hWfrWZv6xTtNizgdgWRMRt2wLa3wE29mK5Hfc8AZLzNszD6hzQ/1hou7szTM6S6nD874CUwaWhuM+M6YYnMYafVJdhL3zgVhSkFsnR1UDNXIggWtG86MIciOAcEhBirL64e06nGL0i4KBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqpRI4/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2XDBc09; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqpRI4/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2XDBc09"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PLPMqp1062113
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	koMK+EyFax8GLI8T4AzmlfCF0gVcYom9obN2iGral2E=; b=EqpRI4/IVt60ZISB
	0eDKghnA7tWVvkoLisxyC4iGadBG1ekcHvZdKX8KCpvq0vtYR3Z1mOr02jyxT6ir
	kmsWgNSEFRwppTHZHls858jQjY/n0DH48EWic/BofpYiYfi9NdR0iVJ5cJysqqok
	acX0mmoAsh34ImvKWuI3vINPve5YdUqvnOtjM3IJq646KsH6jsX7FqMUX6s5D+Bb
	AlJxaIudHGGPB6Q60+GNlWBu5kZ8ZHw/HVjxTdvtHqj/B328KNU2gv7fnIMt2IDY
	ZHeCfqmHuhK0mzT2rIUSPh0mUWi3FLE7rLA0bD6dc8Hb9C3T5nv93n+w3xVDT6ND
	qY87kQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkss6m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:24:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35b96fbfc64so1177520a91.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774502679; x=1775107479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=koMK+EyFax8GLI8T4AzmlfCF0gVcYom9obN2iGral2E=;
        b=c2XDBc093KQtL0h7+2JC23chNNUFsI7Welc6WGZVAZamM1mfpbR1FRLXC4TjAsQUwL
         7TGu6iZMwXas/R775+zQsmjh5ktSBJBiB6IcuAbtI4xNdrENnPqdjV+pqHBQ/9yKPthV
         MfmNgURq7OXv2DVfUfinBxucYjMwytkcy/T1SKvmmVRDpLzMUG8RmThh//GGGB9VVpR1
         S2IU0HdRvwnGH/EMxhfg/RxmNg79S+Koi2/XsIaNpujVi0fCnxaI5SCQzCdFgSBUIulu
         zbCyKHflRhR6BpbzYsEyGdJv+CpQI99G5KG0izxFvKDTax4yG3xGBNx03ohdMkHIPA/L
         qDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774502679; x=1775107479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koMK+EyFax8GLI8T4AzmlfCF0gVcYom9obN2iGral2E=;
        b=XND18mIESkB7ymIlDsSkNbAD+CwgKNJ8n1BrprkIRYCU0kZ3v0ie774InQZKoiBxTQ
         1DXNHZFf9t/3ha3ebcqiGSWeYc0aHzos1oJpBeHgyu/V8srouv7XR5nPX3rKC3OHf7X/
         P4uGpueH2bdGwISwiqlNBSAaUjZmwrJyzAxasTI7rTWe1X59qr4JfE06/OyH0ZDGv2el
         fJJppSf6WLwfa9iNQcRqM8dWu62j33jbzt55/VavvT9QCcjQRdMWrL/TfUuHOw7IPL35
         Y6/dbtznw8ns4kgYZ/fTkz/gsNN962f9+JMkpy2DwdhW0njgxo8yjLKvQcpb8PPzn7g2
         cGnA==
X-Forwarded-Encrypted: i=1; AJvYcCWx811pkHsvoyseGJY33Q+qtdO4cJNqKMeDdrewD0XLjqMdXw4fYScYk/dhC0e6ECunuAjl9ViYI6hG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+GLiZOUnEm6EP6HUzeTkUri9thPcmm45a/xNIX5LbFYkTaXzC
	n6X47oOmveYvO0LVjiPLliF+Ct1opABuZ4r1WdsYQxoQGkrgXS/5e86qm5ML+FOyAcVOVLAqvQK
	luxTrW/b4rNO2qh19EFroHOp3aubAzl78/7e1dOI2+DMAn4VCqjHNfBZZ2RB12KsR
X-Gm-Gg: ATEYQzxL+JIl5Y2jnhuojHeMByljybKYJhZL2sO7jp8vFrFb+qVCQOtw9JwJdnTxS3D
	KfSePTyxg8s1cjVBJXKH/YJLclW7456yHUy+lULheg7kG9/bSxuP2UDxiWDJJ2Y2iQNoE8Xrdjw
	yZlQ1BmXLI2VGb7rHoAqs8EFzhris7yqUx3UmKV15PYHhJWGK/LEVEPL6n5WSHpGYtcVvKfOyJJ
	vPQD8YX1JFpxV7pzQkyLT3BumCCUGS1ueiAaffIzuqV0doBB1Z2meCyhXHGyU2ZSr1RFmDtJgCI
	z2e9oX3Bl6J10ibRVE5kvXJ/HZwdSeG3vtHZNHsGB+ugpWmB8qpcJ3XkznkEcv6uFFkC4yfnl+W
	R7cHtyw9um+LFd3AIps1lATee5rmf3rhsOVu8Qw5sTTPJ7CHu54fDB3T/km7yxnHm+32PuxNzrb
	x8bkO5aga1AJT1yDmGcSb9uzgsudX28FNOIA==
X-Received: by 2002:a17:90a:e705:b0:356:3ba2:122c with SMTP id 98e67ed59e1d1-35c0dc87b4bmr6035795a91.9.1774502678722;
        Wed, 25 Mar 2026 22:24:38 -0700 (PDT)
X-Received: by 2002:a17:90a:e705:b0:356:3ba2:122c with SMTP id 98e67ed59e1d1-35c0dc87b4bmr6035767a91.9.1774502678251;
        Wed, 25 Mar 2026 22:24:38 -0700 (PDT)
Received: from [10.79.196.200] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a82231sm413373a91.6.2026.03.25.22.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:24:37 -0700 (PDT)
Message-ID: <be9b9bfb-700c-4317-9e53-8961cde96df2@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:54:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Randy Dunlap <rdunlap@infradead.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
 <20260325-add-driver-for-ec-v6-2-a8e888d09f0f@oss.qualcomm.com>
 <3077792d-8ca2-4096-b198-68bad573d31f@infradead.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <3077792d-8ca2-4096-b198-68bad573d31f@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzOCBTYWx0ZWRfX8KE+7/S/399y
 uaoRIrNl2BX2VfwPNMrDlU7gWruBFAYF6LIDG9Ta7eMDzBbq/7JVQpvqeTvA5Q4+YwAFnods/3s
 PG4RlPnaSS8YVhZJC6RKYkMVvXpWgLAM5ww23DiC13rcLx3qkdrfS2cxAQ8qhBUnWolzpjFEa7X
 P4Bx1aogU7fe+N/RP+DIiZHMEOSFrBDPeyYKXo7PtOZEEYST5lNu7Ylgy8weOZH3BuJEyotu1bK
 qmU6gKelaLywVJZkCqPnDwAJEsr3SVnLM1bulHU590Dcsqs9YZqj4Gj/mfNPWjXW2U9KHIl7KuG
 40a1SqOv9sGG12IRaeB62JBhZEt3DtSk8lFJgWSFUm6ovOanpmD7qT6mBkHIugmfLQBP1M5M7J1
 egCwvW6vzOt7aWU0CCodT+KjNxdL5eeQZ+kFFBGEnAjbcFKZ/QWoqhe7dlojr0gtRkYFzkrfjvL
 W9Ues73QmwkVvxZp2TA==
X-Proofpoint-ORIG-GUID: UunDU26V8ZlnUmoipbxd-XMjGR6tTRnC
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c4c317 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E2FcRaxJAAAA:8 a=pGLkceISAAAA:8
 a=aS5FRo1k3opD1aJJ2lAA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=Yev8HTsh1NrKSfoOyGCL:22
X-Proofpoint-GUID: UunDU26V8ZlnUmoipbxd-XMjGR6tTRnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260038



On 3/26/2026 3:07 AM, Randy Dunlap wrote:
> 
> 
> On 3/25/26 4:39 AM, Anvesh Jain P wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 30ca84404976..bcd7b0729ab7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22001,6 +22001,14 @@ S:	Supported
>>  W:	https://wireless.wiki.kernel.org/en/users/Drivers/wcn36xx
>>  F:	drivers/net/wireless/ath/wcn36xx/
>>  
>> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
>> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
>> +
> 
> Please keep the entries in the MAINTAINERS file in alphabetical order.
>

Thanks for the review!

I wondered about this a bit but saw a lot of instances where the names
weren't in ascending order. That said, will fix it in the next re-spin.

>>  QUANTENNA QTNFMAC WIRELESS DRIVER
>>  M:	Igor Mitsyanko <imitsyanko@quantenna.com>
>>  R:	Sergey Matyukevich <geomatsi@gmail.com>
> 

-- 
Best Regards,
Anvesh

