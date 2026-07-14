Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8B93EB7F0
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013134; cv=none; b=TkrZoXxWh0A10xm04phs8CmP7dfY8hAo1t1JrU5BlBo6vtn0aZ7mjkIxiIY035Ac8MS/bt5s8CYUAt2oxDd3uCXadsCXVrF1GnYnP1qsfBjYybFBfO8V//SyTmJkBUxMWsKdBXXYKLurB8YzD4qmDDtfpj7CcUPWFYVXm8DkP6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013134; c=relaxed/simple;
	bh=Lwrlcw71vgTAamdXcmg82wNsEkfj5fJ+XFI5vf57VMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tr02/QwGu+spWpxbR3QuOH+aRq470/nFOtxFFhPshGz4dYugyuAlZM7cqk06MnPCM5CYg0Bhlkevl7R8oVJ/1+FTnZ0kvna71AlmhtLYSZuhU5d+ln199UG8+N+8Qc6DHJ++D4twMwI06RibfOlEJpnmwwG98WRsl7Pm7Ad3xlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKLwt/Yd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1mmc/+F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKLwt/Yd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1mmc/+F"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SQea3912687
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qhtQcYZdRgQ9G3QLEHtqpERI
	w8uiHWgJf71rUZ5DikY=; b=aKLwt/YdsdYYrDNKbAFxV3961OOF2l4AW9c2sc0E
	2u+V0niDeaXir8atiEKu9OCQMbUcfUHt87mq/b4fl2Lhrff87dkXWZpTXGPiHF2C
	oxWFcque+z+guoQ21kaw61GCiup5IJ/B75pIuWA+CVzrW0koj+t+Skh9bxunPIn4
	amcZdMejBRwA3O5tpGVrbyB2VYfyxcMK0h6YomZQGE4suhWBfZ+WUeqfLpygjlZQ
	AQQCxxh8RzZ4bFcGh9bCVo252CyHA58oa22MgNioeKHFkZSZYYOF9swkqMb+fRrh
	gh5K7fjWlC3+NsaTARaf14/MBOyzLgNp2OfRq5MA6p24kQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdeu4gf4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:11:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so5981055a12.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013118; x=1784617918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qhtQcYZdRgQ9G3QLEHtqpERIw8uiHWgJf71rUZ5DikY=;
        b=Y1mmc/+FPb0G5omOPuObf2QVEctFMk3YgFwOpONCzsWI1cBFP649VQimLBTU1m9mxx
         eFs6HlFACtvxDIp1Y/HKPhVvsnAA9o8Q5ozAT/0XBfXkNe6vN+oWc6GzuhJdS1pgfL6P
         Jo8ey2ujqsVAnODVTgm+ghzpuLappFHAFGddN/XeQmUu65uJEBOkz9ZF0NnH406Q1rhv
         XvAuTnnaATBpzsrgA4Z2im1MYSHJ8l2zfdPij6K31TmOp1qTFbGZbt9iQwcYUiMdW/WB
         gVfGpmWNG/d7ZpKkB5/4K6son6fGoy3NZGpd7K82IMvDYI+2b6WFSPRPIrtZK8JaR2iK
         lIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013118; x=1784617918;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhtQcYZdRgQ9G3QLEHtqpERIw8uiHWgJf71rUZ5DikY=;
        b=dta+3Ez8cdTiUI4vIGGyAldVNaiVUaY+riPgRpDn/czb1//WhgLXPPjVRnYIVCqs+w
         fmP38d5lRXdpib1xTCM8p29V1O1Uj+jDHMOTRHnqdnPlAoPz19912PxtCC6aGuIoZOwL
         EfTkFg6hFkStdLiHqCyRID8QzUPQbmqb7RQ+vinsj2tzqjOA1pvwZ6PRdAulH1QQYmef
         mk7RTaPnb9UM5fN7N3YySu9JPklYWMTwQVGVHRJcbRibDJYMs+uIPn72u3A3jzYG/ALT
         mI5+l7S+tR4gk3DSnPYeO6NqH6IueuincdvLY1I47s6qj/7yCvUHxTr0BaU+DXAry8QV
         X2Vw==
X-Forwarded-Encrypted: i=1; AHgh+Rqja1YB04JCRwceCE/kSuVTgqIxoQV/vVi3gKv4kEpLLsztAAaAj5MAozz8rNkEuauH82pVrSY5Fp7a@vger.kernel.org
X-Gm-Message-State: AOJu0YwXjlvB8GDq0+bP/+HBBUG2yopm7STwaKoxBBw8rs5IWfSQV0Gm
	zUk5/cUdLMq1/lHZco0v5AT1txEgNAvdNrYtCrIS9/i44TSoWK6EFeXpImbqhW3N6RgbdBfaKcf
	BXuPfDCxnA1sFpc7bCxZbm8tdD8UMDKi608jGxactRz0ZA3ekaV9HDXGY4wJNSqbN
X-Gm-Gg: AfdE7ckagg3XBCnm7rvSwGoZNrE4T4xAPDllqEo/nz5W9FYMyU6ttweah/tb+0NxNiB
	SOjxWq0v+CYvWlpSpISTuqIUcZb4rRSKmIhEu9pEJPe6Qt7RWvtOt0mlrM4+5p9U6TBlUJsTLw2
	lQV8IXmg8v06OFTnCAINmdUHt/2GEXLB8JtQVl/L1QvS3ypOeXWq647SRX8JmzRy/y1RodIMe+q
	FgD8I1wVwp67fswMQSwd3FhFliCi0njSNlMgcsEsxA8Z8UD6gxRNHTs2mHYkfySkyOXNZiEU6qI
	YbiZKg9TXgsLsXUNoHhQlXD4FJALGl0daZLtffR9ICFr0Ovvt1NN6LcEAYkPScF/CKkbWSVt2Hq
	u3uFsRtVXsEjElz3SUUs7+IeLQ/agPSZxJBoURA==
