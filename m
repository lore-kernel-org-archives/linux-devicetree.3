Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011715;
	b=JXiOINgyJ3A68uWRfrb1oOxoR/7xJXRUPwJXf3vgHCr32Q419NATVPBFwM9rSXlimSCB
	 7fwNMeIPyikhKPnb0WJnMlt9CCJzC3NMqGInGTrLBjmLG6pl44nVJ7le9bIjih7HZZy6y
	 sXiVEqk96O0WYmP/00LbqRgqxwfiYz3DoLzFFUvDrpJPrPYQzMm+hq/HXy7tvwDeEOoXy
	 mnsYGwkvtXgdeYMyV369Cc2Y6H0p7nkYV9eWPJaSqiL95bdlGB950PsCF5gqo5L9E2llY
	 NMyXoua6ywd4afj1kHk7LQuCeOES4ZFJ3FZmjNDbwavnfLs5jY7Hz28FDqWsjrwoDZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zZ/Y0r4m5ztNks5tc+5NW1NNN+6fPRTydaZYwjmldGs=;
	b=1Ypt/LlhZXiR2M9VJJsxqJRCIUtrG/2jIx6XllKb/QIKa4ZEVPO/yubDJ3BFZw67UJhs
	 SltksN3XiZdd0y3GlYGKdjvs1wzcFYHkPyV56rAhqmudxoOnqnGRVQKaXvVpIWLugnpfX
	 5OM9nE2RJAaMjiypBqRuwdqLjIjAGrIyDTQjBAOjl0P5AewhGWVdPFXmi7Hj2e5Ogb6lv
	 zU9zwg/n67ATCMFzH4xGyJDWV17M9IEn6aXyz3+GFf2ItQ+hR3u86nDO+k4TCfmB0PV0g
	 FgwCof11obWteU48rgcHEfGcXRqPK6cm5+Fu3f72Ih3gmRsleZfEzWW9IT5AQmjY55g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXhHnvW4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LF9j/kf5";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97522606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97522606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXhHnvW4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LF9j/kf5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIE4l7F3648709
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zZ/Y0r4m5ztNks5tc+5NW1NN
	N+6fPRTydaZYwjmldGs=; b=VXhHnvW4FFlVnYMeJ/gacpmEdE90BYG4RSMdFQax
	lrZn2pNZ4x9J06W0Pj0QByJR90EPlRwWA86Sso3K6o61yIDsU5u05DCJiluzNYfA
	WwZAAnBlXR9x8i12uBHYBN3I1T+YmByo4vZ/0b5G6dvEwzBOCJweQg+ZZg7I1UsP
	t9LuRuZVBw8rf2ziZrZ0a0x94AOF1CM1a5aFu+WFymXyc8vgCue1NR0s3SNTANFi
	Eupqd9nDNs40Q/7P9e8n3XF5mODvlIIYiDnjGwJu6tJwdxR5qVdyaWH2tgEj27K8
	xL8gXcLlh3j0lsfGJrJfZgsxEQhBcO9wVV58KnjIcC1WYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dfcr2bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:21:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f2fafeaso149412585a.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011713; x=1795616513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zZ/Y0r4m5ztNks5tc+5NW1NNN+6fPRTydaZYwjmldGs=;
        b=LF9j/kf57c7CGLz1D7iHZABvVC757jAB/yNDQDwmrwXZppSZ8xLq/iVtYthGO7Olh3
         drvQtVAGyBgYQys3xcklB8QUpuLeA7N46X0JFVvr8ge9Apg6maJYLbJpUzW8S0r6OsDv
         kPz75ZNw3+rRGxCxYnJEgWCrsa2HjTaGHj7dQPq3hHBJ75H15pK4Hg4ALWYjANBydtQT
         w2LrJDnNZeJtdIeo18Ap53RQDMJtbdKmPv+oqYaqyJlaJZZpagBn0D7uxaUPGLQBFjgZ
         xuy1UBpKBdi3kUW/lysRjwzKBtRGNvnGYeCNNJO1R9nB4relsM/Rx0c5RXlKWaIxz3Qm
         zAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011713; x=1795616513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZ/Y0r4m5ztNks5tc+5NW1NNN+6fPRTydaZYwjmldGs=;
        b=UutWTAqTXJ2pLPSDKFZE0P2v+g4785CRzJuGCLrRiMNqm0T5R061VqXxoeocgnaHZS
         1QZkaF2Yhn1fQ2qsBNgSGs6IEyJHUjmgs0K/0GsfZebTdszWChztdBKr3fCH2rE+Vbh0
         9ReW7twS3eN+hkVOLMqUco2DpNdXz5c1VxqxEuJndwvEOPjr/1qKun+/YljjCjMmpehD
         FAGjQXRTey34Ss+PRO7Y6NPcypgbUoKPDKl+1gwiWuSsjc5BYSrU6osR98EanZP9eHRV
         ddsNRR7hVPImLfFQug0fmRxe7/a3Y5HSqZK7n6wt3kkfzpWMgZPSPvNwZEFR/LZanvIo
         RFDg==
X-Forwarded-Encrypted: i=1; AL+hErFdeS04wd1vZrdwju41M6Sg5MuIwwSWlgSJxLNl02iE3v8gjgUhzNBKL1P4yUELjQk1QbuCFcz00CgU@vger.kernel.org
X-Gm-Message-State: APuU4Z9POltju2onX9QuuZjFlM70gRVNv7y9yfDl7l3mGV/xbXcB3Ig9
	SCvOGiQPdJa61oEey4vnGLxieKKSdMOnjSZB+owN8adGXdOREMBA+FuNLE9kWXzs8KgsKZc1qq0
	l0drRU5iGkuxadurd/dn696GNjrJKilIwc+p41PLhuSC4X6NptthzHpRSVozUu1F0
