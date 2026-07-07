Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9389F435A9B
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442573; cv=none; b=TkHf2Q87lNVv5XdyGSVB7NarYm2RW46e5YcdTNjnMvU7reYl5NFvBPPgG+BLn+4WF71+pstIWLZOMzzMlRg3g6JCozI75IDzkeifefjWeNoD9xKs96QjNswFjYISag0WYknYd14dICnh7IZS0bgswl/oUTnhCDDiuFQkahzRH9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442573; c=relaxed/simple;
	bh=zmmmXJpEFQfT9LL96zAN1n79uNV+fe4mehteFTXk5XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twtD2SkXhnCFHYa0ydiXBWsnBXAuwAlxTCTBXV8ra2eCY+XTWZMnWrlGUToiE4Pb88n+Km96afb1HOiLwUj1XBLcTB2+Wk+XOSWtVZ9rIJ7/HN6hVlsj/ZZigoAcgBmDtCCpkX89+kPZhsqf0oPzfyZ0s8rnaWLLtqzndvdZ0/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDhLK/AG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYUkF1rT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDhLK/AG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYUkF1rT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT2kQ4173078
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 16:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Qe7pk8a29mkB/ToP9tmorjc
	IpiQB2oLiDgFYvMoFYg=; b=DDhLK/AGst7Ue6QNhxSF4MvK7XU1G78tumVNHwOM
	EzXTz4sonhbzFrqn5CjS3GAIUkzpNJJyMXBGrL4IsDwFDH+kwUlOX8zKiOBMNgCr
	J6MG4SpbtUn2P9zl6C5kY3EDE1qJCIgngchwnwf5pZqSSEIEtJYQpqnbTmd2JJ5C
	9Ye4FoXgEJboC7/QDGVpEtsGsDGNe7e0VKrq+Jd+8VewbNB/X1ECYi30VF0IMLle
	Tiq6y2Js3aZNW4aDloTDxgXrIHi2IEEaEib8K0K8adIoDLtZ4W1ZqOpGRNIX84BQ
	XLb2tu3L608A31Cxy4VNuUC13LHhJczzT9nnxN4B09zhbQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3takku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:42:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737d34a0dc8so4527871137.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442571; x=1784047371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Qe7pk8a29mkB/ToP9tmorjcIpiQB2oLiDgFYvMoFYg=;
        b=FYUkF1rTpEttmon5iiaHzzY9/sgSASCTCUlE4YWYybC/9qmwxAsfAUg6nrneQeSE3S
         lBh7GNHGq8y2Nn7X3jGfO6doF5ydt9N8rSLasshqQ9jsKWBYHFl49/mYbKEaIG4fd+xu
         4T9USsRQH2+uTafikiTZRF8THqRawv/gF4qbaomAtkv5g0HgONDQPDWTa2DA7ZRqomk3
         4JzY62LX/PZxx7nDRt9APb+2HVxtuE37aN6mGniZITUoTLrMhoDd7XgplbifzNYnmWRz
         fe5L2MYcmuUAYXKG2qt+sDcCA7Rc1hZ82dfOTUcVJOe6ExSLKUd2fG+LiRovKXzzGIsc
         c76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442571; x=1784047371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Qe7pk8a29mkB/ToP9tmorjcIpiQB2oLiDgFYvMoFYg=;
        b=soX5Oki72cDsixgZXJ2wLkTS1rcD9Xnye5NPNRSnyXc4GUjdU6aWyBMK5SCE1oNz6T
         w6GDcsZ6CeF8KpZ2D/7A0Au9HsRufnqUXu+lGbfLUZNZBlTmQlRujhZAt2ZH6xI7haCp
         M9R6mExL/csMC3GrlF6qfys1bzYBQRru3nkEQv7ysbtk4DzCjUMKT0/WXdZKTUbiAaOa
         lrc0188nlL26qd13C7ZdIkzNt1h/f+oK8B3A1Z2CEgac8dZnsG/6mdWwK1Q7PhYBL3Ds
         X1Fse3tntwP2Hjxgw3uP1ye88/jFCw+ueNJR1X+FusaZcmNMQBKJrbMKQ6Xs9Uka5xLa
         3rUw==
X-Forwarded-Encrypted: i=1; AHgh+RoP53n+H19IcXAbFezOGSl2Hak3RYNb6AVnYrmtKgWABt7+Y13V4mV42TMnVo+QJRcrWw4HbwMcER16@vger.kernel.org
X-Gm-Message-State: AOJu0YyBpdEhaNnRle5M2pgI8hjScdAPPcwGukoVf2yUbgjLd2Wir+1R
	VdtSaTHAH/W8IJfJsSKTGCxyt8QDdHKrSXjoYsDDsJfn+HbnpdXI08hJ6HXXE511K/uaa9Vis51
	g90ZzQPSJRBqa/86hAdPNkiBeRTn//nn4B0hSK9h9QV6XPjq1ehuZdY0Og+ZMmbtj
