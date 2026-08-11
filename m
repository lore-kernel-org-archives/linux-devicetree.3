Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A35B306774
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786452202; cv=none; b=LOyqfbqoEMbtDJDAzcnATqKujArWKdnOvajgZbkq5P5ACd71CxtLncBb/Ioc+8VejMZXIM4vmVFuk7hKS85BSvd5vpX5nSuKapIB6EYZQnvnK5SMA9oVguxokfuOyVoFVPZvQMEwyMzeAo/lGbvNkCFptj2fvgxUCWZVSoPz4Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786452202; c=relaxed/simple;
	bh=Vl8+7IT/uEy0SK+7WR3BHgfykoQtDa1Phxl1M7aqKcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEw0PZ/YdnGfSbuApIcfBflC5meQK6GBIfB+yheJJA+GX7MQwyVxdR6xjpPTfEIKIH9U00qRAEjmRbKdWvGE/qdGFGjnfm/WU9OOaJR6bdMuAhbDV7qYXmNXSV6E+zJGoNDkTQNiAQdbcetLZEASS1+w224XUFJdqKR+sBBuSDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5hVmZtW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8cxEE51; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5hVmZtW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8cxEE51"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCR6HS4058100
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZotZ3xHhfhh4lvvQ7TJQUuGK
	xRSsnI9jOw2Piwhfm9Y=; b=N5hVmZtW+cloo3ZaTcxV54OSrmISf1IYQocQFzT6
	doIAgBsnFOKnAsrJRfoBbiBSVDP6erJQzK6Ja1zHkLNyYfBCwDNiUPAoT4HCX751
	m9qGH8bgibeXa6bceVFmtR48ODuhZ2m/0OeQbd4gQdNMqlUf6qSQYce1ga6a7OQQ
	wL+2ZLDgcCAtcrHNBEKXe7Xw6EPhCkqoGao0emQ5MWKMxztcyrsLGV3heWV4pgUx
	4Fxm5OAW8R0na9SUXxdI36UQQwwulQImZuPS5kU3lA1vbpIudMH4/xKlE8LvPKTV
	ydXlUVrVjumegq0G6IUDfbtotacgRpjGfjQYajXaaZ1OCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk7c3xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:43:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso39071331cf.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786452200; x=1787057000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZotZ3xHhfhh4lvvQ7TJQUuGKxRSsnI9jOw2Piwhfm9Y=;
        b=W8cxEE51HU+kyrsExtRYFYD54dyWFaE1mcG8t5NFX510WmpKP/qXTuGmK2C3uzO3id
         c2bNzQZVtVChrfu2WspncBnAuy4UYfCpQ4UpREMRU/ULGm1W9pvGC5HET9/DlY9dqSlN
         Bw8t2aulH3PrbzBmcGP/Nl0WFmlFe9OsY3o2Og1xPnvQPVBOKkU1Ra4m4L/c/h/8vJA3
         221QbALpIyvYPcMJYjQx7Bm0Yk4YSh7O0pIyAvA83DdoEmBX7w00ZofxC950VqQS9qtN
         HfSCNz7dHejLTJ19Ci7nkLqfrrwOF0rPGD8RFrMZdP252C+Kv+PAlnUmZb6Ghk9Ae3W8
         f/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786452200; x=1787057000;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZotZ3xHhfhh4lvvQ7TJQUuGKxRSsnI9jOw2Piwhfm9Y=;
        b=BSh+Oi/KwwnZ7UlohRDNAWXMjfWzU3lvpuOhpaC8TeSW2u6FgQjRtN5SnyVMBPqART
         QcHj46DLAku1gFtEfr5bajwosVM/+zAPwb/VPr86chPBvI+NNiMQscnb/znV6KI9vfHk
         eSMn2zvmhYTsp+sLf6RTTb9WQCKATN9uO8wiDOKvkokOUlwxIbxFGs8t9i3NwttNMDTb
         ct5UqtxNRbKpFdvdCLGZt4lOGD37BxzLpSA2/nzGYhC4qiX3ifSJxGyqmBKntdRGI87G
         GYh8i5p5oTE5ss7gvWD55NeU1wWm4HrFQDhrytZtZ7+r0EDpnPUe6/zq1mYcNV9WF+sJ
         OWGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVMzmiUxsoXonhAMbny7lohNeJMx4xm0XgF1gq9vjzBSxTmF6gvKq+KSmtmuFDEZopGR+/HRfyeTG1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Mj5qb+Y7uG4wZF2nAMmTvepCrQr0Z942o37Rxk3tMHhhhyJF
	ksGS/o6YD70WFGg2ymXZBxtWRHc3+c3BIkWaUciw2KW4C0nW8I3sGqeHFuAFJ8WL07l4VDod8Jx
	6P735Y0d0+/j91yt4EFw6DI0D+v8/+Et8yzbuSn82E4XiHSBSX4rvyrEVdou+6SFU
