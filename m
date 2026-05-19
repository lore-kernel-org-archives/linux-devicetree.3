Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0C42D5932
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779155310; cv=none; b=SRNx9ANh4FZq/UrJtSDn/2xKAR6+NxBV8L+p8qtXBTy8EMo6mtQM92A4DPdWh5uYV0/x2hFl9zmB61VvTI0S9p12hwGCDmS8aB3qmhHfHoWufZE6jm5UjIXRlI3HNR32LOHDh4dBelwAGlfDuA9gbWKAxlhU/ZGuVssLK4jdd84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779155310; c=relaxed/simple;
	bh=XbEc5jXZ9sWB4xKJRzkrb2fldPdOFmYhWa6RG88HdAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmDUBg/7G5l53EA/vud/dulV5cJKoOz0vj5/WVhoAR7tKAh0qTj/dvmlogijNGUz+8sxE6q3c6JYQ2JmPsArQm0CG2qLGSh0v37jYSIXNtooeu5iDcaWuUbtU+GCJTN2W3DuVhAySMEs4iiqmSUJqOGUt4iinw8s6aJJrDWv3Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0F6h8/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UcIMdlGw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0F6h8/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcIMdlGw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IGLEa12091264
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dUNJ6vnuOO/yKduReFk6vwtl
	edlzl8HNGPEPSgpOhRY=; b=Z0F6h8/oUSMCHA625XXO4/aBzzlew7cHrztbzHQq
	x/WkRqRulfvossdJdNbZP7GScYl+giXzqR/si2xHPdcC7LHUaxINyP4uNwxUpyAp
	XdfuFcMooxloQX3yn/M6g70KE5WhWaOYfCCAOSC1dQUdogCNuOD2Q6oxB/pVYHbI
	39fj5huvPlTLLLcqk9T64xC48x+q+xSnvNgB7/3X4EzuMUiqRNCX48h0Gj8FYsAY
	C15DSHJmRLU1mIHkMTOSwml96ymaHtphkb8AvP1SJ2p2cfj5CPN/yhkEhQ7OGypR
	9jXXbi7MqXvZPecvICG72QN6NkhQAGglSDU06O9Y6mcSRg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpk5qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:48:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f525565b33so3885408eec.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 18:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779155307; x=1779760107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dUNJ6vnuOO/yKduReFk6vwtledlzl8HNGPEPSgpOhRY=;
        b=UcIMdlGw+hsnYdQG2G+OaWE9FAtqvBvf5g2OGxAg2soT6coQJrD0KVK/YYS+Aootz3
         khLk1HV/kpgA+fR/kHjOZiWK/j4v8FNFL5ONTJAAXoQ+yHyL8suxXzKL1tz9+xeBsZbd
         TEZam9HZmLBm9ovzDbtajlNl/6M1mTS8GinzH6Uk+S0OxX0stnXuRBz/Wxv7O02ZLznA
         tS7VMRokWuhxUs7R1V8p9TMlUpVxvSweoaGgpz25WWnPI/0ncyTnpWqLxL1QKpXwN1oh
         jO1YE9UtvbBrkmVi0HApAe7BQOvV2hVRp1FZjMdmUQLrKENg12kynnHyvBiCw4JGlAOJ
         Holw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779155307; x=1779760107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUNJ6vnuOO/yKduReFk6vwtledlzl8HNGPEPSgpOhRY=;
        b=fosqa6AX4jUZw1a/+prSDJDhscx3BVjWz5MWS3IMP2WM07cBzR7DOHWNOZJaTEE612
         +ktUHas/D6wyhsPpc34ssvF9Ei6kllUd4CR0bxfozvQTZqg/VHoB33AJ1aoXwGaWeCRZ
         M2dDpGOuw49RlK7U9635GiAH4LHtcZRI83PKvqDL12Cqci+EkukhVtM1JhxY8pDTwtJr
         pt5QdNunSEKjmsoRf9IYTIz6dXRzmOv5aFV4TLJM4GlwoGUfDf2uIAajnYr4ZbLT1eMc
         TAlqM+YHpTMzKkLi8Z6QClS5UbpdTAUimkJVFR5W/WH1FTXRZsnXEi9KAVNPGbBelKcv
         dxjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/v+2aw1Am+sHrytZRrKs2hWueyGWtS1wgsGytwgPvWCUrdJq//NnqI1LTHEBORc2fU9OYH4V7IDFWX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6a8dhk6W0NBIU0doehcJ4WWj8GL3qRQkGVIeUlIZ49u072QmE
	Ho9SRfHPNmCoFmp8jVAobxTISm/9d1qJzgjB631MWrBJt4z+v1RuE/ETUBAi3RPLpBXVyuUwCER
	aZxxeiQ7oMHrcEYLvsCvAidSk9GceV6bFGGlbQ/UTF9oBWClkyiq+1q4vdewUCX9g
