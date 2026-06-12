Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2633AE1AD
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249078; cv=none; b=jOZcsvfanCtEuzFodQlP4SxFRkOzFt4U+RJgzlpYyNHUAUMbosJdZl973wl3LWjUNaa2834Z58ZOeQWw4qiwcqbQ4sYpmxwiXN0m82HlpN4yq2mZ4OBHIzo+N+ON5X4Sot7AFnZB0gq1FjyjHBcaYJGrA+HXZyrRm9pI8M8IAuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249078; c=relaxed/simple;
	bh=PdeknrAMiLIoRBn6npfOw2nQAm+be9JQYkuNpyld3cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cG/XE1iiefmRx4YMqNWIexwJ20utbd0Sg0xIDG32sIPPq0E+Aw1mFvct6tQNB6mA105Di+uyr0rmKEdp5TPt8OjWNHmjUGZesu9hBgwoAmmXn/Lhi53BHBxrpStKH7sf1AcZUfi3OBXp80T1QV72/S/kOlBWfFBcuqddZXUCgvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtFjhjyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIjlRv1c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtFjhjyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIjlRv1c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bl5p2548636
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GPAVTLBhhFJdNBz/7VfALgdW
	+TGwxvR3jClWBIVeqgk=; b=RtFjhjyS7kPnWvpVJ4lgZvmw6t8azgNoDuiYrEKq
	nvMqWiyFcvjqo7gJovygu05HjeQ2XSDar55Mf1pQ1OJDnXrXYnvH752BEA4dhe52
	7PuH+vWJkKIQnQ4rnOhy/Z/BoaC55BA6ohhebO+06U6023bNsYZ8UtzuSFEOqx2q
	vPaIRpjfMAtEet4N/38vEi9FjcQy/QjP0newjQSelRmskOGM+pfAg3gmWeP2+Szr
	FKKjJalCTFcU2nZ81y3tpSpQvcIuYrfW4Fve4XZNluLc2qkoEQxi5cDhWurJv9IW
	k5MLjg54yezbaJS0jIieFi8l0EPq2p2rCk9vbDv+2FlS2Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29ut59k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:24:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517787172b0so10769311cf.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781249074; x=1781853874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GPAVTLBhhFJdNBz/7VfALgdW+TGwxvR3jClWBIVeqgk=;
        b=XIjlRv1c1nD9PPcr/HS3mU2r6mLdx4Z5YX1eEXqYJrHZ/CaUTLuYkH0G+UHajpCgN7
         eaVh4jLKoWFZ6aaHm7GdgrOi/gwH+yvRtp1fuSo8SKCbbE3IZggL+ijqME9d76q+5tx/
         JlFKXM2sN25+xdGmEry2nCa1SyuJznXBm10zBqY5mWuA6ZdnC0U0NjDOkFaq1nyYkf05
         Y50lWYzhihiMZpSQ126yZcZ8NTODVbv9x7lLtgsWAe1RcQeZX9STnBKTdPYIN9TZOEId
         zWx62nKcIAlLDXW2u1Jh6kke9SvF+kz8CZLQYZ5u/F+KSa8O6S9G1k2eGVMabY7A/cVv
         2glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249074; x=1781853874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPAVTLBhhFJdNBz/7VfALgdW+TGwxvR3jClWBIVeqgk=;
        b=pY7upPDDKr7QyniD63moCx60IGI8P4b1EZIwjwvfD0joYx7mN0kqA71J6rXTCWCtQO
         75eO+qfxhVP/Knuff6oLaobhXfHRvi0z9dmChWGqaTrTWWJNG2upwPXcLUbD//VDgL5E
         dYwlV4es879ocnpFgMIv5ZxnJb/9e6+YjaurYkcpyNZ8+80IwANvRrrJx29ISf5oUa1j
         wKQ2CxgZhcv2Zb0lkimRFfe+qKgTd5YmlC9mqfv1Vecklero/AqKHQo7jb8y+sp9uskq
         q/TcarqWxD4de68WVHRsIoUGyqI1BSsxqFCZNbZhwghaOqVXC8aCnFTbSV2YtPfEBN7h
         aAzw==
X-Forwarded-Encrypted: i=1; AFNElJ8eYG5o+RbI7cTSEdF2tlRkrSKRdzggNt2djVvZYfQcqXaFa6gmkSfXoOUqxu4Cc+jck/c6Y/XYHvkh@vger.kernel.org
X-Gm-Message-State: AOJu0YyydOGnGBNRVFuVZIen1KMlZOpe6H+3zkdN94N1pU1ZXmQG35v6
	3/aZm/hrqVPRkOctcbwIq4MRBV3+8fK0Cst1gI/ZIWgZzWgghOOZKbxvWNPGRnlMgR5qxTnmBhe
	xSiEyUml9YMJnXBsQM8WLSt51HpHo31OItMOReWcLtOvrG5vTzCsst5YfUpKXpB2q
X-Gm-Gg: Acq92OG6BFwUPhCvFYFrp6jLE12qoBtKD/J46dcX3leD4/fY1sdWgzQThntol+k5mVr
	GNojlqNg2P776XyZ7X5zaaUW5G0Jd4Df9ZKUEbDGCrZG0htSfZkXlJhzk1QOwIWrn/AgNQFWoCI
	L97WxYAbdnGPDsV8V6GMOoSbV4+ix3ZyADvwagGO+aT8JUGCYz/Ztz6v6hJWtAqsOid1Dioxe3O
	DKTkiXLoiBZ0wtwuYpHKoK0pPxglFj4i40HhZs9TyOCiKp0E1CN6tl5V225AK8Ox+WoDPeDsjt7
	7ipXfvIURth7FEpt/cgTIvAdBtNkHUhqCBxIHTK1Ikya650LgO82cANKqel8/wLVFaJRUsvNjl8
	TjF3dzGAKKS2fxsW7s7t9X3NqDEPnBkz50KD3h/AcRoJhj7e4whEJVf6jaxLIBl30RqYzFfqD98
	Xq7mrpubZJMBcPILKNY9lmZmWbiag+Zl5uAu0=
