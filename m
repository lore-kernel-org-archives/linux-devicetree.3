Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7DC4A64E3
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475929; cv=none; b=A8IuzFR4PUAvMZz1KwsmPb8ToRovCkT5C4DHXQ+Rc/PKnjCe2zY84mOYA7H23I5G+rTscnHLj1RApLDfDdYfps1JgJNv2R6RXmMaPG2JJqv+YglcsPWbwrs6B5dp2eN1pwhvC8sYQ2vLw1PcdQy1YuFbu3JbEVWSAeFIAGO6lHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475929; c=relaxed/simple;
	bh=kyartu+TMLpCL1WbkdOyGgGRHw9vqTHR01SIfwa6v9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I25/vSj0yPk98gy1X0gTve/BekKWVXoqhTiVRYwxSzZLb0UYPPFJg//2WFYV/9jjC/4xPfaqCeAF03G35xjVKqcUkZf6kkvOTjHQN4qsivwHHtWZa7ST3z/gN9EzBLGCKXAq03ISfXRskxJTBvab3Dg7glTNcgrVtL6fbAub3Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGEO591F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPMHIYLd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGEO591F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPMHIYLd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h15E2086632
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	To3gckJSL+lLtFYBc12foP5EN1xKQrTgxmIAPgJMM+A=; b=PGEO591FcLUMG99/
	fnQ+jUhO/tzgozvU9My8C3uHW+BQQD0+E9Z0zCGUDelTen9HoHxYKL7dBeEpokVf
	FLuctwmWDKcuwWniju+WFstJB9D9XdqEE11k3nCA4Q97TpZ5lVjWrfmAmwe5pTmo
	ujDW/grERFEUFEhMiQ2fk3wIHtg930N0pYa9ZgEgudF4DamOoNi6BXbtwm0ZCeiK
	uHJzG+/8jyXizs78DSq7DLKrOPmm+U4nbBqePxNUf/eUPDeHuIIAop1PbkICQaFX
	rRsdD1Bs7shj/HwG95Cq7XU/Cr7fNOFwixhg6yUDywVV3fpDJZnWukDAHBOJWaB7
	Bvbjgg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp9fqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:38:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so7644781a91.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789475924; x=1790080724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=To3gckJSL+lLtFYBc12foP5EN1xKQrTgxmIAPgJMM+A=;
        b=HPMHIYLdaPcOkO+mKiG6akwAwYErAX3cpF2jjWeKd7ux6AyRGy7GaogTa6FFF8uoSI
         K+qbLam6OMgHWtyPlMLNOTLz8JRlU9cYmSImCQRids3rQ5I+5SCcqLJ5ziXM2GnhKS0s
         QNO5fXXW/Js50/Lzm8T/du/hkx0KlozQKTKGs2WBn9fZAvEMK8LMTLmS9pEOqaVx6H7X
         0PgGXKwj1ZehrE2P5BHVT+XYcnS4AOOpBK7iUjYRjg1v8TM2cZH7FKWJPQvWSqPx/IDP
         3ZXjtkZe46d8mdeQ9VEkOlkERh2jWeROyGuOX0ve113f8PbCoepKBAbFkgyDVYfnbQrt
         TfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475924; x=1790080724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=To3gckJSL+lLtFYBc12foP5EN1xKQrTgxmIAPgJMM+A=;
        b=1zdPziGdzlv1cJ94j4n2KF6RvP21CKA+vA9DtXzPtUQKBscRyWCrKgZvkKoIle5lVd
         2x6u63vsuWoXcGvlhothzHTnoJZN5w4W6l4hcEWwhByZr6vOu5+fTIFa/dk/Ygx58qJ+
         Kw6UqJtIjDipKOKV9JcoXGz5gZFNZ3jazCVnUHrHAzi7mMLa7iJuMYR0LY9BOPNjEXmr
         tiyrKiXVyymBGgwIRyi7yo3Z2DIimKf86sm/0QtVya2qVn1ExuQM1EZnqn7N/JqYwchs
         0BVbPM+8cqj6B8Aevr9OUqjUzWc1I9H/URwxBt3ptGljWzTxsjywqcofhcBqdakPdc3E
         pgrg==
X-Forwarded-Encrypted: i=1; AKwUvBwoa4quN3S/4EG75RRANHTnwrWiUUtansPG67l/liTs+sTPyi4EEeSpsh7XWDRMkozhtxbACEiKq9lJ@vger.kernel.org
X-Gm-Message-State: AFuF++kg0E9E3Bz7sxW3C9E/fgC23VGi1nbrSfwVs9MIsJ81Dpz9E/mz
	Ns6w5Vb621thHwEFrPT4BVREIudhJofyPMjEa/6T1F5Iin6xFmn008nES4jXIORJmEwMUU6kTZA
	2HEMHAIsSTThM2IqdP1OnLCKeH3j0O1RG5eEa8mw5Dbg/7cMuXeL/4qYRzL35rOga
