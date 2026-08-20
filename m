Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAF64734DD
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787261800; cv=none; b=eSfGovyFULCn6xGegORA7NDjaXrkHmluxsh6WSQ5HjC/TlHZhSDbqbIloC5AM/7Wsdnz+oB6jQ2K/caN5sng0Mi7PAd6xEXYmoANzPH/5AeK1YK+JnwP0Smi9YVKV5nB+omdBrFNveauTBPhb4nP3EaaOiVcJWxc9kUXDnvRg3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787261800; c=relaxed/simple;
	bh=I9AZnSwniSO5WvO64cAJZoIJY50IdEqvOl23FYfXQTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbcE9ieUzV5XWN9YAFjHuzGOBb0syRRGOPny5Y63qA2ceCaeDEI6MucPrYLhkSUt4x0l1PJ5leb4sWYR7xy7rsCsf4f2HSmptTE/uCzN1n+yOtHDbrWiztDwomifZBRMLXs1jGTQPHNtwNiBCEgNmsXH/HawJZQfv2k6i6TsA0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QedjWF6K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0BdqM1x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QedjWF6K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0BdqM1x"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK8H4H269619
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j2rOjyvAIKkmvDQQNmbmzmu9
	Qh82UJVg1SmbG+umGK4=; b=QedjWF6KVy0wtqNblnw42t55qhHEFlWxb8m8ZA2c
	ZndgJ5XG91Nf/R+JyjbmYco/C4+UDZFewTuceR/s6PYf1jkZCsX7ow+VS2j+b7r+
	A9R7zFpP7F8tRJKOsdxFxWNImLlCERfGNi4+xcejguZf4AOOJSO41nJ1iGy1wCM1
	GSI4IfuWFEGWr/a7O2v2R7BgKdAfLFu1zwUWoi6lB2jC/MTijIeQ0w3WrY56V/Di
	hHNlLLosuCnEqADY1BB0uiUoexXxIyigHINsARUZsh9lIIFLXBkbPOm7+8jx74mv
	yqSPFwrh4+WsN/VEb9T6CXiH2A5y0T/yxCzn4sOXYcAS1Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg1b2x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:36:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so5372991cf.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787261790; x=1787866590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j2rOjyvAIKkmvDQQNmbmzmu9Qh82UJVg1SmbG+umGK4=;
        b=U0BdqM1xtjLePAaUd4YzL5/PejCYwsUUe7bHkI208yvkAFs8mKXPwm+7Rfk4cih+gO
         UYKyMTvuUrkSHyZnGR2kykoBdu0XSfaJ2qoFoC7yjDx3D0bPKfh7ai1PRAhkzBYMGI94
         fdyAh5pHo/4zFKhhSf48VluEtS7dmU+60qR1syP1BWuWO7Wcs8ML19tloR4p6VJFwZCw
         Lat3NoM00NbcLa/1iNQzN1u+rWf5Ju/efvIwKvxgBIfAKSUnxdGOcGybsIDn1l+1aUHE
         yw2vl1BdHBZBGhOc5EL1lIqnlkVijnLdD1ktdW+VQsYQRBO0HufCbZFVQlejFNx+6naw
         DRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787261790; x=1787866590;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2rOjyvAIKkmvDQQNmbmzmu9Qh82UJVg1SmbG+umGK4=;
        b=lD2bC+44eOHyxE2b/ec36Ezlc5sQ5W9UpvMTOH0eop9V9kEbl7AOTiJceIrCUd/6KT
         tT8qRcTp//zuex0kQe3bbcMEhGUOnoqC3Zmu3g7398UxPP3csxd0yDNkudf+9gQPD13v
         54owkvLJrTcsFQT6hg5YOWRbOTxYPw1p7FoKUAY0gFrr9bNFQIwVHCE2vEgrcx1tMUFi
         ziSla1HAxW9fRN465tXy0WNHpyybV6GYAPSm/McVAN+3dXw8CZOUE0NIxif6JF34cvVr
         syPEr4SEHYQm83IhLrXwev1H/QG8IXpDkOzj6OualGIbRIDfojdh8MNeLVy4ZR3SoOPo
         aPEA==