X-Gm-Gg: AR+sD12O4Nrfh3tiswMnXuFXQQ3/a6X8d6JdTYw3KlF39h9r5a9rGDluslERLU68R5m
	lv3+H0wvo3QlfsYnaNsu+VQE4LQSlZA4I03g7NRCUr5JtlHPesMn1B2Cl3lNFMLqPCezy02ESTX
	LlP0hs0wuFsk3IQlQC3410MOmw3QSZxGBiJmfVDlnLgMzuRRvohKGBqCQZ8W/cW1IIRdUU7cRA3
	dhgPinP5DwTxovC1KW2hYhP96K51DqoxP1sExaGglfMnfcux0389GnHDrWE4tVzjYvFGfADdCXo
	xN/ExwC9iI8XpDu1YEDjeRGuDPuscwmbtw9yXIVvQOynea73Y5ePVcLl5IhXrASZ9djDPdBmisi
	kddkqhSRJGSStUYLqLgostqx2F7QHlQ3NC0DLXif3qYhqAMoT6gRCjfFbfRRO8AzppltkVjORJ8
	k1R1poxojIuTxn2w==
X-Received: by 2002:a05:622a:544b:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d585e2be2mr24810161cf.26.1786452199490;
        Tue, 11 Aug 2026 05:43:19 -0700 (PDT)
X-Received: by 2002:a05:622a:544b:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d585e2be2mr24809341cf.26.1786452198937;
        Tue, 11 Aug 2026 05:43:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa3bd115sm2187991fa.9.2026.08.11.05.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:43:17 -0700 (PDT)
Date: Tue, 11 Aug 2026 15:43:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
Message-ID: <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com>
X-Authority-Analysis: v=2.4 cv=Yus/gYYX c=1 sm=1 tr=0 ts=6a7b18e8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=X4WPEW2F6xLIBrl7kOIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: MubnR75Va_Jj31oo-wIqsoVY6PtiRdsx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwNiBTYWx0ZWRfXxfui6X9u63xx
 mD6Bfu5ggxIwjgGyqsU4bven2RPhNioqM3W7os8AVFPgO4peVJpaWksEYws4EGKekucrz3dEEMZ
 U5tWZfVrFhhN4AkimhV070CqqkKI5XFXO9wR350viHlTnJQuyel4wPoQyPUOhoYteYjLhvoJaLF
 jUXF4fgJZfZmw5OecQbEpOd1aMdfLu3q5PUFAixl1ZlwQPzzBofFvSIBtFFeaOloJi7zUG+X5Q5
 KVrr9pUem17ytxaGL6L7SG5trl27+IC/arbRdUTHCcQwvINFgXvThRs7bWZ1xyK76E+SP4CS/LZ
 874YTzATqVyHRT2VFFZpAfHqn3tGWudOcbe5/rRfnbgEWIxpNtECZHf+IOYoBN/tUunnvnYXGUH
 Qz8EPJdd0rEsr61HJa4ekQ/d+q79o0uLACSSBob2O3k5pashwnwJuaMK/apRCqujZOpzbwMjZmX
 /o8MEmaRPWUe0sDs51g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwNiBTYWx0ZWRfX42DgzOEXIaku
 7kevAXcNuUGfdi4d065/0arPoBaQf+sJAL4D95X60D0SOVlOD0RsQ5dXzN2lOzSIUukrBHQ9H0/
 KH5+fVKJG5aD+rU5MsHJDXQVJwNsWbA=
X-Proofpoint-GUID: MubnR75Va_Jj31oo-wIqsoVY6PtiRdsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110106

On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
> Hi Dmitry,
> 
> Many thanks for working on this and sending this patch series!
> 
> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> > spec, however they differ from other Qualcomm platforms in the
> > implementation-specific registers and also in interaction with TZ.
> > Venus, MDP and VFE SMMUs are secured and require programming only of
> > CBs, while GPU and JPEG require full programming.
> >
> > This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> > and adds only MDP, GPU and Venus (although untested, it is required for
> > display to work) SMMU instances.
> 
> I do have a patch series (sent years ago to the mailing lists as well)
> for CAMSS so I can definitely test this in the future.

Ok, let's land these first, unless VFE IOMMU blocks display on your
platform (Venus was blocking display on APQ8074 DragonBoard).

> > Note, to get display to work properly one fix is necessary, [1]
> >
> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com
> 
> I've applied this series on v7.2-rc7, with the extra commits between
> that and linux-next for qcom_iommu.c backported so that your series
> applies without conflicts.
> 
> So far I'm stuck with the GPU not being able to probe, adding some
> printk's shows that in msm_iommu_new() the call for
> iommu_attach_device() is failing.
> 
> [    5.971154] msm_mdp fd900100.display-controller: failed to load adreno gpu
> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000.gpu (ops a3xx_ops [msm]): -16
> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach to DSI host
> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa1 failed with error -16

See the patch [1], it's picked up for 7.3


[1] https://lore.kernel.org/r/20260730-fix-qcom-smmu-v2-3-18e0daf2d836@oss.qualcomm.com

> 
> ~ # dmesg | grep iommu
> [    0.127014] iommu: Default domain type: Translated
> [    0.127052] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.739899] platform fdb00000.gpu: Adding to iommu group 0
> [    0.741358] qcom-iommu fdc84000.iommu: iommu sec: pgtable size: 90112
> [    6.006877] platform fd900100.display-controller: Adding to iommu group 1
> 
> Have you seen any issues like this?

-- 
With best wishes
Dmitry
