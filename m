Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352F94E8E10
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574806; cv=pass; b=JCCSFi/z/ulJNMHSimRnAE8C2FJGbu80ItIW8TZi5KAZYV14xTLFMe7kwI5GCGj0AQYH+QqvETA5qo97Sqy6r835TdMUnOPSnrlnDyWYpF4B/dvpsqD88MtaUooLw9pMDqLmXTGiTFsTbj9l2tAm71AosJxH1dBE51VXiFnPlXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574806; c=relaxed/simple;
	bh=2O6pst0/1FQDlhMhItqNEDGgoaAgA9DjcHfY4XCG4VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7hUgHC8oNvqFCYIKsmYFodu7QkKUnBuHoYgTkBc8gtuJqYVg1tJrRfkMVQw3+300sJYhpEGANRWymnbvodvojy+XdvwW9yostuBUJ9DCgfipHAFFGERGaEH3F8+s2VzT/abzjSrIZDmVZWCj/S8CfiGO2vTLIFCBsf0I+ao8nA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nA8667dH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTNVus/Y; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nA8667dH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTNVus/Y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZhGZ2470941
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 19:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QQ2r3xkMRh8ycVpIBxe6QayV
	BoNOyUv0pU4RTDpoWM0=; b=nA8667dHpj+fwjOM/OHZoKksqU6iH8w7BFFagmCA
	7sWvkrw99JLmWf27DmoYxHYhHI/8CvULv/JyarDhJalQGKVAdSxJJgFMxOEg6GzT
	Z4Ij3Lnz06sEz6+z/adygbrE1jhPFlQhHZBtjW+h3Zf3nTxi/nu02e65tMMb/JTL
	kpj0EgujEpNpS3SQQykihirDCLQm/1t8d9s8h7YlfvJEWqmLVVXlJId9NAj62UPi
	i4DZM4UBiaJQxSxFcd14odLlkJbOX4PozEoYPq/CseWoyw8hQaUTpKuHBCbYF68D
	RcTZj7B7aTIOBK70plkj4hoh2Qns1C/9VC+hE3qFUoB5nA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8gfkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 19:39:53 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8461ade272bso193967b3.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 12:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791574792; cv=none;
        d=google.com; s=arc-20260327;
        b=BUyvd3LO8o00GIqj0w1gVBpIaTZ5ptj3ejogPzvI2cZJzPkNrRmMHzZQJFf53/4PYd
         e0nsT3kgLI8ndvAbebHMasJDVv4Jv8opqgeP256bNIVJDb0kjI3KADJdLcUScs0tr80I
         ClVF66S2RERMgHbnrS5jXPA0hCufFQkPntFdZPJxpPbbJ0QCxWWUnxDQscN6FsEWlswI
         D2Rg+wLJbDg7cTjjw+GgM+CUCM/MlYbUw//jR05D+TPDbkAqzyxzxEEpUKGNX1DUSvB+
         gNiLg9/XAhr9FrT8rWrqUpXi62Q1GCtt09mHUx1pDXWuYq0FpGGsinGb9UpmdPqomegt
         J2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QQ2r3xkMRh8ycVpIBxe6QayVBoNOyUv0pU4RTDpoWM0=;
        fh=TIn1EQ0X7Y5wyw8EdddDCZIFv4lR8V6X1Z2z1Idqiy8=;
        b=AT9CkElXY/Piax775QOna8gh+OzmcpuUvfwLVW9Brk+NjU84o5ZDATf0GnxpfUs/Sp
         fkI9ID5AjIeNYkmsr6dZKKiMHq5/CBbDiZxjlbg9boOJXjnisuH96i0yazC6Xmiut1NR
         bM7fPopnQ1xhGceML2n7gPkTY/5XFdlCvLAISJM8XR+NPBJwn7AJMTqguE5E/QI/eV/W
         r18VgKBi3f7Dtlz3pSeagdTF3r/wJ1YxdvF0OPNxZaitRhs0mbl/w+FqEYZIUAoujogV
         biZS7j8jSGpybV5PxWSVADTPb7+xXumUNRTq9BLAiiBBCBpxrKoiCl4SvLufFZzc88CS
         r56A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791574792; x=1792179592; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQ2r3xkMRh8ycVpIBxe6QayVBoNOyUv0pU4RTDpoWM0=;
        b=BTNVus/YZcuybeJVe5gG5m1bzLGfDlHoyL7xSm9WPRL2xvgyqrOwJyWUjcP/wXZEH2
         Zq4wKDDRihirmX9QDJvi0bc7jG0l3y9QOLxg8LzdbF+tMML7kHdJISJiixBNrWl8gYDf
         oqRqMa2RmDjKx+MlIgied0LueamO3ZyFuHCi3fFRL81XagC28srYTBBBEWxojPnIdolb
         a7pIhf6+RxVSsTdpvB8EDGwyS3alQPQ5FrjoUrEHn18BBunjQRX3CP+0MhIk0bStSUe1
         ySv7LsXPBM2LveIZAGjlM93uyZsrK2BRtKuTHEg6sOYrVzJSfgV2k5TcPZwnh7Zjelb0
         U+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791574792; x=1792179592;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQ2r3xkMRh8ycVpIBxe6QayVBoNOyUv0pU4RTDpoWM0=;
        b=viBneSy4cQDUhluu8g1gqPGjtF/EJ2v8hbclTb6Neejoo+zw0fw2TGFUwQmBFoxCzP
         EJW5eQw/4i35kzvJaZ1isi6EODvyLQxhHrAjaKXsDxj6bWv1pDnuLKx5QcxSb/nEHMdT
         Slkq5MwInBX4vd2mSm0mcKLXgQI2shw2/ivV/gr37ASAY1cHvs8lWyeYda9HoBjvqeMv
         tfNnXKe+rgOcLpZ9sIFUIAfn9+eR2fIGsgtCrOotWWi7VtD+L4nm2EdYLIkSxMdeZ/RC
         nv1dmPQuuE2Z5HjPVL4IKl7ieYDOxf0OW2vIDMTAJ0sdfA9xNA+eYfki8USy4CZJXtr6
         W9Ug==