X-Forwarded-Encrypted: i=1; AHgh+RrDjCdXvVIMHN8CVj9lTAGPcegVy5pTEBarOcb4BMrwvorQkGX0m6swSpm0J68rBtQm++cp30K0BPKM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1uBXWPaE/CVvOFWHPJqAeBdcTqMYErWP3Qt1uv+jqPAS4VMrv
	j7kzr/FrJ2v0HRlJ6VxN9UMkiLkgqw+h8EthbBnaHeJ3REYZqmJw2TAD9PA+7XAJM32jAH9w+/t
	Jq0IDfAkgfZ+d2iTqeUyvOKOvZUjZmL7XCqJHiQvJSOBMUCiOUwSzeUbQF6OZ9M8o
X-Gm-Gg: AR+sD10VX6f+xHKszIzxz32l6s6284eO6jMXVgMK5UCJW7eqMXbZCOyF9ntvbfCLES6
	je7XNO4nDrB0UoUg/YB9CPFfcQJHO3y8K/uDReWiEm7w0K3FB7kls13Etr+TY6hn7prxmQId9cI
	TMU4/isLfeM+CyVSfyTeAodmd5V0TAFmZeZf+kKT8jbl5lTWwEnwwCViLIDXBqV3ElxJ+FR0U7z
	o+j/6U7rzYniaPCcyXUO7gyZBgfxQUjYal3uOwbkfgofcPB0bgkNBqkYi737juNWC3i59Gvv+79
	qXihpD0JXtrZ5GnEkoVOLqSOLtDJwYOic927S7MXyr7z5VHcYYrfle1JAsgSplttfYmIeYq8iyJ
	odsosbskTZxrqtHV7ZOCYAtbqNVO2sal+Ile4F/VJfp2pL1QJBsuU24XiQsKG5lGcFMCRtkV4sB
	Qf/VLj41qzf0CP
X-Received: by 2002:a05:622a:5519:b0:52d:7b2a:93f with SMTP id d75a77b69052e-52df5665bebmr17193521cf.3.1787261790094;
        Thu, 20 Aug 2026 14:36:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5519:b0:52d:7b2a:93f with SMTP id d75a77b69052e-52df5665bebmr17192991cf.3.1787261789651;
        Thu, 20 Aug 2026 14:36:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b47885aafcsm1494400e87.18.2026.08.20.14.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:36:28 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:36:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy>
 <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: p4Xh2UeCMkvKph3Fte-PIP6LGbmzWC3T
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a87735e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=m53B41o1t5e8-q7OVZAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: p4Xh2UeCMkvKph3Fte-PIP6LGbmzWC3T
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MSBTYWx0ZWRfX6+epL4WC2whL
 a8uoJPzAuIBTWUFwqt7bynSIdXckLrDYxPRsIfV6IQNNIy29KXPWLHP43NnPOIB/k0jMfj59uwD
 i8zgM1Dtmo2zMFo983U2KMTveqtJlUA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MSBTYWx0ZWRfX87eU1XhEkZlb
 lZkl050wtxqKZhB3tCLoIvimr+swuaf+qiA2oo05tanzOpBGZi+Lb57VHu9e1itYlmg48oZMOvR
 0QihMt3hB2QlHxgpQxciURMMZuL9kpp/I1uA59/Ix7l9BoqCiFx9e9oWSL4CEElb89uqlYYPYXb
 WEmcgDOtt2UTToyRctDLE8EwdlErGTuD0Bk54LAKS6ysBqZDUGnI7S3onKI6sHfhNVSUp0PABny
 4oUzcI1dDvKYzWlfpvfp0REyek7/RHuyTJjZDkG9b2j4hYhMkKo070fWBfc6IKt7GJQDPnduSCX
 8nGNot+FjbyKmGeDVBVwJnYba/XJe3dt9pZvpb89EDSamLGkP3yj8DaZzVPFrJ2Hc/Aq8wCdML3
 3sWBH9+S7D1uckyPECS185szdnz9xSqK2RpRePyFD10yn4lbfrBymd+P2A/56/q21MphNWj3h4D
 xkhZ3DBRNBAZPBMJvVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200161

