Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFB52264D6
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569298; cv=none; b=UgltJ8wt0K7Atc/93PdBTQqQWFW9srsZckVSxqHy8CeGbqpmzs+m3as1crn8dQ0OPm2W9TLU3bTcnuBlsyh+99+XupZyQ3qG780eIcekmh0Q7FRFHmrSAR0aIQlmYQRSdDTK/7bE2ZcJtW/eP/6IrJj3wKtJL//OslK/WkwxOsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569298; c=relaxed/simple;
	bh=11E88Luuh9A7pHdUZjbdVB67EIiwfHFebSQIHTGLQYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBiBIBzAQnpJRhuHnYj7KysRyFxCqMFePG8kdbq+ndt0bBtQCbpGYxzz7Z3sW7Pbz/weRS45sB6FXLBx5Q/rEr8TXovk5DrDXvYZdoOkB+FiMpuKecFXTp2WDbcTdhQCCMA/25DQcIvZCmhtg5gJffK7rSo4wOLqS/mOirlM5Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMsLiSYE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rvg54IbK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMsLiSYE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rvg54IbK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ1RNe1433431
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GXLr0N/URsCJyix68R2sWZbi
	19vCcQkgs1ZPrv1rgMQ=; b=kMsLiSYEp9iBn67MtLPyXoWPNsPEFlHZO+BdwhrA
	qy+3q7g9tD/1zMOwwgtudHOJVMJkhR5tZIfgbgiaOZ2inkDi5e+91fKKoSH8fm60
	C9O2pBzWonVoZ2EaMlFmlgUhjXFrR8lvryhGycQOR1eebJYd6utn+4PniDxeaT7z
	obzFMwPOVKnqg0PMtfWy6EB6XguX7z0TYz0BI5meFyjlRI/v6/IwoubpMzOkd5Un
	HKEIx8VE5uflNsoOqYj9IXFAyvzSMfmuPCbVwmoSW8xA8O4pabO1qIQTrqv/1ij+
	jjGIgq00g2rQo1Ig1y0EAZBlQjnkIdQYhGB++9bM1c6d6Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhk9ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:21:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cec2c6b821so83145756d6.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569295; x=1782174095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GXLr0N/URsCJyix68R2sWZbi19vCcQkgs1ZPrv1rgMQ=;
        b=Rvg54IbKXyuTMunM7GlK8cL9DZXkld0cCJxfGBhtDfTOa+J/FAmepsf6GIKumOprpn
         45CYmOEgKEv9MONNxVCrnvAyszq5vt05ppbjDW90QYjBy5FXr7pzqY7jDrxeLRlk6h6A
         BavzKvsyUsX4xUccPQQrJDn5+4NWTxmN11+M5MSwiaSpD0CAt24n6Dt0HjVlYyu+wt/g
         dnAWCX09LnICIqkTpqOYOhOY0GJO0qm1aAOEpE+2A7W0nzNU+ZSnbkzQOp4QucAST+m0
         hXxePlkt4zmQLNjoT0Yj56RUsfJSjn7ib3C9aWMEpgPGEGlilhtQqmoP9ck4QH4wKz9X
         2NwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569295; x=1782174095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXLr0N/URsCJyix68R2sWZbi19vCcQkgs1ZPrv1rgMQ=;
        b=geQNgz21M+SB+TMYBvB76i51VsqbhyE0uTa3z4OlyB1X+dCUXMSRxS2+Mg+ynBhErY
         GHnGnTARmY8eQK1rszCi0Fo9vnAyi1XKkq61XHSXNMoJMdhKXyrTK1lx1rPmIP0C/HUY
         m75sJmWodvnnrhgCGdSqBg7+H6PQcF+9fj9f+xMKtxRMZSM6+qCxwlEMXRWa45/oK3+L
         P+L8vNTx9765UG3zZ0gP0qm/QAzqtrFuEGvifHYSyq3YEA91pOrdXx25yp4JdBMzX63i
         Qj24o1594fxGUquPM+sfkfu3eEhVkK3zJEQVVC4exhPRcMs8P5e9RUQJQYmc/6CBRYD0
         EMmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QdIhL0IGYHJpdq0Oon/RWNPF31VPk6kXf7eLVHdLAwuOtgE+tmmJqEulD6RBHBiOghal43tswtuAA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0vImxA14E9Gp3OcUzQRKNsX9Uw1DTcxVsVaq+B25eIODcIukh
	k3wQkNPa1p6Eqapcjc59i7mp/PvfCCggLaHfP7qL8FLbdQJwdPyS3E6bpqehQfRBsOmQkJIy5w+
	lxYpNDFGtkFh/rggeSFr/kIyaHTxE/gCbPbpKcMnczTC6XOp5oQZnpAdFKkMzQJJ/
X-Gm-Gg: Acq92OFnGua6CHv6wuFI/V7NCFLJ1uOz8iX+EyOl1Y4C28PtoXYODgkmFMrGZQIOZ9P
	7jZZAHpg9oSgaORcWQLesXkBVrwUm9vLU31pKJB2AxjLSSWSybk8xJRZjzShlcDuEg7w0/81ph5
	CixHaHpv/37+xRIgUrHTeSHPI1Ka9gRWMoQc2q5rjcw6Df6LMLVUThAZDTL72IHRBMkfejgx81N
	PCaMMnSCTVp3zi22TdgurdOYeuHoJbAdSEI6vQAijSzixNO8I3rlt9woZrMLArnt3QmYTT/9v7j
	91wUw0VeuFoq+WMjikPHJxcWThKzd3luzkDc4LMrTqVne8TOHYNyjN6XjgjInmw4o8KcJBO3FXD
	OC/tSr9JpZfaXKOKXENzx72F9kxAjWsN8vxgJuqxiX+7+yI6tcq3MN2gcNXY184iIqSmoFqF8bb
	9X04jYOS3bQFb+q2r5KoLpgCjfeTRx16cySAY=
