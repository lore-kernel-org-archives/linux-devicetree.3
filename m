Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC1A37CD3C
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775078350; cv=none; b=saKG1f0xh9Z2QCI9bia7g2ioCB9/Jg62frw14sZNPaHMmQAGUK+HJuchBER8CPuyWpCe8zfn3AtZk1AeWQiuEzDHIXLwr6OoN5q3+cpDccHgof+QwiWX+4VCYmbgNWO495EhLjRS0tsvJWE7dR1RcmADibvotb09qt0/3lYSolE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775078350; c=relaxed/simple;
	bh=fEaf7QvQ7wRx+uSbM3zknmsCAP/jjVCTwNsQ4h7pPDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kmogMJbF3Y1Zsk9UQBSSP/H2FlGCwf5mbS1FKQsZ4k4GttQOGEH7cbd9a5gp5gkO4NSJ3q8/0aFPz4fsxbspJ5RdAUkiB8GKQjrINLMNq7/EJlzw7zHvMM/nSx7pG/FlrP7hjY84nUTzp4qyhzLzF7z03LYjdNZyC0bEmM08zEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HG6A0XHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDhOfGDj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HG6A0XHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDhOfGDj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631J6qJq752282
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 21:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFIuY4/3MQgVWulfNuG870ap3FwBWrkYASAoWuf76ww=; b=HG6A0XHgM4NikeWw
	iuQ4XvQ/3a2P3x1LZcqrAKSUezJhEAH4I3qnlwSeX924GFzDH9XVZiBSyKJg7hOc
	6t+47w1hJXPxqtN6QPksN5ErCpENlVZ9YkxPwk82hHPMGDk+K+9zaJ3HlPGX0XCY
	ZMD4ggJ1YIxSyKQ7cypdcYMMF/Vz+PQpzrFED2CCNWUzc/EjWuYh8ssFWVWg9DVo
	oEJVKezHZOUl49KssKIVDmjTfPqtf+6jWG0A2BlOZ596OslQsxqaDtRSfCm+A1vX
	9CrDqpK6Y6vKOuVfYR0wC7OFCQBc6kgxt8pA9erR8vjTWqP4RoHoVS4BE2X5bVrm
	PJctWQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9916e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 21:19:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c714cb672so96553b3a.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 14:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775078346; x=1775683146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MFIuY4/3MQgVWulfNuG870ap3FwBWrkYASAoWuf76ww=;
        b=hDhOfGDj1d/PqzNvHqJiq2qmoRgv3GF6v5H1HY8EMLOc/1Vnf0EyfpD55whEullIvb
         JvExKxDP/isT8X+y6GvbPfcW9cPOiPxQ/A5tiPN93cg+mzLm7PnMc6Ang+/E4/UugOUs
         iivn/nDZldrTM4JEJVbVWGBllOKAOGDFKFJKRUWrTYK1DBSPoZ6kBaEK2ay+V9M8CvH9
         y3YLL/6wI8QMxLDcMrcftBpmfawnKJTCk/Mwh7HmdEwf0Lg3KtS07jz4KBfcnAK0954h
         YLudOlsd40mJSm2mZujdXNkOKayu77nGyVGolFyNaOeKmp9wGRVv5VPgoOSK2JOO5rmh
         3LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775078346; x=1775683146;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFIuY4/3MQgVWulfNuG870ap3FwBWrkYASAoWuf76ww=;
        b=Mjjbgz7FLC1hIm0odIoVVkuRmZh3GGsBhWHEQ0JnF2vhjAnwvz5msuzmjnxxUGwUD6
         fTCRm4Wzu6+d9rvZp/gE06M3EiTQJ4RV2l+iaxHH2TU/MlWtJBleevbFu3X+7zIPVqGM
         WEfGqZZ9r1h36L0niuixedrScI3mBxtP05+GJWF92FtPRorXo/6YFjq4nDnhiU+Bv039
         P3iuSI3w6wHp0D8P5YMQbP2Jy3CcOE1t5dnsBD/WhGDZf/ARkswl335R9xUDJLDJOLTk
         YJUVvlw41Uhgi8AVCIYOvcWKbamEmhFupsJhJJig024zUbncQDT/3+aaEzKARgANriQQ
         XQpw==