X-Received: by 2002:a05:6a21:9a4a:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c3570141a9mr1460419637.24.1784013118373;
        Tue, 14 Jul 2026 00:11:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:9a4a:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c3570141a9mr1460363637.24.1784013117782;
        Tue, 14 Jul 2026 00:11:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9081d5c3sm26728942c88.9.2026.07.14.00.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:11:57 -0700 (PDT)
Date: Tue, 14 Jul 2026 12:41:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/2] arm64: dts: qcom: kodiak: EL2 overlay for
 qcm6490-idp / qcs6490-rb3gen2
Message-ID: <20260714071151.kol664rhv7afjnus@hu-mojha-hyd.qualcomm.com>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
 <20260713160754.1250988-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713160754.1250988-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AMXSkRVzAJmDDB87p-1hI1jw0hPqPiVZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3MyBTYWx0ZWRfX9asel1+ZOEL2
 AV+gi/cJVmjOFkp6OzvXHr9wVSnJGfTkGmv4DGrsesEG2rOYLPMx8bLIHLmSp/1NVRn24x0oM0M
 pYaOdg/cuo114eV1QezUoN3m8ANDhY7MMqyGco1iiuP5O55ZUrwVA6nAXRtrae5IDm5Nbyx0G3M
 96ti7y408gE87Yexv+8BBpXUFu6tvHrVg8ruxU35tEwo1DhBrXY4b4HvNxJiqg+nhhovGpILFlw
 Yzbo7kAGjfori4dTsHxlL7HuuV0totES+b4QTNQE5EAMJ7bDEeAdh3okhJoSLZnhOADldsprBvq
 dzYa4Tpyw2+ynfYA3yehbM/JC/oH8mtQmNyd7TuXUJYfbqPLutCSWBHf6GoL4krG4Zm4pqqOYU0
 2WWRi5DJjxaQktaLcX3JJJxdzlakaZ7QLx5lz+OsElZZBZU1KkuIiBDprjNWYFNiiN5ws+UIQ/d
 dNfJMu4bFczUDRZzlbg==
X-Proofpoint-GUID: AMXSkRVzAJmDDB87p-1hI1jw0hPqPiVZ
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a55e13f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QLVsefW0f3xFOmyi1IwA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3MyBTYWx0ZWRfX13zHWsRr1Tnr
 nCZfvLbofRYHgHJOF81XwQ6WiQNAyRnMLiFI12nN0AbfndDgvSo3gThyo7wR2JQmNZQ9kmH1i9C
 0W4Pmw40qQDzrQA5aDWP7L9kAgx6hR0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140073

This got messed up and went as a reply to v9. I will resend this
v10 as RESEND again. Sorry for the spam.

-Mukesh

On Mon, Jul 13, 2026 at 09:37:52PM +0530, Mukesh Ojha wrote:
> All existing Kodiak board variants run the Gunyah hypervisor, which
> means Linux can only boot at EL1 on those devices. It is possible to
> boot Linux at EL2 on the qcm6490-idp and qcs6490-rb3gen2 variants;
> this series adds the DT overlay that describes the IOMMU streams and
> other kernel-owned resources needed in that mode.
> 
> Patch 1 is a small independent cleanup of the two board .dts files:
> keep the wlan_ce_mem reserved region (its /delete-node/ was erroneous)
> and drop the redundant wifi memory-region override that duplicates
> kodiak.dtsi. Patch 2 adds the kodiak-el2.dtso overlay and wires up
> the -el2.dtb variants in the Makefile.
> 
> Changes in v10: https://lore.kernel.org/lkml/20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com/
>  - Split the wlan_ce_mem retention and the redundant memory-region
>    removal in qcm6490-idp.dts / qcs6490-rb3gen2.dts into its own patch. [Dmitry]
>  - Drop status = "okay"; from &wifi in the overlay so platforms
>    without wifi enabled in the base .dts are unaffected. [Dmitry]
> 
> Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
>  - Instead of adding wlan_ce_mem back in the EL2 overlay, stop
>    deleting it in qcm6490-idp.dts / qcs6490-rb3gen2.dts so it is
>    present for both EL1 and EL2. [Miaoqing]
> 
> Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/
>  - Added a wpss copy engine memory similar to chrome for Wifi to work.
>  - WPSS does not have firmware Stream, so that was removed.
>  - Added wifi streams similar to chrome for wifi to work.
>  - Removed this patch from Generic Pas patch series, can be followed
>    separately.
>  - Moved Sumit as co-author as part of modification done to the patch
>    in the past.
>  - Added some more kodiak's board variants in the makefile.
> 
> Changes in v1-v7:
>  - mpss was disabled and will be enabled once the dependencies patches
>    get merged.
> 
> Mukesh Ojha (2):
>   arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and
>     drop redundant wifi memory-region
>   arm64: dts: qcom: kodiak: Add EL2 overlay
> 
>  arch/arm64/boot/dts/qcom/Makefile            | 12 ++++++
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso     | 39 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts     |  2 -
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts |  2 -
>  4 files changed, 51 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> 
> --
> 2.53.0
> 

-- 
-Mukesh Ojha
