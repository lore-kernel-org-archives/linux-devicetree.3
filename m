Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24815424646
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442648; cv=none; b=e9MsRt11E/lGdpNVjpniGcoDAmXIG6Kxd/w8gw7i3124KZye6bEVwj+E7TzO1jUjIdD6IiDvBZKfCpl9fHBrtGk3AMbAvVJkuZUAbua/Xe4kk2ph3QKOMpNE+QCOlgllKQrpM7i4qh3XrV00n6JxF2lAUeQPZECzKRTNNYOTpn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442648; c=relaxed/simple;
	bh=EWR8a47plqgBBVMdf1PmjfxiUoXmk7R5ZJ2ApF+iNyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAVLyHxZXttb0y5oLX/4LnJFiSGhEQ7iZ+PuUlqS+2w+nYJ3eqehBJIBj1EXU4EajLQSmtH+rpuY280L4l8kLVNwcLUqlQYNNVkzhcFceOWg54PNteR8+ECbEqYDyMGN5YitE/CgVanY8efMaa9DKhORkdEH3v8ZdCQ7Y5LxfBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNHpq9Wb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEo1iI7g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNHpq9Wb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEo1iI7g"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTiMi3996645
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 16:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=msao9II978EcbWLPZnJCBt9s
	YRcY8oZ8a4mvsNrHSi4=; b=dNHpq9WbgYw1Yh7gHPw96BHub3pYOw90FAbN9wm0
	3LCNHMJwMcJ2fRRj7gjnHZzTMUmAqr3Ps4CiSZ+Akp49ZkxWWvR5RdRVwHr0W/ZN
	Tf5nyFuGg9QGqjcOiB0hpzdd2N7ao60Fs9LTyxu4WbO2xHPpBhp/qmyNk6qC7qIR
	Jvpewwb+cF/Ln0+Ec3NBwkb8EFuG2d24UjrjqmhbWMpLuJZM9Og8yNJxW146sRr9
	QLWEPOZXsfm/VEssXLxUr6lXo0DkVBg9et/mQv+txWMU0j6AASXTpmukXTZhn6eP
	GYUJ4bg9xfhjv6LLo8R7gcsGIMCaaSNSSTJ0LTnWXnhB9A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su7331f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:44:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73883529f72so4653567137.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442645; x=1784047445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=msao9II978EcbWLPZnJCBt9sYRcY8oZ8a4mvsNrHSi4=;
        b=kEo1iI7gzA5fPDdxAbeuTsyLBeOp72dr28xF9v9hrgTTAq6BJ4ypaCDjA6CG3KCn5o
         NSFpdu0N+pEFlCQE9xwREgdCP0uIpZebkZ0T7NLkMsMfPfpURL0qLA9zlpsf8nPU7rC5
         6m/QvmYejlySopuqP+3zOWeBlEEKlWCM6jQ4UtYncQYrY5Ifk6tFgGsoSONAvr42q87j
         v9b/m91qVWCBsWb0RWtdd9mIshdCijbTmn8UOc5xaDzG1ScBae450hXRWrRdlt/VEDzY
         Sw1MRa4c80nhP538CpHSnO1KG9MinkC3Vwx8lEs4Xo6/szjXFIls7nKXHlmyHytdex0Y
         Xj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442645; x=1784047445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msao9II978EcbWLPZnJCBt9sYRcY8oZ8a4mvsNrHSi4=;
        b=QoMv2O3sRFprKAnrYUMwxxmpg9CBzCtlumOag/95doK5H5mS7g6q5ApHJl5jMM2W5H
         En+4bGM4TEqus4BRkDyIjBArczBP1tRo/uAYyiYBLzDeFgw5EYa8Gr/vAXz6C5C9tnxP
         MoLUBSHSJ537m0XTX9eGnvaJz28uQBGyj84JsMiUTf+ZXGYLcUXJBcMNBtnwHM1AUkId
         V1GOGFyk5VMN0VYT0WqZdDbzdlsrRgE0TRd359pONQwfQ1KbmOxC1QV9JeyL6vfq7Qp7
         LwRRFSfiB5FLJfDbQmn8vGpULQGTS2e9uXa9aAOa69xftp1QPJOrU0nmdlrY/LjI4SkM
         LDrg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0NZ/UFb+dyILCijJOXByYXxkfYVwUPsev2S7X2EZAScpSRUBpTSvq0gZDIHJRdIvWAW/ZWo3Y+iRs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwb+BE5eK0Fer5z5kkKVFCOB++OCH9ndKwg3vYmSLlKxOaUBVH
	NzKoN4gjRORMNp0ZCaWH+hHl9qYjdRmnEWM0/KN8E4+t8Kt/hzdoMH+3otgU+JOXPlGzC2T+Zqo
	05bJVxvQloR1hmBmKHQRM+H8N3jgzN6L1rf6dQO7IqBh/ICxhR+zN5V76Q4m1iIim
