Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E66386C29
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 23:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775605541; cv=none; b=TNpIlM+m1nCNx7Aj8jErbw0c0Ueh8MFiP0nFR5FpSdBfF5QvU237fqvh/HMMaPFAatLLISbeOiDUTRd/ACBZLIwkLbI+39609usVYEVv1i/klDgnTnj+Ve/djHD6f2vtW72TKNZuI/PLlYqkpkpWhJyTYeaXLVdmsvcfaJr6+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775605541; c=relaxed/simple;
	bh=5RiwWyfTRmY+ICHwSz2ehVlihQE4jCeKt9H823nu7G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXdkc6O8ZVU/o/ZI5W2lKtlNJ+sBresMLYeRVQH2t3d4PiDGkopu7ZJMuiSRL4y8l6KIgN5vedDSIYp9822HeuVqEYVrJWbfkpFhN9UctblLYsPyHSuEmwg9DVzWsYdruGlADpaJkUJw4O5/5sEdmnMIjxYFVVU5iIa8TzaSM4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgJGOP/F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QcO+OoSw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgJGOP/F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QcO+OoSw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J70Ps263064
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 23:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dqnafUrvON7HZA8zHAS3PedH
	DWzr2LNEiDtUvABj9vA=; b=FgJGOP/FAFMePg582rzGfkWLseQ3HPEe2HxcpqK0
	CZAp+I6li1p/cEviB05ZplP1eggT5wEd72FQ+V2HU/20KPuzOmr37kDdiuEKNybu
	ERepe6f0imAUDZMGgNH5LCXxfXffA+fj94vYPby7H4K+fv46wHHoItMtCu3zotTA
	RZMxYP77GGgnM8D3e+K4BOCdNfpW1uaYKLMKh6X0z96Q9DjTlfxNoy6awkHo0mr/
	/5+uQVLVYjJ2FSrwk4TZXmbVNUVfn9LNzm2Ca3yQ02RbPjDbQrK8kov642ZUKSQi
	8FGwLxiIZ9ozPzI8xypEmP+yDbDs0KDiF3PYKXokeKNVQw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7t20qbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 23:45:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a6906e35fso289618b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 16:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775605538; x=1776210338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dqnafUrvON7HZA8zHAS3PedHDWzr2LNEiDtUvABj9vA=;
        b=QcO+OoSwwx/chnhs1xu+Q2yVAvMg2KtAWHysWudDx67/ghFfDFVmQEEmfMk2cgD3lP
         A18Tf5Z9qA7+aycpPdNwUA7CS6svwgEnXkCXbdMoyfnzONaLBDF6kUBOXVCFxo/1IR+H
         JWOKSaNDyDU6FSC1Pxsh+ih6ye0NNpAFC2DSs6a4FRu9uBX2z4Zg9kIMM1g8ww7JExTy
         I3MtBu0HtcZJzEzDo9dSwxYOWRKIM5lI2jnnob9Ck/1pxBQGAEFWsdSX17DGqMy7fWo0
         rKW74M4Lw7YRhIop+hhEryoWb5bXIfjSbaJHxfINbdqHxKtcdNmrDMy2VszF87PoJL4m
         KjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775605538; x=1776210338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqnafUrvON7HZA8zHAS3PedHDWzr2LNEiDtUvABj9vA=;
        b=cDj7irx04YAGqRgA69mdYCOxl3/5cce0+1z0Crj8phbLmX/nkfbxnKJR8jJa62XoLA
         D+7r2ToxXMzbk4EjIKAbi5j8W9CeYboUJoSaaVTCCqMqUtjgfYOqMfBGUPJpmTsKzC/Y
         pKBYZtUm8Zw1r9OfVXL9VwCflwfgpRMeBhd9ejB6EnWgtKVRj4TELqVbU1fJuSa536yv
         Vodae1y9g6YQ+WyEp39KUY73Q1ipMc4Nqpl8q35gV6WZhXSBwAN0/kg3QqfjC9XWfhUJ
         lTQ0rGcYleC4guf9ATifnt3fcKdsB1GCtla4JlFBCP6+grb/a8Tat0g5OJS7IWHXqJJ6
         51FA==
X-Forwarded-Encrypted: i=1; AJvYcCWbVCmsDoDb4y1jsWciwFMiif7aeU20qqOLPR0Dq5+4XCv7vR3m9T2mtFEYGRaNk2haj0OY00I/1AGC@vger.kernel.org
X-Gm-Message-State: AOJu0YzHvb4prphtqVg8CyLt2pUIqkDsxAknCiRT4S9oI3MlOvwwcG0s
	tEGVaHn94dmlS02D7uROepsq+t85HuIiYbXmoJvutAkyw+1l7W46GdFAPrGzkVdaj0XH52kDYJM
	QAvU0rh9vGmqsVSX/vSFfCOZCisI9xPyMdUdMX29D3EqtesfXv9dvCdqpx/bZi7cF
