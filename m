Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ADC489874
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808162; cv=none; b=a4IbOyG5LqIuvED6dy32HuBuoGYVCmmeb9xmuytIwMCtRrTAZ7xLC16N2TxNfcC4W+tpEEMEl0rQ1PAa/jRdAuyR/eVpb+4k7MD44PsblTFXUrfJlvdVFR7PCcn1abYg6NkhNdOs2nEvUslkovI7+24/qjrCI3vXMCaVFKCLS0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808162; c=relaxed/simple;
	bh=dJ4fkzQsGC4kTI6Dkb96kkhba2mYxjxtLEgKGipRuoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tvt00tyKzfrfj3rd10LiGCHiK1hJmGtqFMJn9QFrX0iXbysskLj/UcmWA7k6Z+R87PmMPzNRfVvYQJ8gMGQ5Vye1QziQOdgR0xcGrdloAIjJXkNUXv7Q5u7CNeAftB80xQivyRYapbQrEJhmje1xwVyDhMND6MoCaswD9oHLrRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgD30gk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DohygkHK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgD30gk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DohygkHK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxsuA3363941
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGh3quRT97rZURqNYAwwWrG4
	NLKQwQ2YdFVSfDU8n70=; b=pgD30gk4CvA10MNw+xGeIRxI1MoB3AfjrvELv+EF
	+evXdgoXWkie1VfS9L22Mm4Sicf5Uk1oibMDOseHqHq3pqOf5GKPVTuvwv7JawLn
	wU4xmvsJftYAmjZwkGHowsJWEnS/60U4sJ5p1PSDFXaZqjz+RaQ2ez8bbKUrA3x4
	FwylRmh2+0rHEHql0KC8/ptA+/Z56eZ+XMT1PZRhQrnAJvFzGcvsZ5+pf2d4E3Zp
	tLUcmKL+0PdZsijMbsFFbi72VMnaUgivEX8TV6UJIpvyCojnH8vutT82OBz+l3OO
	IqgWQFqxz/Hs9gFpFPHymqhNy0oa3CyC3UFpYhEp5Wo7Yw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr8pvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:29:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb71b1443so401572185a.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808159; x=1792412959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGh3quRT97rZURqNYAwwWrG4NLKQwQ2YdFVSfDU8n70=;
        b=DohygkHKcSUHut2effi6dfsG/SJ/muSIivPw0OmaV1dOwTiaBqrhhf4yhSxBhD3iKS
         xL7tfsBrzHWjQ1sZsZzxlmQbdE+SblD4/oCa9WpYTxd/DNJFS+p4WSF5M08zrbovfxlZ
         vzYdenBKtumOHg0UMSM7u4f1uRZw8UU2qhq82dsAC9z8DeA5rGr8nmpr4VO7fWu+YwsJ
         mTG6KkGdKI8NbhzY/ZhXYxSGAcyzn8jnV0z6jFW6iYgOcSMnJP7aRxtg8rRCd4l377Tw
         RDS4VATo/9H5LdGUfK6IzNFP0zpIh7zF/uOt6j2m9hh51726GNG3DIOdyHJokDzx3lMj
         jPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808159; x=1792412959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGh3quRT97rZURqNYAwwWrG4NLKQwQ2YdFVSfDU8n70=;
        b=1enk4DsrRYky+ZMlADaDXkL6hYfA8NVDVIRWapXUmIb0z2/qlxBp9PsqYThmOqqMxz
         fWLoENUkmLDcBegafXN1xqYWvpee+GACPdD8PfhbsrVGvdCxgSIOI6usD8hm1//E7+Te
         pFaL8R5LByhWaZ0UTIRt9OzMt33PRBRMb59x8l+lrUC/OGAH/Sp2H81UcgUzvrJG5xxV
         RtoaL+cAUlZDZ7I20ei9SV4jp2BoDAzV0EIZSry+LO/JoQEs7XRk+hf9d0sjgGLFvT77
         hRr2WVtPeTe8WHeA889sE3wwcCoQJB+8WnwCbNN3GJ/yJrEaHdjDqDCaGgTFrhjec5dt
         tIEw==
X-Forwarded-Encrypted: i=1; AKwUvBxCElbbU+1GDd8TkzKfmGYr6dsn54iweF9LkoW4NNRioV1hwXoLUBEnEoS/E4BZtTdKIEnZ0NuGvH0r@vger.kernel.org
X-Gm-Message-State: AFq9FYIjfFyoN2ZBYrj6Uc1KX7d5d1DpN0XQH7vTJvAvj1Lce3VSM17M
	81uekWZLRbvtUBWRys9ot8kX5hULRQIEde9GMIngoB82hQDuv1HmTG5nIZeSqGmv8U0J+r1oHmt
	OwMCq+sCYEbcY65YmOzP6mQi0LFBNQVX3yKFrzd/v3xD88Q5ksLUnZeqYVEuqBmBc
