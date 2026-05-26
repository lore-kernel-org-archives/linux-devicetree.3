Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD442C0282
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781594; cv=none; b=Q+fgsYjyzotFKbf6x6FQ09/kLpUtL+/yAmTyll1B6dkTUMYSGhdUVtXIdwkZIMFrEecezqU1wgX8yaQeXlkqEGotk0hBl9GfLg3vJs/4hgcSrA7sUI1V2RSxVzlLp2nh5T8+hlOmi3KP37L5szoZnKNcD7uIsaTHfHosOIUywi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781594; c=relaxed/simple;
	bh=hV4EV/MTPp6bOQBQdWU/yh/7MhsUzUAaU0yrMeO9FEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ95jMTgbLX0m9c7ZUf6WaS55UxwIgw5Bp/sX1b5iDMACWReykaoz8bZw+wLcmmnrzDO79M6nzwtgyFBfKJ+fccH0KUHJ0BK5b5MnQDu+p2/RwZRJLX3KK5Cif8o3S69WWh4Y3N+OQrYIa5eA7s2u/zUbcmvCe192LXF10nhUx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5vfJWXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7FplO2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5vfJWXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7FplO2b"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6vAfO482918
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IXr/2Ris8NgPAriOtxZy4dQ5GqQXlwijnrhW7sGA0Vs=; b=V5vfJWXEB+QNM9wd
	newTZ+Yz1IXR9Ewu3yv0d3QviVRTg6uIw4KxQ7xBpl0LCPEf9YKc3KUC+kHRngn0
	wkjYjWrVmbQ/PZfzbTA3l4mP4thjFKInCUThtsULQ9jN5M7uzAwrNMLCi6LLUVOd
	ZRusJVv2pieSnDj9vjSh/6gmidmmIGdL6ABrmkaNIgPkje8Fg5Xs75+xx2Y55xF8
	Pfijpesabr9SSJKPY3c+/FgiEjBdZdCAXvmWY381Hdc8batvrKIemDLldw44AhFr
	joVBpsepHyx5D+Mnz4BBwf4TrxnBM3Ka3+8Ki1/D4pxVetxq56Tuymv/Xy/To21W
	tnUMRw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynap1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:46:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa860e71eso5151993b3a.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781590; x=1780386390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXr/2Ris8NgPAriOtxZy4dQ5GqQXlwijnrhW7sGA0Vs=;
        b=E7FplO2bZAhIMUd5xMCc8en5dM9jyzpc/wuFtx/9KYGXTbvjAKC8kFkVQjrrkOsmxT
         xSRB/O17ofnE4dEazPUZjRtBOSALx4CfnRpx6wMCD46M3/P1TgUEKgm5XDFdHX0lHQsH
         iVP9eTICAA+uRkHciYWqUQ/gE+OfNJQPCkEFsTkrquR51wVLyIslMH8r6sYzXWjQGEm7
         VYwil90O+iiirSBC85JAQhsMmPJOCfLGlubTWRUN/vkxvyPsoFOZTvpKzEL+PkMCicW+
         WWuSLImzaeLLWGR6/F+lMz9WRB5sKqrkjYTVmbdwym3rR4nSfrWXsa+FBgw8SpJXGtKw
         /6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781590; x=1780386390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXr/2Ris8NgPAriOtxZy4dQ5GqQXlwijnrhW7sGA0Vs=;
        b=nhDkctJs1By5eHPJrYAiCTavv71jHsVX7wLr9JJ5VaOHfzq8ivMr4H/Jedrd1q/d1r
         uQCoqVCC7s7kjfFDJow83POsrVh84ICipW7uqXh9HxJEduYnBB4V8aioi1HF8+qbllce
         FQqia2zWbIZnKDCxpJfAtdyiZhYVh3mu6XtXM3EV+jV1iXxNZlu9Q3pW+LXEYqZQaw6k
         aaN0wjr0UQrbGYCZJIWDyF+tmySnq6/5KTgRWesJkBFAIalLtIgWWfRyRz3gczpR5VYp
         71AsHoh3vB+6kxsEVPnke9dRlAmSfG+Ev8bftiiUCFmDmMFcMl4qgB9KnBxo6qWmZsCy
         Y2lA==
