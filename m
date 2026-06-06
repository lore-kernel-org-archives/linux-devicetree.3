Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B0A384245
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780750001; cv=none; b=fX9ELTSRGhVCF7zXpsdzXM76XAJekQl9wh+OWXN9MCU3LSMsyFQzy4z5pv/m2b6omNcau22TZ7B3P684bRBWmwJJ9aHmst4p8fa2grP1PNJDwNQkH8DBTVWy4hqU00oU8CVj2peFYYxw7cuebH2hXTI7MlfJFeW/8OPCX2GHWVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780750001; c=relaxed/simple;
	bh=OI567XHaJA6LozE7XWwl+YveZRRZTacd3XbS8yKhF5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvORNQ8Mih/8E9OAcHP3xqjIu7B4t0z+Tvf/OVCQ3tzG9mCa3LSmCGVYBbrHinq2OBz1JkKVhM74h9b3Hkbe4HaFCaQsCVFvn3qEaNhAbFj5c/twOV8uUznqf7etHBI/PvJyuY9mkHkF4yRhotDLhGnE8+UAjvzdU+6xRIkTpPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqT+ZoyP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYM/YM2F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqT+ZoyP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYM/YM2F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDsb41327473
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 12:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I36GPlABczqU3ZvBjdX1WKxM
	8wMh046hFW/NpGLSrOY=; b=HqT+ZoyPu7rihrID5L+BzIf5xcfvfvCCSObd1m+x
	wbvfU8azUbim4fQkVhepBhZuOpPNUJR9ENl6VTx++tqfZJ6x4ViWO1dWatBB6Wzi
	64CwBXaz+dEmvdJ5ySZZ04ayt8vEFoQNrMFvuWxpAbSbFZ2yQInPdwFfkVebDvcE
	0kp2U4xtexlKiRzXLACGyV/R+A0XW2N2gZtjquclB08VgUzF7U1lzJ5xswznIWZF
	4798Fdkxj5cM956yRAgJT0x3/YE6ThflMjD2JWkijcnykxfRVvdu4aMGeFo+DJ46
	BhyCub+RLD03LiblXY4uf+dMzT3W6qtOy+qYDgsoExAGQw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8ruc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 12:46:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59eb9191180so2135203e0c.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780749999; x=1781354799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I36GPlABczqU3ZvBjdX1WKxM8wMh046hFW/NpGLSrOY=;
        b=CYM/YM2Fwa7E7MlLUu8bP0npR3tWAYYrU/vdIO49uPON9lOtSa662G4fJOoJWPCps2
         bXbBh4IcLxRzQaLD/f11zFt7uwCDrkDWOaoDF72L91HUqWPvmw8qrcwUl11imUpG7wiH
         cgJhEf7H3hpeh6AKYxNs2WzMwJcFPlEZckwcKbfluO2KlKjdauH+MscJf4OgtZOgcDd8
         AUmQGpFygWaXrULK629S9TuUu/hK0unqltQO6Pw4R++ukriwoKAGZn40I+kAGJdPeSB+
         aGVMZKTCFRTQt+143P+G7QneM9xCVYxGDmcSYnVVKBappfkyM1NypSjVySY/zU64jEi5
         M38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780749999; x=1781354799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I36GPlABczqU3ZvBjdX1WKxM8wMh046hFW/NpGLSrOY=;
        b=gT2M3+iJSbq7nh641hs/Iwogkb0v9FwS7ean6ij0Id4V8VEuYNDopi/DHlFjj5nEuZ
         WM4Hg5TkQwEvYg1qMvujz0ZxGCs8mZy075Seo8L5nJfpBhGk2QdnletR1Ybs8htqmYcE
         zUbBKBkgHeAGcTuuDjin7gF/Sh0GuLpA3UFA/ISvh7fPXI3+i7p4x48NvtYFxJkN58hx
         a42mtXT+ZT8b5F/XSgZ1kOE0hjRAEa46A7qnlz14dGOFb6NTHLdKbz9tGTta0dlQmtJi
         HSIIpYswnId0T3X1Xh23XznoCxac4pOtSzSurPpunMC1uRLj2q78vCkD1B146i78YIa2
         Tmvw==
