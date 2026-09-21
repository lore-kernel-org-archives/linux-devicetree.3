Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ABD457E71
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990658; cv=none; b=DBzq+P8eSCYJPpD458Yc6ZzsnoxUr7SKnKNZwKFw5YS5M+p6+cuYIODFakfsrDNuvXyg9POTLreRp7vy/ndMx/wB1qtSCAy0L4yM9e12MIKb+TzMtGYwgBi6TH5I3GKErGttll9FJzZ5yLIJiLAtIpzrJzo5bKtV6/OFvsCGqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990658; c=relaxed/simple;
	bh=/kEURet12G5FSZnVX3MjvFTJwDIqrxFW27XSiA3Bboc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SYkHSB+E57OyGG40bJc66SYGqyN305/VCG6SesgvO3bTsXRLovml6b4Y0p328EVlHJfc0gnFh2sNm9w96BhxB1eHsLnUbvctvdpx5T6/rqfU9M9HhC7fxp4l92GlWYdaKOBxR+tjb40/ukKOAyQUt713CfRi65d2rNhTrt4KDiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ae37Tqjs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GwU4ocIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ae37Tqjs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GwU4ocIR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdo801217553
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ldSCCQUbN0yIvEs2nrmIuR/2PtGFwnoDR0CjVLH6bk=; b=Ae37TqjsgDsPv9sg
	vQEMgfvykwQBAydcFsMoZLMG1IKlhH9PosIdCEmu2XBwLXyGneqVI700cE0EC8/D
	jiOMqv6ygB34bz18yWaV2w8g9ER5X1qBuu5LZXegGawDqLxBh2COTcAkj2m4qdyK
	1plDd7ieQwtFUt5rIE9rfEQwtASg+GunOpL2JOEo0baExUPFHrNO2SvXjnBRBFmW
	WQnP+F5pV5JTfsFTp1NT+A4pTAB1UqQGBBveswEmFE39MQ2xW+5dXXxgAP2F+niw
	Fh5TjXgQXaj5KliiQWEaDfJoolC5d3hj205ZT+oo9g/Lz2rlnUJ0oJWLFaf8NguS
	YCbjHg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01191jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:37:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a6634ef51bso28030137.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789990654; x=1790595454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ldSCCQUbN0yIvEs2nrmIuR/2PtGFwnoDR0CjVLH6bk=;
        b=GwU4ocIRj4dHS55nIoxOF78wlY/zBip7vc79cxhqiCZBPb6e2wbIaw0xA7PsF5AU3h
         ZEhW1V0MHbJ7YAQ3tdStsNBt+LYR1fYerVnJURQMmhNXXtLY5OgJnIgl0F9xaRgfk2tv
         icelt5uo3gb79MAjHUUg5FZaZcIh2rQ8K3De3lOyYragaxX5PI4WePsjtXAj+Wojgj6l
         oecMTgMwE+FJd8VosF6WkFeAzaDVLErT3sDYzKCN5tO30jx+K3PgtKZCK9794/GdiU/d
         938KzfE+zSgqUjACjLHhc8h/IL2RBPaGy50a3b5NdX/uizaLxyE6+yV17dizKyGqbdI5
         bzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990654; x=1790595454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ldSCCQUbN0yIvEs2nrmIuR/2PtGFwnoDR0CjVLH6bk=;
        b=HvvY1Vcv7qpVC417RlC2J3YMB+qAecMScm54Tu8XREEkFNy4txkgbJkrZQvKBvJ5yo
         S9Xrf9YP9mJRCHZBlAmxAdmPyR+7OIbHNyfvmJ/U49wZZoCe/BP9ucPQh3B6/FDA9TDZ
         xn1sKna+ydltWYvefOXH9Tygwq+ROJg/r8ZyN4ST6rsd+zA49SkSLnHsCm8M9XJgtqVe
         u0PizViBOYglXPiYw1A5D9BOtrJ8Ic821GC1iZNuhSQaa9Rp+eGa1vgeFguEbTBJgrIr
         TWlPF32QCqnqJuD6yjGEYM2gtsi8ZiJft3d/QMD3KIGAfblcL8DmDsVyUeE7Gf/jxDHj
         jssQ==
X-Forwarded-Encrypted: i=1; AKwUvBywI12XvhOBtJIZIxbA1tv6czsmIE88BZh3FGxCsjcnvhJ9wRZXcaS4RsFJ+mFdJL7LTfDcHanxXaAP@vger.kernel.org
X-Gm-Message-State: AFuF++n0AxE2GTUYJFcvEw6zJ486v1SOwvbfYNbpM2YtG7AClhPLsWgB
	wC3Q3QrdFKYxjC/EZf+gSS7IEXMnbNI1F9a6vkiHkl3sWa59wzrczcRDN5KpbJP8v4UiBt0Ppn+
	0+B06ZkRy7tAz60+/rkdjVMhq0RbypOOCKDdzIIRxI6K+MxvO6dB7u6afdZeAqfTJ
