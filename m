Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0E13822B9
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705475; cv=none; b=OVi63hig6i85a5aLF8hH9oq8RHTq+RZ9yu9htErxtFSLxiYiWAxVkjS5hYlUYLii0jOkn40Ar/Ex9cgWJbIiinlXSAeR/fEzX2N4ZNzbyQTJ4WLvxOA+/2cyFSSJIwnfsU6HAYBnmgttSJ/8aAYkTUS8rctoII9LlfKIfk+NSns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705475; c=relaxed/simple;
	bh=mDLLtU4TFfGQ8msmT45y2EYwAq7Bn0q5hG9yp4xBWic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezXcwK9cxinWTtxZGmIap0n7xGtL9EvK8+CrF+35wGmhbIKlppmKG5cD1f03d5ubnWLflewgbu3beuZLBceAKEfr+M5AsIRa8LOaI5P18cdJ5cjZQZIZfB4Em38ErG2p45x/1n0NX5klrR73asy+9r8Ukc1M8xT2zmWpA8A8A10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iuj11DuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3e5V/pO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iuj11DuI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3e5V/pO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAw9m2524398
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMgU7G0PULtWal9zMMhkYiuEJrUUShzsoQegQpN3nxE=; b=Iuj11DuIde3Bi/3W
	bYcwXPOjbSvOfS0g1ee6gEwAzqVu9q0mJYBm0aOqlUt99JHG/F2tCD8VNaJvwNMY
	nWLdT7jh054fEz72rlCIp1NHgLDyh6I3J0Nwdk1tWKlOWQAfExYLuo3mIfCVKPXW
	MiTRlaLRGsPYPywqnXsfj8Ve+Jk4Op5YacHA/9SySKcsqKTSp1fNDkT0Imm5lyy9
	pH6LHYf1HPS67rRcqA5jMViPw1sAuVX7QhrfNfHGGIMErl0+2TZKt8lFhlqoYXug
	miPbhXs2ivFbTyew2QE2Ke/1gOhk1ZF58K6F+yMdf86OqATj1md15ritP0PPQ+wA
	bVzEjQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjh4t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:51:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba115ab6bbso70350615ad.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778705473; x=1779310273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NMgU7G0PULtWal9zMMhkYiuEJrUUShzsoQegQpN3nxE=;
        b=A3e5V/pO3miTPjf+rtJpxoc/LQj2VepCYmywFc8aWkStN1+VrfUWjcIZfp2S4AR5jq
         cvksQnmHsUAvdovlKiBTxHfRMNrAWqn6nIU84krc4DHxEqU3tqHOEDCEIf0IhJtI3QCc
         z76X7SAbHraXFrOAW9NWY43gnGKgOIW91NkFVww5HxgMlYQR5ZZ7xHRV6ujf0Gvac2e9
         EhAB901js5zoyEVXtd+G5lPOJlmrH/7XmzfgdlzNcZqZaOHwv4H+OhF658YRAHlUWjz5
         qDjFeZZAhL07nlYeoCMNJbivPRM+3UEGfefS6ep1W5p5le87j9fY6wVp4em5i9fhJLgH
         ucvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778705473; x=1779310273;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMgU7G0PULtWal9zMMhkYiuEJrUUShzsoQegQpN3nxE=;
        b=Yq95wtcUWkJu8GAG2FoJEquOiiPbv0+/5sXYgehwfY8icNBggdhc5CEtBE0iWXFsHl
         rzh6JKfRdhiCk1WBWsnm88UtL4IupqjGcy84PZ9T1Oi+a6Xnma96W8U940O2nra8Qscf
         vsDutZETfE3f6Ua+vv4BfYNWURslqpYIn7ySWWmnUc39yYOWMJuypA7Bl3JCtMBbf7Ej
         v0xaFKPh48qs/3+lPCNnFjzhi5fs03gVRQZKkzt6WokjFuSOCUhECqB9COhh382f9LZt
         9VTq8Pzh7GHxOCoNBda3QCuxxIXoPFChFaTfhD43aqaUBcbnu0+iKi7nEw/7HA9JXWqZ
         ImlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ARM/V0KhJT8zeUHqimT8wcmsHNsHg/5fweWf+APV50sF5WxkCcwAp9xTANyZlIxGVNYKP7yGAjdIr@vger.kernel.org
