Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A66940682C
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097674; cv=none; b=KXSFNlhz71+mI9KieVupXmfhv5oBty/ymULIIA9cmoRJ6kHH1x6WrlBgGIvESRO8/U9FsrfLM3kiD/vc++0UNZuG1ESBLqfUpRPUf6YFmapw66wUohspLazAdT7UCsG+TwbFS8BqDNze+MuaQvfoB3ptiSTZ0gsW2XzXzMiSuIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097674; c=relaxed/simple;
	bh=7MLsEBCY+w7QHKUbDZ2Reczg9mG+Rq17GqB/Bvv2gE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExQtIKthOFCQU4uLv97/zDv12WkK4/qKdhJwAlQNDerQOpM2rL3bJvSvuSONdI0KqVoGtWVQY3VqLyHLJglWcIOMzrzT18GEA1wuLDRow24QrFVjBrqJgqrUvTkSz/RbwQp5CKCq/p2euR5va7zH71w5y6Yv0V3rKMZSdSVAKh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcdGAuZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OgkN0Xhc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FcdGAuZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OgkN0Xhc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCLdD1554772
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I3wc/QhjdMmUdiJce+ISH6k7
	yX3QQTSRv6vS0VaQ2yI=; b=FcdGAuZXFJ+w2PXpQxdAwjdMY8AW4RtGYEQEVews
	9qjgKoo9KjC1ii7RDLOxh9uyNYDLkd7GqcHQT8DakWj4AKQ9Pp4Cknp4zLFKGeGC
	1psIlYOztwHFviMLsqkr6gsZnQtBIF0qlKOcqqy5Lho3M1hHu/AX0x6wNYUvta5C
	hf+tiBCfvmNmebegEsrv2XJbtFsEFMTgCbyDdKT6g/MHN4T1ZrSZidoNL1KMjixV
	Z46CFD/NXWmc7GuO+hRGCNgFdKi5h4b1z9ykKrcC09iixZUy2Q/yY8vhApJFmmmA
	JtSIGFbWUfPyWDHhGRQ+gfDNVaoASH7VhZEfGbs1/96nIw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnntn1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:21:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751db2792dso3211082137.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097672; x=1781702472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I3wc/QhjdMmUdiJce+ISH6k7yX3QQTSRv6vS0VaQ2yI=;
        b=OgkN0XhcNzrTgcZHh8q8v0IjEFhTtlIKR/Eg/ILZNjCioXePzj6a344QBPKYtXUJ//
         hIpqPtdROBREgxfhJrHFGDHaQ5bROYr8dsc/JxaWZEMlp6VLhT2D8dxsUTL7rW80zN9V
         paDTihmEKn8255IWmDAVUGOgv7pytv5sg/gRzsMyF6wv2adN3Mi/+54uJB+wEH8qDtGq
         mKNVLWA2SjvOQh8mbDpg+VVVE0b/bA8YqR0Gk/qTZpaNO8etACO75sk9Z5rKe6dm+9xQ
         MSUWR5YIHyEnEa/XYpcxkNtujuDSdUPkgGEKVrX6xA9BGb0fwb7DvZCw+Y5m9ncmpCv9
         JQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097672; x=1781702472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3wc/QhjdMmUdiJce+ISH6k7yX3QQTSRv6vS0VaQ2yI=;
        b=IPN7yrTc6audZaKxbeR5OYw78l8W/d67XGsL6UvqmRTawDvQ18ayoeepNcK/5O9aH3
         wAxlR8oYeehizSKcqBZDDj+4pVC3yWQQChkF8HhVKIBLeH08rcKLiBgeaXylWkGBa93k
         4+lUwBEZirJGkoniSsKow8JwGVkPw82B35q263CJ0LsTrzdhhHtD9SV4PECo2Y9OUjtD
         lHBgxyWOnMIJgLS9AzH3xjuHnrJl8bM4VEzIg6Oie6ctWOiRCsZw6W+wQSBB07/5toJP
         U1BgdGF8qtuLi2tLWCtDZX3CRI5OFmVOlHBk4mukYJImUfDWYKesTLCOfIElw/LoA5WW
         aUBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NPPdRVxYh3D8PrRGlO4m8pHcI9y3srVKzvowrKR0o29ig2fD8yPbeQhwHtLziuhXO+5K2s5Y22YQa@vger.kernel.org
X-Gm-Message-State: AOJu0YyNl/NWV637k3fnfc2lwmBKNloPUwNtZ3hB0Qs6oIDklXvn8jSo
	M/w+C8lNqYwMUewdd5Hx62UgPzGVbm5XHRzfSuBgVIVeKm3d+K5HfhmivwZVJZBtbvGwtg+vlqS
	Qi3A+fu0lGJDqNMfyvARGho/EXct6AGJ34OBXlGZZlMePTSSzAVGHdyoyEbfufp2M
