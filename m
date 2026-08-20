Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF08361DBA
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 18:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251097; cv=none; b=ETuWeO5XovxZl+tZZH/JbzyGPDhrrCi+zhWglVMUGV71eb2w6yNJEVZ3z4d2FlO35CHf3/IbIQOcLVbFyA5/p1bi1C2IGLCrjX2VSyHXEOdTJE3S3Sj/A1q1VWoTSNd3TgFF3AVkIpqTsbBT8dEbB83ijnzNwYF18tCENdbpx4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251097; c=relaxed/simple;
	bh=fQ5f3+9GI85NgNrSAZm13wfXn7vkIjjblxUZUpisIjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n616x64QKGhXG9k1YMMaP5Nh/Er74vJQwhb0cPzO2xm17Ocld9rqqHuFFWgm++cQLyFnFpCvA+au4lcD47UWEcR7r1rjDL2IZ3Zy74o97op76582b/OgnZnFiOiqNjb2A3TjWrMEfZNUaLSXcL9FOd8BpAO7QkQPZ8Do3x240TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3VpsG3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECAHNbMv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3VpsG3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECAHNbMv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIIvMs571537
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 18:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qc+7njUReQUFZe7+fYwWzGrp
	ycZ78k0Mq9dJrYEsPJ0=; b=H3VpsG3yyz4jelTLI/7tvO6YKF+p2D3dbsBWlyk4
	XT49xseBZPbYKsCp30ZDi+zFWxU+47EcX+BzcaRJwFYN4tQx8QK+xgIvjSPeRUni
	WaG/9xVlxBC7cxB2udAeWxL0ZG4S3Ur3I/S2SDax5yoQnk6QMPwKi8kBaaEBoOU3
	UBuhVndgannwJNTIAlBiSPEnASmDBM92Fe6fjhgWZ2AIaeEdT1EeDrZuuSNRRX4a
	MAw2KJvGjRO4bRSTAKNs7KBsgoRSMHFqBJ2TWYKAwHjJ6zwkx8eUToyL6C/8FBQe
	aSVZ89PtNidI/ftTeMncRxffBT+Ou0h+YXWvXT8j503rNQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcam0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 18:38:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d9cef8d15so2407851cf.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787251094; x=1787855894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qc+7njUReQUFZe7+fYwWzGrpycZ78k0Mq9dJrYEsPJ0=;
        b=ECAHNbMvbeYWYAvH3edTwPIepF9xEXaM3zsnCOt+u9fcZRfBD4Qz7I0cysNXbqniJr
         GrJcxB3SkCbmVEu4uUKeXuzO203q9dEckhIJLfcNhWLjMYpCfASGwhQ1gFtcm3bQhIaU
         6dImfH0tdukhpy0C4ELce/nzYxmhN3aOUO1DrTmw8qzb8K4xnrhv3wtfqMEA3myhHcdm
         YsFZ+hDg/+miKHMW4VoFQzrtNGBS0bHWM/00ymRHdAVE35R/jk/5KYGSNGJ5m7Q7NxEo
         gYJGoA8TiLyqw58W9NwneMJpPkI0+7+8+boQGILucmajrffvKcn2UMFw9/lATD+j2Mfo
         Lpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251094; x=1787855894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qc+7njUReQUFZe7+fYwWzGrpycZ78k0Mq9dJrYEsPJ0=;
        b=TUCf2oJvtkO7hAOGjYC3b92TVL2QvxSjfT03XOuBR7TFgbvf57JJMUWKiP73dc2gsT
         pSjpaG+35B0sNZ2QpvbtZzYW6Aol51mdGxVY0FNnvm5N4UzeT5X32tebNx30zKJM78Hx
         aPMnONR5L3bBKItC7XDamrf2pkmfcYJatci5d+a6c0HJKkx4ZcAX6+vD4kMDdsXyHk9Q
         CuMjuql1QWz1Tfk724e0NzNTNkXPeCI8cS9x7k82E0mIZX3d3Z2KOHqN3n8J4Lg3yS2Z
         OSEyuLMXR/uAovumCDA4kuDbgrysERhGrCKU3kvaZE/ZOIrW9h/N0cx+4BgE2jGVNJtI
         0Rtg==
X-Forwarded-Encrypted: i=1; AHgh+RohOOQHtASbnuDKaUxWqeJMOgE9/wH4FGahcuUHbylz2bVQOjMf9VAcLU07eQtQ2eT9Dm/LrTkUqU14@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw7+RexFxBnHDFohVMqKDSp8AUgeo28mShbS7+pvmGvqxErnST
	LxY5XevQ26OFNhle1jK94nArdgX8QjyoIJ8hWKm81sldVP1K7quabvWNBhQvgj3xiA6y1xao1xl
	TcO7UoW6c16wud3/YqplMvV7zfbTqBRnFZI0dCK427B5W11IRuqKniJyDvYlmtQ/g
