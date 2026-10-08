Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA16447F2C8
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453658; cv=none; b=O4XDr76GL/F8BwzTPboXP+aFzmyn219X5pLb+SEjJScCqiFH0QEE34h+tK3sw7xFVqIQ0pvCwcoKwY/itll4yRrzJL/luxjKx8ipU7v+GIZynuLKVPPjU+KwY4hUmM0defBnX79QE3otxzObN7fwwG/hiXx4Md4ApuyABgb/Gqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453658; c=relaxed/simple;
	bh=68v7JkuVF9EasqnjwcfgrZ7rtPEnLgqS8iLLehKvExU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHYVT6IG7yHuGd/sfW99Cucjn2SYtc1Sx5N3lMRX2wiLMPh+g8PLx2BgeBxbwBCH/nBS8NUPd3N2suX6ZxwbfS0MQcDlj+rAidAR2Ro8/KQSpXYbS4SgL7KMNs6iTlexeCL1OR159jZgMpdLSrvKvcEsvjvU6lcY5uPXxk2Hmnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgQ04RsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GRJLu6AV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgQ04RsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GRJLu6AV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KSCd2167355
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 10:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iMkztyo7nvb/xoDfxhgtl43w
	j3/XBVuU45aiCGLTELk=; b=XgQ04RsBxA6HDOyZJydlLbNraDprtaJE4e6Ofonz
	JMswzGb/wNu5bnVCaZpCrWEIelhsFwJ7dVIlZ+3YcM4DAiJG8C5KIB5Qv14MpcAd
	3QNSUi+D8tqWT+ljFq5G3KoDuCsUALJpke2EDCC/oJw/72FP8Wb++NUHBoFR6hTs
	iXDCXQZmhFiFWK/4hLAly8HYLCZwHc/3p0+exu1nDgp5xVwu0/eQfVVq/JlshVRc
	YzCJxybydn1flXktXI5Sknl+7KhBCNiDN7lnC9jXvWjRs6mif/05ECkY7yEMDuuW
	mzxol2iWvwZr/y2EIZ8nsRO7lX8kCFP0HDCy2c9xHl979w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2teuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 10:00:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso1005819585a.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791453654; x=1792058454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMkztyo7nvb/xoDfxhgtl43wj3/XBVuU45aiCGLTELk=;
        b=GRJLu6AVmri2v8oNTxPTzeMg7UC4VEdE7VleOmVTQb6zDZvv5JPg9Jy96OARFW5PNj
         d+Ac6JqjMsj2XVY0qZqQsTkOANAAaLcKiL6tLTI7syZ/bnSjjn3kZWHcbe+OiAi2ydPH
         0lRYBlGgoVfDRU4r0xlnEqGD/rIqkGrjekiB5Z71W/O90ucCsRPxiCobsBQWC/GlC133
         dFEG34y/S8euUX7YLYwtMqOI3f7jaoZUeU3zD0700REc3vqW0FJlmg0c1J9Tyj7/Vxo/
         tHzn5T6WFnp2AzNBokJnlzrXBhxEeM6HE2zAt2VCKnWMqxf1YtpTyvh3pJNPmOvtqZZ2
         Ue7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453654; x=1792058454;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMkztyo7nvb/xoDfxhgtl43wj3/XBVuU45aiCGLTELk=;
        b=mRy6prEqGWV9/TSx0gc3o95smALk6HdCxmbAtrtT0HqkRw04fbSL7JuJyFhEff5MmG
         O2OuD7owTCXmfE5Ne8dYqOtQpYtGEmNwK7l6JMFuFgFXpAAjzHMQDo1eh2TdZ2q0ymxW
         3Zlb2w/NF1vd+13+252RbwchTJX95ZPP5/MJyoUsmiuxqfO8xIhkq7xdHo3hVHAjdDG7
         coBBZNaI9HF1l08l7f2Aj1pnmbBj68wzABx1oMAdHPOahyxRvMky4SX/Q9dz9VgVxFIQ
         NvK9bY0XjrgydhTOi1mFM31IMLsFr4AhC42x42Z8ZbGFFqJ3M8V6CtMHmDTvYU0LCWr5
         kmow==
X-Forwarded-Encrypted: i=1; AKwUvBwAbbb9bUvTPw84BYu5bV2+3V8vd4hTmYGYLUxEiNl7CDvEfZKzjppOlkXJG6tKreL5RnmsYuKU5H5b@vger.kernel.org
X-Gm-Message-State: AFuF++nr9x2GtLAaQOaRHLP0v1KeKt6VBFwWqZM3W5ShBrF3WjS0kDhJ
	PVVnzg2VpdhyBZ4adntOglfQ2YTNQBkpSaTPTNI7bnx6sZUJsfCp0zKJ8qNgsFsPC2Sk4Okrmhb
	pbMWEvy+MNqL+Nszcq0u3GDHNkLvCWGfa1OHsOddUJX5MvGsst3JGQ73puP2xMNkc
