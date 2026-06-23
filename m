Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7294534BA50
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215784; cv=none; b=QtgDcqwAn/SVuTt70YvCdlE5SZpJSA/7qXIAhT6tJHPtjBk52Ozai+okM61JTGuKpQ5W+2zFBb3IqTK1/59qLfefLsGvDmIww5zRQ4FYiIXKYxF5fS1iujaKZUf6OE4uZMw+y6MTBs4ZbsIcFsiw3byn/ObZ0rFDjqQcGwRbSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215784; c=relaxed/simple;
	bh=mb0nV6kp27pZkbMkkeBIP49apYqPDzG2G+UJV1CUmO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GPEjNSg6JJkoI6MwBeaLQcJ/N3Y8INg5jUOJTnx0qweOtHp90DBrZBbMU9Swmd+5FpvoldkTlr4tXiE88NxyQ5k8mPeZL2MR9z03IT0K9v1qoy50vBDKCqkprnwaOe78LvijCd1ChIJl5+nFWjwJydYoWH5N8CnkBycM6UdfiL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LjB3YbVL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKsUOPLx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LjB3YbVL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKsUOPLx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZZAB134203
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAbdESblIDQ1bUfccDE2jT6dBESN/EkTJNYuuetVzfE=; b=LjB3YbVLlQAh7J7q
	g44YGFRiGbJjdpKDSJC964/JONqpLVeVE837rFCV4M545rcDHUzSxWJ/+kcn8DYx
	9QN4cxiOA2/hnLvCnQOYseWzEbGsbbBJfS4SG0a8KfPtzHWgHmltTWNcD8wkXSZi
	q09ZCEMoooHoOMev2K/5Lo6tI0W4vn65Zw49QlO4/uytpSTsr7MkZFYq4ETgBdEL
	lRI7OZJ9Jn10XnYCIVdQPEUyDDFt17ZcY3wYbOc9nmhAw/jxpkTbFKjuzABegLFS
	SFYC+Ykp23Ke9tE7XZDtmudr5Cb972TLalrg3DSAYlLhKQawG3HHdVt/jlogGLrY
	rel9wA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr320cv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:56:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157d38ab37so526280285a.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 04:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215782; x=1782820582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAbdESblIDQ1bUfccDE2jT6dBESN/EkTJNYuuetVzfE=;
        b=NKsUOPLxV7bUmK9Slmz8XJGj4erih3bYGlETEevMEINYwIsPIQEIDXby0h+fVt0DeM
         sCVDIZy7iNZLBHyc7JVeHc+WnL6quVFjQVsaVwwPdgx+XYIfsiF2zxxycyA0JPBxn5zE
         oeuxKr9w+fV0WysGyAHA2ezgdhPT4sLeZ30kithDYJUYksE2rYGkMfY9zHzEGGdUst/C
         kpi/WRbIi7I3jbZbEu/zF1TocY28RXXM5bOGZ83CNGdtobkOb2QVl3JTZ5W53PVdygGb
         Vs5V4J8/J8m4A6jGKv1XuWaDhD9HJcNTK50N41ltj0yhqf9PC3aJwahBSNgjbRGgyfn9
         afeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215782; x=1782820582;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAbdESblIDQ1bUfccDE2jT6dBESN/EkTJNYuuetVzfE=;
        b=PbyT3ilh9guZ7tmBxgt4IN9HENZJDiYzEHFw9LbW71PySc1LBzKb8HGy1wc/kC0hKI
         Ph1mZV3qwO2gSB0M+csat+noWQDRTf+k/MlAe3IZnrZG8GIZmd8Oy9jrYZ3oud5V6S7Y
         BLdufe/oEz7dD/PrE6uJKdwv7gFcoP4En0QuCWgE9ZYqcyA3E+ISm/iG3hqMdWdK8z4g
         KqYPitoqSUCNlO5pYAThwe0YH6EqDuLIaY0nal9oP0TtS13ZL4iAay5gJVaUJZuO4MNK
         l6s9zS+Fq7VwhO1Wyf8Vwvsno6Tw3itdYRmDQzqEBrvMuJP0RrHTu/M9OBIj9e+DR2ki
         IXfw==
X-Forwarded-Encrypted: i=1; AFNElJ87ScynfR7rcKSuOVdJaA1IQdv/zNgaa/7n3RvYRhVStF8L38gl90I3/3D99zLfp5OJ6w0svXNrgQmR@vger.kernel.org
X-Gm-Message-State: AOJu0YzpkvaYmV+lpCOYSBpMGSqdcq8W4+PujWemQVgIenqftSO2gmmx
	3TAO5yYuAYcFwbzvoK/BzS2stmelcbwxkfgMIQ5m1qI4IqrwHJDoA8CuR62P74KVW9Y25D7IqYQ
	arxYWh3c1rja6EpWgrphQx8lfX2rl0TBvsCHPFrdcRCdfyvFd7GjlTW4+WeiQpG55
