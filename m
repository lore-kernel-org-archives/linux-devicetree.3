Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570D336A375
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209356; cv=none; b=owf+qoBBygKFKPvcADGHPAvYj1amzMy1kR6+gQZWthyHySwSXPgTJnm9/inwciBHAU8jzXI6JxqNWWCxU9KNYH/2SblhKt8FDHceX7dWgLwPmnYE4LjloZUWgvRzxkU0KWkJaflp1C5FIsMZbcrr10PY/DK4BTFSKcFDnIaxnIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209356; c=relaxed/simple;
	bh=3y4RuTTJNLUFUXPYMbUQ7S8NGmlwMUTx91JD9JD33nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqgsT7o0qkoO88t0VDUzndkKYCSUV1eY1SzpCsBLHzWXB35mmS+z9USKOzc/8fKY3DI6IvsC0AvxadyvxPXlWalmOxl2wjjSNCgXmDDdpvjtgNU2pE6xjxAXdViUUXTbv9zTNGRNEMMB9bInQDTvnFOUax6AKx505beKv+y5K9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Theh+Kbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKV0t1pF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Theh+Kbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKV0t1pF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3kjF1483490
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xJZJ9xOtxo/SGEidDFpL5mXa
	/YUpzW0hXPivz5u62gU=; b=Theh+Kbop1JICFoapkEXU/+HG40FvGtIwVhMW5Mv
	G6Gg6Zs3K2dbk6PVdVv+kzRW0Kag9z5GrkxBQzz/dMl8Tqk20nXgVjw0LK2VNuPc
	SPsD80Ar3Bx2C8M8mIAYwmM7mqYNJZaJ3E7KLVJoajxlKP8iLBI0Ot4QaXj38Yi3
	QXKlJPhLQxPKvsX4AdXzvmVVgrKr1ZPEDD17G8PvKyMOk76ja03kjKjFu/cdbm8F
	eKQIspiaj4s8A377peILxFcGZMXCZPYYHpS4h6XJhTiEIft8sJF6cD0KAVmVODgk
	jC6i7pSSKg9BTHAq9Oh1GQbw4Nrid6Psfm6WlGPzfLWijg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd0whp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:22:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751c50552dso98230137.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209353; x=1781814153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xJZJ9xOtxo/SGEidDFpL5mXa/YUpzW0hXPivz5u62gU=;
        b=HKV0t1pF8Wxrbqxkg4yyA/hE+HnemeN1eX19O+lnwIvmHCM6S/7Psk/DWS2gowbXgK
         q1DAqtajUCWln9UihZsvQ9Za3b2LDvdZdz5DyogWLx+agZbkTF2FV+LwJHysIDwoGUEx
         4B99ogpT7JXZUEsDr+ea8J1VMJ1HeO6rPO7V/2et0BIaLPXm100cYgyfyE/cIDRzuN5m
         hx9sq2GMx5JDAQYzu5HVPP32fP7J/8Y63QVGgH52mzjI11fJry7l96gx9ZW/OFQPNZxc
         JITzQq8LzyrECnNE7fmcV5+UEgiXGbA1z/ynPEPUnIniMKIL56+2MD1DIaTGgRjaulWD
         0lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209353; x=1781814153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJZJ9xOtxo/SGEidDFpL5mXa/YUpzW0hXPivz5u62gU=;
        b=FObUMne8kmdog1om+wc3IFLafIeZhu90qacSLy8E5tW/ep2OH4fFJhi1olPKpoRIyJ
         BHmtIroO9Vg3To8fXv9luPz2qoFAfd0P0ubTW8KSF5KYdc2mgWXt8pNmt1ljKSmKId99
         CuZxm29LyyKZk3MDoWcRxGAuTYj3YwqsblePVtZCd5JWBcwk7hmnYwg6x/tNqy+Qo30Z
         +nL7cKKgRk/SlFOxpkEA4U+XN3mGbx5KpJgN+vSHov2e9TRGFDYDjwwu5vmmPkDrMh0P
         ycPnSeNRhwY9+f4aoLfa+xJ8D0mrUOc064kRAzgFTxXYWe3Ng3BzAAGpW+y7KL0t2Wb5
         Di5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/AZA1qE8EgRQ/SgA6srmqYvMfn0Fe+DBoovroujCEf/mr0pI+miljKmhPe6OsS6EFTOf8ahFmvxIor@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc0g6rzLoR8Ol1VASVaNLwp8i+w/TdKlEiAzBDYFUcGtsCvZoR
	IshpJiNJROyECFBQ8juTdSL9amAQMyPMOaaY7yRx5E/foFJ3dgKN+/KmnVQsW3TQtwJZvDKMji+
	XWbGFmL6Q2gUOOJhv3o3SQnD+vYNFmvn8JiON5QaMMgNzIZJoM4vSYebuxtMreeSq