X-Gm-Gg: AYBFou3C3aOTeIbfiCvkOr9T6QNQUEIhyrxbmdgKhL12Q6EitV6TaG7VvbCuAU9jp2B
	FZR4Yx7r8j27xtcI3LzTNiyv35WnWMn57mECRNbHsSEoT+b59SEBRTrDIHMRNdoyfN0DOQRj/g3
	DCq6X/TDI2gU58fkKsonDAoPtGGI4nFZh6fMgWUzoFS0sSk1DeiTcr18i9xWJCPpF6oQEudZLCk
	h5/nh4zcnt62PDprcupe2h13HYiVr60nYicQEGyoQGZz93vyQz2OVyn2bbxE2LqleNXsV6C6jaZ
	fkXfPrnJBCn66bFWQmBN06pEWyxQLlzHuCj7SyiEzJpTxkO9zjmt5KO/MYJt3lJJ83WwjbSONUK
	NxVgid+eOAuFi/DzOE1ZmWgv0bQf5Q1XLTjgirVyHs/6RFu4YXTiIzpCIuugOutgKLFKg5FBWXR
	ZLF+AF1b77kfJg
X-Received: by 2002:a05:620a:8388:b0:93e:9809:8386 with SMTP id af79cd13be357-93e9b882f72mr862033185a.70.1791453653562;
        Thu, 08 Oct 2026 03:00:53 -0700 (PDT)
X-Received: by 2002:a05:620a:8388:b0:93e:9809:8386 with SMTP id af79cd13be357-93e9b882f72mr862027885a.70.1791453652950;
        Thu, 08 Oct 2026 03:00:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ba79b6fbsm1820271fa.4.2026.10.08.03.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:00:51 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:00:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
Message-ID: <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org>
 <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac769d6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aw6cs1SlrqONCjNU-SIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Hfyx9f_DCZ_xUw4o3Y8tuYiBMNlRcLqT
X-Proofpoint-ORIG-GUID: Hfyx9f_DCZ_xUw4o3Y8tuYiBMNlRcLqT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX3hFe+T+6XfQb
 Y/zuCV4DSEtOR8s//lKQZttu+qrJDMnNM6JsnQD2kcK4gediH+2s54zusHlZi9mnNLi7vtZOMwU
 unpuoyo9rMCkZCk+jmgogN+cwNRv02A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX7FE+KNNmFo2p
 67kg7uftYmXT9E2qt/XpnGysr1ncXllaXITFEkovl3l4MsVvbEQOrBIB6oEPIFp/mQZDNCvHmQi
 I1R00gG6BIpAuTPtWbLq1oMom7kvzROAxb7MZRdrm0EXj8QNZjLtlLZzLFgHyV/gnAP7cyjvN52
 LFG/dbUROFYiPiFCaAGHBYd0fJtXJdU+DC2uyESY7HOQuTojPVOWa9raL9bhw83Xaizz5Eb1SO3
 yo+QL3AnTovX9CDg4s5Tb2OXENagofeHVpQznWX/3WR9Sq0MJcJAo1eNnYoFSbbAdErUrgC6eRN
 5WI9v6wVMidr4BFJA7ggOJUYxCN9dCN2IBRIipHkHJGdx+qRBronyhc6E1F08F2tRgpnvGpOQjb
 +6tj30VKDkCDFhbH77qjNwhI31zdPVsPiU9Srue5qtNVCZ+902Dfo5QQgkMUGalwfsg7HFPS4dt
 R8R+5VJ2cFPo+58YWig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080039

On Sat, Sep 26, 2026 at 01:23:06PM +0530, Vishnu Reddy wrote:
> 
> 
> On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
> > - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
> > - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
> > --
> > 
> > commit 08a09989ffefcbf5d38171159dcc911ca993ff18
> > Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > 
> > iommu: of_iommu: Add support for "iommu-ranges" on a device node
> > 
> > Add support for "iommu-ranges" on device nodes to specify usable IOVA
> > ranges directly when there is no backing "reg". Introduce logic to derive
> > reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
> > to be paired with a "reg" property.
> > 
> > Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> > 
> >> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> >> index a18bb60f6f3df..9766a6944d0e1 100644
> >> --- a/drivers/iommu/of_iommu.c
> >> +++ b/drivers/iommu/of_iommu.c
> > [ ... ]
> >> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
> >> +{
> > [ ... ]
> >> +	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
> >> +	if (!maps)
> >> +		return;
> >> +
> >> +	end = maps + size / sizeof(__be32);
> >> +
> >> +	while (maps < end) {
> >> +		phys_addr_t iova, iova_end;
> >> +		size_t length;
> >> +
> >> +		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> > 
> > [Severity: Medium]
> > Could this result in an out-of-bounds read if the "iommu-ranges" property is
> > malformed?
> > 
> > The loop condition checks `maps < end`, but of_translate_dma_region()
> > implicitly reads `na + ns` cells from the maps array.
> > 
> > Does this loop need to ensure there are at least `na + ns` cells remaining
> > before calling the translation function to prevent reading past the buffer?
> > 
> 
> This function intention is not to validate the address and size cells here and
> it's not valid to read those properties here. If the out of bound ranges are
> there, then it's part of dtc checks that dt node contains invalid ranges.
> 
> > [ ... ]
> >> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> >> +		if (pos->start > next) {
> >> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,
> >> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);
> > 
> > [Severity: High]
> > Can the length argument overflow on 32-bit systems?
> > 
> > On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
> > differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
> > a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
> > 
> > Will this truncation result in a reservation of at most 4GB, leaving the
> > IOVA address space above that unprotected?
> > 
> > [ ... ]
> >> +	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
> >> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> > 
> > [Severity: High]
> > Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
> > to its lower 32 bits on 32-bit systems?
> > 
> > If the remaining address space exceeds 4GB, this truncation could leave high
> > IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
> > IOVAs.
> > 
> 
> size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
> set the dma_limit max range in that case.

As this is generic code, could you please adapt the code to work
correctly on LPAE systems?


-- 
With best wishes
Dmitry