X-Gm-Gg: AR+sD11h1U9cQi4WN1185BQ7lV+rz9R/SHMA5bYIK4/ftn4lVLS3J5UFumCcBeSeJfi
	PyZygcK6pN8EaSAyIsnZQYLtCcTergDURYwarNurUMjKQp+6H7ku4Iv1hEe0panBRkmE+NX7wx8
	0O0R87sTqpvbNDIYYnxk+4WTGxDI/ueU7xVKcgNpgW4UCby5weDUCxKs9gDg3hik6175wBzAj7F
	+5frl/uKP0R1lwa2yfAQh9pB4EcvCGxmGJP5JbKthvnSe1fGwPvjjn83gHy3XTADr0QXnQ+hcBT
	NZRie4p/IUDssNUiQhzL9pQ7SU8nHFcE7rpQeyp7Zb0Dv9rxvr3MRvAg2NSpyy7rJW61qy10vwS
	L+hSBkkq+72cII1g=
X-Received: by 2002:ac8:5a46:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52df5a93f45mr2744231cf.40.1787251094290;
        Thu, 20 Aug 2026 11:38:14 -0700 (PDT)
X-Received: by 2002:ac8:5a46:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52df5a93f45mr2743681cf.40.1787251093676;
        Thu, 20 Aug 2026 11:38:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b29e19f2sm53748425e9.4.2026.08.20.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:38:12 -0700 (PDT)
Date: Thu, 20 Aug 2026 21:38:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Wire up usb-role-switch
 for USB Type-C ports
Message-ID: <7ahrj4udyuebngj3dqox643ou3byb23qkbf5yfcdqk2anvyo6e@tjqu2igyvwqh>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260820145036.2035641-4-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820145036.2035641-4-akash.kumar@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a874997 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ba2XhVvwmFK6ezhSYYYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 6D_jAjGAqOkQweoboadoj8uoAFxBPK-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0MCBTYWx0ZWRfX42e44QipUvtl
 a4qGCciEsTBiQntGYm0I65wMlj3cr5prA05V6LSLqKz294taJH5FL3coIi1kvNM6VvVu/VzVDc5
 Y3LQ14ueBrbzJK+vFzW2keYQhvCIP5QeHiLmENn3+RfPkCiPgl9W4I6I8qPUUDmu42y5WCbkFEk
 T45v01WgvmrHMP/IL8PEwi+0w/NXO4+9AhVx0zdxs11jm7aYcIud+JhF7FXJPXn64AL5KsfFzgk
 PzELrQzXI1ofyIgTcTQ0WHobUVz6DZZIEGv13s1LHfLsHOdxvssAX9I84WpXoarXSs3zraYl+1C
 S8AgjcBX63QompG/jiZXMbVFale6SpUg5nwdjmSQ83ULBK9nnCoLD6Kir9E5UzQQ9Z9h+zvXEPf
 e3R0OxVN/ty7SACo/woyd2sosCfkJqIeVV48OjkOHezCrDSyzH4VPEcHpI8Obqrjx+uK82HY+vm
 vENVbCZLP15AKZaVjzw==
X-Proofpoint-GUID: 6D_jAjGAqOkQweoboadoj8uoAFxBPK-a
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0MCBTYWx0ZWRfX3DdIDpWHaYSY
 z6rm5Eoc/ukQpdBOwunWP4guDvR1Oe/rXe8EwES2gkefgce5OnPHRMzozzNaYEIxoYhQbLD0/e3
 wGsuiKkED2nA5AGIEJvgLYeREyOTUNk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200140

On 26-08-20 20:17:38, Akash Kumar wrote:
> On Shikra CQS/CQM platforms, usb-role-switch is handled by PM4125 on
> the primary Type-C port and Cypress PD controller CYPD6129 on the
> second Type-C port. On Shikra IQS platform, usb-role-switch is
> handled by Cypress PD controller CYPD6129 on both Type-C ports.
> 
> Add the CYPD6129 typec node under i2c3, wire its connector endpoints
> to the corresponding DWC3 controller ports via remote-endpoint
> phandles, and switch the associated USB controllers to OTG mode so
> role switching can take effect.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  64 +++++++++++-
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  64 +++++++++++-
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 108 +++++++++++++++++++-
>  3 files changed, 223 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 3866ab8b0faa..c92ab8e6cc0c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -42,6 +42,43 @@ &remoteproc_mpss {
>  	status = "okay";
>  };
>  
> +&i2c3 {
> +	status = "okay";
> +
> +	typec@40 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x40>;
> +		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&usb0_intr_state>;
> +		pinctrl-names = "default";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ccg_typec_con0: connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +			wakeup-source;

AFAICT, this fails dtbs_check because it isn't allowed by the
usb-connector.yaml.

I see you added it in the example the new schema you added. That
should've failed at dt_bindings_check.

Same comment for the other dtes files.

> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ucsi_ccg_port: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +			};
> +		};

Where is the second connector?

> +	};
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> @@ -58,6 +95,23 @@ &sdhc_1 {
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	usb0_intr_state: usb0-intr-state {
> +		pins = "gpio136";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
> +&usb_1 {
> +	/delete-property/ dr_mode;

I don't think this property is actually defined anywhere. I wonder which
tree is this done on.
