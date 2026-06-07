Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660022D0C7B
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 19:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780861352; cv=none; b=R42TO7GEBGh3Gg5Lmm5HATuXSExWe1OvrDL9zBuY0sNXzwREbkVQ0hxlQnjnPfksHHUWn7vgZEsrlZ3qx2X5TLQoV2OA7s+dQTHLFtvviDjj8boCjPaS8kzQZe6lqxrq59ClYKSnWcMKPAGijREGRa+SQhneKj0CTOyZEN1fyFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780861352; c=relaxed/simple;
	bh=ES2DCtIMXp6EM4W7ecLww5anWKNLLTynQTTGt1Rfa9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCFctMFitR3IvGTIjNAyyVDstZ6x27Z4z4QLT9ZJdLdYDcs36m07UFbN/8j+KAJRyTfYjZQAAmYcJHCBqHe9RP9FzPiQL2vHb3oD3D45XAm5naD/jufndo2+rwypmLCrs5jP/TGMVSWOXl/+0rDNG6RT6dmS0G5W1Vq6hv4jstI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mf3C3vIU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2px/nMD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mf3C3vIU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2px/nMD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjwXj373535
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 19:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BF24qm58BnNqIGE4+EPnvFG4u/xZPUBNCeYGCTTa2J8=; b=mf3C3vIUguAmGMpP
	4l6HpmuYW4DqlHbh5JLhaN4MPXoMcw9V+v7N4KHx6R3ebicANrEWT237+LiFX791
	ORKjBZ0CZ+16G7PUsdPXp8n8LpBdgmKDgoFqQnPjlRLihQV/MQ3Tt+W3I0s4CnUm
	LsSjq60VOCbVQ1MqdLZYaYcUL2Tsctwxude1vu+UFaug8br4fEaVQWb2XgmgqzJt
	emI8eeigib+Lkqr0yOdk9ei8jAK+iR6P7Ue3D9i+6EC5Sa0lGfUW4Tw0N85oNdeE
	iN/8SjgD7339mcrGj+Grze3YmG4TjVvtw4itAIfzyXVtvBWIrRRw//1n09FXpprE
	he914A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadvbnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 19:42:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfe512e871so1724693137.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 12:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780861349; x=1781466149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BF24qm58BnNqIGE4+EPnvFG4u/xZPUBNCeYGCTTa2J8=;
        b=B2px/nMDvg5wGu6tImQB3UEvN8mVHSOeWx6bm3uQc1duiPHnbGhxtDOw1v8o3nvpBB
         4zzbG17IaF188xL+os1hpYygwMqKme+UCIm7vGpT55mTTcJl9Hfy/r3oOFqKSFvydrOB
         rMirjqNEeEYCfz3c4sSV3M5p20XWMpHRmVVYl3S2v5ZMWYvv7lGdxV1D6iIoDfJ0aqDI
         g9W2Y0t4Vpv3h7200nqt9yihpeKUwY4YP/x+mpcqwTfe1idCjxfF8p4BOGmbb+zUIIdK
         85FwcxEBc0D0wkfpMsUvI6V2hgU4G2cqNjVdV65DtarB9iSV63z8XLOATf6Bek3uSV7t
         lIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780861349; x=1781466149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BF24qm58BnNqIGE4+EPnvFG4u/xZPUBNCeYGCTTa2J8=;
        b=mXZD0aSzliW1hG/4RD2ErpKt7jXgOUM6akExtKjip3k4qoHraH1n3Ye0ZOL709ELHz
         AX3DgEqyT9cC2YujrW8mAl3eO2wXQtHdx+eovhaMlcUZa234TxBwXD8LqM+IBsyjH/GF
         yP1KPUonb4pRjiPAATlqD2q2iMqL6SD6ozqZfSvciMqDqymQkqnZ9vhyPrV/2ifOcsxg
         Wh/v86qaHDi1Uw2ANvUfiOlvJURvfWeKQzd4ueSzmB0/rqnJaxGezp5ekHBkLtgFi+4L
         Q4drEetSQ0awZyK3/Hmpz8z8DJaPjJtcnO0De3CCFBf/EzaxdpM2fWWPjJBoRHB2FCED
         4Jmg==
