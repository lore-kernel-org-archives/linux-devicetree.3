Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE011FCF41
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774408694; cv=none; b=nAiZjwS2Sohha8nBDHm8Eocl6pJapdh/86QtDgsqaTWbbGUKtmSRJd2RlvueQnlLrb16zdsSZtbwEAJckuXaUQxuBQoIvountg1r0Hw8ulSStqIEtRaW7KKyT1SDmykRD+oPQQUhpL7lSQ8Axp8IJMpZhEO6gJ7aKxwQw2sFQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774408694; c=relaxed/simple;
	bh=dSW38DdYZZOv8pvv9YDdYAaMcK88hyE2l6wpiXYKz60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trh+o3Nvny3E+tZGzx7hWLUZRr27qRMdgCmbZ9V/iUvXszKddzYS5dZ+t+zys5D5qIAPKxSjU4YtifjZ1FXrYss/JV8mQ5EFg4eLpq/UvDKlIyvgtPnejKcUmuNPjBCAIvFEnK2av/E/YChxlFU+E1opO/ja9EYbeomeUh+Hz7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V14V8jiY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcHPFTSE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V14V8jiY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcHPFTSE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMgBdc1354115
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b6FptCPcWAnccOmmGsCSiJec
	7ospPWnRnPEalo1IhNU=; b=V14V8jiY8/Vh7OeWBacOdmqbC9tI695Sm76Iaxzb
	4/bew0OwmOZmVqzFqtPL7TqmMjDcBWulQ4viAHXV98SY3NpN1zUZT02xMYHDQCoe
	CvFrA94J8pa4Y5Ijfeu2x4yrW/622ZehJormMGAlGgUuHDP/U5FbkhQrt5L45nG8
	HH1eB1ObJJk2q/qK2znbJwiVGK+QRLLz4YsWW5x1xwgKMCnEFGll0RJdOIJ/l90+
	OrDsN1EuEov1wkS3QBRrNRNq1O+6fB/9prQ5Sx1poojfhCjjNcAEGHfedEDcixq1
	u6IFgQniD6y7BI6m3FQEBDZvlX/IG0i4r3kelswIHL05EQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukmakme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:18:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4b81c632so74230921cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774408691; x=1775013491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b6FptCPcWAnccOmmGsCSiJec7ospPWnRnPEalo1IhNU=;
        b=IcHPFTSEkfnyMb7EU2gi4qPcS9ZLbqPJOiAL47BdbUHJAVd9XAE8k222jD1yQnJRX2
         PniboFOSYg4NR1oWT+UXb3jJD6f2m9lbdDgpR4R+wGQhh/lltCO4E3Jj7AqA1iWd5PXx
         /YuaAJR9tUFxuVKWUAFJrAp2RFZNRIur7+NAzizlTPUszHO7uKRdauP+sEqZj2kHM9nh
         6kh/V9vMwCPjvcyVionceMfN8FxR3EjjujjfJwMJUFCQrs+MIQJvef0WJFTF99HeC5bI
         OdUgKoKT/tgcq5c08gkTTXFbZjHasJ7KsnHEDezWQPtXUUfqrVuICQOJDfgCr1JWqBGs
         9cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774408691; x=1775013491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6FptCPcWAnccOmmGsCSiJec7ospPWnRnPEalo1IhNU=;
        b=KoihRylFUdHR3aBxEzcvChaeqVjvdgD/bDZ3lvHt38O6Ich/fFNrGYxGBUZo1GSO/u
         sn1TrUaqDdlLEcpIaBiHNw1TKRJeN2gnCUuWaKHeDmS+F9avGJzgH+sII4i2JOsx+G8V
         vmcoKdiS6TlKzEzu4y3TmiGP/l+1IpFNYBw8Dys4duot7k2o7XuMWRy8Ok/NZC4raMuc
         /FolQhlufQkTgFkdRqy1rBXCgEVa19Qn+dSgmERXy82BKiByDtsWbrlVAjw7hDNzZEc5
         LDeFmLarB60sonm/gUHBugoMIJAg8khYpTD7gHcVJtLIUD4/xPEedkEfCBzzaTDvdgZn
         cB1A==
X-Forwarded-Encrypted: i=1; AJvYcCUAgT5FnCxMmTFUNYGYb1zyJSdMXY6jOwXXkEZDvBdqouqO5r8J3VZuDRaP2PmlFpP3g5PfIRrmefr7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6GC7QUh2zBM37IiE7CFGHi1I3D375SPhQfeFU6rjc66vJ8y2v
	GaC8NvZKMhKeI7Tk+B1NGrKEZ3FeUF6dIsoB1ok+f5UBUI7GkTBBhWZ0U7bqCACkm5mdPGcxaMz
	w4WSabMfR+NH7BwSQhnwB3r47JVyPopjmYhcTT5YM9+wuWUR2fudaoI9FbdC4nGXxVRfK95sC