X-Gm-Message-State: AOJu0YzWF4Tn+FQ0c1sQwZvTZrgCWdNNEqyqUj1n2/EqTqJVfAuAz4NQ
	cjFiXa6oeStNyi+5EYrs9n+IDgbXrntKn4fUNhKmF5VUyEeYp00OWRbfTHNcO7o8N9pCXOyynky
	xzWpg5itwHBS4sMf6SEqCBGb+kyJVPrGdG5zxJLHPBOuUV2Bj+SOxAPD/EqinSpc8
X-Gm-Gg: Acq92OFmEA/+CPFz9vjWHIly3v6z3x19U9amdOOLFW5QtzVQx9T9vjDnp9wPaMeHRAK
	1b4Oa7hEfx0a0P1gHKrUG4YOYSUrekbXP0Td33yGRm5Efwj6pzpOFuXfaEI9GAPPSRzq6BVXkKs
	O54+SXa2lqK22IKC74KklUJTEHHx5F1jw1iiGUZEMYZCLH6CvAn4eHiFQXcKQGge9g5CYBGXTex
	Wvq+nInUkQhslN+KmB5d2i6gtZMegiRmjP0LlhB2f4zHNrKhmsc4oCJDFFgbCZsOEMgPB3DRetO
	nBsvr3GCl+2MEJwfCewOxIw469RAa1FO5n4rIOg9PJYiWP7rt75K0xTZ/4OaozQoj4AEfPXlfJf
	Mr2RLNMeRQaeOjMMfzEb666TtKZNBdnRJbNn1Q4xn8wb1
X-Received: by 2002:a17:903:1786:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bd2de35393mr50799815ad.19.1778705472347;
        Wed, 13 May 2026 13:51:12 -0700 (PDT)
X-Received: by 2002:a17:903:1786:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bd2de35393mr50799335ad.19.1778705471848;
        Wed, 13 May 2026 13:51:11 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.229.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f36fsm1595235ad.21.2026.05.13.13.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 13:51:11 -0700 (PDT)
Message-ID: <9b3a3cc9-c53b-48d9-a5d1-245b9be894cc@oss.qualcomm.com>
Date: Thu, 14 May 2026 02:21:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 7/7] arm64: dts: qcom: milos: Add Adreno 810 GPU
 and GMU nodes
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me>
 <20260502-adreno-810-v5-7-bc9fd2bb788d@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260502-adreno-810-v5-7-bc9fd2bb788d@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i4wyH6IkH_AI9OOkiKdU-jWyqDyJhkHn
X-Proofpoint-ORIG-GUID: i4wyH6IkH_AI9OOkiKdU-jWyqDyJhkHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDIwNiBTYWx0ZWRfX4Cwby0KXslsf
 68AwoCr4qv6DDSXn+TD1mQFM9NqZyp0e1pWEzCgsDlllX4/SeQoK+yr8Rzga/tmeBiBqrRwp30p
 /4kR+4oHfHKTMhT7e+i2wCGvUwS/HxSzioQy22ZaALcBt97q/k81jelnDycSSBDjSlg0M7Hk/yD
 1UWvEoVJvFm1ikVdfTwXpuLpOCnRMBfJQZZp3tx8IKz084wFTUqtW/x8Rfa7KSpxD58FpijjKkw
 pT2r4gdjk6WoSRYlYhhB45XDoqZHUkyc0nRa6hY/nFMNxcrfrfHA0KHByHEnUpz9WO2bZt0uXB2
 qBxdVqg1szisnzxOLCdeEYMdqn7d0v/PJ39mIsoMy7/l3wMEH9eQiI09nisgWADfDDXhm5TtLN+
 +cDYBwwyBsl6mn1OzXu+uznOcaaMm79pLCRnAXoKSFM5cqFkJN9s9vVG3GYrLnGkB54MTYsuzxf
 d8qV2x1doFCtjwkoefA==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04e441 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nm1BsBjGsf7C+PoY3QnOXg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=E6X0ssOTjsGwspkTZlUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130206

On 5/2/2026 1:38 PM, Alexander Koskovich wrote:
> Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> Qualcomm SM7635 (Milos) based devices.
> 
> The qcom,kaanapali-gxclkctl.h header can be reused here because
> Milos uses the same driver and the GX_CLKCTL_GX_GDSC definition
> is identical.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 166 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 0e7cfc12b0d2..4abaef42d7d4 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
>   */
>  
> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>  #include <dt-bindings/clock/qcom,milos-camcc.h>
>  #include <dt-bindings/clock/qcom,milos-dispcc.h>
>  #include <dt-bindings/clock/qcom,milos-gcc.h>
> @@ -1554,6 +1555,171 @@ lpass_ag_noc: interconnect@3c40000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-44010000", "qcom,adreno";
> +			reg = <0x0 0x03d00000 0x0 0x40000>,
> +			      <0x0 0x03d9e000 0x0 0x2000>,
> +			      <0x0 0x03d61000 0x0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory",
> +				    "cx_mem",
> +				    "cx_dbgc";

