Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2C9308F0A
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780827236; cv=none; b=BtgOrLH14IWP+WmMk3M0P7SSGL8gkqsRDSXhbCgDHOJFD76A/GJGN3+jg7SBvCvvjFEO0Ak3dJF1S2CzdDufqoNqhF90wp2OIDEK8Fa5CqKIRCX+OUVSqqKC5hiZKmnL/B2lBnqtqpBBjTc0Mf/g5AucLSzhyYeXSUBeEYk6JTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780827236; c=relaxed/simple;
	bh=8b8noawsfw61MgEwfkdxf4YgtoSVitAEIplliythSQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzsKbNf9pXdkAJEvkO1h/tSXKtAJnlvURUygZZOvyWp3TUnVlyZhJqAHkW+JJ+3wu7rKKTC3Iz3PSOsm2YfLea9aCFj4Blz+hp21oaESiYo2TC+peXIEJT1u1OIf0iPd86Ts/VBcxIIT2PCXL0svHTCx1oVDw7aeoQ1IJu9yMMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOtWLESm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RX7A1VDR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOtWLESm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RX7A1VDR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6577B6Vm4110439
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 10:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cC0O2A1C2rKd2LMRwWo0UDbf
	PSQQh6LFCm650/y8+MY=; b=kOtWLESmVDiMAJkiNBNjbvHb9DVqbW3eioOTZc/k
	pnCGFhbWK/Q8adEZVetXDMrSpEQfmez2FWvAkKzYQsavAAz82l3MQpKOJIWgNpOm
	6Q6YgDOteVL6k9qHMa3ACV3VunCxkOwfLJAMMYLdH/JpiYblVaWEdoC1g42NjXWE
	M6VUrvmYEkh/FqCKQuHj6Rltj3zY2gxEhMuyvxj7QRrGAbmjvURDdYq92FxfjMd+
	cSdARZtu0swZcZdol5EKEV9bnT1qGLOeY+uP/cH40L3a41d3nyqFQ4zfW2I8MGaL
	LSlFCMBK5RLnRXBpSXJLtm3QC9qjTleg5qtoqqBDBzedog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6bfx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 10:13:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5177b8def69so73325001cf.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 03:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780827233; x=1781432033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cC0O2A1C2rKd2LMRwWo0UDbfPSQQh6LFCm650/y8+MY=;
        b=RX7A1VDREqViNJa8GL9UbzfivziUHqujiAo1OEQcScUZxrggu0RAeFQZahRSqHU046
         odPVkNiMwqSuNJeCzAnOGGXqobOVSaPpBtD5om7beC+0k+o4OAm/U0dkcOLKWZaysjIu
         D6DD6lPTWSyqRddUVANdCW6iWbP3zCF/aKZLiiKRbyqpGQ3pexSU4EgAL2dDOXkfGsqg
         szRHOx2fhAeJ5Cynhg3gLhJGQ1LiggiNvD4YkzztQ1v76tXmiR6N6CbfESQRRlLAS6HE
         MWcDR/VCSuhd1mktKgLOERVaSztzvcoYJjD9hWWtcwCial7cJWnomeCCkyx3UyodPUyL
         jkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780827233; x=1781432033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cC0O2A1C2rKd2LMRwWo0UDbfPSQQh6LFCm650/y8+MY=;
        b=MLDnTzKR67uzmwlJNZIDL32ZLBknurhUmKYTlNgwko6aGmpVmYKBMFdhDSlgSXR2Rm
         iNY6fniL0CBf5EhCISxzIflmy99QyOQMLUk6CQNmlzCPy2SvzNqV+7FO0/vbPrAP7HRd
         EFAbPx0rg6vngm2y1IpkqM6lnZjTcOsA+I8BZgdKxQqofD0cVE2qNB0dSrbwSy1T53p+
         KDcOwvwZmKNPUzNopqq6G83RyB8nZW0s0PiR0KtAsO6cLWzdMWJuJ5Wc7jFXreIfMu5E
         NNu0yVCFykLKORVLBKZ9+/HO9FhBH+j453HUOJdEE5Ix0LTsGRtmHDlrR1V2jzw+DBik
         hC5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9PskUx2HqO1dwLelHLTRgrOMfx/80mG5k8LFIn8RsQfu0ZiUwzR7HcbAfmriVdAjPqZMbC00z+qbxG@vger.kernel.org
X-Gm-Message-State: AOJu0YzuY6EIKSq9WbRsAREXDPGuFH0BdrhtZbXPFV7FJiTCdUiMsmLQ
	EpIwrxTXhtjp8FZfdD44CNjEMxAGSxH0+62Bpj3kPJKaoUT0xxcM2FPT4fsjdAOd4IAYVI2jref
	a3+QBKWQL6kHPmlbDA8PDGuNBxfZ+medcsuB/N/CBauKoMiAk04/fkSKRbd8ESXrr
