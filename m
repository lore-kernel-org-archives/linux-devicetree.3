Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA54349CFC
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783168396; cv=none; b=oVGqWBhZs8Yz3tZkWQuR7trxmHKUNraUG8QXCnc/EZzCGdGS7u4VSPBmYMGqCM/FY9K4eSstHYBByhZSUCeyXGDEfgQtQdGQyXPaXDAlSViQ0ulLarrcsGqQXuKEeNHwaTjBgVu1vk1XqOknJpcU/BBHtWBlIkar7Wstj7CAkis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783168396; c=relaxed/simple;
	bh=ZqLIdjiIL4PaEbHPy9ZDj4gnrcQqTesCsBp7hGwIhYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXb9J6ROvYOpkPcG7cPFvPf0TjicUpQ6vGB53Tp8KEVZZHzyq1j/Corr1A9TPNWRo+jv2Q2L36O4Y4ap63l0KzDIZNhwB5wx54u6rB5PWU8ifbh2yEzDDJd+5nIBtt3uHm+8xaRHFPq1oEc/sBFBQuWM8rp8zukbzKFVyOFGHuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxwSLxln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAjpIz61; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxwSLxln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAjpIz61"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6646iZYb2092867
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 12:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7l+w1LkFRue1ZQFudjsniOqbsa/avBSZQtqmMh9NKg=; b=NxwSLxlnSUC+g1lR
	7NVdxQqrD2X5yEP9GceoXfoUjZh44a4vGxUoQ8nhE390jEYQSfUgen9jyHzUGs2O
	D5Bl7af9JbE0T9NtOGr0BWCOaaI/RPPDRqSAZ7ibwp8/GjX8JJKrJ5IUoBJ/STIc
	+byoJEJ2LJJmEaI7i3sGeBmcuG4zYZaRNqHV3Fsai3x4XZzu6f2irzrW+JvBADal
	b5PT7fNps+909/4cB/5uNGhJBY20GRg74igOXJGhxGlzsszkWnqmmQQK+isRhf31
	R2Lcit6DPc0dptb0CaKNoy4YmEUg73b2VE0vlpNyqpNIjBPTuI2dbAMqlqCfDgFB
	5JyiQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubggpv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 12:33:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f27f49bso113429085a.0
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 05:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783168392; x=1783773192; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n7l+w1LkFRue1ZQFudjsniOqbsa/avBSZQtqmMh9NKg=;
        b=dAjpIz61viQQyRrlNsw/I+ankT8iHVgb2aWrCNZrdecMj3v21cfowC2JhZY+QK3RZE
         n7DBEXQn6u42svyDOec9i1ZWfIlSamiCxUJP4pPCyYpwda/8jXEMLMkobuWvsdb8Vdru
         BQSSy6Lma4sATD+2HDjiSLAtYOy7MOq3asNiF5Fk/Wfc7bk4u/OFoL3CUI/8hVJpG7KR
         Jcjp0+Ukf5In4CPET7svUiPQo6atK9bs4YECmDxftExhyJGcR1CCXnLHVYQrIp84GxYn
         2DnvtgPqVbu011GJmufLMIxCHoPJ4J613wNTpXOArXWh4VFIlzblZRcR2azeXWshhnSP
         tVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783168392; x=1783773192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7l+w1LkFRue1ZQFudjsniOqbsa/avBSZQtqmMh9NKg=;
        b=oGJbglNBbhHZYxkb1wQ3m3CsmQ9i720D961MHERKoa4DSLXgHfXTbacsm54kiBGhCC
         5Psbk1t3JPRiibi8KNbKX6HyPRXCx1uS8EoodlYHFhEIpi8czk3Nzf+AN6MdokuMmc85
         ymYfY+qT2chzcsUEDFBIqtFUmtq7cln/+In4le8mSGaFtTrx+S6scGDSx0udW+RCngB7
         72hATj521sS515mQGHCAV57h3z0cJE+1fWjoIzgt/otGqs8Um9yOCU+s5ZMOkPbmjBu2
         aLaSnLPaS//4HPfEESjLfDzKDNiMZGftx8Qc/EsX1FMxnIGFkC2tKa1Nc9lq/JyuFnPB
         v0Nw==
X-Forwarded-Encrypted: i=1; AFNElJ8yVtI4726DZycuH4KRM/6T3p6CywXqPeR7sa0HuTygeb662W5OPqx5VBYJBV6qr0LQ1xUMZHPSH6tn@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ87F9EWZr1Rk/A628aT3gyM21Rs6OmtG+l12tJKMonBidWycw
	2jkRbDccHxbklqXUf+VQQIWnGNxHoCQ17mOFxiucPOGpfPYiP4R1cCf/60K9R35lVCjMp/89vGk
	x4Nct/vhbuy1xyXHcRpn/LiTyjOVM4DDIiqmlDSiy854W1R2TZm6/AJ+Pc4XfpU7a