I re-jigged the registers ranges for A8x GPU/GMU. Could you please
follow what was done for Glymur here:
https://lore.kernel.org/lkml/20260513-glymur-gpu-dt-v4-5-f83832c3bc9a@oss.qualcomm.com/

And with that, you will need this RSCC update in the driver:
https://lore.kernel.org/lkml/20260513-glymur-gpu-dt-v4-1-f83832c3bc9a@oss.qualcomm.com/

Rest looks fine to me.

-Akhil.

> +
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			iommus = <&adreno_smmu 0 0x0>;
> +
> +			operating-points-v2 = <&gpu_opp_table>;
> +
> +			nvmem-cells = <&gpu_speed_bin>;
> +			nvmem-cell-names = "speed_bin";
> +
> +			qcom,gmu = <&gmu>;
> +			#cooling-cells = <2>;
> +
> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "gfx-mem";
> +
> +			status = "disabled";
> +
> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&gpu_microcode_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2-adreno",
> +					     "operating-points-v2";
> +
> +				opp-264000000 {
> +					opp-hz = /bits/ 64 <264000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +					opp-peak-kBps = <2136718>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0xc8295ffd>;
> +				};
> +
> +				opp-362000000 {
> +					opp-hz = /bits/ 64 <362000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					opp-peak-kBps = <2136718>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0xc02c5ffd>;
> +				};
> +
> +				opp-510000000 {
> +					opp-hz = /bits/ 64 <510000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					opp-peak-kBps = <3972656>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0x882b5ffd>;
> +				};
> +
> +				opp-644000000 {
> +					opp-hz = /bits/ 64 <644000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <5285156>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0x882a5ffd>;
> +				};
> +
> +				opp-688000000 {
> +					opp-hz = /bits/ 64 <688000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +					opp-peak-kBps = <6074218>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0x882a5ffd>;
> +				};
> +
> +				opp-763000000 {
> +					opp-hz = /bits/ 64 <763000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <6671875>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0xa8295ffd>;
> +				};
> +
> +				opp-895000000 {
> +					opp-hz = /bits/ 64 <895000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					opp-peak-kBps = <8171875>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0x88295ffd>;
> +				};
> +
> +				opp-960000000 {
> +					opp-hz = /bits/ 64 <960000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					opp-peak-kBps = <8171875>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0xa8285ffd>;
> +				};
> +
> +				opp-1050000000 {
> +					opp-hz = /bits/ 64 <1050000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					opp-peak-kBps = <18597656>;
> +					opp-supported-hw = <0x7>;
> +					qcom,opp-acd-level = <0x88285ffd>;
> +				};
> +
> +				opp-1150000000 {
> +					opp-hz = /bits/ 64 <1150000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
> +					opp-peak-kBps = <18597656>;
> +					opp-supported-hw = <0x3>;
> +					qcom,opp-acd-level = <0xa02f5ffd>;
> +				};
> +			};
> +		};
> +
> +		gmu: gmu@3d37000 {
> +			compatible = "qcom,adreno-gmu-810.0", "qcom,adreno-gmu";
> +			reg = <0x0 0x03d37000 0x0 0x68000>;
> +			reg-names = "gmu";
> +
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "hfi", "gmu";
> +
> +			clocks = <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
> +			clock-names = "ahb",
> +				      "gmu",
> +				      "cxo",
> +				      "axi",
> +				      "memnoc",
> +				      "hub";
> +
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
> +					<&gxclkctl GX_CLKCTL_GX_GDSC>;
> +			power-domain-names = "cx",
> +					     "gx";
> +
> +			iommus = <&adreno_smmu 5 0x0>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			operating-points-v2 = <&gmu_opp_table>;
> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-350000000 {
> +					opp-hz = /bits/ 64 <350000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +				};
> +
> +				opp-650000000 {
> +					opp-hz = /bits/ 64 <650000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +				};
> +			};
> +		};
> +
>  		gxclkctl: clock-controller@3d64000 {
>  			compatible = "qcom,milos-gxclkctl";
>  			reg = <0x0 0x03d64000 0x0 0x6000>;
> 

