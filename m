Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359CF48BD24
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 18:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040275; cv=none; b=bir51gnc3XtgTbwh1CYzkknVWELk2RrqYMUoduDBUoS/N2QZTSBjg0ODrwysQdzsNDRYcS0plhF0m35Lxz3wjt/pO5JaR82PCVEmwKhb6q8ASPeW3y0idjtTdh9VW+jAbnrNfZIyFRcd3cFzjI1/pbipIYttiq26kStK4kcbJvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040275; c=relaxed/simple;
	bh=XyHQVGmrLWTjFYPZtM3QIQVJy0S1AV8IITairKJRPd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1NCijewtrP6h1WvpuXSRAXqE3WY912R1FlFb198PTUCMHogKJTiqo/wCeBVAlBXvSK6QA9c8vHtofQ6iGyWraPY/AN75WdAWN7e2+zxTM+M4SVzinhq52o56o5D+/CzsWn+uQq+m0arWzQU7p2sx0nzd0v5rZQx2FZD548iHGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4Vs6gmy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoM9nHg3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4Vs6gmy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoM9nHg3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHT8h2401952
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 18:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XyHQVGmrLWTjFYPZtM3QIQVJy0S1AV8IITairKJRPd0=; b=B4Vs6gmyszXWhDyo
	42wZtGktWpa2GNtixSrBQ6U/kDgiSeJr+3rFL+Fnp0MuJwVlyKBT7or9uJCEzUjQ
	SU71wM6xJVuWAsix0eRA+7cGvVYY/KNkKnLi2zaVpWAAuRn6bsKTR5y920Dw2JUr
	b9bOi1M3kxvuYnB5MjmcOobDtThtNHbMHZ4ei4y69GKjW+wjeg2kgjMw6JWRfLb6
	L0MqPdlVv/7gzmNjtUbA2ONSRyrmrqQWlWjO2NZt3gxd1Tb/Zq0fFvmySa/zcDgK
	SHPzXAc9N6PdylVPyei/TjyMTH3fbLXimsbGI9mIZCVhBFpX6aRKPiEM52tLnfYk
	+Hhm+A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jg2hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 18:17:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so3963037a91.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786040273; x=1786645073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XyHQVGmrLWTjFYPZtM3QIQVJy0S1AV8IITairKJRPd0=;
        b=QoM9nHg31lkAVcXMErr54Ys8CmPNI9JnpzscoKMtNDznefYR+5RzKMfAF9nPj7kyP2
         XpSIeQHySri3QUgf+fZfpUGeM5fkWpg28Bxz0XNFmEm265XC+HL5uKzzJggEKxDwto6k
         0aH8Th+4M7UdkUG3x4TBLw8ITSSHXPirnKxu297AEwKbe0+Hmni85k7bR1xFDMUDCtqY
         v0z8FOqZGTYPo1fa+SCrPa41ZX0okX/qzrMl3JyHw3nkNrVhIh6fpb+DEgF8VlDwM3q0
         eWP0g2YVFVv5Bi/DXW/DUWbu+CR7C+pm8tG3boGQXkTGV/KGb5K8gCYKB61x+IqHFksE
         knWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040273; x=1786645073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XyHQVGmrLWTjFYPZtM3QIQVJy0S1AV8IITairKJRPd0=;
        b=j2vvakCjhSu8YKGAppwZtUNiaGDz014RvQ2pECBssBaVJPirQcgaszMzlVxjmYNPZY
         X+dJdBlJvzqqYZnwwNI3/c6GoInYhhjpc/HTn/6YpAxGS25MkBcdaTSEvxC+qokNPELG
         oO1n8QtVVfjWDE4fe9Ozzn1Ztsx8A37LxaWcSXw+WV3eZDVxdwDguhBxVWVixTwGHNS5
         PGv+4hrFgmkQYtL5PkmxT9S7/UDKxneAuy9O5r18x/brgmomz2G1FcVF+MZGWfktKlza
         5DsPLLHDbBlLbJOpw8cHxwrg23Sg69MRgO0CQrjA/5jkUS+MbUCWWo//vHvc2P+g94iC
         ZCPQ==
X-Forwarded-Encrypted: i=1; AHgh+RravX2tftaCMlB+k5RnPTd6Zf2utAEhTo5+H8/Rd+n15yXSx0V7/MXZPVcH2iewbBFUtj+hlOQrbaQU@vger.kernel.org
X-Gm-Message-State: AOJu0YzuGc1oUPNeo1XRHyi+guJSFbAywz/SVlnVB8ceR3pXx8BLRn+z
	mdthJ+FOTeElQnMLj74HMMMGCDtTm+Ub9XehxCdJpQMU0ULxvVPi8Dj5yifieHQ3RmUARsvmZHR
	5EqEkv5ut3o0mPJm+cwFzrFcoGCbXtqSWOr+b0ngiTfD16sRco2HMBE/mAFmf3pIY