X-Forwarded-Encrypted: i=1; AFNElJ+nBusfCt/KTor5jmuvWcSIfkXxMlcvZdNcDmMnA7DFo12gCsEdICpjxLhLyRTuiza41UiMAEBkw3fj@vger.kernel.org
X-Gm-Message-State: AOJu0YyMcZ++UuR5ZhB8H0WYDB3V8a8ulSPzR+sRYLMpoJxx6oBzEFyt
	lDIA4hFRWfQmiYtEaYiizbomvy8oKLnrhhW+mm5s7mGGwXEq79aVdmFZa7oFnFknkP4Nw4hckwl
	Cx7UzzN84R/HfTvgdf814qdEPDNHVIcfbA8y/LQx2qVqqGUug7ccYojvdGT8SboB/
X-Gm-Gg: Acq92OGjstPTe7lDOlOGwMFe6FqlA/olvRxV/S3vmhT9IeNai03Togd1oAnORTxgGvE
	5xo9KtITPoKQXz9yRKWcC44kUqMEBGDOSf20a0olqbahkw+KOHiSJahSzhXqPiesZ/ofq7nqms0
	VPoONR4Mfag41Dchl+B+9IOLtWMW+XEIgxYJ4tpV1hVaRiChaU4PqYvjCazkjEaraHPxbOVF2z+
	Bn7HnS//QYhwGL6d4m4XAW0UhjA2pi03nhZMMJwfP8MbEPYwYp6pVqyhzcTgHfSV7NXcoG5Swf/
	cHmf382ApV6f8NRmYyiFfR7iFhD23D0SklVV65CiEXWGux3rDUbgrGuz7Ew4+sCW2wjU0rMhpXx
	XUN4B9uXGQmDPRV3VWNkbibctnJP7UhifGQxb/GS41XG6pZnFkxaHhAWpFl6MaEG0R01/b8w0V5
	Ys38qmrDw6id3vyaFwIVZXZwkW6qG1gBVy+BHxPpsCR7uziQ==
X-Received: by 2002:a05:6102:554c:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-6feef09ad62mr5487795137.2.1780861349602;
        Sun, 07 Jun 2026 12:42:29 -0700 (PDT)
X-Received: by 2002:a05:6102:554c:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-6feef09ad62mr5487780137.2.1780861349154;
        Sun, 07 Jun 2026 12:42:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac091ccbsm41172751fa.14.2026.06.07.12.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 12:42:26 -0700 (PDT)
Date: Sun, 7 Jun 2026 22:42:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Message-ID: <ll22r7amswo2mxz4edvo6s5lq6cotdsbepy3zy42pndjinz7yj@zpkh5hp33g47>
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
 <ci2ur4vurrljhvkza7nqfq6hsjpj7aurb3r3lvjkebfwkcae35@kvnjmosamfzs>
 <6d2f2756-0d83-4a84-a39e-d830bd0d9164@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d2f2756-0d83-4a84-a39e-d830bd0d9164@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a25c9a6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1jXWVeKMHtOyghREYcwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: irqJvn7rhr3reNB8WNjBH4bNlqarGqoU