X-Gm-Gg: AeBDiet6ipqFCoq/3eBt0vfMeM+ihIRcopiJXe3C6upNGgNZea7zMSQA2UQdCAuL518
	bNW8q0/C7EKQQBM0ECl2RwGBYfMTnlTmcOGwYobaSxVlc0tnSEsmmwhgAcQRMFLylIbdSxRWEyD
	ImsInWCm7CIatqBClfDO5mlMK7FilpiEq4ZDkROqLDUJk6bLHT53l+bqOj9Jjo4lQ1NrnJObGjN
	FhTlG86Cp5hPaAYJ0VNQjuoWa2C+SpY3YKq/amceHA4cGOtVa8Frpdq03IzJeJDrFtdtYQBjnMX
	eZRIjQNbvqRFvckOYbPlgF8Ankzbb0xmQv0ZMuWYW4lV4Kpaai5939J5Fa5o0pCAwInnAc4LqQ6
	YPZJWyOTNo9bfUQdICOK8ny4u451HmtrxueniM8F/d8dvEdVMnzLufIOAjPs=
X-Received: by 2002:a05:6a00:896:b0:827:26b6:c11f with SMTP id d2e1a72fcca58-82d003b275fmr19984173b3a.31.1775605537331;
        Tue, 07 Apr 2026 16:45:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:896:b0:827:26b6:c11f with SMTP id d2e1a72fcca58-82d003b275fmr19984129b3a.31.1775605536479;
        Tue, 07 Apr 2026 16:45:36 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3baffsm18939943b3a.14.2026.04.07.16.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 16:45:36 -0700 (PDT)
Date: Wed, 8 Apr 2026 05:15:28 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v7 1/3] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <adWXGB8QshGguuXC@hu-arakshit-hyd.qualcomm.com>
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-1-669b96ecadd8@oss.qualcomm.com>
 <a616c056-f9aa-420c-a543-7f1539e9e886@oss.qualcomm.com>
 <ac/L6y5B+6SyTNuE@hu-arakshit-hyd.qualcomm.com>
 <0375e235-0b8a-458c-a797-d5b341dc60b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0375e235-0b8a-458c-a797-d5b341dc60b9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=De0nbPtW c=1 sm=1 tr=0 ts=69d59723 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=CkLZM6L_lappvOHulz4A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDIxOCBTYWx0ZWRfX/afneUVG62/u
 es90E0bjrEEEa9+HOxChf/+BMwTVdELCJGAWmIEe47yy/ynH1a+nTIqLU15q99t1brcsz95KyIE
 yiHFbTH4xeVQkoYyUX7CuqV8sVxo5s2H5radIupf9I1hfGYLgonhO6YTtUVksnFVSt4wo85jYQ/
 M2ZByHaF3Scthoz7B/a934hJ9r4r5Aqxei+hHE3QACssSyPfXYfwiJcL4Vj5gywswLMCqB0/mtC
 0SmJwwmhmeiw90dmBPI2tU9L7y0V8sIzpPfdmjZfhvWCp/wsixIgfaZHKVZaKMId+f29RRsa3lm
 LmQxuanEmtZ4sVNZieZsjk01JEtr7WF1jArhY5y45GEfAFkA5aCOTEWj6/TH2iuw2FUtJK+hyYA
 5Tg6QhZnRzsRMkQsNOR3QK+Bf+qltj7spEJJ5cunABIpTL/zcmsBE2Znq2mKJRy4592ci4Ne0aH
 T+Feqdc1wghYu8XhdnQ==
X-Proofpoint-ORIG-GUID: ejk4EPfLXuItF0iz-xQ-f88l2sGOrxqd
X-Proofpoint-GUID: ejk4EPfLXuItF0iz-xQ-f88l2sGOrxqd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070218