X-Forwarded-Encrypted: i=1; AKwUvBxmFVdTituBqEBNlOtfI66fIXWN9v/No5Np1P5ADDfQJib/ATjs/QPzcqZEUvMrbbec8cNYZe1l6Z9q@vger.kernel.org
X-Gm-Message-State: AFq9FYIVCrUjl0jTo9oc3hVz7zXR/N642eBmW3kyop/hmt2b3Ws8NKqb
	vfHtdBkI3gd5jQpBTS6DyL2YHfD6cE8CE57w8h9S1Alk3FuFvbOpqs8IIDq/1JMuoHRiu8LGoPp
	Uxdd0FP6PTEapoPUwwJRG7WywpNAMzScnNZRFlljnZRB7f0MYtD8aO4rvc20892h7xHFxuP+vyb
	fTrJMviYS5FCosqn/Uq8ZYxtWnITzFcNb/t9jdVjI=
X-Gm-Gg: AYBFou1QwSQ0oTo39y12Xz7TgZqI/aRorFL3jLajRsmZXdyh9YH+Sc4uIuBhddPvHBc
	yEk72/d+pbBge1UaRooplD1XbUr2UMnp+vQ8CbPgSSkLib3aFl6ynljqEDXn58JIh3IOZP9jeKa
	zYbj5uiLNAuczPha3hyvfvpu2iUHgNH9ErfsAtkKuxwA5D2uGtsV/hze/GL2o=
X-Received: by 2002:a05:690c:660c:b0:8ac:d426:1059 with SMTP id 00721157ae682-8b07edb067amr9225817b3.21.1791574792221;
        Fri, 09 Oct 2026 12:39:52 -0700 (PDT)
