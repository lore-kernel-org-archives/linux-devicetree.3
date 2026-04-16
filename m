Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B759A3C455B
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346368; cv=none; b=OO+SrDeGnJPMYWObQhzCO99zNHrjrPYhqW8JDmiKWcL3A9jNAW3ORtdpj3uuLGfm41/GBjavIgvhJWksJX2XWfUHn23rBdl5JpDAL+ch/VgcCJU7lgTl5RzouM0LNOpClFbRHe5qBMMfHXYrRMpf2WNYSV+XFr4nYT76ob8BQ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346368; c=relaxed/simple;
	bh=YbI6rFfjkWl+Mm3gmZK5bZa2Hn3p2AU9i9zKbtIaCt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmqsnZSAzXOxutiCSbzu2aQVKdlyiIWBJUL2EuJxCxlYx3A6XLfUFc0tIZP53Q1uVrXXXNFV6euyTYdowhMuy4BMZHqmh27imQXsk9IdOo9s97sYzWzfATryyhwdFrpIQ/OI1hTc7xypwvMkNxnYeGWyiwHMcD/a+R9wKf8j9jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iis2lPNo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1jnQudL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iis2lPNo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1jnQudL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8Y9AR1702344
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/hGSct5oVa9jDWzCwFN3rkowVabxT5N17wXLAEXtTo=; b=iis2lPNox+J4svGE
	TKUT6l+aX0J8F74bLMHNsAsxplhyroH9vRnS/Q9s/lckQjzUU8FmJTwMEL3gC/i7
	/KmrNfRAi12t0x6EuenQCoA9r7mg/sYv/aKQP412GyBHVFRhHNY77MpHXBT6oQpk
	L38vZP44eVqS9sj9guqTNeVMmHmiJYqrHqIutAB7+yBhk/ecY4KzLXyjvsmCxtNU
	oxC3cdJvkJcEdY3uenuHu4hCbrnHqgCABYNd4XMp0xkggGTK6RGS9NvTPAc7M6p8
	PCLjqyBZ5Lvk00rzhGl4grZVEUn3/iN79ZUtt5NZSz2SDvZj6THacV9CWFhit0Fr
	woaHIg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamkykm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:32:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-611af0d66f6so228720137.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346364; x=1776951164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/hGSct5oVa9jDWzCwFN3rkowVabxT5N17wXLAEXtTo=;
        b=i1jnQudL6yfQ3VapA0KtZtPS87mV7sR6koeNVStGuTKEQolRDux/A/FrOOlcJCxcmO
         mTrupm4k/odurZ9HzusRiG8TesFcUWxtZceN65uZH/rjs07qq1hQtwYGFejCcsy9Vt0e
         KAxVVlkt5Kakj9f5nenBHtL8xfUhwYuekav0AsEDe+b/lcfV/HIX5T1sbt7SrzQeOYCV
         XZF7S3WKEowd3sNBaj6eJ1bRKoFOvgr5qPQS8t+OjZpcE/f4Vlzkt0PR2riJbjDXGWVP
         hWUWnY7w2SrPbgvMUaNitzJxxfpoGybL/cff+ILFDmxGUa5e/GKb4bnIIGcfXneYuz3/
         65Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346364; x=1776951164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/hGSct5oVa9jDWzCwFN3rkowVabxT5N17wXLAEXtTo=;
        b=HEE5LhW4z0pCNA5FKRBL74fYaQgHimQM2go7ekmNWoDbyDGbs/9cxJSmYxTz5190nZ
         NIcmGxI6m822b2K/q1vvR7EzHLnF2XqUJijk7IC9LKRUzHl4/rlVXAXF3e+iOsxLAm6g
         hzuKQ0trGizNIoHlNREqA/vgxM2mdGLswp2ERS3h354t2dCRogCJItol1mmUnURrlQVO
         fSzScbLKvypf4GoXMPXUO2thc9yeEEBYtxMwwjDtN87TGExiBlK10ZCgwPqnvnyeQ1QF
         bPOBshe6/zb8gAEBfnE/SGrQcgQmnavkDD3+5uvZR2BUOzzQKn3myuTRuhTEaWvIrunT
         GUPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YrO7vQVJccLgXH3moqtCBDo97n7ldOR6bC08p6VHUuBRgdRC8EsTlHL8k9LvdO8UM1UT3NjUV82b0@vger.kernel.org
