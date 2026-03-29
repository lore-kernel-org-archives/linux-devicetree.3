Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DCD37D12A
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800212; cv=none; b=fwk23bk9V9xfL3KLeTdFDvgXQ6vRYWY2gIpeOqT0wXbb5UjzF7W7VS6NM4881/ENkcYiveql1sCvEkaMEW0m7aDUUL9BjPg6iQWEVV6xxP6UYWP4/+EdLt10IpbP0iYxMbYZRDyFFi/CZ5VMsrhLgLpVefbmDn58bT42HxN7cDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800212; c=relaxed/simple;
	bh=vVAcck5njtRDIV1iPS+5yQiR9dKIm18hvn4R6zET0S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INitIRnL3vwOweyOrxGPBdT7utHCr+llR0uMqyhsGIL6jl1ILnPPpIOqGh0Nb8VvsTA3DKSnFBB7H3PdXSZTydNBC+lc7zEA18/69XRuHk6f3JDmf2wXHdi9cLBWYJ+/YHbn1q9T5pNtAKoqQLzA29sc57ceeiLIVaFCt9GtYXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McXUm1GI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGToz0ai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McXUm1GI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGToz0ai"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAi9WH2504744
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FFtg6F9AFBB1VTIfGAAKSLNs
	Y0AlXAaA8vEU9grObBQ=; b=McXUm1GIrhXDEtCKUtThfevK74ohEveusHslbKw8
	C71peAfE6W024PyJlAJqkSwBuR61IEcW3OBxI4RObFstG0Lc0OjF2uqASkM88v83
	b8MieeZxFR5MKtRAhnIg1DudcsVZAwpxhW/erhpZ0HzFpzogU+UhkVN4HJj1WPNd
	E5nFJLt/P4B/3+3Z79WVFb+lfMrQu550EDp7XMGXTY/80el9/+Kucpegdo2+jUDM
	kGwp2i1noafqdxjcpxviXShwwvnmzo6yjyYaMfJEk5wYPfqQqnv/r5USMtIZdg0w
	EFE1ZxFWeQVlmMfx08OZ+R2ubIIyf8l7gAJblNBOKW5mgg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afu69w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:03:29 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56cde1ba19cso3027063e0c.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774800208; x=1775405008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FFtg6F9AFBB1VTIfGAAKSLNsY0AlXAaA8vEU9grObBQ=;
        b=SGToz0aiwk/A8K6nzRao2WO+Ie9Xgx1Swr1otNWXAROdZhHTHfIVSMUvmbU4J4KoZN
         1cX3WGnd8t5ui9u0fC9vNzjWUTv2fkFwzxtmA3GwZA6Mgs014EMfckompdPT8QRNIfac
         8d6vk8c5Wzu7J51RxbuCGDdLcP2AzZM9zEJvbEoyWZwhQ8LLb2SUesE/356imhpmdTzl
         wL+56vYQxZlKoE0ML3kkx2yFCdK7m032QtqpLc9jqehMKyEQCBb+4LXWM7u/8/5NxRuC
         ttNZCNZR+V6iTFAG96n3F1dtDS2GIrlscapE0r29t5BYkXgCtTXavO+SdWVhkmoua8MQ
         GXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800208; x=1775405008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFtg6F9AFBB1VTIfGAAKSLNsY0AlXAaA8vEU9grObBQ=;
        b=r7bu66UL2k9fA6+TSkXodkB6a8onWGLdPJtda7+GnYgnWb3EmXAY3XSrswSeiTCYJ+
         TODuSFQ/w8XZROkfsrh5TzvOcoXEmhnYhB9qm6VJKU3t/3A97J+Ek60kdA24iLSuKIyd
         vyP6wxuNPEFXfgsBN2k3oPhVdJMWyBmGG6+FwBRDXhvReGCj/nvYFY+pF07lU20WIE+T
         0o8Kx0T+yp6F4A+s/273gHiDfMwDDEpgymDXHEiEJrHQiU6FtX1jEw0eVhJRxrjvAwtD
         4TQRxszXBf78Ig1FURvUYja0spQozi0FeAgEQM1XScL5dzy9zY6KrgZY3AYt7UwPYufY
         0Wzg==
X-Forwarded-Encrypted: i=1; AJvYcCWfNvYqIg29zUo4JibVBp9FqhF0Sh4lAAi8ITnlST0n5stupCRJGK4Z6CkQvcvmuEmm64gYflAM3enO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgyrk0icjv43y9UBJNC1dndW8vRXzBzk6bPa82ZLz8vPY7qghP
	rKjg1/KNBgQx24ctDIjWUNDxN1Xx1L1+SZ3acQgJOaBIjnPXke7mjydoQHyGhOJvCxUjUDm8Jd+
	AnwkOdxbpIwPCrOFkJEfHh55qiPkd0/9yEhKbNYe7jvajrjqDBvAXYoNJ66ZuN2HM
