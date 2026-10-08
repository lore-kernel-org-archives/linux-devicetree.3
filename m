Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C96492E58
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454771; cv=none; b=FGe9U1Y8yHV1gYz0vWLN4ILFZCMd/6eGq/heUcW541FgCAC+Q2NSgWaQedLft/a/so4VETpBY5u4obO4TFKlJqwLoyleSHQkFaA/Hkpkn9/TQ96hVgPEZTbd5fAIhmZUn4VcNZ9D7rPZQwy7Oatr5/3xE+nAD2ekwzoAFZfowV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454771; c=relaxed/simple;
	bh=Q+U7N1X2iZ8frTocNg8k7yx0PelE5xfCMhY0GDGx7nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUgrXqtiohbWuOfY2imvV40IsytuxnMRlP4b4lZKaTzdKJP02G7m25kXGaGOOLbrzGtPY5SGo6lwf9EhfgyW28ificBFsLmKDRppXffdYJi85vVG8PFahMx1Tz8mpYmAZZkQmwgjWjGNhWSUZ3OyWIjdbiqB5HsBegblTelydME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lp7fiQ4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1LFGctu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lp7fiQ4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1LFGctu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987JxMP3190606
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 10:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S92mSD6nzFAHFvI5wGu0aDKr
	kCuwEVmxByGF5utkGRw=; b=Lp7fiQ4VcAu1MS6PlRHXbvCKrkUUV0yUBUzrQNNP
	Derk7SJx0BYRNygC7aa1r6/C2uL5O4e7cMxEAGvcM9NCjxWgKQnm8nNyU/KC6DUf
	HsvWN4GufGZnQBXYvcttPcNjH2V92q/zTXtk1lJKnHro1tLt6jcV89iGrcwazIOG
	RYenwL2Ds/aDSBwody4KZKqm+hcDOHHt7zYcYOpXvFIODh3UvaUINc4QCtcZHOmz
	w+qj0IiUY+KW+1z+XjtL7bP8SIxG0H1B5MEr3nrw6zX/c3sEOuToEXyktOg5Z5fJ
	+21GIyE2m2DHkU4RqA4SF3TSWXTRp3SVwiPnIRLilrNa9A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6af1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 10:19:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a510b22fso99328836d6.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791454768; x=1792059568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S92mSD6nzFAHFvI5wGu0aDKrkCuwEVmxByGF5utkGRw=;
        b=C1LFGctuu8gS7jj4n9dGjG4JO1yNTOYdvfPmmgtWKUN+P8exwW3bPHBfLip1fZkQOu
         F0jqZyKkVNHdKI1uowmhmErrHKPq1/nM4lMmrKAGi28/UjSQtJ+pi0jQscL1WCKIgOxG
         cZoz4eum2FT2y60XI/kCsgCYSGaPlXYY98I+EcVMjdJjvuTt0vkKkX+jFm4G5ekLWpWX
         HzebHtN1NatPgGrzdju9//IdZ231uQYcCChLQp10evzT4FVR7ihxDIrSAlPnfsL9c12J
         +9t1SB6y9u2X1n5NGuM4I4Sz70PWTBxxOCQbauLGOsDoTPn+kSgmazGzn5WA+RYFBFXU
         3mAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454768; x=1792059568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S92mSD6nzFAHFvI5wGu0aDKrkCuwEVmxByGF5utkGRw=;
        b=GNrHu8b7Lyevl2DbuBNqmlCoDLID+2wIgdHpcTpw+Wht+TNdZTSXA1qz3Lpj+8auEn
         CtNnwo3uen4n8WPY/KTkHL0BAwUTEevKc4KByIfzdZ/cd7+beFmZ7OQHpswq5hAxIjfq
         wtuXTsMyZpYd7SbQqbemseLLfFbu4DzKEVN1h5zHXdaIRLBj+N/aqrwyRMnK+iUGLmkf
         FdukEGw0GIbTaeWTAUX+gD21xa8X/W9PSKaKoTw0Ns5cZiVtcXbQ2ozOIgCh9llY2y0n
         gwF1+hMY9f/cA/Tuv0ht6eX+gu2g87quEk69pRnHZzTx3fsmNSQRx5fNbhQ+5Wd0azxK
         SnfA==
X-Forwarded-Encrypted: i=1; AKwUvBy6lHaE64SrR0zHrJ1uQt5OmgRKrtbD68AiTAqHnD7INegGQ76KWitDIRHQxfvmmKk5WlVvF0wBI1KF@vger.kernel.org
X-Gm-Message-State: AFq9FYKysIDDImajia/GNOQ7B6esNPgdDYmUuOVtXJZOXynPWkDKF+QR
	OVdCj9TE92kazHnZ98bDfC/SlTKJzuLq6a3VJsiJD8OVbURETgHKdYjX0aqW3NiIJ4QCZoJ9qPB
	31PIPB5lUTmY0pcamEkrrwQ/kUQknV0srCl2fe/wyNfAu53sjC7blBaiDmDZQJP6E
X-Gm-Gg: AYBFou3NTSwn+w6XSvA9jV+Z++tHAV7d7orcPjsgSe+HB5B2+xrFdOO2K6M0pyMihz9
	VzOEduNYOyjKashKdkHf+JTSavvQBSLwcE0Dm0cwz0Q/uKAMv6lbweH3/ZXU+UDI6jWoBI3pC+9
	XMSg1ovow1CMv6S9SyQY1nju3B5xk3ykdsQBA9vJLF4QJrI6WhtcE5tukTrjY8AisUS1DURA/ig
	B+5hIAMQrUf7A/F6QppsEyBDFhoZ4Byu2u7mERcUyzLB/TmikzLYoAjH0WjySWkrPPBLekfJObw
	98OYyeEf7wExQQxzTpOfYtJor+GzGZbNdOUZME7gmxkGALFlBtdWaIWHHibQSWo9T+Pi0OFkIMV
	mj+SPziCgYY7rXGDqV5Gkvmxh55RN46tM2svRbAxFbzIBUrFxpjG51D17sE7cwwbh0vJUT4dVVt
	NhufjY+P3DsZGu
X-Received: by 2002:a05:6214:f0e:b0:90c:b843:d679 with SMTP id 6a1803df08f44-9199784318amr96342016d6.29.1791454767998;
        Thu, 08 Oct 2026 03:19:27 -0700 (PDT)
X-Received: by 2002:a05:6214:f0e:b0:90c:b843:d679 with SMTP id 6a1803df08f44-9199784318amr96341536d6.29.1791454767485;
        Thu, 08 Oct 2026 03:19:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d756f3sm16832381fa.25.2026.10.08.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:19:26 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:19:24 +0300
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 11/13] arm64: dts: qcom: monaco: Add Iris context bank
 subnodes
Message-ID: <tokbngwltq6n5aeu6tcl7hgbpfugxcipptbj4a2tkpinlr4vxs@vlilcuxjtt5k>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 90_enR6frB5z88fu4clsCM6k8yW5soKI
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac76e31 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 90_enR6frB5z88fu4clsCM6k8yW5soKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX5+bdoFWdR+ic
 GzRh/HoIaVYDENm16jKUW8EeaFLKjxd3oSYFFow+puMPOTtbbhBCNxt1QV6OhodemF2aKrdl0ur
 Jf3ax0e3xSsO5r9UbLpdbkmCMfbSRtU6iHNGslw8WKYMZx42XfM779GwIpxe6wr8LHx2cz8gnvV
 ynxfhNxoEOZaho4+WvP6jZGYbHpq8MwQWOt8M3zMCKdTIptasG9lwQwBxtKqne2Vte6sDKsER8s
 0/1vlI/0AzsSfsIx5RdCyjyyJ1uGBQsh0zX6DWH5MriFpHAzp0RAfxGz9SQ310G74Iqs6yX+61s
 K0RUCuVJJvF1FIGElcchh40OD3S9m+WQ/qxreBg0oHAFUgg1ZnV4fgVAnNJ5UJZvNUPmddn01dn
 mB6xuqNyQzEpd9Jt6O2qnni9ZwNEBMFAdy4egZEeQOgv7UeuTiVrQcxt6/KsZayDrNitUpgQ056
 cWPq6gldHxrbuews3lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX5B054qV1nVnp
 CKZr4IxtGx2u849EXPm0wpn7pJw38Ik0fSBSz9hrVajnmcsyMH2++u7zqv9hF5aTgOEmvWKo9aH
 lC8+iKop6f1PZ+Y+8HjCso9cHmra86o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080040

On Sat, Sep 26, 2026 at 12:04:10PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was discussed
> and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach
> was later concluded to be a hack to avoid having subnodes, and was NAKed
> by the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> The video-codec node includes address-cells, size-cells and dma-ranges
> to declare 1:1 mapping for DMA translation to the parent.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
