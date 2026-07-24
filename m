Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE5B399358
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877765; cv=none; b=Z0G72YsZa0dt4atfBqoTSjLAeYiuZzKKuoIJGj7lZQDcgI2KTgWRaEPqKDIy99lbfZl5r60WEvO75Stk1tLrWrBHwUcfDxz/dPYG+UoSQImL8UP33OUMdU8SLr+e8PGJYlXKHBKr1Y/4SBKfu+h7DpkhR+gL2eCyNbhrRWVoD6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877765; c=relaxed/simple;
	bh=UQQnIXob+/s9OIPRi5J6ofr2XzDcFk5vQvTsKvxzwto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xk7XWh2mrlUN8yyFdX3DpsRuswbhUP1a+Uc7Q4rXiuGPuTb90KdBaVTQR92zE8m6o3fawPfdC0pvLxY2574dCeWJZXKJYAjBGwzo0Zg9SrMhldHcS1HsvRTb1ph5TLquZs0s4rsI2Nk5dni+pmsL7hPb0+/pMKf2jSUehLmSXog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kghG/e5S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rt7yHD/j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kghG/e5S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rt7yHD/j"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4liw32099582
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bRAFAPrhzs0JZ7CR2lh8wcue
	7nCkmX7RC3NoU8zQrJQ=; b=kghG/e5SU4AD9C2HfL4jDQv7v/9tIEbNjAppzd0U
	tbp1Q2ylthfiqQldkbKbo5kdDkG28GbQeiqZfUgzZFVvUAhBqU3dP1feYiYmGK5R
	9Q1MerJG0ruxgB8OH2ac3WQZ+i/TFgfxa/pQ45CYTKlmnkJfAZVc7yp6ATCILTgZ
	Vy7DmVAmci1KVGENtI3k009d5XyTjPfv9/zGh88DzUqhBzdO3i4G7oA9a4n+EXSF
	RKak++w7LAJScMWOnOuntPJpfhtvbtZQq9k59PFY8UArxoKMLc3yiCF1Xw49nAUQ
	bR/hru0m6tVBrunhT99tIEnXTiDtHUMDFeBbU+CPETgpIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahst4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:22:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso2341201cf.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877762; x=1785482562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bRAFAPrhzs0JZ7CR2lh8wcue7nCkmX7RC3NoU8zQrJQ=;
        b=Rt7yHD/j5qp1v1fNUeMCjkRXHXFF5rUzApjXSX7/8AfIi3HKSOFUKt5sSKMOv4ivuj
         w8HWvJOpyAOPDoIfc3tvFll4NkDfeEzEn9+zm/Az7bofrKORMEWlyPrnIUbS2BTDQj1e
         26BnIFp0WXO/cCiJ+O0t56ETdplflPfv2RDs1JQaXE33mKfJBVj08pvJvZ1DHC4fuKOZ
         aUR7Di3Jbp6bwZsVjCbFZU8aq8NQAu1BJ1sqFoLQU7g4zlBXmsReezCc5lKezaA0Tv1c
         RBPLJYrbdHgG/3T2Bc+GTgr4c/nq7XIH2KzwsPljfsY9dFKLZw1/tGfjMzJcmi2fbCoC
         DR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877762; x=1785482562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRAFAPrhzs0JZ7CR2lh8wcue7nCkmX7RC3NoU8zQrJQ=;
        b=AVbXazKAQNQ7VUnVKhYCFQgN4+k+Cccv3vvDg2Fsc5fGhexPxRPthaE9+6hBlBRH9H
         SpDGwnV10Qhfj5YGkqDdRJYr1IjKrRNB2KpXGMPwr1B/h2BGCvjDBOHz2Z0ezDdamcI1
         PxaDuu/ct/AZsk0IKjwFY3eTPG0GxBZyYckwBpXBYWgRzNfzk8cb0zZ5sF8TgbEptYgz
         Ha0Ujo38atd0FltMQhvSERDPGaEP7BLEveZUEJ+M16InIrPX0t1F4spqFlGsahnx1w0d
         DzW4qt3fs3L20lVYgZv1E56PCvbLZQErxqwzyU064qTTCLOQM8GK23x5O00KWCSMA8T5
         BY9Q==
X-Forwarded-Encrypted: i=1; AHgh+RphRgjVG/zkEJnwUJMW/dJ/87hgfLJs8JDtlXBqsvdOYlKib4adyLhT+zUmXeGpqwGdRP+CR2936PKp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6xlw3Ix3/yAFkVMSAc3xAI3fA5vpe6t9ANfUySSxL61Ma/cap
	IlX2WB+J/MYYcEQr+Ux/mqE1qYkf6q4NP2ZUOAeuh16Ii7XzoWBIQJ0IfSaDdd4cl2ZXQPJb9Nv
	+dntGMzbul/TCGvlMc40Iu4p9lF+KAB+nqnSmWy3bWTyVFmovMzBFyPjcPU1aTKbS
