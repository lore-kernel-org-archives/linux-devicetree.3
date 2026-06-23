Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD7394792
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207474; cv=none; b=fMq67kNhljYlPl4Xdp6Lpw7qNTKjSScb7Ue9fEJEbsYmhAVw9iCOO4sWwMP8CrfFTpTOwt7QZThSJtOPugeP5ne/Je1F7yZf3Gg2D+j0/X45z/Tucla+usNn3zp/xYKoRRD58yZqnCxWJm0JJb3RSwcl7DAZs/Id55nnwDfCcuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207474; c=relaxed/simple;
	bh=2wVq63q5P0hf32yJ9O1fniufU7zytoJEohnw2ghclDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+S1RyJqtDVDd3eSzhQQmWS0s/c33ihBsi/c3BWWhoGWcrDLVgio78reNZws8iiqSTDy+xt1hUNcQN9rt9O9OPaSrLoMmMQuXFBX1lAaWbm2ngNUEb3EDzP0+8425l84iOUgWHLOjScVqejVLo7JmDRZ/SVa+hN4D/j+m+a1FDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUKWMtJq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fneRlcVp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUKWMtJq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fneRlcVp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6d9cn3376170
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwtP61IdAgBU22DmFB1IdTuyyl9/rAce+FGuyNSJ3Fk=; b=PUKWMtJqbTB13do1
	1kuM0dIsQrTO8MZuuAODDNZssgXsyorwE33rwgH8lX5G3WrlZFXlWtnP8Dmz2X5D
	TK7sGvUSHHj+710p11cYyCH200Ei+JTNQj2yzccO57X/9njZ9iqu0d22af+9zrCF
	OV7DGEXPnM5yR0RapB1jxozVWkDtVcwl2zt/6SxYccaBjcDeWIKqQbkXqNaVLB1i
	IlmDHbpIekraiDTXmBy08vugiaLVr0To/IJsZGzqLj/RpmYuN74js7if7fxGvy6x
	TI1TIcqc/PKZJHq3OcwpxgY8mCUpwAUdqepEezehIB+2DbuLJ3aEPbM2RlmtsoCc
	AnPTiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5yec0nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:37:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so17025271cf.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782207471; x=1782812271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bwtP61IdAgBU22DmFB1IdTuyyl9/rAce+FGuyNSJ3Fk=;
        b=fneRlcVpqrx5sykIJ6tIknatL6BvgzAtlQ9FaY6euEpULlmEx6jO6nJ2hjT6ZFEOu4
         aGmIQ7ynppR2wgGPq4Rglp1pYrBpfzarRz/6+orTl+EUZldgZ7NjtBqvDx43Witl472t
         1Ek5U4uDPOfu2fC0y8NMvk7ugV917Eet+H/Sm39+jKbYc7npc3pgnCo/vuEF2pO/V5z2
         jNgV2l1Eda4XHKAxxdP+wfXkE40kcV7kOExY47PqU+/F1tZgVbrLdgO6E2Wz7ObNg1kL
         AKfqTWGlkRU/Jr5czwrTbpTtsa94khWXbLyVxRhR3Ugmvj2zOn5D0JSsYH9oInoV3lH8
         wQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207471; x=1782812271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwtP61IdAgBU22DmFB1IdTuyyl9/rAce+FGuyNSJ3Fk=;
        b=L3gihzmrchg5YOBpoLD4H80oJYBt8Y6u5J0NtkBmbWvPhpbfBXGrIoDRgJByNowxS4
         m54pSDnDQwXiUF2n1ndPSSvSSSuDecwtegxEsT4AZPzOqIOIvuLJMImhI7TXlU9Ego0d
         QU49WkhDxWHBeH/0TmwJKzlIi8Et5ahTo8z6ITZiUX0HRp46vwF2EY527ALQrsLi2hzR
         yxCAV+FRO1WgCgnTluWna0Ovm+rXJ/4k2LnDUUpxHDuPJKwH5XO7m3a7PezV8BlKBnMp
         EDmhpRjyL2/9gKvwAgt27i5/xYB+L4StXlHIu1f0qyRqph0tmLzwt6jJLBhIM5wi+OV+
         UiEg==
X-Forwarded-Encrypted: i=1; AFNElJ+4x8v+HWJ3gT68D37KtaBiqtFngtINB82MTDYaFNBXjcomNcWluDfz+ANWvESKVMlxp02idYBO0Pk9@vger.kernel.org
X-Gm-Message-State: AOJu0YxoSP8dL563DJPm5iIyDHOYt6a2GEA3RcRec+TqBvdAO17EbSWb
	HWlxQ6vUzMrzIX71xmsojCXh9/LpYULKijs7+/nPN/AXaA7mQscXGN+D0yf6APp+JgiyH0a79wm
	FmSkiO6b5Q4kzVDBVwp8EGPtFU3/pzUuVeiyp/ZsLoFZjt434i6FB1Vh4Mjq5fe2q