X-Gm-Gg: AfdE7cn8WkwpSpn27gl6TeZ+w/P6unblFBVopeSoRV5s3liwgyS3esNNoGWAsxMQMPT
	7W02pPTe+B1SojeIGYCTng88yz+iPofZsGWt5kGjxXkMCL0HVqRpfYMHJSkwEVFeVuZ2JEVd6WS
	2OQk/YG8X4SxuIaJATil6snlGMQ1CJYmZc4RPSOxZjZ937PnK6sZxm86zNuUEtXzbxIrdYTJRjQ
	n6uA/oBQEKS74aat4niwqZndbesnbB3waOJMCmjECeXsU8F2wEoyW10hQ3WNigsQU06BjlcSXRS
	1Jp8me6s1tHjd3ZA5UBqCTXTCzWSLVcUMUUiWnCspLhli4HQLPuKU6zOR/ft/ta0B0ZNnBgXo4S
	S+GIYQo5XK6n4ndEQ4mzNyElOVmg5Uiss8IkAdE52Skq4LxfIBSKvjJ5GkLCzc1Txe6qbbtXLXK
	jL1Vri5bfBCCpqMryNWGW3DYU6
X-Received: by 2002:a05:6102:a54:b0:738:6994:eb8 with SMTP id ada2fe7eead31-744b7826cd0mr3376466137.0.1783442645229;
        Tue, 07 Jul 2026 09:44:05 -0700 (PDT)
X-Received: by 2002:a05:6102:a54:b0:738:6994:eb8 with SMTP id ada2fe7eead31-744b7826cd0mr3376435137.0.1783442644651;
        Tue, 07 Jul 2026 09:44:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbbbsm3826799e87.43.2026.07.07.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:44:03 -0700 (PDT)
Date: Tue, 7 Jul 2026 19:44:01 +0300
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
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
 <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX89nhY2TP9YRF
 OdPAmEMXV7lKWt8p99GW0rKIjt0PbXvET8VMg5Z7RBum9Gp17EC5UGUtibN72fuKi8RevK7nHyl
 jlOs687x7r3HVV0qmm21bCcnWN0yDo+uhOXzZnn2BGrjxo37VqVqttC8qWteuPJ0Cy2iVI4Jbe0
 lbaO93NQVgSPrnYM6k3gpdmjL/01c8S3ktV/APCLKWmKRsEMl9u3mkIFg1atNM5bmIQbS60p6+A
 7EBQ0G7Frj9s/DrGnum43HmP3X7u5yDjGsvy1Qfd2qCanTq6WJtonxOJdlIBM73p6nnfW93JbAW
 VWFH/enEagQCXZbSzcmvE+HZw1wkJfARAHv/zAwxxM46e7HRd4lZafrYvcOR0pl9N29kEVsgkHW
 hL7DbfWoRcSkFU+aH9nXaI6POIPL4513WNamV+uGO9Jii/2JU0xCA7tRUVbLymXDU+TozHf35di
 nzNhTam/zPAb6Bhgbbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX17tFIW5wcGwy
 hQNFlmm5RQwl38SyAUoCCTmft99hDHcKjdLVhyuFzjfPHBJUfoR8gPbu/EJivAMS76t3zHUASHl
 AV5ZGct1gHLn/ZLFgC3Up4fD84mu+9k=
X-Proofpoint-GUID: ukHV91Aml9YI_hOd7UkKHSOJ6pbbbI9s
X-Proofpoint-ORIG-GUID: ukHV91Aml9YI_hOd7UkKHSOJ6pbbbI9s
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4d2cd6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=c3lE_UrMKrngV7lMyMoA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070164

On Tue, Jul 07, 2026 at 06:37:24PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
> > > On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> > > the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> > > are accessible. Without this vote, the SMMU may become unreachable,
> > > leading to intermittent probe failures and runtime issues.
> > > 
> > > Add the required interconnect to ensure reliable register access.
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > index 90e50c245c0c..721526f023dd 100644
> > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
> > >   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> > >   			dma-coherent;
> > > +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > 
> > Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
> 
> Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
> preventing gem_noc going to sleep when icc_set_bw is being called.

_why_?

> 
> > then drop the extra suspend/resume play?
> 
> Not sure if I understood it correctly.
> Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
> or in arm_smmu_device_shutdown() path?

runtime_suspend/resume. I might be incorrect here, but I think it is
exactly what you need.

> 
> Thanks & regards,
> Bibek
> 
> > 
> > >   		};
> > >   		gfx_0_tbu: tbu@3dd9000 {
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
