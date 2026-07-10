Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB7C3C4154
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698810; cv=none; b=A8UpDVAsLoAPl5NcHwZag59lnzvMNwryHzZeEjhMVJo1UHBmpwglPMOqfG+AeVYhUL8V8eRRXQE+Fee00SmDrdmCKfv+7NSgYHZO8sqrOrO2984imA5FlfoMZlv6ICy4AWpvj7EU8UjEDeqMAUxH3dI8Z29W9LPaMgn5wpmyvNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698810; c=relaxed/simple;
	bh=LPLk8v6qipzDcxDBqBqa3e6pymDFk57c0bn8MTSzibI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0xHD8LrjpsL5+6VbGQVpvE29NLEXHihq3q4w436BFipltEqpHDNeShsA3x6apw+ZcEvoFpJDC5Xf3iYX1DZtdw65CIL/usvl4xQCf04ahC3G9Ynm9wuB0iRxpzur5d3bTDywTjneQWimAr41w07DD18Jn904X3s43L8ITCmz+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9BFxs2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbGRd8U0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9BFxs2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QbGRd8U0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEcUF0907216
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xBKuEDaMk68XiaasA2FqgPls
	eRCp+gD6N5nhPD+AquE=; b=A9BFxs2XHfDthPEIiMNlxvTWepZtqyjrJACNBKl+
	h8OPf4QVgSsx73E2GEA2dFT4wrRn1297Oa4zzAXQSBW+A4DIT6x4NZ0wJh9DSj16
	4Z0aosDOocqP92zfwyIRoNuepX02W0UIsIRVZy9438eutg4kAwgdKWeEWIF9/vQq
	H9hNJjHxOorH/gWHbbiQtZDkE+roCm5CUqntbh1LD4P6KmiW0lHIW1I5Z3Bh6sBJ
	xLZ3zFJfUw4tksXKdYuoS2W51+oisJO88EuHr3qIrxPEBvDvV25/nEm8BmfStgyX
	LL1I2T4u9RvzD84NmoVt6hjF3h5Fqhh+ShSXDJbw7R+Q8g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8m34r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:53:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e7cb9f24so341044137.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783698808; x=1784303608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xBKuEDaMk68XiaasA2FqgPlseRCp+gD6N5nhPD+AquE=;
        b=QbGRd8U0V4bMYQvOhdFESPtzD+BZaolqyMjSrmwuP9vjNN9+kcdpVuH1h6/N9wLiqn
         TJKdK9SiRKI52C7e7LoJYHSqD/cNjN3FwClJRHEjhSf7JnSjHSgW0XuSvm9YtFs49B3/
         ItRssJEhr3D51pbgxGjmi40RdpiTcMgvNTSB2I2+wPnAD4yYxFiLmf4XmKcCk+5vWxAq
         ZtEeem8rhcKFAuwmA0jUWhXCDsTAX8R+FyYVC0vIH8NRwkkkJ2Jn/9zEo54Q7DuAA2ex
         V4F3DpWj78mszVudhkLXm5exl7wq2yz6YRT823L0KW2IHKrYsyfK+/WMrYYITb5z9yvg
         n3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698808; x=1784303608;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBKuEDaMk68XiaasA2FqgPlseRCp+gD6N5nhPD+AquE=;
        b=sI2/cOruVXNa/fmr7Zq3U526NE3xBVvK+X+cYX5mZa1LPS/xe1gjaFICs6i4Wx7sgl
         Y3pD5gkZDgiD/E38KoXAxK3sffVK1x1iMoJIZrfhXQhL2E9m2xF0m/rrf31YqjUm5Nue
         TxltYx1G8VNFVff8wAQUOz6h6HjeOC1Bty31bZyHanJo/upOGOFUYIytIXLJXeyvZUP4
         uynpEwsLaK2qIQw/Ft9Lz5Jop2hIYc0vo6MzOHwa5lJfSuvg1EWY04X47GDEbkbw9MEj
         jdcb5CIwhJwuSWN4N1ymtj6yP1Yg548+FdtvYoNfv0k6lnadVWFw7W9R1lXx8t7qz4SN
         wXEA==
X-Forwarded-Encrypted: i=1; AHgh+Rpb4DUVjFDvolmakaMAWFpDP5G8F8S2aPal9OshVBv9BHfyWk7m7nisESIYneme8eXTTEwYSIV2va3j@vger.kernel.org
X-Gm-Message-State: AOJu0YxM7z/ul9Xz4De+s7Pd8a/60lNK9KGDu2Kpw/PLmF9m2vZEsmLL
	RU1as4baMXcYursmv/uB/MNszJZELZw+8JGO9EAxe35IoDsprky0xlLhdsczKOBEOV5BDWVJx7I
	db0K6vyfdgnACOiXMNXL49593SEUv73cgPar53di7I/FzImGVWY74kOcV2VXto9+u
