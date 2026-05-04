Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C63DE44F
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777903147; cv=none; b=Sr6uqkdficMDuC3uGxqCS5+94BsH866ysFZSCodCFUt2AJV8r1o2oxxeYIpWnVg0rHZvVCsWmRYQ8slBZu8tQHlZLjeREsb9+B4Q4C0OnITR42Y8UhqN5hMRcNBIp0u6kI/ggsiQkR0NYBYcupepT5YNIvEsgKNR11xDQs46Zjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777903147; c=relaxed/simple;
	bh=y15kLs3sGaEX6SUswDVtuu6Y0cf0YKiM/wbOTXt7rjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MF6kY4Evz1S30zjWUB6J+qzkFdgDVYHb2l5Nn3YAq0HuVaRv7f3M7DAsnDekB8NRD85mdqXOo4hwiFkYSKIJ7tFezGJ6Z3+aiXWGRC9/PzloVvB5sjRVOQA4iOAuZvnRLtWkpgLstGQx8SUs9c9PJfyrbGJQA4Jmjcjdf/nTcW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIyL0FNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5O/eWds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIyL0FNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5O/eWds"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4IjK1531315
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 13:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aniRG2KoHodHG6kSw+zQ8UoN
	MbU4RgeqkXy4ZEzC3SI=; b=iIyL0FNXbrkth56Tg4Yo1zYS1f8HxB3V5F9us0Gn
	F7/RdQTeRGZNlU0D6GLz1B4yTsaGbb4IDzW7UoSi622aU51hgLbtNpZ2d/19/t9H
	HNoEpYH1kKi6b9r1QQ5V4x08tzOEfQYBq5VpUjC4RaFY/Z7X99xM/q7p0nPKpm9j
	CM9SSEQQ3O0gBMm/+DEdI5W2MeTr0kU2VMHOZkMMOTjcSZ61AZJuWRJfnAcBY1oB
	Jyy5vIf+ocsTw3HO4IwVyZLNBISg/cj1Ypv36EQPbqHL7HwK2kfafPMMX/ven/9x
	Uf4BLJqoWUYmBXrZ3ujG2nPwP331M2pvGdGVBrc9F31mdw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1enuur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 13:59:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fba8d8c40so103157541cf.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777903145; x=1778507945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aniRG2KoHodHG6kSw+zQ8UoNMbU4RgeqkXy4ZEzC3SI=;
        b=I5O/eWdsut7pb8VmeJ9o5b8PK0V4gs3YhpYWm0xtZHp5wKdEaZUg+KPCwirQc7nY3d
         iIgkR6b3ogxkW5TtUpIqUcPs8dnKeve3qUYPLdSsPvrfPEyYf99DvRm+BVzwv4SlR23P
         ogmvI80+PH4RLYP8l5G5lZFe9rBU2+BkkQDGG7Ua1MJBBWBnkypEEQrewZQdCiKOE4Sy
         V2/IjwoipfXdHmCYHDZj2LK9SqOa+/1vOMP6ymPpihqCnzNm2R8gwqwYF5nvHHARqSbC
         xndOasUkqjckWXP9Xwk+YFQ2ghOsWUOTFRpkdvnzL6ZToQF5u9QJz9NFr24WZ+1J0TX4
         Vl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777903145; x=1778507945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aniRG2KoHodHG6kSw+zQ8UoNMbU4RgeqkXy4ZEzC3SI=;
        b=qSfvALmnkjCqwWWhiDB1wZhLsXFV8eROctqtFQ7KASiENuqz1CLZoGnC9CIzy8dXSr
         hJ0KL3tOWX6bs6euWwLsrgR0GV4xrwxSpWadoPTgsd8ca6+1uS0hOmO2P4MfVifzNTE9
         aozR5gxM/GP0+3XwNqze2OwZsfiwteRR/HV59xjdvi2t/Z46wfVE2dYJF4QU9V6j6Ix/
         /GwTTL1ua9ahSIBoqnX9ZVdY8i8DFrozkCJ3XnvfITreUKYo2m5M7eIFtwyB3T3F8bPg
         sA0PhxaK5BVaxVoj9VHbcHVGWJ7/9UteAURVc5CgujInC6BBPJCVide+mJm7qZ28x3fK
         fGCw==
