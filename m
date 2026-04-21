Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C4437FF4E
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751815; cv=none; b=Un22Img6hGtl+j7HIZ6E4g5FmgKyOmQTohJ7QYwPw141yGOVBSD/azq7+Jja6DkGaCP3FdZ0Q38ZpK9oxmAgLbcd3bcbWjqvZ10vEC5KMwkCoYGGhzzxmaoWa6zhu94ajea3S1YHpMiuC/2cCW8qCN53QLZctUsZ84iWwRsc1X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751815; c=relaxed/simple;
	bh=DU09t4e01tb2Dg5oxA0hYoS2Sw4H3Q/MxB4hZIBL86c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6I9GGQ5EfN5BiSKY2VPDm7LDd5w4CNZebInKIArhRutJeag1SBgHZASuWubHlsaO4WDUAB5cwSll3C/AhiLkwKqSQRwgSEAvJ4wKUSHp1ityl2Vd5/QiJ9BMppJ6F/xglIRMazA3tSTSIwd2lthJmxM8+Cu53rSrEAWhpS+cxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ss0fIIkU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaqcwkPk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ss0fIIkU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaqcwkPk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L4Xd7r1510935
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1guwVUsMIMD/Wpv/IcScqQdd
	RIpEXoJdanKvBpB1ZJ0=; b=Ss0fIIkU1dxb5Xy/z/S+TipJ0qapF+MW2z9RlxuI
	seJUYFSYlo7RfNQIndELCdlXAo1Yd9KlKN58BlvPXYli0tHPDRUnU0j6tz1JMRDB
	qZvE1oDA9TTDSum0vF6ztWcUdvSSFEHahRBX0eVMV38DUk41RhLEVOYJz6iqxU+y
	WBHh7ytR25fEZZYhI4bpvYJxJr6ueOhVxwqE9qK5841XW/tBqVwUQQR+ob2A1gsR
	ew66n2e2nNYC5JWPni11CRrl4u99iZClicgK7oKxD3UM6PD4+wQSR3bKVwYMZrHd
	WFQOVVY/rcvr63ZaGTSQ7mtU3V72eVjC0OI1p9lmpNbBIw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak0b07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:10:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bce224720d8so2143681a12.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 23:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776751812; x=1777356612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1guwVUsMIMD/Wpv/IcScqQddRIpEXoJdanKvBpB1ZJ0=;
        b=VaqcwkPkGazImO9LlS04PQbgLMogTv6eSBsTQHEfrsZroJfF49Ffluly5yoHTqeBiH
         QaddOUouiCvH3n39UoBWgND0liu4dOxm+uNVViZ9+TwKFfCLtii5MQIfVkvT7gXBQXec
         lbLbR/fkYKHbpQKsatNpVZpHESEOCa6kB86zWSgHUSdr3hQDygG5qTSsAiHKjxCr/AyT
         GrX1Zwc0dwYm6mbmCLkpfodJVLiwtHwZCyjGnlC0T5oeh+wkANg5YsvdkFkvRqX8zABX
         2NqFuPIPUSrZITuA4G4vmXNiZCen9hRNgRqfkibFiLXTAT8uvSmaKDCyG3OsaR6aFLxS
         unEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776751812; x=1777356612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1guwVUsMIMD/Wpv/IcScqQddRIpEXoJdanKvBpB1ZJ0=;
        b=l6T+lfi2WW0sExiuBKGHA8jJMytWDUGHuLbwoCtVa7BAb0YiqwAtlU1jLaej0qHIGz
         U1j5fkcFo8QUkLYK5OleAH86c9IBgaPBaKicXmIqkho/FZSfoK2cWbC5C/4jO0Ydt5nk
         D51BUWV2MsXlNOp/x3rr+I5hV3PaDAECPcLobu2QIlDPR4p/FF66FiZZ2kS4OZ7b7fZu
         7cG78wqAbWVABcoh74WtNEHpcL6WMG7NND3VHFoGIeY4w6y/q19kOrC/EKGH1sxDZ6Pk
         rKReNQVQwk9oxUjAY/lgPOIuQhZch96Ovlc2DDbuNmk5ltHMYomnX98QoX7zhQtoafIA
         PIhg==
X-Forwarded-Encrypted: i=1; AFNElJ/STVacyDp3GIRazs5dgUAlZDDmCxlevun1QpOXHhSEBA7jloXNy2EkRZTLdD8HY6PnnqqUlJ0K82+R@vger.kernel.org
X-Gm-Message-State: AOJu0Yypu+8Tz07NzHb0HSbsS3eLBPF2OAJ/LRzzI7iUKCfsBsowv25N
	GLctZyB2ViLX0AGud8fgxrCEzx6e2H/ng/25p8/X9MhLc9VO5A2sjewFtrZ12jVi1NVT0HBMBdR
	G/ULsSyV8vRhg2V7VrWmmNhaQTUf4tfTdBPhS7P+NSLKgYVKRe92BHIFSJE8Kubr8