On Fri, Apr 03, 2026 at 10:50:29PM +0530, Harshal Dev wrote:
> >>> +{
> >>> +	unsigned long ice_freq = target_freq;
> >>> +	struct dev_pm_opp *opp;
> >>> +	int ret;
> >>> +
> >>> +	if (!ice->has_opp)
> >>> +		return -EOPNOTSUPP;
> >>> +
> 
> [...]
> 
> >>> +
> >>>  static struct qcom_ice *qcom_ice_create(struct device *dev,
> >>> -					void __iomem *base)
> >>> +					void __iomem *base,
> >>> +					bool is_legacy_binding)
> >>
> >> You don't need to introduce is_legacy_binding.
> >>
> >> Since you only need to add the OPP table when this function gets called from ICE probe,
> >> you should not touch this function. Instead, you should call devm_pm_opp_of_add_table()
> >> in ICE probe before calling qcom_ice_create() then once qcom_ice_create() is success, you
> >> can store the clk rate in the returned qcom_ice *engine ptr by calling clk_get_rate().
> > 
> > This was added as part of the review comment from Krzysztof:
> > https://lore.kernel.org/all/20260128-daft-seriema-of-promotion-c50eb5@quoll/
> >  
> > While I agree moving this to qcom_ice_probe would be more cleaner without needing
> > to change the API, most of our initializing code for driver by parsing the DT node
> > happens through qcom_ice_create, which keeps qcom_ice_probe much simpler.
> > Please let me know, if you think otherwise. 
> >
> 
> Seems like a suggestion from Krzysztof and not something based on strong opinion. Again,
> you can choose to do this if you spin a v8, I feel it's cleaner.

This comment raises an important design point around whether the OPP table
should be registered in qcom_ice_create versus qcom_ice_probe.
I agree that moving OPP-table registration to qcom_ice_probe would be a cleaner and
more maintainable approach. Doing so avoids the need to distinguish between legacy and
non-legacy bindings at the API level, and keeps qcom_ice_create reusable for both cases.
This also aligns well with the intent of qcom_ice_create, which should focus purely
on common/basic hardware initialization.

Additionally, qcom_ice_create currently has no dependency on the OPP table being
registered beforehand. Clock scaling is a performance optimization and does not
impose a hard requirement for ICE operation or enablement.
From that perspective, there is no technical necessity for OPP registration to
occur within qcom_ice_create.
Ack, will update it in v8 patchset.
   
> > Also, I don't see any reason for moving the clk_get_rate() logic to qcom_ice_probe
> > though as it will not be set on legacy targets in that case.
> 
> I thought only new DT nodes will be specifying the OPP table requiring us to store the
> clk rate and restore later. If legacy DT nodes also possess the OPP table, then ignore
> this comment.

No, clk_rate is not needed for legacy bindings. It is only needed for DVFS operation
across suspend resume cycles.
Hence, its value makes sense only for non-legacy bindings.
It shoud not be faked for legacy bindings as clk rates can also be scaled from
storage driver in-case of legacy bindings.
Ack, will update in patchset v8.

> > 
> >>>  {
> >>>  	struct qcom_ice *engine;
> >>> +	int err;
> >>>  
> >>>  	if (!qcom_scm_is_available())
> >>>  		return ERR_PTR(-EPROBE_DEFER);
> >>> @@ -584,6 +640,26 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >>>  	if (IS_ERR(engine->core_clk))
> >>>  		return ERR_CAST(engine->core_clk);
> >>>  
> >>> +	/*
> >>> +	 * Register the OPP table only when ICE is described as a standalone
> >>> +	 * device node. Older platforms place ICE inside the storage controller
> >>> +	 * node, so they don't need an OPP table here, as they are handled in
> >>> +	 * storage controller.
> >>> +	 */
> >>> +	if (!is_legacy_binding) {
> >>> +		/* OPP table is optional */
> >>> +		err = devm_pm_opp_of_add_table(dev);
> >>> +		if (err && err != -ENODEV) {
> >>> +			dev_err(dev, "Invalid OPP table in Device tree\n");
> >>> +			return ERR_PTR(err);
> >>> +		}
> >>> +		engine->has_opp = (err == 0);
> >>
> >> Let's keep it readable and simple. engine->has_opps = true; here and false in error handle above.
> > 
> > Well there are 3 cases to it:
> > 
> > 1. err == 0 which implies devm_pm_opp_of_add_table is successful and we can set engine->has_opp =true.
> > 2. err == -ENODEV which implies there is no opp table in the DT node.
> >    In that case, we don't fail the driver simply go ahead and log in the check below.
> >    This is done since OPP-table is optional.
> > 3. err == any other error code. Something very wrong happened with devm_pm_opp_of_add_table
> >    and driver should fail.
> > 
> > Hence, we have the condition (err == 0) for setting has_opp flag.
> 
> My suggestion is you either explain this in concise comments or simplify the assignment of has_opp
> to make it obvious.

Sure, will add appropriate comment here.

Abhinaba Rakshit
