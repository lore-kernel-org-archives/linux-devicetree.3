Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380351E51E0
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342821; cv=none; b=KqrHdzqklY6BP0f0rQFIJG5FYhYAijMRj3Zo1SgQT0YewAjC8X+v+xdzj1B3z08AXuOQBfzxyMCbBWuQWi8i3sxGR52jCaPEtZIh4ZsNgWAZXx5CdwawWWzzJvMxoRwVjG4Lwv1JvKY4xg0U2R2+NZnLgV7O2OOW/YYMmo32z3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342821; c=relaxed/simple;
	bh=3oDwb5w6Kcn1iC27F9/0YKdMNP0AUUAkuVWfjkztGbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJAQfoJ6GhNf23AqF0wQJrnFE7RAL6P+FYLK43dFo1nY2gZN7YHjHqWQ/gb2hGgXE6EOKYTnVoAtOUp1UXZa47g2t3QoYBhtLu5GVR/4gi8T7u5nWvc8B0EKFHKREVnOzW9aRLnlB7pe7QYoQHeLPlFdIfLZsTdZ55I0Vx8I9yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwYGetel; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvK9LW/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwYGetel";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BvK9LW/5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L1fHEw446356
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ER2p52NaWry4ImHlbqb7bLd5OjEcMWE0dHx/7wqlgSc=; b=dwYGeteleGgBVnpx
	Vzek4+Ti5pRwy+aciNTjDzB2s/gUKWoW7+yBJ2UZ6Ehn+pWV4ehsEbE5tJKW4NzO
	rLjj1oDKwJbtmL3oTfi7TZyIxKUuGzXHgtpF8aDLPj1ahrOA4oX7H1d3HlaialiT
	7WG2kqF7EipECXhZkNrcdlP0jB4zkHSxdo+LA4FZ8rSoRy8XRrQcQyxDzv0kXjiO
	YleFmbqZvzruQWQaOPnxZY1IQMC60KLoxK9me5c0MH2u+zrkiGyM7o8Wjh8Bc069
	9JBHFQlBtwac+ZcxJG08FWHemxshYJKVne1urSDPd8w2Fl6ubcPYO3aSEHtyCzXK
	bTfhVQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrm8kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:53:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2babc42244aso139358785ad.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 22:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342818; x=1779947618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ER2p52NaWry4ImHlbqb7bLd5OjEcMWE0dHx/7wqlgSc=;
        b=BvK9LW/5yXAEl11z2y5sUFWc3krytD0bPZMQZSXgydlYyaoXpC1/GkkP+lJ1Bu2brG
         YhkRPTJE1XEiRcDzs49R/sAj45Uo+Qq6pIQlMJ6GvFZolrDXi+7I+oMl5v+Ie/JiMqWf
         i1YV4MF0Ugca7vh9XCsue66AjJfN55tTAeSw95ScqiYyMPYK3qZ034dh2s93dvLkzY96
         fBTwPsqyAzeGuvoKW03mIINGO/vSkVnmAiYkQ5IRSxQ6n41m1LM4v/UIc97D4YEThJ50
         UanC9e7FtOdX6E52lQFqd2HVSkEMNz4sqq7GUU6Hp94ImwL80IPkiOPax0v7yEas+Gy/
         fiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342818; x=1779947618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ER2p52NaWry4ImHlbqb7bLd5OjEcMWE0dHx/7wqlgSc=;
        b=V/ndbnQRQnXLxT5MTv1c4DPh6c3Ye0Ay6BdmRqepjKsuj//eJoDfHKTytsOJXGOyF9
         gfih8OIiqCbbGinD4QsRKJeb5uvqalXH5GJ4jtqXAVk6SZvLWQ4qvC0Kxt2EnLYqH11v
         CKevoBRDdQfmVEjPrUdZ5QFoXj+lICI/24GSbM0IcdS4zedr8jcfa0rzhz4lhs4BYeBx
         3uD7NihthKxPoxFGVBMdj1UVT6tH+7zVrKiAdnBUSUp0zCm+BnqFaBU3+AKq5QDCpsVu
         07+xG0HfbPln5hjn8N8+ItR5ayuJ2Qu6fmSz3nldJmaZf1mTo6mTpW1VXfmEJ1xJ7ILy
         JGrA==
