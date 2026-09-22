Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9E8485503
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055275; cv=none; b=rNfQfL4i1XgihqjIr0hN06VGla97iDG6B8qLrC6+3JVpFqoSRedfGNJgy2Fh2ldYC6E7b2KoPvH8/67n8pd6URd71mrqnB6NuRbY9woPDypteiLNGjz6ES9DYkQoWMBPj+SNyoEMTZkmenfhPwumrLSdpaa3pRN77iAnnBAFNWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055275; c=relaxed/simple;
	bh=Vko/wosreaAGTLDcRbLqj+3q3ZjzrHnfm4OgiQZeWYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kmJlzWswT4bZvf7SDcFeBbiL/AiotC9MTSol22XAOoiVVunjQ1RzADHKSWqAcussLG6kljv6giGe462TkdlJ3QJ1ZIxF449JxNJ8VPz9HPJZInM4f+HHAPElou1jhU3XkA1+ZWbv8B/Iec2p8UIvYWiFMauCZrfKozSLWTl2rbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9lBJiNL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QzrD+vCt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9lBJiNL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QzrD+vCt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00Ha83676875
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dokz2ngzU8spcmXBwllzk0q3Al3uWIsZBQwTXfOGLwQ=; b=H9lBJiNLVRo4gncs
	3a0mCTrBgw0CSXII3f433V2bqB79TuZMgAmHr4wqyl5XhqIJn+ndNk7grc6yLG+D
	Ume9XEJqq8DP+fxCVxNN2QmOeIu977/aCu9Kt9+bCUOaWk6isR1bg5a1SKkHw3t9
	62sUnmV4GPB0skyPQosxy0YOtKSEsy0GC3H5xnB8aLiF+NxVPbNdLYx7Wib7phTr
	YCb5RmxSbB+fAfYoSp1EFjEQ/H+XQE7mfUq9a0W1R8AOSPs27w8I6R4p08LN3mn9
	DgYtyHvYkJU6BgEG/M5v2tuSYaLYLjh7rnVzZEqHwrSOX0vQENcTpvVcHcmtjuiD
	BLfQWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vjj8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:34:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso582805a91.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 22:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790055272; x=1790660072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dokz2ngzU8spcmXBwllzk0q3Al3uWIsZBQwTXfOGLwQ=;
        b=QzrD+vCteEb/o8tJX7VxD3aLc+0xGjmhL5k1SxzyXbUVIz/3GEO9WA/2z6v3EOEy1d
         yDI9L4/1LEprGEG7pS8YIPqUlTIYCvTKvYYPZnlmYDA9NljgNUou/qg+qcieZdFQ8s7U
         m2QYc019WYypQW8NscISOn8O1kMeEObOdRzAW1tQ7n1yCx83aZU4p9OOmBXTAsLKdbKz
         A1kMYb8Y2FdRt2nKg2Cbexxc3EOS0NW9NS/ZWkG6N3lpR+lubt7Xdrd5DoRNDS/KDwtI
         UZ5VhFsovBFGNRfeOeK6OPOipbRzsW5kko16rxHmCyCDSDTAyq0IcyBnpA18ty0pZytw
         s1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055272; x=1790660072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dokz2ngzU8spcmXBwllzk0q3Al3uWIsZBQwTXfOGLwQ=;
        b=t0dPP9NcDzX2KocbuGGE+kO2Q1XX9ii3mC9YiVNMHO663IA7ciFK+lN7sCE8ZF62LP
         JCfJzGKKQv1XLFqi9YZmsT+rZYZtF7giPRXCXMfqbvkU5ADJjpHQZzEOo0XjKYRoClXB
         nmv97GOD61ivsjlDRUjrOU1j12uYn7IdPwW03KYx1ntApCKysNVDEAhVZaIGHKhoCRrS
         Bnnf98MMBsyeQ+SPSHhxG+V5Vt6Vfac8t4KEJIuarl1n20BK9jnzjk+ufIZKmcqq3ilt
         FVtb+NgsTDVoEf+ZOsoKMSfy76gWSugDgG5j1vVbdV6OxUNCsHeq3GEUuv1mJ6G1k1Lg
         0mqA==
X-Forwarded-Encrypted: i=1; AKwUvBxYnVAPFnNFUSBFBWlWLCj84HTNl+CN6OjXRmO7696oqK/6HzAbpLW7XV4Tfmw+fXuzJFGjkWqjQRyp@vger.kernel.org
X-Gm-Message-State: AFuF++kWjyQwjK3sPigouojrLXXMksJmdXb8RPyXzj2WjEx75mkDHV8W
	CFv/pMZaFqyQak2F0iETWdk8SnOEMc3J4nqIP9wpcSvc4NdzWyb/6n3fLmsN6JH2//2K763GfA8
	im+prK36AGL98co+WBbuFpd8TC+pB2yXSa4ANmp6i5SH4/I0g4PFdWbJqbwSJE3+O
