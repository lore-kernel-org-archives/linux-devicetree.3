Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BB4324B1E
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 22:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782339409; cv=none; b=pfjqPigP/qSzGdFRs4TZorRRuAcPCUcoi4akI4OpRq6a6QRJQHCNl0kLSbM+PM7kIspSPfQ8W7VOzoeRzpHjkP6dvH4VDlhiuSpuUkyXtAoJVcdoCdtrIv9U8xBIJTLa0gk1G84raIPZ46ljLNmG+txjr0BpF9qm8BTxtN0/Tsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782339409; c=relaxed/simple;
	bh=3ZY9NmvCRi89LvyUAPLGxHHPt6f5rWr3GMrM+su+Osc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hyc+DRDJPV/3PiN81dFnP+Qdge2sS0YJ+AmAsjZC2fgJ0LJc7lirtx4dtm1UKaKwKbMya2XlNx8Kz9x01wQIeRuF9uPu8HqDM+TZUdjsIY8Ujt7DFbYWKAXlUw54eE00mebT4KOjdnt0aY2R7tcdqMj5tItF24j8uMonU7aNAdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HezL6rWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UolSCkNa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HezL6rWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UolSCkNa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLr60t167103
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 22:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W9RmnNz+MWuT0a4Pzk3YY3c8
	e9tUr4RYQGfaW05AlWc=; b=HezL6rWZZYiHalnSnwOELO70gEf8qHv4kQE2mQi8
	5NP0OupDLTK9p942M6gs25fjZHWx+8ki0cvkyuWukCvzPCCg/e4Lie4S2YzYk3MZ
	EVlchSfBsu40ieDMsXOrAinuem4uU7tOx470a48HxL57vdHpQHRSA0JVcg+8fZNF
	7fR0Ef056e/CYgrWSQMmbrhBEk4waMCRS99WF4pFgujJjri2lh5gvy7CXBiDj/x5
	G4MQ0aV1qPNhGqDysyrHq6D/RcouLKFIRNg0fuNHpqHML4wWkMOpQ+gaKn64LJRt
	QMA+ciY6d706RvedPfqxbLWW2IJteci0W5l33o5UX9Mv8g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dsd7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 22:16:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c62861b3bso407828eec.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782339406; x=1782944206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9RmnNz+MWuT0a4Pzk3YY3c8e9tUr4RYQGfaW05AlWc=;
        b=UolSCkNagZYlwMwF6HgnvGTY9OCJJplaiKQPeeSpjrlySjq30DaHxu4D0kD1kHeGTR
         97cVrA1Qx51ZePsinL8HTKzVdPewUAXAnPFD9HaOslA3ibyU9F2Sz+cHbMgWw4hn0pPY
         NVPgQfRHz8sTvAQ+T1TH2woDm0I3Rmh+ee9xaLjI0hp4/1QxGgtlXmYrUsawXVQXFCL5
         ZuFdkIttRCM48VqQ4d2y9DvxJpV0alOOcreO95qeHjjP6kHaHWmdPyOgj8YSmkDZkb4T
         HYlyqKoPn64nEpXHayzA5/cZhZuOJEUICFZDBwnD//IcmfcK3QJq7VbzqRCqyYtNdwX7
         ZVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782339406; x=1782944206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9RmnNz+MWuT0a4Pzk3YY3c8e9tUr4RYQGfaW05AlWc=;
        b=HFUk0dK99ow6DQR8nan7mW+68uDbuZqKlJPp6ByYOcLs7WUyrlVsb7ODN2bRkoOA2i
         PmmHYJyY+GK7d1onJ1dUcpAK310t5947/fukXcxmCt1daEhAb0bE7qWXPtcxXamR3Smi
         cW8LNgPcNMto5vUs9M+Bgb4B6Uk5yE/9IYBBJ2L7BZVVwoKkqdJePwhnwLOGqfbfk+wt
         RR111uBdUG5t6GJdo0yHhvi55IsuNYNVthm85fPUtvlUWg7Dsy+r+zEi9jkPTRPmoNg4
         +G7mh9pH93D7ckRvij4FSObiHWLkO/yiTBdkoCnwCxMFB5JRjMj/EwK/RZwGdQyf4vRX
         ldZw==
