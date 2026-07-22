Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77ED33B6D6
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682149; cv=none; b=QcfCuanC4YwMMG3FgQt0jpAEXtjp+23tEqTI9jQhNHAZcnkD2dff7mTvTbyd7xotA6F4KbPh3+vvHCPwMxQAg8Ed4Enl86482nCb9tSOtQ8I9I0t2eAQglPzwaKhCuSeXndZPkZF4On76pFQEPKAqH+3QtJweHwAOw0Z4AvZ3f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682149; c=relaxed/simple;
	bh=c5H5aWVOu3sN2gO3WB3YRb/qJbB2sTD4c4JP3roiPMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=druq0si9l9/twyGLTtV/RygX5JJfxOF6SAGxIBVQ1RzcjUlsk7CwQcqxdoeVUOf8SQS5DMhG1+96RURei9Gy4b6wQK6xHP0IS0FjPGSMIq5OfUSGkIpkbZ5+I3ehPx0j51MakNXH0xgX16iS/64JoFKQgYD0TDZID49LnyfTjZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4cQdBcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYps7RBm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4cQdBcO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYps7RBm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZ9Ng2812253
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=; b=A4cQdBcOfzSJ+xxs
	Wf9YkPWkl0vVI0PXxqY2IwQSKv/6Rw3/yPwo+xat7cf5zHYobvNq7EfHyy7BTem3
	BhsTYDmn4UPLoGNNn8yy0+GlJVVQ5soCHQnuSzg7oiRRKUM/YPAHsV0T9XTr7ATn
	Ce+aWg0vGWW7XcE8tJL8hFcdJueR+bn7XkAwr4tAe3QsEzuROnRxYHvjnfU98mYe
	xEMN6AeVQscx8l+0BzTFqp91S9TmpMkFKuFXPm/cOgM59LRoxPBYzC0POR7wua8l
	0K5lOHRmEaC/NhhEeTXJgvtRH6RFNSWnoNRDAofV2nR5VC/jWaiVHfCVj9XaK1Za
	AWGciA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e1ha4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:02:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848568a6f62so20013402b3a.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784682145; x=1785286945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=;
        b=GYps7RBmrL3NO82GXrfFKsH7BFwoMFM6yv4p5r3pdrhz8VRPjpUN+HmEjp3UiXuwgm
         C7L2LzCiL0u7dncXoDcdRBK2u+T/tfH594cXdsH4FhPBin88V8ltVXkm6UB5IoDtiA2s
         DxM6ZSkBzDg1sTYE+njK/AvVQtJWVq+rrx2dU7QbRPQMU9OGI/zaKWa8m6fcqeF9C4xn
         SYh0DIetH8lgeAgYPUPy5cEzBGuJfW4y0XVpTLupqkCXuesQIQCaV6UF+wdYCVqIbjuj
         KqQMePzZ14YMnyYKNcAGqQfovx2+Fefqz2e/qrfG6knlZoWiffhm9qxgF7XHRdBuXCRz
         wsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682145; x=1785286945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=;
        b=VQ5YRyLYvQy9BGC4i5Gs8U2+hve7QeLhYStASQuE/pcD7ybWyodcHc26Ka1BE0Kjfa
         znJ5TzAe5EslbWlS+McOBQ3mBZsHnRMaulskn5cZ/83m7FeXL+4IkFgmBitiid///AC7
         b8DzwhRMNlXW4wU9c0DWK8uOwiYcvXAt/8Tn9y//C1MpLTFbNQWbyu9gMeAzjaNZOtax
         /OxL9Kq/tD9lUbh4zNPoG5at6DA724zq1JUEIXb+G4LYWoA4mD4as3dYU75RGuMQnz9y
         7lrhIZ44LS+QlFePRxb1yZ5QUp8RxkAk9pBBJIMaLvY9NRleasoQOBH27Rvmyvdm5cVY
         cgZA==
X-Forwarded-Encrypted: i=1; AHgh+RqTZb1BpejljCaezOcx+YzN/yh41Sc2hbsKgmwiGLjyJtg/mQNd7RbkncBGdr6XMgTPzniGZVxBcUQS@vger.kernel.org
X-Gm-Message-State: AOJu0YxJfi9Nn7mDV6/0MrrVxVfvP5as3o2AFSMP6/sAU+hvpFcevWLu
	HK9dKRr2eqv6pP1T4K8NA7r46TsNdsh5Tb7xCLmOni0r9S9uZQkw89pTCt5hLYLp1z1MoxVFU/A
	toXkp9f5nKjuX93mD8F6QZecEE8+MN+aI44MHxrygCZZKK3mUfw3GngWZ9zXDEurh