X-Gm-Gg: Acq92OGXZdIPx2Z1+G/QDRYiW924hZWtYMvSakRW38hMKGvsl6zNqBuCPRHbW8Rnqyd
	6z2YcJ8CWFgUjhjnTiIbh3NHiqzHOIJPqi2jmN/J7rQ3wcp1fGmdwLfCiFMqY345hZVyuX8bNPi
	SE9boF3n0ysYan3dKtpEXUTdIuUgJpNKwWGzuHTW3k6Qo5XjbkOcA/bVRjnkyc9GQAne8B97C5H
	RANOYkT7ykPBMlbYWShUNUmyMbGG7qrfaefg+1ug5iANUeA7Nqw9M6AHCVpjDMfniTc2C9iz/lP
	QsvSQi2Do75NYOoo2yk23lDOB445/gv0AVj8zP9ALnwUFzwjwKjYy9By5tZMP14CLo9D6fCyFgJ
	SrzxXRGTapk9J99I5yQNc0uQL7JjkRyIaUazFcCBUJshdDyg4YuWKMOYfNh4f98QeBsxLNi3sya
	wKIlp6RmqHFyx+Z5SSi3FB4opmSftylAjzMw/RIcG/0dTO7A==
X-Received: by 2002:a05:6102:5a8e:b0:6c5:d55d:c090 with SMTP id ada2fe7eead31-6feef09acf2mr12547602137.3.1781097671391;
        Wed, 10 Jun 2026 06:21:11 -0700 (PDT)
X-Received: by 2002:a05:6102:5a8e:b0:6c5:d55d:c090 with SMTP id ada2fe7eead31-6feef09acf2mr12547529137.3.1781097670855;
        Wed, 10 Jun 2026 06:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9903e9sm5338283e87.69.2026.06.10.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:21:09 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:21:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
Message-ID: <b24o5mc7cwljy73a52r5klagfnhxldkdpvyq2easkjfmgmqyo7@o2oazxld2svl>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-3-d7135980e78f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-3-d7135980e78f@oss.qualcomm.com>
X-Proofpoint-GUID: f3Xafa-Ts-cyJ7DcEJnJw0fa5wwZR32b
X-Proofpoint-ORIG-GUID: f3Xafa-Ts-cyJ7DcEJnJw0fa5wwZR32b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNyBTYWx0ZWRfX5/Ov7pTo5Hv/
 GeoMQC5t+IHVlWCQzA5WM5nQyp42gxMnBW7RFgFgOeSk2Q76DUApwwbuJ+sZI0FCMdrMlzvqaKn
 6hYEylgQA5MA2k4C914wCi4Wufq7r0ArsVMUWJBx/P5oMZXEGu0h9IhbRQGPb5MDeSy8xUQWDKX
 ft/qVcU9WbBIZ4KMgNCm1uyyckJ4ZWsfzdaaPuZ+biepNVMT+6WMIfEdyvJ8P3IL5zU3T0DXNUF
 Dvh3b6O2JlLbwhnRwE2NVGtswz8gEcbqf/6xUGJL3U3qORZduSt6VjhsP2Ndta6FqTAI5Q0YrqR
 o/Bf2tubyERdAN1DesbJmOBHoO91uyfvLkg3IJk9sWR1VkeTgc9cj9NEHlpn8hqQT+vuvXD2gbe
 eRY5CNfkHkZrm1ISOFmL8w2KE6kS33yz+y/mr5eKPotOprvMhAKIviwtnSzGIIFmOYJygR4A3bo
 qJRnsOZWpi7nvXrl4+g==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a2964c8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=wNkKLIlDSNE57RjdYp4A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100127

On Wed, Jun 10, 2026 at 02:04:16PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The QUSB2 PHYs are powered by (among others) the VDD_MX power rail.
> Describe that in the DT.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 2f67e665996f..b7cd1928335c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3192,7 +3192,12 @@ hsusb_phy1: phy@7411000 {
>  			clock-names = "cfg_ahb", "ref";
>  
>  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			power-domains = <&rpmpd MSM8996_VDDMX>;
> +			required-opps = <&rpmpd_opp4>;

Interesting, might it be the reason for QUSB PLL locking issues which I
have been observing from time to time?

> +
>  			nvmem-cells = <&qusb2p_hstx_trim>;
> +
>  			status = "disabled";
>  		};
>  
> @@ -3206,7 +3211,12 @@ hsusb_phy2: phy@7412000 {
>  			clock-names = "cfg_ahb", "ref";
>  
>  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
> +
> +			power-domains = <&rpmpd MSM8996_VDDMX>;
> +			required-opps = <&rpmpd_opp4>;
> +
>  			nvmem-cells = <&qusb2s_hstx_trim>;
> +
>  			status = "disabled";
>  		};
>  
> 
> -- 
> 2.54.0
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
