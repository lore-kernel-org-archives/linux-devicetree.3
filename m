Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2763E3D79E1
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369384; cv=none; b=iC+XKYVvi+oPu3FrCWIAe1FLZkmR0BVafAg7OM3unS6chSBWUR01FQ/qO8DIaIvQJznpUNrkf/DN53ENwbQotT79QaWCSZqHvO1DCrGd6/uQQ/QWeNGd4JWPiTw8xxZBGAQMfnb7D8R0LS/XelwTzVWfbC8X7W0JrnaXbXuv8DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369384; c=relaxed/simple;
	bh=o5nagHM7th0l0M7MvXlGGwb3D8mtuYwjEL2ZjRyY03Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEDR7CrPL9mBzy9D/v+La3obEyR+b6gJ7wXdv+9wXUpLEY+S5y6cuN/awgWlNfYudi3cThScgBkwPtDRoXnJf9vzROcCL1Xav/1+YIloEkkJ1RCp8+3UVg4Thk7vaGtpz7auJZttocWj/15EIQVq0buvUTuHYqGTJMvF2dgPM8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGYqDLBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7Q4G6FN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGYqDLBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7Q4G6FN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMaG1731237
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4xkPIyoFIWb/EvwPELvA4ZCzL3zUVLYvFFaaraU4H0=; b=QGYqDLBR2APNi0ml
	rPtkMTeeM3ci8VYpGdG9dSh4tSLgq2CVr3ipp0NeD1donLbZeHoFcOlNDqNiQf3t
	RnZR/5aAIdSsnsvBGjIuKOBoMJK7X6z01ZC8TZYkbHywWp1NxGIm70Wt2JpROyyd
	6JWS7pmo41SopPr/R2MzAN/3tScPzhqClkSHnOztzX0jUDWUeh1dCU0JdPA4mlLs
	vKvZnvxxEyQcyEspOpfpmpdSrO8lhqLJoby1iURckLMgOUqdgu7K6eqwIZOARS0g
	9JXJ3T9Qq/83/cP5rD45eSMKK2qA3NWMmIId3/yV/V7VMg8InTNxccBX1Wwhfwsr
	vXEAdg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f5h39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:16:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so5512253a91.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369381; x=1779974181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4xkPIyoFIWb/EvwPELvA4ZCzL3zUVLYvFFaaraU4H0=;
        b=K7Q4G6FNF4XQYnNWhsrWcIn8kym5I1bBREQBafZv7/V5u38z35PmCgVSFAeOrlrdGU
         X6PyspZIcP/uKAkfPhZZZFc7D6smKffRVeIVlPml/qCDVItIqANuIiBWaVVyGrQZOd8R
         9TFcWPFK94buxD3AuSDxsUSMir7rNCSlmV10jJhuqqgqqX2gtkF0trTC/CBTetQi4ntQ
         CtDQwnIEihQaQ/aCEzauvwDtq21rsAwXN9QsqvjcTIaKDQBxp8ECmyNqwA2BVe1WB/Rj
         8DwDIJf8roVVK3fyP9Xldtyj+Rw8Ng7QYD1FQ5Wb51ywcSOuyc1wA3WHhYkY+8I3Xq3N
         PJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369381; x=1779974181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4xkPIyoFIWb/EvwPELvA4ZCzL3zUVLYvFFaaraU4H0=;
        b=BlD5ZaU3bgdkWjGkZri6CnDvfz4pqgsAYq2sfDfRDLU+LuxuQDQ+R93XK8h3FVx8SB
         cspcIa6s1oEZApUS8viTV9QxfW7dFy6TM0af3m2CUGfEoyJK8gO8sFgLX3lNEK9BgKPF
         246fjc7MUCWY/TBsM7nyg2Utap1R7yOuHAN69oHJoGOi6d2yqbWYg0lyZWLn4ynHtkjO
         o94S2RFMMyL1mABfBht7FMYHwGq5dmb4seTUJgBOFBQX0d5wiqAdHF/ONFPnf2Yk0DAf
         LhVliALWBWE7hX6eWogySUGG5vY8CdhC1D1VwtTfR3dPtlMfw3WRw4zm4qQhPHUKj/lX
         wsWg==
X-Forwarded-Encrypted: i=1; AFNElJ8CSUag/IMylLytkm2mRIVOdoV936mkUp9rVh3nxQuD4HdTmffBUGOmXG4qwfZa5nPUPuNt8zp7tKyo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9dd/5RA/MB92trnX5hbFSsHCZH6K5IcJfbNC6HtFbu8bEMih0
	Gp+mJd8R55A/x270VFqkEUYoChZcwuMwc4jiWgGNTpG3r3WyhM1SZ9ujpqY5ZrNHFENtqZIQuzc
	sY5Hm4KYEvvM8+V4socoYULvmsdMyjptWYFqzuPl3TaXtOZmBCGWtyMYQgKe1oCMP
