Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C55B4A2E21
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198684; cv=none; b=LI6wh+iCXtnwBWDJjpqyu2fAUszAFNHeoJoqkvsIGvPqrvKnbjOLsKxkJ3SbfzHQaqAVE1YHTokGpfXFGRURXtId6qI5R60qfCJUiZrqjXYgBisHdiwJ8venGGon9cBp1X+9W1mNCAokSPYRqOxNaobdtlCCemVKZPh64keazcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198684; c=relaxed/simple;
	bh=FR3zWr4qifQm4S38yXjm5IS3VkWlyrWgeKrhhiwTQz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iL4KUu77F6ENryQRx1Cauye0aRms5A2KmbH6yelt4TJt7nf/zfC0QySg4SHnXWo0Orj+E648SRnyjSQ0ySVifl5e/AgS7HCi9R6W9CLA1S3rFF34wdOHLvMA9THJB+LCkuWRuyk+GyEl/iDHTG2cpsXwJeU2WrStxiIEY/L7d7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AX689USz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJcl/EGP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AX689USz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJcl/EGP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BErlMS900754
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p0UEMu0DOZlEEmh88aTiA9Z8
	ge8j8Nt0vJihhcGu1WM=; b=AX689USz3m8bFwKaKM1wdx1Df/N4NJMcAQs/EmGr
	2m9YGtwtBsmnOrb/tgTWHvQ5Le9edm1tPusfsMHXIJHfyb91hLaHFuSri634COXv
	6O2oLF/X+1cZPxRLfPnDZJQczosI61jHWbmd7vEovGwuRhkHySHDBxqpfg55p5xG
	xQNzCDwMbY7xO0UBoA/v2gCAwZcXsKp3RrXvqZrOVrSwIDho0L4GYN8/niLKqrRl
	Vws9FJxmGzw8+S+t9y4tRUpLfIzyKWhiBIJBNdqhLsqft8yt76WdI8j1luW7HV5T
	8UOfNGWZJ1o/oeKdO/P94V7xcl/9cn2g0ufH6+0Nn6EV6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe704rt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:24:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0bf6904a6so1227335ad.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781198673; x=1781803473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p0UEMu0DOZlEEmh88aTiA9Z8ge8j8Nt0vJihhcGu1WM=;
        b=HJcl/EGP4zYhGCQ1TwRxfjIjb+i0LrUmzAaEGZhekR02u15Nc1d3F9vP+7YMd7q/xK
         3NDdJserJrL6z6yLlju6lK+loMTF4TJ+3+pQj97xJcAGxxoYXwyU93TR+RZ9wOCxxdxW
         CHZ/QO6dti3zMXi1agFvem9nDGYalzDYMWNbgwSeAxOUHDBhPhN6oD5z89EvRVzskzct
         qfqTdloQG6Ydkz4SIomVHAB2m8MyrhTVSa79zMsXMSOy3Ph1y4ApiNLeTTOgGEVhY9CY
         RvuY2/ned39GRFya1UKDXLdKC6P4CVt/akhVcLWaU9CoYKiR0L0XYdWG2VgXYzxH//tv
         KfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781198673; x=1781803473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0UEMu0DOZlEEmh88aTiA9Z8ge8j8Nt0vJihhcGu1WM=;
        b=QQfD3zLVDJz4Lch4Yhb5HJao2F5Q4O0uvGAVm8VUPtJ44wRI5FAbZh0Hgl/VuE2jkZ
         +52orxhFscXSQveGdBzL9EdS0Bzfto4pZm3CfJ7FJzvm6bKQieUCc+tTAguEYiqUnJxf
         iXjzTlJz8Sku+BJ4DD+8pCWVnvFULth+lAN6oKFq3htUr3WkiQHs0WQ5n84WG0EMh/Tn
         fVqiDAvAAmRYnj3JnQxu6ZWW37AoqLNo8trcSlhLEYT8n37gC2fe2kN1fegylkv1PDt9
         SPEu+gpovRYXuPUjPyoVDZYz9x6OHbuwOVidSzhAnz7QbZNhCRJv0sZI/nPsSB5ogVaG
         Q85g==
X-Forwarded-Encrypted: i=1; AFNElJ82AHbjsqK2CiZELZiIFXjoZUgfjBV9NBuicFpx6SZ1/n0uDzGRYusvB0RK8Sd+LZ2N9/CxkVpRZnp7@vger.kernel.org
X-Gm-Message-State: AOJu0YwW7AobzBjRE7TFKlkUZm/lGQn67rZxdE592r01r1WVqK9cs0hy
	OlSzihBwd6MK+5ntyvU38FCuDAD0EeHnWagYBzbW1hAe/w9EnTrWPOI6Q97tH0NAsoMOX+h3FTn
	ati1hj0PGrR4B7e38qN2U7EekKF/zEYhNy5gmdEi27Pxk69mJZuaiEQgHu1IUk7Ye
