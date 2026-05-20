Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0383403E6
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304816; cv=none; b=NHkjz+ConS+ASoYxahodAQX/+VhJsh2DBXkH2d6RWALLlhN9vIqaZ9V4C5b+YgKeU47ip0cBpGEWg9KGLaYxfgenUX99NundlkHaquipWjEze2refkhwcI42JndighGLsAsG3/ldBzasI4ZyWuyLQwzE0TkLqEx7JDph50Cjiio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304816; c=relaxed/simple;
	bh=qa6+Eq6ywhjy1RaYO2MeVgoTr/wcu9OhO6BnZE8WvQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXctCNKVkAtSLTjE/ly1KOmMf14gcLM5LnE39v7XvfOoEFpYikH7llNGs/WUVcwTS+tEevLlu9M9mqUfcLbGq/eV9PnhnuwZ04RqRxqZUi5KYN+gKjFQ4avDlpxNFpYUU/ctsBUwpyc3khEz2GffvqSC98avpxYdltRFlAG/DWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VldpI+mu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ng4yzRGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VldpI+mu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ng4yzRGA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6Tj6118986
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/jyzG/ZAC8KIXqiPNpp29r/OrayvB6GEHbVuvdxf0Q=; b=VldpI+muLBHRlOYV
	GMg2X2/4sOgAw5yJdp4ncDbTIih4aUVsX5UG5vy3rXCMICZKdtzDKl0YpV1LQLDg
	Xj81jfb9By5PE3ZoXtdLhiGS+0Q8PEOu7rI05fG/Ed/NePsAm24fL2seQjr2COuM
	quJup8MV57vGS86ZNc2kEmaURDadLFxe9mVH2mU8L8pVycAqhQalktyQ2GlTwX0I
	+akZfaU+4KFaezwcSJKRp/Z5YMpjFUWYgeg8k2vF4aOulJv8PgivfBRFfssDDjDT
	uR2UM9KrRIph9wdBNNeocL6qQOcOVu8DUvWXEYO6b9MfbDWCI0t9f1c5eTzP7GpW
	R5oxxg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee89e3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:20:14 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-631a49033bbso2936500137.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779304813; x=1779909613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e/jyzG/ZAC8KIXqiPNpp29r/OrayvB6GEHbVuvdxf0Q=;
        b=Ng4yzRGAMEs4kGiLxUxj0MYlushPItQXLUErJXk5rH8rOAQ9cjMH5scFERHqqz6vvq
         HAzNBk1FG3gfukpvTnG3zR5KWWuxwWGeF7eVSvzL2e6i6MLDRV+9hTAH5pp+r07BLkDw
         JGt4DTos4apzDDje74oGy2IMcnaoRIFcxDV3ZXNdAerSA1GCuZ2wXSWV1PKcHgRAEGik
         9oV5sqVn21wmyM89yBMDhedy79wxNk0+OTKnv99uG/WplrREDSyu1Y1oeZ7td5fiY2aA
         l5sdKfH1IQGEhN3YwpK6Iyxxr64GKiR8y1YGaqt8C1oifreGbVA8W3JibGYHOhW340MH
         g1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779304813; x=1779909613;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/jyzG/ZAC8KIXqiPNpp29r/OrayvB6GEHbVuvdxf0Q=;
        b=QstgZE/x7cFyba1uBNBWWgL/pJHc7SDvnif01s4ImZZgUI4P74S/abOiSigR3XjngE
         sCBfVbsA1UQTiZSzLb+H5gox4+CpWA1JRtPUskwGnlIwkI7+0l7UzpH/VbNtPv2PTPHY
         86B2avn14yF/C3A4+0MB+7YcALY7ZCXuR7W0rq5iUW3XhbIl3aXwtZ63jnuMRxXN3kii
         x3D9xNEoCR1SjKcpn1ZrXBwXHUXV1LCGmp5NRt8HBwOw2rG7pZjhZFjT2rhDBNz3lMtL
         23yEBqAXaGYCbcV99pZ6Syzwqr9+HDW90w7Fzbfiaofv73BVsYCi7JRXQmgDKp4Pewy6
         dy/w==