X-Gm-Gg: AR+sD10BzHEhAhsqXNehf3bY24TEe4AvAJJeK5pZCGaiOj54rLWeuZg/muo0R0YXYqq
	U8ul/FeHJHRDE9iGjBr4t0gg72XHn/dc5QCbtRXpGoDnks3mV6IvNprO6XClHpF4EFsHRRChGsT
	X2zn8vLE7oBBiB+u2kpZSnseZPgmOreDP5RxuGna682XMf9clEmHwhEJBZguW4MqC0k5yf01zHQ
	FqJe8qSQijs9cbHZYv/ub8Uy3TGTb11xzpS7Oox+sZUesL8Koak0/BTPGbLBszmM/W3f/hq+Olv
	VzlLpTCDJjYIeXcv0zlQIYk5TuSaFFFK+MV4/MfPGI/isOHEShdBdxhGLx/L4hXwWIBOqC0T7YD
	BWQqBy8gNB4D1xWPhmHji
X-Received: by 2002:a05:6a00:4091:b0:84e:538:476c with SMTP id d2e1a72fcca58-84e05384b33mr5558310b3a.67.1784682145226;
        Tue, 21 Jul 2026 18:02:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:4091:b0:84e:538:476c with SMTP id d2e1a72fcca58-84e05384b33mr5558254b3a.67.1784682144785;
        Tue, 21 Jul 2026 18:02:24 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237761sm475347b3a.4.2026.07.21.18.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 18:02:24 -0700 (PDT)
Message-ID: <2a532aa6-925a-4c97-97d5-22f4ec6e51ba@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:02:14 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
 <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>
 <20260721-stylish-dexterous-sunfish-1653eb@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260721-stylish-dexterous-sunfish-1653eb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 088cu7xMY80MG4DDYYuLo2HAqq0vsXHa
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a6016a2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dx5vPtEcpawhRY5uvL4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 088cu7xMY80MG4DDYYuLo2HAqq0vsXHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwNyBTYWx0ZWRfX80j0VyiD1+dS
 9kwxIOouLm9Ta+eAIqM92lRawafSHOnT+OvEefbVfD59VkdsqJITJStSaEK14U/jXKa1F1j6FcD
 Ow7JRpRht4h6ywqSoTREcpAj2qp2WuhjHZKpBa7wlOp0LzDfzXIaCvK4/3zDggRwBA1bWG5+jpg
 NQ3czYRUHW5AR4JLqZ2/oUX2iKcs32THjovNlFbHYAbFvJcFSSctq2fjKjotQq+XDCCxvJzaQjW
 qEGPzrECXU2wZB31llfQ+h3Fc5Dh0jnHIIecbeXbyzlnqSI9zb5RB6Lg3tLVfLmY2K3x9LCkXCc
 3BIFeVWXdIczakUSm5mtTmo9H7+RUg0N41xDUZmYRQlpmALBuLJ0qM70cz3Q23DqfPs0TbqBEyI
 UhKqinM6aG0xyS8NutENq+MxGOE2oSlw2L2XMI59oehqb9GAROxKz4JIZGghYgGmQ5H3ZJVmQng
 26bRc3JzZz1zX481PLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwNyBTYWx0ZWRfX6auPz4A/9VFu
 5Vf6LBdHDVHB8zmTlSjQy398b3LfAxy9dt2RY2eIPVGi6p/3NYuzv4rmksFDQgHGKfrVbfwtBnN
 mXZ7z9hdzEYkWnngSHMO3UGh8Sy5ijc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220007



On 7/21/2026 4:17 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 15, 2026 at 09:16:14AM +0800, Jie Gan wrote:
>> The CTCU device for shikra shares the same configurations as SA8775p.
>> Add a fallback to enable the CTCU for shikra to utilize the compatible
>> of the SA8775p.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> And it should include useful final prefix.

Thanks for pointing out. will add coresight prefix in subject.

Jie

> 
> Best regards,
> Krzysztof
> 