X-Gm-Gg: AYBFou1BjwyGx7HmnlrR3JjQQM6aKEIT4k+uU1/sx8KRve1j6KnyFjqS2MBiDdsbtun
	tQZtLEPaO31QClpBM3gN64RouJHj+OAbbZN74J6L2SFOwizFhm7cKTkvWkloaRT5iC+LB8e1cYE
	L12M1FK3Q/IB9BtyPQwGzZzTVTNAdr8ycl81NOuDo54mQZZf/+FxkjeopxNH4B+B48U0s48lrhF
	rfVjnzDEF6iiEKpPHDC2Iu1lwvaesC704/OrI3fKyWzSH1749Ax1JbN0ulTFajhkKBxf8qgOvLq
	f8+PSDRZo+XEpj0WFUJ0BsWDC1MvDTiIThaWCpMlIuPeuGBvRE+HLm81UzvDbAoHlleNUsmTYmL
	0MLACf7tCPTLAG1xkBXtqNO6RwbWm2anx
X-Received: by 2002:a17:90b:574e:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-3a07311ab7dmr50007a91.23.1790055272169;
        Mon, 21 Sep 2026 22:34:32 -0700 (PDT)
X-Received: by 2002:a17:90b:574e:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-3a07311ab7dmr49978a91.23.1790055271537;
        Mon, 21 Sep 2026 22:34:31 -0700 (PDT)
Received: from [10.217.219.38] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612ccd46sm2566592eec.18.2026.09.21.22.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:34:31 -0700 (PDT)
Message-ID: <16f1b504-c414-4072-98d3-49f60d552028@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:04:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA3OCBTYWx0ZWRfX+Rx25Ns86z5o
 /lSjw8NLs21AKoDyCj+9NEpeGsW1kWgoYCcvnN9naXRqQad7jcgbB5kxtVNfwLzfOniVOslVl+k
 zVT1EteWZbpQtlZHAl8pF91khpsOZu4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA3OCBTYWx0ZWRfX8800qq0n2XTJ
 khiU3udYJKMs2zlbeD7AsX7QI5lq5YwORW7KNuha3iROsgFnp7di0FrhRE657eoOLRKuUZ5/6ZA
 FvX0QajlPkBEfQpZJnzH6UIEiMLSYfffmE29S9tG/PJngjMFP8lmYpnzP67qolSue5KWcwl1A6X
 TQP4VqTgNruWShzdusk8u7Wb8eMmTFHlOgBWPpu707svXlx8e1tRijhX/Bf+D6eAooMBy267DUA
 dY5d1tVPeNd9WOb8fUx6xi9drn1+g3G1x6qf++12r6UdvMV0Vqa+kEHmtJ/j8QdSsgJIQLP7rnB
 m7paziwfMEIuMjjfaiCgTKAqG/++uS1PFsvrn2+/IIjAuhFeQSSCiqmjEAjgvQJInlue235ETKc
 gM9+aHH6+mALKHU7rdrneGCOq/JZXX3LlZ6UEfpWSqIXzaD1WgoJRCy5S2vu1/2VJ5VcwbyZgM/
 cymAk06fIv9nOd4Vq6g==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab21368 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UAhfrctgHAU7FTzsq4IA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: pgBihYpzNmcwpTmJ_PhdEEojxW5tvb2g
X-Proofpoint-GUID: pgBihYpzNmcwpTmJ_PhdEEojxW5tvb2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220078



On 9/21/2026 8:16 PM, Bartosz Golaszewski wrote:
[...]

> +#include <dt-bindings/dma/qcom-gpi.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   
>   / {
> @@ -909,6 +910,28 @@ soc: soc@0 {
>   		dma-ranges = <0 0 0 0 0x10 0>;
>   		ranges = <0 0 0 0 0x10 0>;
>   
> +		gpi_dma2: dma-controller@800000 {
> +			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00800000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <12>;
> +			dma-channel-mask = <0xfff>;
> +			iommus = <&apps_smmu_0 0x15b6 0x0>;
> +			status = "disabled";

we should be keeping GPI node default enabled similar to common QUPv3 
wrapper node.
status = "ok" for all the nodes.

> +		};
> +
>   		qupv3_2: geniqup@8c0000 {
>   			compatible = "qcom,geni-se-qup";
>   			reg = <0x0 0x008c0000 0x0 0x2000>;
> @@ -1107,6 +1130,28 @@ uart20: serial@898000 {
>   			};
>   		};
>   
> +		gpi_dma0: dma-controller@900000 {
> +			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00900000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <12>;
> +			dma-channel-mask = <0xfff>;
> +			iommus = <&apps_smmu_2 0x1016 0x0>;
> +			status = "disabled";
same> +		};
> +
>   		qupv3_0: geniqup@9c0000 {
>   			compatible = "qcom,geni-se-qup";
>   			reg = <0x0 0x009c0000 0x0 0x2000>;
> @@ -1278,6 +1323,28 @@ uart5: serial@994000 {
>   			};
>   		};
>   
> +		gpi_dma1: dma-controller@a00000 {
> +			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00a00000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <12>;
> +			dma-channel-mask = <0xfff>;
> +			iommus = <&apps_smmu_2 0x1056 0x0>;
> +			status = "disabled";
same> +		};
> +
>   		qupv3_1: geniqup@ac0000 {
>   			compatible = "qcom,geni-se-qup";
>   			reg = <0x0 0x00ac0000 0x0 0x2000>;
> 