X-Gm-Gg: AfdE7cnIYWJhQmrFxGfxXnVs+2290dnuJxefbcULFW5jXQrOy9QX9MDUgP4djAfhEUl
	ZzzVYMfbBPq2geT6lNJJgnlhYs+QsnKcZhQ9PadJB23iryKqaH9BS+uU+jdITtrJ3cAijpyX41b
	FJogeJAiLfbC5qbDWjMe1EzL6uIq26n+EedWHRT1OWK9yq9QuqPGWbPTgsWqxOL8b85QDDNWtI/
	cI/udsQ8lOZSUVsusa3soRRyCwtsCs5KNJFbaHDjOM89IleeCEKrqjaYKn59xxavaU2xbWXetoy
	x/Mm865r0J0VreX0aaZQiFT0+HA45hVqrVGhg88yaFfMbPbSIjgY8qMAgaeUSu8z/Wq9mxppShQ
	U1p9Nl/CEkPWVCjYaLaV2MYoRe4nU0CdzhJQ=
X-Received: by 2002:ac8:5d56:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-51a4f4c3867mr43266671cf.5.1782207471038;
        Tue, 23 Jun 2026 02:37:51 -0700 (PDT)
X-Received: by 2002:ac8:5d56:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-51a4f4c3867mr43266391cf.5.1782207470362;
        Tue, 23 Jun 2026 02:37:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be31c73sm4549155a12.17.2026.06.23.02.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:37:49 -0700 (PDT)
Message-ID: <806046b2-20ed-437e-a7e6-b3c0699f5a2d@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:37:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add IPA support
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
 <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WxVn-sLmFJ2U3WMH0wItE9vpzcFz3_Xf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3NyBTYWx0ZWRfX6oUl03Oux+Se
 AO/yH6zNmH/4j2+9WwtFfbNdx/p0jlZlpWJEh6TBAaDHc+/VFiuwBhsMgb8YF3T8tPDoxOLqrNV
 7czyhRaMQC10A+1pRgW877xOPNLPQx8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3NyBTYWx0ZWRfXwtohZjoljuMy
 TRLFnpCa9kZjsVbTBeC0hGZ80LGos6U7YdPPNpvKphk6zag+UQwfyjl0t9y35AtZbDY+Hewkk2P
 D3QokEzoTIY6s5wv8xDL5KR2X1T1A86+xB5RZjtEWJsHUsoLUpSydu8NnWZXz86Mcpqjnb1o9gw
 kRxeUU+11eYwI53VKUKrBgQC3+jRD7OXmZZpp0hRfmbtRx5bOgYkcnsAULENlCJiQcEpJJJIkfb
 9mT1w15WWzXfd6O++lT/wDgpwfVaYK+qM3VhK7vgPfFFWtxqvPuczNMChpUAvzWUHFbm7dn4H/B
 /kJ6+V7Op1ImmgnEb6eKeWZLSB523Vr3KEsyoJuJYd9C4hehUFg1USaRFioslFWl2gKgh7Wpk2L
 I1rj72Yyp4rhODNIqGBGT1kfE1VOuIVfE4gPlSvx0tGJ380dXwjztMDE19wKaEhrWOiAypG3cT/
 2omCUSweCOQjYpGDKJQ==
X-Proofpoint-GUID: WxVn-sLmFJ2U3WMH0wItE9vpzcFz3_Xf
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a3a53ef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=brZ7cBQDmfkCTKpPTsIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230077

On 6/23/26 3:44 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Add support for IPA in DT while expanding the IMEM region just enough to
> accommodate the modem tables used by IPA.
> As reference, SM8450 uses IPA v5.1.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

[...]

>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 55 ++++++++++++++++++++++++++++++++----
>  1 file changed, 50 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 56cb6e959e4e..c904720008fa 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2639,6 +2639,47 @@ adreno_smmu: iommu@3da0000 {
>  			dma-coherent;
>  		};
>  
> +		ipa: ipa@3f40000 {
> +			compatible = "qcom,sm8450-ipa";
> +
> +			iommus = <&apps_smmu 0x5c0 0x0>,
> +				 <&apps_smmu 0x5c2 0x0>;
> +			reg = <0 0x3f40000 0 0x10000>,
> +			      <0 0x3f50000 0 0x5000>,

size = 0xb0000 for the RAM and uC regions that the driver seems
to poke at (at a glance anyway..)

[...]

>  		usb_1_hsphy: phy@88e3000 {
>  			compatible = "qcom,sm8450-usb-hs-phy",
>  				     "qcom,usb-snps-hs-7nm-phy";
> @@ -4970,17 +5011,21 @@ cti@13900000 {
>  			clock-names = "apb_pclk";
>  		};
>  
> -		sram@146aa000 {
> +		sram@146a8000 {
>  			compatible = "qcom,sm8450-imem", "syscon", "simple-mfd";
> -			reg = <0 0x146aa000 0 0x1000>;
> -			ranges = <0 0 0x146aa000 0x1000>;
> +			reg = <0 0x146a8000 0 0x3000>;

base=0x1468_0000
size=0x40_000

Konrad