X-Gm-Gg: AfdE7cm3HI2+AWd8KjaED4f2EMGS/8AlrLez2EU/IJJ/OACiNM/+Re0k+LYvM0fzbD7
	rqvMHPBqCwSYxEKNvmNeoFIS7aqwXLCQ5vF1I0MsxZiqfMdeQoB9eGAsPCIECwn4yfJGRGzW9aD
	9twa5hanksmxL06wWnZXW9+HZhVXUxLO3KDcw9h6tpua2Afz9qvo90XWdrAPKBGP2JsfsNDk1wK
	4UvX0Qz4We0LBiwQQq1uUS+WWduQTuNyJ/Pi96iGFBKt7OZHcfkELM7IvQDXEkFr9gMhXdPvCmB
	/K1hLOiZXMviF7Rt28o1vn6f+0U3qPnk5GBrBCt47RmeEhZfffSUpBeHMAYXjxONH7vLLJnEa40
	VTnqIv73GzM+p2HTs0HqGdDLgDAgpo6Jr0abyggqYebVTasNShV13YGhiQAXvmgB9jkb+seD6S3
	Qz89o3NXzmy0ZueZe+wur/Bl5N
X-Received: by 2002:a05:6102:c54:b0:740:22ba:8a4e with SMTP id ada2fe7eead31-744dfed12b0mr7465190137.6.1783698807629;
        Fri, 10 Jul 2026 08:53:27 -0700 (PDT)
X-Received: by 2002:a05:6102:c54:b0:740:22ba:8a4e with SMTP id ada2fe7eead31-744dfed12b0mr7465157137.6.1783698807142;
        Fri, 10 Jul 2026 08:53:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9ddd9sm719267e87.53.2026.07.10.08.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 08:53:25 -0700 (PDT)
Date: Fri, 10 Jul 2026 18:53:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
Message-ID: <b6rhqjdjzmwme4obo6qdffg6pf6zgcjf7a25kneie44bucge3y@kr3v4ylsspfv>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
 <h3kbrpbz7naivqv2urba6ai4sd7kpaqz7s7vxuxuktoc5q2ojx@u6zngnmrbenb>
 <201e8354-fc34-4d2a-89d5-8661a3a66133@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201e8354-fc34-4d2a-89d5-8661a3a66133@oss.qualcomm.com>
X-Proofpoint-GUID: Ko5sQtd0D5FGZISnR01IJIdTZCIyxDW2
X-Proofpoint-ORIG-GUID: Ko5sQtd0D5FGZISnR01IJIdTZCIyxDW2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE1OCBTYWx0ZWRfX1Z2bGH8dv1zL
 LLx04Q5QoNlIa2bRQRxeP9Z88xhyIdzKlDx3oAcseGm2mdOFUpLDpHJudOnBll1t4Eb1SyPeEHm
 Ys58X5pWs3/8u9vzE7QQHXD3zZPbY9A=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a511578 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=hvOWy1xF11GdC9aVnAkA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE1OCBTYWx0ZWRfX1QJI4+qcWrSs
 fShRLhFlz/HJj6tsjj+H4TqybxcQeZ+ePdzv9b8ljjsFNfH38a4MzvG1UzoGPnNUCpUax6k6qK1
 NExa542OkA+hst4Q9sn0kMYRT6l/YRtY9F+yR5QLjU0dRjLOR/1RgP3aV4dNN+tIXAFtqcMm4j0
 +wUgW4xDRQIWpq9DabfVOk4JddlOubPLUhSraI7GbyN269MvLAMBiBcOONBAHc6I/lrib/UimKL
 0vFVVIbffXzAgLlSdJxBIdYpyx73KhpLY6Ceo2WFIT5LDsP/6qSc4bSqyyCixxRUmuj9Pa0WPTY
 lfnNtZd7b0h0EI9OrBJxEwWJL9ai67XYrBTUNKxEKYsgMcClutNza+kNa+Yz+u7RWwc1QjX8tE6
 DXX+TwDHhdljc3s7k646qI+VFjpvolEJQdCdOX/+vuDxYhDgTFQojkRILtTshQxBwwJXKjMjqh0
 pFkeN8OY3s8WyGf0AmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100158

