Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C539C3822AE
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 07:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633567; cv=none; b=WBu5ZvbvCVXL78rOHyzobNImArURZc3tWRXDOdfyDwZXIjuqZoVpW60ayGdc/pvF2YYcMftAzwZXK3WGtEa3dnzohLHd3O/rYy9cj+jpGiw99ca1yU7vO9nHKXuWWHkoMjkFi/jczUdIQ84bpRnMuV9OsGXqs+SVrWNTSqpKSd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633567; c=relaxed/simple;
	bh=OveXBMU2Rs8ereI1m9UptjRMaYvkzfBMcmK+hgcieTk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uR/bdKEKFkZkcWFzgJBMZuH6RRUTrubKl3YDRC8u5yA4mn/YF5LkF0rgtF1UoKRS+o7WL7aaNie/EGi02oNLpeZwBhZgWlMATkBWxr81e7AgidBcLHiMQYPU9rg9yXrnmsLWKrvdsvdGb7FpxK/5pazJARVTS08oxEOUPyQUCBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nW+T356e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8s2Gcfg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nW+T356e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8s2Gcfg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63823Lc81796228
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 07:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xckB8PPJx6+/vCorN26HvLDM
	xAJX+r/dYxdwC1AmZgc=; b=nW+T356eFEiWlNV25OIPnYucbssv+TRN/QY2qRAf
	QPRvHVVopBSmj/fSXs0NgBVDsJ9QE8h2ok+x0hvLsG6TiUlkCg3wObmLBv3a7kyl
	m2nzw3uI4iNng+JA9e6cvv2Wr9/bVrWoP9AgCaOtYp8dKr0uxx8E/hlWlK1ZeVQ3
	WEMSL+o4zXWOunDSRMY8navjM9E6q9a8BQsXTSnLcqh6IrTx2LaLgYKULpd1TeUY
	/UDWZ7IRiI7V0ojXtEFPxFq2jCCBms5mBavoeF2GzEXNoWRAmbYzsK4rZpqtAOP2
	9hwyvyzYAsDYq9cz/CCF+9umhTFAznHxI/Lr5T7DlLXzWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd51dawvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 07:32:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d831e8083so70745391cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 00:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633564; x=1776238364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xckB8PPJx6+/vCorN26HvLDMxAJX+r/dYxdwC1AmZgc=;
        b=G8s2GcfgR3N3BRGa/eA7J3eg62OdrDfrV8Z8FYnzHmvDsJHPp6ajS31K8uMIrOIGra
         ghHUiQA6pJWPLPo7+CsyDhb/fpMY6HyJoyPTo1Mw2qgGMPBUIf+Pow6o1DM50L5FQZnF
         drpFKklQe/3g8Id7wbMpRbjIZyEt1CSQ1DqX0csM16Ve2Sq0NMebaepg77wGptc0fMc7
         ZV4tj3RUuK2WNkfDGpbNpc/wmKlKDytILdEkdKGeSwzwgSt1a9+nIU9ToPl2ZyX8nxjN
         Ff8EwCqWeUbcv6SMeIsOgya5U85eVwvpF2zr4uY1VqXI5IfSMiDp5Iw4affzIz36tXMe
         79sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633564; x=1776238364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xckB8PPJx6+/vCorN26HvLDMxAJX+r/dYxdwC1AmZgc=;
        b=MUIntsWkN5K+/n7vD4CfDvPIE+CsFaVWlok1+2dfSxYaO6utwem//Nny38y9VhEw1x
         AvabYQrQHILR9rUwK2CVYIijJVU634f6E0cSWyQh6ByVV9ssiBEoffLuBEA0u2JazAgt
         Ft1z9lCDvAH0CaFjBNhQGwfcq7oNpC2wnQyM6DsGeRYszZ9rjVjG47LLHEFA+9olyDHU
         Cu79/foV7EOlSa2s9tbYNHAd2ZnhwmAU056NMLhPFNfJP7MiHifvL5tqBJNJL0HdMu6u
         yl4mRaP5nFN0XMUF2HwVhVuddkeqRTz6eV2PCy2cZdcwNWkG8XjXNzERlayzU/pEEL0i
         pHDw==
X-Forwarded-Encrypted: i=1; AJvYcCXI5z0y0HTm0gt8zphQfhex1dRUEubtSWSHUo/a0es5ivAUL9zASDExdG9BoBdDNtxciLBbhVX40E7P@vger.kernel.org
X-Gm-Message-State: AOJu0YxqzXx6TwWowTAZxN6iisqLH8IR0aehsuN8YIL8CN1nMH27og89
	1aUUBYZFleiWIoL7U7twQaLuLhTKvkg82PcGIqElRhS6nwse4DoCOKNNt2b/QL04YlHYLiyXt8t
	lo4yRkbRCoHZDcWBtsNPt81HR3cOqIG08qczB3RA5Y8pVQYyyNoZob/sFzC7H5SHo
