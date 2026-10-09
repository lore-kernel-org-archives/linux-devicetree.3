Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23CF4F4743
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 19:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574857; cv=pass; b=tRKzxDSUHYSrYl1bp9rmcHt1nyyzOP7r1+Q/BXcZKJjZqTXF9RxvM+qe9dbIc8oN4DxJMbjnDkPkWGbOoblMaCZ9xUpxfRvEyC6pNSv82ZsvjSgzpGfng+vhCPWHlXfCZpIim44QBtzsJ5/fzIvunOp9nAq4bt5iFSr0nI2WBSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574857; c=relaxed/simple;
	bh=xnV2S45TCVxut94HdI0PFmaZ3bMEdZbO8IBjI2zIMTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0P1ieHV9TGohCqj7fe0D6C1nnxBvHcCpaThxBLTgmqSgW97ANzVl8xceGqChu1OTZF9loV+RdwSGqNNG8WUe+7kvKfi5ml1BnBxhnuC1xdhhPqQQzR6aUGJUTjjro/7+7BUvirYLr48Gcc6m1R/xoplFWQVUmL+k8eU6jHmvgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9pq1pU0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEdJwd8g; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9pq1pU0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEdJwd8g"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZcd12460099
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 19:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DFP7XVJec+3y1JmKPzpRMD8H
	mUw+0cx6OJPzJlvczCg=; b=V9pq1pU0O9CIe3Vb5+oKrLMRfpHwn5Y1bwn9Ewmm
	eQ3WD4vh59BFIQ7wLKXRHBjpSJNCcSYuXqHzGuiKw7ZCNVH/G8y7+2KmBssEfvcQ
	NHh9eqTJXZpz47o5xfO9wmE90LfrDpRshcu6D2QwDcmQ5vQQpKRZcK8dOqy/5HmJ
	u1ERAmrRRSzquI0STobWH6leFa7g4tB0h0DP/oftRtfvAxbrZVyA9wYRJIqP/dlZ
	VVwd8aKYR6X+1VEY34dWK0bpD1F0BOgf+iVT/4nQjSWpQa9xnmU+KOaeXVMHivyU
	AMWDXgiGrgqK1hCUltuHT3oiVdSjDtK/qEW46psUHTKD4Q==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t88f1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 19:40:45 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b07030706fso27996047b3.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 12:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791574845; cv=none;
        d=google.com; s=arc-20260327;
        b=F/tjKPhk6JRatt6T+vFID1Z1FbB3CIFicmFjuC0lQUPxkIo4vwdnZGmfbgaBKMuoj3
         r1a/zHyUbNucwtCAJCy8CuLO3U6NoSfK8I78yKTsNb7TWYdI+6sRB9q0a8DCkP8MQDjz
         XUkosvXJTB52FoDCO1R33WPTYKXXWFxnSAOia+BKC0K9imrzVvaglzjsYQyhNeqe1NND
         nTu1TK01Ek7eI38S+uZnoUowwQ3Sqmizvly/8E73L38TG20SXuyD+Zwh+LHA0DrKY6vG
         79Mdtaf9Eh9q/dTFlqi0PmHA05yeztWVEGA7Emkf1d/+eRbmx3ecacmug+jpMp0IGVro
         dF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DFP7XVJec+3y1JmKPzpRMD8HmUw+0cx6OJPzJlvczCg=;
        fh=mxmb/KKs8H2ycHQu5loPMZKvXYiqqNVErL3G1a39IvU=;
        b=Y3cFVqwdSyh/dW1Swf2Nggp2xdznEJy+EjUMeMTdbv/gPwMg3BUUiT4SdY94jJ2PVT
         r+srDx9KsMEOTH/6QcFuW7DUBLYx32ZWR4cCO/TBlKWLZfiC3UIlJGNHcdEToWg0M7qT
         9xwoTZiZTwrh52//M8ZXAGsvjpIPEyD2duq+REpC4Hv2RJTvIGetSmIizLzF1ph3F5OL
         cA1sBCxhEBNQLxR/hrstIhvO8OX65292TaUQ80rS0JFqYp8uh2x8ptgoTGBsOd27NX9G
         qbB+4AcMlUVx98EyIut+Swfd3n8yvc0cLO7CEBZsXfeQbM7VKqh+CeV9IA5j4lU7ddXb
         MPhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791574845; x=1792179645; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFP7XVJec+3y1JmKPzpRMD8HmUw+0cx6OJPzJlvczCg=;
        b=JEdJwd8gMbp21BXbvjP7aJegjfA1e6XXFij8O+Bv+XKpo1qgFUh5MhtMUQzddEsPbX
         nFxWyTZ8XcB4G6W2WEeMeVregLjaRH39aJUGagzkydS9OvqMBreDLbB+bkBfxgWBYGgs
         /1Wr19wQYtP6/TW4NRx+txwM1QfHzKCluMfrrx36eCQjdUkPEFVwn+hr+uruQF706eea
         kqzV9z06Xt9DOgQZQMrO3RE2D+PeIOPHOec4+9PaOWg0uJHdAf31DKVdIEcs3lMsaPR7
         JG1gJI83LrkBnLTFUpOMzHLsO5GoSMeYw8Xa0/Vk2aT6k9S8IxwUdGCh3ZWdbUXPQKUJ
         YukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791574845; x=1792179645;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DFP7XVJec+3y1JmKPzpRMD8HmUw+0cx6OJPzJlvczCg=;
        b=o1weCf+80XPYqvqxQDYgPcciSeqeXHh1jEXNNO2mAzLw+/eE73w0xaaPLhVukFkhzo
         V76I2Axfk8gCHiTvmtpX9j1AsMj7iQxrL/AsYXkl8MT7HvoJaftnhYlCfeAYCbJGNdAF
         T4YdGR8xdTEnHfdCECH5JPQev+cwFg7xEgeZ979fUx0+lQtfPj6HiGnWd81VCGuH8Hak
         n+XaNoNAurn84nzYfYFud1+8eAFJRlp7CDw8HVWmvX9ZRI5VcwUHkiMXoYOHxFlv2bsJ
         U+HBrx9maE9SsmYfbWrt8eq0c+nE6d8IN/byGcLQACeWB55gfZvr4RlCPeKKBTMSQd4V
         b1DA==