X-Gm-Gg: ATEYQzwCarAjgyzmuq9bBTuEb47SO+UNy1V5WrYRyV7tEQISlXNT+V/OyfKosX0dyjq
	iQY/LTj1NBgF+hSXRh3+Ig2wA8IKwWQvA8q7uCEerS8am01sp9S/5f+U2fmwSCVPGN8tG6AC2X6
	A7NMvmAGJKK+QQRA6+0+vcWaTcZHwrBnrLlQ9Tuo67dmaJ6n2guaRXRVDgfuy+YkyKwUt/YBuKD
	pLs6fENB5tm0SMpVAA6TeCMjL/ftTEqQIRd42aGvzycEXENS0N8UDz/PK2stGD/KJPnlKgyuO8e
	dqRh4M6BvaznVpQ0Y3Ms3JrkJTw15sGQUR7cA3nmvjLt71EbGsrqCDJ3N4mB6QlheiVCrJmDmHx
	0r6+/tm6pvz+zptRkpQ4f1oVVg71lz0NrQ5hpf+8esgS2b12dE9uqLPqnlplkuZ23LwE9Ap5PB2
	rfW8HTA0BoZl1EAX/KDKYPC9QQdmu+zjcdD0s=
X-Received: by 2002:a05:6102:6049:b0:602:8b67:37db with SMTP id ada2fe7eead31-604f92e9c97mr2683217137.26.1774800208506;
        Sun, 29 Mar 2026 09:03:28 -0700 (PDT)
X-Received: by 2002:a05:6102:6049:b0:602:8b67:37db with SMTP id ada2fe7eead31-604f92e9c97mr2683210137.26.1774800208035;
        Sun, 29 Mar 2026 09:03:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145f040sm1116415e87.75.2026.03.29.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:03:25 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:03:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: add blsp2_spi4 node
Message-ID: <grmuh7b5phy6clv7izgq43yjtfxaulw3h6tqjenux35r5o3qnk@6q7nlgczigdx>
References: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
X-Proofpoint-ORIG-GUID: XEL1f8LlOumIH7r2yLYueaCnIWlyFOo9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyMyBTYWx0ZWRfX3lQyZokpowHB
 Wz92HofTw+mFrmb3Q088FWffzzndHGB4TeRREsuxx8/pB9GBNXMPtvZTsIQPgrdPSlvB8T0KwRy
 +ieZ5j+FMrmAHG16AvfqF9BUnsXOuRFSlrmyilrUoKoF+DCMTUQzQm4YdR5k7ey4HnRnJ1ZP/DK
 FEL/zqWFX4PaUO8oOYgmH4Ic/gOAFqsVYNsWYUb3NgV9LMQioaxmKMH4lg2fUDwx9eL/YEmBA41
 7mN35PF2vBEpvTmrUYyteXZ3dc+1vg51BDxJW1tL+Y4ntpt0bwSUEbDRBEMXIkNZ4Y37QZUYK/g
 IWuFFcb4/R4TC8ggHwZDMpKmdH7fbX2qGMgOcg3hsPQuMWShzZ3lDo1JFN1CNzZ2DYiA7186zKB
 y9Lo5EzbX2DsQeXi5iakqW1UnJqI7LpwPHnQOHlrGA9PVzM3YwVK8ch7kgoY6KrN44AeV8M+VgC
 IclTAJ3SW4S0ASzPq0Q==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69c94d51 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=fSlFFvN6gK5SEygBuCoA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XEL1f8LlOumIH7r2yLYueaCnIWlyFOo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290123

On Sun, Mar 29, 2026 at 02:19:15PM +0100, Christopher Obbard wrote:
> Add the BLSP2 SPI4 controller node together with its default and sleep
> pinctrl states.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> @@ -3417,6 +3441,23 @@ blsp2_i2c3: i2c@75b7000 {
>  			status = "disabled";
>  		};
>  
> +		blsp2_spi4: spi@75b9000 {

This should be coming after i2c@75b9000 (which needs to be renamed to
i2c4, btw)

> +			compatible = "qcom,spi-qup-v2.2.1";
> +			reg = <0x075b9000 0x600>,
> +				<0x07584000 0x2b000>;

This wasn't tested against the bindings.

> +			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP2_QUP5_SPI_APPS_CLK>,
> +				 <&gcc GCC_BLSP2_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&blsp2_spi4_default>;
> +			pinctrl-1 = <&blsp2_spi4_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		blsp2_i2c5: i2c@75b9000 {
>  			compatible = "qcom,i2c-qup-v2.2.1";
>  			reg = <0x75b9000 0x1000>;
> 
> ---
> base-commit: 54f966f63b379d0c62bb044b7903319776443a4a
> change-id: 20260329-wip-obbardc-msm8996-blsp2_spi4-7892454c504c
> 
> Best regards,
> -- 
> Christopher Obbard <christopher.obbard@linaro.org>
> 

-- 
With best wishes
Dmitry
