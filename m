Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B8530ACF0
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881199; cv=none; b=etisLAYJTueBGu47Nr/qDZPlLWXQAByF0XpBleIAVmIRTscPg4l4gZ4C6RYI37+gAAocT66wcxzNXSnQpm+kbQpqXh5TxILXoRqRGz8ayGZqMNxiC6TZh9cobane1ci/9VQo0e06O7M6r2r5MhKFHaEDbDHsKVYK0ZPKcLNAwcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881199; c=relaxed/simple;
	bh=4OoXRR4QkYthl/WwmdE3YXaeSFOh01gjRlYtQBvbWAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e86yzlX2vhCAnYpBnPQGTWDB44CSaF8QvKgvT97gOnhHMtwFOoEM66oX4qvWFNYgdsfEw96EMZqQ8IXYCcV+fZ0ReS6cnzZ+IZXzzRG/nMg7mxhd/EmSxaUGP3IHW9td64QV+XuZG8aD6HD416ssPe1aWvw/sdPNDh94ip5V7yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLxRlFcQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adAcISAQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLxRlFcQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adAcISAQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446E2qo148749
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 07:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUDAx8+5gD5l8P+ilecAiP22roMtio2UtbDIJRNo0XE=; b=WLxRlFcQ5f/yTcUX
	tcIpdQjIhd2UUgmGfsVjMSfuCdzKUguy4IwTyBjwVJ5wIM1qIY4pCqK6dRTwVc7s
	r/IlfxUUoFRFUpcPrMeEJU1GWDcpEIE6xO1PEIkcfW5UhiaM2SU7QwIKgl3CwgUQ
	FpaKYl6CyDyq2i+InQ/mUi61DiCRYVLfeEwVYplNxCBk947WbZibKzh+WJRM0b+b
	VjX5oWd8yrNg+lri+7cpC59hHb9xvmbmn6MncuOLx1TttQKJNBh6B8c67ipE9VOS
	CNK9XkEVg8PbwiavbGDtYuAJ0QrbC03P42QtOS4U4oukaxVRMoCr3qRE278isjTB
	DXFr3w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8uxmu2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 07:53:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6238fcf1f9eso362896137.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881196; x=1778485996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KUDAx8+5gD5l8P+ilecAiP22roMtio2UtbDIJRNo0XE=;
        b=adAcISAQ8kblJot5NwFliAkTd/H2n0fO49DCYXkC5S/fd+rAz038T9zMjCH3rhEhgq
         BV65hO7bMchLWacOJcPv8gpMrPOhXIse6IfsXxy5yOAxyesc71ELGf4wCTXmbRXkfq5t
         lURb8ybjMESxL07LkaAhqbO9HmNlxyYXLLUZXBLun6vtKk5pffOVN0ibeWqOcYuM2eMv
         339hZ1e8+RojwibGPjHvlZsjYNFrlztNxrcq7UQZArUHouUHsoSVBlsVIp0mF5NInOps
         FmgMBRd3IBRi2d8Fq/vCtmizuLt4JzSEugmYX6taDkgwbw1LOtFDi4hgm1dNFfLxE0WP
         jXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881196; x=1778485996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUDAx8+5gD5l8P+ilecAiP22roMtio2UtbDIJRNo0XE=;
        b=mtt61i4FPh+/KQEWtptoZ/YbdgLtgGo5BfJCxGTF18+x02VAe1Vl4UTEV8A6M+lDnI
         MYqFGHbEOmH9xmisP5aH1793TTEiVWLHNj+F1V08vUEmDcNzAYQd+lKg9r+SGabvjUxe
         VFYJEA9+nMp5QHaz4XkFku5yHYUGGKHvQ3EAyf9nPues0fFfSchzhXjqHOYBtKkSs5Ab
         eFA1P6LscfdgL936vqhDLn6J4KZjrph/JUaWbhfNTaujY5Zm/5123s23WTsbXVYYDeFf
         n3JadfshJSIGBhunDzqCusVzm7SOrFN69IxDhTHlMklYMcCiRG6+rOPEHNh5Lp8x9YKb
         Upjw==