On Fri, Jul 10, 2026 at 11:32:20AM +0530, Vikash Garodia wrote:
> 
> On 7/9/2026 6:20 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 06:05:47PM +0530, Vikash Garodia wrote:
> > > VPU hardwares have a limitation where VPU streams are associated with
> > > dedicated addressable address range, as illustrated below
> > > 
> > >      +-----------------------------------------------------------+
> > >      | Stream A reserved region (600 MB)                         |
> > >      | 0x00000000 - 0x25800000                                   |
> > >      +-----------------------------------------------------------+
> > >      | Stream B reserved region (3.5 GB)                         |
> > >      | 0x00000000 - 0xe0000000                                   |
> > >      +-----------------------------------------------------------+
> > >      | Other reserved regions                                    |
> > >      +-----------------------------------------------------------+
> > > 
> > > Mapping a stream outside its expected range can cause unintended
> > > behavior, including device crashes, as reported at:
> > > https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> > > 
> > > To address this limitation, the subset of stream/s are now represented as
> > > sub nodes, so that they can be associated to the respective addressable
> > > range.
> > > The limitation could be exposed when running usecase like concurrent
> > > video sessions. The binding have been validated with higher concurrent
> > > sessions across the SOCs supported under this schema.
> > > 
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
> > >   1 file changed, 63 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> > > index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..bf4d24ce90bd38666704274390b98be450f708c0 100644
> > > --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> > > +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> > > @@ -91,6 +91,51 @@ properties:
> > >     opp-table:
> > >       type: object
> > > +  '#address-cells':
> > > +    const: 2
> > > +
> > > +  '#size-cells':
> > > +    const: 2
> > > +
> > > +  non-pixel:
> > > +    type: object
> > > +    description:
> > > +      Non pixel context bank is needed when video hardware have distinct iommus for non pixel
> > > +      buffers. Non pixel buffers are compressed and internal buffers.
> > > +    properties:
> > > +      iommus:
> > > +        maxItems: 1
> > > +      memory-region:
> > > +        maxItems: 1
> > > +    required:
> > > +      - iommus
> > > +      - memory-region
> > > +    additionalProperties: false
> > > +
> > > +  pixel:
> > > +    type: object
> > > +    description:
> > > +      Pixel context bank is needed when video hardware have distinct iommus for pixel buffers.
> > > +      Pixel buffers are uncompressed buffers.
> > > +    properties:
> > > +      iommus:
> > > +        maxItems: 1
> > > +    required:
> > > +      - iommus
> > > +    additionalProperties: false
> > > +
> > > +  firmware:
> > > +    type: object
> > > +    description:
> > > +      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
> > > +      VPU when no hypervisor is present.
> > > +    properties:
> > > +      iommus:
> > > +        maxItems: 1
> > > +    required:
> > > +      - iommus
> > > +    additionalProperties: false
> > > +
> > >   required:
> > >     - compatible
> > >     - power-domain-names
> > > @@ -98,9 +143,15 @@ required:
> > >     - interconnect-names
> > >     - resets
> > >     - reset-names
> > > -  - iommus
> > >     - dma-coherent
> > > +oneOf:
> > > +  - required:
> > > +      - iommus
> > > +  - required:
> > > +      - non-pixel
> > > +      - pixel
> > > +
> > >   allOf:
> > >     - if:
> > >         properties:
> > > @@ -177,12 +228,21 @@ examples:
> > >           resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> > >           reset-names = "bus";
> > > -        iommus = <&apps_smmu 0x1940 0x0000>,
> > > -                 <&apps_smmu 0x1947 0x0000>;
> > >           dma-coherent;
> > >           operating-points-v2 = <&iris_opp_table>;
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > 
> > I think you need "ranges;" here. Also an empty line before the subnodes.
> 
> Could you please elaborate on what would be the use of "ranges;" in this
> case ?

That the subblock has the same address space as the parent. I might be
completely wrong here.

> 
> > 
> > > +        iris_non_pixel: non-pixel {
> > 
> > Drop useless labels.
> 
> Ack, labels can be dropped from schema.
> 
> > 
> > > +            iommus = <&apps_smmu 0x1940 0x0000>;
> > > +            memory-region = <&iris_resv>;
> > > +        };
> > > +
> > > +        iris_pixel: pixel {
> > > +            iommus = <&apps_smmu 0x1947 0x0000>;
> > > +        };
> > > +
> > >           iris_opp_table: opp-table {
> > >               compatible = "operating-points-v2";
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> Regards,
> Vikash
> 

-- 
With best wishes
Dmitry
