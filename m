Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6E536A35C
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687002; cv=none; b=d+2zpb4fWXiCilHlnxKLIk08dmsKwwDnS3DlukushuG2Fxu0I//YKj7uKdPOoy0nWcr/EgyfcItTUnFVmixyy9/UfFlmpXmRWAJPL3i8bnl280HrRUeGtC0kaqa52wg8GgOvsvn0uBKAcTLPM3GO9xagQJzH+/eTVH1YWE2y5vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687002; c=relaxed/simple;
	bh=GZxYSfE4fIDtRxdjBvmjABfjxCxc7sJWSoAYjE6KcOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LC/y++Wzk4Hb9I9nFDbipn5ZEnL0kO+myXmYNWDRcaz32KwYtv/dqvtHyrFBVkboCRXKciJc/91pJUrWuKCgwFAh9lQzSL5RynS0GzlJcMiJbAqnxte1IcIZkTd74YQeVaMOEUs+yhi04G2gF2A2VNeS3wUQFoFHOwbh0sIFMZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNgb6CGJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gblIouv7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNgb6CGJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gblIouv7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM9LVW962605
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JYOeB9wXREvb/kPXlH/uSBNj
	P/9Wet3bk3Yudk2xHjY=; b=TNgb6CGJ1Q0zM/RkqqlO050O65PgXwERKDt8KdQH
	HG2zEfeMv9xdcLl4NAknubrRRPHSLUzNmEP9U6pqJ95hCaHPyjibqiXsSKOo5sbL
	cGdaN+Z4bq+WYnT/zT3immPtN4qTYkqW/luUFJJQ3kBb3rSfgGL9X8uEtX7UaNJF
	zAzt4+8XMg/2tFwVnZaqyq6WgnbNRvf928hV1p0g45fP/Xaf9+nty0xC0UdVtEQP
	xi2MX8a+zibiz7K82RGUnvX/LoVPSeQFvhzoQExiVTCFc5uI1Yq8c9luG6lcyqFa
	QbmXJCb8wV+D400Pli12Cku4keg5bts2SAbjDXLjqJFQZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27333rr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:49:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e9c9d635b0so56978416d6.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 15:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782686999; x=1783291799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYOeB9wXREvb/kPXlH/uSBNjP/9Wet3bk3Yudk2xHjY=;
        b=gblIouv7fLs8xlJc9GyzdJE7plsmwDKoXMdyLwv8NJkSdfaJV4PJ50R0Vs1ryoxO73
         E26kL6bbMKNLV3kMrsFwM5tdgrTGp78xZRu79ORb9hFmfbumNpT0NKdVrHS8Brwj/p6+
         nzZ2HBG88h1NzUUKnbZ+pvqBG6YepQT8SNKIFIvzdc26XWxOTgGOIIxuvbrPJxnWvfX/
         q2Efiur62SM3dwxQ6hTpSOmICjqGwUOZGHyhmiPnTyOgwHFZuGrmZndv8gEG3Fhj+YXi
         JA6ROWfcS80bxaLYCWsslBCLgOLIEzoMBFkgMtc/SDeG8TdKf7kE5kWxnPo2XC9m7Xck
         8vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782686999; x=1783291799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYOeB9wXREvb/kPXlH/uSBNjP/9Wet3bk3Yudk2xHjY=;
        b=GmhEpeHWUO5eXdryWZm1HZgJthq/s1tNa9u+foqVioaM9R0z7TZV+NmEashqjSO/4N
         1p5XqZwgjOVl081xkdXvyvlpH6zWV73us/aYB74l8XmB0WUvLK1mEGFsNI5/aks/QyhB
         0v0il0d7XvNacKlFym9zBH/+tQEpfX9NkzsrO8b8zy2TgpvCRdYCenTb8jIt4Zs2ZZgY
         FX7GG4ebRe++sVnk5+pwa47aO7MriTrEzPydqa4dtZN1lNgabO1rusk375efv6AT8Toj
         H23+MY5UXi2JmuNU+mx7irclf+dQ4LW0x8e7OXnSZNd2kFmhFIT0F7msVY20UmG0R+I+
         X0nQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ExoekhQjxwOEAtTA6UuhrdTM7whwvoYJC3hvpmIRQJXV2l84AwlgywDjM92zfWCuElcZWzqr5sS5s@vger.kernel.org