X-Gm-Gg: AeBDiescX6icsXkNbNu1LYZpAs+8ixcdBGXzgGQrul/piK7KcMqqw78+3Jg5S8CXXDN
	U3gZZTj/kt4bzULfun+SEWHQWMv/E9xVTwBRuxsbV1LEFzwfq8AiSsLq0vdG3UWUCtFhXh5T3s8
	0c+16JNX53FlYCzwlxyNYikpydARHoMMqNdrXEiaD1DSyPO3iuMVcOrlXzBBj3up6XCeRacxytL
	mgH63b/iWEEYNSvYpYdUqjFE3FRWFSxTKRTa9EPeDFB71jricKvrConzdVu+No5PPLFo0APsz2E
	5FjMmC9WP2YSunZGFkQI8jkzLat5jpW1VmsF04bDMJ3uNQvwR8rANk2Hi38yAT0BzmyGvD3LP5p
	f2kqUDtuR/a4miZIB4fQr6G2hs6fDGJjJ5J4UKmLFfM5ANkN61QvHQUSUlDRgwf+txUFUDg==
X-Received: by 2002:a05:6a00:1c9e:b0:82f:6b6f:13ec with SMTP id d2e1a72fcca58-82f8c9427b4mr15422848b3a.34.1776751809487;
        Mon, 20 Apr 2026 23:10:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c9e:b0:82f:6b6f:13ec with SMTP id d2e1a72fcca58-82f8c9427b4mr15422812b3a.34.1776751808982;
        Mon, 20 Apr 2026 23:10:08 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm13905438b3a.47.2026.04.20.23.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 23:10:08 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:40:00 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/5] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
Message-ID: <aecUuK5nF/hjV8tX@hu-arakshit-hyd.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-3-ca1129798606@oss.qualcomm.com>
 <a432b2c2-475e-4833-9225-801990cb2d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a432b2c2-475e-4833-9225-801990cb2d34@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e714c4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ciROkYvXyXDSqN8Q_VUA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: yTzz9E5zNWcV-9OgMZrR11j5icDjGXLs
X-Proofpoint-ORIG-GUID: yTzz9E5zNWcV-9OgMZrR11j5icDjGXLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1NyBTYWx0ZWRfXyYkOwAUvQj50
 H5tJWMMAgujjsJW07jNp/YnPHKoqeXS6EVDLWByYt98kgEauSnOGmfWnx0eV/LkOT8+LOFrr2ka
 WKJerZQ48qkbGATN8A5OpbwcDiH2Q9t4EODO+K0QiizwhiMuG3oPy4sB2TqpbjKyfnoMff/zVbP
 3FWontcIeua9fp0eMyzMoo/qop/S37MvgrWQGEhdB4jAZtyfhUFEj2yb+oJNYXEKq0n4YYXhmOz
 QmZzRM6NgyZnZUeEI6wEUb1CZaAkjcADLQTAR1Hx4pS23LO3vKo5Ar0ifyuNAeKJNeqJ5Oe73aK
 Sq5RQTT+scZOFhebVeLCkvalDwotzx8SRvUiZl4x8vPLaEq2fwguaKnE1UzDeX1wcnJJQ98EJSP
 5iRVx4IFtlKdNOHz3uCFAZ8Lo6AVlkbqJ9FGylAIZITUbhNWs1QpIwjCkYR3s1S0uVJYQiiBc/C
 3zwTlXPNg1ihcv6BiJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210057

On Fri, Apr 17, 2026 at 06:59:42PM +0530, Harshal Dev wrote:
> 
> 
> On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> > MMC controller lacks a clock scaling mechanism, unlike the UFS
> > controller. By default, the MMC controller is set to TURBO mode
> > during probe, but the ICE clock remains at XO frequency,
> > leading to read/write performance degradation on eMMC.
> > 
> > To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
> > to align it with the controller clock. This ensures consistent
> > performance and avoids mismatches between the controller
> > and ICE clock frequencies.
> > 
> > For platforms where ICE is represented as a separate device,
> > use the OPP framework to vote for TURBO mode, maintaining
> > proper voltage and power domain constraints.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> 
> [...]
> 
> >  
> >  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
> > +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
> > +				   bool round_ceil); /* forward decl */
> >  
> >  static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
> >  			      struct cqhci_host *cq_host)
> > @@ -1964,6 +1966,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
> >  	}
> >  
> >  	mmc->caps2 |= MMC_CAP2_CRYPTO;
> > +
> > +	err = sdhci_msm_ice_scale_clk(msm_host, INT_MAX, false);
> 
> The 2nd parameter is an unsigned long, do you really want to pass INT_MAX here? I would go with
> UINT_MAX. But still, why go with such a high value? Do we not have an upper bound for the clk
> frequency that we know we can't ever exceed for any target across OPP tables? If not, then maybe
> UINT_MAX is best we can do here.

Ack.
The scaling functions along with the OPP-helpers clamps the requested frequency to the
maximum supported rate based on the clock/OPP table, so any sufficiently large value serves
the purpose here.
Frequencies are better represented as unsigned long values hence, will update it with
something ULONG_MAX in the next patchset.

Abhinaba Rakshit