X-Forwarded-Encrypted: i=1; AFNElJ/cKnFA+6CKGL/Pq66QxbFMh++TLIQCyVWqXs4R7kTW1KVKnLxG9RMDYWbtPnlAppyJeOc7BohLDjUi@vger.kernel.org
X-Gm-Message-State: AOJu0YzId7KQHi89XHbsJKBYGP3UxJRUBJD3JRxWxmLnEcWB48qvqcge
	2gH3hS6Ya4DUGEwfGqWPvlm2eTqXDWDqK48Uhh3/ykrtEVS2OUJ6cdFopq8vFAP7JZCMMkGYTZH
	U42ZUk+keF4gGLDFIMJGfjRKL+FFGPz/u0O+yWI5C0VxvW0pW4i/rp7baF4um5Jkj
X-Gm-Gg: AeBDietxGFbwrk8Eunt8ic+DZpzA7c03fPYc656soATrXidmRsYZXgJOm0nRw+eR55b
	+8+HNOMixVtUrgt3jL/28Sc+8+IM9niItRXQw8v/b7uU5DRIjlPGwImG+8vgyTXd+N6Ja1CVBqB
	ohSg7BOBvHBSp1LUYAQAC0xq3hrYc24ohWIXLfOQbZfDaWkNWk0sLl53hFey3m6oggO1Ar6H7IK
	i5OzsDkrZSLIvODA2QLkFDwAVSQoy6u99c0aevAL6c2IAHYOyYrQKTXwt+1Rdofpt/APvZG3sSq
	tdFVC++014rDJtY2eTnxF/ujX7eyAR8hsfrA09Cq9WUNGQYo/VxXxWQVdEUypzdp5P9AT5efuna
	f3GjaoLDVmdTlwbuPs3oh8qIgYDKu6Qjl9wjnpzBIV/EBmyMftRIFAdh6qf6wozYMX8+9heh7tx
	qdvprkd95kuktxiA==
X-Received: by 2002:a05:6122:1295:b0:56c:ce6a:90d4 with SMTP id 71dfb90a1353d-5750c7340ddmr1016298e0c.3.1777881196432;
        Mon, 04 May 2026 00:53:16 -0700 (PDT)
X-Received: by 2002:a05:6122:1295:b0:56c:ce6a:90d4 with SMTP id 71dfb90a1353d-5750c7340ddmr1016296e0c.3.1777881195975;
        Mon, 04 May 2026 00:53:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc2e55d98f9sm31639666b.8.2026.05.04.00.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:53:15 -0700 (PDT)
Message-ID: <934a644b-270d-4f86-b7e1-db9fbe3db52b@oss.qualcomm.com>
Date: Mon, 4 May 2026 09:53:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,sdm660: Disallow
 clocks when appropriate
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7hG7UaWhlMqLXDpDNTmGe1_k7O6A4iWP
X-Authority-Analysis: v=2.4 cv=QqxuG1yd c=1 sm=1 tr=0 ts=69f8506d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GwjjA_OFujnSjQWLvtkA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 7hG7UaWhlMqLXDpDNTmGe1_k7O6A4iWP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4MyBTYWx0ZWRfXwEM2AB9U4E/J
 L3gF0BAJ/050IHtOFIUUNQWOo6SaeqP1vTLZUFcgwkqoHT2pshhNXAEhAs9iW99WJF6WRG2nrl/
 W2I9mJVoAMeCQkd7t7KzewU0geapPmePxpF8sS9VQBVzyTShTVkmrWLElhDCv+uzbzk744/hSuM
 WsTJJaIfFLh0UitANUnhNDXSjv1XlHs3rQZhqyJDsXVTNhs7wfkJ48ceNzAvdBioSflZxZT++c0
 gEvd3DJi/bvsCxTvnQBpWtpuvFQH0miOpF+8DpwhGT1ahuQH02kLl3/Y4YOLyAwkgc9iXP1lpwn
 8K8BlQysIku1ecr4wAso+/gYBEgG53mLOcQat7ysaNOOVNLEBobJF4M9a5ba6ga8rj8IO14bBb1
 qzq1U5N0lihq02RdOXBP+ct2gFWLMsenzMJ9S7nThm6nzMTl6d0atDqv6bFo9gBSH/2qC8uUaMB
 pqkw1g4o/2N45ceSuow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040083

On 5/3/26 6:16 PM, Krzysztof Kozlowski wrote:
> Only qcom,sdm660-mnoc and qcom,sdm660-a2noc devices from what is covered
> by this binding have clocks.  Others do not, so restrict the schema to
> be more accurate.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
