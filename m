Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629F43C585B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013534; cv=none; b=D3Afvxb19ilT74OhAZYTjuXk4q1bW3ajbGB8QtIw/S145ham0R/jXgjfn/EtxceBhvfYf6nEfqvoiQWwA33a+5N1jt7ZnBu8Ag8Op9baSOLOBSlLu6vV1x2sWG1UFbwA7dja4h8LCPerUtxt05oHED2saZjEeeGosnFlESyCEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013534; c=relaxed/simple;
	bh=pG3nTZWIqo0Akp9Sulb7iX4hmqwWP/CuYA0lfOGOYc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FL1ntwkk12Yw349uxSyH/USVeuKr5tB1eZPbudhdAK9AGp4Go6qxzmoN0GN2jOG3WF01xQT0ir951ezMsMCu/f5PbbHXINmDlACgAoWTj+ifoY39E6oxazIRChsID80FoyP1dfQj8tmK8MTZrqDA6V8LPvo1jOZh9Cw06HTVktk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TN7C9A2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9YQjjG8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TN7C9A2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9YQjjG8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ncAX1580570
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZA1oEgRFCJzqGhqDxYrY00E+txiTv+g+wlBr6oIblSU=; b=TN7C9A2Gfdz2+qXl
	YoG1tIrU+lOBQY3+H34BKsB7wR2D1n8tHybk7U4lRC2t6s9yqRnk4GY/HVLuPyq8
	UsVUYd/A3vnAmBHXNNSVk8k6gyds0Bfys+zhEI5ClLyFT098E7HoNRghTqahrzTR
	O9IEJV+ZnAvjgZcohuklwFylucH0+G22L9K74dcCdYUYzTRSQgapVrzEXOezGLn5
	c0WSkOYvUrA+IGWLOvJAfHJzPTGASSXSUmjzfppxNoz3l0NtJr72ZAWyQipeP86a
	0J5OEHPEaKYlGTqzuC1hhResJKntqWC1f70P4dmbJynfjjiDbhNsCfZQdeU2hFaa
	lz4+zA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjh61r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:52:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso52527425ad.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786013531; x=1786618331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZA1oEgRFCJzqGhqDxYrY00E+txiTv+g+wlBr6oIblSU=;
        b=S9YQjjG8mPyECB4ltcJeZyHH8WgVTNLtm3QydenKOEopxatmlMYnM1hpwfIh09TnsG
         bH/vVcDGGgsm+msdJrByJFdIvDAlSRymGm+ee84Ci3yGfNv6gmtotDe1eCE4cNoNg97/
         KPSMYSlWBpoBh+4hbLnsjQ2YV6J+xROvlxyodOgyPDgRJM+ga/NndY923eR8FuGvV9QR
         6OXCXdDp3ZQr2sbhtV/qY8IvenwCjKz6xlh4D0tDBqcweg8+fiMakPY46ZGEVbcVJxVy
         iBK31pbM7daDlbkGrBzTeNbUUPmI5j9IAOFznfN+ugiQIZ+J6YLC1Wa8G0dU/Lqk46X5
         vZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013531; x=1786618331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZA1oEgRFCJzqGhqDxYrY00E+txiTv+g+wlBr6oIblSU=;
        b=iTJZ31WT4WZCAMiJJ9A/LwdnPmfIIr9A2k/FrMZGoQ7F3xR0kaxtPTibnNXcbNZ2g6
         wTC3Jt1ZGRlyD+V9v7rzA+xgXKUqD4L07WP5rUBTEz/pwe91fqLyrH4VAYFbw94BoQ2V
         GVt6Z6UKKim0rXTgTRiEt4kKT0F5QOKjItEg0Mvt8Amlmi6RrAQ64Ajjji2KH+iOk0wK
         dgR2LXteMnqKm6m9dalYnjUK5A0/U+VkXvv56j1YG0k0FcqW36lctiTiAFBbYB4Oo2OR
         ut82cGQsh7GyJ9nIv9qsQqEWeju0pdojlkQIYm4B0qvBJKcg6OSM2ycgwLE3FjAOOcZl
         +5Hw==
X-Forwarded-Encrypted: i=1; AHgh+RpE3yDT1t0oig8MbRs6pdpKvBhsTPo0/oR0Xxy5B3WFJDUThqSHvqZiPe3/ioyQOP6iAxhothU5DzOl@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPLsS3sTBFrmclQlPGS7Y9e/RzunCNp5iUV75uT1gdCPEyx9n
	tHAjSnTdAtqG+3PzBSE2VlzwVrmsYsSM24IjM0+uOlQGN6tLIwNmgKzmn1Y+wgPBHj0RelOXFee
	+OEEDcKBPXPp9E4lXtMSFLUf3o9hqpHt9s3FXOsfn7Pi/PXIuvfkwJ33QeADrfkBy