X-Gm-Gg: ATEYQzwEa9JMXrkHU7Sh7Jejku6I3PJuVIQORNQ0EeBiBjtgbReYkFf0RLnUfVlBCtL
	QQJwgvG1bNbjgnuQMooANGZ4cFsiw3emOc23wo+88Jjjm96ugWLpozbgmidDWrKh1r7Ko+s96LJ
	M2yrXjVzziIwPR/HS4RSn9BGh+iRhwtV7pykXqSJR7KODmn+7wRhHWB/HCVK4uGr6g/uN55Mw5m
	8yEmVPeC6Kjq2CcvOKNavnG15mUpq1xeyD47rv8nal4UdwZo1+UCULBnpb4SPbfdl+SLvzNxjea
	jaWaNDMAtaZPaCxepbKUJQJZHzCkNli3Oza07Kn9ATHN1EpJlao2On5yxzxVgNMInE5Jttpc6TV
	xhd+1uHhlsU2m7DsxxNYEDDFmalV+JthUPQCF/j/R67yo1I6vOAkFA79L+oC7doLq7I75o5DMFs
	V417ZW8/ANpRFy/6NG25RTURIHt7OPEs0RTe8=
X-Received: by 2002:ac8:5fd3:0:b0:50b:4537:2e23 with SMTP id d75a77b69052e-50b80e547b3mr28682681cf.48.1774408691332;
        Tue, 24 Mar 2026 20:18:11 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:50b:4537:2e23 with SMTP id d75a77b69052e-50b80e547b3mr28682471cf.48.1774408690815;
        Tue, 24 Mar 2026 20:18:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ac1e1csm34860401fa.35.2026.03.24.20.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:18:07 -0700 (PDT)
Date: Wed, 25 Mar 2026 05:18:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <ck6uf7rleary74n4ygedm4vhrcfassej2w7p33pwft473ipjme@qtyorrhuny7j>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
 <e833f72236342a7efbce04c2109bf921f770673c@postmarketos.org>
 <vjf4lqbd5igkhvonxed3tkydxkcc5rmt2hsefng4oojrpzf3fc@a5hujilezcdy>
 <b75b4b217c2a1d1a5edefd699f0ae9966e612d64@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b75b4b217c2a1d1a5edefd699f0ae9966e612d64@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c353f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=JaEu3K2U_7yi_sq1lugA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 6HORCLewieyA7e3ql7EXPa2w_7m4NAzO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMSBTYWx0ZWRfX7kTTYillt1ed
 OKZqfiXah5Sfg3Oifdx4la4MKNK6aLyfpeRRyAkZiwOCMsnkF8cG6QT2fdVVk1oisdmvD/tLrof
 CJY8uPoJayOBsisqF9C1GGoleGPIJ2hcE17vAdVd9cR4KtGmLHc2Ov37O28Ur6GqxNLD7DgbSjh
 C+Z5l0BuhWO76uPrzShWGYw6urtTr9JUOXDmIbMaTCQkjvHpl7/HAd9dgY7t9Ctu8l2AwmbIYla
 h89o2NlU+I+NzDHT0epaH7R4Vv2SAwJ9TAYfNW0FlCW2JHmBX3AWKsGYcfqHrAN4Ko0hIdVQsCG
 XJnA/0a3KmBRiZQWwbJ1+lyDiR9qTI0UQIXb3qVSyPNnaaW5qUKs6OCF+y6evO1V6n9fEnbEDr4
 MYL1zrmT/zPOfR5x0sN1Jgne/CuRLvLZghJ2JBmig0YqZa7jLhUg0xfENhZ/vQALWt8WUCyEmeo
 kwpIgrZITO1L9mfChuw==
X-Proofpoint-GUID: 6HORCLewieyA7e3ql7EXPa2w_7m4NAzO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250021

On Wed, Mar 25, 2026 at 02:35:33AM +0000, Paul Sajna wrote:
> March 24, 2026 at 8:55 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> 
> 
> > 
> > On Tue, Mar 24, 2026 at 04:17:09PM +0000, Paul Sajna wrote:
> > 
> > > 
> > > March 24, 2026 at 10:49 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> > >  What about the other board (judyp)?
> > >  
> > >  Konrad
> > > 
> > >  
> > >  I don't have it.
> > > 
> > You don't need it to define firmware paths.
> > 
> > -- 
> > With best wishes
> > Dmitry
> >
> 
> Should I put firmware-paths for both boards in 1 commit or 2?

Either is fine. My slight preference would be towards two commits.

-- 
With best wishes
Dmitry
