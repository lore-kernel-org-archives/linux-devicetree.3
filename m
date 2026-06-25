Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756192FD665
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379199; cv=none; b=kImDCrc+wcdKpWvjT1G6PczYcohSoVAn640eu+M+6aEFEsmSb/CJtVJcDnSRBOYLAEzRpBO+D3zNZWmDUDFrZiDyddZQ2h2bYzw4PKihYLZAHjIDoVKau/LaatOgx+T9n5Rowoz9tdlAZYBVCcugi5wRXi/+cJJel1LmAKmGm9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379199; c=relaxed/simple;
	bh=hdGdTRwXZUAHBYrQRCnjjNIUVi+Ph8bQ985QztC12M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecuf1pC5BtO8xGFe14iD33Rri4+YP2lXFQ1K8p1wMfDOxaKarMsV6zcnLpwrnxXb/Ya7TvcyyeUWWAn5jIhVLs/CxIaz5MMVOgCnixntab1cfvzMfAVklPKbNgm4QCTLzZi6MWybxDUVocF2ob8Yzwr7ScwpkrgAOE1tNdoWHSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8lFmxtk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zrl5u3gC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8lFmxtk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zrl5u3gC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pUwD1885501
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSocHQi8UJHt7mzffHvcYPaCm4f3C2k+N/a+e3OZkfE=; b=E8lFmxtkP0QwWi3O
	SxHrdHhmhnR8bT4JkAwenCDZqYqT2VtLWUByME56CWZQ0b0oqJJ7Urnx0kt6DfKN
	QsbJOYwSPIkiuFtXJifSyAVPDgw44Zn9YmnLymPFrdUZidv4qZWqlrK9DrYbsclB
	qaDQKVAMFoTilIUGvZIxAqPkg80HOReoM5YCCfxRWtoBc1xMy92bgcmiOi4Dop+2
	1aaA1TKiQpcg6JzU85z6xVDrA5YQKPkACxFVlc3nWz2fLbl0aSdHSJIYuNk7Gvi4
	srnf6GA1JlfuQxrKFm3AQOeGf6jFBXET1Ue4LvZU97+ihRJQD+HA9M1lcBMrZp9N
	+7eMCg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmhfkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:19:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso2247939a91.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379195; x=1782983995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fSocHQi8UJHt7mzffHvcYPaCm4f3C2k+N/a+e3OZkfE=;
        b=Zrl5u3gCDAGtfH2OiZKGOlQiMgiJzcAWVufDiFlro0E3E84//xIyvZVlwGr6TkNb3Y
         nENm25jHMvf3pcO0gNhX13k1V0g50gLvc73vD5s6TK3GXJOffzbc9suWveIU3PmObq+c
         C9PB4k0hwUkYM0NauX1V9irzob937sB7h1AJjmH910SltgmbnnRPmkmlZnXAj1i4ri1f
         lCO6P4SBEPTJj89gj1LuoXalmz77UVA+y2EyLtPmpUzTP+wvYhi2obh9uSblbF+Cxfq6
         GOA2nhrAz6ukFnTgTLa0htm5Il1N7pEtyRcZkDs6sRBJr7brIfjK0dsDQ6fS3uvd9MK+
         n72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379195; x=1782983995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSocHQi8UJHt7mzffHvcYPaCm4f3C2k+N/a+e3OZkfE=;
        b=jspaN8p2mrKVGhWlTDlJ4DkyxWEE1mELVS9Uktrqnv2/MedcXne3rbNsDhuJzde8RU
         u2a37sR/zo3sv6eC2VjBILfn3kGVpJ/wvwbNvvQZJGEHMU1VVMWGlY7deuP4PLaoXtAB
         BjkeBDi1mjJvkRmqdmQNdxlFvS/fv9gZUItmxleikeXJlVmSV/GbsM6HNAuMTieRvs/9
         k6zIn9eGJACVeTXNowo+d3KNUUmpc72+1IZ7VD3Dy1twqC8vtESJSm9NHjigVMXfcNST
         1tlFkCA3g6vSB1rMIX8DTH/Yzvc0dnR2ovaeZdplCA3Dw+arpbPsDiupwl/fq7kM5EYf
         MHBw==
X-Forwarded-Encrypted: i=1; AHgh+RoeDzgserwZwjSfNDxQgBmfB/6VkMUrUiSvHgvI3UP+dTEh1B4/eDoe3jem1zqN5AKeyvSjn/lxZm48@vger.kernel.org
X-Gm-Message-State: AOJu0Yw55LoRLrhx3JdHbzAyAvuWkfgxIPf0vCs/Bq95kZ0Nd9ivLa+4
	GknZ5JDFg2lV//xTftNMRRNs6D1WBSd/Bu/exVvdXjhnXyvaqHZ9bTSBdFVGIQiEjLiUajAccEw
	23QTIaK3hpGWzeYesma29WWZasn5EvZBu/52B+bgr8fw/Hk+Y4MpoxA54WZyi8/cw
