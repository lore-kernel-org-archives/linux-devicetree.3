Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091C21CA02
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 02:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776308300; cv=none; b=ZoHn6N4PzvgfEu/xtPTLcdc6liLOP9xGACC6gjO2snKvhxhbK1Cldyc/Br0DuLaD7BGYVDdp5L2waVLRpW/25V2I43hFSuMVajXnVav0YfJMtUGou2ZB7r2WJF59iZbU5+QHuQG5xyNwytwIhycCyXs//1Aq9wNwPnuGOlvuw1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776308300; c=relaxed/simple;
	bh=ZuLqhA9dugUYSi9BiYicfrrxswPDdSZRzsZXP3MEFWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BybVsi0QJuIVgOXvgATqgokjYEJ+cPfNT5CyVDCo+CzgCnf48YsFnDPn3XMdOISU8VdiMpxmOSKxYOMACG+byMbVTNGGOkydO/Dhd5LwffSkONQPsc82NIb0HE3+Y4UpYhpTfOOigoln4VswemMl6Fh9BSi67Lqpc3+gXShR/r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFAwbK2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/+l7qjE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFAwbK2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/+l7qjE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G2b1aa4052921
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 02:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h7Cz/mpEmwKn1eYZoiIeySQz
	A7Xab0QN0U/cYPnax80=; b=ZFAwbK2rsYnH8xFRLs/O7mlnJLtFy5AQpklL7HUx
	zzH8PhpKXscxBLpqKINiJ4IGQ5eLPf/5U8HKOYtDZvuTbeC67CPoE82dMrmDXXgq
	RIM9Cp+5VoiHXNDhC9/GV+MejXPRJtaXhsPEqw/5Eqj8CkFTPi2SyFsTpJLqSQoz
	YXjmvdIRQJ3d9hVSV5mlmrLgVm99quHVByM/OKQ0+I/BzBOs17YeOkr/chnVFblE
	E9exQ14ZWNFccUnTVZ8tbDokn7dv+7UMXWb+wEia2LsGovWAe3Hdo6y5fvLoDjF4
	s6D0XvigVQFaTJhmWRDtOjKc0ZknDjw/nnqOlHV1eQZR/g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7s5u88u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 02:58:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0ba59a830so9639227eec.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 19:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776308297; x=1776913097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7Cz/mpEmwKn1eYZoiIeySQzA7Xab0QN0U/cYPnax80=;
        b=G/+l7qjEYKr9pafjBfjDToda5kfwiOcF/IkVAdMp7c2rOnkrU7fmDF14GgYAWqhhW0
         xb09WxPtBwlEnqhxbkteINtJbGDb4624WLFD4L34i161pCnfpj30rgVM1Tpys3YZegnC
         /B4HbKfyWuvCCEtdf83ZXfPDCC7+PLsPLEmL8FtTLgCE8VlQV/CeWv+SOP9jpR1h3Ya+
         JYzYmXIOaM7LIP06xG4OggboyZu2dtPKAadpr9BBcThxlnHCeAbcS9ZqsnfVCfXxH3K7
         wkPsoYOE9UNpGXR7JkoeNDBIeAgOyXC+1lkMBAipM2y+f7xgGSJy0eGN9DdnvzIUGL2n
         pI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776308297; x=1776913097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7Cz/mpEmwKn1eYZoiIeySQzA7Xab0QN0U/cYPnax80=;
        b=fz21nQqJ4Va+S7H2PsLrh6/gd/NZlJ4qTmhmx0X2NFwwWkn/Nz9AB2xqcyKcIcPFSy
         mLKAQjDtD2cZzhLt/KOkDIMDEB+BLeOneUdsd4vZqjFulUIFErU+SuxjOFvwYH+jN3Gk
         bERG1HVIiwGIK4RI8HI0dqtPrVR/jJaHtdCSGHDjWSZkOf875K6PlCGm5r2lU9xDm97n
         CVlDR9uIO+o0BebAN4wzQ6ogWrodkhbc35ZZYXw5c/odZ9x0P+ARvx6yupEjRJEY/VTX
         2hKbR2lx6btOEW9TBIMtu17DHXk/2EmQXz31n8Nn5PJUafpNSYm7kOS+i/sMOryJcA2c
         O5Cg==