X-Gm-Gg: AR+sD111Bog3T9QxAwMJGK7tEI84Dww+B+9PUCOQv1PONhPFo5wt9JP49UUSx11Y/TR
	xHdkDSreAKFgvgdNT3P6xcKZbGC5ehmA9ziZfq5MTEltkJF6xVomGyXIquGjv5IqZRWuV8Im9QI
	4ECuewz130KQckQcXWLUjNEvurFTmyLg2rSQpxhT7OjM8wVOaB0KKp+GjwbPtZahTGki0rOX/g0
	/+dn1Y/9ZNmmcgJG3FbQBVLNZijXcMrzdJxKez6FGlS2l+jVzutJfG4Z0RYdRf0x7oXXNvm9LEh
	pIoEe3cUL5Ma2+cwl+NjqfOek94dPoOZlOsOyFouQR3r3/JuPwmFhzyrdxZ7qDYHBQxjpjel69m
	sX+tXgP4wg7Wx4wb3iExjJhir+L2Zn6Dp
X-Received: by 2002:a17:90b:3a8d:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3903c5b9f70mr14946527a91.13.1786040272891;
        Thu, 06 Aug 2026 11:17:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8d:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3903c5b9f70mr14946468a91.13.1786040272307;
        Thu, 06 Aug 2026 11:17:52 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.111.196])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141009ab943sm368899c88.7.2026.08.06.11.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:17:51 -0700 (PDT)
Message-ID: <3594bbdd-e457-4a88-9e37-7acf0f3d87d2@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 23:47:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: qcom-geni: Document device-gpios
 property
To: Mark Brown <broonie@kernel.org>
Cc: konrad.dybcio@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        chandana.chiluveru@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
 <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-1-c363a9b5df69@oss.qualcomm.com>
 <57719877-b8d8-4df0-acce-2c4faf5a5899@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <57719877-b8d8-4df0-acce-2c4faf5a5899@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0MiBTYWx0ZWRfXx03Pk+Y4ii4q
 s+qjuMpW2HAVlaAEf8ZdXw9Dl094bcI2cR5BcTITI8CYJ4JILiJ6bFLljnlFJQz6MhVLhXeWI6B
 XqpcNimqXdFx0SRiQBxeKCIdEjNkilp0TPndlwtfBWflD4jP763DqAQ4PSgcoSKDZU6KKqdftAS
 xAnhz6FVg0SLl0RRdHB64M9e4TK3uhYhRBLyReLu9cpVFdqurT8okAwfNh5AaLK1RPavLSMlPbI
 6Ciry9kAeDv5sp9PcXfqcVENTDA6999q4G4JBZqvRc8wJ/0Vz4srtGwKiPQRyW8HRWJ25pAnTDS
 IdDUlhiWvi3ImF7uu4fPet8bTOpqHTznJ2Y7kYUccFD2xVyB/HmiGimTvDURVJ+Y78uqEsC2VoY
 HzNlnEwNU+LMDrNHe8AtO+nCJ5fXrBNBNMdqsxAwUHNnbmdgsas3TOfGgn4srmbhVhlGCjtYK91
 iCCwCfUJw+etbNBZlOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0MiBTYWx0ZWRfX7nMbjgmW7opK
 +sRxTGB1FdiaRyR1kBAP0LC5kHm7YBn0Xhv1Eqx0wEoguvvS/JrIabEuvUtzw+05WoFn8A955q+
 1noK2+cDJfINknWoe9iccDewb5QykLo=
X-Proofpoint-ORIG-GUID: wzChbpLsqKWgWALOEVtQx69HePtrxLw6
X-Proofpoint-GUID: wzChbpLsqKWgWALOEVtQx69HePtrxLw6
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a74cfd1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=7DW+zsgf7PPjz/i6iZMG3g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pBl_9jDRoQriJyM8ii4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060142

Hi Mark,

On 06-08-2026 23:05, Mark Brown wrote:
> On Thu, Aug 06, 2026 at 03:43:44PM +0530, Praveen Talari wrote:
>> When operating in SPI target (slave) mode, the GENI SPI controller can
>> use an external GPIO to notify the SPI master about the target's
>> active state.
>> Document the optional device-gpios property for the qcom,spi-geni-qcom
>> and qcom,sa8255p-geni-spi bindings, restricted to spi-slave nodes.
> This seems a lot like the ready-gpios property we have for some other
> drivers?
Yes, you're right. The intention was the same when I added this property.

Would you prefer that I use the ready-gpios property instead?

