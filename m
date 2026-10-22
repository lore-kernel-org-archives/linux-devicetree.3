Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663634;
	b=s2iiujDhDxcgpNn9LvYO+5MrMBZ8t7khALtcF4stLX9abZlWaaWdwdvU1c3UsTayC7FN
	 VU6bNYBFqrOTr3d0P8g5gi/TpuZnB6yk/CBwPbU2T/HHmqp6+1nByO5CH2NPqGR1UjwFH
	 bjwgfmz1jgZg7D5A8dvx74HkhuxJwPFL1OwCZk4rdAevmvm81L329t4aXnMXMFZTUFeOc
	 PtzrLBcAMiDhcQLrke9YmOF6CKSTJ+05EyycEBLKeG6TeTN892DR1cHG/Xb46Saq8URqN
	 3QecV50+XhPuNNwmJipFU59dOB3PuL3w1Iq+UKiAR6HjUkvYYfAK/rUvm1z1x5UfYkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c9UWoPLA5mGfp/Rl3fZwFMEKWrk/1mJkMgqK5rleBeU=;
	b=RZNZs5DN0Kks7kAajrek0hne++PXMKKYEkhjBbBSf+vWzeDFt2V8bMFrB172/YnJh0r/
	 mPDeDKsJAtfs93zSm/66B39f3HWgRvxRswt3ivmAi5aUo4PwgakfXZfhElfbNA/VxGY17
	 JCfPYAtDPI4y4KkN7qiluWf8QYjSyYD2Gj/FG4VyX0g3A7Nm5qIXl+tuyKomUwagvnIZK
	 SsBWTEIXlcgSGljKBd243QOqOT2Dph2TcsZI/gNFmIqMtWPnLPVTtCa7Bt4mR+tFUn7If
	 GAugb9RpGsWPxkfpkFn5A+1+lqCmPwGECSIDZkoJfy6gHhxvNCJ19Fo3jgf8RtbsA4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fMaZbsYm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IicHWNzh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB750606A32E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB750606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fMaZbsYm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IicHWNzh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA5rwD3440426
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c9UWoPLA5mGfp/Rl3fZwFMEK
	Wrk/1mJkMgqK5rleBeU=; b=fMaZbsYmB+jAra5oiVRf5476/s3pZ5gkrQrPXvEK
	JsNs2PlDMWXkWsZswF6sVfWLuxv8Il3NgeFo9KcJT1+WfVxxAKsYwPW8atwvj2Vn
	6vA6tR+lX3ncEIMw+002QoZcGT8nTRbhT1o7o2WzmIetjf4TG39I4sFO3WjDK31Y
	5lsk35DpBIFwqPNWm2UsMjmtLNrWCdQLI4JPzN0yIV4/GmMY8CZirMtNCqPE/3QL
	2dNKfBNpaocBVxGC7L5eUCNxXjxQQoYergtMoF4KvBpz3eRrJOpOWeV5GDlWp3gr
	y45sSx/sAFFEx+7nxNpHrmM10cptyDyAUzFTDNRe7t5Sow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ast5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:07:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so270408785a.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792663631; x=1793268431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9UWoPLA5mGfp/Rl3fZwFMEKWrk/1mJkMgqK5rleBeU=;
        b=IicHWNzhOBI/7g1X1EIeT3TFtoo8fDOgyVmmLe6obsBH7r/fOlIDu5ZFlCgrFeNBA6
         a5j+GvJUmYnWyWkHes0C6xqH3on4AZiscXclCAjddxduXReF1knYG/aX62UJu2VWwIC0
         PiHd4LqwId2FJEgs9nDECwbmjsRjoruDpw/ivysH31SOVk+ZwsYJ5keD5JCLq9pzWSWO
         4FDbGC5CHmjvwTMsXyWuX3Fp4ROaMlRA83DfNyIkoHdNkDx0AuO0kM21xHAz1co0YF41
         n5pnoVl0Pcxr+7TE92bISg514TbpCWKOM7dV9iPTZN3fXyTWXzLPXsGJr1RWg+nJnjM8
         p9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663631; x=1793268431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9UWoPLA5mGfp/Rl3fZwFMEKWrk/1mJkMgqK5rleBeU=;
        b=1iRNmhFy5PFRPqQtIpv+A/cqZFlePgveqQw9GkDX2AVyP6TLdVRTZvLV+pTO5EAUBy
         c6iZ1Z4AqQzHJhhWITngsoc7ri/gfewFocTUhDRSMOPRry/SBGT92AR1OXZ5Aym12pfL
         bHY/0rCRFBx1evwKrW7uA7h/34brDRsXnYs3NqJDzPcPTTWjMgfuQWo7vT9g47PAKZtv
         Sq/IB+lfx5vHUkCDdifrZ8OseFkUOf/FHt6Y2X7MjmcN31dOxXlw7/qEHrNlNg+585Ih
         YjQrkYA08JsFSxdSEsyA3NwiiU+s76xY9gqHE5em/JC+xqElyk+9/ER4zgvUWy8F7gue
         0y1A==