X-Forwarded-Encrypted: i=1; AFNElJ+1iG3GzIjqKjrVbfTNUGvwhc1H6IeUCEb2AnImSZOVNApDOEvwyCjEigQdHD7ZbIIN0iJ/AAJJ3cdm@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGnLHm13HvpA6ncPQu871LfhWSM254CIg88Uo3tN3aUYXLhUS
	VocWNExcvGwZzh85XeD2MTLGGXgIcmnyLNb1065pC3Zz9fCduowriDdy9/1G3qob5mH+uQHWpcn
	w3aHP5vpdxPQFeXFDXwqickiZrN6lmIeoXYwChmJ3YHYOnb7cuy73Ym6KPRSuqxraZ0FsRZuW
X-Gm-Gg: Acq92OEA66QZ09QCDzwQCKFjCrjFhLFJ+B0nVhMFsMMU6MxhIITDmqMj6GWQ7Yl0EUu
	2as65PAm2Aik4Aw2yE6oGqV6W7WzkqpQ0KwxULqbWHShlga7tjj4YprOgB1DUyERe9jXpzfW4lu
	TpWz3ruav/YLVcgz/odnotkYRIpax8MF4Z3DXKNMrx9Gi7dYVCfs1YVrEpTCep/AzDL8lOpKgpp
	/rkRRCf5QBkSBxnLHsHthpH5yMqZggpoe9Tv0gzd9T2b5b1P7jL5INqphvb0G+qNu1TNzP3w5mx
	846uEJVMpbeFfUOso9zQVHhp/i3eqKKLSDophTMlHjx7hYIj9HALCBxe7CpT4/9NDua/5ylZEdS
	vbY25ATAYf9KHICLaXf1mL+z1Gi6tCrFEmwVr5SonUkO/OTsU
X-Received: by 2002:a05:6102:4b8a:b0:631:487a:23ab with SMTP id ada2fe7eead31-63a3cc0b924mr14710588137.5.1779304813535;
        Wed, 20 May 2026 12:20:13 -0700 (PDT)
X-Received: by 2002:a05:6102:4b8a:b0:631:487a:23ab with SMTP id ada2fe7eead31-63a3cc0b924mr14710578137.5.1779304813106;
        Wed, 20 May 2026 12:20:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm57065016f8f.21.2026.05.20.12.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 12:20:12 -0700 (PDT)
Message-ID: <c8011903-1d6f-4f17-9efa-f3567f556029@oss.qualcomm.com>
Date: Wed, 20 May 2026 21:20:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] interconnect: qcom: x1e80100: Revert ABI break
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260520190807.509871F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260520190807.509871F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BsufnTYmWdb0cN_evTZ_jss32yE80rao
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0e096e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=wspJ9bN9QRu-DSE6Ws4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE4OSBTYWx0ZWRfX+cd+1c6P7kb+
 fFcymAvdkfGNI9J0Pq+6EV0ZPmST+Kb8hUKLTrLKZ24FkpC1A632eQgu/QkZ0n7Z2nLgO6XsIdw
 xX17XsKAYIPOZj0v/BN7U4ZSieInHI7YZ46mWKD+IczkdUqxo/5NLX3mN6YR/3ntKr+MWL0k+OQ
 y/gR5k0+7EJVoP0xUUPLKO3dIF0zdigcHTQanZj77UqykaimswhoAcZfKvuuwPd1xeCnNrtcCo3
 LeMgY+7GXNoexQH7l9AmuFRBKXquMJCHQ9ThKKaKP++XovnZU+RJt6d1+DbwExCj/DDHtHcf68w
 bjNEnM+uVKnaz0uQnxu8uaxwHdng0CxpJPPOx7FUU9Cho+WE2eHDwau1TWF69x+dWQxk8dE5Gsc
 30q9Qc47LGNnUnXto3VYAYsWh1K3u1otF4AD9fy3uX8fvnLx32ZgRTwGheVTut4J9aBuj9/YlhF
 oT/skZM5wdfX4uUq17g==
X-Proofpoint-GUID: BsufnTYmWdb0cN_evTZ_jss32yE80rao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200189

On 20/05/2026 21:08, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Returning directly on `-EPROBE_DEFER` during QoS clock initialization bypasses node cleanup, leaking nodes and causing a Use-After-Free on probe retry.

Pre-existing issue, I'll fix it.

Best regards,
Krzysztof