X-Gm-Gg: AfdE7clo6cxdSRUpWOLtymBiy9l1YtnZH8m6DqClQavIHDwZBgFD4/DHjMUJC3dPCDQ
	S39hz0OLJEnbWPOJekUckQCE8zXReUuE8qtGtpZf9uOjy3je11w2HrziWWonmP4sScG0BR2PY2N
	TDmKMR8OFeQPj+CxY0Pnq/7iHSVcYUXkbeUurFeviGoF9TeCUE6uVMs8aeGDhvByLWXtiCFt/UB
	0NkkJVrkezjUaPP2b6BCjnj8vkDsEnkMZrUA8sJt/nyC8OIlBvpY9EG3nNpzbnIfyqAf03YbPER
	zDJH4dkhzqWEzwuw1pInu45u4tokHvZmHZmmFmpJIMq/d05s4nS6QhXCYGlafwAkYsAdYbTWT5K
	n+SHbxGUPNBipBrRZSFPZ3dNoqpRz1+F1akO8hTOaqScQUDRl8qOFIxts/kK1PA6FzcBLfFBn8F
	lDv4XpYrZo5zsFXubCLe62lUgK
X-Received: by 2002:a05:6102:5491:b0:739:d787:be5 with SMTP id ada2fe7eead31-744b7e91665mr3674843137.29.1783442569696;
        Tue, 07 Jul 2026 09:42:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5491:b0:739:d787:be5 with SMTP id ada2fe7eead31-744b7e91665mr3674805137.29.1783442568650;
        Tue, 07 Jul 2026 09:42:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm391001fa.40.2026.07.07.09.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:42:46 -0700 (PDT)
Date: Tue, 7 Jul 2026 19:42:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
X-Proofpoint-GUID: Dx7rNurnlZ2cNPwnWfn0ko2BTsSQZY5c
X-Proofpoint-ORIG-GUID: Dx7rNurnlZ2cNPwnWfn0ko2BTsSQZY5c
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4d2c8b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=51R1jNVWGJiQLheemG0A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX9xqo8KvYLpCI
 uod5He+nJ1BTLl65+SNrFtETDosUGouzNvoVnH07dYvcox+aAd2U4wqMBmRd9mcfb0MYy3GhFX3
 MzqKHHf/EdOTzFnk7HSVDsj22is8l+hlmJkbyvTvuoQy18zdUvWOysVzqEg/4lG9df+LBk2KNE4
 14MDg5FZXPwnKgyYJFF7aQJavsz00WQ1AviaGiFM9V6illVMATpBDnH6saphEO0A5xdnGMIfYgA
 l0Fmj/zftgbqb7FtgimxFF63U2B0eAFTPn/z9Q6GZL5+4zJFZPoQZs6RW6N4wpXPfe3oJrH+cFV
 H9PuhtjfV4gieu+7NcoGNePmdqD+gEPgwwKRYZ4nz4go7MBcVlHKMMG3c+GVctc3RfJ6dJSgf1U
 HSvo39bjQ7hqlr6viRTg2yJQ7WwGSdFhdvpwvjwjcDHU5Ibc7ytU88/PElCDMh/XPXenUraNuO5
 B1aGlAi7fRt8RBEta6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX4cBTatVm9H5B
 x+s5l6YQo1PUFwVFRv+qIZgx0gRd+E3quek0E0Bwns7vQUXlEDkyqxzeT8wSnKfl8vn4f5gCQn9
 x9ILO8hiAPk0nuU3A5j3RpSivkQNdR8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070164

On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
> > > Some SoC implementations require a bandwidth vote on an interconnect
> > > path before the SMMU register space is accessible. Add the optional
> > 
> > Why is it limited only to those SoCs? Is it also applicable to other
> > Qualcomm SoCs?
> > 
> 
> I was hoping to keep this series focused on the core infrastructure
> changes: the bindings, base ICC bandwidth-voting support, and DT
> interconnect properties for the platforms currently supported on
> Qualcomm Linux and have been validated so far.
> 
> The additional targets have not been tested yet, so I'd prefer
> to add their support in a separate follow-up series once validation
> is complete, rather than growing this series further. WDYT?

Then it should be a part of the commit message. All SoCs since SDM12345
need to vote on the interconnect (and then, in the cover letter mention
that you convert only a few of the SoCs). We possibly can help with
testing on other platforms.

> > > 'interconnects' property to the binding to allow platform DT nodes
> > > to describe this path.
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
> > >   1 file changed, 27 insertions(+)
> > > 

-- 
With best wishes
Dmitry