X-Gm-Gg: Acq92OFuG3psRuE/tUkgSJMYJz/vOUXVumorCgETP5M7+AzhKA9Y2ttiMuPRqMg5bN0
	6q2FUOtsGxQbS5TWFTpkGg/GapEW9FicNn3nknEjI6mPe3R/4lxcWkqnnexauWlcv6t5Wyn8hQR
	fEEr5LLvveDkNUfp6lvAy9oub7Vl17DD3/XL43l9bp5ZfjJhHG3YjqsJeTi5uqNuIjp5aRz+C3z
	yVu0y7Jl2kkClgLhh+nHNa957JHnGpjWe6ISy5gxfARkIBMUcEx/411Rlcc4Shi73v4M9JgbEbs
	BKLKiXOVN70um9/drx5GwvkRdeYhMFYNH2YRP0sUB/gUi0FZQOdV70H4ueig0yg5RH0ihZAyIFr
	auPX2ZbFv6Dyoz2yWIzsCxvG0GuyHn8f83KDxin0CIZmMWJMVMR+C3Pd217Su67lK
X-Received: by 2002:a05:7300:578a:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-303986833b7mr7948604eec.32.1779155306744;
        Mon, 18 May 2026 18:48:26 -0700 (PDT)
X-Received: by 2002:a05:7300:578a:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-303986833b7mr7948592eec.32.1779155306191;
        Mon, 18 May 2026 18:48:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302946f2149sm14501890eec.11.2026.05.18.18.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:48:25 -0700 (PDT)
Date: Tue, 19 May 2026 09:48:20 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] pmdomain: qcom: rpmhpd: Add power domains for Nord
 SoC
Message-ID: <agvBZFYoq9XidETH@QCOM-aGQu4IUr3Y>
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: LaSn79lzvcuu131Z5e89h8o8K3jIXc_1
X-Proofpoint-ORIG-GUID: LaSn79lzvcuu131Z5e89h8o8K3jIXc_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAxNCBTYWx0ZWRfX63Ir/xfKli51
 T/5ZLLsdKxGvFvdUDocztPzOtb4kYuzBHfw/hdEtqr3SHTiWsrWNzHmeUirAe64rLTa7EmCHM36
 goIj6Y7ZM3nIQia+gMas5m4IGgBohGTB6xOlM4runcDXm3gzsdVvyBN9LiAadW834VxB/6Odr8F
 uDa4sCw5HnAluiZhiOw9yOHRdPEi/prZIIO8nZ4ezEtiUV/BfLXcUCvYhgZCA4aazZQ/v0j9F/h
 xT3HxRjpR7ysRamlEx+Qr9apwTLY8MkbPoOQSulaVTvGSS7DzbvBu8nyuieH5hUezkO63VANhsB
 ngTuqMUKXvUAr0Z/23KWRc3/XEbfl6wFP/tzFqUZpJA5HnUbBjcKfg+pJra+KWzcJaVaEOaN0aA
 VI5VDGpMnZkhCXmK/mRI6veEhQibvvRUCVEgSjb7TaMtUTuVVqriHZKLtMsJmL4LHqmGWT7YhiW
 7PhhSIrwX0bXW8Fp8ug==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0bc16b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=rNwRBFL3uO6c_JmZLCcA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190014

On Tue, Apr 14, 2026 at 11:59:06AM +0800, Shawn Guo wrote:
> This series adds RPMh power domain support for the Qualcomm Nord SoC.
> 
> The Nord SoC introduces two new power domains beyond the existing set: GFX1
> for the second GFX subsystem and NSP3 for the fourth NSP subsystem.  Patch 1
> is a preparatory cleanup that fixes inconsistent whitespace in the RPMHPD
> define block before the new entries are added.  Patches 2-3 add the DT
> bindings and driver support for Nord respectively.
> 
> Kamal Wadhwa (2):
>   dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Nord SoC
>   pmdomain: qcom: rpmhpd: Add power domains for Nord SoC
> 
> Shawn Guo (1):
>   dt-bindings: power: qcom,rpmhpd: Fix whitespace in RPMHPD defines
> 
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                | 35 +++++++++++++++++++
>  include/dt-bindings/power/qcom,rpmhpd.h       | 18 +++++-----
>  3 files changed, 46 insertions(+), 8 deletions(-)

Hi Ulf,

Did you get a chance to look at this series?

Thanks,
Shawn