X-Forwarded-Encrypted: i=1; AFNElJ+60N0lhegSb7BHZ4FySYyPI2Bs+9FnLCDZeztzHPcYyrg/bReT/ONKdrE2OkwBal6TYbEuabmWFbQu@vger.kernel.org
X-Gm-Message-State: AOJu0YxdIyvWd2iLsK3gzRlDLG85Dig5RU7ViM72excox3ms95ZgMfBp
	uaUwhj9+5c2R5S8EYzGZrGT/ERrHBUeVObHBjaaVmzPzk9fpAQ/J9LdVcoTRdei0q7UGyi4h/L8
	LTtmfdDY02Tta7leNP3apmeu/z4Thr3l2VIbDglMihSrraSMMXwwzPf26vLtN0Utp
X-Gm-Gg: AeBDievtYgGWDeTuE6fMLp28fn3PhxKHhld43Sk+XHzY/W0uiJchLT1gpilXvelmKUu
	1sJA9CP/HL9VyndnTjdt8NLzR+1dCW/dN2isuirJWCM7SbEgZ2q6oyq0n3zET6n2zb1tinni68A
	18XkcOGFirn5yyrGFkmQpkAH2l9N4cxFe5g5Tu4S8eZIJZCBZhdaTz7Ofy0fZabmPiHGRYh1Pim
	rlunSbNADX7ddnBmx7C0K4hWlL6YUKKiNuxUqMLzlgLnJC1MlNCb2KjY4r9dmywgQ+HrL3a/afu
	YsiUWz3MzGHjXGFUHDfCcAMEKduwhoEgLleqmV9S3Y6iHDieKb8zqNSf+0lUEcCjnuxox7ljlKb
	H+mlkeTuFpfxhBUp7+q+Y3LUasJKLUv7Ajfo74hUJkaxCBCDezLz65BX9q+ESU3OZaqL9tim+7K
	FURcA=
X-Received: by 2002:a05:7300:e2cc:b0:2c1:7793:7bbb with SMTP id 5a478bee46e88-2d5898a59fdmr13847145eec.27.1776308296667;
        Wed, 15 Apr 2026 19:58:16 -0700 (PDT)
X-Received: by 2002:a05:7300:e2cc:b0:2c1:7793:7bbb with SMTP id 5a478bee46e88-2d5898a59fdmr13847117eec.27.1776308296024;
        Wed, 15 Apr 2026 19:58:16 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c605851sm5522629eec.9.2026.04.15.19.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 19:58:15 -0700 (PDT)
Date: Wed, 15 Apr 2026 19:58:13 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Message-ID: <aeBQRStG3imY0cOe@hu-qianyu-lv.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
 <20260415-wooden-prawn-of-lightning-dc1ddc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-wooden-prawn-of-lightning-dc1ddc@quoll>
X-Authority-Analysis: v=2.4 cv=A7Zc+aWG c=1 sm=1 tr=0 ts=69e05049 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=73w2PV_BYJwXTn-nqSYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: eE7B9yHQcGGRRnMHL6UTtvvwlqMoWFyY
X-Proofpoint-GUID: eE7B9yHQcGGRRnMHL6UTtvvwlqMoWFyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAyNSBTYWx0ZWRfX5plrCVWG3UrS
 Xqk7lJkHQjABRNzIbTKd+MUTucawvVPq6pPi8+uiEm6dhUfTJ8hsf2zthL+9yquqPPeYoK74o0H
 KxYsFe97n1LV9nIyYtzj15IpVQHtpGI+ksJmUDXuKwW8gUAZk2PChSR0kcAw0hgL6fIehtOOlCu
 PrJuYb+YCWfP1MKHsRRKqgjy6XtTxrulrJ3mKGne8s9kaHiKDhQoq6IWYHg2qCNha8Pvorh3v4R
 Bv6XLgqNa0gMT3Fyvq6VWLcSMvDWvCSMI7+XW5pySYUfmFJjLege5CAyH+9jJ2iJ+zPO7zpABsd
 Ai6uj8hNC0txrqzWYEe444IuoRZs8DdH4xwb4+fBqS5peWVZ2+sHjnjdu62ewiRf7WB0AQ/TQeN
 sWHhBcEDNN2wRKy2ExEE3itLg8ZWGs0zdlskI2EIL0gT8A4Zm66LyufkqNuMl6ZXY/FqczqaJJH
 JE0lWnJzluL+ErHJRJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160025