X-Gm-Message-State: AOJu0YwBOZx1H74BM9nzJ2hK/ODKrQjn5kP5GOyVGYu4l27GE98MunV0
	bs+hZGJkB/UwbXRWDN7eVGcw2fKBobHVUFh1hXLtfM+0/9otra5B/jNaap0ynRb6kSAXlJJlGoL
	K+dp9JfnK1plWX866dRELSJrdoe9ooWpr9QUMocOhYUP0fGpu6pCoLVfTOV151dbw0+vtwWpU
X-Gm-Gg: AeBDietExjZ3mHmNexw6w60a2HOyYtRmM93DW2HwxiMDqde0FultjugeTTypLAm1v2b
	ALyK5cYjapiwVUHTMyq5+dO4t3XWCmVKuZX+7HU6jgbS4f2DRT068p2bMqijLgYkGn5yYSm3rZ4
	wzOmixNh9EBmJPZg9B3ci+9drhbZV9pwZnNaYI+s13k58wutG549d08OL88Bnw9wcOkiuHAGCLE
	YzAgVzrc4u8N8Eu728NOzUghKwkk7D6/tyNZ5fjISRu08+NAbW6C74xsBcYvU09LtlMSmHY6CC9
	qG09DXZ1LinUgCTd6qsvmzxFHxUttLmP7Y9oGQcFqan7xRkxCRXCiMKPnkB8/iL81RBavQnOYQ/
	izzWSgilEwFo3Tx+2KLZh5+njJfPRLKJIZcOUMcTIB+uCSIQDz9z5n1cbe/yxedIElIax0fEnFm
	1GR+C1ONym80Xakw==
X-Received: by 2002:a05:6102:224d:b0:604:f07b:efbd with SMTP id ada2fe7eead31-6141b35663emr353132137.2.1776346363850;
        Thu, 16 Apr 2026 06:32:43 -0700 (PDT)
X-Received: by 2002:a05:6102:224d:b0:604:f07b:efbd with SMTP id ada2fe7eead31-6141b35663emr353095137.2.1776346363330;
        Thu, 16 Apr 2026 06:32:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a309429sm1306333e87.84.2026.04.16.06.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:32:42 -0700 (PDT)
Message-ID: <7022fd85-5d8d-4835-9d7b-995583f2f8a1@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:32:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] remoteproc: qcom_q6v5_mss: Add SDM632 MSS
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-6-6098dc997d66@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-sdm632-rpmpd-v1-6-6098dc997d66@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ttsJ4zmLeM53tGzv1kZNvr-y0p3iVNkL
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e0e4fc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=x0-Ntm4DP0gVEan9CnAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: ttsJ4zmLeM53tGzv1kZNvr-y0p3iVNkL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOSBTYWx0ZWRfX2cgtq3YrEa/U
 gDqRnWxIDhv+kRCayvayiuhrMwoqbokvKWjebSrg4XHT6erA15q9kzamRj9CuhaKTY+4c4P68bB
 EqQgdNq79YZZBPsI980ILC3Bl9X8yf47UKUSRh/dkvUBN3+NYmi5d93yxvfG9xo/g//MfWZbMon
 26wLiiI/3InOTr6fVfyiGWyEg94P0OZyYmcM8GljfeVKOh972h8Megaz9nGOprsvz97Id2tLDrQ
 zYpgv7yr+HlCeGGWXyEGRbjUjpw2XxzJvg7jhuDT9Qm7SPadr4MRkfrqRiCSFNmz5SLWK5BvK+P
 SaLshLOLPOPOxWbskXYtXycNKwgkPHTInyCCd5LAGB7ivZAjgN+nf52kUuYv+0vxkJOlurh2KNT
 TXsa5gR+7IVAyEq4phGX9YAjb1QApG6ShBonsrwiFyj6xGpqYDEqqujIsgaZLBpMWs0v4KiFful
 +XXpy4KgcsyrXgrD6Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160129

On 3/27/26 9:11 PM, Barnabás Czémán wrote:
> Add support for SDM632 mss, it is very similar to MSM8953 mss only
> difference SDM632 is using mss-supply as pm domain.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