X-Gm-Gg: AfdE7cn4UicjpgyQPxAd4BgucCE8z9sOMwzEqMqQBC/bjgl9wSA534PujdVjGzKkM6J
	EbHElb5Ru77BikTGT0un/uZiO6QS5Oxs7+7iut0ewMFtZNGIQUbiePwN0uFfmgtLxD6WBt9ntKr
	Nlfl4gdUiuaPRiQTfO+b3dIAOsk/j/+pWh3C+jKm1Cvnof/1da3LYi1x5Pg3eZamD2m8wjnmy2W
	vZyRvIIXs0emhXWmKs1Lbo2pJjyCY2w9cYGttkggo0yMJKq4VqqCJ9ZLnoEtSrssTJCpNjc/IBg
	TdLXNuZxb2xhLAGWR4M/8Wl9FrMato9V132yC2NLTgRXOySLkWDcYBB3QCZScQurbiWGcbCJMNw
	6O7J+VwQdXe35uVYGzzmY4NkGe7or5/l6SKxkKw==
X-Received: by 2002:a17:90b:17cb:b0:36b:936e:73c8 with SMTP id 98e67ed59e1d1-37dfa2551damr1806963a91.19.1782379195065;
        Thu, 25 Jun 2026 02:19:55 -0700 (PDT)
X-Received: by 2002:a17:90b:17cb:b0:36b:936e:73c8 with SMTP id 98e67ed59e1d1-37dfa2551damr1806947a91.19.1782379194631;
        Thu, 25 Jun 2026 02:19:54 -0700 (PDT)
Received: from [10.218.48.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3dfdba5sm1559548a91.9.2026.06.25.02.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:19:54 -0700 (PDT)
Message-ID: <91fa4b98-d99e-401c-bb1f-f235034f3aab@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:49:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
 <8754de51-bfbe-42f2-84bf-36cc000afa3f@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <8754de51-bfbe-42f2-84bf-36cc000afa3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3cf2bc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Bm-T1vp_5s09-KWsw-sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX3b6craFAju/B
 glGEOzJZ/6lonG5vrOoqntC5TWttZq4+blc42MA6ay9SwsGo9R9QmOWn7xE12N/eIAhbJ6Wmq5c
 OFlkrpP8vnFKZ0I0hiYiiwjboj8cwZkUbAR/LY+hrA4K6Zl+ldE9pUOYOvAcwsSrkC8OYHOIfmT
 PeXevNvcTPsQzWmfFuL5BnxKc+VkYS66f7wOcbAm1WnXYvjmIWXhF1yS0CL2NW9c7miuPRAgcY7
 HuSALqbVhSVhLhnWc2haDtiIPz/Cii/ozuTktJCQZezSlNt7ZnbewXYI4Bl4JxMKx94+yicncle
 UcvhTCqGicA8O8HByYWLPvFBudqYTZSvvoQ52poEPCQDzCLbkq761fs6JByZ0afQB5o84AqXpLm
 pCqEcij7Kt0UuxIvVl6srgmMSuyWmvbbl/I3TO+paBqdv+8/smzkK0oXaAzbO8F160Du6rDBE0f
 Uu1kg+CcwxvWfRxUjQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX0ykO3Kbt0c5Z
 qy52BFz2fs8K99IH6raxOuk/JMP6i3wnuKXnHpHSR0vjhMgli4Y0+3/mq7o9Nvcc6ZEgmApvHc2
 5XaMxhuXVc2uE12DqMptZu+dyMkVK5Q=
X-Proofpoint-GUID: K8laCOFgDSsrBw2XheANkoqTFcYPwent
X-Proofpoint-ORIG-GUID: K8laCOFgDSsrBw2XheANkoqTFcYPwent
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250079



On 6/17/2026 6:56 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:
>> There are multiple statics used. Move all to struct pdc_desc to better
>> align with versioning support. Document them.
>>
>> No functional impact.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  static void pdc_enable_intr(struct irq_data *d, bool on)
>>  {
>> -	unsigned long flags;
>> +	guard(raw_spinlock)(&pdc->lock);
> 
> tglx suggested to use guard(irq) around "the other callsite"..
> which I'm not sure where it'd be - maybe around __pdc_enable_intr()
> in pdc_setup_pin_mapping()?
> 
> Otherwise this patch looks good to me
> 
> Konrad

All callers will be from irqchip except pdc_setup_pin_mapping() which was
invoking lock-less because at that time irqchip is not setup and as such
can stay lock less.

Once the patch-3 of this series is applied pdc_setup_pin_mapping() too
will use the lock as it makes direct use of pdc->enable_intr() where the new lock
is kept (only for v2.7 version specific enable function).

Thanks,
Maulik
