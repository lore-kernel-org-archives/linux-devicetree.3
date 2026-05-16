Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F2C355055
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778927275; cv=none; b=kpNVTihXj2iQ4bvA0mBSFd/H6B5YwC8eBQYHhJwlD2mzLr3Uxb23I1bsaDX79N9g8ml9zl+WsE9AhaIcFDMfFOOhYNVilg/9QLdmZ9q4zxRLfFtqEUg0OhhJS9MuAPlrdhewwxXZjEmDK1YwLMzwLvjRO1Xd5S66LnKN21zGe8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778927275; c=relaxed/simple;
	bh=f2T9F2uzvCEHnJctjhQVkRix8CUIzDtpiO/xf1Lnc2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADiIlJF6MjRKPh7bOxGae1AUWOYlTZWnKYNyvj6h0dHykOdI3m8G2yUO1/N4fjViHpGo8RyN12C2bQ1OHulxUkxM2xhy1TSQVilo7xKFoRbZAND0R4rGPerV8gPkhrta+jc2Os6RzYYP5O9daX1BjswIhZaDSk+LF8uz4V79xr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcULcQcg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKjBHdA6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcULcQcg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKjBHdA6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3hxwX3749826
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 10:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xr7WRuQMnnc663mN4U36jexc
	m+Fp+os5jRqkaS5NzHo=; b=kcULcQcgknS2cAOU+2Au5cXRQWFRtcMw6TUukw+Z
	xattKWjFtN2GV5EuPK2joqQ0Ii8qQCDlcQjQ3PG4v+1B6ZgGyFcbVapa1Q5YF6Ur
	8ZjQRljU7u9f+6BnNemoHZ64qG8MTu4HWU+y3jfXYr+RQ2JYhwa0CkoKQ3UxN6hQ
	5h7j2J1E7MpWZ5UVCKL+3HN08TY6OA/T6tEdzNFwTTION0qnntkkSHgtNWESPE4/
	rKnxZLZPrNN/MjNandZi3pe3mLswn1aJws2CxT+jFm50SRQfYeqySLv72FmZHG6o
	jLb6O5+DZzd4eez5RDEqDFhelCLr0gy1aeg7hMQ5+h8KnA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6rmpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 10:27:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514a182b90dso8812811cf.1
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778927272; x=1779532072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xr7WRuQMnnc663mN4U36jexcm+Fp+os5jRqkaS5NzHo=;
        b=IKjBHdA6v3/KHvZcJ42TxCtWI29i+8pbAIRygM5DlgeEftZfGCEHlima3jLUE1GoCp
         mjyHqVYenwQ3izK0qtGD7IrGQQ8do2gnDZ/MrKFYevL/OyxfWZWChjz6t2L8aNyuVGpm
         WrMmS7oSRBAThvQp6aOhT2ISwgh/k99Jt07yYWdiQiewS8YxCLSuEmA80fK5881ZB1lC
         IcQbHquN7/WV10GwnuAFTZggrg7lt/F9X9gYGxpi30LnirQbhOOKGjJ+cWw+jEsO/Ooy
         BYOKFbfu6iKRWGPhsbNpRAzvdyxwCkFXJIkbrMOgIDAbLN60ArLbES/G3RVtMH1SGiWe
         HJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778927272; x=1779532072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xr7WRuQMnnc663mN4U36jexcm+Fp+os5jRqkaS5NzHo=;
        b=YCSqaHPGU4+4/6yNwbjEbxEBtcDhHkpPGjiWS8GouZAZMzf/+YM2SIGx/e9YI5fV/Q
         RtgkYvTO5Lqg35oTRzLu+l8KISZugjWpTKEgO/WGsIJUbielhJuZXAehedRh0bHwfuBZ
         QpUA7PZUSUlds/7i/4lJ1t9YnSvgzi7EcOFFj22avvSECEV7UHCCni1nIxhF9A/a+vqT
         Q1g6GWpo8uT+OaShI1TCIK4/X/Tx4Uu5Mz3Ju0COi4g+BvBBZxmee2Yii+6uRxh5piGw
         r5qvJkbVQRCufJyLsy/VpsBW0sAOBfXQTUwfgkns2WtK0dsmwStxpqizDm7+LE9p74RZ
         XOjg==
X-Forwarded-Encrypted: i=1; AFNElJ/TPd0hEc4b25NuFszJEfpm9bxUFbEA6YwPQOeNqPJJNN6yhRrht77YU7vBNIP0/iQG6tx9BqGHP6wS@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWuUODQmY3mr7B5uHSKY9XKxvn3DAaA6hPGrftPe5DtwIlgFX
	C8B4gMJIzLqkhwjhWjSz1d5sygbsLb4qSuSltoxurgZ2M+ww4eXbboh+ZC38dWMIGmfH7EUXJRO
	WpHavV/9/PVTGBoQ9UuX86zRWDdYpw9drvoOYarQGY1+SquXhvFSXRSSXRYX8IGM9
