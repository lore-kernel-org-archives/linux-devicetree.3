Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DA8431E65
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786442815; cv=none; b=VhQ4Vtm4aOk4Yl4NZcimil3aPeZArFSLVGj8Wcnt2Le0/cnmCbG0zQaTb3APq4tDgxMCxmFUJDlRJPM7fXj94jZb2kJmNI619uY0zeXsF7xVZvupzkGRiIyiFaaYVAzwcCJggdco0YARqQTa7w1hel/RRKSZk16Bvadp00yseFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786442815; c=relaxed/simple;
	bh=1/r6EtW60fns51ULiJJkfH9xxGYDd5LJ+4gmagIfBto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdJf/9cAeLkUOvAWMUodRXsiFWrPyqlTI/NC0I2CAmdOag5BHDhEtGL6QegWDNTQSMIBnbqMlkbySEKy1RGwiEzBNqQ/N9crNciyRIaC8eKCvZzT29xOi8pMEMGzLBUoVNP7OWkZ9pViZ4FECmrRDaBFSOtv1IUeswVNkYCt/Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/BNF3P5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irJMhDUT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/BNF3P5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irJMhDUT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B6udla2812878
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=scKxtiqSOwBFQc21NkVPF0up
	unJEoVm8FHU/U5KS0X0=; b=n/BNF3P5gjEoMbfm8jnRSShqUJS6pAOHkYDd6z9I
	peP4r6aUjFs2RoFlioeg3tYwpACON4o6K4PXF7ES4bYi6/44rGilbWlm8xCslV13
	r5EQb4LUbQg9MCOEzWmK5iz3jbpEx1rOdvzVqpabSI1qcL+z6pe3JAJ6ngIEHSKC
	OPvlgVP+LCgPuAs0KkW6FMXQdynKlnRcyPI3ny8YuFm78Ql6yDth9H/2Sxr2YPDx
	458iwoVHdXpBr2Z2n7EcG/6gep5SEXq+mat4OyLPJHokbuT4sGeEE6DBOhv834Tm
	AaFRFcZr78j7eLIt2mjfliKuS1VM9gJa3VSuxvc53hq4zQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwerqy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:06:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9087f2fe592so1668036d6.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786442802; x=1787047602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=scKxtiqSOwBFQc21NkVPF0upunJEoVm8FHU/U5KS0X0=;
        b=irJMhDUTwcRhXRdITJDTPIWDUwADpiFc93Hk5FYIVcnhlp7m+rHoq9JC6tvUm1C951
         THIalUIOIH61iRmHUSWFMkFwBHpUObaiLw9rMS57PB9ARQNBy9dLpwB8TOYxJ2b1z8rn
         q9fGFj430VqNLiAv3N5bANorCrvtXp6/YywfeWXEH4nV5hxEcXevixXDU3aDu0DtbKlu
         ENIpApVBBalvHkrhQjahTGbqQaEziG6Xw0ZdlWQXzcsEtBNYTNS9/PGj6js0ZKLI+A55
         C1DPlCyjjdCeDr72xj8N7YMvJTCbBQchjUkobw/Ngg8WdHXScZ6s9O0u+5PGt3q1+eib
         XGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442802; x=1787047602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scKxtiqSOwBFQc21NkVPF0upunJEoVm8FHU/U5KS0X0=;
        b=dNUIJm+jDdf90Kf6lVRmsb/Kf63s+LnBzf1utauh+BLXwZVcUY9qPBtVlHBsQhSXAV
         a9OaRZLQGwiNDXFVYj3ZSTHjAfWR3SI4/QVkuPzepQy6Q3CJXH1Wc+UJROgVrsE9TyQ6
         COJicf6UCc52x2cmCTi3wYOKJ1zT+Us8vV3WA4n9V8o9MlDnXhRhxzRBQTItPrrb4PLe
         8ZF3kHadRCL0fBuNqA1DP6m64hodeuTGcAQBAwMlbzxntBMPBgoWSsdWw+ghwTimKREM
         B0d+CU36IP0QvTPGtDabwidVm7jLp+J0H1gqrkol37SxpyUN+LH+SmGgJq9qUzkUzJ6i
         1cDQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIIqg+Gzq8HJ///iWPcQC41hnmme2pnu0C1TebO4511ejPjErdoroEP/YAKNwCFB4/+LXh3+giwufx@vger.kernel.org
