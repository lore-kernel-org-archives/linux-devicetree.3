Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A972037F8BC
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255097; cv=none; b=XQyzVAk7+pxCFxeTWmqlvVBeUtli2JnhXNepqo2pTDgI2nwVBjkseTU3dSQhREeyqjePiYgHEXEXkgxQPjJDMDrxPJwVDD1PdXFwhteWThSpJLjvcdeNUZc2YQaPPfkir9qtuSn80PyFHegchnUrTMfMMcdY4GbeDxJf+gNe7UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255097; c=relaxed/simple;
	bh=8kzVoM6o9qpgOFGt1B12fL2dLI4FwShr0tuvnnZ8H4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rnNxCidm7KCGDAaUIcGwo4KvZ1fBvVIFpoCiicMHLroopC65r6PmOWuAdi6hlYsGgJEAC9HrflyYZCwdY02Kab7RsIiyPjn/4NjlD0WtFF6+sQcpJocMbOxCnwp0RhrXGYpJNzuEQBO9Ti6qv295SDggkfmbiDxYKXrADT73FaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FoHESl/i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxiXrpYe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FoHESl/i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UxiXrpYe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N76ZBF3294366
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yJCm1ivRWw59rXo6havBHWKC6TOWE/PIL1cdCQklq1U=; b=FoHESl/iekbhs8EM
	bWR1X9FbAh8NpooDOKPlsbsv18UO4XXHK6TTdhSF/g13oIzbdUEVt1UyltliKej+
	G5zEdI1VAYOMN3hcRs9NKZhbqlOSFDpaqo5LU7RFoXsoE+i/6Jf7DBuCGVZfcxh5
	+BQXkinWcPlkTJxnpYumezVbGpLB/cOfk0RYY+uU0+6dYr8h23q7NKJE5Kcl6cxQ
	CzEO/pwJERuFdr8c7adNURWRD6Ve/3KLK70d6zb3aRIlidp42oOF2JzZsKv0hNcr
	g5JrfSWqG91Ar1aP6ccSk7mCa5QEI4yEfEffewMVquflZFAdHJZdWKrXvu/3a0y9
	vqJekw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jfft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:38:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so312693621cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774255094; x=1774859894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJCm1ivRWw59rXo6havBHWKC6TOWE/PIL1cdCQklq1U=;
        b=UxiXrpYepRCgvQ8cQf7fkd3EA+qaYFCchN3Tveb9H/WoHk2Arzp/mtKUmSibz+We1R
         MOLUtgXJhvQLJEunS44fdir3d5l+uq45s0smDoM7uB5dEX/gESLYMG/madOx5NJe8sHh
         deQlODHZKIcrjsF6m2W/E41t8LEG1v0UpUDxiN5qBaQzdt+IbX2+lbHYSD0JaPbqwIYw
         foAFOJDukbZnoSpAUgXFynU/uJD7/7TQflk0AMDbH7eboQ6f7uV10I0LOM5MiE1KsVCp
         blKGMN1zGh4zyPG7HsYyrdT9j8ICZlP8pI3EIYe10RaY028HDskx9d+KzIbs4QmzgK/l
         jMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255094; x=1774859894;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJCm1ivRWw59rXo6havBHWKC6TOWE/PIL1cdCQklq1U=;
        b=h2DLSfhL+aUTTgoeq3lcwCKWl4S+1wCHExD4U19UiMO5gTSWbuvWnsoeGMND9/sAsq
         n7KaPqqP7nuboWodz05U36bghQhh4RpANpYHc9THJroVtBivxkpgp9n0x/s/wpqv2n30
         Rbe9uqC9rwG+wSXzr1qU7BWi54mrmerWZ/Y8J3/ocuvtDeDiOwxbvNsYpUhtU4/C6Nmj
         Dh4+O0LnTr54/bQVt3Bv3gvWjJS0dCCb4ZuZeFsz9hOQjEhvcZfLtFvNzeEg/4d4k56m
         uOAzcsqpzKnQmUnMfvtRKohdpUjGkR302d029vXGcVU1vi6JsoJ182ltFH4+mZ2WTEcN
         YKpA==
