Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01BC42CB07
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784902; cv=none; b=YL+ytKAFfOKfI+BMKJGImzTHYiK0l6pSJeGELyAMYOtXPQ9RlS+FUC2xVPSVUC6bUHaiEo56+V6hhP7r8gTD3wMrVp9wc72CtMjByNa9HI/oIogJDf74UnyGjIytwI6tI78aIOrz6RfnFUqNkkNFDOvCUczD3fx7SnrkoKZOOeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784902; c=relaxed/simple;
	bh=ijJL9mn6T9L4ysXdEfhE8T4oPo9j9i/9Ergn+FZ9gNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpCpWvad21TNRyPWFz4NZAx5t3dcFaU3xIYjnzCebFiPnkyVZqSmVd3qogIH8w/gdl6GsS7N+3hwylKOKb9JY2g8SEsMEsyU47ntRFfZwK3G0zAPyekXZB/uvdfoIcGbhV0/7KiyafWvOUI7YKVFCoNsTI3zo0mmchAEZiOEGZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKT1DzSd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4FsP0+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKT1DzSd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4FsP0+k"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gw2D11017573
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 19:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=30sbvP20Nu/wRNRtx798Pbv7
	BT4Kw2CBVHAY9RmIciA=; b=dKT1DzSdRnXj6XGRrEPsLJTdj0LcAKRxTncMB6+1
	1Rx1BwtknV9daKF+zGuV5o0StQ5JI0xNm4ZyNf2pdUAqLATdT4NecoG28CHb53q2
	eZWtzL1I3lWm4DMMZAYMntv3tBtwD35MD6MDC4vJ8Qx/kx20+EV4HKNGQKzSB+qx
	JRYPR8KSohJggxtdiGaKO6t9UUkAeDEneH097t57+3p3cuV407oBAd4XG4HZCLwd
	42RHTnlCBuFK1akFFLKtoOmadleh+gw70eISxGowQv9KqtnD7tYg+gy5k7M0fM2S
	emLcWou6l14moMlyGoAb7YnAOFTy3dLlH8wf5/GRCE/97A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r3798-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 19:21:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bff5c7035so78693451cf.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785784899; x=1786389699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=30sbvP20Nu/wRNRtx798Pbv7BT4Kw2CBVHAY9RmIciA=;
        b=H4FsP0+kdeQL4FQKDt56G9Y0jh1BlqOVyzQbf93ZJjoUKaFXQSWk4Se1Q9VgWA0rRU
         3ZN7mrNCXLYz9B7HE5kK3DjAnr5LkGc2YtyazDiFTNpfYzbGAv7deyApKd+UAaecvEmN
         QnnWuNb9mw4nlIe6llxerLE3o6CZizzkJ8EaVs1FtKVMyd/J4hcIktkP15QxeiVuINXf
         IAUDkQyK53D/R04jfBw8pym+5YpMCLX112yv9EtklLtTfZSA7X7umMH6RbSc00BFTFe4
         JuPw2vcQoiPKK7Ro6brrBo8LmHIiVpPZ+5MHfv9eCBM5a7C1l5KtsE2+0JiBUMytADlr
         OEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784899; x=1786389699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30sbvP20Nu/wRNRtx798Pbv7BT4Kw2CBVHAY9RmIciA=;
        b=gFTH5kYJlQATxqhMh9IGoXbK0deM0lCAlQ7dE0RNh3mFFTscqBabl8MEQuxQNrdxG9
         FwYVN6kmdFRl49KrICWHgUvi3bwveRVvXNIduSlGSH3SRQ/SatSHvHYn4fmGl28/kp4/
         cTwuH7R8nY91JRs0ivwjmER+MGvpkaEYrBB9UR+TTV7U78TPbrzwiE7sSZJbyj6VODJv
         c0rpwmuqu/1OLx53msDZ60y1+xd6JNKm4Zc38km6CwIAzlNxogePn1OeMyhyQRm4iouw
         DyEda9h82LYSJoEbY5IL+fAf/QyrJonH9HYCQvVEl0j987ISm4Gfm8H7ec1VeY26FNRP
         3ZdA==
