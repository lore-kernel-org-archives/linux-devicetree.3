Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCC83B6366
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 11:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263999; cv=none; b=M9VtCdGz3ZziR2q2z6eX9di3gI9wg9M3zGqyXoJjlCbscS5svmMquWCsBDQ6PLikXV964UFkMIzlb8O5q1q7kzIJDW/xBhuqGW7k+iZg7/tCahFW/gTTrLrd6lGmBdBed+ScBdSEmHpy4d2+qUFY+YxlBXYko05KJIggdX3UJfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263999; c=relaxed/simple;
	bh=GVX+uKgZiSkY69QpJ9xLXKrIoWR0LE00Wh7L3YdQc04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHqOtEjda/rxw0CT9CTUsfkRh8NsEvgE8Z6+3DfwusGfcOhByaWCYcGbht7lHnt7vm9/MtmFERfYu7X1HapBLHd/tzzwAfe7tYkHXMS2w/ru2xWWFecgIs3cHX/APwG36WBN/V9M7OiQZo20Aw4TSGfQ+jPd6K6et4I/Rrsn5Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xc+Pt34g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQQkBd+5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xc+Pt34g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQQkBd+5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJLAD2241962
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 11:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbIAfwgNrwcM+9NpqKOf6dombn36oaGFfAvbJZilrCY=; b=Xc+Pt34g5O+e81Xh
	S0sTxm7BS6FM1tqwJ6GpiJPJQKGTq+BVIP5GAAwTqi+a4Q53uXk710WxRbFIWLjU
	oL4X1gXyi4VcPz+wcmiy2Nb/90Qvh8Z66kdNPemU5uM1zOBlKAKJhhrzYbqJjZ3s
	p7dH7lG8yLDlD2VLc0/j2Tol2O/JG8icxfINK9QnglZo2Hymz0wOX1aJx+Vj5vTC
	KDK69v9SROn9HvA0G1jPzXRItmbE1U9gNntoWGQb4/m0D7u4orPTzbK3iksTlp9W
	V1XyyWocLS564kV4mgiJlFoJ1qVKTwes4tFjev/LG/EsNarTbC7/emIff5Tsae7k
	Efvk4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm0dvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 11:59:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-938153538caso156406785a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788263996; x=1788868796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbIAfwgNrwcM+9NpqKOf6dombn36oaGFfAvbJZilrCY=;
        b=fQQkBd+51zJE3IAy9dx7ZR4kvZhhOgMdkIlwEveqflaI5e63kcuo4U7leVXk+FD/qW
         poggLfImSrkDvms3c7MfJ0ipgLi3/nwU4wmpb9ef1VkSleD5ZVzJJAcDQLUzngMdjE6C
         pU40ZyHhwvAgz/79x9r0EdAQSCZWwA+Trdg3HPCyWve5ZL7IvRFF5X+Cq24aPTlBLrNS
         VC9YfqXGxFuZcPzljEpzxdHUD+W50o5qfKCFHAtMxL5MXTTMzK0zOaaw8mHNZ4eWCYDp
         pi/XWa2fZXysNVAktSMOAHLlqmfzGp3UOJApDqDVsnO0AJzhx29p+pvxA7ZW+bFM9u9z
         QegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788263996; x=1788868796;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbIAfwgNrwcM+9NpqKOf6dombn36oaGFfAvbJZilrCY=;
        b=EzYW7nBrIbZxt8sWEnBSh1Y1+sO8RPdCrPlJ6SwMvOqpiO80MnddY4WO3G+w7iXbra
         ivHwyToi9w2OTnURz61Zj0vxKfcfSnhhVUR2BnmaWS12svuMFAlgYzx3btnDUjLzWgqj
         HvsJOrbzt6JqvLc8PkGADQ104IKwY9CTKmm+S1fEUgH/trddcwADmRIyL5O6T0h8+6ke
         99aR/5Cr7xLDnmi8gDB4MPXscJ7CQuxXjnc2N4tJu7CDGejvzZhQAmNoXkkP3L4xwwpx
         0xGqCwsWMdCY2DTc9aoCt/kDHXMMLdHwD8tPDlgek8vmzl6NSQvMcj5NH5nj6VqHMF1R
         kzjw==