X-Proofpoint-ORIG-GUID: irqJvn7rhr3reNB8WNjBH4bNlqarGqoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE5NyBTYWx0ZWRfXzHlCHdoTVhby
 X92lqjVwR7j8sF3jUu4ybRvAiOLoqU1B+QCF6Xedql7ilSxIszERq6PPMUeInkfuOoC1xUynwy1
 sS0Du13Ga0IJ0hNhnkA7nUWdCHpxpgRmlt5MuKUJAlD3vEUJgF3zrKi2HTlq1E9HK8BycS7oBNJ
 vnutyfUKnrr/hNksTBcePIOqIjxbZcLvQ0RG+17jCkON3TikWzixbW65nEXM29Bu040Fo9ZdDuQ
 db1Q2DL4EqG9DE4eU6OY+kmOKzSOdDczxWtx29ezlrpZFO1kcBef21WjSV9F2G93cY8SRE2paVU
 rcc3WpeLfapGEEbzLAldtuXjA1BLgfjiN0FsivxGb9qoyvSmaqXTqoCUk2lUmvhLSoPhl0ACkCJ
 pVfYPdz05pFvPKoENUesTEOk4Fbh+XNpxySNZRX81mY4YGjvWrPj1xrzekhf0eTW2B6dRFZlYGS
 K+TSvyEoTVYx1TneJog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070197

On Thu, Jun 04, 2026 at 05:07:35PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 6/3/2026 6:47 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 02, 2026 at 02:52:00PM +0530, Kathiravan Thirumoorthy wrote:
> > > IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> > > PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
> > > enabled on power up but that's not the case for IPQ9650 and we have to
> > > enable those clocks explicitly to bring up the PHYs properly.
> > > 
> > > As per the design team, REFGEN block provides the reference current.
> > > Hence marked the regulator type as REGULATOR_CURRENT.
> > > 
> > > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > > ---
> > >   drivers/regulator/qcom-refgen-regulator.c | 94 +++++++++++++++++++++++++++++--
> > >   1 file changed, 90 insertions(+), 4 deletions(-)
> > > 
> > > @@ -62,6 +75,49 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
> > >   	return 1;
> > >   }
> > > +static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
> > > +{
> > > +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> > > +	int ret;
> > > +
> > > +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	drvdata->enable_count++;
> > I think, a regulator enable() is called only once. Is there a point in
> > having enable_count as int?
> 
> Ack. Let me change it to boolean type.
> 
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
> > > +{
> > > +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> > > +
> > > +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> > > +	drvdata->enable_count--;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int qcom_ipq9650_refgen_is_enabled(struct regulator_dev *rdev)
> > > +{
> > > +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> > > +
> > > +	return drvdata->enable_count > 0;
> > > +}
> > Linux knows if it had enabled the regulator. I think the usual case for
> > the is_enabled is to be able to read the hardware state. What is the
> > point of having this callback?
> 
> Without the is_enabled(), regulator core assumes that regulator is enabled
> and always-on and is_enabled() is not called. Hence, it is needed in this
> case.

Ack

> 
> 3458 static int _regulator_is_enabled(struct regulator_dev *rdev)
> 3459 {
> 3460         /* A GPIO control always takes precedence */
> 3461         if (rdev->ena_pin)
> 3462                 return rdev->ena_gpio_state;
> 3463
> 3464         /* If we don't know then assume that the regulator is always on
> */
> 3465         if (!rdev->desc->ops->is_enabled)
> 3466                 return 1;
> 3467
> 3468         return rdev->desc->ops->is_enabled(rdev);
> 3469 }
> 
> > 
> > > +
> > > +static const struct regulator_desc ipq9650_refgen_desc = {
> > > +	.enable_time = 5,
> > > +	.name = "refgen",
> > > +	.owner = THIS_MODULE,
> > > +	.type = REGULATOR_CURRENT,
> > > +	.ops = &(const struct regulator_ops) {
> > > +		.enable		= qcom_ipq9650_refgen_enable,
> > > +		.disable	= qcom_ipq9650_refgen_disable,
> > > +		.is_enabled	= qcom_ipq9650_refgen_is_enabled,
> > > +	},
> > > +};
> > > +
> > >   static const struct regulator_desc sdm845_refgen_desc = {
> > >   	.enable_time = 5,
> > >   	.name = "refgen",

-- 
With best wishes
Dmitry