On Wed, Apr 15, 2026 at 09:50:28AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Apr 12, 2026 at 11:25:56PM -0700, Qiang Yu wrote:
> > The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:
> > 
> > 1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
> >    4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
> > 2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
> >    follower to form a single 8-lane PCIe Gen5 interface
> > 
> > In bifurcation mode, the hardware design requires controlling additional
> > resources beyond the standard pcie3a PHY configuration:
> > 
> > - pcie3b's aux_clk (phy_b_aux)
> > - pcie3b's phy_gdsc power domain
> > - pcie3b's bcr/nocsr reset
> > 
> > Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
> > 8-lane bifurcation configuration.
> 
> Do you describe PCI3A or PCI3B or something combined PCI3?

I describe a single x8 PHY with resources from both the pcie3a and pcie3b
PHY blocks for x8 operation.

> 
> > 
> > The phy_b_aux clock is used as the 6th clock instead of pipediv2,
> > requiring the clock-names enum to be extended to support both
> > [phy_b_aux, pipediv2] options at index 5. This follows the existing
> > pattern used for [rchng, refgen] clocks at index 3.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 53 ++++++++++++++++++----
> >  1 file changed, 45 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..14eba5d705b1956c1bb00cc8c95171ed6488299b 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > @@ -18,6 +18,7 @@ properties:
> >      enum:
> >        - qcom,glymur-qmp-gen4x2-pcie-phy
> >        - qcom,glymur-qmp-gen5x4-pcie-phy
> > +      - qcom,glymur-qmp-gen5x8-pcie-phy
> 
> That's the same device as 5x4, no? One device, one compatible and this
> suggests you will have three PCI phys in the DT - two 5x4 and one 5x8?
> 

It is not the same as the 5x4 PHY. In DT, we model three PHY nodes:
phy_3a (1x4), phy_3b (1x4), and a separate phy_1x8 node for x8 mode.

> 
> >        - qcom,kaanapali-qmp-gen3x2-pcie-phy
> >        - qcom,qcs615-qmp-gen3x1-pcie-phy
> >        - qcom,qcs8300-qmp-gen4x2-pcie-phy
> > @@ -68,20 +69,27 @@ properties:
> >        - const: ref
> >        - enum: [rchng, refgen]
> >        - const: pipe
> > -      - const: pipediv2
> > +      - enum: [phy_b_aux, pipediv2]
> >  
> >    power-domains:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: PCIe PHY power domain. For PHYs supporting
> > +          bifurcation mode, this is the leader PHY power domain.
> > +      - description: Additional PCIe PHY power domain for PHYs supporting
> > +          bifurcation mode, used by the follower PHY.
> >  
> >    resets:
> >      minItems: 1
> > -    maxItems: 2
> > +    maxItems: 4
> >  
> >    reset-names:
> >      minItems: 1
> >      items:
> >        - const: phy
> >        - const: phy_nocsr
> > +      - const: phy_b
> > +      - const: phy_b_nocsr
> 
> And now I doubt that all the changes here are for duplicated node.
>

All the changes here are for 1x8 PHY node.

> Maybe just the commit msg is confusing and instead of describing some
> node which combines two other phys just say what device is here being
> described.
>

Okay, I will focus on describing the required resources. Is the
description below clearer?

Glymur has two physical Gen5x4 PCIe PHY blocks: pcie3a phy and pcie3b phy.

Besides the independent 2x4 topology, Glymur also supports an x8 topology
that is described as a dedicated 1x8 PHY DT node. In this topology, the
x8 PHY uses resources from both PHY blocks: pcie3a (leader) and pcie3b
(follower) resources.

Add qcom,glymur-qmp-gen5x8-pcie-phy to describe this x8 PHY node and
document its extra required resources:
- pcie3b PHY aux clock (phy_b_aux)
- pcie3b PHY power domain
- pcie3b PHY BCR/NOCSR resets

The phy_b_aux clock is used as the 6th clock instead of pipediv2,
requiring the clock-names enum to be extended to support both
[phy_b_aux, pipediv2] options at index 5. This follows the existing
pattern used for [rchng, refgen] clocks at index 3.

- Qiang Yu

> Best regards,
> Krzysztof
> 
