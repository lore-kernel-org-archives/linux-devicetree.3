Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A92E6CB3
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776525308; cv=none; b=QV7eJWmWrthFXja8M1O1TlcCla2mioIz4DFJ4zqm6yFJZnu+WEJXeKd9WyuVZinnZCBB3fg8iQo+iEjey3ogOTAM1yWjVkeH6B6nTfu12i9MZIutwuU9eKY7aUXCUxzp0aJTH7M+wp+i44xIZhqkvN2pZGhshr0cuoTdRAsMBEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776525308; c=relaxed/simple;
	bh=Qtc+wBW4Kxp3SLnMd86csGCdaNkfCBDi82G6vEeEW0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwWjEzcs16OV2+CB9v5YZBZYBT7nA5Ufd17oc8WwzTewF08ljWP7SsJhgUd3kMVGT61KuGnDwwf2aYmYHQQQlrQjfL71BzipoLC8KGBDkMm/ZV+gGcQQuHLWNK2hGjO2lnUPLz0V6QU0xtx1PX+PGTeqb5E+ses0orrImjmbWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVLprOdW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4rgAL+m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVLprOdW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4rgAL+m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4leb92567248
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 15:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1IMG5RAUvb9hMjVhCRtU1+Ag
	WRwZIWSe6aJ/Xb2IVY0=; b=QVLprOdWjSiNPDy8avHL1V5F090yNYl/uNQoqwB1
	9vjkbGvVg/jB/wfTJAyRVyvhdA1iXptvFcZ29JiWAUw/mUSkefw2V/5Pl+jKm4kK
	ScDcyL3yZaxP6wTv9ESt0Dq+1q33ga1W2dg9DxnlPwMj98RuOijJ62HNn3R9PPNd
	tIjBld9GqTjduXDZiV3bK3vgrMBOAbt0n9bK+QAjZMUqa1cACv3ML2x9ihTe4gS4
	/0SHRgWNVK9uaiMaUDqbBKieaHW0GGCUcDBXpXLQl7Lhz5XRm5GTgFXGw7MKBzhq
	p3SbDRShhDM0gF0yO37U9C0VSycuYMiRoRnFPDCjZNQ8RA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388gx2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 15:15:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d826ed6f9so65108091cf.1
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 08:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776525305; x=1777130105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IMG5RAUvb9hMjVhCRtU1+AgWRwZIWSe6aJ/Xb2IVY0=;
        b=i4rgAL+mwTaIIpuyXcqSpkK16a3myPgdQcSKAv5b1P8MXheSddYnz9SntJ6wwwVZTb
         B3sfiObs1Y+qVHUteVJod8mqplngJh20U4TQh+HL0qbj0KjCBKVyknM4LN2lwT4ul5ts
         tmOpiLEGbimT9IhGPZBzXTu+yQ9QUEhYBsiKcEWOZwiYG9m5OJ2HOrdPnxP3j4elXsi2
         HebRzOm7wnD06RqdFfKRt9TMUkxtn0SQ85pEkSgX6le8swJjCfyLw7mbCB2viVamrTu1
         8mC3zI5nt6n2kfMEytREzJAyw0Foj4IoC63ISdbUmLPqmgAnsP3g9wGuHwKMKB5rhC/r
         G/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776525305; x=1777130105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IMG5RAUvb9hMjVhCRtU1+AgWRwZIWSe6aJ/Xb2IVY0=;
        b=aAWOLMgUc3cnOgaWisyVsRfPnLGmzUmHi69fnkE4I7535KELr31RzApA7FpAixfl2q
         qoNbSaQ+d9JvgMbqG3ZqXKeLTyQVtx3ougnISY9AU3tbcAKjea+pZLLaR2w5AYKXUpna
         MCFIn83aLWrJhTd6meE3kquNgoOWN2I+Ibp7v94gWjAT8nO3zS+YYbP6DvI21qoZQZsd
         os7PROSQhi3Sc3mmGp6Y3S4B2FmYouIAFWly/kemIlrHynUB+e6t+68Fz4FIyyyM009o
         hcMUusO9tVDcBwH2nXdJqHHes/S23AQ5OqlyB0scAINfCRzRehAqBwOG36cuBwjVdo0P
         amlA==