X-Forwarded-Encrypted: i=1; AKwUvBwz1eX2gzMyq1XHiw8VKHrLgPzJYWENMyDsHW8y/sbF8ZZejWhHXhjGFGw2qDrv+08bb+8NXTvXyyVV@vger.kernel.org
X-Gm-Message-State: AFq9FYJHduSPSQtpeuWUiLXN/Ye4NhYk8JBW/UX4R0IIHaut9WSHwE1R
	A6LVkeBh9qo2ZiPypjx/v2fJWoC6Ypf58F8Qk6VydR13llzXSLLzKVboJWgzUiYiP8nuEeQKEJx
	BPS1yCGzGN3Iy6e68rARPFsT35VZij+Na9Pork/mPStS18cymF8BiutYTd/p9HRTHr7KOwLCv
X-Gm-Gg: AYBFou14ERFCP04roj/1U4tYpvvt5jBo0XADqGKD0TSqkPtHVz7KWsfxUOvfBQJ9eay
	iMA9dZwuVyZUVL5gPuPZ4/bDIKA7qA1NsLoSsBfeicytqBYE9tHBlYpKKs7HArjw1GRZh9GYlWG
	SfH0hRJBUgsrhtFdabuVkDpPWErFTXMf3LvuHq2fPkOjlwLlJeSK+aXh6y7gRC+WPPSSJhrgK0t
	4jayaQvDpghyCPVweOkgI+FK6KtWXRYN3gJGeG2SKU0HgGFKJEuSV5IvWp4gC5osTzBPwAFkqZE
	LQp6gJkuFEBZG63kesv8gCUg1XXfpCKpL2QdaZuduEydZaFyaBexy/PstKZQtrCMUOlOUwEPEvC
	ZnJ8zCaUQlmDjIRvkctLBrviBgkLF3ZYYOKuNTKJ/vzlhrmWl/unbGwwB96UoE6fLTV1o6uS+9E
	BEGiEnd8wHYTIU
X-Received: by 2002:a05:620a:3915:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93f57f3d815mr775208585a.56.1792663631237;
        Thu, 22 Oct 2026 03:07:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3915:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93f57f3d815mr775206085a.56.1792663630729;
        Thu, 22 Oct 2026 03:07:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa12042c3sm983666e87.37.2026.10.22.03.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:07:09 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:07:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
Message-ID: <hwzpthdqen2uvwnw6fnrutxjovf4lah4jr3vfjyrojwfhkfv4l@f6hlhnu7a72f>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org>
 <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
 <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe>
 <00f80a9b-7d99-3479-c69c-a22abf89cd27@oss.qualcomm.com>
 <CAO9ioeX4gEA2OGokP0sDqHJZ-WpNyhpLqw_ziyrzHu3wn5Ps+Q@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeX4gEA2OGokP0sDqHJZ-WpNyhpLqw_ziyrzHu3wn5Ps+Q@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX1aD0ESKQjMlp
 FPV7GuHVJoZG1xFjf3VE5eI+iJgemgPKhub7ioifFLRiQi2Rr7VGfKj9yVxuLlcQG1LH5/CB6ML
 ePYdIDtzBmTcP3OSPFD8UJELFxPzUZLHOkyYxbdlFwvWL+YQyq9c+A5ZUWQfhG0CECUJkOogKgz
 mE/j59FJoACqMmPMo6y9DD8qNEz2S7TCpeHwb8NxZZdryfWZ70VfxOMJhxuT/gfo3ybc9A/ZW5C
 PntE5mAilPBK9ktjj/KeI5i6wMQtig1vH1k+pwyiYMGfFXanB1jKzY0hKM25fUfPw+FDX0AIt0P
 Xh0EdkudG3BTqlbZy9m/xfyv3x9nBUZU50bbb6rwMOFfm/wxmn22xO5OsiySCawNKctGueSdYyG
 F3rKRDe/hnPrl2m4HGk9f842k6EAmWC9BnHCrk/ZutnKgPJAFj+Bg9QDtPJpSSlRGMrusi1XbFz
 +OL7KdWptHZp1yg2XbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX/M3prBCrYKh0
 ZgvYQGFHlg9QuyGXGALP137fDsZBg4FiQWsfiwJRI4pvdf1uwateUsS+bdJ/269RZdPuYElEdVI
 rG00XIUUMVy1tFIVMGwLQq+APBySksY=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9e04f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pdqsUJ9ZRbmRKYiob1EA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JF-ezp7vXk2-iXRdZnMDQCsq2XLVI9du