X-Gm-Gg: Acq92OEyEEUudLau0Wzn+7a84mit1PvQZbpC5g+ieYP4LYp11YK9DYlaxy0kHgGGVbx
	FAF5MGOdPh5bfXvndrNsiMEaCxHo2yjXmQWJM5DoOtPgKNm6dNYlwzjpaO55Xycl9yXf3COMjA8
	gd6dyR2lPXSW0V18SEaKCr8Ydj+KlQPXbW4a/lmrJ9fKgbfGK6fTLiDX0QCnAzh8ZSaCbIdjlyc
	cDEmbTBWASz1nWqRBPBqtNi2iwYIfxSUkP2is5aLoj1ag8ZlMZXf4yfNVdAr53xA1UxOU7jfH1X
	VFt/lVJ1uM7TqIaRdbH7GaMPufZ8faG0SMp7LEtaNvvsTQqTGNfkWIcz1ZHjnR3I0dPEwrf2mu6
	SbLu1604QZGRDFGL0iIWAndXSFN9zxmMj7V1P9mOtNq3yLu0AxB1idFYbj6bsbYhuqbD7CxwS2C
	7OfJL+QksQlEtSBMEfc56UXHYXSXKjWfencGk=
X-Received: by 2002:a05:6102:2921:b0:650:a5d1:ee1d with SMTP id ada2fe7eead31-71d5d398fb8mr2993506137.10.1781209353479;
        Thu, 11 Jun 2026 13:22:33 -0700 (PDT)
X-Received: by 2002:a05:6102:2921:b0:650:a5d1:ee1d with SMTP id ada2fe7eead31-71d5d398fb8mr2993489137.10.1781209353023;
        Thu, 11 Jun 2026 13:22:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f1b4basm242091fa.24.2026.06.11.13.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:22:30 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:22:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Message-ID: <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
 <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7rma6qUh67M4Vr8QaszRKGkXfK6Edseo
X-Proofpoint-GUID: 7rma6qUh67M4Vr8QaszRKGkXfK6Edseo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfX7pslak2hMKZo
 lf3XYj3HcO6OF9PFxn4IZcAQ1os68XUxCVBHvx9bqJgbEiMMW+PkyC+Tg6ScHZ3zECbdgySGWdp
 afoA1uOO4LgF4SU3QwyhZ7FNNGCGQc1RXikfiy7dnLKsRoK5AkQQbdhZYizj3QmpyY/0sbX16PL
 P9jBvj/Maa9aOCC+FVi6tv0U/VbY7+vEUlRpILNTo4tJcwdJuEZWd2XbRwJEYhVRydRGbpaj8QZ
 ha+6DYEh+h3Je4CdHmQcDve7HEV9W4vFxJeiNkbdMnCLckIyS8FuRZDflKSYqoJLZcwKtobeq2Q
 WgnZib8kfLY8ESw1LkkrqvngufGPzAzZKub4FaC+i1hFixfQkmovYka1dEDKNlnPskJEu5QuaGQ
 VvmQXDKgS/Mes77HLES86mck8Z0BW65D/Y7TUhFvkCxH3rUyG7yPCPfuf3eXdF6oVKCtkJPU5Xr
 sRKwZETweFrnXigHdug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfX7yqwm5AMd8wP
 PcHjNuIzDeIeJvPcXJEBsPZhWeMAJ78j7FEqY4mRgZxHouaALZOIRNQSDFTozkBtLUm9DBUL+qy
 qWo/ERqLAuRcZZxDf/AReVUvShEFkZI=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2b190a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Khteb_73IZe1q6EfuL8A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110204

On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
> > > The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
> > > 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
> > > supply.
> > > 
> > > Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
> > > refgen regulator supply.
> > > 
> > > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
> > >   1 file changed, 220 insertions(+)
> > > 
> > > @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
> > >   	"vdda-phy", "vdda-pll",
> > >   };
> > > +static const char * const ipq9650_qmp_phy_vreg_l[] = {
> > > +	"refgen",
> > > +};
> > Now vdda-phy / vdda-pll supplies?
> 
> Cross checked with HW team again. Along with refgen, there is a on-chip LDO
> which supplies fixed voltage to the PHYs. It is enabled upon system power on
> and no SW intervention is required.

What is it being powered by? MX? CX?

> 
> regulator-fixed doesn't take the resource 'reg'. May be should I create
> another regulator driver which accepts 'reg', something similar to the
> qcom-refgen-regulator? Please advise.

If it doesn't require control, there is no need for a separate driver or
separate supply. For example, the refgen is being references only by
those devices which require software votes.

> 
> > 
> > > +
> > >   static const char * const sm8550_qmp_phy_vreg_l[] = {
> > >   	"vdda-phy", "vdda-pll", "vdda-qref",
> > >   };

-- 
With best wishes
Dmitry
