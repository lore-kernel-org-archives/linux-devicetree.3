Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576621;
	b=iC76GREevGw+OIZ/NhNOLIrSd3/PC9Ii9a6k+qJ/vfDc97CZtlAOtsyNhuYQl8vE8cYi
	 l9DZnkdG5ioTc6sYptTMnJdc6zMlu4qhjZwyqFtsfdSdPGIjuAGRVgv4eHkgcL0h9auvk
	 ZcErJgZBA09dE/8zBkPgdW9cXWIqjhO1GHKnbMXTKoAT1pPlYmlBskr40WyyKFhBAye/W
	 s7T7fJEXMteuGGAGlHV8ytM5fUTL7rwwexEDRJbIVgExhzH6wZ45Am9bvL2w5HlB54HJ9
	 HCIWryog2tGMdbf/ctP3Yq4UTJQRE7/KgJvcefoOHivEuoE/60Urbmbq9jhx3H2sq+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576621;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=;
	b=Ymde+/Vu0V11JHkmZnv632GHY2PnNaytCY5tOWsqBEV9wB6DdXyPLBlbYfpKfVWAo373
	 EjqFcHjSJeWTGbCd6v8o0NyIYJFnFMsRVpQpf6UmctUmxBLT//Bh+yeSxWMEGlZnSP22l
	 lPXtFssiMKOJNm2yVkA7TffxK28UXQWCah/kxZAddPoTIl8zV50NitJtuLvhN33m+zXfJ
	 O8lHBE3EYa9ULVFsM0UQ1KTGs1wmcHgzl5pRb31f7mLWQQHImeFNn6zXYPqjFtIO5Ow9v
	 eDRfIszxfr0WDAUUtLITTcAr7gkY812HRrMY5DhgCZzJq1580TK44mJEiD0EMSB+80w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxntffuu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVZ6m1f2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E88E606A328
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E88E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxntffuu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVZ6m1f2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0rl756348
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=; b=kxntffuuGMwXjxkn
	gOl0blnyh5KYfX6lAiuPZWEnEZ+wI228RcmeF9Ft8brzaJuk9IVb/814q244u6TN
	gja38tjFsMUFoqKhWFnJ7jDxENiouEG7sdfybPrUBkzpNIl3zSGcq0IyEvMD6399
	+qQMm+0NjW7c5uzqS6f+U30Fe2e7lKuvsbKczcOoXeoFMXigll2lazoR88CoQehj
	O6yQRbieWHV3xhjCVhW+vW6ljIgX6Osemgq3zPF46rbjr/mq02+JrwTBLFZn1Q3a
	K0mTkor1CmAI+DBzshIeOTJYgfBujdIUFj3cBSz/7r5n+aowwvvhNNJiwDAfmrCr
	ArcXqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ub07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:56:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so14096885a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576619; x=1793181419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=;
        b=NVZ6m1f2CGeIazpdKJhYEdF/4UQ0nQwMco6apm5ZPN/J/a+SveGWrRecDxqtNPxVWF
         /Y/iMJ688gC6cUUsIo0ZNsz1nO6E/gvLSwhenzAqmyX3pPHKdcMSDyPQJsr+9g6oh2M/
         ZtbEyfNskPbd4u1i8fGMNczcn06s7ArUbAX3CNO4XntKrbFZYg2716X1+glgu5QUfxvZ
         7w12sG/v3mIQmd49Iu7dWnyBwzw0EiAcbclvVVMlxyaXYZMaQ0dgm2Zg/lYGvrMZMdJM
         Q6OUpQR0JQEFiX6ZmNZJ2rG3OXpctjI8KqZoMwLmg8Tbyu21czVmM//7JxXhLMwkVHWG
         7tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576619; x=1793181419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=;
        b=OnUIx+Tl/En7OC3almt4XTTRuOvepWa4tcpGiTq9ZugGzWDI40KcrWduDTvr2PkaQb
         gEtLCEMn+CR06fy4xmrQZTD0AMIcy9rSV219hT3vvpoHIZdgFyp0ZWr8qWySCeXugwmG
         tLM5OYopBBaOAToaIddS+Cm7UGZ6wLCUECk+ClYSRWqCDT0gyANSqvfucrV1Itlvs3F4
         Um2GsNT8cUb4DvGowWUiuroz/EeopDURJU/a/8Cb/MTlIOVedPqO32SKAHIMYRYcDmDk
         vX7bcVw6tLRgeYZO+jGCXIfWYATDccqZMdELA1l4BNQmGyQsN606QpC6MNdN/ZCPsiJi
         ODmg==