X-Gm-Gg: Acq92OHjU12Fq5+C01oeUrDr7chnW7t+5IVWTNiDVBi4dII9Bz9WTvZlklewPlimGbu
	wD+YdrP/z9qktBF4z5JpoDleGp0toeq/9SqaaBeyEq9awuodFLJqTTq9Kj+2lpWFqFZ0ZI03OwC
	xRp+pGHN+MYu+09GM5tedEzuQcn4NNASQEZwQbABWb4IbMe5PU141RQJH3tPZutMsXugRAldQN7
	VtmTu4JejdHZEi77OXycskDcZbPtV7TO5Z9NlrTPpLjE0jbKKGNJz+OqTSqgLJDlOSH4EnqW3v1
	t4+uATBjRy/R52jaJtG1TosMXWL2u6riVAsmC838UWoZj/eLg+PNjDO4EIo3yT66AE7buL4TPJu
	YzV3fiBXwUbmzmD9SzcICbqCDxoFJFT77pLjzD+Sclep+yM0l
X-Received: by 2002:a17:902:f607:b0:2bf:222e:455 with SMTP id d9443c01a7336-2c2f0059f50mr59410045ad.7.1781198673140;
        Thu, 11 Jun 2026 10:24:33 -0700 (PDT)
X-Received: by 2002:a17:902:f607:b0:2bf:222e:455 with SMTP id d9443c01a7336-2c2f0059f50mr59409545ad.7.1781198672622;
        Thu, 11 Jun 2026 10:24:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d55esm290143975ad.63.2026.06.11.10.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 10:24:32 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:54:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/18] firmware: qcom: scm: Add minidump SRAM support
Message-ID: <20260611172425.eejrdiv2zvhqkk5a@hu-mojha-hyd.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
 <004d6bd1-2800-42d5-a6be-1fa69a06194c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004d6bd1-2800-42d5-a6be-1fa69a06194c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfX39rm+VOW6buk
 wNZmi6v5Mhu91l3nFBhb2pGiNu9h+HeSvYPnq4aHdXWXtfK9X0dtE3yimNhnw21lEV0HEPl4L2c
 GDwrZCME5k+A0K/f4ExQIndfRnyom2Yjttp4JRoLmLshnLBY6fTjjuv/5Hj07EE9Lq/KMogxEsu
 yA2nVhQANRDSxctnvaE67Or3+beSZG9/cPj1FW8a7TjXbVN5PCMgeR8VMkodzsK1QH695VZO56b
 qkX7RlwHy1QXu2z/2Mf6vHgp6tLHYK3UIuQH8pVE7n2+8SD+xwB/XdsLmnrcC70mThHr45863K3
 6TOTKBVz9wSS/XwtjR1LofwL4ABC4E5meeNnlII6KuuzwbJb/YDi1XKl2UPOcIhX543BTCR9ODI
 tV06sz+hnO6RgmeeQnwuxjiwe65VT9EBlpIkHWReFWmJE5zfWuFDUcHs3YJIywYtObg72ZQaMS3
 l+YDTGN0gVX27uNEzPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfX99fD3NaAM/lO
 Lp+IfeB9FJUjryQD3rWrCyPdIULY0CQ8dPxftcpNMXgepZ9bsHkcV3aPAhpgj4lBLX1RIRebyqQ
 UL6vowe0EPZMlZ5ryENg9oN9mm5wqNU=
X-Proofpoint-GUID: K9FXXfhhlZIeWNZvMyWT2F-X_3Xuh66m
X-Proofpoint-ORIG-GUID: K9FXXfhhlZIeWNZvMyWT2F-X_3Xuh66m
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2aef51 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9xwycFMNzIvhgBqj4zYA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110174

On Thu, Jun 11, 2026 at 01:45:53PM +0200, Konrad Dybcio wrote:
> On 5/22/26 9:49 PM, Mukesh Ojha wrote:
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> > to deliver it (USB upload to a host, or save to local storage).
> > 
> > The SRAM region is described by a 'sram' phandle on the SCM DT node.
> > If the property is absent the feature is silently disabled, keeping
> > existing SoCs unaffected.
> > 
> > Expose a 'minidump_dest' module parameter (default: usb) so the user can
> > select the destination. Only the string names "usb" or "storage" are
> > acceptable values.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> 
> > +	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
> > +		if (sysfs_streq(val, minidump_dest_map[i].name))
> 
> I'm not sure about sysfs_streq() specifically, but otherwise this lgtm

It is used in quite a few places for the same purpose. Am I missing something?

-- 
-Mukesh Ojha
