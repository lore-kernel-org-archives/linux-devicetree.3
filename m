Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AB341B8ED
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412847; cv=none; b=FhPabD7FEF7JBnb+RRz7DPmuvqnZXNKX5Rh9N35bTPFbQku3prctxThslgjqw8VSC0Ip+eVuZiOh5eNSpkZfqt1bCs5zXxdrqYo2uaSks6z4q1qiH3K0HIb85RJX/5j+bUB5+dtM35NwjwnzJX81XRYObFZfcAw+U11KQUwoicI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412847; c=relaxed/simple;
	bh=/iSzGV52+3U2s77RWrfVZYZelWGYnoZNGDDuhVf8W5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0XWALX03X7wAFP6tlA6YfePEC6HTKrLBRb1g+drowsSvZlkBAH3n4I4mdd8CSImOUVjqjpJiRhXkt2UmA5/TAM0+fFEElwVutE7IRTZvC3OpcZ/bRRKEohkJCv8eBdEBl0P20CGRvFlYwEGhDTmvfNp9vtrm/zdppme+q6az78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaDMJ+HO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaHyHSPu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaDMJ+HO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaHyHSPu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBWCa01144218
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NtWAH7jHzFcunMlxmfj1lEq54XTtktQ2j6SycD2aU4=; b=aaDMJ+HO1KRcD2CI
	FR5IUteiUFZPJ68QAqKsp970DL03HKkjvsC3WVx2Ukz23MqpsRZ4Y9JNKxfb34uL
	exE6HLAxVIjWCGB/ZIypBmrrKG62CuLDZN67IYN8DUEQW7eNzLXHhWOLIVXym/l1
	xaM05V3FA2cPi637CVxiA3AoVZWQXAQ22mjyhJXD3gxYB1jGIJdRXSQjUdZdMbFy
	+Z0WoFbjc4RgFKQsRiNKXJkupvDINkSP/wmaR9+Xz5Jv0ZTL0kTtyQBdq6vefZHO
	D/e4ptbOGDGKSf49aAM2s3zYwBoVeG4esKGmh5s0zUdRuD76O4fsvzxJfHHvLHAf
	b3TMHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5tvr34v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:00:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so22048751cf.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785412844; x=1786017644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NtWAH7jHzFcunMlxmfj1lEq54XTtktQ2j6SycD2aU4=;
        b=iaHyHSPucIr4UO6nO9QKM0o6ikGymrEdmMIqH1yGu46Wivc9bm13/EyBmnPphpO+RQ
         6JIIzcCz8MVU6euq7bXcQzI8uk0i8G6Kf9ZTzhrudDmGDs/3+KUJ8YecRscg2pUdIdpt
         0dOURtldNPrrlXhPQq0niYjiuZbm2hsgyHphigSzzG6vMDiy9dzigeR1JKvDMwuNzs0N
         xcHvem8s34FfbNGMb2eU61pvVAQH3Crs8KeJz8mlGIqNzx0EiZbf5wa2Pst3WWsoGU3k
         T1v0VlFG2Qpz+NoZqj2BRsi5/AeS1qjwyXTo6NYnQ78q8vXsQVZAZmlrmlPFyq26aAOJ
         1CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412844; x=1786017644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NtWAH7jHzFcunMlxmfj1lEq54XTtktQ2j6SycD2aU4=;
        b=abWR9VF6e1MFCl8ZEgti9PpDKkD0+9z+1Bj1LZSctK5duuPWe4lOo5iYpUwsEhDcNB
         1H4vpWNjzi5TbbbEr4H33Q+WIOko7Vyagl3bMmIJJmfP/jGS8V+al3KDWQ8CrI0uKuXc
         CO+0NrWNwcdslpRu6EBXnTsQhdZQUrI9sU0b9Xk7pfD/aNG3wxSfUCDCsI389cwZyW1h
         rMu18JukW7VqFYivFqxXV9cNJPJLebC0F/4rzfooFAlzS9vpT0BhXr6FHX5mYQM/gbxN
         nW+HL4X5xoINrYe4AsJz4xOlEZViIMm48OwmqjuAjPsBSSgeSXOnGfqRVonnfBepBIZV
         3g4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqJmxj7OzLBCl+AeA+q/ihl7Evjm8Tq16muqG9IA5so6nB5jmmsmfYi1fMCrfXfnNSGGNOaDMKz0ShM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+kgdV+VzvDm3UDITEW0k5bLG36l+nvDNE5Icq7Se0cJKJDANi
	LXMLwj7ubv3ZHk4YaIKsE7wkPUYkV0IeNmaPg4C3V5jfWchVhYadLTQOdTCsvi8ULcUdsk66x3a
	Q0R11MXGzkhRkK0onkk6SDZzIu8i4atqwHoXiUJbBSJOtUCRr0i1Hvj3BsJLkWuPBY9a6hqzW
