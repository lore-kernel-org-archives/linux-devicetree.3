Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3335847FB09
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454760; cv=none; b=dmoG/PqWvET//meqg99fxdxqdoBNrfz1CN1LsVdgsVJ/7qG2V92aa5CldPL9n1taW1FB4niUGgw9yDxSjdXf9qFPMFBh1yR7nwbwZiuNLKVaySncwVxfyjYyHrwwvFfVlOMaTigQGuI59HIRQUeuzkL5mWi/jfUK3g+OUDyIG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454760; c=relaxed/simple;
	bh=S03LwFerT/ooRJg62vlbHpT5llQgKvhDDZxiJuNZIBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRoLAYj9PNdG1htLFqisWEUy/2DAcKYG0jvRZwEKcUJfVVwb66IsERCcUzdjL8t8rfq1RzGiVeScYhhgwWjNgQJ2xayCbkSWIHg5vRGDU1KQ71rwKRngWootWgDeTR6Gle6fAfAukysHJAfPn7U0hjaiq7Oo2onfo7v1hLJ+7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+3VWlVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hibD6EP7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+3VWlVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hibD6EP7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KNQl2167091
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 10:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g4FJlDdpi5DxKcM79pJauxat
	KMVB0hxE7B8PqzHViqg=; b=C+3VWlVKU8pC8aZKI2i/yFCj6wao/v7/U1raJzw3
	R2mf3ukU29ZVVludR0ZAtvmWK7u8YiV6vuZKoz30dMu0QbpwZ69jUFOBSXs2CI1s
	lZ+51hWpfOgiSeGLmY+Ie8mVP3AlB351/ozRiOTOeV1dx0P4tCSyeDH+rsuRF6vk
	YQz8XIg1CyAV8HPkHSr9L8IUISWfSq2asL2es3cXxg5pW2t6+dUouijLHDymk2AH
	5M3sZSz/Ww0Ja13znYoDX+BmNkcp2jSppLh82NDNS0lBY1wDdGlfFuiQc9YaPh4K
	tgF6JJriwAJw0n09SkhwdPiflZHPHhsxuJKHIwX3VYp4yw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2thf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 10:19:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c124d17880so884303137.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791454757; x=1792059557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g4FJlDdpi5DxKcM79pJauxatKMVB0hxE7B8PqzHViqg=;
        b=hibD6EP75Bt9l1p2vNVRnWBbNde2un5e8tHdr7KZL95iVtNi+G8en5OAkKIvwjk1ds
         myByIRZnD6FqUgrCEusRRNQJ/bm1HeOVTFslL2tPpHjf6K3hM4PimdXA/6R2MwwetSwR
         QKt3iOkkWrQ89WDwj2RAwKTKefhwv15LOQiFnm8E8VF+Z3wvf9M77rq2j+adJeERIRkj
         FfxMw/5OY3OoQQeYySECplCzyle2+jibtMsT36/y4AuyjuHvX/eYO/DDoia5VNNOHD43
         Fxjmu+pAHSiC9NmobSGzpUbrWMEzlfOzfR9AXWbGqncUj9YnR5LrEq/8LfBMjMES/pA6
         vGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454757; x=1792059557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4FJlDdpi5DxKcM79pJauxatKMVB0hxE7B8PqzHViqg=;
        b=gWgnvc4WFjWMWDT81T8nN8184ifJChRSggOmQoU2daypTvf8Ve+YnHrz0omvCAyiim
         4EGpOdG7xyk/NdXdJO6oxE2ZmQkxHyL9vSWO82gCJGy1keUNKESbNbYlV1NhEjwLOiYm
         RB77uKFtuNr7XPWAFNwYYNOquwZ8xei1nA34Tuf6yrl7EtsyuZc7oYbzPPHvtoAF32qA
         cqGdepoQhulj18N8zxUxlpVYlxAVdbpA3ALrK3jnNy/T2qa57WaYYzTgw0xJw+IfosCZ
         dbzpfMsebU5ut72G7wXhp/4QDZDtvOAtVmPYGYnXQP+PvXje1h2MZQZE7StaSiizmNv1
         8fHA==