X-Forwarded-Encrypted: i=1; AKwUvBxsN7EpIn9PVn0WlqikJ7VFWzlvpA9/QXnXJqx23Erc9/sSPMmcDcfb1TtsaRvKdAidI7Vr0EE50XyZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJz5iX4VX75EIw/Vbkk8kiCU8lYq9Y0z/IWOZOkEoDGGt4G8yfL
	wtb6pbJngfEg4FMHTvATDqJ5vWpXnnmd5IcAeFPuV+okGJDaOMg9xLKS/mOpr7RWYWFOXd6OGMt
	TNupBW4Dwr46dOSPKii7sYINMUMQyqOUUyTA3iVM9NFZo1G/PB2uF/P8gyrbPc6VSkEnRxZuZB0
	IAlgDAgE7QCFPVCAqYg5W7uKzyxONcRPQzqGoPDbY=
X-Gm-Gg: AYBFou3IJrrAbrOXrPS96k9+3qmWIGYKp7RepN+hOdBaelxaA/40ymJ088o90OOodW5
	T23wqIvM3CdF5yec34kRkdrsZh2h2QuK+qUMtcx4LPahkkJut19RoD8M89Oe9t4vQcNnDLhi2nE
	UGLI24p+8L3T9zl9oeR34uREZcrAvST+auhYDA7fmf7FOnSYMfULH2GlF1NVI=
X-Received: by 2002:a05:690c:18:b0:873:5c6b:a322 with SMTP id 00721157ae682-8b07edf22f8mr9886097b3.28.1791574844593;
        Fri, 09 Oct 2026 12:40:44 -0700 (PDT)
X-Received: by 2002:a05:690c:18:b0:873:5c6b:a322 with SMTP id
 00721157ae682-8b07edf22f8mr9886047b3.28.1791574844039; Fri, 09 Oct 2026
 12:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org> <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
 <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe> <00f80a9b-7d99-3479-c69c-a22abf89cd27@oss.qualcomm.com>
In-Reply-To: <00f80a9b-7d99-3479-c69c-a22abf89cd27@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 21:40:31 +0200
X-Gm-Features: AclHuK9Fb9bIOKy6LjpeM2Ha7EAtqoBusRfLt5HoC7IcSK1fx4l3vqUb3dKqoK0
Message-ID: <CAO9ioeX4gEA2OGokP0sDqHJZ-WpNyhpLqw_ziyrzHu3wn5Ps+Q@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3OCBTYWx0ZWRfXxK7/bgXsNdpL
 q0ylq+DqF7XMM2rB+LVy+8BObjIDVCaNEi2wpIoNSNWNxX55ZwbT5Y/SrRE2M5n0jjVPwfvhyAa
 7gJn7HP8WSzfEbZ3dtrfnnpOIvm3Joo=