X-Forwarded-Encrypted: i=1; AHgh+RpFIiKDepJycJuhoCrHqcfEohbJ0fUNtUgdxTfCDpoeDqlw+fQgRqAu6SejwfUwvQvAh6atKzpu0HWu@vger.kernel.org
X-Gm-Message-State: AOJu0YzsjFjzKzfpJte5zZRN/SxZ9i25WK8uH9oXUlOKDJd2xFQFyrmg
	ZHbzltvPHCR7ezifAbZM18u9VlG8acXjzSxwH5kZB9kaIVtxHYQKUh481OHNxET8f6cuei8000h
	rcpksXf3vh3mZy3w3OuI27wnePqar+1rR80vdLVELXZCmVYSkhiqtX2i7qRPra5uurDz2cmtc
X-Gm-Gg: AR+sD12x2xweiVrhwiw1LVA9W+ZUyZJcQL2rpiK1lwcpbnTt74ThTPG90zEmf2biJWc
	Qp+cNQ19UEHAc47C6OyJM9uuS1mTHPojDNXwlQfSvmu1Q9N6cUKdPYgMVS0loifn5geAVwMsm2E
	XzoYwCtdI53VQ3MqPkGof9ZLWzfHOLMULNCRia41+7lv5n5eVMeapi9RmQB4fSpvha0WMEM+YH8
	65tBh4xcTLBLNVEtRaqSejlQWEuqP3ImYHoel7Zc9soTsewI7B84l7cvugfmIuqq7NrK4xV9Jkh
	5nxAZRqhZS6yXZ/m3X3Kn91CY25e178iVAYWPNK3bkr/KtBP49LML6VZekJQ9OECpHRxFtbmyi6
	X64EM/ryeaWMmVYZr+1UtnoybRCpcuk1K/RS+V0p3FBaRXEegxziC0XLz5ZdiQGM4So4znGduiv
	4w9WMZHxzC16fz9g==
X-Received: by 2002:a05:622a:2b49:b0:52b:4f1a:5fde with SMTP id d75a77b69052e-52b566d23d1mr253869861cf.19.1785784888902;
        Mon, 03 Aug 2026 12:21:28 -0700 (PDT)
X-Received: by 2002:a05:622a:2b49:b0:52b:4f1a:5fde with SMTP id d75a77b69052e-52b566d23d1mr253861991cf.19.1785784880515;
        Mon, 03 Aug 2026 12:21:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cbf4fsm2226654e87.31.2026.08.03.12.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:21:19 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:21:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
Message-ID: <bfihjhpy7p5mddiuilwcnfhediws5thhifg4tgcqrmhxvxho4r@ixozel3fryds>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
 <87ik6i6i22.wl-maz@kernel.org>
 <CGME20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c@eucas1p2.samsung.com>
 <3dac25b9-a464-4350-aff5-0ada4dc1d65e@samsung.com>
 <86cxwoocol.wl-maz@kernel.org>
 <e8846903-1c1a-4e11-9a7c-9703536e50fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8846903-1c1a-4e11-9a7c-9703536e50fd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a70ea43 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=5oB-oKpz5WWitobuVWwA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: qJz2ldWX4Zn6mZGr4_kBE_-QzsTJml5H