X-Forwarded-Encrypted: i=1; AFNElJ+Y0uN86RzfCQGedxgLrSgHWk/I1R/QxI+SSKfdkVWU/5AUTpaGCjQaVOQp/fH/I0t1GjwdLMWLwCr5@vger.kernel.org
X-Gm-Message-State: AOJu0YxGCOzv/vNKi9u4tsiFzQ68al7hv8s2NNcdJyUIhSBch4Xdmm9n
	JlaNfjkelnxxeIBhmuUwQn4lVHP3YRkw4/SBGnT0pgebIcN5XUoZeBG1mW/uhVJg2IcxEwPKe0m
	JROCmlv57Ggyh/P04QD5guDAYVSs5fbWKL94PMjPIigFboLcd9/P7VV9H+gwvlNyU
X-Gm-Gg: AeBDietQV+vOVEdWmM/AcFmsLwHt33BtsQT9BjLIZFXPvU/xJ2LhvxaQL9saSCJUQHx
	bnTBgGaiotgzCFKsfc8hQv3DuWxMufINLfqbVqs1he0kIKVT9XghV2+4rT0MVx4lUmRxOMR+fMM
	yEeKZ5L2tuTBVTizNSO3i1kvGOVNyLXaUefOmQeD96/6UIIXiCBr2qGobiq4crPE/KLw3xCIMAI
	ySs/RY/RfjLGWBWW9F7KiRbS+C6z8ecXNbl1FIT6vY1J0wyqIMTWcM8Ixy2i02PNDQtOmuPbyqP
	/Z1s/6sOcftgCXSMib8m+et01+7gH7oSYyT37w4Ci8QjHOD2FBfqaXnrO4qqqf3Sg6mCxjkMbjB
	ahavDt/VSCAEHA25CynfQRVASyIXLATihb8aCHsYP2liAkQ50+fKQ7OzK/HGdHXvh5HfgZgG5A1
	ISLQ1QSlXuc/pF9SItTq72qUYC7scll5/N3uaiejm/E+syKw==
X-Received: by 2002:a05:622a:1116:b0:50b:2dd5:2be with SMTP id d75a77b69052e-50e3664722dmr95573861cf.13.1776525305318;
        Sat, 18 Apr 2026 08:15:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1116:b0:50b:2dd5:2be with SMTP id d75a77b69052e-50e3664722dmr95573061cf.13.1776525304851;
        Sat, 18 Apr 2026 08:15:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1106sm1406673e87.53.2026.04.18.08.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 08:15:03 -0700 (PDT)
Date: Sat, 18 Apr 2026 18:15:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add memory-region for audio PD
Message-ID: <v4nqsxnapoyrfifcrjjunhu5s4ggl444nj7gdonghqmhbijiej@fzafvs2igmeo>
References: <20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e39ffa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=fWzJ4JuvnLyy3v9PZgIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: luMGeqlhw7_w9lSgxxmymcy6FZauaaTk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE1MSBTYWx0ZWRfXxh29sUG1PR+8
 CavOwhbjDYji382xhavlWSwNQqK40Nt4nRDsxM0wZ/LeshbXbIq3WUQAXiumtbh2Z8txHrv+yuW
 EJZNRd4S6VyNFUL+sBOEJ0jQBvYhJLYzvtPHlgHap7uCfo27fYLCqGNo7YVJOrRAf5guqfMANcR
 xhltlgydunSvFP3DpjDYx1Bg7lVnSq9kFjh5KjgTGvXPviOdM95+Fvpg3rpruoQNsvWfAVqefHL
 YQZ25OamC5c/+uahE2Q/ctSxOonBMT0ptnExSA3iRXqb0olfigV28XqbYBQNy1ejktbzkhS21/P
 OMcahLDKuBwhKTKoKnEyzxMuUAL1BcY9J3qYULGRDhw+BuiCCuJxIaS0sgCKMKAYd9J7JExNXRy
 LnxB8Mef6ei3WDtlQFsiXISjjx0R4wJWlpKveffdVmjCrqKFb8A5aqW3sbmSGWu3MquUAv2ZJlX
 +59UB4upf/Ba8dAh2BA==
X-Proofpoint-ORIG-GUID: luMGeqlhw7_w9lSgxxmymcy6FZauaaTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180151

On Sat, Apr 18, 2026 at 11:18:01AM +0530, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index ff5afbfce2a4..c36917d6e0a9 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/clock/qcom,qcs615-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> @@ -657,6 +658,11 @@ pil_gpu_mem: pil-gpu@97715000 {
>  			reg = <0x0 0x97715000 0x0 0x2000>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@97717000 {
> +			reg = <0x0 0x97717000 0x0 0x800000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc: soc@0 {
> @@ -5100,6 +5106,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +							  QCOM_SCM_VMID_ADSP_HEAP>;

Align on '<' symbol.

>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> 
> ---
> base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
> change-id: 20260418-talosaudio-b8ecf8b9a1b3
> 
> Best regards,
> -- 
> Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