X-Proofpoint-ORIG-GUID: Iz_NxYHLWI9Tn25QsOERR7kZlq5ID_9U
X-Authority-Analysis: v=2.4 cv=D9jSufRj c=1 sm=1 tr=0 ts=6ac9433d cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pdqsUJ9ZRbmRKYiob1EA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: Iz_NxYHLWI9Tn25QsOERR7kZlq5ID_9U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3OCBTYWx0ZWRfX46A4iJT+pb8p
 HhUmz0bFgmUwLoR17nMwhq9bPNu33WcfrRxag+l5OA0BfSFyXFvwNLrOp1K5G+9Rn+cGK0m0Yzu
 HeOMAE4tfVYQBd3QYx0o6XAXbdmygJ6v21s4RymSgY/PNqmWy/2AT7xIyoD52Zf7ekBHXrrWLDq
 1yUlxW3XExvqHwsksRwfn/iMeUCgCkDDU8AyqWtE6gZU9xEWEu8nBPdIpwSEtUwLtITR+DWnJIT
 aaQN3ZT9I9JsKTCD8kgPaYYHhji8DISYeCJhvcDBfmbGssRsEY7g+A1i5BczAZeM5QPzJLFkXi2
 gNfdMHWi+Ss35BfvnaaQa1rQPXJ7gwLkEzUi6tZ4g803HHqp/Dmp4iomNPMR8A/2Wch6olVGatj
 c57BToqj9nGa1tshlmxRMxNhFs3i7RCHEXtaZpubDNEdGoJsq1wTcHMZGj3ItECHJyCjdWiJrpd
 3nioXsA+28Uo4i7N6Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090078

On Fri, 9 Oct 2026 at 12:41, Vishnu Reddy
<busanna.reddy@oss.qualcomm.com> wrote:
>
>
> On 10/8/2026 3:30 PM, Dmitry Baryshkov wrote:
> > On Sat, Sep 26, 2026 at 01:23:06PM +0530, Vishnu Reddy wrote:
> >>
> >> On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
> >>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >>> - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
> >>> - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
> >>> - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
> >>> --
> >>>
> >>> commit 08a09989ffefcbf5d38171159dcc911ca993ff18
> >>> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>
> >>> iommu: of_iommu: Add support for "iommu-ranges" on a device node
> >>>
> >>> Add support for "iommu-ranges" on device nodes to specify usable IOVA
> >>> ranges directly when there is no backing "reg". Introduce logic to derive
> >>> reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
> >>> to be paired with a "reg" property.
> >>>
> >>> Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> >>>
> >>>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> >>>> index a18bb60f6f3df..9766a6944d0e1 100644
> >>>> --- a/drivers/iommu/of_iommu.c
> >>>> +++ b/drivers/iommu/of_iommu.c
> >>> [ ... ]
> >>>> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
> >>>> +{
> >>> [ ... ]
> >>>> +  maps = of_get_property(dev->of_node, "iommu-ranges", &size);
> >>>> +  if (!maps)
> >>>> +          return;
> >>>> +
> >>>> +  end = maps + size / sizeof(__be32);
> >>>> +
> >>>> +  while (maps < end) {
> >>>> +          phys_addr_t iova, iova_end;
> >>>> +          size_t length;
> >>>> +
> >>>> +          maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> >>> [Severity: Medium]
> >>> Could this result in an out-of-bounds read if the "iommu-ranges" property is
> >>> malformed?
> >>>
> >>> The loop condition checks `maps < end`, but of_translate_dma_region()
> >>> implicitly reads `na + ns` cells from the maps array.
> >>>
> >>> Does this loop need to ensure there are at least `na + ns` cells remaining
> >>> before calling the translation function to prevent reading past the buffer?
> >>>
> >> This function intention is not to validate the address and size cells here and
> >> it's not valid to read those properties here. If the out of bound ranges are
> >> there, then it's part of dtc checks that dt node contains invalid ranges.
> >>
> >>> [ ... ]
> >>>> +  list_for_each_entry_safe(pos, next_range, &ranges, node) {
> >>>> +          if (pos->start > next) {
> >>>> +                  region = iommu_alloc_resv_region(next, pos->start - next, prot,
> >>>> +                                                   IOMMU_RESV_RESERVED, GFP_KERNEL);
> >>> [Severity: High]
> >>> Can the length argument overflow on 32-bit systems?
> >>>
> >>> On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
> >>> differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
> >>> a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
> >>>
> >>> Will this truncation result in a reservation of at most 4GB, leaving the
> >>> IOVA address space above that unprotected?
> >>>
> >>> [ ... ]
> >>>> +  region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
> >>>> +                                   prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> >>> [Severity: High]
> >>> Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
> >>> to its lower 32 bits on 32-bit systems?
> >>>
> >>> If the remaining address space exceeds 4GB, this truncation could leave high
> >>> IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
> >>> IOVAs.
> >>>
> >> size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
> >> set the dma_limit max range in that case.
> > As this is generic code, could you please adapt the code to work
> > correctly on LPAE systems?
>
> This is no different than the existing logic where client tries to reserve
> greater than 32bit length on the 32bit LPAE platforms.
>
> I'm not convinced why sashiko claims this is introduced in this patch.

Because you are adding the line.

>
> >



-- 
With best wishes
Dmitry