On Tue, Aug 04, 2026 at 08:48:13AM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Dmitry,
> 
> On 8/3/2026 9:44 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 30, 2026 at 09:02:26PM +0300, Atanas Filipov wrote:
> >> On 7/30/2026 7:01 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Jul 30, 2026 at 06:05:24PM +0300, Atanas Filipov wrote:
> >>>> Add the JPEG encoder hardware node to the SM8250 device tree so the
> >>>> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> >>>>
> >>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> >>>> ---
> >>>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
> >>>>   1 file changed, 72 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> >>>> index f11da2ca4181..d42b29419320 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> >>>> @@ -13,6 +13,7 @@
> >>>>   #include <dt-bindings/firmware/qcom,scm.h>
> >>>>   #include <dt-bindings/gpio/gpio.h>
> >>>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
> >>>> +#include <dt-bindings/interconnect/qcom,icc.h>
> >>>>   #include <dt-bindings/interconnect/qcom,sm8250.h>
> >>>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
> >>>>   #include <dt-bindings/phy/phy-qcom-qmp.h>
> >>>> @@ -4486,6 +4487,77 @@ cci1_i2c1: i2c-bus@1 {
> >>>>   			};
> >>>>   		};
> >>>> +		jpeg-encoder@ac53000 {
> >>>> +			compatible = "qcom,sm8250-jpeg-enc";
> >>>> +			status = "disabled";
> >>>> +
> >>>> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
> >>>> +
> >>>> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> >>>> +
> >>>> +			power-domains = <&camcc TITAN_TOP_GDSC>,
> >>>> +					<&rpmhpd RPMHPD_MMCX>,
> >>>
> >>> Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
> >>> please drop separate mmcx vote here and let it come through the
> >>> titan_top (it might require camcc driver and node modifications).
> >>>
> >>
> >> The change was requested by Brian, most likely in connection with upcoming
> >> migrations. I think he would be able to explain the exact reasons. As far as
> >> the facts are concerned, this is not currently necessary for the driver to
> >> be functional.
> > 
> > There is no word _driver_ in the _dt bindings_. What is the actual
> > hardware wrapping? What is being powered by which domain? Is MMCX
> > directly powering something? Or is it gated by TITAN_TOP_GDSC? I assume
> > that MX is powering on PLLs, correct?
> 
> Yes i agree there is no word driver in the dt_bindings but you get my point,
> with only TITAN_TOP_GDSC hw is fully functional there is no need of additional MMCX 
> power domain. 

This will be true if:
- MMCX is a parent of the TITAN_TOP_GDSC (in Linux kernel)
- the driver casts the vote on the TITAN_TOP_GDSC using the opp tables.

> 
> > 
> >>>> +
> >>>> +				opp-100000000 {
> >>>> +					opp-hz = /bits/ 64 <400000000>,
> >>>> +						 /bits/ 64 <100000000>;
> >>>> +					required-opps = <&rpmhpd_opp_min_svs>;
> >>>
> >>> This looks a bit strange. Are you sure that PLL levels match the MMCX /
> >>> internal clock levels? I think you need to vote on both domains.
> > 
> > This is not addressed / responded.
> 
> Yes this need to be checked. I will get back when we get info for this...

Checking the 4.19 kernel. cam_cc_jpeg_clk_src casts votes on the vdd_mm
(MMCX) power domain, while its parents (pll0, pll2) cast votes on
vdd_mx (MX) power domain. Note, that frequencies used by those clocks do
not match, so we need separate entries at each of the corners.

-- 
With best wishes
Dmitry