X-Proofpoint-ORIG-GUID: JF-ezp7vXk2-iXRdZnMDQCsq2XLVI9du
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220040

On Fri, Oct 09, 2026 at 09:40:31PM +0200, Dmitry Baryshkov wrote:
> On Fri, 9 Oct 2026 at 12:41, Vishnu Reddy
> <busanna.reddy@oss.qualcomm.com> wrote:
> >
> >
> > On 10/8/2026 3:30 PM, Dmitry Baryshkov wrote:
> > > On Sat, Sep 26, 2026 at 01:23:06PM +0530, Vishnu Reddy wrote:
> > >>
> > >> On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
> > >>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > >>> - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
> > >>> - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
> > >>> - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
> > >>> --
> > >>>
> > >>> commit 08a09989ffefcbf5d38171159dcc911ca993ff18
> > >>> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > >>>
> > >>> iommu: of_iommu: Add support for "iommu-ranges" on a device node
> > >>>
> > >>> Add support for "iommu-ranges" on device nodes to specify usable IOVA
> > >>> ranges directly when there is no backing "reg". Introduce logic to derive
> > >>> reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
> > >>> to be paired with a "reg" property.
> > >>>
> > >>> Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> > >>>
> > >>>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > >>>> index a18bb60f6f3df..9766a6944d0e1 100644
> > >>>> --- a/drivers/iommu/of_iommu.c
> > >>>> +++ b/drivers/iommu/of_iommu.c
> > >>> [ ... ]
> > >>>> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
> > >>>> +{
> > >>> [ ... ]
> > >>>> +  maps = of_get_property(dev->of_node, "iommu-ranges", &size);
> > >>>> +  if (!maps)
> > >>>> +          return;
> > >>>> +
> > >>>> +  end = maps + size / sizeof(__be32);
> > >>>> +
> > >>>> +  while (maps < end) {
> > >>>> +          phys_addr_t iova, iova_end;
> > >>>> +          size_t length;
> > >>>> +
> > >>>> +          maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> > >>> [Severity: Medium]
> > >>> Could this result in an out-of-bounds read if the "iommu-ranges" property is
> > >>> malformed?
> > >>>
> > >>> The loop condition checks `maps < end`, but of_translate_dma_region()
> > >>> implicitly reads `na + ns` cells from the maps array.
> > >>>
> > >>> Does this loop need to ensure there are at least `na + ns` cells remaining
> > >>> before calling the translation function to prevent reading past the buffer?
> > >>>
> > >> This function intention is not to validate the address and size cells here and
> > >> it's not valid to read those properties here. If the out of bound ranges are
> > >> there, then it's part of dtc checks that dt node contains invalid ranges.
> > >>
> > >>> [ ... ]
> > >>>> +  list_for_each_entry_safe(pos, next_range, &ranges, node) {
> > >>>> +          if (pos->start > next) {
> > >>>> +                  region = iommu_alloc_resv_region(next, pos->start - next, prot,
> > >>>> +                                                   IOMMU_RESV_RESERVED, GFP_KERNEL);
> > >>> [Severity: High]
> > >>> Can the length argument overflow on 32-bit systems?
> > >>>
> > >>> On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
> > >>> differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
> > >>> a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
> > >>>
> > >>> Will this truncation result in a reservation of at most 4GB, leaving the
> > >>> IOVA address space above that unprotected?
> > >>>
> > >>> [ ... ]
> > >>>> +  region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
> > >>>> +                                   prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> > >>> [Severity: High]
> > >>> Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
> > >>> to its lower 32 bits on 32-bit systems?
> > >>>
> > >>> If the remaining address space exceeds 4GB, this truncation could leave high
> > >>> IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
> > >>> IOVAs.
> > >>>
> > >> size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
> > >> set the dma_limit max range in that case.
> > > As this is generic code, could you please adapt the code to work
> > > correctly on LPAE systems?
> >
> > This is no different than the existing logic where client tries to reserve
> > greater than 32bit length on the 32bit LPAE platforms.
> >
> > I'm not convinced why sashiko claims this is introduced in this patch.
> 
> Because you are adding the line.

So, is there anything to be addressed? If there is an issue in the
current code, please fix it too instead of just pointing to it.

-- 
With best wishes
Dmitry