X-Gm-Gg: AYBFou0YMLYgrTZBna9TAD0SmIStcOQ0pVGlf3gL2Z4QSpT5lZ0Lm2cMHnZ7n26s7Ja
	pTuTeEtRcGZBOMs+T2Wf4LoXz5YNEbbtrWfLI696eEPVfxXoM2SxknGAQf3Ts5faod22/+ytkeQ
	zehr7XS/OxYbh4KbYBBR3emFlt6FRk0WlQeabZBxOpsXKDl4EDBBKVrHIwedVfeDFaplFv4kOGG
	qdpkXuzH5dRhRwHkXw+rVgZKk/kkdOCWW4b5+CUGs3/U/xRolupX8nj+jJvPx8AllFgdEFtIRN5
	IO32NvOrCujQIJKohgZaLPokga7kBq2moGHqxzppUkEH4eWxdhB3qdi0/ZD0PlaE0JEyC0AuZDu
	cj6mveWoq3+t58A4eUaNGjkbvZy2mAMQK+XOfmEKTeqMF+XAgyi2r/v619kMuQI7/+07BhxEaGq
	CWhMtjTAK9isod4an+F38wv2CR87dZJW4kSRaHFNSV6ovli2Iy8Axx1dSgRP6Nfg==
X-Received: by 2002:a05:620a:4012:b0:93f:2a56:2772 with SMTP id af79cd13be357-9499962a7d5mr464566185a.78.1795011712751;
        Wed, 18 Nov 2026 06:21:52 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:93f:2a56:2772 with SMTP id af79cd13be357-9499962a7d5mr464559585a.78.1795011712057;
        Wed, 18 Nov 2026 06:21:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa2d9640sm559377e87.8.2026.11.18.06.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:21:50 -0800 (PST)
Date: Wed, 18 Nov 2026 16:21:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: talos: Add graph port
 placeholders for USB Type-C muxing
Message-ID: <6w2xvhuuki2ww3xbzgzwxqfawgntrxgz5cjzlvkm6va4zb33mh@hkzdnkwbtrf2>
References: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
 <20261116120623.1726089-2-akash.kumar@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116120623.1726089-2-akash.kumar@oss.qualcomm.com>
X-Proofpoint-GUID: 0mk-XVmQRJRLemvaOF8aaeav8KCmRygI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfXzYXBAv60bvfM
 l0SpXwozudl7nNUz7VRELzCtSEfSlJSJHxmkY6oj6ICn3USCVUgX7xI6gBzRVLnP9TWYMO8igHe
 wGc+DzyZ51NTkZ7n8VDpH8A36w/8K4k=
X-Authority-Analysis: v=2.4 cv=CdSdd7rl c=1 sm=1 tr=0 ts=6afdb481 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jdQJDUkAZxjaZL5bHooA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0mk-XVmQRJRLemvaOF8aaeav8KCmRygI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfX0GQQTKp5oON+
 YwEduF9id8xUGUHnGHq1VkvmA5+hVS9PWQu57LTRP3M8EQzI8HIZSmpMqzuZHUlFRIm8r55/2H+
 FStZ1eGQR4d5xctZQp3caRyauvzyn6w7WhA2mk6Soon+NfCEt25NHrkNf+61BefVH45pzCZ7oJC
 PWchpdiWW0SWj6+b/bPmM094GGKXUHPakokKwvp74AjtAx3He1u/KbUUyuhv9O8wq5+GPmxwRhm
 Jaota3yPMlSUmykqj7EQSb0pkymsSiheKtOO9QvoBfuv4u/VWkoW9WfFE1IQkcMzUQO9Ps3wEcU
 tS6JUUKb2S97zzE8tni2k2KJymf9A7IYWBEh0gsX5nyDk9G2BY4W10NB3IL2HRvR9aWg1Nbq6fN
 cDHAkw69WxHdLnAdofcWuWd3ONnAm04rv4AYnKD9LfaaUexHFjPmIaiGRxssvF0ubPJDV7YYzz2
 BOeL+xjSs+WDWQfx7cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180057

On Mon, Nov 16, 2026 at 05:36:22PM +0530, Akash Kumar wrote:
> From: Akash Kumar <akakum@qti.qualcomm.com>
> 
> Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
> and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
> the PHY. These placeholders let board files wire up a USB-C PD
> controller's HS/SS endpoints directly via
> &label { remote-endpoint = <...>; }; instead of redeclaring the
> port/ports structure on the shared nodes.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 1d74e459f892..04636fd88807 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -5078,7 +5078,21 @@ usb_qmpphy: phy@88e6000 {
>  
>  			#phy-cells = <0>;
>  
> +			orientation-switch;
> +
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_qmpphy_out: endpoint {
> +					};
> +				};
> +			};
>  		};
>  
>  		usb_qmpphy_2: phy@88e8000 {
> @@ -5163,7 +5177,21 @@ usb_1: usb@a600000 {
>  			wakeup-source;
>  			dma-coherent;
>  
> +			usb-role-switch;
> +
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_dwc3_hs: endpoint {
> +					};

Missing SS port.

> +				};
> +			};
>  		};
>  
>  		usb_2: usb@a800000 {
> @@ -5220,7 +5248,14 @@ usb_2: usb@a800000 {
>  			wakeup-source;
>  			dma-coherent;
>  
> +			usb-role-switch;
> +
>  			status = "disabled";
> +
> +			port {
> +				usb_2_dwc3_hs: endpoint {
> +				};
> +			};
>  		};
>  
>  		tsens0: thermal-sensor@c263000 {
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