X-Gm-Gg: Acq92OG7W8nKVpfKZihVBwRmeZh/Z/6FEiVfM9tyzMYewb1vsyyLDe1p9eTy3x6oZxJ
	Ys+GckpDaqI66lKvpNFDXf+Q8iLMI50JuNX88ulhZvbaDI1dlyNg3tWYjBLHWfQ9h2Pp9B6RuPj
	tviXj6Knr5Hzh/6QQCeXWclUglzxL78TONZejD7iVRryN+4sAe3msdX42eC5w43Qa6BaHMoofq0
	fMSz9QfHg/42k8SX6N+ZA0hX2lIx7a79TpLCyNG0OnKPQx3s9lS8jRd1BIVm7r/zXbjLQ8d+qVb
	HKVg+rUsxp1bMaOarBVOYWRpziNg2wQ2nnEny6oqpVRRbIccJ8nbdcd6Hi8yJf7MGhcWoFhCU8X
	xLZLa1JB/1Uh8r+wn7peoVEirbnx0auPwOlltfm4qwb5wnbaq3jNheU4KgYv1yok/sOQEPpSKjJ
	aDg1NznJfLXQhKjTNeWdaNYdVJJ7ckLc+UZVRfwlkuZfSWRA==
X-Received: by 2002:ac8:4a0d:0:b0:517:b58e:a1e3 with SMTP id d75a77b69052e-517b58ea331mr2351231cf.50.1780827233222;
        Sun, 07 Jun 2026 03:13:53 -0700 (PDT)
X-Received: by 2002:ac8:4a0d:0:b0:517:b58e:a1e3 with SMTP id d75a77b69052e-517b58ea331mr2351011cf.50.1780827232751;
        Sun, 07 Jun 2026 03:13:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac092dfcsm36963331fa.16.2026.06.07.03.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 03:13:51 -0700 (PDT)
Date: Sun, 7 Jun 2026 13:13:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
Message-ID: <enovafjkiuzr4bciu6bu6hh7h56wvnaq5fh7f46m4h7browyrd@7huwa5egaqaq>
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-5-0154cc9cc0de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-shikra_crypto_changse-v1-5-0154cc9cc0de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a254461 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=7nZNmzxVylfKdAgXsYAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwMCBTYWx0ZWRfX7i0zvZmKgKhk
 SiNcsmqn+XqtSlyTF75LHUcAxWU7SEsfa9pAFSosyvooO5MSinQmCeYxoGhNRPgQh4xWBylbu7b
 W8LbssnUWO8Gsh7kaUcsF0XRrnRAz62OB2z8CEnj6wWKPMG2w27/0aSiCKf9DXL5KHAcEWbgrPu
 Ke/CK6GRSrUvafcPWbLbX9gfmlS3NZCLHXeEyrH6K0mjhT+B/laU6AQeeBWixXniw+PfK2R9pao
 yFzK/sY3vd8jhuOi4F1A/o2WIZv1H+y+Ux+bKD//NcWusHfDlUy2u42J+NEXp62VO3goF8f4x/R
 sZErfDhuqTbq5O6kguhl3Noyu2SzjuSl+yOehDxKg9mNrA7yJ04FQ6ox8BxxYLoGSMPzqLaSweH
 FTAh5a3PFSFxyvJlfH6cBI+e+zD4bV+fmAV5a2spYZJrH8DvXjJkr6LrdA5/qHEhQ5l7IBRgEJj
 RzYfI5kKSJTZY23qfAg==
X-Proofpoint-GUID: J6TX83m-mNJv1F4FaYaR9tpoLl3zPUbz
X-Proofpoint-ORIG-GUID: J6TX83m-mNJv1F4FaYaR9tpoLl3zPUbz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070100

On Thu, May 21, 2026 at 06:47:12PM +0530, Kuldeep Singh wrote:
> Add device tree nodes describing the crypto hardware blocks present
> on the Qualcomm Shikra platform:
> 
> - BAM DMA controller used by the Qualcomm crypto engine
> - QCE (crypto) engine with DMA support
> - TRNG hardware random number generator
> - Inline crypto engine (ICE)
> 
> Also connect the SDHC controller to ICE via "qcom,ice" property to
> support inline encryption.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 52 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 31d0126e5b3e..b617735650ac 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -546,6 +546,41 @@ config_noc: interconnect@1900000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		cryptobam: dma-controller@1b04000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01b04000 0x0 0x24000>;
> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#dma-cells = <1>;
> +			iommus = <&apps_smmu 0x84 0x0011>,
> +				 <&apps_smmu 0x86 0x0011>,
> +				 <&apps_smmu 0x92 0x0>,
> +				 <&apps_smmu 0x94 0x0011>,

0x84 / 0x0011 is exactly the same as 0x94 / 0x0011. Likewise 0x96
duplicates 0x86. Drop the duplicate IOMMU specifiers or explain in the
commit message why they are required.

> +				 <&apps_smmu 0x96 0x0011>,
> +				 <&apps_smmu 0x98 0x0001>,
> +				 <&apps_smmu 0x9f 0x0>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			num-channels = <16>;
> +			qcom,num-ees = <4>;
> +		};
> +

-- 
With best wishes
Dmitry