X-Gm-Gg: AfdE7cn9KjUpBZ1MYjrdPpCgyDIrzrH/UgQDrAWvtQZjinnKmT9QsaWOm5+Ux6wUTji
	Wlpu+vXheRLl9EdjbL2dYXIhUnVtXwY+YVp56Po/N3t6N82gfZgDi7E8a5skBAhyN5mtbg4zjFH
	4HHerrudAlstYLjZiwO3cWxcg4OlQPi4CdW3N+/g6GTjjA2SOcsERS3Mw/8sOK3L0PZHGdli0aZ
	+Vga1dK7Rb+b6UFh8B3hQwUA2rBnvjSZZNn+QD+K/KVO97S1C4phYhruWSSaqmUgbHSqQm2seqo
	ebTJSUAuGg2dAK4c5HSdxnoccpNeaDGxb9eokzg2w08RNzN6WGcPrxt5ZKbj+ktJDvmx8GNMblz
	ewhKwkCR490u9p8C2iz7BzNYOnHgEblgxcyfyqM/HJcme0xwZ4JQwWieoqNMSJ740QvgylKtV3h
	r/xdjTstqfSJUS74qeA6snMKR6
X-Received: by 2002:a05:620a:4398:b0:915:9d08:94e1 with SMTP id af79cd13be357-92e9a43b335mr448897585a.46.1783168392438;
        Sat, 04 Jul 2026 05:33:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4398:b0:915:9d08:94e1 with SMTP id af79cd13be357-92e9a43b335mr448892785a.46.1783168391916;
        Sat, 04 Jul 2026 05:33:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4aba9ef2sm8519151fa.0.2026.07.04.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 05:33:10 -0700 (PDT)
Date: Sat, 4 Jul 2026 15:33:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH v4 6/9] arm64: dts: qcom: shikra: Add GPU cooling
Message-ID: <qqdaoc4tacx3dlh6bp43gu56w44cezkm345iconc7iqngircxm@hoywvq57otpm>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
 <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
 <opgj6twppqwhb77itqelmyzniaifcja3wdazyzeal5axstr25g@a7v634mnimbm>
 <ca8f3731-3f23-45f5-82ed-ba1a65514b95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca8f3731-3f23-45f5-82ed-ba1a65514b95@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDEyNiBTYWx0ZWRfX2U3H9iSUr1e/
 7jN0hwCuYd/7+va8nioWIpXDclucGL/e927s+uQywX4GFoIXxAalcF3satJ5UAzb8eezUru0Oo2
 J9snqb52ZbMgM6BMQSomQqZMczoGbWM=
X-Proofpoint-ORIG-GUID: ZdajHg9meNtLeZJ38zwoAyc7T0afsOuK
X-Proofpoint-GUID: ZdajHg9meNtLeZJ38zwoAyc7T0afsOuK
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a48fd89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=CvX1hmVerT4HThdZ_8QA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDEyNiBTYWx0ZWRfX7AYS/ouw/oSs
 x67BU0PqE9rDyZkQKQ1sgQVRYvAblPlArCirJu/oKOtoQvj0b1GlV4e9lXURGyWdSzsK2l+Ylun
 BdDSImXqlVDBUDBfURjvFCIHBkxT4qoXqJQQ84bgyIJvUQFZ7eIPM2fOY6OHntS7Y9kAY0vzqAL
 m2eElZMcLMsVxOtsrh1eyLnSWzWDOkbDi8kjqfVqIMEWkhKsFNsIjBwsewJ7BoRCQ1IlHpdjzHf
 7JmIY/0LAlIIm7y4fo5dImsfADTxkhmqYfxOUJ7CFtDgzeM3BqssgAV5O7razcHNnoZQLlKfCML
 ancm2U+9tD1XUSacXAF/F8TWrh6g4TeNWF/jVbKpqbbrmViOAJahCs2u17jgchqrsnY98ux6EYW
 sZcmsJyOEuXB7//LHmAJXLD358YSEFxPkOszJyRcnQRqihqosNnP4/jL0M5PIGT5ymmOGinsKs1
 BImeQrqlGgn6p+T3mfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040126

On Sat, Jul 04, 2026 at 01:56:30PM +0530, Aastha Pandey wrote:
> will update why part in commit message.

A. I should not
Q. Should I top-post on the mailing lists?

> 
> On 7/4/2026 4:41 AM, Dmitry Baryshkov wrote:
> > On Sat, Jul 04, 2026 at 02:04:32AM +0530, Akhil P Oommen wrote:
> > > From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> > > 
> > > Unlike the CPU, the GPU does not throttle its speed automatically when it
> > > reaches high temperatures.
> > > 
> > > Set up GPU cooling by throttling the GPU speed
> > > when reaching 115°C.
> > 
> > Nit: 72 chars. It looks really strange to see two paragraphs with
> > different line wrapping.
> > 
> > > 
> > > Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
> > >   1 file changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> > > index 34261221664b..eeeaa369d3a7 100644
> > > --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> > > @@ -2510,6 +2510,7 @@ cpuss0-critical {
> > >   		};
> > >   		gpuss-thermal {
> > > +			polling-delay-passive = <10>;
> > 
> > Why?
> > 
> > >   			thermal-sensors = <&tsens0 6>;
> > >   			trips {
> > 
> 
> -- 
> Thanks & Regards,
> Aastha Pandey
> 

-- 
With best wishes
Dmitry