X-Forwarded-Encrypted: i=1; AFNElJ89BBtvqlRHBLY8Mo6H1D3eMEohadldS9CZYCwKIjs6bK3zVwrS3Lp71oUiN3x5K+em5Ue+clSjIyfr@vger.kernel.org
X-Gm-Message-State: AOJu0YyKJAuLnthHvL6xE/2z5cSEJBETlTLSgHhpjjUA24RGtBmKxB74
	SydJLPaabnz/9asT1iO+JBRyKg78VOktOGmCX8h8LR1ISpL0JscchMsFj4UtEtI0ByNmb4JS9kE
	D23wbHgNYzumMUTEiEch0CC+bm0udI2oG4srbrxs+HlXivlhgCEqDWIkt7+MpPBwX
X-Gm-Gg: AeBDieskgSl8H5U6Osq+FDep6XnkBKZoGH5ZRy0yjOtx86tYxeiuFiUwWOexIDHDB0O
	60gLbks0NVqodfkwErXHojzxOXlcV0NuCdU6BEDb8SnlzKBKRUtVDv9l7J/yDHiRjYD9L5hw87+
	Ky/Uxim4sKJNX16GL3q2RZhtKir6Kn1yRi2+0SOfsS0bIMDe78ElHA2Afhc0GG5uD0vPPCtMNut
	UGJ3dIHjDCIGW+U1XYq9y0cSlhMTYYTT1Xuk50vE5jNK6bTl2TgOdCInKxBBLnDzI2PSiDhJAU8
	lys6AumYIxT4fKZuW2+5W0/Q2Hew655iKk61Sz22k4t3QXmr3G2jljRU7DZambQGZxqT7qLrjmb
	uEYDdBw6emQ3djm6wqQmFqKQfPdFgElJrLJyRswNA2t+rYCm91yc20nE3T6+zKdFvC+BfsTNo9u
	bJuj8PeKIYYm0FzlSYpefS8rnxfPAsYAb1x9V3kXEmRvHeNg==
X-Received: by 2002:a05:622a:514:b0:50d:8905:7cc7 with SMTP id d75a77b69052e-5104bcb8b9bmr138356591cf.0.1777903144983;
        Mon, 04 May 2026 06:59:04 -0700 (PDT)
X-Received: by 2002:a05:622a:514:b0:50d:8905:7cc7 with SMTP id d75a77b69052e-5104bcb8b9bmr138356121cf.0.1777903144486;
        Mon, 04 May 2026 06:59:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e5asm2994316e87.33.2026.05.04.06.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 06:59:03 -0700 (PDT)
Date: Mon, 4 May 2026 16:59:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add Shikra interconnect
 provider driver
Message-ID: <m6z4ha22u7urf6yd7atkizhii5fbnl7golkdw5v76e4pmfcpvv@r7ppowo3pfcq>
References: <20260504-shikra_icc-v2-0-81076171e010@oss.qualcomm.com>
 <20260504-shikra_icc-v2-2-81076171e010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-shikra_icc-v2-2-81076171e010@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: liCHrQlwNcy8HmifaJ2Ynj9Y-1AMT6Tv
X-Proofpoint-GUID: liCHrQlwNcy8HmifaJ2Ynj9Y-1AMT6Tv
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f8a62a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=j7VvbvnbhCrZ_lwJNYUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE0NSBTYWx0ZWRfXxAqMVF+y4pJ3
 WElrql7bpl50tsXZd/Q2rY03eZd9h9Iya8ipFLZpXNLEqiOoWW3zoA7C4Fq47i4wMA7OwlLhxc1
 UtPdDYN2sMbUliyUqNe25e+YjRLB9C35AIyg4epsU55JblljlUc1zYXy+vzMIxEJffpgkw5lMpP
 34zq0ucZrz2DYd10OljYhVxYVtkQ5hPaPCXfU9grw5lrliCuByfPgn0IsTWBwgl6lEddvkvdss5
 PQT+dqs5bBTGbybyD6fpwVNa6dyzP48UthnFiGXSPPJI9cYF0ABKuzm61QVQB92nCrrx+0SGYJE
 TaVK8j0VWrkb11JLgLXbmxzuMCWVqp6jeguG4qDCcxpBuYvEQLPhsGt1Wd9zlqYoCFS94QSGieT
 9ggITYWOL5nXnnJwTKmYxaRHMvZ4CqWfNWROt1IXzNViFjFLsaaOnxbmo+6qvxTXHgi0peDfIrp
 GqlrQ3z+abHAc4azuow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040145

On Mon, May 04, 2026 at 09:41:14AM +0000, Raviteja Laggyshetty wrote:
> Add driver for the Qualcomm interconnect buses found in Shikra
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/shikra.c | 1837 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1848 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