X-Gm-Gg: Acq92OFlBmpp4r6RrZUpBOoJbNjc29kqOJZlNVAj+8eiI+LRMth7iKl0ijkKu8LUhY9
	V65/bMYtzlf+FQem5zNhAYs1Sr8zBhPW/ifYUTgSA6BXb8ldAmOQJjLFWNEiKYX3qRarZnNYwv2
	cfJmttby6ST+mrbWoQJAhXCp+DOkNi6nC+xHNJgIonaooGM+snEgs1roFpd2iDL4bCm+chgnN2B
	Q5jzTlHJ3oDM+CnotescD1sFuwwLZdcYE3s8eHj2ACnJuxAu0wnnCRnGVIBBCctVTY2dKxIVTYY
	yjEzquo2jIyIe8I0TfYq+BaB/n5Z3PY15bC/Ka0PYZmwJV8kS+VlQdAn8DYE/awE0UYKj4D053Z
	sLtlolJ/RDead6B6btpaFLAYxIu4haDtruoU=
X-Received: by 2002:a05:622a:985:b0:516:508b:bf4a with SMTP id d75a77b69052e-5165a219c0bmr102897431cf.42.1778927271542;
        Sat, 16 May 2026 03:27:51 -0700 (PDT)
X-Received: by 2002:a05:622a:985:b0:516:508b:bf4a with SMTP id d75a77b69052e-5165a219c0bmr102897141cf.42.1778927270992;
        Sat, 16 May 2026 03:27:50 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab6aasm128802725e9.2.2026.05.16.03.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:27:50 -0700 (PDT)
Date: Sat, 16 May 2026 13:27:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <mxgc3iogd2z5m44xffvqc23cdg4mregw73vslujcdr3ff5hyvi@zqgseqplhoey>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
 <20260516-sheep-of-radical-popularity-d0cdc5@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-sheep-of-radical-popularity-d0cdc5@quoll>
X-Proofpoint-ORIG-GUID: tPVJ0_5ERBxxLKdALCaF-Q5qUE4kMCzf
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0846a8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lnExPUdf6Q4ZbYV5n58A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: tPVJ0_5ERBxxLKdALCaF-Q5qUE4kMCzf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEwMiBTYWx0ZWRfX6yWyo3XP5iKZ
 M3THBr1S5bkwRqNKD9dK7/3MWK1XD/hjuJCaIVxVd9DUApppvjHftUWG/M50wyefG7XAnjhXiGA
 Js30/cA6GlZCsqX1dqfUGbdAN4rtiAcoJeWH9Xw+xXT2AbqgbQIKq4654axKYfq1mRGb0aShOxJ
 cM1rCHLKl34iF1SbNxi3kCGkX1ukbDfgaS1ievKeMQ5VygSABhqEIW7kLjywDMZTPoQKueSPD39
 oZIGRrVIVUAo4Zp0swu296G63HGtfrdzblLVXMCLWtheGCiG4/+SALhpwLdsnrAy1rG6lrs09tn
 bWr3qi/3wAT7jh5m5l/8clAOsgGUdIGIPvjbZwXpUzAkAMG36cjcdWBiImPfNumcFt1iYP5wVfc
 7EVni9qupzvSw4t5ZtfpHJ8OUlJhA4KLOWM0QIJNAJ0xjJqitnfVxSdujtRrTi9udbKhS88SWE3
 q1mWh6yx70uShMY6i+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160102

On 26-05-16 11:58:56, Krzysztof Kozlowski wrote:
> On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> > Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> > boards. Both boards are built from a base board paired with a SoM which
> > is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> > LPDDR, eMMC and UFS.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index 2741c07e9f41..28a18254b4b7 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -63,6 +63,8 @@ properties:
> >  
> >        - items:
> >            - enum:
> > +              - qcom,eliza-cqm-evk
> > +              - qcom,eliza-cqs-evk
> 
> When we talked privately, I asked to mirror Shikra approach. But you did
> not - it's different from what Shikra sent.

Because I think it is wrong to describe the SoM since it can't be used
without a base board. Listing SoMs is useless, IMO. But maybe I'm wrong.

So my reason for doing this is basically reducing the list to only
describe entire setups: MTP, CQM EVK and CQS EVK. No SoMs.

> 
> Shikra received my comments - but you did not mirror these, either.
> Basically you went with third approach... well, I think this is the same
> case as in Shikra, thus comments from Shikra apply here (at least what
> I expect to see). Also, another reason is that this should be
> consistent.

I did read go through your comments, but giving the rationale I
described above. I did realize just now that I misunderstood your
comment on Shikra patchset.

Anyway, will rework according to your suggestion.

Thanks for reviewing!