X-Received: by 2002:a05:690c:660c:b0:8ac:d426:1059 with SMTP id
 00721157ae682-8b07edb067amr9225697b3.21.1791574791690; Fri, 09 Oct 2026
 12:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-6-0322ca5dc10c@oss.qualcomm.com>
 <20260926064921.976721F000FF@smtp.kernel.org> <4befec0d-2e6e-ede6-64d7-58e1123eb1b5@oss.qualcomm.com>
 <txowl3kctv2oca5gqqtiuabh3bffqbb5ntbsfeele5bclzaxrx@4pfvzkccpybj> <9b15a39a-eca2-d26e-e060-d32879179b00@oss.qualcomm.com>
In-Reply-To: <9b15a39a-eca2-d26e-e060-d32879179b00@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 21:39:38 +0200
X-Gm-Features: AclHuK-GUeZs1U9UByJL7NYJ-Y5C0OriC66HSIDLljUMuSVQrANqtjtFKF7Fn2Y
Message-ID: <CAO9ioeUvV+3sME9P1bJTpDOSty=uojOKak659XCf337++vPVNg@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] media: iris: Route buffers to the matching
 context bank device
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=ONOyTiaB c=1 sm=1 tr=0 ts=6ac94309 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=aq-MA5FNgFGuVIMhGHYA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: r5KiVlxC-VeINjWzv2SuIb_LBba08fP0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3OCBTYWx0ZWRfX/nucGxsh+/Ju
 yE1uSxBWDQ6SPQoDY6p/hXa9kgyO1BjfII8yDT6kWq3J0uy1J4baVPepxx3Gp81zkLcGqAaA66F
 Tfd8VJpr59CXXUtvO80F+HLwFwG7Fgc=
X-Proofpoint-ORIG-GUID: r5KiVlxC-VeINjWzv2SuIb_LBba08fP0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3OCBTYWx0ZWRfX19jqhpEPNCDQ
 1HmFyqe16hy+5ALP7H4L2uaQEb7EZt8xEFYEu0RgzX6E7/Ff9lGsD9YKUyuC1tyUuCL/rp8FUj9
 ax1o6UJVK2J3APsgYubPJ980w8UgJxkYp0LDVDHFnDQT5ueMNs/CCmDFFG3RU+Rc4eHNlmQ0AbG
 LMaeHkLpo1+iMrI/z29NVzVd29OWs2+0nycmqjzSlEba4fwe0+ZXA40bhrOEBUSMe2TqBcY22gN
 r1bEBJvU2HfdzxvaA5tjS1hvZ6SmJ9YsQBW4oQv3rZ6zDr2F9F/9DfByMy8S+vBl65cCbvXJImy
 tD3HQUyvRTyAV87mc0t3BQs5jY2kXFNxmZDxH8QNpIcSanC4HULEkiNp76NmpV5t5CEEkFWAAfQ
 U9GEVxYg8dheTNGfW2WVhWWKyP4OsmyQa5mMJ+eko8kIEVWOLoMnwixxZ4xjum0REtaUaKbu/6D
 3LvGZ0z2XX9RPWemyaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090078