X-Forwarded-Encrypted: i=1; AFNElJ87PlVF7W07koeRIwe1iDP1bqoewIimO76wZpvDNx3eEdekAFqQV4XTnf7A5V1moEL655aymTW7dLHi@vger.kernel.org
X-Gm-Message-State: AOJu0YwtYNOOvw5kMchYfnSpvGa0+EcbyDBHht7U/TagTB+N6b41ndX2
	xFyf0g4pJO/cPOFRQf+jmOg5qdOp4v61a0fC48ez0+PoWY8B8UOoHXoBLZZGTJWvHB8TB+ZGxvR
	GbaV+hKrWbYABSSnSd9Mxa7nS5tJEJxmKqTMmpr3/ZQ3Lt+NWFoFcn5TvU/NDxf+t
X-Gm-Gg: Acq92OFLE495MNhInmFL07R0Ka37EIqRTralsWGcVzsnvnsz7ZwWLuFA7d+RCvj8rSO
	bQ5PlGDyR0IxXJYk4UGuGY6jgEz+OVaIBYr1V9tMs3Avk4cmeu6mNbLWZFQfgaUaj9mJepQEX/R
	WIfLw9NZ92gjJfOPUZc9E/Qepedj2yFNOgdtoCzgWsQLqt3903QZVHEF5KelcT2TpNfZw3/53Ai
	TFJx+1iSILJoCncD6odr/c+p+Dulkl2CErTLJCPKwf+APB4walLIdFhLo7Vz7fc5N+kf3yPCYai
	Nq6okZtn+CEGiejiX5y7bZZvqv972ELrTV8unO743P+XwMDYsuhaScAQi1NkiXeBlHVV/UK9yi7
	+F3EWmvjAP/ItqI9ljU8HdrvJ2GruySssf4VpTHxgaHtrpz+XSsovu+x+iIzzSE7RYFwrSZncln
	JYE/oQgUpzv4gWFFI9H0U4rvb+/1Ct9csZ1fYtHXDGA3zKBQ==
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr3964115137.24.1780749999006;
        Sat, 06 Jun 2026 05:46:39 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr3964092137.24.1780749998585;
        Sat, 06 Jun 2026 05:46:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66b1csm31175831fa.9.2026.06.06.05.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:46:37 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:46:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Xueyao An <xueyao.an@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/10] arm64: dts: qcom: Add QUPv3 configuration for
 Shikra
Message-ID: <6u4rkb5b5m4p475h3excgaufeipor3o4oifga4dmsnf3rcqe2j@b6us6m4h6m6s>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-3-0fe3f8d9ec48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-shikra-dt-m1-v3-3-0fe3f8d9ec48@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AybfNDZyDtBiwQL8Wt5JO6IOocfq_4RR
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a2416b0 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lJH66iwPDgcm3tFhcnEA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNyBTYWx0ZWRfXwvXl4Pb+Jmc5
 qJiw6naaenoWiQSD5fJbEvJlA9jwQlyTnX/V/KAtCFWVc1FNNZq4vXB70K6DnO39LdlH6G/2fAu
 CSZz5kDeT7mzAe/lEWK1LbznURfGpAahBhkw0lRrcRO2K9PZ4AfYCNC4bmoT6NX/K8qVHLKe1yt
 NpD2OAxRsy9871xbfekpBcNeWNMKaD6NiGBhgva4zJmDJMf7HT2+VbPatgsHfzbcCuS7YGS8rU6
 MVedITIm6atX7QsWdiApZcvAtrH/yw47YjB6HFlmICUu75mg5Jd5eqwihMIfaH+/V+4/nCg1xL0
 coHPiHBAJgXfV2bLrhMT/pbDS2zBVITb89pY1LZZFkPjmyYHbuIszXxV8hgirAtHEIQ+lnJFAMB
 1XplMybQj6Kma1DYoB3aStsFXwJxENRmsxZxeQkuaJEIbs2E6zeMTr8lORARNg8AyCLITqDJcMN
 FnW6T6/Kev+K5a1MoYA==
X-Proofpoint-GUID: AybfNDZyDtBiwQL8Wt5JO6IOocfq_4RR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060127

On Mon, Jun 01, 2026 at 06:25:05PM +0530, Komal Bajaj wrote:
> From: Xueyao An <xueyao.an@oss.qualcomm.com>
> 
> Add device tree support for QUPv3 serial engine protocols on Shikra.
> Shikra has 10 QUP serial engines under a single QUP wrapper, all with
> support of GPI DMA engines.
> 
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 951 +++++++++++++++++++++++++++++++++++
>  1 file changed, 951 insertions(+)
> 

I didn't completely cross-check, but it looks good otherwise.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
