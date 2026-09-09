Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD11552947
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957918; cv=none; b=nxmU9kg9OcX/wqP/gvYEIB9/kgv6OhO86w3/60kehDQcyLQ1iF+jyJiynYCiXKogG/ra2whhSpkKqsNoHlQmkPGigCqj30pPOqtC1ctUry3WVA7AX4dOp+MZFhQN1TyxUeX2SH75b1e1oyPq3QEEAGPICAugPmFl35xzkJWf5Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957918; c=relaxed/simple;
	bh=npdUYq9yMIsLpChnrVFm65H8LEUeDfCG65JUETLKARk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkZ8n5CQt1f3EyC7izgaSB/7uadMLg8TON3nkDGjk7fcVM0AzdHh840gSuCNFy/XBum9vO/h1uCcJtyq4OxPuUQ6RpsDh5aP1bImoB0P+1fukb7hWfJvtgk/6ArTH2FQRFXPWR4yKEHLv9plGuCpIwoW9CCmHy61/GoHNZsN7Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2T3YKRQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hv3oAhz4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2T3YKRQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hv3oAhz4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CD5Se3054108
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 12:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=; b=I2T3YKRQGUnTtlwm
	hUuW8rktwf0XSD4EZJnWJUJ7mjgwltsq8a+UkhgBCsNhXmzOuIpADyLDiI6vbQwS
	txwFaSMn+ZOVWWtecWe+ebmmGhB8OerNlBYNz4JAVdsyNt/kDX/Cw7CSL+D2zoGF
	pP+uxS2B0p3Gc+pB6kzNd7Mmwn8yT7a+EeNZGLtQrWPhuPo7X9a1UqHjOploYAb4
	bWG2Qd+mMScHqgoqezH7I7S9MShTlvBEXpPZYCYxmLBtatJ2xxS/kz2Aitnef8yj
	sq+gPHcW5Js0rbh51WIn7M5+wbgLTtS/dYdIKq6r2JacWireJ+IMXx48G2iIchQs
	TDOMnQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk79203h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:45:15 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a7de733fa9so6300062b6e.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957915; x=1789562715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=;
        b=Hv3oAhz4ie9QQiog+FSuVIBmZyldp4eLyXWgod1Ce8atdMCEAp2N6qRM+rwEvOt51v
         BExHrVYJ6FcyFy53JSyMlPd87G7I0mOLXP55EPXGyI28G35RuAo8ONBoT+k77KoLHi41
         hNbNrETaPD7HuEXzY/X672c8bG42RfvU3ND7vSTcUcFs26s7I70LoMJrgLzwpdEEttxm
         dYrCyUstEKTqTCxsq5T5C9eS66vF3L0SOFNFozmLwO1JKPncVm1sIwooIlx7Pa9Uytbb
         zIDbUbbqxW6jKM2n/60tCFXvXEzKMDVsfEUX5oZSXVkgrZljh8OgWkSV0veTgOCXEgDe
         iiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957915; x=1789562715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=;
        b=ci6Rt071Dvqtf0JiJtFvltTwWf768/5J0pOSrPQtB101BBABOIK4zintvwvKZdYM47
         No5S6GqhzN+l+XTv//peUWaUtOiAuZG2LliHmtASkt+JTmXMTSWz3ZUJ62KRHSWdDqrb
         fpfI+l6k+jKB9Zvww+A7avcVczh9ux8ACfhXWsxOD7iQYRzrvi3rlqVWYEAzBejbK9Xn
         lSbLEOg+KzCY/HwE8Sg0XaztHFoYAZBOfwW/e6xhWauUTIo3UoIW7qz5iWlB+RkpakaF
         umooavvp+4z6smPPJEtRwG409a6uk0lxhQhVzWKsCya/OuEcZwHMFc1ztOOmNBh0a31s
         o33g==
X-Forwarded-Encrypted: i=1; AKwUvBz0byIQy7I3o+Szhq1n1c70NRGstiz7NjCqnCztbDrwcG26nAWVbqR0YBNrPD0QgnyTwYaBX3vuccga@vger.kernel.org
X-Gm-Message-State: AFuF++kBhAfgpwQ7Ot7gUpyzsZke1TB+gtRoEO2w6orCAJMBN6oAbe7q
	s4zUo64/ieq2cLPnTUad0fV+LRGzkL0T+FdVo0s+1k6La0eErqqo3pZjRZRrRs6J3fE3fjuEd3y
	AMRx9BUTrd1IdVNrLDTN61257l4YjnvSrjMnuFcwTPhALsh28iXxVqKhQA97Ur/Et