X-Gm-Gg: AYBFou1ZOkcE7k3xrLbufgX7sDlgeMiT38IYMWttkdhmK5PbG1QIpPJjmLyQoewf/nZ
	fODpLwMej5p+sJ4Pyfol5+vy8hRyNDm0uI8+vLAHVnOzelf3qpVnDScwj64TkB9NUgsmS7vx8vk
	Ubmlo/d6q/KHz3LTc7xOmi6C4BtDxsmzbcBx7P/GKMho6AfqcplYYBmOEwlZqOCOvy/l798+bwf
	Da3ClP1mhEVYzMNfu0RDVnIcpk2qUshuGANk41znDVCEBrwv3ImXEuw6/kQrWFQ2/b7oorESQFR
	hP8wFXz9f8sSwmpKDWwKLGq/lp6thJg4YihKXGuK2kboHnOBBNJgAULV/NFKhHmKHG5cgfEfIEL
	RG0+19kSXrWANinXeYCQS5Q==
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr1849147137.2.1789990654280;
        Mon, 21 Sep 2026 04:37:34 -0700 (PDT)
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr1849136137.2.1789990653766;
        Mon, 21 Sep 2026 04:37:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3572d4d5sm285294666b.33.2026.09.21.04.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:37:32 -0700 (PDT)
Message-ID: <8daa32e6-f140-44d1-a2d2-c475d8a5959c@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:37:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] arm64: dts: qcom: kodiak: Desribe EUD UTMI routing
 and connector mapping
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
 <20260912225301.3396556-9-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912225301.3396556-9-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C7-w7GOwJdo-aWCO0gx3a8HW2386-Aft
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab116fe cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dRlD9xG63GnEMi0rZ4sA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2NyBTYWx0ZWRfX94hkMZq28Jy+
 g91AobPUQDgIEGe2tFlQyZIIKYvI4nlcM0X4GB7zpMAmC4PHnRE1bvWJg3FV5IwshKrSdRLgI/0
 h5ybMTfqcNzY3V8TZ+p8apKnI8PdKylploQZ3hx/h7L/eB1EaR4lyf1N8URLHHmyXO8f0bHbWIF
 fR+RwSxF04penwz5S4sfAq1zqX7W1tmktEac7MkAufQgMYVY+IABcNw1/SovH2G5xv0sDSnOSjL
 tN20RjgZrnZCvu0iH08Jvqr7gTDLF5VWCEJJWFZPlHux9NeMX9NcVl2stjgHXkYCJCphBgpoIHt
 m01+mio4mU/L1pt4gJUc+MwGHPeawZUJqrJY/e9fcsRlL4KFlKWeYf4mKRClpDZg4u2JknREsg9
 QIBVPvAUZCOpxxQOm/10+LzaKr9eLTYxA3Bg9lrKUdMlluqLk600hRt58/HwXT8LuMJJ/hik+s6
 r4fYovl4Epbecf08hkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2NyBTYWx0ZWRfXzybxaDJgWF6N
 MpJgHw8G8Q8N6utRdxNt86mIoqhOtYM1MwwwYZrkEDdYTxlUPBEZL8r5+TVl2wDpcfBdhRTVBCU
 y+XhCEmShUJCRUQm8WT/f2ThK+afGmA=
X-Proofpoint-ORIG-GUID: C7-w7GOwJdo-aWCO0gx3a8HW2386-Aft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210167

On 9/13/26 12:53 AM, Elson Serrao wrote:
> The existing EUD description uses a legacy single-path representation
> that assumes uniform UTMI routing. This was sufficient for minimal
> configurations where the USB port operated only in device mode and role
> switching was not considered.
> 
> Update the description to explicitly model the topology using eud path
> child node and add a role-switch declaration to reflect role-dependent
> UTMI routing. Also on this SoC, the EUD hardware intercepts only the
> primary UTMI path. So remove the USB endpoint mapping to the secondary
> controller and associate it with the primary controller.
> 
> With the intermediate EUD node now in place, update the Kodiak board
> descriptions to map the USB connector endpoint to the EUD instead of
> directly to the USB controller, reflecting the intended hardware
> topology. Enable the EUD by default now that the complete topology is
> described.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index f41ad446a39e..b1f1ff6b99e6 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -98,7 +98,7 @@ port@0 {
>  					reg = <0>;
>  
>  					pmic_glink_hs_in: endpoint {
> -						remote-endpoint = <&usb_1_dwc3_hs>;
> +						remote-endpoint = <&eud_con>;
>  					};
>  				};
>  
> @@ -1530,10 +1530,6 @@ &usb_1 {
>  	status = "okay";
>  };
>  
> -&usb_1_dwc3_hs {
> -	remote-endpoint = <&pmic_glink_hs_in>;
> -};
> -
>  &usb_1_hsphy {
>  	vdda-pll-supply = <&vreg_l10c>;
>  	vdda18-supply = <&vreg_l1c>;
> @@ -1573,3 +1569,7 @@ &wifi {
>  	qcom,calibration-variant = "Fairphone_5";
>  	status = "okay";
>  };
> +
> +&eud_con {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};

Label references should be sorted alphabetically within a file,
there may be slight deviations because the tooling to enforce
that is still under development, but let's try to not add more

Konrad