X-Gm-Gg: AR+sD134vq7xIlQufNPr/MdQ0zjIglSZrP/RzE5oNLpS0uV+LVvygA5oYLUXqWQbu9O
	wetd4RKuVqEN4B0H4ykRPcEicSrmAMDLKzdgMN2Yh+Rjqh8oA2SADJvMZcTdkdcIsUWm5AHPHeH
	76fiepJr6meRYrnzkgSDwxyzEyIKb9HDSRaMzMZnIMngedjgeDwJaVI+quVKbOvWjYPAwaeZNuG
	AMU7H1wbl7YObbNjMKCDUPCaEonbHZGp5gs7giXLw/eMcENso9OLTondlWB1ggnxx/izcJE27wJ
	6DuY/Ts7J8Wf8RKTSx9O9O9Ic6qIsKrbEXIoT3LHByFTu5wf2Q/vy+2i/MixZVEFTezc1xbA3Jc
	aEQzV7sDP0A59erYnSGIwGUlVkWMPLlwp
X-Received: by 2002:a17:902:f546:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2d0ca77ece3mr148064475ad.14.1786013531423;
        Thu, 06 Aug 2026 03:52:11 -0700 (PDT)
X-Received: by 2002:a17:902:f546:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2d0ca77ece3mr148064125ad.14.1786013530978;
        Thu, 06 Aug 2026 03:52:10 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4930e1sm29469905ad.41.2026.08.06.03.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:52:10 -0700 (PDT)
Message-ID: <bc1096de-94c8-4713-88cb-5b9e96b5419b@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 16:22:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: iio: adc: Add support for QCOM PMIC5
 Gen4 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-1-9c49b2eea6f9@oss.qualcomm.com>
 <20260803004940.0277c0ac@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260803004940.0277c0ac@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a74675c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IlOKGWYkYrl9SAkidhAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 25dzkeM9n0kCjSuKE2pgfgmYdcH9nLse
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfXyDjWXwcnFrLF
 e3GqSHkCr3MkCbwP3eJoXx6vHwllL2887/9hHfiH35X74Kj/qr+iR6uGfzm0AtWqp6kW767Nlx/
 2c54MvCbPPam+KnUQleywRnW+SLSPyQ=
X-Proofpoint-GUID: 25dzkeM9n0kCjSuKE2pgfgmYdcH9nLse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfX0Hoty6b8OXPd
 lWZeJh0BjnybYfuBtKecAw4ES9PT/KF44kmw9lF65Ahr3s+wj1MoyeGuydUuJmXN1gu8MPQ5F0r
 oGzYwCrB2h97JUuEVEOoD6q5xTcjTLMspWM522w3kauqOkdCZikQnImaaz0DLQo+fXvBmcEDV2t
 Bnxhs63SSR9H3YiIfvaH3vBfgE+3+Wh9Rwafz04AlOKnaXj04rF4tReeGdYV+AfGZSwLvhE66Pn
 47HjFbD5GjDJgSVlv5coaBKsd4/t8WPwxtzOP8nYJqoinr1+SLRt6e+DoL8dSAoBl6QxS05boF8
 5vIUKK/SZU8QWHayj8wMiQOvJpK0aMmverdU5sINdOp46XpBWycrvuQh1Pf/+yToQJiTQelA/eh
 AaI3qzxDfnAMFpnT1uMhDEqTCZrFZXyCA5h9Db0WhYgZUWLhZCdkRBZcg7arnzehsQXYCcRrxY7
 1oYRjVnIMDYRuyz/IKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060085

Hi Jonathan,

On 8/3/2026 5:19 AM, Jonathan Cameron wrote:
> On Fri, 31 Jul 2026 23:36:14 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made for
>> improved performance, mostly at the hardware level. The main differences are
>> increased ratiometric conversion resolution (from 14 bits to 16 bits) and
>> increased bit field width for PMIC SID (to allow communication with an
>> increased number of PMICs, supported on latest SoCs).
> 
> Hi Jishnu,
> 
> The mixed case is enough of a surprise (to me least) that I'd expect
> there to either be more discussion here or for it to be handled first
> as a dt binding patch to allow for v4 channels on v3 hardware.
> 

If I understand your comment correctly, you mean I should either add a
description of the mixed cases in the commit message, or split the
patch - one patch to add the new compatible and one to add the new
channel properties ?

I think it's slightly better to add details in the commit message
and keep the changes in a single patch. What do you think ?

Thanks,
Jishnu


> That would provide a place for a description of why that is necessary and
> then the following gen4 dt-bindings patch with gen3 channels would seem
> like a natural extension.
> 
> Other than that this seems fine to me.
> 
> Jonathan
> 
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  .../bindings/iio/adc/qcom,spmi-adc5-gen3.yaml      | 47 +++++++++++++++++++++-
>>  1 file changed, 46 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
