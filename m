Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D859B3F788F
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161367; cv=none; b=pdXXU2+3uFrM66Sdwx1FI53iO0zx1P0UFrfqLc3q4Jz+Y3MVvZkL1Ya/X3pDv1WnPWwPSJUbviCsQJyE/BZYlCe7CzdN4VPMh8UfsN6+A163hggHY6XlvRgrVXTDlhkzuThJmw+IC3yYqSCVELjLATlJ3bpwLqiUFbp6lDx09lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161367; c=relaxed/simple;
	bh=jgjaKiDoo+5UeZB34zCyxVanmMl9pfLwZipouS4R9yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qC9J5de8k+GPza4qYOS6hOyIqBWIevUB1iVTnMm9U5+UNhZTXlM62ZgLsr6R8Ha10U3EcNKbRRmloTh/0uQ56ZiKmxd15qsuSSiOX0ndmDvof8+niREq3DEr/s5uFfzMeFTTGe1noBslky9aaonphEtUMph/Lnzm3mAqWxEtYtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6Nl2yU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEcJXQPa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6Nl2yU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEcJXQPa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AJTeG150879
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 13:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fM2GJrP+0Y7YC+IP+KagVSd/
	GkydEFhXLkakfmO6Tz8=; b=b6Nl2yU8TRjaGgoYPqg4nmbp70HtGpcQiuqmv595
	McD9sy7QbrRmQ2MPIDfQc8YGzBWCIzAKWxeOPwD38Qx56preT49J5yH6Ofx57PqB
	yiZQTcsvSDsIfGKbLhMRTsb/SqbXf58tIveICEa3mOqYRDgbxjOfhNacWC+J/3ou
	KGgJd0nIjaPz13stW3bzJpm/BNsdbDsTzz+mFAhbCGRVRBI8XMGB0NY8Um4m55dt
	TWtjFU/M9ijhSd99bslB4fFpfVmZdI5tBTBxeRK2zdKpKcReQZ1oRs4daV+nG2qP
	jqNKAVVR1vCx7NgrgDkhwvF9VzSfoVE1Vk3LdNRFZ/vKUg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctt2dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:42:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f525565b33so943218eec.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778161364; x=1778766164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fM2GJrP+0Y7YC+IP+KagVSd/GkydEFhXLkakfmO6Tz8=;
        b=kEcJXQPaHF4Hs/GJrulLMHmkFW/I9mVc0mML4QO8xc9tpJigm8xPc7ONxjNKO+KYGy
         iHFLIQ9MjGnjjkHMC6wcxPJT3UZFpqcpUliNzAv1eECWzJjZ/7q42lGCIbVwo8nmeunt
         PLEX1tkdN5l29X+X80Up5/Yl6qfF6EAtl+mZY3UprpTpACUxnbtbrDMb/pC3o513zMcp
         /qkd1BxS1acWJAf75uSJu6yB/VsMugfZTYorK/9DpI1vqBx6Huhoral/EoItHWXM5W79
         xCI02Pjhb5IaXl+cHnmLNdzRPtZcefrDxgbVqvLqDStNmNQswkIWM4dgifD0lkbYnTxQ
         g5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161364; x=1778766164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fM2GJrP+0Y7YC+IP+KagVSd/GkydEFhXLkakfmO6Tz8=;
        b=eZ+/d3lto6uhTCVE0brQ75MHRK5qwnG6PGj4wQVi5puJKxSUwCkKlstduvSvT4BzYP
         6viEP8rT94FGDGNQhrpcwD8H6h1fpVnHQjLpUjmYTnO0Mzx7qU463GraJhcdHgyxGlvs
         nND4pQ5HfxzMfsCirlBqmTDyTCcpg6HgS33EmsC4+qQooNNxpP8vNeojAoMkC4trL/Tq
         gRw4g3G1GF01YMgvTkk2PsGoxwArezY8gKLrx1Ge1WzWAXfS3tfx4IQF4//69ayQBueB
         39al36Wd28OCjVwj7/UVFBz2nvRfPqx35ZjRvJgR3gSbKo815PvZMMXDahzvh74wL9fF
         q4Zw==
X-Forwarded-Encrypted: i=1; AFNElJ9nbykUT09/ez4NLu+Qnla5MkNxSzhcLdO32U0sqj06QybN+0qHeqbPl8R24/urAJXCRXP3P1VYoDUO@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqKon7w2dtTfiFmZLkU5/FS8pOmycy4KqPxVgVjVspBO43eaJ
	I2RQCaazG/HpZsjf44ThbKIkhTffxjiM51i0qAexBiWkmXmojaTHdnWXNamNaSkk+SvvLeScTS4
	G4drJKJyMbKMPSLdMm9eS5of0qaU3DBLqVpT6rKLo/I20iFuKZrHagCXkYxLjOgOQafNfYFIV