X-Received: by 2002:ac8:57d6:0:b0:516:dda7:51e0 with SMTP id d75a77b69052e-517fe25ffd6mr19995061cf.17.1781249074253;
        Fri, 12 Jun 2026 00:24:34 -0700 (PDT)
X-Received: by 2002:ac8:57d6:0:b0:516:dda7:51e0 with SMTP id d75a77b69052e-517fe25ffd6mr19994701cf.17.1781249073798;
        Fri, 12 Jun 2026 00:24:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1adae5sm297181e87.56.2026.06.12.00.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:24:32 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:24:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Message-ID: <epxrpj52vst4zjigsn6ghaiajyzkwdtji2dvgrf7euag4indvf@wzhhy7wtuhhi>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
 <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
 <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
 <602e893c-d346-486d-86b3-50d0f01990bf@oss.qualcomm.com>
 <ohijjcszynmoocjarid7mo7nbtd2dqcdvqrbnzb7anjytw5m56@nguadudsz7qg>
 <a7952e7d-468e-4ad4-8d95-f6bfe9305170@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7952e7d-468e-4ad4-8d95-f6bfe9305170@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfX/3sWEi+XgOLt
 HPIIRxiT8+xdI7cSPSPg1V7H8A3ae1xJ72YR3J+aLfr4LHMutFms9iPZQX0q774Ic7Mp8LRD/yx
 AQCmcUrqTaeZE0R+TayiEWaQYv6RjIU=
X-Proofpoint-GUID: bUX-ekQfDRon0pfcgntlwVvOcMQKBCRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfXzR5tPVvt0nrZ
 CmX438I3s5vPhLCG3tEJ+Bj1lhJz9yaW47LYgR4hydKvDAUvZD0gt3W8efotzyMifl7kIY7Mfpy
 qJMEFAFHASCfjqWFiEFoprkDlON0Lknbf68o2tCeaBFF9Dn25hb6XtlH2DtlXon5JuCxKIXlTHH
 RfayTLA/NBUXEAd/wloLZqoFY8PTGqIOim8PpaUIiqTkT2zJSxArUS5rJ15m6q2tHCqHLfX5eEM
 G0erVzPGxjN2Nhml2X8VN8r+r61pyzZESVU7PruWE8sjdoSmqLi4SXf4lZa0BswruGeRH7KkbkL
 pAJcd+uf1x+FcrXVeucxCn3cJcWrKMxjHK7VW1uI+HXCFuUJhPgOkPVKCxFXxmCKvYx/jTzB8WE
 8XBuFVor33KbgGb56/3PHfsRSz6w3kC8iLzREReJPOKAtATfhhshcZFF2/ovnQQrNLLfLTJTnJ/
 +3z/lzOcQnmbBwC2fJw==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2bb432 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cx6O33gTLCPIekaZO1cA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: bUX-ekQfDRon0pfcgntlwVvOcMQKBCRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120065

On Fri, Jun 12, 2026 at 12:13:04PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 6/12/2026 11:44 AM, Dmitry Baryshkov wrote:
> > On Fri, Jun 12, 2026 at 08:22:02AM +0530, Kathiravan Thirumoorthy wrote:
> > > On 6/12/2026 1:52 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
> > > > > On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
> > > > > > > The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
> > > > > > > 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
> > > > > > > supply.
> > > > > > > 
> > > > > > > Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
> > > > > > > refgen regulator supply.
> > > > > > > 
> > > > > > > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >     drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
> > > > > > >     1 file changed, 220 insertions(+)
> > > > > > > 
> > > > > > > @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
> > > > > > >     	"vdda-phy", "vdda-pll",
> > > > > > >     };
> > > > > > > +static const char * const ipq9650_qmp_phy_vreg_l[] = {
> > > > > > > +	"refgen",
> > > > > > > +};
> > > > > > Now vdda-phy / vdda-pll supplies?
> > > > > Cross checked with HW team again. Along with refgen, there is a on-chip LDO
> > > > > which supplies fixed voltage to the PHYs. It is enabled upon system power on
> > > > > and no SW intervention is required.
> > > > What is it being powered by? MX? CX?
> > > It is driven by CX.
> > I assume that there is no CX collapse on IPQ9650? Is CX not scaling on
> > this chip. Please provide some details on the commit message.
> 
> That's right. No CX collapse on IPQ9650. Let me rewrite the commit message
> as below. Hope its okay.
> 
> --
> 
> Add support for the IPQ9650 platform, which includes three Gen3 x2 PCIe
> controllers and two Gen3 x1 PCIe controllers. The PHY instances require the
> on-chip refgen supply.
> 
> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations along with the
> refgen regulator supply. Note that an on-chip LDO, driven by the SoC CX,
> supplies the PHY voltages without requiring software control. Note that CX
> power collapse is not supported on IPQ9650.

...neither CX power collapse nor rail scaling...

LGTM.


-- 
With best wishes
Dmitry
