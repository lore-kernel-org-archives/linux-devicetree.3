Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3C62FF65F
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373106; cv=none; b=RjEyOEjCC/eu72iXnE/JWUZi37B0Qr+ecjakbBZReFUVhXBh3MOugSYXU58Fe3bqtZKvrC88hPAFLICwvV05OdW0okCSkr73kV7S3baCr8KZOYkMgm2DITHJ89TT3nVOZT3RwpBCZ6v1Jsn75756kDeIqgNMfkpJx9awUv6bZb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373106; c=relaxed/simple;
	bh=94BLnJu/Y44ro9VZwEjhoTWgcdouLHYogTgolaSAjHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoeWB+eW1iBD8d0XBcohhz+i1xd/Qfm4MUqfkIVY2jbRjGKFh3rWv1yo02dExKeOs67EzdwpE1JUDWnPtP42OF7ufg04HKQBOzB4mqilb1fm5hx4+w5Qj67ukD/i2yiu07XBfONx4SFRkEr0QvxK+DEEliBP/z/rKr0A3Naw31g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrOc8xep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Okj7SqIK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrOc8xep";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Okj7SqIK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P45xmJ994193
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kMOW4i+4XV2WgAdnsOAr0reBkKZzZYazMDcvSB30UE=; b=lrOc8xepROZ3JvYm
	Blh/tVWTxMfrAFsytf47oi2cXGKOnmJTQBAHBS7WDEWC1oFwIpeo+fJAbnHYlUVt
	0NPlZXMKXmMffFqWIx6gYoigCVYtCcnekQxAjj//4dWuFi97QZ9+3+FsGvE09mR3
	I5hug8Lw6ujgZ5XE6773IU8y7J8UG27FOycsotkLXNwxRUR1Z8Uz1GPLwx+50QcC
	iFySBP4eSgnA53OsKtsQlahGfTUkq6lIMLUsBG60NyGscxbTGKZfJSSh941kx8DQ
	xhHUeyl5ZF+MNKZX/6LoWR9f5qOz2li121y+hkS3koONnjTBQrLmVC5cnV8NdMMc
	FOI7MA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q0p9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:38:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-920eff1439cso22923185a.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 00:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782373103; x=1782977903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kMOW4i+4XV2WgAdnsOAr0reBkKZzZYazMDcvSB30UE=;
        b=Okj7SqIKDO9L3OAc+IB1+rUprPjQkrqVEDrXOphIveOHKioxZbhjh7kJYEFcKIj92g
         63bbHu+Z2LJQiWFqhfhwE+aHleAOK5j0p6vD3jIMeQPnrLqANFJgKa9k9fCSyJVpInue
         VR6SDKln2fX2qpZltkQLkdfp5TYqmhhwkZyc5AvQeHQsloPpd0SoIcoMRz2N3etes+FR
         byxTtyc+8C00d3a/OHb/E4poE76ue+IkCzhjrCPPTHvHiL1bF6eYU59mycsiZqsYY+Eb
         Z2QD7QUzUh4gAT8lgL/yDVuRS4kSf+DUWfzGr1HJO5+6/cL1tpmwhEstaOtfhCWtdNbQ
         Hamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373103; x=1782977903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kMOW4i+4XV2WgAdnsOAr0reBkKZzZYazMDcvSB30UE=;
        b=HGHSCtXbOq3NjkQREK1U4jSAzrS9gus5x5VtdHXTWeNBwDEdW5zbvTzl+pg/Ob6mtJ
         3GuDc9ns9Hkiq7/JPi2Y1m4Cfgz/rSOcMRG/iABoVGWspq/iL8S2ndptEdVDpHVo4Tte
         bPjrYXQ5Fp4wiKw451D7Zgg9rv1XTyrCQVxf/6GPmbQl5Qt096bH8ZpvDmpoIQJgaIyP
         RUPVNOebt0Dm4a27/Dpend62tP8LczId130luw3RPjhkrj0JBNJLuqq9Y+UcYVSTmKfo
         WRZ5okvdeormzlvCGRG/3hLFu1awCJDeirubJH2HzOmKWfqVbwKkicI2QRJnDf/MkwNW
         qwaA==
X-Forwarded-Encrypted: i=1; AFNElJ9v6V/1CZAAX0cDoYFXohP7qAPx1hcExHfyDGK1xTtR10DEZ+LLywGYsaBdJUC0SAHZsaD2zDxcbbda@vger.kernel.org
X-Gm-Message-State: AOJu0YzRcRsvHj7ZH8Fq1OKaIMQkdG0X5WM+ADMA0Pw4zdUyHEvzDf8w
	XLkNBAdqve8KcoUhUAohUM3IkJS/htmXAEcKSU9VSG2XZ91bMe/GRLdG9ZgT8FQH64JoQ5qk2Bd
	1JYH9G7QYw585QcLy6MTl0gSeLptgQIir9zeWoS8L5wVpVBGnuijvEcwmKP1ajarj