X-Forwarded-Encrypted: i=1; AHgh+RooCj7bocO5BiqbTWVqXsOq3GhKRUjxlztFVtdSIyZxV16joEAiioj1p8VqDjbkYeWEwsJ7eneNDJ4u@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKvOK7A/6vWCMgDuKd/4JsvCDFieEYZZoc+iFlDfOrxyjKVG8
	J9HUTJ+dhe4Y2YEfQoK6OJLWWSE/PsHzcu9E+rxwIiSG2XHpO+jAZrAweucTAW7KA/pEMNJEeaW
	WKmawVrJep8yKIopS5pghrNdVqdc4VlDGvZHyPrZayc7gCBCgKvnzNHhI9fLw9a2u
X-Gm-Gg: AfdE7cnYzEZvkFjllj8urD5g7ruc//GvJfCYkZjD+FW69wOWmnemSEiVc42gUe2PW/t
	9KQ8EQmHM3GfiMaD16/erN/r0xD8dFuMGoqCr6UvIS2KMMC5GjG0c1QjdPy8lNWzjXrquRDhjOw
	vmXzMhGmlpl82WnBnydgMlGkDRiCyraQmKbmVrBsBu1iADmNoUqAv3OXrXhVqe04mYcvYBZk78e
	OF+B/tkXaoTPQEDibjjm4ME66uMvN/lop8uhCgVfs19/v8flSm3DKyv4ASb63GqRMZYWzqnxv5C
	hsGQmAPSgp45QyKfZun8LXV0e/zePI1mgPcATEj68KtQPtuL8o0lrVI1npl+4BzgTrVAOldMmti
	i2Cj9ATwB7FCArZ0POxhZGH2l1KeShIetOwmLOFi+
X-Received: by 2002:a05:7300:1895:b0:30c:5f53:f38b with SMTP id 5a478bee46e88-30c84b86801mr82893eec.9.1782339405632;
        Wed, 24 Jun 2026 15:16:45 -0700 (PDT)
X-Received: by 2002:a05:7300:1895:b0:30c:5f53:f38b with SMTP id 5a478bee46e88-30c84b86801mr82863eec.9.1782339405110;
        Wed, 24 Jun 2026 15:16:45 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca208sm1949748eec.3.2026.06.24.15.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 15:16:44 -0700 (PDT)
Date: Thu, 25 Jun 2026 03:46:37 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org,
        monish.chunara@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Message-ID: <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
X-Proofpoint-GUID: fC2bH7ZKQ-uSOdi1X9_we-EfRDLzyFfL
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3c574e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=axg2tsYLhavgZJfYiDEA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE4NiBTYWx0ZWRfX6BQ2G2lbu5JP
 pElI05l1Pwsbu9IiagnCOMHocovpTRhoOJIW3HPwfmzm2+Ydp6asnOGct3UKHlGIRv/c3zIfYMM
 y6khDkX0UmxXBi0PzWxuc1BFkUhSUMc=
X-Proofpoint-ORIG-GUID: fC2bH7ZKQ-uSOdi1X9_we-EfRDLzyFfL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE4NiBTYWx0ZWRfX1YE1uQYUbIzb
 WecycynntDPFU0q843SHDIrme6Md7S5/oUOU7e/p+BTi2sZhwqMAXOL7Qx4756deB6flkdvTFxH
 UPLYlw2hCkBUTAhTYhLKHEKmHj0Gj9y0dnzqqgdq/bg/uBTXdAsi00/vr1hSUH0nqT49E+sn+qh
 syWnaWwJDDVtI72qJqGWmmvqYbtaUuJBwY3EXc5TvxvlByNpAxB/wTQAG0hRst35u8tRoe6/V3T
 1ZejipR5mtI0re8B7p1t2TByhET5kxwF9zQ8S3A6x9tBKaLPWGAfqCUtKdXgvFeyOZP/xloTsqC
 k2FXuYMugtrm56gC2pQrXxMFtj9KMFxpbToa6e75uH7zDtVxcDEsDnPmfOG/jLbtRPkMJLt0RCI
 ARASDIom25gRY3+zEylJg4/We2WtPdZvON6tc4CexPb/Fn0ditcq1H1uWPJ7lxkGgnTexXnpGj3
 RXLH7NcPKkajwS5iI9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240186