X-Proofpoint-GUID: qJz2ldWX4Zn6mZGr4_kBE_-QzsTJml5H
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MSBTYWx0ZWRfX7k8ZyWIX984u
 T5rits676I1ge0mKsKCzdVkoF62Z3wgEtw/wu/KiUVDrxv/EKmdWNBcDqaTOuwBX91LxN2OnSuw
 /JiuBZ8ARs3EKMV9HdUmhxwagCsXIgQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MSBTYWx0ZWRfXx0l1xaAP0wpA
 FU5AjsKTjQZa7W4CUyry7U5sF5wrmE0I7dXTX3C2m6xCtTRxlkn0p/WyDII74BwPXrJDI0o3k9y
 XWGPaR3zxlW8inKxh47d/eSE5uDofomqW8DU+WJXRI7sexZkfBV8cDsx4P7aePAIjJbjRGH6Vbs
 lacgaYN3TgC//j3p2Qyq+CWWCjvEgUi6FGuNVjvonbUTggIehqTCaILE7IT+5H7m/PqJ8YbA0Pf
 pdlrjgTmT27i1WFM8813yGZJ+7a/G/ZilvBOY7j890BcSkPzUCkrCj1tNcFZhrl5e1ojEopJzdY
 JkJP7d+ECq8OKueZ65dLohaMxs6JRUpEf0dPIDiBX0ccqINqAdyYJSBE26s4uVdfpiKIZca/id/
 QBpnVFtPbNwtwBsJoyUQI6SrhsS5BkpQ+l1F8ozGpKOB4rJtUe0U3DoHHLRsywOIxLbslOmi2Yn
 jRZCXFeG4k42Ee+QxHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030171

On Mon, Aug 03, 2026 at 03:58:44PM +0530, Sneh Mankad wrote:
> 
> 
> On 15-Jul-26 2:24 PM, Marc Zyngier wrote:
> > On Wed, 15 Jul 2026 07:38:59 +0100,
> > Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >>
> >> On 13.07.2026 17:11, Marc Zyngier wrote:
> >>> On Mon, 13 Jul 2026 11:25:41 +0100,
> >>> Sneh Mankad <sneh.mankad@oss.qualcomm.com> wrote:
> >>>> Remove #power-domain-cells property and add power-domains property for
> >>>> MPM device.
> >>>>
> >>>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> >>>> ---
> >>>>  .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml          | 6 +++---
> >>>>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
> >>>> index ebb40c48950ab3a8fc86f5708acfc33c33d68993..3f9645fbc3c20633077aaa589e5d5a43928dab51 100644
> >>>> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
> >>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
> >>>> @@ -68,8 +68,8 @@ properties:
> >>>>          - description: MPM pin number
> >>>>          - description: GIC SPI number for the MPM pin
> >>>>  
> >>>> -  '#power-domain-cells':
> >>>> -    const: 0
> >>>> +  power-domains:
> >>>> +    maxItems: 1
> >>> What makes you think it is OK to change an existing binding in an
> >>> incompatible way?
> >>
> >>
> >> Ulf suggests that this has been modeled upside down in the initial
> >> submission:
> >>
> >> https://lore.kernel.org/all/CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com/
> > 
> > Sure. We have collectively fucked up a lot of bindings over the years,
> > mostly because of the lack of accurate documentation and people not
> > giving a damn about the correctness of these descriptions. I'm glad
> > that Ulf is now able to make it right.
> > 
> > But that is not a license to invalidate DTs retrospectively. We don't
> > update DTs in lockstep with the kernel (I *never* do), and something
> > that existed must be supported in the long run.
> > 
> > Properties can be deprecated, but:
> > 
> > - they must be kept in the binding
> > 
> > - drivers must still honor them if they are present in the DT
> 
> Currently only two chipsets have #power-domain-cells property mentioned in MPM DT node,
> agatti and sm6375.
> 
> Agatti - does not execute CPU cluster LPMs as of now, so not handling the #power-domain-cells in
> driver will have no effect in functionality.

This is not true, they were disabled only for RB1 board.

> 
> sm6375 - Being an old chipset I am not aware of its status. 

Please become aware, in the end it's Qualcomm chipset. And it was
contributed several years ago by... Konrad.

> 
> If the driver honors the #power-domain-cells property, even the CPU level idle states will fail to
> probe on these devices, due to the reasoning provided in cover letter.
> 
> With these patches, the CPU level idle states will function properly, so will cluster level
> idle states if enabled.
> In addition to that, the fallback mechanism of registering for CPU PM notification when power-domains
> property is not mentioned in DT node will take care of the RPM notification when cluster idle state
> is entered.
> 
> As suggested by Konrad, I will add a brief explanation on the need for this bindings change in this patch.
> 
> Thanks,
> Sneh
> 

-- 
With best wishes
Dmitry