X-Gm-Gg: AYBFou2bi2421KrerxCCSbOoy0Exm9Svwj5LwsMQFPRKYN3MyeT5wZOGwM5DO72Pjqp
	oZfA7w7KQaSYDEUeYUkkoNrKv5/UTIbPtwoK87f6NLXKGSN6REg8TkHH+4J9K24soULBx52tQHJ
	wGEf8sVWQ70/Cj6xQxbnYEh5wEtzZkVWrLw3Ip0GfziI4JmX/uN4so+DihJVbyOe4DE6fYP4Sq7
	W9774UvONnrxIkc/mPZ0inglST3Yy5Xf5+5QEccBcsZUsNZ2IThrCf80wGk3ycTRbzr8MGzLK+x
	k02KdbxlS4cY/nJdudmJoqGI0SzD41ib+qcS3Jpr9c4jwQKVxLzD/FShCY+NU0qt4Wbmo00HJvm
	f6oGnKi489XsZGDlNDFGuDdf+op8lDZpWURRqohc=
X-Received: by 2002:a05:6870:334a:b0:475:a1ec:9617 with SMTP id 586e51a60fabf-475a1ec9cdamr20255131fac.25.1788957914950;
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
X-Received: by 2002:a05:6870:334a:b0:475:a1ec:9617 with SMTP id 586e51a60fabf-475a1ec9cdamr20255098fac.25.1788957914497;
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5186332fac.11.2026.09.09.05.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
Message-ID: <56dd264e-d17f-4916-b8bb-bb41af063823@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 18:15:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
 <de0a0b99-9213-442c-ac5b-944a0f6bd432@sirena.org.uk>
 <adcac1a5-6d34-4978-8fce-b9b5a0361b76@oss.qualcomm.com>
 <23de3b70-6284-4c2c-938a-b92d76cdc088@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <23de3b70-6284-4c2c-938a-b92d76cdc088@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa154db cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=iCeh-t31pbVi7WQZdrAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX3S8wferjbaYU
 Ju03Wx0YqACrNojIV5ydt4K8QWm02Hk6WP1OH/sWyxyTaS0PnoZKoQOGJ79MOoyfArjXjj+kaRE
 ZuQTB9NYHABNE9qVMkBFwypsvdaAy8RwsI6xZ4v7GBlMKk6FF0iFw3+YNsDnT+vrh5Jmgt4oEJr
 Dmc49YcXhMBW6vlJoqXzHQq1VKwt2VxqLXRQC8RNUIzZ/SWSiXcCFVKGhQK9UgCwnG3iBYcOzMb
 xKqZH4hkrfBGW7U8eEp3i/W+T/cMObI795sVdxbiZCts3B1J8bBSUKrDCKF2d/v/sEPguyInN1d
 Dj/DmnIwiDPZue5p6GeaQLckr7wKcaqOP4eVKmHmbfwP71rTJAxxobEHWNgEek1yudurDvuQHUn
 6FJ5iN73BBTol9Vg00jdVj5+lSUT/yzCQ+OmjVdwWKIDhSX4s2x0nMXicEH3UziLpu2SxhYItlE
 tjXWbGWAAGr8yFKxwYg==
X-Proofpoint-ORIG-GUID: 6HG5XgJ_RUea_OG1sVIMjXzuCQanO02Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfXyaO1YUcXFdL6
 0cHJNUkyyS4N5lDcP8y08h0YbwDeugleAQtfuiXV2XH4kFe8gZTtRiM8z0cMOU7pDUyxFqCqP9h
 bOCVMbqitoJgiXmtKn7wgfGaCCjPG7w=
X-Proofpoint-GUID: 6HG5XgJ_RUea_OG1sVIMjXzuCQanO02Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090142



On 9/9/2026 6:09 PM, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 06:06:41PM +0530, Mohammad Rafi Shaik wrote:
> 
>> Although audio functionality working fine without this delay in my testing,
>> I seem to have overlooked this requirement.
> 
> These sort of sleep after reset requirements often end up getting
> implemented naturally due to other things that are going on and then
> issues crop up later.

yes i agree. The current behavior may be working because the delay is 
being met implicitly during initialization, which is not something we 
should rely on. I'll add an explicit delay based on the datasheet 
requirement to make the initialization sequence robust and avoid future 
regressions.

Best Regards,
Rafi.