X-Gm-Gg: AfdE7ckdoRi4KEi78L4Dh4Qtb0ltEf6FRuV2pllBEgxKibDHIFen5WwMC16N/CkNZ38
	O3/I5FFbeKTcOB1UcDK9mHdjnk7ZD4AGxGR5E9m+dyUZeUj2D4qf+50Ovg7sjunQ99MUJ48NsEu
	VVIdJ79B0der+CTG3JmP+nIIpGCUK5MEMet2N+73tffH5H6qrxUUyWzUufOPrMReU9LA1kja1Dz
	J2fCt02SEX9PWljWVK90xO0P8owi0VlK7pf4t4UijjvtwvB/xJwg556xQb4J+Yl+pJowaOUGaLm
	9D24CnIMQZCRSIbwNQNUutn0RtylFbK589g9BtlnHELj6UZuIAt9UsfPr3S+93otADDGTgK/OT5
	Sdnqwik4fhGRJJTW4EEPnvKxbrmBhGSzH5Vk=
X-Received: by 2002:ac8:58d3:0:b0:510:144a:636 with SMTP id d75a77b69052e-51a72ad2276mr10886161cf.8.1782373103373;
        Thu, 25 Jun 2026 00:38:23 -0700 (PDT)
X-Received: by 2002:ac8:58d3:0:b0:510:144a:636 with SMTP id d75a77b69052e-51a72ad2276mr10885901cf.8.1782373102900;
        Thu, 25 Jun 2026 00:38:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbedf971sm120256666b.62.2026.06.25.00.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:38:22 -0700 (PDT)
Message-ID: <ba15ebf4-ea95-43ce-b612-8df25a9f179a@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:38:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
 <65873506-1a9a-40ec-ac67-60f61a0b4b4c@oss.qualcomm.com>
 <9bc524b9-c6da-47a1-a7cf-abeb131416a7@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9bc524b9-c6da-47a1-a7cf-abeb131416a7@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: asVqfHTY_NCevvXc55be0IDPA85cr-v7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfX7ziwm/0URaMb
 Uc3LQx97WksDFfjGlTbtojbmcNudd0b1P61DJGZwFnr5KZl+07Pp6d4NDoWn4yXxZJoTFG0UFnz
 5bjCEkHlFJLdP1K19FoKoqgsNb4jnLs=
X-Proofpoint-GUID: asVqfHTY_NCevvXc55be0IDPA85cr-v7
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3cdaf0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=yUEngxm9hVyLX7FlFv4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfX2/0RMZ5nZ4gK
 iSRo9DaD/jJ6EifmTn1NxL/hk+pnILAY9apT7Dxw99snsf8I12gE8/jZMMkaGWk2bgkBBqjfWNi
 gx5gvNphPPZYf9oVjjMeHaecZT6ARrwZUfsvNUgmOoyQnDK5VtAYPGDg79/AL5u0YzM43ClmJC6
 jDBCibZepsQ5rSQQnRF9yAVXkEW5YAtTKRMqMwOiw0jYkHj7UssrZ0CPUuSAk2n2y1OEpbO4DD+
 zmLJ7ZRFzyBIS/QL8WmnSpZNs443glDPJkN+jGXvZ7+HYICO3/r6lgz5+FEr8+bR9T7PEZeezEl
 a8Sj+35cjkAE2dkGYdoByfeD+5Ve8T+ibEzB2u2ql+9iqtaIc3lAdzDwohmKw27Kb3Z8vMjtHCJ
 kPT9TQacsR6DXkN1A34DFF7XxBj14NCqEqkq+dQXZSH+OZdVVbvChuEZU1buMwiTrNbYt0w6Ttb
 mb0qgLeXPU6ObqdYy2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250065

On 6/25/26 4:22 AM, Esteban Urrutia wrote:
> On 6/23/26 11:50 AM, Konrad Dybcio wrote:
>> This can also be fixed by migrating to use qcom_cc_driver_data,
>> which takes a list of alpha PLLs to be configured, and thenthere's
>> a switch-statement in clk-alpha-pll.c that always assigns the
>> correct function
> 
> If this is done, should a patch that migrates to qcom_cc_driver_data and a
> patch that fixes the issue be sent, or should only a single patch be sent?

It's fine to just have one patch, but please mention that this
actually happens to fix the issue in the commit message

Konrad