X-Gm-Gg: Acq92OECKzoY7XK6L8Wkt2sIdoCzpOnEJ5CnWYvWjsXtsK5530etceSxaOjjPwFPSOJ
	0MDmPMSJBUyffi/iPuDmzOxnvYV3Z/wTeB03txMVQ+jyg/l9PCsM4xmI/LEjcPTspbGtpvnXLMY
	hkPw65l4oh0IDDtBdRqHHbnacJsqRfirvDZnD/iCQArnrBXTln/iNDFNVWtamKU0c4YrQ85sSK+
	BBZbCoSS3zYYtgE8ohU67jDyCaeMJ6lzqvGhuwHy8ur6i4P/PU5u9A/s0lgwpkFxtP3Qp6WLjJP
	7aHUGVYSPHMZMID8EESw7arp2fxPMCfJCjjzOBxcyAone6ZxxOwDKTwyEIVxY5PUBPdU9sLTmze
	c/2GFX4Tq+MTAjMkuSSjOOY8m0sMIhiccTCSeO1rFkT1IzdJYR5huEW5HhEO4Zks=
X-Received: by 2002:a17:90a:d88d:b0:366:4a47:f267 with SMTP id 98e67ed59e1d1-36a4561b310mr2836408a91.16.1779369381099;
        Thu, 21 May 2026 06:16:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d88d:b0:366:4a47:f267 with SMTP id 98e67ed59e1d1-36a4561b310mr2836371a91.16.1779369380614;
        Thu, 21 May 2026 06:16:20 -0700 (PDT)
Received: from [10.206.98.135] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5afec699sm775780a91.4.2026.05.21.06.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:16:20 -0700 (PDT)
Message-ID: <6bec7091-6fe7-4cea-ba2b-f405369745e3@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:46:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
 <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0f05a6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7XmJ_PM_-5BJ_RrxexwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: pHuNajhJAUIDGlqsAZ2RGuKSdQy35KbO
X-Proofpoint-ORIG-GUID: pHuNajhJAUIDGlqsAZ2RGuKSdQy35KbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMiBTYWx0ZWRfXxCT+I78vzZEG
 zK9A9OWWWOqRdo+SNk0l1G574Tc+CrJR3+5UCUwTT86K2qpBkdYRyFAb7xS3Mz11UoYqqw2UaiQ
 /qBkGtBwgcA29+9rWd5TiwWB4UzMk0TCEp6C3xowyO+yVaVGPIfhblXl6FVBg9BsYXiFe+iykQN
 uh/C5X+ncAiOiqglJFPki6kdELjZWZ6LCVX4qqAlLkqR2ZbYY0kRnEm7dOuf5y4pttOLfS+/TxI
 FGohRUJHoIrFiuUtscFnxvKzofpWVeG5fdgr9BBRZGXwLr6GMXgw6oOmoS6J8yJE+9eE3kyoPVh
 DqhEL4tbYLiVni+B9ET2WmS55shGwW5Ad4Eyu82GR/N4DjmX+ZSTMNQHdYKAX/Dv9wyznIDMV+G
 m9EtXFzvuMCbWdHI4IPZKuHNAsMm89XGVAD2rp0Zl0dAhXMLWYSBVaVtIPJCYV+z+sQydGShTU9
 1UM2llWZ8uqL8ffQ/9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210132


On 5/11/2026 2:29 PM, Wenmeng Liu wrote:
> +        camss: isp@acb7000 {
> +            compatible = "qcom,x1p42100-camss";
> +
> +            reg = <0 0x0acb7000 0 0x2000>,
> +                  <0 0x0acb9000 0 0x2000>,
> +                  <0 0x0acbb000 0 0x2000>,
> +                  <0 0x0acc6000 0 0x1000>,
> +                  <0 0x0acca000 0 0x1000>,
> +                  <0 0x0acb6000 0 0x1000>,
> +                  <0 0x0ace4000 0 0x1000>,
> +                  <0 0x0acec000 0 0x4000>,
Please cross check sizes for csiphy.
> +                  <0 0x0acf6000 0 0x1000>,
> +                  <0 0x0acf7000 0 0x1000>,
> +                  <0 0x0acf8000 0 0x1000>,
> +                  <0 0x0ac62000 0 0xf000>,
> +                  <0 0x0acc7000 0 0x2000>,
> +                  <0 0x0accb000 0 0x2000>;

Regards,

Vikram