X-Gm-Message-State: AOJu0YyhoIoFyvY8TuWzRnRmKFMO/ZbA50hGYKFblfsbKOVt3uRchRu1
	+Zx3PBJ+dkOVgE80nTXRD8k+0gpB8ewzpTZjYfMWnA1liM24FRSNb9w4U+mP+gtmb6gsvLEGhL2
	4BeTL/Rj9f6k5BGUEPuKKBSskXCeCO6CayRE+DsXW0Rl4eaEOfNMneHd2JD30j466
X-Gm-Gg: AfdE7cnSOmC1rE16U6WlgBQWuu8ukZL6xaG96paUBNAGxjp9PmH33l2wQ+k+avo1mAE
	6F/Fmu8neU3bN4mXRPjmayIXdPc49MfKf6XL3xr525IEqWu2jKFaEQQ98vUFKVy9SF4zVUKVJLM
	VyOWADIojqZYOZ6Bq1VZSSezYmODBi7eFqhIDKrM5W6PMqj5xCJzyUXb3UlpRmYiONdCKLgzHoS
	+hEM6RXPzAqndjambmX0g+Dtv3akNlPGEPDCR1ASW0nUfnUGdzQjYMHi96J5n/KgfmJH4IOTY7U
	uX6/50I9aNYzHUHXJVqiPqDJfgv88hOs6DuJcyIoFUbFyUh7qtCvCL3Pvn5UwqTHOrJm3vWjO+W
	KnF7ZFpcU/r7BZzEjtwfK2GFPnzlRh5TDQRv6GDXtgZ/tSjPnvV7fIXtvWYlK/tZaK9KlHZcpWK
	muxRS7uCAlnKMeEjx8sGb/lyX+
X-Received: by 2002:a05:620a:19a8:b0:92b:641f:ea64 with SMTP id af79cd13be357-92b641ff8f9mr1205795085a.35.1782686999090;
        Sun, 28 Jun 2026 15:49:59 -0700 (PDT)
X-Received: by 2002:a05:620a:19a8:b0:92b:641f:ea64 with SMTP id af79cd13be357-92b641ff8f9mr1205791185a.35.1782686998633;
        Sun, 28 Jun 2026 15:49:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afc749csm74899421fa.12.2026.06.28.15.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:49:56 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:49:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add Adreno SMMU node
Message-ID: <ilwsmzpebxsobixd6xwgkr2dajsza3dr2ghcxfig2m6vhcamj4@but7o2rxmmrr>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a41a517 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=CtAqrJV6yErwifH23rQA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: FIYSRxA2guBrP9vGR2MQJkQyz4GZLWJ2
X-Proofpoint-ORIG-GUID: FIYSRxA2guBrP9vGR2MQJkQyz4GZLWJ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfX4hTgA0z5dvmG
 elsWVtCHwDbveouqWxxos9iWZ9SLoaxu4ai9M1sKoFiC1eNeD69+DxEQfq1Pfhtt5/2Dt9jO7S5
 PcLJUtguZ3EJs76TE0WwLA4aNiRouwUqXdgtRVunVqJ1BM2SZdFZF7+G4CaOXhKsgDttYA6jbft
 mXpU9Maqgc3JEAU2gngy38OObFMYxnCqbsJcJIwDSZX05BJwKiNcFTEgZr/SctYWpt714F1FCdm
 6KlTWbAvmgD87ncjk3HSCH7HyWAtYVCyycLie8Too2S0MiA+0zk8W0OmyzHVFBQ+33ZEoxGIcX/
 feU31gYaXxJ4tbvOw7bGYzf4C5oWt6NiseDiWj3Cg8f8AmnTRM4ygMMkc1uMYL0L9owdBMC3YCv
 yT3DvedOE5/2iL2OBn5xfZavkEXZyOCC4YC5jM20H4ucdWpUMVYwERLPEXv+n6QnHcZaPVvxPMW
 +PFtk/Y9wBsBIr2Q6NQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfX5ylcfZFe8xDA
 cT1OqsJ3tt3ayjjjCr8ErnplD2hPFbxb4ZE2VyZfipPWQFTnQ6H/8wnk/QlEP/aLwXx/EI1npmw
 5qhegMMw2vzXkg3AjqgqH+PziY9laiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280206

On Sun, Jun 28, 2026 at 11:53:57PM +0530, Akhil P Oommen wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