X-Gm-Gg: AR+sD11tzju7FoOKe169m8AAGKcOyr3IVbkWX3tzwsjGdqKya5LACWjjayIouCNq2Hm
	8JOoP7UfqxNfH+ZohPUff8P/5TmBKeGGUBm8i0W5CxWolBr/Q/syt2ycCxc8fj84nNBIFIpla1/
	YmZEh1TZxDJUAhxx9epkpyRVo3Nh0nvEQ9JQt4GeolGkTMpFcqyMKZmLH5tucozbcMt23V27zQo
	NwKz5yu9TX7FVM+EwxQL2ZbrsDLVCAzgicBzpHDPO/f63IZLhSIFCcWET91bACw94NDP8ffQkyR
	gcA73BTQpZELIOSp95OxDjGnhlKQtykQQxcTSrq0mOX6xYf9rjXKhjleMquJ001G19CVfpl6j9p
	Uk5cYuOxpKBRijoyPUU+ig9OSvf0=
X-Received: by 2002:a05:622a:22aa:b0:51c:7b13:62fb with SMTP id d75a77b69052e-52b3874b665mr22517211cf.81.1785412843582;
        Thu, 30 Jul 2026 05:00:43 -0700 (PDT)
X-Received: by 2002:a05:622a:22aa:b0:51c:7b13:62fb with SMTP id d75a77b69052e-52b3874b665mr22516521cf.81.1785412843064;
        Thu, 30 Jul 2026 05:00:43 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1fa857c8e1sm61431466b.19.2026.07.30.05.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 05:00:42 -0700 (PDT)
Message-ID: <8f41fc3b-04e9-4e8b-a07a-d2837f569b57@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:00:41 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] ASoC: qcom: qdsp6: Increase Q6DSP_MAX_CLK_ID for
 LPASS LPR vote clock
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <20260724141708.2212057-3-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260724141708.2212057-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfXzYXfUPxzq+Wt
 yQpKKeyHEZdT30t3CLxJXFfTNxuI814jUWPuVqZLRwEjEBwpIJhj581oBQJdhwWgMRbpNOu53aC
 htJB4lQ6DEwCEsLQrSmBLxsBhVOYiG8=
X-Proofpoint-ORIG-GUID: 8CJqiCfkc3wGRyXEHY3X51AV7-YMEv96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfX80OlTA67l9fd
 42EbWugmjP8DqqlXf3YJ3VoTS5YsK7HVCz+AiQvnKj4BZZV5QM/oMbrb4tz81eHnBuzICBptRGt
 ulhlxEb1r9iv0hs7SpPYQczA7Qsekb67X5ZfVie90hVjyufkhARv82aEVy2epFlnJgZd+JmjKqG
 kxsUrLwfEbsnjaazztmfUV0brxZdyCS6nEZYl02Bwpszeqcy2nFn27cL/Q4X7USslQ3u6rTJ5hY
 7iSVWkHGRUFWU7KrmxkrCpLyBl1z3jbT2yk+tNekIBDkGRksEJJTISvjWnhHrS2ZPUhKdlGQrw4
 Z1PBF4qYV/qf6PJehQzQALxnaOrAgh1/gllYbM+gicJ2Jg1rVwnkLdtMglLAnpD9wAunp487jvp
 jH4izGX5mJV4M84WQoi3ypNXx28YU1aUKTEQZ6ccW+0LyVsRT5K1iBXaXnM3ipwWCMHnX8vVgrh
 bgcNntySzFxZfA24+0w==
X-Authority-Analysis: v=2.4 cv=ULPt2ify c=1 sm=1 tr=0 ts=6a6b3ced cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_tC8s0EdK-zx2rgeGFIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 8CJqiCfkc3wGRyXEHY3X51AV7-YMEv96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300090

On 7/24/26 3:17 PM, Prasad Kumpatla wrote:
> Q6DSP_MAX_CLK_ID defines the upper bound of supported clock
> identifiers in the qdsp6 LPASS clock driver.
> 
> Increase the maximum clock ID value to accommodate the LPASS
> LPR vote clock identifier.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> index 03838582aead..ab7d20580638 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> @@ -12,7 +12,7 @@
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "q6dsp-lpass-clocks.h"
>  
> -#define Q6DSP_MAX_CLK_ID			104
> +#define Q6DSP_MAX_CLK_ID			105
>  #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
>  
>  