X-Forwarded-Encrypted: i=1; AFNElJ9p2oLvJbEmt+Yp51vMVQOiMItez5Gic5Ti3am8yVjvRocNvUyA537Q/1irZmC+JIgMmPeAEM/ItWcp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp7EkYxfhE9KT/7KK5H96TIiyaPAxKB8XhzbZNhTqQwytL67aF
	ozTTI6Ay+8+kR+D8jH3Z50S8RuoZM8nZm7bqEgi31mdaM8SyzNFWMMn13e/SXwWb4k/BmX9nRUw
	5RSVRuT5L9ZBwspBzvAAMst24NX2qrdDxpLlLJqchTs7HX9k97CohzBX4zwBksi2Z
X-Gm-Gg: Acq92OHwt6Lo+diPQElmvJUSVf0uvu/5lwuKgUkfIaCXw7Ejawpic32FnSH1fYvKIKT
	/RXPpXonr98SMCqSn3LvrUricEXzFKmpUGv21NP4J4MNEuS3n/ojSxyxNFBVskdsBPbe31lmFCj
	oSSIBFrJI5MN8u+pviJC3jw41pqCRL4CYuvtn+lYMqUrpBUh92UQ8uArzOrRzGNCu2d44l0ecOJ
	bTyeOYfoFymsunOiS3RWCqI2NSHhdb4qpkGBVqs8hoT4kqK1ahLDw7YB4goCgqBAjOGC3EP3dAG
	Ufk5FduG9aDy4boMkwoTziaUp98LHFGCOAiBoVvuKH3Z3v1Q0lqHkC/ZW/bEWmUWSm2kMokDqly
	Z4X9cz4FOzkYEDW2aD2CLiYyK9/bC/iZMKCb+WRUQwSFlqZlhTg0=
X-Received: by 2002:a17:902:db04:b0:2ba:85:5827 with SMTP id d9443c01a7336-2bea33906e7mr12904365ad.26.1779342818193;
        Wed, 20 May 2026 22:53:38 -0700 (PDT)
X-Received: by 2002:a17:902:db04:b0:2ba:85:5827 with SMTP id d9443c01a7336-2bea33906e7mr12904225ad.26.1779342817709;
        Wed, 20 May 2026 22:53:37 -0700 (PDT)
Received: from [10.92.163.96] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11d659sm237756365ad.73.2026.05.20.22.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 22:53:36 -0700 (PDT)
Message-ID: <86829112-1894-4ae7-9e1d-42f3b5b64b88@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:23:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add TRNG node
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uwKGGqvMP5vtTz12Lqt7-AdK9y69Q0kZ
X-Proofpoint-ORIG-GUID: uwKGGqvMP5vtTz12Lqt7-AdK9y69Q0kZ
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0e9de3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VQnp4Hrt9dpzAY_ZiikA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1NCBTYWx0ZWRfXxZD6QKhYz+X3
 9QMO9n/J1frGFueat9Zj79Etl8E1dCl1ygGaCaqWrxN5VSc3qdSz4t4A2zOSSfBdRuIuUZxwcsU
 b4SXbsJLIlIjWzNZqwCOouHkBSn9SLDQGGvkOIdrHud8Dc8qzwRnDBrl36qUUekGeguzWamadJs
 oJfDUKOj+t5kdC7VgYyA7XVh2/ZKzmKg9I3IVt8scNlPT9MwCOWl3jHuh4Euob6i3RvMw2NB6Ec
 JwJaiis/iltqY0BmY/j+kIRoLEIqXh45+VECq4ZnUXUSOOKJgXFH1RVZ44UWjxVb/Z1Uss5/zhX
 rFVJvDfqfAb2VDb393r7MmWtc5GJkNuhxobq7NLblJ3QeEPv4eGQjuLgzC/Tf6JUcTXDhdMb/3G
 wCBkGMiJpRlOteyh9smGv0vK5F9Hsjbh79CYNeQrKjt74ucrw8B2GitF1unsMxCOQoQF8l/aXJX
 bk4qmPGSPJF/kGZigOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210054

On 23-04-2026 18:55, Kuldeep Singh wrote:
> Add the kaanpali nodes for the True Random Number Generator (TRNG).
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>-- 

Bjorn, kind reminder to review/pick patch for v7.2 merge window.

Regards
Kuldeep