On Fri, 9 Oct 2026 at 13:14, Vishnu Reddy
<busanna.reddy@oss.qualcomm.com> wrote:
>
>
> On 10/8/2026 3:48 PM, Dmitry Baryshkov wrote:
> > On Sat, Sep 26, 2026 at 02:01:21PM +0530, Vishnu Reddy wrote:
> >>
> >> On 9/26/2026 12:19 PM, sashiko-bot@kernel.org wrote:
> >>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> >>> - [High] media: use-after-free of context bank devices during deferred V4L2 cleanup
> >>> --
> >>>
> >>> commit 720de65140e46882c5d0651161ef771fcb1189a2
> >>> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>
> >>> media: iris: Route buffers to the matching context bank device
> >>>
> >>> The VPU issues DMA through several SMMU streams, and the hardware does
> >>> not give every stream the same addressable range. The non-pixel stream
> >>> cannot address the low 600MB of IOVA space, while the pixel stream can
> >>> address the full range.
> >>> Add iris_get_cb_dev(), which maps a buffer type to the owning context
> >>> bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
> >>> NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
> >>> buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
> >>> BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
> >>> inst->domain: for a decoder the input is non-pixel and the output pixel,
> >>> and the other way round for an encoder.
> >>> Fall back to core->dev whenever the relevant context bank device is
> >>> absent, so platforms still describing "iommus" on the parent iris node
> >>> behave exactly as before to maintain backward compatibility.
> >>>
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> >>>> index eb8de60c1177f..6e03d13ac1a79 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> >>>> @@ -531,7 +531,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
> >>>>                                   enum iris_buffer_type buffer_type, u32 index)
> >>>>  {
> >>>>    struct iris_buffers *buffers = &inst->buffers[buffer_type];
> >>>> -  struct iris_core *core = inst->core;
> >>>> +  struct device *dev = iris_get_cb_dev(inst, buffer_type);
> >>> [Severity: High]
> >>> Does this acquire the context bank device for DMA mapping without taking a
> >>> reference to guarantee its lifetime matches the buffer?
> >>>
> >>> If iris_remove() explicitly calls platform_device_unregister() on these
> >>> devices upon sysfs driver unbind, and no standard buffers are active, their
> >>> refcount can drop to 0 and they will be freed.
> >> This is not true. Remove callback cannot complete if driver module->refcnt,
> >> refcounted during open, and not decremented with corresponding close call.
> >> iris_close() would call iris_destroy_internal_buffers() to free up the buffers
> >> before un-registering the device.
> > I don't follow this comment. There is nothing about module removal.
> > Sashiko here (and in several other comments) tells about using the
> > `unbind` file in sysfs to unbind the driver from the device. The module
> > is still present in the memory, the module refcount is not decremented.
>
> Thanks for clarifying the comment. Detaching the driver from device at runtime
> might leave the interaction with hardware unclosed.
> Would prefer adding something like this
>     .suppress_bind_attrs = true;

Please don't. It would be a sing of a badly written driver.

>
> Again, this is not just applicable to sub-node devices, but to parent device
> too. Sashiko should classify this as a pre-existing issue.

Yes, Sashiko is writing about the parent. It can't be a preexisting
issue, because there were no extra context bank mappings beforehand.

>
> >>>>    struct iris_buffer *buffer;
> >>>>
> >>>>    if (!buffers->size)
> >>> [ ... ]
> >>>
> >>>> @@ -650,10 +650,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
> >>>>
> >>>>  void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
> >>>>  {
> >>>> -  struct iris_core *core = inst->core;
> >>>> +  struct device *dev = iris_get_cb_dev(inst, buffer->type);
> >>>>
> >>>>    list_del(&buffer->list);
> >>>> -  dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
> >>>> +  dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
> >>> [Severity: High]
> >>> Can this result in a use-after-free of the context bank device during
> >>> deferred V4L2 cleanup?
> >>>
> >>> If standard buffers are active, videobuf2 holds a reference. However, during
> >>> deferred cleanup in iris_close(), v4l2_m2m_ctx_release() frees standard
> >>> buffers before iris_destroy_all_internal_buffers() runs. This drops the
> >>> final refcount, freeing the devices.
> >> iris_destroy_all_internal_buffers() frees the internal buffers which is managed
> >> within the driver outside the scope of v4l2_m2m_ctx_release().
> >>
> >>> Will this fetch and dereference the freed device pointer, passing it to
> >>> dma_free_attrs()? Additionally, does the devm-allocated core also get freed
> >>> on unbind, making inst->core a dangling pointer here?
> >> Unbind will not happen until iris_close() completes(explained above), which
> >> avoids this scenario.
> >>



-- 
With best wishes
Dmitry
