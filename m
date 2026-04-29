Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2AA3B27C4
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457324; cv=none; b=LZuaR98wpwvT7dPc0QJm4xBl9pIp9ySjA6b/cEy0Bt4Hz/+WmzzvDIprtAukJpT62XBCIA4J6746PYszr+AoB9knfZ+Xpk2PKLZMY4LiD+0UHKy/5KWAEOzi/mV/BDeNW1/5UqnJX3TLdJbF/pi7rLDHSUxud8S5JkfTOBrMkho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457324; c=relaxed/simple;
	bh=c0nVUO83BjMpsHyFNoCa8XQxjosX8sBB7LbafYTH3hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qe0J4dUPHfAXFlpQMXOVXFq2qc96HgCY/jiDudP4bEPJs54c4eJjMlR5OW+rOwR3nKMq4pvCmewnj+q8S1wZWu/kjfkY07/U7U6DOJjg0m9DAmxj7Mz+FTaI0cqSZRzuRru9s0bkFYxzRvkPugkGuKpPL2m1c/tAFKjl+BoBlhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7onOf2h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvNa0T41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7onOf2h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvNa0T41"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7j11721222
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5drjt+Zpuu43uDiqwq0/vUROwFSA15/U3OKxmtRl0Nc=; b=P7onOf2h1D13IpNH
	L34OlUz/bnLqTIshP9LSzgwxtl+hfiFWgFMu6s8HxPTCO7X50HSudleth8bWzvAv
	S/JEToTueIzRvsW2SPSmGQShu3ev5ZqXhxP+G/4NB36ViVrl4puFqeyOGGJQYFe+
	fHk3yOtSnjMpVNUug8TBUtQu08QfrQHm6Oo4NetpK/Xkv3QzanC9u1f8yZYiGOL+
	xYOn5UocEpfKdKQR4ALgXDnjJQ3d0D7BzsWm34Evc1J5zaMac3X5fg4CnA///KUo
	wZLko4w9Xn0nmUOSaNbg7dxS+o9xvLz79MkXCR99jIOTkeHuz53nqW59sBAOCdiH
	SGNjxA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua731gy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:08:41 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f7d6e7a31so661907e0c.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777457321; x=1778062121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5drjt+Zpuu43uDiqwq0/vUROwFSA15/U3OKxmtRl0Nc=;
        b=VvNa0T41RbegCLtw7oQQg4jUf5oAKWw04Mk2+uOJ3pDQFAadLMKRJpt7gAJ2OOVOWb
         +JoupW3+XKWW8wCMPvNnZYR9YBM+6A5Z2j+T95nOZkOOUhinV8crI4EI/1Z9JbX7Yh/o
         fnuiHM3cEc42GLv2M66HDvRJXHTKSLnVuwg07XHPHPebwzHN13n2D3xsPC4rFuNLzNlC
         L8jbg6vUZDyy/BUqrvZFrILh00/mpOGIQiEtoEj4Mioy6ktYM9lAH2eHfNh1tOWtfEt0
         18JyzdFLXz0ASwr3b9qJdx4t9y9rWQGlZ1MrXKEwetS+mWK1gVW2+g67Eh0NwFUvhbhj
         208Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777457321; x=1778062121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5drjt+Zpuu43uDiqwq0/vUROwFSA15/U3OKxmtRl0Nc=;
        b=enfB7JYaQrn+I4c3Ub8ccCIGlZIc5UAFptaGBLVJiyMrs8tInpiIrkUKQBygK6/hM4
         09VT39wGoJlniV0C3IJVgqr9gMFKilUxOD5rYi4wmWgLl6wX1W9ozuZ9sp2bLdz4/yS9
         +tm1AcU0JY6/iGG1UsyeTNcPuQDAhLqV1B3ZgXmGO70CRX6tb71PTUKZkE78R0jAR/5v
         eLBQynXayrNqHSvYDnWcssD5E8YrQHfzCa3tHLLjfL2PE5s4qPnmgpbUKg4/WNHHw7pj
         dznTHXVvYhh7mOScCChE4qyFfeSH8j+tqIe/hf8oMwKqfs8zx39ruIpYrsApg3H4BjON
         43sg==