X-Gm-Gg: AYBFou1Su+NCnHfPvkhBrID1evqjL6E9R4S2e5EjpZlZ4Tv0oW3a6uO2OCSp1vyeqdx
	5JY3oE404+vVPEZePG1UqoSdLysBEJbO8kyVLWnhjW2JMdq0VZAi/Y6IWZ+OfUxpQO+hYZ1KzTD
	tU6sGk6xRIuo2Hw5fsJ5tP7UQqHQ2+wpV2RNULjompIoOoN9yweG9fHPkRxUV912EHBB5vokr6L
	39yvmPPAgPy5kaBGiXbtcNIzDBY0ssgZudBFxsujwb0ERUVVoX1y1H+/qawV1k8/AH1/Wi3O6AF
	DQfyLWrDR/w+xRDl92+i7P9BbKEK6uy8iWXDWnZHxh8lVEME+4P48g8YwJzlP8IVGc8FVjNVrcm
	dkg76lqor3qtpGI3WfIjHpPismSoTgO7Ra4AVpcE=
X-Received: by 2002:a17:90a:e188:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39debf93d89mr17438023a91.8.1789475923962;
        Tue, 15 Sep 2026 05:38:43 -0700 (PDT)
X-Received: by 2002:a17:90a:e188:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39debf93d89mr17437941a91.8.1789475923437;
        Tue, 15 Sep 2026 05:38:43 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda7d765sm5280661a91.10.2026.09.15.05.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:38:43 -0700 (PDT)
Message-ID: <3d5a1cb8-defa-4252-8faa-8219752c59a9@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:08:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-1-fdd2129c696c@oss.qualcomm.com>
 <20260913-melodic-violet-dogfish-fb834c@quoll>
 <2345a7db-d9da-4a21-98e6-e3d622174a9f@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <2345a7db-d9da-4a21-98e6-e3d622174a9f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4MiBTYWx0ZWRfXxtsYtXDvd3Gg
 MF4kfWP5WJ+OPsB6W0el6XNjoWcl2RtjlYwfIFtbUFt61gxS/Z0qvOxX0MKFLiZndjgRINMs20c
 an17hzIaH1Ik65i3TnNPv1UM4eoEebM=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa93c54 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=IbSSN7kqFlyucIwrSVkA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: jBsB4hEI2fkNrvmckl5wKq7FnwZn6PHL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4MiBTYWx0ZWRfX4w4/t8lBaiGM
 UWxLW/irUCPZ4IIQRvgqy5hkj7d3tyxdpL3dapmCOXoaMHg4STdWk65+30qH30hav+bliqgBesL
 BJvw7Swa4vs2gEDjNET2rb1bVONBFd8pJ0GGi7pKPPqrKik0StTmF2Efj7hqUxerkqeuw6SxDqF
 rCcgxQhKmrgnvwM2nA4lNz1Hrk27JZ7Ma1RYeUUqLKfWp0tbMe13VD1owJKalzWydk390ilIh1X
 gpvXMX2aGKg7cjUHtjClqatPW1QWMeHZXTsQy68Nv/gwokWr/4j94bz711kqAy+8u8gAsv80Hc3
 3B+6FKzLoaLyAH9u4FiobTIDgigfJ0xvEvwjHP7ikc56K55WvqEAymIFBXDvSnbBu8qLc2krHSQ
 ZV8vie0ZQ4a+LfE/ydjsiDk37r4J9GI9WKdlnQct4N17uBHJG2gT7pbN4wXUM4IfRXzzT0Iy6qi
 GKys8r7yQ3cwEAg88SA==
X-Proofpoint-GUID: jBsB4hEI2fkNrvmckl5wKq7FnwZn6PHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150182



On 9/13/2026 2:19 PM, Krzysztof Kozlowski wrote:
> On 13/09/2026 10:48, Krzysztof Kozlowski wrote:
>> On Thu, Sep 10, 2026 at 03:16:52PM +0530, Mohammad Rafi Shaik wrote:
>>> Add bindings for Qualcomm shikra rx and va macro codec.
>>>
>>> Shikra integrates LPASS codec version 4.1, which is not backwards
>>> compatible with the already described compatibles.
>>
>> OK, so it is not compatible with anything so far, thus existing
>> constraints from the binding do not apply. Then why are the clock inputs
>> flexible?
>>
> 
> Heh, and you already received EXACTLY the same feedback at v1, which you
> completely ignored.
> 
> So now second time...

Sorry for overlooking this feedback. I had initially intended to handle 
the clock constraints in a separate DT series, but that was not the 
right approach.

This was my mistake.

I will update the patch to add the required clock constraints for the 
new Shikra LPASS codec bindings and address the issue in the next revision.

Best Regard's
Rafi.

> 
> Best regards,
> Krzysztof