X-Forwarded-Encrypted: i=1; AHgh+RqyT5ScZvUosq7Vd0t5LzrVk8R5vYEZeXhdD8TUQggyly5xaCXII5hqhbCJ5MNZPGEoxgZU0ZFwLmcT@vger.kernel.org
X-Gm-Message-State: AFuF++nIZFg+5965FP9rHj0XAlf6fOqVYmGrU65AunXdTXxqTY3FEykB
	U1X7s+xlitpliEt16YLEPts0IW0lEwCy96aIaw7ixIWlKuHU6qnUhxH7orlN4yVIlKCvB6OmBNE
	3G7ZVp8yQ1Vm5Sw6lIErEnG8I4ppVPZUc8pWmizcK3ZLkvkMu7NsQ/P4OZ2PFFm4M
X-Gm-Gg: AR+sD11e7YMgg1ad2ELwAy3anVB6vHu3TdqZQqC/vIcesThn6M6IpNKdSn7ZtQQQDyy
	9tU1PADGy/1RYLiZgZTZkPzAiGdTKU7WKhrRbIZdkiMg++RLH4iUgrb4Zll+nb5C53CeXqW4Ls2
	fDy675wJq7kB9PLtmfhj6rjkeeG0u9+lc1ISoFuCBMgKjUK1v3SYYBVyZ1VLll9FvExNhfecBTc
	aaWGI1BbiXKYe0yzDIUZN6ZRAw/6U6k6kaZIXrGHzOMkDHFoSh4vVpxiO5WPGP+ixEJJ6ZIiNGR
	tkpJ0KOM+J7p8OZpysdSnkzXjGBbckXw5AteJxBjxMsXZ8a7HZbki1pfVakaHcNmLIdgDsg0vzt
	ewKQrsbDlf0kFisbW0BOGS9kvfaRI
X-Received: by 2002:a05:620a:2892:b0:92e:7533:ef63 with SMTP id af79cd13be357-939138015a6mr3574238685a.13.1788263996361;
        Tue, 01 Sep 2026 04:59:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:92e:7533:ef63 with SMTP id af79cd13be357-939138015a6mr3574234485a.13.1788263995841;
        Tue, 01 Sep 2026 04:59:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3b4f1sm4012793f8f.9.2026.09.01.04.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 04:59:54 -0700 (PDT)
Message-ID: <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:59:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
 <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jj995xJ_K84ukgnTWX1NbgimzJFewQLI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwNiBTYWx0ZWRfX3ijATOt3Lfqs
 DaoceheKA6vCo59zmGBaebhfW2jkoThKjMOBb+ALRme1pjW9naKIMfpQSQU6aYi0f8MOCPUAJIL
 5yAF4wwpB+XHGZNbRrgIaCMJXt98FNw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwNiBTYWx0ZWRfX2QFvBRr2UNb0
 EGTH4bL1ur186xuw9Kc5EV2I2Sd9Vscwky0KNjRzcpWnIVtPIF9ekwLv7OL1VpgKqC9/KjbTAqT
 Kd+SSKk+pujR5ED+yVYwQFDM7XnW9y85bMz/G3nyBtQWdPrGqzbuul+IC4DIDteq3JWr7WsKo0p
 X0NRjJ2h9fSKwqzAdycHxvtc8824V464GCexgmQdmxPHMPOgceg1+htKvqmVnO+OknALnCJSwdh
 y3EkQSoY+SITGaCs+6NjAYKQc2J4VJIbvTF2TTpcCYOuER59YauzRmHPqFBUKpeYm58lIdc+h9f
 Hjoz3x12fsubHogxV9f+TvYrB+tqSwGb5Gs4A5OAPy+HkR8RYgB8iESPZ15GaBp30F5Kum0FhuO
 qH+rQ9Z3pzvihnTVnbKa9d/BQw24YcCV2kn5HWMk6XlrwiM+eoTNHdzfq52FxEl+mJn8Zpjj5w4
 AJgMpvHm3u3Ppl4Ni/w==
X-Proofpoint-GUID: jj995xJ_K84ukgnTWX1NbgimzJFewQLI
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96be3d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=xeiSTxUpNJUa7veRBZ4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010106

On 01/09/2026 10:06, Harendra Gautam wrote:
>>> +        qaif_cpu: audio-controller@a000000 {
>>> +            compatible = "qcom,shikra-qaif-cpu";
>>
>> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
>> Usually DT binding filenames are aligned with the compatible string for clarity.
>> Is there a reason for the naming mismatch?
> The filename reflects the controller; the compatible is
> variant-specific. This follows the same convention as
> qcom,lpass-cpu.yaml.
>>

There is no compatible for controller and the only top-level compatible
listed there is "qcom,shikra-qaif-cpu", so that is your filename.

And I already asked about this in v1. Why does this have to be repeated
at v3?

What about other comments from v1? Where they implemented?

Best regards,
Krzysztof