On Tue, Jun 16, 2026 at 01:48:50PM +0200, Konrad Dybcio wrote:
> On 5/15/26 1:16 PM, Kamal Wadhwa wrote:
> > On Wed, Jan 28, 2026 at 12:32:09AM +0530, Saikiran wrote:
> >> This series adds support for the standard `regulator-off-on-delay-us`
> >> property to the Qualcomm RPMh regulator driver and updates the
> >> corresponding Device Tree bindings.
> >>
> >> Motivation:
> >> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
> >> (LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
> >> When these regulators are disabled, the voltage decays very slowly. If
> >> re-enabled too quickly, the sensor experiences a brownout and fails to
> >> initialize.
> >>
> >> Verification:
> >> I verified that the core `drivers/regulator/of_regulator.c` does not
> >> currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
> >> Therefore, the driver must parse this property explicitly and populate
> >> `rdesc->off_on_delay` so the regulator core can enforce the constraint.
> >>
> >> Changes in v3:
> >> - Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
> >>   for `qcom,rpmh-regulator` (Requested by Mark Brown).
> >> - Updated Patch 2/2: Refined commit message to explicitly mention the
> >>   passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
> >>   (Requested by Mark Brown).
> >>
> >> Changes in v2:
> >> - Moved the motivation/context from the cover letter into the commit
> >>   message of the driver patch.
> >>
> >> Saikiran (2):
> >>   dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
> >>   regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
> > 
> > Hi Mark, Bjorn, Konrad and all,
> > 
> > We have another UFS issue on QCS8300 RB4 EVK, where it seems this patch is
> > helping.
> > 
> > Issue is seen 2/10 reboots and it happens in the UFS probe defer path:
> > 
> > 1. UFS probe takes regulator handle for VCC(vreg_l8a) of UFS host controller.
> > 2. UFS probe enables the regulator
> > 3. UFS probe defers (due to some other dependency un-related to regulator)
> > 4. UFS regulator disabled on probe exit
> > 5. UFS re-attempts probe and re-enables the regulator
> > 6. UFS init sequence runs -> UFS NOP OUT command failed (no shell) 
> > 
> > Issue Log:
> > 
> > [    6.583836] ufshcd-qcom 1d84000.ufs: ufshcd_verify_dev_init: NOP OUT failed -11
> > [    6.592780] ufshcd-qcom 1d84000.ufs: ufshcd_async_scan failed: -11
> > 
> > NOTE
> > - Issue is not seen in first probe attempt, because UFS regulators are left ON
> >   from bootloader, which gives enough time between rail turn ON and UFS init
> >   sequence start.  However in issue case, it seems re-probe is happening too
> >   fast, which causes init sequence to fail and UFS brownouts (similar to camera
> >   sensor case)
> > 
> > - Also, we compared this board with other RBxx EVK boards for UFS rail, it
> >   seems that this board has more caps on the VCC regulator, as the board is
> >   designed to have both EMMC and UFS, and we have DT option to pick one of them.
> > 
> >   So for EMMC those extra caps were added and they are impacting rampup on VCC.
> > 
> > Since this is not entirely a UFS part issue, but a board design constraint, it
> > seems better if we handle this in the regulator side itself, as adding it in the
> > UFS driver may not be acceptable from UFS reviewers.
> > 
> > Please share your opinion, if this seems to be good reason to accept this patch?
> 
> Is that board in production already, or is that something that can be fixed?

yes, it cannot be fixed in HW, as the board is already in production.

> 
> Konrad