X-Gm-Gg: AeBDietxH1fYyJoTt0y2mm4f47V+d6K6DWHTdnppdrzqDPGAEXTHnWmkEwU0TDyMTDm
	TEehWg1QjLUaEir5yTSEfepX06Pdp9cfY4P1yODgiOKb1yBA+y9LvbZ99UbPnqNbqDSzTE23tHO
	wC7m9zmtPHrg7DNyxVi9eHzeZodIQy16s1P3AKWHwgOAz+Ms6q3U67wP4nRIUd6yko/HmLG4TDx
	eLRMd37IEiCKKdxGxwi1DCKHQTp1yO7P7h412HgUvRCbToxxEgM8lABFSquj5exgmYS8AcgsFBl
	0+6uNAGQx9v+uwLDJWROmB4w+0DlWvJkDPWqcHpYynYbETe2A5LyKReoCse/4tv04nkvSASmrnY
	2aHmYwIR2P0nh2mkz9wuE5eXhAgbZ5UoSUYrXIqlt1W6CChZMwIILCf1/H1jtTCgS3bLn+5Pr5M
	PJAee+EgUG6A==
X-Received: by 2002:a05:7300:5b9e:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-2f55054643bmr3570882eec.25.1778161363678;
        Thu, 07 May 2026 06:42:43 -0700 (PDT)
X-Received: by 2002:a05:7300:5b9e:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-2f55054643bmr3570848eec.25.1778161363060;
        Thu, 07 May 2026 06:42:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56f891a56sm8806241eec.14.2026.05.07.06.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:42:42 -0700 (PDT)
Date: Thu, 7 May 2026 21:42:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: Add fixed regulators for WLAN
 supplies
Message-ID: <afyWzRXJF6W2cLTz@QCOM-aGQu4IUr3Y>
References: <20260501051918.1990713-1-qian.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501051918.1990713-1-qian.zhang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc96d4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-M8qv0PI4QKeGfwAHVwA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: J_lq6WZsAYmkWXHZZvIRHwBg9mUmsRgb
X-Proofpoint-ORIG-GUID: J_lq6WZsAYmkWXHZZvIRHwBg9mUmsRgb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzNyBTYWx0ZWRfX0C8o/WffNFZg
 4+B9x2xdg0UsdJN7kbe6cKwBafl8UlCnjMKegF9h8HKJc2za0tAnLZbv8RkqUrC//u+aGWvraGx
 zXbmi52/E0PXb5G1MSt33f2YzIdU0Ytp/8kBI5OZHq/B3Fm86QpPAEZW9VA0SuvD6hjVPgdYQ3j
 QGvDWyb2a5eYh/OYPDza13YhuPp1Kjo3maatuiKgVyDM6pmn7SCztkgUSR/PIyeLWDjfaacIEC4
 HA3YOeZ5RvLm7IlcYaIdg7iHd9LltJtx9is0w+s5WaNIbvP+nKElMIHntnfnOI51Une3rc7HbxQ
 0GxPD0QUa2a0Ka3skRw/L2BulPTALsbvFT/LLwKrfrxD0TRES+hbwWnbPoao6AUSdhx/fgB8UWX
 cpV4r0x5OCk4m00qjh3kixOIoEnpxZZ+xU4yEpCDz86iDohWJC8cRFjZdyxgrc8t08/BZqPQDoE
 6D6YAqCFPzeN5Oog2VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070137

On Fri, May 01, 2026 at 01:19:18PM +0800, Qian Zhang wrote:
> Add GPIO-controlled fixed regulators for the WLAN power rails on the
> Arduino VENTUNO Q board:
> 
>   - wlan_reg_3v3: 3.3V supply controlled by GPIO54 (wlan_rf_kill)
>   - wlan_reg_1v8: 1.8V supply controlled by GPIO56 (wlan_en)
> 
> Both regulators are enabled at boot to support WLAN initialization.
> 
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>

Nit: you might want to have subject prefix like below to tell the scope
of the change?

  arm64: dts: qcom: arduino-monza: 

> ---
> Changes in v1:

Patch version numbering generally starts from 1 rather than 0. You have
a particular reason for numbering from 0?

Shawn

>   - Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
>   - Improved commit message readability with bullet list format
> 
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae..1a40ac5bb4bb 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -153,6 +153,27 @@ vreg_nvme: regulator-3p3-m2 {
>  		enable-active-high;
>  		startup-delay-us = <20000>;
>  	};
> +
> +	wlan_reg_3v3: wlan-3v3-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wlan_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};
> +
> +	wlan_reg_1v8: wlan-1v8-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wlan_1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};
> +
>  };
>  
>  &ethernet0 {
> -- 
> 2.34.1
> 
> 