X-Forwarded-Encrypted: i=1; AKwUvBxStXKveTHH82SaKHjCP1McWinkKVJQgqrKHR0gWya9HBtulkr2+q73SepfX1OyZ5E25dZAakPkeKQK@vger.kernel.org
X-Gm-Message-State: AFq9FYJdzCtDkg8iHrJLlyIYU3vPabSsYuiLA4IZConUWEHNYUxY4lJo
	BxR0SHFj5wG9B1sby01SSnEnjmWaEoOvyT+9VvacnRU8Wn6EeOQUm465GjILFsnrojjkGgG+fGN
	bxtUpCn3M0ADo9/YEkKKlgpaiTO5OGTDCMGihhNVnCm/C5Ikbgav0nXKv7GYmCPHd
X-Gm-Gg: AYBFou2OK5DjBsGNEzzU2g/qeFjaJ2FDrLRXbXkjFGAk8JnfXM0vCKHnuKJ/UUqUO1Q
	TKeliaXwIwGfWcPZLlAjtFMGsqW4vyI7Cdz5dlQ1rNlnqflB4qDzIz8i6TZMqzWSB3pw7GmcSxN
	QZo+LOcQPGwJJNviAjMhYO7jxrempShEGUGbCveGoKn9wxeySeSF0/pL1XY95Bl1QNpH3J/6H4o
	bn8K1niLbqEbRtJyUNfwdEnAc/G8hHP8UTgwRMEmloeqBfUL0fnXSJnwOWZErk0F972oe33tcLZ
	PDQXQlN/GD3L3xrU3OvVHg8V75F7Xy9BMZOUe3mZ7lwOHYPDSDY11Lob+9C1upt7Pxw0+LMVVQp
	lfDe9BsYY36GxMVASJqmK9w==
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr380062285a.2.1792576618779;
        Wed, 21 Oct 2026 02:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr380059585a.2.1792576618283;
        Wed, 21 Oct 2026 02:56:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679035df0sm60238066b.84.2026.10.21.02.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:56:57 -0700 (PDT)
Message-ID: <d4349c3b-f6c7-41c1-963c-ca0e21e2f436@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:56:55 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 20vfW9BrjA2U5gsK1R5yl9QZ3XfpawWW
X-Proofpoint-GUID: 20vfW9BrjA2U5gsK1R5yl9QZ3XfpawWW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX2dOtQk4zOXOf
 /kZtilqXgL0fUJqn9T/3cZwR5gfaCC8JFLayj5zKExD4gM05567nUpMNs7inta3LvRCRHLI5OdJ
 7DxZirq68ZIsLfvK6nxt7Av5gB1Q69g=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88c6b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kut_hORSmwJb1qpv2dgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfXy4Xu4C/AgNz2
 Z/fYGQavsGK4HV3Ro7P0kZcKvwFtMQR/D6IH4jyySG8vBknK4OeKR3L599Nbig8m1iEITBBvV3v
 rYX6xVCWcOClI4yVELYaha4iJ/aHx9YEJnnzALTlfjqi0v6uJ0mKDamtL//ZXMqhcUqDRPl+OcP
 AtMDN21MFe3Hl4iK3U/x5HgXs7U+pWtnMDQPFxuAIigKP+sIgwFyt7kxAp+XJhtXiErVN49hDmh
 wvqpcPQ1+ERSS8T9oZYm2tVLRbiVtYUIL3llxHmDLi1/3iAtKjKQuDThLTHb4QE9G4bx/ANfcch
 USw1rqjfRLwOHjX1rCOZHhcez/CYcHbF9qgH2SbWos9HbIH8edx4IJ9qElq9l9ixwY/XjHQNJ7/
 vNtoedfYeDk9ytV3RRLYZkQiskbJDbI1T3UdXQujjPUZb8UNYYGu7VMc0rEmz88LnoZ6lNpICvp
 TsUcwiE3HyNqc19eZ7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039

On 10/21/26 9:36 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add support for the Qualcomm Nord SoC to the protection domain mapper.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_pdm_domain_data *nord_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd,
> +	&adsp1_root_pd,
> +	&cdsp_root_pd,

I see 3 more CDSPs:

https://lore.kernel.org/linux-arm-msm/20260929155152.1898666-3-shengchao.guo@oss.qualcomm.com/

Konrad