X-Gm-Message-State: AOJu0YwK0iqhqz7Sds7BQC9rY3dyQSlWj54IO/3zbJCly/jyVPawGVr+
	BxIpngSD9NOmKgzV7nQrDOUGU28cNL0H2tsW4dzHXdrF9eKdI6y7VfwkGT8sNfMTDoflMN84dtl
	R63qsihxrUn/GTJ3jqquTYgPrxtpbDYn1ebF03UT5140JIz/wtsFU0U4vLpv1aZp6V8jtdbPE
X-Gm-Gg: AR+sD13PS4if1YDPD4qVk5palT2h05uclWcwsG5r5Qr0mBn+KFV6bV32+SxatkEdU/r
	+dOlWmwPOguZUdCt5802ICxr2a5KQ4a7iFJJw/JWNnjwb2StC0YsRMW//Dgc+wJZzmxGumfH1ac
	xn1RR0170b7bGe5E1kyJbdMFMcSpInaHxgnH4qmjHFabQ8q4//K2tyB9fsyvgz9O8xzfFdrBOYl
	Q8ty/DzzJ4oHVQcpYBY48ji5HVkO8CRN45ZEM8JtEXnloa4el+EBxq84Az8BNPeYG1nChcCeYpI
	DSkYWKniujjski9gtEuLbJSfKuvkARCzzwp0G2I7jgReIu3HnkmDCOXeMgXTlMAwn/jYfn/qqWL
	cTLNvHjM+FYWMq5GRV8YQFqndazXd1MjZ5OExyQSop3iaLGMV+OJ6LON3610jteIlF7ljpvuNie
	88XoW/rW3FU91Upg==
X-Received: by 2002:a05:6214:40b:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90a668d9e11mr14256516d6.15.1786442802157;
        Tue, 11 Aug 2026 03:06:42 -0700 (PDT)
X-Received: by 2002:a05:6214:40b:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90a668d9e11mr14256016d6.15.1786442801757;
        Tue, 11 Aug 2026 03:06:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486c0b96sm192135e87.17.2026.08.11.03.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:06:39 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:06:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq9650-rdp488: enable PCIe support
Message-ID: <ibrpfhkqryw7tvgpy52curh2an4pvwvvfmdva4bkwr7f74lfmp@7gom25ntqi5w>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
 <20260714-ipq9650_pcie-v1-2-4197749d06bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-ipq9650_pcie-v1-2-4197749d06bd@oss.qualcomm.com>
X-Proofpoint-GUID: Flvlvjl02YxGhmIqjKtPcL_QG3sopxGJ
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7af432 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BkY8d_yo0xCmcOyNz0MA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Flvlvjl02YxGhmIqjKtPcL_QG3sopxGJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX0SFDq15oKuon
 AMuorD8oon75bzZNQgGLbjOp4TQ35EKBm6U25eyTokWsy9dqTKjss1WyCm0NZeOop3InBnOMETh
 81MvHLYRlrqeznGNk2kx7lXgF8tHFyI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX4KNK+nm/auzB
 U8ZvwU3JHjXdyoPFHiCu9kbuDEkRZwV/vJAYjHSSgLQF44yAZsDN37FP/6tGvNs44/0KKO4OCG/
 27ZL6tYX8Og/pcPYsFh/2LXlw4yW3a+UpQRSlOPLHO2SkqaChD8QaB3q5qo2X1r27N06QTkCxRl
 xC54jnACNmrAR2aKr31m1t91BLISpE8Uu+pU4DQ5fylTmHVAUwt7d9Df686CjUEEnlwQ9jvipA+
 UxJARPO0TyMFzwKjjl7EK06kGKo73gZCNuHBudXe7WlbbwEsrNSZU5wnpxyhe3vrBcQavY4fClX
 gLJXBsgGDOWKTXYdKIgyiiPJVL72dNGdHfyHeU9rUIojysfPMlVca79PphEviOHDulzA3v66ZNq
 tyaaAijBfS5bogF60AxCDHLfCTGTvqL5y2z/PuJ/ZUgn15FShIhvmLQoKujlY3EXg6BmlkN9m1O
 I2luCF+qgmCyRS2bEkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110083

On Tue, Jul 14, 2026 at 09:59:17AM +0530, Kathiravan Thirumoorthy wrote:
> Enable the three dual-lane PCIe controllers supported on RDP488.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts | 119 ++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
