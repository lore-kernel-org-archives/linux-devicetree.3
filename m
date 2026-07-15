Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17C9225413
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097547; cv=none; b=m8DRio6+BpIINPUc5lnOSAY0uvQA8RobBNUcF0X6j4e+CMZn66Ju88s1fdRI3jOwAs8HyTs8G9ewodkAnqnt6k13eI2FcNDVL8Qyq4MLEfihN+TAQjTlb4VXOPdHZB7onWFMIOLIjDwf0dp3pBR3SeJdpTNMy4DwhWzrY7Ekpds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097547; c=relaxed/simple;
	bh=xMr/202VPSLUku89NjyrrMJcJ4+vAjRw0LAGM1EznR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=CMY/CkISVa/wluocZh1YF78t//GuxCm8cDnBTGm6cjuvoE2MOxxd7U+nfI41mikApg5oonlGgSue1J4oYNLJCFpyR+ZtLogM8BmxVC6eJs7W/p/B7SFjfewWbRh0Py4eDIFASXVUbm3OHYrHDOq9HLknCo2Zl606Wz6dD8tNnfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rZm0u0TU; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rZm0u0TU"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260715063901euoutp01cd86d1100d605512225615551ec8dced~CY0MAuLgF0727407274euoutp01h
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:39:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260715063901euoutp01cd86d1100d605512225615551ec8dced~CY0MAuLgF0727407274euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784097541;
	bh=QkIx5HxAGLBRNJ/u+bxOfaKWM8km5UQDkUuQ/qbWx8w=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rZm0u0TUVeuWMDh1jB5qpJPX96mVS+ZsTLoHkct8uwfZ7LQWoc4uMZVSGJR9syKSs
	 QTIUF+5B0nBTc8i7gGrvruhyYotlVx7TnvEqky6QLm8fTTCbKTrvwiQf9uNG97wRk+
	 57pCrAi5r+O9rLWFnyj1CWSOkITJgz5NkjIrLpVk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c~CY0LqDzKi0392503925eucas1p20;
	Wed, 15 Jul 2026 06:39:01 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260715063900eusmtip24c15585bd6a665ad2131db656f6322a2~CY0KnnnAY0426404264eusmtip2S;
	Wed, 15 Jul 2026 06:39:00 +0000 (GMT)
Message-ID: <3dac25b9-a464-4350-aff5-0ada4dc1d65e@samsung.com>
Date: Wed, 15 Jul 2026 08:38:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
To: Marc Zyngier <maz@kernel.org>, Sneh Mankad
	<sneh.mankad@oss.qualcomm.com>, Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <87ik6i6i22.wl-maz@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c
X-EPHeader: CA
X-CMS-RootMailID: 20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
	<20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
	<87ik6i6i22.wl-maz@kernel.org>
	<CGME20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c@eucas1p2.samsung.com>

On 13.07.2026 17:11, Marc Zyngier wrote:
> On Mon, 13 Jul 2026 11:25:41 +0100,
> Sneh Mankad <sneh.mankad@oss.qualcomm.com> wrote:
>> Remove #power-domain-cells property and add power-domains property for
>> MPM device.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml          | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>> index ebb40c48950ab3a8fc86f5708acfc33c33d68993..3f9645fbc3c20633077aaa589e5d5a43928dab51 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>> @@ -68,8 +68,8 @@ properties:
>>          - description: MPM pin number
>>          - description: GIC SPI number for the MPM pin
>>  
>> -  '#power-domain-cells':
>> -    const: 0
>> +  power-domains:
>> +    maxItems: 1
> What makes you think it is OK to change an existing binding in an
> incompatible way?


Ulf suggests that this has been modeled upside down in the initial
submission:

https://lore.kernel.org/all/CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com/

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

