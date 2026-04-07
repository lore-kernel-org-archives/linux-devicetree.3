Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B493C4576
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578304; cv=none; b=qY65saAECzsEKQ0bxT1Sd0/1tSJixU6DE3oqrxAH3dN2U0KGyLO/7i1JbLFeMh+ZVRdQ5rhm8PrXW9zJmAJrv+KCgde7IjVK3+FdVd9M3rMzTRqUL1LPhlwEMN+EBWMwPtwJ9N9E1p4Sw9Q2pKpCujQYAjPL7zN9ack6dyMlQNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578304; c=relaxed/simple;
	bh=1cQAJtgQmFluSDEROaDsoxsRqFAOZvbJmchOqmbAdGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6qiRk2DR4i+/vqik9KI8Yvcss2ArWWPotNzzqQFmYedAZO4RE5pdBqai2eJ+uJPQRlotsTSY0sbOI3TGLZAiMV5WzCOcD+ZEUCBn/urzB6Kms6cBh6uLA+XOSaF1pDxjgOKmL4o7s+fMUfn/wN94E9qeUmm5M+md7PagUe6AvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKwk4HPW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZM4EQrrv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKwk4HPW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZM4EQrrv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CPbKO2009327
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 16:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fNt3t7bGHnmTY4XQLsyQYIDe
	23zUVnDOM/yLMp7Jz6M=; b=lKwk4HPWDN8Jh6mKxHtwtmsIkQYS5NCmK631tWI1
	r3vGNcZCUitnG8BkKgQ/4nxeG99R2KHtNzqF6nusOk544F06n5DQcbkUFMEL9A/4
	+gi7yqNabk5HP4M3CNrawA8DJNAvIQDRvoH6MIDcd3lgqvo13Q0y9OubSj79saL0
	VAZY/SwwubKz9F1Az4/v4j+5MCwjhdXGDCfgsOR3v3ZGm47cgIe2JCcNHTyfYHNE
	+yX0ECY7R7Clzg8t13tVRFzjEANj6NgIPze7UjH0wkj7wu6TbmESWycNp9npARxN
	VvSv4yW84JGA///lUPm3uLernh+KPT/MZRX6zPKEzZb6SQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrruhqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 16:11:38 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c09565b9dso7526829c88.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775578297; x=1776183097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNt3t7bGHnmTY4XQLsyQYIDe23zUVnDOM/yLMp7Jz6M=;
        b=ZM4EQrrv/4zGEoT1H0BHGwUwV7WLp4aTTA+TjNTPHhmWO7SbA+gT6c66job7fgWxY1
         6y7aJbNAozu0XD8lgZSOgMZXLXxMYJgi6oeckKY7H7xOKRY7pYbTnwK3pGyGCNsgH1Ku
         cI7odln8mgOAXcE8T6FBvOh3ZW+9OdZH062+DZ+X8zumW7leuT/iFGkDe31Fe3PGJ04z
         pyBeAkuMOB41s2XwdNIXwFv98/6zgc14XG4oyytqsb3ft922vtNOea5x1L5d0ihga7MS
         JD9kbScGEkS7skdNUlwR9wmxFe1R43fJpfpbhBX2uHIPExay3zvCicwmC6AUnimw5+bR
         YQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578297; x=1776183097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNt3t7bGHnmTY4XQLsyQYIDe23zUVnDOM/yLMp7Jz6M=;
        b=kS9fD5XqXgwmEJCi02wW+lSdLJBL5xyyYGz9Gs5fQTb9hWvcKQfd+snwHxVMdEcQ+O
         d2BzW5l8UA4OIODnSrGIQeMLqO5XgEdl9R1b4Xxvk7P+pr8fXn2cQRWesvWzvrQbtkfE
         ngHabOmsnZo2xcqDX4gQEGj+2d4j5ZECCmlIdX1nZMmMaNjqw8axTVkcE80gBqjlU9uL
         ySqur5Gw2ZUxdPZP9spRK+Y/4udu88rGNPi0bzOanW3IbQI75O3V7t+vMUaxY9ZRBynB
         tNCjpCnUbySln5m9RVU/pAb8osgSEyh5niZkMjie4S0K5wA4TUsPJAe1NkxnDFqJinOn
         pSbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvgH9ZdnhnaeAOEw/3hYU1mAlnY1c/0+A/MTs0aEgKy0wxUYEJ4Aa0bDVYbBP4soJ8ZO+veZLk2nY9@vger.kernel.org
X-Gm-Message-State: AOJu0YwGttgK47bEFRibwsKbHNA7dWne6lUSPi3aiRGCiarNykKF+lgx
	svTxbdRzoPyy+JqIOwsbWaCpHb9T+LVLIc27y4VDDFxe39eHE6qlfKS9jQFO2am2HNFUYECE2aF
	9ZP5ZArP1roXEiGPTSBMf0UKAhQTVTpb4ad/s9oHzkaP/4yV83WQJ5jp5Bn3IjR6c