X-Gm-Gg: AeBDies2XZBHOdnTxRTpKYiWKXMI69RHtcvANBXd9xaJcf0AY+ZGC6tfqq21qnUuGJD
	Pya/K4skfw5Tr/FcjzDbXm3rIO9DmfZV49AU34Y35ZFq3UqNzaRzW9Wo0Jb24KMSGHBFkxc6nba
	jQ0oYnqnok8NMpjz9QHwkVqdX2ZiSgRJ/v5267jjHmuYmPgywLxinIWQmSL/Ghrq+/U5+I1wPL3
	Lu+PwYaUFDgLFYLRe8kBBgo98CKApDDCMrld9IQrQxGwh1vW2Bi0Q8BBw3YKHEherLmQUJYPaiG
	FIm3OE92snALjLpbFiTodLbZZL/dh0H4SUkXAlJnhvLMsPE/R6L6jeLhVT8h/Ub9YV9BXsdj2Qq
	qQf3VhN+30hFuHx+FBEchG4VgXbu6h85reJxyiwsuTeI/PlzieEraNKf/
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr202934001cf.20.1775633564103;
        Wed, 08 Apr 2026 00:32:44 -0700 (PDT)
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr202933731cf.20.1775633563612;
        Wed, 08 Apr 2026 00:32:43 -0700 (PDT)
Received: from trex (187.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889cb46adcsm383692655e9.4.2026.04.08.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:32:42 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 8 Apr 2026 09:32:39 +0200
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/15] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <adYElwM6eT5T8hZM@trex>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-12-sumit.garg@kernel.org>
 <ac-KQ7e8-syph1Zl@trex>
 <adOcMsk8a_Clb4WZ@sumit-xelite>
 <439f9bbf-1ba1-465f-b5af-01ba0ebb86d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <439f9bbf-1ba1-465f-b5af-01ba0ebb86d4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xAtWTE2izBhS7tzrtxsjH99TAfJRLAlX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2NyBTYWx0ZWRfX294oGO+ibLhr
 2W0b/G7IV7jy7Yj2poosuUy5nRTy24HmzAWOOc1MMTNwV0/rsoizT4yagFOdQ+zY7bGLn9eGOtm
 669+br6ymbr1+B+h2n8KccD9Tjwrh9yHi5+Yk3w2ogvl31/GZ9he3UyUVdaWEHK6KToMVOtlfBY
 vxHAlspElYVyXzz62CWA/x0Kbx0Syx2c7GPIKDkGhAuQMIAweuO/UUh631fE2TvaB6UC+FqnA4G
 /5SeCxKcwYoJkp+AUQEzU8OomwM+kQcBXosc3UrWIgO/ufwkU8DjPjicx4NEc3f7yOVVE2k/q8p
 SvFVUQfJ8iK96XIBMCI7ziO1K7sVZZxyaIQ0JXZo6ShglAg+Ea0N+BXlt5iYDwp3N7uSmW027TF
 7yrgENMw/WnrBot+4bewodZr+eKEzp42EtJRDMY8IyGLyaOTVN8IpvsLOAz409K524DtBGBLgwX
 yZn3jWi/Y8R6vb1T2EQ==
X-Authority-Analysis: v=2.4 cv=AcaB2XXG c=1 sm=1 tr=0 ts=69d6049d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=VPdg2FrOqWfiVCzsz0q0YA==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YTLieAA4xaQwPRX2avwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xAtWTE2izBhS7tzrtxsjH99TAfJRLAlX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080067

On 07/04/26 15:14:22, Trilok Soni wrote:
> On 4/6/2026 4:42 AM, Sumit Garg wrote:
> > Hi Jorge,
> > 
> > On Fri, Apr 03, 2026 at 11:37:07AM +0200, Jorge Ramirez wrote:
> >> On 27/03/26 18:40:39, Sumit Garg wrote:
> >>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>>
> >>> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> >>> TZ service allows to support multiple TZ implementation backends like QTEE
> >>> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> >>> backend service.
> >>
> >> OP-TEE based PAS service relies on the linux driver to configure the
> >> iommu (just as it is done on the no_tz case). This generic patch does
> >> not cover that requirement.
> > 
> > That's exactly the reason why the kodiak EL2 dtso disables venus by
> > default in patch #1 due to missing IOMMU configuration.
> > 
> >>
> >> Because of that, it is probably better if the commit message doesnt
> >> mention OP-TEE and instead maybe indicate that PAS wll support TEEs that
> >> implement the same restrictions that QTEE (ie, iommu configuration).
> > 
> > The scope for this patch is to just adopt the generic PAS layer without
> > affecting the client functionality.

the patchset cover letter + the commit message + the OP-TEE pull request
being referenced gives the ilusion to users that with the current set
they will get something functional (they will get a broken video
platform instead if they try to use OP-TEE).

That was the point I was making: IMO the commit message walks on a thin
line of "completeness"

QTEE and OP-TEE at this time implement different use cases (Venus with
QTEE runs with Linux on EL1 , OP-TEE runs with Linux on EL2). So maybe
worth mentioning this divergence.

> > 
> >>
> >> I can send an RFC for OP-TEE support based on the integration work being
> >> carried out here [1]
> > 
> > @Vikash may know better details about support for IOMMU configuration
> > for venus since it's a generic functionality missing when Linux runs in
> > EL2 whether it's with QTEE or OP-TEE.
> > 
> > However, feel free to propose your work to initiate discussions again.
> 
> Vikas and team depends on some of the IOMMU patches to get accepted 
> before they enable the EL2 venus support. Please reach out to him
> and Prakash Gupta at Qualcomm.

isn't Vikash in this thread, he can ping me too no :) ? but sure, we'll
synch later 