X-Forwarded-Encrypted: i=1; AFNElJ/8CYN5G9rKd1hZLyOrnHzQ9rainOtZi7rlOaF7iTsrx+RC27qoVMDPTOURJy8t/vLe7yFRdfJtQzgT@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZ7/BfOJ/1QIqUwwTUrVHICUEPziPU7hsNvH8yKrosf6ZY7ru
	5Nlg/2NaW3ct5bpfUy1lF0oKav62Wn+hakDzDLsD2uIiWJZ3wgYhnUzbbahcxpuZod0VspnzaKE
	cznH8znfzSdR018sxBKn4PTC037ujsQ8E29TBOaBVXG3FqCzo2AccBWOfPoE407Up
X-Gm-Gg: Acq92OF85w19cMFf9ePe4y4mVqeZF/H1Oepo9VyLM2Zn5dwN/fKTR8kGhJesUWfcLP5
	LVKzQUKZ8Zv94XM2AEE9iPbzcKmRcfh4DSZCiGy2WoV5f2uDj52c2kzXc1B3zCNSklmLz5RpwEO
	3d3rwBvWOJl8o0vZI9iEdwyrOc7bTuRJLFAktm6d+JMAZENOQ9+SquhKHaLdy2yHsbOIArWlHJr
	WsOi+3hqKO6Lqsb10CQdhhMrnyc/uGk0STE46lmZiml4oWTNhw2EJhdXR11cMdrFVxJKxg8jj2E
	FwxMqZ0TiPJOCexGYb1V87LjMaqmxdlixHKk5Ic68z9Ba0te+PVIWFPiLrhBlM5yFhZaco1mUKL
	6j4WH72PN7Um2bAFtbNpmya9ORGTfCKg0lwlGIQF5ZtBO/SxLxKEoM5cGJ+o=
X-Received: by 2002:a05:6a00:298f:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-8415f586b5bmr15660110b3a.42.1779781590222;
        Tue, 26 May 2026 00:46:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:298f:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-8415f586b5bmr15660075b3a.42.1779781589739;
        Tue, 26 May 2026 00:46:29 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8419a140893sm5387763b3a.46.2026.05.26.00.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:46:29 -0700 (PDT)
Message-ID: <8aae23af-152c-4f2b-8c3a-6edd61685ec2@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:16:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
 <20260520-hilarious-tungsten-giraffe-5f8cc2@quoll>
 <18b19e1b-8eec-4578-90d2-7b2c17aede74@kernel.org>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <18b19e1b-8eec-4578-90d2-7b2c17aede74@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a154fd7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=-We1AT7ZfJutN8l6OzEA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: i0zjvzQLagMwN__9QVv3EdXWx8XRaZcS
X-Proofpoint-ORIG-GUID: i0zjvzQLagMwN__9QVv3EdXWx8XRaZcS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NyBTYWx0ZWRfX6MO7zdDaY7u1
 NCJKloWhOK/ZbYNVwSuJ2TuIJWyeu5BQaRVV9a3/NBBQRLNuPvtzS49m0+xzivngdgUhse8eQK7
 asm3muwH6QJ/lpbQIZ0Ntn9kMKTN2hKQbRMYbY9ivl6LDn3O9mgo6cVGfCAotZH9eAKwPQSf6qn
 810JQFlkabb2EiaqM31mWzB2OeMB8tiDIZylVTexMn1DoLKYsW5jBcgXFRsXuEUT1vCatHAHjii
 DW8f/Uf5PQDMdl6JbakI2ilwVNnvbXNjqOA404frO0FyXNPoBllZTveOzpaIhy7pEJ2vPOZQ2EN
 c2szTq0PuF6zKZ83/Svh4HWnEe3TX8prkU82qc1tPwvg5zQQwODwp4Tn94N2tKkvIxGbsIFgAaN
 l6RHShVGAz5/Ukyz9+hDUfhdnma4Co4BojFmV5Mb748SeK2ixCDlYE2U5o7Q/4CYy7mWlClUQ3A
 67bWhNzOZZ8ZXPKkWhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260067



On 5/20/2026 4:16 PM, Krzysztof Kozlowski wrote:
> On 20/05/2026 12:43, Krzysztof Kozlowski wrote:
>> On Wed, May 20, 2026 at 12:35:09AM +0530, Vignesh Viswanathan wrote:
>>> Add documentation for the CDSP Power Management driver, which handles
>>
>> Luckily we do not take bindings for drivers, so I can stop you right
>> here. This is frequent feedback, expressed many times on the list, said
>> in many presentations, including DTS101, explained in writing bindings.
>>
> 
> And you already received that review during internal review, so you just
> ignored it.
> 
> It was given to you with a purpose - so you will implement it, not
> ignore it.

Apologies for this oversight, I fixed the subject but not the commit message.
I'll address this in the next version.

Thanks,
Vignesh

> 
> Best regards,
> Krzysztof