X-Forwarded-Encrypted: i=1; AJvYcCWWFfneuJPj8PYhE/bvKarRpB/1BdJToH+ypEmvaqRTvg2k9+ojPvJKGwMwQcgcxw8wdAI7zTLb8ic2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy46DAF24FZTOxZ4nbZasMza1xn2LKHfr0tPnJ5lYvPKlUmgPtU
	lcI/Rz6O3Oe8Ix1Fx9WvWTW8TOcuCi4Zx+3uSIB4PY09PMSDq+h73rjYCOZA1XHi5WPA9Cgfjp0
	4l/4+wtvwrMnipAW7kwP+POEHbqnXFlsTrbYi8WVJx5PSUWh5UfWUSkSTosmbDRUa
X-Gm-Gg: ATEYQzzulmYk+nl/7Y2kOaEq9CxUDQHryklhcsXZB/A6C+Oc5/6xkMPFytVykPpHIPj
	GVJEmqBYZKUda8Ni1MnzREBplzrxmD+FngKP3raIdRg3TY/jUeUXj5rR/oxPyBIY8yaZ74B/YZC
	+xdnlV/18mtQManmQ7mQ4wCkoqRxVdoVbvbb6SER3nsPWCv/5FUWf/NvX/09ciKD93grP68qrRu
	4kQzA5ThEFInuEmazDoEgKZg+SC+Y/jqXDafZpduhjtaWvJWpzHUjbxtLhjZco3xbIIHDTSkWp2
	Or/7EouA16lsveOXlVGL6+gutobdvAUS9Izk+zTB5xyexJB1xxcJKzJ0kkqT+jdbIEeGiuK71CM
	WN4e+n5YgPYN+eOM6S6xEZpldlUyCtM9G7TvtYTmgYkyv6w==
X-Received: by 2002:a05:6a00:2d98:b0:829:8942:2ca4 with SMTP id d2e1a72fcca58-82ce890ea64mr4893832b3a.19.1775078346163;
        Wed, 01 Apr 2026 14:19:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d98:b0:829:8942:2ca4 with SMTP id d2e1a72fcca58-82ce890ea64mr4893811b3a.19.1775078345645;
        Wed, 01 Apr 2026 14:19:05 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.231.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41b8dsm776662b3a.34.2026.04.01.14.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 14:19:05 -0700 (PDT)
Message-ID: <6a3eb07c-4771-4e4c-a4eb-9bdab874c0ad@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 02:48:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] Support for Adreno 612 GPU - Respin
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260312-qcs615-spin-2-v8-0-fca38edcd6e6@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260312-qcs615-spin-2-v8-0-fca38edcd6e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69cd8bcb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=YUf46QchBRIYdusOZX0V1g==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kFibZDKCZPP84u6MAsYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PEHqb4jKOeVZ1gZsc7Ss8N6vYlUjQAiM
X-Proofpoint-GUID: PEHqb4jKOeVZ1gZsc7Ss8N6vYlUjQAiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDIwMCBTYWx0ZWRfX7zQFJWrw0E1q
 rdmBCjp93kjLFH/0vYFqKT1nU+RK4zXOM21Cc7KJo2y4Gvr7Bkgi9QmCWHrnM4pxV64PoYgKjoQ
 8egbxJYP2N5of09seVRVF7v8Qkyntpcfj6G5MQSrGtxR7jgd3Z7xuBSB2DpIE6UfBzM2/wEJgBp
 QdkcSULeRCH1eR3hiV87vRI9oVIqXcha0bGWCw8c27lZXXwIZclD1ct5XAKBV4RvSnRN2z0NJsz
 xBZg20qVE1XqG1rwwSFAnDsIoNbwJmKxgR7S21yeE3GEkZMTZZIB5ovX9QYGoWHxBK1gWT8YM5d
 NvvxH91bEdIvdx47w9dAE8LZTkAe/528nIio/pFLmnDDaLz++YTiJ9ZGcjqBSimSotIr9+gGVuR
 QfjIZypooVlfsEUlug0lvxfx3ruaVggX8qSyNlHgMj1uOn7iiaKmaErO4m+sXLQgWfOGeUbn3Lg
 yrafuiUgGts7kphZvVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010200

