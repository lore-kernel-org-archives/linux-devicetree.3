Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C71306746
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783002639; cv=none; b=CW5wxAwehMQ//aEru+2YJt52C8zLHudSd/EIBZaA/SSxC2XwdheKOx4sXm6Jg/WHnNKvyRW1PXvCLI3w23SsJ+twZzI1DB0ahJd0xnv3uUub3L45SI6xNb+YNWCt4VtIvbN07ryNSjdbYC5KvWjmEb3tgAC64Hmd3EITZUYZTkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783002639; c=relaxed/simple;
	bh=NrmgI/lxLuwv79durEPFXraVUKfjXX8FjCkD/PWlJ/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGDa6nJ3aLsymKfatb1V+qAOJXJENNjdWChL/L1TzBWr55d66IHJiLxG+yjjKqzW8/7A2aEHflxHobGJIZOU5cM42CUgd+109H6K0MjKiAKyiaE7dQx4lUuneyaEBKcqc1t/flqgVS4AvFUrsezg6DufDO/Vb6Yj6YcWsjBOQFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJbqc8+u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xez4wJ+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJbqc8+u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xez4wJ+0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3KPx514999
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 14:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xPewuMTehoPyGUFx/GW3pLwg
	0eJ0RreFgtR8RfhVxb8=; b=ZJbqc8+uTP6PKGH9synqxFOD59UJXJbSui4Xy98Q
	idv/AwvXy6IeZnbv8N6fkUFVcWLF49fcoGcXG+tbu/3bONfUrExfUE6I1VlH/Bw9
	qUIbQhHydz3ROj/qi0rGxoNpap4PKhDTjIW/1m5gse0hyH4Mph/KqVYunkNhX/K/
	A+qV1JKD5f1kAozRDfiFwLASqCAMijEtndcmCte1Q361OQQWcLeKBCbXGb9LTicp
	rfRxBu9RJZYrrlRLqj2LJK268RLJnsawraOUCAoPvhcUu579JuKUXmyAw2pzQOLi
	V7f+55iYcZSx/anZG16QfPGEb977FmydeT6oYSVd+Sj1iA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr93jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 14:30:37 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9693cc255cfso1584071241.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783002636; x=1783607436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xPewuMTehoPyGUFx/GW3pLwg0eJ0RreFgtR8RfhVxb8=;
        b=Xez4wJ+0vNiPeacQ1Gux80McjSPGhH1XHa8hhcsXTabgH4h0hAr/YDkL5F6z2SMeNP
         bRnA/W/yVtQW5qFKEX7CwWivH+XOjZ+kUn1+ureC/4Vb78nukL5VLyI++u3xLPJhMaCf
         4QenfEzMYyRoIouY2dX+XqPYYgPtoIyqDmabQa6gVnP2Z4JCw2GYdys2DVgTjlGBmobl
         0Qk+TQpwfKseQ+2fHyrvqv0VXIboVq/tx8U4xkLSMZ3mxdagbZoUDmfeervZs7WJ1TBi
         DSB+fDNQ1meNIlGAm04EGL9OGZa4dtFmwkj4MWXwoI+I6Od+gySywLX2SHxNPwVePGua
         15JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002636; x=1783607436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPewuMTehoPyGUFx/GW3pLwg0eJ0RreFgtR8RfhVxb8=;
        b=qf+hyaQiId4S/MH2SXL9JGc5XROYJ0U84Gwfi8wQ1I/o4Uy9rLGholgyd8RqRb6xPu
         cms/vdu6ja5vqVU5C4tmq32NeH73zz/4mKZ77YJitfxON2ZJcXYOb3rdCOfyhusT0Ari
         nCjnvVKqcPJRx04vdvWS4nOkndZKHIso00fWMbz52cg+CoEj7z2YeMFvrYpthoZwxQMz
         JPfmOsk2CYwzucuY1Ipb/wSlSIaea+LnuNCjJ1mtp6hV1WCxBLymJa0NgULC+yqvS3Z6
         ulA17Zc7UFH8qkYIZLyob0xG78MYiCyUPUkhDDhlwW1tnp+8vRMJ1kcUMYiHDrniDQih
         6O8g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/r9TfeA6vXnI/PDKHnNTwR5Rd3DnxxXzGCBLV4Wa9A0iKCLvr9EI07dApIV9V+sAzEJKU/dphKDOl@vger.kernel.org