X-Forwarded-Encrypted: i=1; AFNElJ9OUj08ugoVxkaW7pqSCsFMJ8+/4mGv/uqybyiin691uAFCuOOLZpp20hHJLfCWH7PLpqX6mZTT9+zN@vger.kernel.org
X-Gm-Message-State: AOJu0YzQPxkAoudAeI7Xt/kP5ggGaDNB3+09EFHioOnp6Cs5CHG/uBcl
	BP8sTd/ff+UPgH9du1dELwqz/Cuz+FGvFHww3MAtjnd1gReoQ7hnezts67Nie8cVaTZPe1BNDWo
	DYjMs2XqvcbSFvXtXeexXVx8ZO0CGNWM8xj3aHYIovQozuM1q5HS+VETSRqbvujp7
X-Gm-Gg: AeBDietE/lTCCAofF7hOQV9fPZTFvrvT4jhXmgMVh9GD1urOMuUkPWtmZOGUlGmi0+p
	TJyY5ZuUO3Vsa0Sl+VLk2YjcntgIgaW71w97V2gOBlMVWOl6ukXQsO0Vjqdh+z0dTBUjGtGoAIL
	4WzLfq6edw/YLOPMfxDNmhI36XfqRLOWRN1t6mE3tMZNI0DnlorB5o/vo6/ZtwvuZ3nttAqUyDq
	EYtxvzxBfBtB01bWkOltlfSoFhuvN4KJ/F0YdFYXlNDLx4lEfgO7g4K5qKOaXP7KsUCH6Z/6Cgk
	7+HrWzqyBHX27nqx7ANnTnX7c+m8nlcImmi+h45mdaFHF2cJadRHtaAgcPxHuAEu6kU4jOgkhcz
	hkuxE+hm+P6OpXp4rbYP6QCfcidrYAKeCB3yitXfxrW8Lqt48vXcl2shLcxV+3bMRRh01Ckprer
	GoOXDP9gMEZbtn7A==
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1322764e0c.3.1777457320814;
        Wed, 29 Apr 2026 03:08:40 -0700 (PDT)
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1322760e0c.3.1777457320324;
        Wed, 29 Apr 2026 03:08:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98630e647sm72001466b.60.2026.04.29.03.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:08:39 -0700 (PDT)
Message-ID: <652bf474-a524-4391-b8d1-7c0bbdc28b4d@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:08:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Martin Kepplinger-Novakovic <martink@posteo.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com>
 <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
 <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1d8a9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3JMqosQfyPtHKn0I9G0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwMiBTYWx0ZWRfX2P9Z3ZjvMwv1
 53XRWwLIFjpYI9LSGaBYDwJE+QAILitVcdgwJ+WSlQ9wwKIyPzukb+PSUNDlPR8maulWKgTfpXP
 lxOI0cZMkYMFoXDBRk3ZJsixmkBwKhSRsfmiJNC+AKjbZMDOif+Izgdv+EZP+BB5u/IICiw++XZ
 m1i2bTav2LGKc6efQi+aG1zDZR00BVgCrpLIHW4ZxZ3wYwQ5i5zIXYn8y/1EgDRpfTv9dkuRvg3
 KCTwPUeG4u6H/5xyCoJap0zYUjh0di06BKBKjJWxsnFpjJIi7+NmPLHh+B15aTaNHNuHHlAicPm
 kIFCnLcbhyCT4qqRh0MFCo4MIJfV++sEb2Fk8g/YEE4dCNw5McEIyxvhLuCkY4/djH6mTIeB0Bb
 iMdefX8sgpPdKpkXE6EJAlNXYI9n0Oe4ZoeocCfCb3GnzEdzNUgzXsvmR3xqAl9qSozMHafKV1I
 q/2cdc32qNX/dw08+PQ==
X-Proofpoint-GUID: gYGQcDdlQqJ_wVmODEA5lpi1R4Bo-kpZ
X-Proofpoint-ORIG-GUID: gYGQcDdlQqJ_wVmODEA5lpi1R4Bo-kpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290102

On 4/29/26 8:36 AM, Pengyu Luo wrote:
> On Mon, Apr 27, 2026 at 9:00 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/25/26 12:52 PM, Pengyu Luo wrote:
>>> Hi846 is found on my Gaokun3, descripting it.
>>>
>>> Note that it seems that only Goakun3(3.0GHz) version is equipped with
>>> Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.
>>
>> Are there any other noticeable hw differences between the two variants,
>> that could warrant the DT to be split?
>>
> 
> Except for the cameras and cpu, I think no.(But I couldn't tell all
> 3.0 variants are equipped with hi846) Before camera support, this DT
> worked for both of them.

Do the ACPI tables perhaps have some sort of a hwid mechanism? Perhaps
two nodes defined for both cameras and the _STA method referencing some
object?

Konrad