X-Gm-Gg: AYBFou0bCtfQpw1vtBy77wIq5bz+J6eMjgssTZju1BnosIoCkVJ9UqdQQZk7cs04h7V
	w6/ll7UQZO3VvuPFR2Cy2xc4ddntVTV1Wg02LF1iGuxbSNtEY0bfXxvTFmZ4jGhp7E79IJj/eNz
	ZB0UulnOjRjPiuM6/gmzhRhhXlLKA/mBatNR2RLcy9gGXLt0oUI+W+cXy/TgGxk87rx1sJA6Ie+
	hqaeoV63lRaYjCrp7cYjL6eHl1r2xOvLLcP7eXN0tsxuOOlXLPSZp9H18q/Ia5HPrQYBu+b0A8D
	mI2wqGXwM92NtyBYzIN2Eo49pviwHBfAUkoYFXrdVOqGnF8iFcep40zi9XiBlKqWtGX4e0StPXG
	9Go7HaRj7Huj/LVCeC+S5GVQJZaqmPWjnYcu6feW2Rw9Ne1Ewqr//CTaXa0GMdiEGFwfZlrvyIE
	ULTwobKfcwHwZ7
X-Received: by 2002:a05:620a:3728:b0:93e:c12c:f119 with SMTP id af79cd13be357-93ec12d0576mr1553333785a.69.1791808159495;
        Mon, 12 Oct 2026 05:29:19 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:c12c:f119 with SMTP id af79cd13be357-93ec12d0576mr1553328585a.69.1791808158899;
        Mon, 12 Oct 2026 05:29:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde912b3sm2765948e87.21.2026.10.12.05.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:29:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:29:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Message-ID: <tvnmnnneoiibvpvfkrhh4qoffj2vpomdh4jtmccrblylwbrur5@zvrgjapveg72>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
 <epga5fcyf2d3esucs5ulht4s7ixwpwlb35iygz63aqeefruc2m@mwmmkaw2z5r2>
 <d61fe4a4-7101-472f-9202-404de9899ec4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d61fe4a4-7101-472f-9202-404de9899ec4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX2s5BBrzvhe+E
 0w1QUqi+OxTo2UGXK6uiHCHnVnz8Cm/nL7NmgiC1dyp6APJHjlP+NJzTZGInxXNTpLRV8hL4pNK
 iQC+/633Mrlhg8Y5MJQN4f/2i70v6JMouSqFrSor5zT9gWKorvTV/jy3ccWxqM7Rns5lKmwfQ9e
 CZpz4fWe9mNN64dbyL+Srelpag1yVq96aEb3epzaWzXePNET7o0P3eV1TunwwM24AiNq+QgL4Gl
 l6F0bYFSqssnJO0AKewnxMXypjcLhFvisPPlPHwBQLZM+VzpIyK2EtzK1IivZNUJr+z91MRvErS
 C4eIc5C74QbJMFQu6hLNTLAd0mQR7MzLv86/Jn2xnoSYxjQFOoonbhhTMQtyf7hu2WfGKyXDcw9
 PlJzOspx8wnwskSldkS1VJQ23WHc5z3/AxDixVG30737PhnFWbuyv4emCiFVbE1dXXNL9r9pZf+
 twdckYYjYGdLoxrlZxg==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6accd2a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gfEjnI5v8RykEt6AfOQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfXwkDaE3p9oSs8
 aoMn74uKs2H0D645aPwbqsZKHEHXQxfbuNLDPae27RIvTpEmF1sN8ESaYTLsW/hP+mjPYaY4ny1
 7Pjwt1JDp4gaSj9h9IQ4GFwQ6h/KTC8=
X-Proofpoint-ORIG-GUID: 93tZ8ughuDPIaP9IoRakpNJ_AHq781Vn
X-Proofpoint-GUID: 93tZ8ughuDPIaP9IoRakpNJ_AHq781Vn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

On Mon, Oct 12, 2026 at 04:41:21PM +0800, Yongxing Mou wrote:
> 
> 
> On 10/5/2026 9:06 AM, Dmitry Baryshkov wrote:
> > On Tue, Sep 15, 2026 at 05:27:50PM +0800, Yongxing Mou wrote:
> > > The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
> > > source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
> > > the display-controller (DPU) node, alongside the existing MMCX
> > > performance-state power domain.
> > > 
> > > The MDSS node's CORE_GDSC is unaffected, since it continues to power
> > > the rest of the MDSS hardware on its own.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > > index ace19b8b12d7..b3e3cd1d311c 100644
> > > --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > > @@ -3619,7 +3619,9 @@ mdss_mdp: display-controller@9801000 {
> > >   				operating-points-v2 = <&mdp_opp_table>;
> > > -				power-domains = <&rpmhpd RPMHPD_MMCX>;
> > > +				power-domains = <&rpmhpd RPMHPD_MMCX>,
> > 
> > Should it continue to be RPMHPD_MMCX or should it become
> > DISP_CC_MDSS_CORE_GDSC?
> > 
> It should remain RPMHPD_MMCX, as this power domain is used by the DPU OPP
> table for performance-state voting.
> 
> DISP_CC_MDSS_CORE_GDSC remains attached to the parent MDSS device because it
> supplies hardware shared across the MDSS subsystem. Since the DPU is a child
> of MDSS, it inherits access to this power domain through the parent-child
> runtime PM hierarchy.
> 
> Only INT2 is attached directly to the DPU, as it exclusively powers a subset
> of the DPU source pipes.

Then should we still attach both CORE and INT2 and ensure that
performance votes on core are translated to the votes on MMCX?

> 
> > > +						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
> > > +				power-domain-names = "mmcx", "int2";
> > >   				ports {
> > >   					#address-cells = <1>;
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry
