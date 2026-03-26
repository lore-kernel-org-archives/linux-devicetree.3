Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34715327C0D
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774504518; cv=none; b=oyFUmbZ7piDozn9z3o6nu4LBXgfUO1AHSeUWB73cHmQGswolK8kEOA7YwjVqHx/jzGwrjoNiBdmB/3xc5f2kix11lYfAm9Fb38eJc3pD6dVOjiJB36YXVM8a52etisHRewiSwX0c9nMS18fGD2EqsPDzo7vL0lt5ygmV0YFdPkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774504518; c=relaxed/simple;
	bh=YtzAog2iT7qRYMNdO36y/DjGGvleNLJf4g9GCKshuTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/rCvf1qxUHgCk/6nGB8jjHUV1uOtqTFYoFFOYs1emG2Pes4rSwTy28pvaqNX42jjKwPnrq4bKgPO3NuAAORnttglO8CJuCpPrT1NoBXB51JqFpTkXI6phwm57S234naxkBCRSgJhVUxx/8Q2g445BguQ7DKFnzoRUVA9EvaXqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6USjlaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUdGj/lQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6USjlaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUdGj/lQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0nUEe1811045
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	808xdNmKLCaAFJRD8fSiUQE9ujHk0+F2A04hZAqckLw=; b=g6USjlaGedJfM+6c
	sh043EGNYzelCOV0izT4tNV/QLb3n01n46Bcfmfqhk0dekR80UJbYOv+ECiKyqF5
	hDGBoDW4HjYW1FAnHB6HQjPL6wiU4HzOonNQwpb/m8z7iZT58NXSi3dOBPrIjoKw
	wuQ+A2qImDN45is0qhRImk0Fg9/VXYXt4bbMo7IOL2woERqueHmWAt0hrmhyhiv0
	JLF5Kd2kqXU71weN+dS35T63ejg75uq5aWodNW+gv5W1MJbCfegg49wHfqx8ROk+
	Zh+yu0VCeaDvVnApliD+U5Gk5SVWVPwHYOe3DC9JmVtMZhekVG/bxeogXSihbsCE
	J0PCCw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn0tbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:55:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso11898645ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774504516; x=1775109316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=808xdNmKLCaAFJRD8fSiUQE9ujHk0+F2A04hZAqckLw=;
        b=fUdGj/lQkRnW7eFg1qUkUHehc+jKJkx9JToNGkn7y7LELusw/36nQ5kA6fD+P68dXE
         WwFcr+cRX+0qo0ar9rW8TrjchrfQyPAq8qkMk6x7VEnL8eoj6UieboFFlvPE/8t/M42/
         lro4idjahJozrDj771QKVH+GGajUcLRTy8kxN1+kbjbmOL3IsmkrbJc27O2Vnf9gFB0p
         2yVe6Vx7/XZVLBclvnWFqWEnDSUBqEtT1P4aQ6wbroGs3/9t+fvDwDQA0XF+grVdWEiQ
         wL4hZgh+aFQf6WUVXVoWx1+FjoFmvuPOBGsj+TPNB7EqAn5Rfgc4EB65BIOljo+Z07Yk
         r8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774504516; x=1775109316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=808xdNmKLCaAFJRD8fSiUQE9ujHk0+F2A04hZAqckLw=;
        b=du96tUC7Gq1V6uHCjmm4JSu8Et8DRERld0msa/NO1qmlJEYYBMmJtO+DyBnqo8JF90
         MigZfGeExVqq9uCflr0qvidc2SPXW/q0d8k3XlK5sqgcHmv5Rq/RLuj81WNm+S64ia6d
         iTkO7zmSKTMT15I+CTN1a5z7FJH0ekgn8zavaXoWdXq6l7mhGlJ0Kjm1QaZdsFwXCpAB
         EMw9y3nhRDSKks4XtqgbphttaTa59DhwQHOuDatl1RhCzdHpV+wVMzPux27S0bP4ppch
         R1DfMP5yKVbgS3F9ISMu/ieBm0tfAW6rE4TMVGlS09QjLn4Bf2/xL3lMVrrXfDNDYnat
         v0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUC9+zWsbPLeUV1sPpoRqGyTsmYz6QpK+3HZJqqP3casbyA8qffcErxc+iv95nmz502PCaQb8Vg93Ra@vger.kernel.org
X-Gm-Message-State: AOJu0Yx60iFYiJJ0nDVnsT0LgNnkn0QxEwTUTST7BlRudqdDSLKEInzG
	EcJLpoqf1s6+BMQw7OZXtBPYDhTribewZpU9TM9BNQGNpuNhfuQgrv9ZbJd/8CFwSYfU2RqX5qB
	R4BdLoTZioWsDg3UvQHfHLJtTGEGvcGYDdRXs1/D/TriJBi/Wvs0NR/yMVra5jMcf
X-Gm-Gg: ATEYQzyz7SEzqXPaa6qZBMmXHB0rhoVWM6KNwE+PPlIwaHhp5wflyOZCXdb3vRID2GD
	XP18zGR4IU7Kc4bwA9AtHhR5cdceZAeMuod3DXE75FSKhS9HOw84uoQ+8LmEaZgn4nN476oezBi
	zwpKrS7Sd4kRv7/TdSKbcd588Gj7H8bWGmlJcenBw3BqDHtn/VAVAwtU2ExDpWIPolXnGlV9PP1
	O1KaDtNO9QcHTigFVq7vrKWV3N+Zb6RMTEyxPU1A7yyKKZG4IypR153tJxeNFtLU9r1f/e2H+3/
	0mYQD7GT5Nq/BX/MKalTUnOXVrPdWKfr/XBuX3/6CtSGxbY8hz3u8wkNbl2KfA2eOjYThwqbEWT
	23hh475oVlImLZx7K4STwCQZQ+gSUTFvqXfD9raASF0Ye86BeFAUDQT6M
X-Received: by 2002:a17:903:1b10:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b0b0aad881mr74442885ad.28.1774504515834;
        Wed, 25 Mar 2026 22:55:15 -0700 (PDT)
X-Received: by 2002:a17:903:1b10:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b0b0aad881mr74442365ad.28.1774504515275;
        Wed, 25 Mar 2026 22:55:15 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc87e820sm17098715ad.50.2026.03.25.22.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:55:14 -0700 (PDT)
Message-ID: <65f76d05-1474-46d3-aa71-4acfe86c5718@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:23:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA0MiBTYWx0ZWRfX1+bP6kkdiVrV
 MkH4FJgrsySMflH5CGlFcTt8xQGJ7pIZszKU/bCHh9XNob0nl5V7ialuEXUjmKD5hWU3TBK+m0P
 y05XjHjBzD0q0GexQfGxOm4QY9rCPG46RdvvqmbgYRkxfO2ivStUc/HZGS2WY56/KnHhgtu4P+4
 u2QMsMtIk1BIJOqVNP84MZTMULngbNsF5TQSBt+8azHy/QMGQHVSmrwoYDcBG4E5+UKj1qlFynT
 0D2CrQaT2vNRm5kERtxUqFxXvLVAku8XCXUtE4feIWf+ObP2iNwIn/4be5YrKFj5jGVlqYUXQIs
 dhJk/jcxLkxwaT0gv5bO9RLOkEmde1R1CS/UU/h1N+4EarxaFE73mZUY6cDnKXC46ZWJAsfb6dG
 0jqbLD9V01PWTmZ+eaK2Sb5Y7eM2JejZcntynPgak1flKlsWyWcmT0MELcdyjyMUTfFuISajd+X
 KmUuxwKCiwqvRKVm8OA==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c4ca44 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=G4NFmJWIaiRLgIwbil8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5gPZoMkfyeAgWIXMz8_9r_mFRSxlUeQR
X-Proofpoint-ORIG-GUID: 5gPZoMkfyeAgWIXMz8_9r_mFRSxlUeQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260042



On 3/25/2026 4:38 PM, Vijayanand Jitta wrote:
> So far our parsing of {iommu,msi}-map properties has always blindly
> assumed that the output specifiers will always have exactly 1 cell.
> This typically does happen to be the case, but is not actually enforced
> (and the PCI msi-map binding even explicitly states support for 0 or 1
> cells) - as a result we've now ended up with dodgy DTs out in the field
> which depend on this behaviour to map a 1-cell specifier for a 2-cell
> provider, despite that being bogus per the bindings themselves.
> 
> Since there is some potential use[1] in being able to map at least
> single input IDs to multi-cell output specifiers (and properly support
> 0-cell outputs as well), add support for properly parsing and using the
> target nodes' #cells values, albeit with the unfortunate complication of
> still having to work around expectations of the old behaviour too.
> 							-- Robin.
> 
> Unlike single #{}-cell, it is complex to establish a linear relation
> between input 'id' and output specifier for multi-cell properties, thus
> it is always expected that len never going to be > 1. 
> 
> These changes have been tested on QEMU for the arm64 architecture.
> 
> Since, this would also need update in dt-schema, raised PR[2] for the
> same.
> 
> [1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> [2] PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184
> 
> V11:
>   - Added explicit filter_np parameter to of_map_id() and of_map_msi_id()
>     per Dmitry Baryshkov's review feedback, making the filter explicit
>     instead of overloading arg->np as both input filter and output parameter.
>   - Removed of_node_put() from inside of_map_id(), making the caller responsible
>     for reference management. Updated of_msi_xlate() to properly handle reference counting.
>   - Collected ACKed by tags, and fixed minor typos.
>   Link to v10:
>   https://lore.kernel.org/r/20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com
> 
> V10:
>   - Move of_map_iommu_id()/of_map_msi_id() from include/linux/of.h to
>     drivers/of/base.c as out-of-line helpers per feedback from Marc Zyngier
>     and Rob Herring.
>   - Add kernel-doc to document both helpers for discoverability and
>     usage clarity.
>   - Fix of_map_msi_id() wrapper and all its callers (cdx_msi.c,
>     irq-gic-its-msi-parent.c, drivers/of/irq.c) to correctly use the new
>     struct of_phandle_args-based API with proper of_node_put() handling
>     as per feeback from Dmitry.
>   Link to v9:
>   https://lore.kernel.org/r/20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com
> 
> V9:
>   - Updated TO/CC list based on feedback to include all relevant
>     maintainers.
>   - No functional changes to the patches themselves.
> 
>   Link to V8:
>   https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V8:
>   - Removed mentions of of_map_args from commit message to match code.
> 
>   Link to V7:
>   https://lore.kernel.org/all/20260210101157.2145113-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V7:
>   - Removed of_map_id_args structure and replaced it with
>     of_phandle_args as suggested by Dmitry.
> 
>   Link to V6:
>   https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V6:
>   - Fixed build error reported by kernel test bot.
> 
>   Link to V5:
>   https://lore.kernel.org/all/20260118181125.1436036-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V5:
>   - Fixed Build Warnings.
>   - Raised PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184
> 
>   Link to V4:
>   https://lore.kernel.org/all/20251231114257.2382820-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V4:
>   - Added Reviewed-by tag.
>   - Resolved warnings reported by kernel test bot, minor code
>     reorganization.
> 
>   Link to V3:
>   https://lore.kernel.org/all/20251221213602.2413124-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V3:
>   - Added Reviewed-by tag.
>   - Updated of_map_id_args struct as a wrapper to of_phandle_args and
>     added comment description as suggested by Rob Herring.
> 
>   Link to V2:
>   https://lore.kernel.org/all/20251204095530.8627-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V2:
>   - Incorporated the patches from Robin that does the clean implementation.
>   - Dropped the patches the were adding multi-map support from this series
>     as suggested.
> 
> V1:
>  https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/
> 
> RFC:
>  https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/#r
> 
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
> 
> ---
> Charan Teja Kalla (1):
>       of: Factor arguments passed to of_map_id() into a struct
> 
> Robin Murphy (2):
>       of: Add convenience wrappers for of_map_id()
>       of: Respect #{iommu,msi}-cells in maps
> 
>  drivers/cdx/cdx_msi.c                    |   8 +-
>  drivers/iommu/of_iommu.c                 |   6 +-
>  drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
>  drivers/of/base.c                        | 213 ++++++++++++++++++++++++-------
>  drivers/of/irq.c                         |  11 +-
>  drivers/pci/controller/dwc/pci-imx6.c    |  18 ++-
>  drivers/pci/controller/pcie-apple.c      |   6 +-
>  drivers/xen/grant-dma-ops.c              |   5 +-
>  include/linux/of.h                       |  30 ++++-
>  9 files changed, 237 insertions(+), 71 deletions(-)
> ---
> base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
> change-id: 20260301-parse_iommu_cells-1c33768aebba
> 
> Best regards,

Hi Robin,

Could this series be pulled into an immutable branch/tag, if it doesn't
make it into the v7.1 merge window ? There are client changes dependent on it,
So it would help to get them moving forward rather than waiting another cycle.

Thanks,
Vijay