X-Gm-Gg: AeBDieulEapvwFDF27Gnj3OCW0XvMRmC9g3Z5FWDheEq/r0iw7tkqHURYEXJiwVkNSs
	+jSedx0npFAXjj856+99dCe19D2KIV+Mp+kxfT2YsrGuuvHCUnhuYhi8PreczD8pY3OrC1lPciF
	nAWDOP/ACdZBMg5M2J62K5/z6Y545R84zzUwimH13dv2IReM9IOpe+JWOrKifXnA7FmDOTBBKqe
	KekXau0Sbz1hI6YIPQzY7IdiCqOEyTathPX9HJRrktlue7ZumjXgeCO2onteB93RN5zAFQRxpMp
	rBckUt319WRoApdYNoofbvjsvpi362U5OM5TwaI0Fzcu2nfy1YCK3dhHzmFOlKQSB6bd0FZfnsa
	XcgVcTm0L5Y+avZ3FDEkhKsE2F4lFRUZPQxwMvvylIRF4tJZQa6HBeuRECWi2Wm4XgVZzMv1IY4
	8=
X-Received: by 2002:a05:7022:ec17:b0:119:e569:fbb4 with SMTP id a92af1059eb24-12bfb770b25mr9183235c88.35.1775578297052;
        Tue, 07 Apr 2026 09:11:37 -0700 (PDT)
X-Received: by 2002:a05:7022:ec17:b0:119:e569:fbb4 with SMTP id a92af1059eb24-12bfb770b25mr9183216c88.35.1775578296453;
        Tue, 07 Apr 2026 09:11:36 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bfea5f860sm14659495c88.2.2026.04.07.09.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:11:36 -0700 (PDT)
Date: Tue, 7 Apr 2026 09:11:34 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Hawi SoC
Message-ID: <adUstp6A2WT0Dvz7@hu-mdtipton-lv.qualcomm.com>
References: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
 <20260406-icc-hawi-v2-1-6cfee87a1d25@oss.qualcomm.com>
 <20260407-prehistoric-inescapable-loon-cf0dd0@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-prehistoric-inescapable-loon-cf0dd0@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0MyBTYWx0ZWRfXxWRfcFIAoSZK
 gpU0WTTxxH2MYnfD07Bm2KINTG2NlyV73hmjuceTcz7n0uFW88G4uJdgua4fHVWkmpd1fSfWZ+U
 jg8B3VCSvY6ksRmIA+d1l0nllFMYSxN4JpEyKhSKtHTEYy1Ff9D03yls7Orn4E96XC5s6Ym5sFm
 orFEhL3lc4wTYV1Wszdr3QOaJA+1IUC0ZtrA25XQfeBw5M/fugHykKAjDhmENsQoq9tu8FRmDsc
 NqdTbXc02kZpLZsUNA+WON3ko5gzFRWAz/le3PCsebFQmb2qGghcRZkbuJZTmDxDKoKXeQeWOi7
 tv7y3X5GJGb9uJgkyDLQRL3yPrpxWMltG75YojkTv8Gd4Wpgcm2MRWh+TBH51boCYMo8U6f18zG
 f8Tf7gX0sqVEg6gtye7hQOpJNB6cWdSS1txyIBmzFQe1lK6SZZN6sCsRu6P4sVKXNbSFCFf54JC
 cCpfu8Bc11AD3tdFD8w==
X-Proofpoint-GUID: pyOQh1LqVyshvViJsV9hE50ZqAkLtvf6
X-Proofpoint-ORIG-GUID: pyOQh1LqVyshvViJsV9hE50ZqAkLtvf6
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d52cba cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eVgXn4zF-6aLp7D_HksA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070143

Hi Krzysztof,

On Tue, Apr 07, 2026 at 09:42:09AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 06, 2026 at 04:04:41PM -0700, Vivek Aknurwar wrote:
> > Document the RPMh Network-On-Chip Interconnect of the Hawi platform.
> > 
> > Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> 
> Same fixes needed I wrote to Hawi upstreaming lead in private. That's
> why I gave that feedback (privately) very fast, to avoid repeating the
> mistake. So since private feedback was ignored, you have now review on
> the lists.
> 
> All Qualcomm previous patches are poor:
> 
> document the RPMh Network-On-Chip interconnect in Mahua SoC
> document the RPMh Network-On-Chip interconnect in Eliza SoC
> document the RPMh Network-On-Chip interconnect in Kaanapali SoC
> document the RPMh Network-On-Chip interconnect in Glymur SoC
> 
> Made by the same people.
> 
> Why can't you look how Neil did it for SM8650? Or Luca recently for
> Milos? Or if you cannot look at non-qcom commits then Rajendra for X1E?

I believe you're mainly referring to the lack of "Qualcomm" in the
commit summary and description? I agree that should have been added.
That's understood and it was overlooked for this patch. Most of our
other patches inherently have "qcom" in the area prefixes, but yes when
that isn't present which should clarify that this is Qualcomm-specific.

Thanks,
Mike