X-Received: by 2002:a05:620a:2728:b0:915:a457:bf94 with SMTP id af79cd13be357-91c48262296mr197856385a.48.1781569294766;
        Mon, 15 Jun 2026 17:21:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2728:b0:915:a457:bf94 with SMTP id af79cd13be357-91c48262296mr197853385a.48.1781569294305;
        Mon, 15 Jun 2026 17:21:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c05abc0sm2661311fa.14.2026.06.15.17.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:21:32 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:21:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX2zLCpU1kB8Rs
 nH1kCF48+d1dhmqfvq4bS4EX0P0QLCe2ngNx2yEuse8avlUL4zBCDEbYe0hMtgiDwsgVciE2kua
 eYghU2sY9K1s8isV13ZElMyjBHFlC4w=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a30970f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ak52lZM5eA1PxQ1fx0cA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: sBc3G1SfMut3Exk5oTPQKihoXRE1rphR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX0EIJX+lAxID4
 zIIIveufXfZ8lXW3WiTsYPjDww7/5uerazQhRrBdripwg0xzl1pMrGmtvXn6L5eZpcBoJNOiI4A
 l2/qg9XxUvEnMdQpszqrZwiDRtOeKxyHVV/I8NcL1E82qiKku5WZScekJfn7LMd7AyPSF0rswRU
 f/QhbcbYec/DzJ4pUWVeaYQfIS5+B53kosmeUMMcQWJaY7M6REt91V9yAjTIZCa6HOco0Z5htu1
 o0JPJllttxRyBW+i20cT6qodsX/7UzHG/NJjhxXPYlnYoBmzXwCU3q2fBmM5p8vjN+IeWfDKOo7
 MAbEfplqYwhHnCIhhnM6davEDQ9YAkSFp7Ey5AYCn3LaKiAKDBbswyOKibgywXadIYu+gLcL/1+
 FP/l7UkKCZG9tInBLmOp+ICTT+zqD1VGrGHC+abTl5TeJ9wkFJNAiN1H4Fz0ak878oA7N4QP3Vb
 mcdPL9cKNNVgGF3gATQ==
X-Proofpoint-ORIG-GUID: sBc3G1SfMut3Exk5oTPQKihoXRE1rphR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160001

On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
> > On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
> > > On some SoCs the SMMU registers require an active interconnect
> > > bandwidth vote to be accessible. While other clients typically
> > > satisfy this requirement implicitly, certain corner cases (e.g.
> > > during sleep/wakeup transitions) can leave the SMMU without a
> > > vote, causing intermittent register access failures.
> > > 
> > > Add support for an optional interconnect path to the arm-smmu
> > > driver and vote for bandwidth while the SMMU is active. The path
> > > is acquired from DT if present and ignored otherwise.
> > > 
> > > The bandwidth vote is enabled before accessing SMMU registers
> > > during probe and runtime resume, and released during runtime
> > > suspend and on error paths.
> > > 
> > > Generally, from an architectural perspective, GEM_NOC and DDR are
> > > expected to have an active vote whenever the adreno_smmu block is
> > > powered on. In most common use cases, this requirement is implicitly
> > > satisfied because other GPU-related clients (for example, the GMU
> > > device) already hold a GEM_NOC vote when adreno_smmu is enabled.
> > > 
> > > However, there are certain corner cases, such as during sleep/wakeup
> > > transitions, where the GEM_NOC vote can be removed before adreno_smmu
> > > is powered down. If adreno_smmu is then accessed while the interconnect
> > > vote is missing, it can lead to the observed failures. Because of the
> > > precise ordering involved, this scenario is difficult to reproduce
> > > consistently.
> > > (also GDSC is involved in adreno usecases can have an independent vote)
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
> > >   2 files changed, 57 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -53,6 +53,11 @@
> > >   #define MSI_IOVA_BASE			0x8000000
> > >   #define MSI_IOVA_LENGTH			0x100000
> > > +/* Interconnect bandwidth vote values for the SMMU register access path */
> > > +#define ARM_SMMU_ICC_AVG_BW		0
> > > +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> > 
> > totally random numbers, which might be different for non-Qualcomm platform.
> > 
> 
> Ideally, any non-zero value would be enough to keep the path active.

This is true for Qualcomm devices. However, you are adding this to a
generic code.

> Here 1 Would be enough to keep the path active, but might be too small to
> reliably keep the bus active.
> Other is UINT_MAX, which will reliably keep the bus active but might cause a
> power penalty.
> 
> #define ARM_SMMU_ICC_PEAK_BW_HIGH	UINT_MAX
> 
> seems to be suitable here to reliably keep the bus active by BCM
> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
> 
> LMK, if you feel otherwise.

Shift it to the qcom instance or provide platform-specific values? (My
preference would be towards the first solution).

> 
> 
> > > +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> > > +
> > >   static int force_stage;
> > >   module_param(force_stage, int, S_IRUGO);
> > >   MODULE_PARM_DESC(force_stage,

-- 
With best wishes
Dmitry