X-Forwarded-Encrypted: i=1; AJvYcCXrUdyUJbJm3rvzEUgYe7/Pjc5ymzBrhznVUAtlOTHKsX1X5G5kQUAKFJ81TT9aDxSyLVH0XrXCq7sX@vger.kernel.org
X-Gm-Message-State: AOJu0YyhygfBWthsE6ueRRWSj7BZaLjotjY+8YTb18qAaLncm5WnglWc
	/ivfT40Ih63JMvlEOOdbTtOpxEdqt7nf1azCvRCdvvMd6NIbkZrHCarnCoI+2UZpkBtB4YUu9iF
	LGspzyY4VClmRAXVu6NVZ84jTe8RogjOdfl0lf3lwQ3KM//RRAJBahkA6FPT2usz2
X-Gm-Gg: ATEYQzxPjAF07YHQECgsPdYg2zaN3tTfuZRNEKko+CHQ0rO/yDJOABZCZDOP7U6sgII
	5uVyOWN+Z1BY/b4Wz2BkfeRCKLt+g63LdLc8uorEAephNi31+4hWaFFJj6fCefvTv+b2abU5Pg7
	gEqZOP3pgElGlAiM9/cPbx6/adwicaCQdUCnFF42ESmQEx6d9bv0yprMfrQ1jy9dBh3vjdn0ohz
	xVBwI+4TvK9Mvaf9USMlAx2E0AZBUIQKDYnd99vLr0MJPSlugSnEn3ET0lgVTtLY+EKljI5sVtm
	E3nk1kJg8kmlciEhmZsEtvcAf9QGCqhEHw6adcB3lElX9IZKrSYYxc2eRUVL9tRoCbLO7sxNyB0
	Q74dwrxcGXRL0yGZEfKZwbeYj7g/r/+2In1yLkbehl+yMzTeG
X-Received: by 2002:a05:622a:a6c2:b0:509:10dd:2c88 with SMTP id d75a77b69052e-50b3758ce85mr153667761cf.49.1774255093859;
        Mon, 23 Mar 2026 01:38:13 -0700 (PDT)
X-Received: by 2002:a05:622a:a6c2:b0:509:10dd:2c88 with SMTP id d75a77b69052e-50b3758ce85mr153667611cf.49.1774255093488;
        Mon, 23 Mar 2026 01:38:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm264268295e9.12.2026.03.23.01.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 01:38:12 -0700 (PDT)
Message-ID: <b0648931-9194-45ba-ab44-c7ef01c75bb3@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:38:10 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Add missing clock
 constraints
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319092348.35237-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260319092348.35237-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2NSBTYWx0ZWRfX8ndIfOjkpNz2
 Dss+mDP+4InOBykmpOw1l6AouleSmpuVSxi8pywCQkBEJpv0h6EZDqf1yCDgyph/ZF5Mo1U2LMa
 UlAcWTHuMh+2swgQDd72HQ1j2Uwoi/mtce0a4AOBZifaSXSFPHylf2vYktvG0s4DKKBlj7GI+sd
 Bc/sjyY5MQLd7iYqknIJK8qiyx7/nsVrFOcyBqL+wJFzuGp5CSQlepJghDtxtXFzRh9pNOQh859
 i55bUcHgjcaqT+CenDBD7WAxle0Ct9UyRztcFYYlLKDwhHWHyK1nQa96UsQio52DRH2R2FdfsKV
 H+c9j8XcYVE5KwO5EepIm04ZJHr0+hJ7Orwz/Z9EiD0XpXhcAU4diTS7GS/chnbV7nkBt0PiNp6
 mocKHy+XsJ2l4NM00XOznafMmI/N+2pEmXfBl2UNjV4RjLQshvJduPsVB69ucCVSKL6tSL2y0E+
 +8u6g6k9zJPvAsdQqkQ==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0fbf6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HlYX_D2uYclbSZztjBUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DR8azjEx6nMvGa7rnflraM5_dWkINSvx
X-Proofpoint-GUID: DR8azjEx6nMvGa7rnflraM5_dWkINSvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230065

On 19/03/2026 10:23, Krzysztof Kozlowski wrote:
> The top-level part defines variable number of clocks and each "if:then:"
> block narrows them.  It however narrows only the maxItems leaving
> minItems undefined, which then takes different values depending on
> dtschema being used.
> 
> Recommended style is to avoid ambiguity in such case, thus if top-level
> part has broad constraints, then each "if:then:" must specify both upper
> and lower limits.
> 
> Add missing constraints, mostly minItems but also maxItems for one
> variant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Apologies for sending two patches for the same file one after another as
> independent work. I do drive-by fixes when doing reviews and usually
> post such fix immediately.

I looked at Sashiko review of this patch and it nicely spotted more
issues in the original code (not my patch), so I will have more patches.
I will organize all of them into one patchset, so there will be v2 of this.

Best regards,
Krzysztof