X-Gm-Gg: AfdE7ckL/LMlGz9tTu8rxbHlkk532I88eXLV0f8y74qc6iht98Y4m99R2zpWJHW7Fng
	z+8Ww0uXQEPCoqt7eRhmXS9TpJj6bnc7DQCU3w9CTbzaV7mwnytHYHsm8zEmJl/V8Uz4bhU4diP
	rP+/JSH1No5HuVGs53sNuu2iHbKNfEgQB07eeqn6R+M6zGVz2QbQzzQpsXFlL5dnpD9O8WYolBb
	iqBQUZdnj0d8OKp1ZjSFzsK+xnNFA+6YtA5bqZ2Lw/WK34SMoH04qgIIx5Jdp+8rhs84sz4ITjh
	cuO18UPotMze/bn/EboIzPg469UZcB/C6DZcu1X07mauhC3U8iUfycJUSxRutTQWb0sjnrjVsXg
	CtSrm5EVGZwPfAgmwyHAVK/yiDSE69XjenoR7PoIO
X-Received: by 2002:a05:620a:172b:b0:8f0:7516:daa4 with SMTP id af79cd13be357-9208d0fb9c5mr3429999085a.41.1782215781735;
        Tue, 23 Jun 2026 04:56:21 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:8f0:7516:daa4 with SMTP id af79cd13be357-9208d0fb9c5mr3429993985a.41.1782215781285;
        Tue, 23 Jun 2026 04:56:21 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4e93sm37784220f8f.7.2026.06.23.04.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:56:20 -0700 (PDT)
Message-ID: <43e8f92a-06c0-49e3-b58e-63fcd0543ccf@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:56:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
 <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
 <be95b95b-dbcb-4b80-94dd-a7e97ef4c446@oss.qualcomm.com>
 <6ad8d604-b04e-4f24-b616-980f0e18b4c5@oss.qualcomm.com>
 <3d24b1bc-baca-417a-8f60-a060cab5719a@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3d24b1bc-baca-417a-8f60-a060cab5719a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfXwEpWTzKwtqm1
 +v2aNwWr1zm5YeuNTkKy2Mvppvf5dQvNDV9eUylvc2N7vOi5DVgotRitaf+5PjPOSbM6T9iGmIu
 NGFKMiGUyoU2eHD6WS+32MkVdN0eipw=
X-Proofpoint-ORIG-GUID: Y5ThHhh25Sl6JqsIxFdFALhCvhag5or4
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a7466 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=VKjXDLKRB0JyiGnRDKIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX2rajxemhZYIt
 80XhTcuJ9JItP4au04fmpC3iTG7m8w6zVyfuHoNuO2Qnl3+RVwWVbQj06abGACslFIR/nFitAQu
 gSBFlui05/0nma2A7nenfaxkM10Mx4PVZthExBt5DAfur5LXzcWtG7EQko7vpJXFkScf31oNiXX
 WSjh5G0bIkQ+RU9Fl3j2KE39c+BBbO61RlrtdlNci7a+tGHHNbEGOfwZZt/kg/LhChNPUWO7y/2
 IBTuGxUgO7JMXWuI3kQYd1EuNLFNq0bLYRvZp/ntQQPXWxX4/2OoUrj4/cz5Vmens620A0oA9Me
 MBx1ghnANqYDD+T56gKwicyZpdmLR8dYCBMV7WJPOVwTjfpUJOhoNkNs4jxubbUJdnpqTzPcNqC
 N1JnR6/F7pRzo+/xWGYu5b7GeU3kLe9ikdtVoms1v4DblcBKhUEWp7au6jfB47nPCxbGSSo4+W1
 bBLc5bPfMKmPf5SIVNA==
X-Proofpoint-GUID: Y5ThHhh25Sl6JqsIxFdFALhCvhag5or4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230097

On 23/06/2026 13:43, Konrad Dybcio wrote:
> 
>> My warning probably can be fixed same way as:
>> https://lore.kernel.org/all/20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me/
> 
> Quite possibly. IIRC Mike Tipton wasn't a huge fan of park-at-init
> to begin with.
> 

I just checked and it helps here, so lets abandon this patch.

Best regards,
Krzysztof