On 3/12/2026 4:39 AM, Akhil P Oommen wrote:
> This is a respin of an old series [1] that aimed to add support for
> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
> have consolidated the previously separate series for DT and driver
> support, along with some significant rework.
> 
> Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
> down version of A615 GPU. A612 has a new IP called Reduced Graphics
> Management Unit or RGMU, a small state machine which helps to toggle
> GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
> full-fledged GMU, the RGMU does not support features such as clock
> control, resource voting via RPMh, HFI etc. Therefore, we require linux
> clock driver support similar to gmu-wrapper implementations to control
> gpu core clock and GX GDSC.
> 
> In this series, the description of RGMU hardware in devicetree is more
> complete than in previous version. However, the RGMU core is not
> initialized from the driver as there is currently no need for it. We do
> perform a dummy load of RGMU firmware (now available in linux-firmware)
> to ensure that enabling RGMU core in the future won't break backward
> compatibility for users.
> 
> Bjorn, I have rebased the pending DT patches on top of arm64-for-7.1
> branch to make it convenient for you to pick them.

Hi Bjorn, Gentle reminder to pick up the last few pending dt patches in
this series for v7.1.

-Akhil

> 
> [1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
>     Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v8:
> - Rebased on top of arm64-for-7.1
> - Link to v7: https://lore.kernel.org/r/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com
> 
> Changes in v7:
> - Drop msm driver and dt binding doc patches as they got picked up by Rob Clark
> - Update interrupt property to use 4 cells
> - Rebase on top of arm64-for-6.20 branch in Bjorn's tree
> - Capture trailers
> - Link to v6: https://lore.kernel.org/r/20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com
> 
> Changes in v6:
> - Move the rgmu register range update from patch#8 to patch#6.
> - Capture trailers
> - Link to v5: https://lore.kernel.org/r/20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com
> 
> Changes in v5:
> - Rebase on v6.19-rc2
> - Make the reg list in A612 GPU's binding doc stricter (Krzysztof)
> - Link to v4: https://lore.kernel.org/r/20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com
> 
> Changes in v4:
> - Rebased on top of next-20251204 tag
> - Added a new patch to simplify gpu dt schema (Krzysztof)
> - Added a new patch for GPU cooling support (Gaurav)
> - Updated the gpu/gmu register range in DT to be more accurate
> - Remove 290Mhz corner for GPU as that is not present in downstream
> - Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com
> 
> Changes in v3:
> - Rebased on top of next-20251121 tag
> - Drop a612 driver support patch as it got picked up
> - Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
> - Remove reg-names property for rgmu node (Krzysztof)
> - Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
> - Describe cx_mem and cx_dgc register ranges (Krzysztof)
> - A new patch to retrieve gmu core reg resource by id
> - Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com
> 
> Changes in v2:
> - Rebased on next-20251105
> - Fix hwcg configuration (Dan)
> - Reuse a few gmu-wrapper routines (Konrad)
> - Split out rgmu dt schema (Krzysztof/Dmitry)
> - Fixes for GPU dt binding doc (Krzysztof)
> - Removed VDD_CX from rgmu dt node. Will post a separate series to
> address the gpucc changes (Konrad)
> - Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
> - Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com
> 
> ---
> Gaurav Kohli (1):
>       arm64: dts: qcom: talos: Add GPU cooling
> 
> Jie Zhang (2):
>       arm64: dts: qcom: talos: Add gpu and rgmu nodes
>       arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
> 
> Qingqing Zhou (1):
>       arm64: dts: qcom: talos: add the GPU SMMU node
> 
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts |   8 ++
>  arch/arm64/boot/dts/qcom/talos.dtsi      | 149 +++++++++++++++++++++++++++++++
>  2 files changed, 157 insertions(+)
> ---
> base-commit: bb4d28e377cf04fbee8a01322059fa14808cdfe9
> change-id: 20251015-qcs615-spin-2-ed45b0deb998
> 
> Best regards,