X-Forwarded-Encrypted: i=1; AKwUvBz/mwAETrnw1xxymI8LWe5WJ8AwxRCBNAzW81SgE2gomiW+ZPo/jyN3xN2YFARGJ7JzmoSIOuJPgIjW@vger.kernel.org
X-Gm-Message-State: AFq9FYLX3H0HRpnj2gF5g1dxK6ZHanoLOPYB4XNGAL9GuaZM2hGKgWdX
	o9AkoTaedlITETlC7ppLv1pm32FEmKu01TjAtcoygAZxdpZ9hmjUT1zLxyt3NwWQSaAZy2eXniF
	S2Mp0KHWHBi8MZ397AL790oW9LHqVlJguhyeJmEC+L1q1mF1vsTLUIjoKW6wcZBFo
X-Gm-Gg: AYBFou2qgI04hkHTVXtBrxmTMNyEICvuhj74AogDN4c23SiCJwOH3kkFspRnSpJ3QIC
	B7NWsSAJyFUmZRgFDFsuNF+h6HFIqpFg0UReyOzKQlD8I+3e4/tgicSgdv1axFCwCMPHyBnmJzl
	0OKIwxB3slu2QHnezLTpMDdzV5p/GzOibQ6ynyfdmC+RWHYUBsjGmVvgmmxJNRnPz6VgMVDVcrb
	GjkL2ED0YMNNWXRxy0ZXbxFASLk2Suwe+vtYH6RI3l/UZxC7VWJZzpTKwe3WDemg+Zb30aGg+cw
	J5GsgDtPXN2rl9+64hRa91Y7TsuAuREmTqiEWdWLyvXoACjxfcmrVSg8mOCGHCUZmWPiKocyJSY
	wdzpDWWMz5UxKMfw3tZr/B+V0h4ojv00rl3HxPX1KEO0N8o1tov60UXxFM631HQsTr9nmWKQsm/
	7iJhOX9A29cqCJ
X-Received: by 2002:a05:6102:2a5a:b0:7ca:e2c1:9a0f with SMTP id ada2fe7eead31-7cae2c1a9demr135544137.17.1791454756343;
        Thu, 08 Oct 2026 03:19:16 -0700 (PDT)
X-Received: by 2002:a05:6102:2a5a:b0:7ca:e2c1:9a0f with SMTP id ada2fe7eead31-7cae2c1a9demr135521137.17.1791454755764;
        Thu, 08 Oct 2026 03:19:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d65daesm15254111fa.20.2026.10.08.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:19:14 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:19:12 +0300
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
Subject: Re: [PATCH v5 10/13] arm64: dts: qcom: lemans: Add Iris context bank
 subnodes
Message-ID: <4l4rq6uz5f5tfdajn6k2rhbbrnkj34rjezxbhgyttvs6yqeqiu@ok7s5hzitxnl>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-10-0322ca5dc10c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-10-0322ca5dc10c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac76e25 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: UQ_MmdOkp6goqDvFgzO7GX0sPE2J8emC
X-Proofpoint-ORIG-GUID: UQ_MmdOkp6goqDvFgzO7GX0sPE2J8emC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfXxXj/iP4nyCDC
 B0YC3Efq1F8zflLVhHVlaBapzEtsJvlOMhTByCjywxvVJMfYzX7ShgmxcCpfKDFk6YlXj/ByWzE
 l7Xx3YPk/PsZvx7GgVqJH6FTifVdeDg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX4jLcDL+LykSA
 efc6qnA/kGYc0ycaWzEbUs9JDQ3YR6XRndGbiBlCTtPQxnnJuFeZ/MZdo3EOWysx8feYKbA18Lw
 wwsVDuThdBk0PJTVIab8pF/VCR3IB37GyjpRqnCs2ZIBVAamwNpii//Iw/+9ZSzibWY0zASs43P
 /FMITJ0gcy/8l5xqfidlAAS0CZACVus5gtrFJeN65uR0CvkAi4rGe+YdG435BBdQo0r42ZpDP+A
 r9SSVlqv8zq0Pgq5CZ5MdhtiDwPZinf5DzxNoRc12+WwmKROV6u3eLrfIbMZNALLapgLmKUyv18
 0PkYPw/s0DXjjwQGKLL8nmEMmi+Zy91rMYZIFk146wM9vSmOezIfqYjVE8JPxq1aamvFJlR+FqP
 shkb1PrMRJQYCTg7TINtdsm7bBFAXwn5SAXES9gipYHOhzMd+cYlYmUB9jRFnHjYtG+n9nyQM9B
 qlIYBEa6Nr7UdxZZhlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080040

On Sat, Sep 26, 2026 at 12:04:09PM +0530, Vikash Garodia wrote:
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
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