X-Gm-Gg: AR+sD104ifUHvJqbykEoeyyPNVTAExMXGf7gmGT+5BrKqumEsbnVbOVcSzLpZXr7gWT
	r4NKtW2V4bq7O9M8L0Qbh2ZloEbz83LR72f5eVprj2e1Vl7fb7Y+47GGjjuEqsfSqpGEwuPGfK6
	vvWPgae44Y5p8YzbW/Kul4OhWKh6Mgdhl0AdL7OlG++qGuNhtxrKClbdZk7MPdEUb3YrDmyBWhU
	GoNHHGP77P14KsqgWVarZy53XaLf2fa51oFdMk/6cw0elQZcEpv/knx74NkVANBDdCuEnoCNeOy
	wLfmnoztfrxkr4q5hdF6PPasCbXWSiBHF/4d+XbJkxIW4rOJahz21ED2uH/hC1+l6RIWCyLUjXh
	XZnT7gdJYJ8R3QEY=
X-Received: by 2002:a05:622a:30a:b0:51c:d1c:474d with SMTP id d75a77b69052e-5283de1aa43mr55597811cf.19.1784877761945;
        Fri, 24 Jul 2026 00:22:41 -0700 (PDT)
X-Received: by 2002:a05:622a:30a:b0:51c:d1c:474d with SMTP id d75a77b69052e-5283de1aa43mr55597721cf.19.1784877761413;
        Fri, 24 Jul 2026 00:22:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d4e4sm55457655e9.2.2026.07.24.00.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:22:40 -0700 (PDT)
Date: Fri, 24 Jul 2026 10:22:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Message-ID: <7bwizu72b46456esrly4um7y3hbda4cxmmvfjvqbqjtsaynmqo@ps5e5mcevarh>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
 <20260723-dts-qcom-eliza-add-cdsp-v3-1-b535200996ed@oss.qualcomm.com>
 <20260723125953.8F87F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723125953.8F87F1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX5YsG1Oq1wwKj
 Pl/kYlj8vMqbuj3E7cKsGPq4qrlJLYfYqGqTU7Cwpcborh1Uzu/b1hkDOnKCyw0FJv7VWhRxPx8
 5ST1GwWOpwtc283rgkLoTZ2NsQ8VJA0=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a6312c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=57vlxwFmncND1kVs3ZwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: BxHGdb8LQyf0U__NzEB1AzZuoFWO9VaS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX9FFJM4Jv15fA
 QXF41j0dfkvX8/Wzu33i2evoaSJBCKenFa5uRPNEE7f+KOe97xPec2UNG6mbLIRpc2OSLzzLnKE
 ufmYs9+YODgXcfo3o3I3GFXx3LY9W9WQkpvkn9KDbCqhu0je6IrEZcg3uEJ25vjB5PHga4II+Iu
 voAWgA+BZSgbEeFT+nc8J+Bv5UcZpbjiXVf7XpKKoWdw0FkcZZ8wzgjg2msmjaG0AjNgbbPuZ01
 VZy2lY5L8rS6z0WMrIIBHgAnTzrmhozJZs3eKrAvLyywZ3oAzrlUtvZBLYAsP6GHJv4t3jgURo5
 YC/VDSHIHoAkZ2654u/xnlR5lfLupVamaTEJ3xb2bn95kBtenybd8rKJ6okpKF3meWTchzxbwe5
 ydhcJ4AcaqQYCDJxJH+KhGY1VWj0yW5zsEHhi3NSgimPRPbx2jcygZKRylVsTM/RdK1GOvIvUZT
 RiFsh69xuBbpPqWx2RA==
X-Proofpoint-ORIG-GUID: BxHGdb8LQyf0U__NzEB1AzZuoFWO9VaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

On 26-07-23 12:59:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The devicetree node adds an undocumented and unmatched compatible string without a fallback.
> --
> 
> --- Patch [1]: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the CDSP remoteproc ---
> commit 5421ef4d61bf1a4a8c2f57dab436568cc9538d95
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza: Describe the CDSP remoteproc
> 
> This commit describes the CDSP remoteproc node along with the glink-edge
> subnode and the related SMP2P.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> > index 357e8066c1768..e38a1d94fbe23 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> [ ... ]
> > @@ -3737,6 +3761,57 @@ nsp_noc: interconnect@320c0000 {
> >  			qcom,bcm-voters = <&apps_bcm_voter>;
> >  			#interconnect-cells = <2>;
> >  		};
> > +
> > +		remoteproc_cdsp: remoteproc@32300000 {
> > +			compatible = "qcom,eliza-cdsp-pas";
> 
> [Severity: Low]
> Will this compatible string trigger a dtbs_check warning because it is
> currently missing from the device tree bindings schema?
> 
> Since there is no generic fallback provided (such as "qcom,sm8550-cdsp-pas"
> or similar), it appears the remoteproc driver will fail to probe because the
> string is not yet matched in drivers/remoteproc/qcom_q6v5_pas.c. 
> 
> Should a fallback compatible string be included, or bindings and driver
> support added alongside this change?

Binding of this compatible is documented by a separate patchset,
mentioned in the cover.

No fallback fits this CDSP.