X-Gm-Message-State: AOJu0YwPEQ7PBOMeA3ecze/1HPeo0rLVGxU8LGSGxxXEzLVbUZYjlxv4
	iqTJV1nWdGNuTcPOVpf8pX14XZ6gG1ColXycKrC7tFsLI3ORY7a/13+4pgu1SdL8jnIXxuKYPx2
	gsMg67wkQDXulH9sOBOrKx/JB21xifIA9RGuWsNBsJToIQOSgXuRlZPip/z+dKVH+
X-Gm-Gg: AfdE7cl/LmYTEz//HyoCkTmRjLpX4sRJxGWHx6nVRZKBD0sTfwXSMDYcphjRoRRFkIh
	ZEDjmiKZbxJjanARttPYXSM99Ie+SjathzXAW6WjVyn0jPRhDTEMW0WPOObTUt3eqgpUE0t4Yw9
	uBsvxI0T4Ye0xsVnaUpPecD6IgDT3cpB83RJG7Rrg9AaKMqv/Wl5DntitBaRJh7Stm43jKJw0/K
	M3oq8w1eUVARW/ey64R2U6HNziZBbMIT9OFqdHCBruVpRf/6vO5WDMII9SBMEemeHjRMZ+zHmN9
	F6R5l2HZ5zl2Fsh+jc3UC3ss+WYZToiv1DZRMiyLwxPvaIKoi1l1n/ZOjK+9eXiK7bG2MyA0Hvt
	/VXDQbe2tXzgfWUQsa56nPjr61N0hFadwCqR9HcsHvLauq3hEUSxESHqpmiJxBHgeGchEydEboi
	OFl4EwZnZhhjW88q/z8uHaOJo7
X-Received: by 2002:a05:6102:5088:b0:738:2a8c:736b with SMTP id ada2fe7eead31-73daa6997acmr3028534137.20.1783002636125;
        Thu, 02 Jul 2026 07:30:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5088:b0:738:2a8c:736b with SMTP id ada2fe7eead31-73daa6997acmr3028512137.20.1783002635563;
        Thu, 02 Jul 2026 07:30:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89d52f8sm739217e87.46.2026.07.02.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:30:34 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:30:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-crd: Add pmic-glink
 orientation GPIOs
Message-ID: <pac44ha2wsbrc5ogvdwe46fpn6abjpl2d3bma454pxq5rfz3wt@5asuhhq3xhvx>
References: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
 <20260701-topic-8280crd_fixups-v1-1-3fe92ee9636b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-topic-8280crd_fixups-v1-1-3fe92ee9636b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gSPwHhSorfT0Qv1nKkJVg2FtN0pZUdLX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MSBTYWx0ZWRfX9K81gyjBFy1p
 FfYJMqBULOnftJOGCGSyJCHuwMWB6OyYHe/i0eyLQgqz3ph52DeTBSaB6nv35giiwNwkUY9LkiP
 hnUpinTy1tqnw7M1BSoDwEq6URmd1rg=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a46760d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=fKH5jNxa-zTfWZNM_KsA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: gSPwHhSorfT0Qv1nKkJVg2FtN0pZUdLX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MSBTYWx0ZWRfX8UwuvpUifo7Q
 VeDWWp3KstOcJMAZYFo1T3qnUltCUqHaiHB7cQG1Jn95a2ZDLXMAxEF06w6OMKXWZx6+d85LMk8
 b+KU7mi1uQQclVT9thNv/ZZeqlM87GN4rbTDQsLv32448TbSt/C0K4UpO3IxJ66H2nXIs6WpxA0
 nGXK3pVAx2GgfNuc5U3nUoxJJEPgMBoxp0mSuibVLnWlH3CJwqzHB2GSFTVg8XhRudZEq2/4Qu+
 dRXAuBxTTgiEUBWwLgPuxC4FVfC+AhtaQ7MT1C5vZdPRDV/1+MeAWPy0yBTVVqZGhfDcZoc+D3E
 s6nAxl5+Ic/ZFTHXwbW3QEPXgKPBw/rWMGxZKCbcVXF9stlfcXbsMXnDWFZLXqScQQNVaJxGRXW
 WDsGjaiygUa4V+Kfc4AKcGOIMztSeNuNyqQKAU4gyj9oQPm5A07/xJDL7yjO2Es90aEMyG5d+J8
 cLeIojXZEk060PhfeHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020151

On Wed, Jul 01, 2026 at 05:43:15PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The PMIC_GLINK USB-C setup on SC8280XP requires that an orientation
> GPIO is passed for each port, the value of which communicates the
> normal/reversed state of the plug.
> 
> Add the missing references to let the OS access that information.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
