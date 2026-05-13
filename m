Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC274DD6C0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694835; cv=none; b=ofYsy6olbxFyp8n7JusDYXQw2kDvMzpbdmi9bTZKlbq7SGqqsUWtBnSyu4yGm+lUg3XtptZYOVxkQddZ+tmNfPB0jGaxHsOqPHjKy79xXSBwr3yS4MwgyKIJlhVgs/ANI7n67lTR3zhY0w8kJZOuseFSZTr1E5lTXaXtp6UKPTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694835; c=relaxed/simple;
	bh=Jx9uvFmPRh4k6c6pHREQspkKkEE2qitXAOzyNLdTR9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVDaJg8DJAz2JkFFWFo099AonIygNrQdMcCh0DY5/APbaB+3f5KyXTPTPL6ywYIY5+SByk/JRpg0XzSgdgcQgXqBJyCe8GdcteHF9VlQ8MlQBcnrfCI0OF61Ia2F0fgRKqyxhdOiYWSzv56n9tlj1JgYguK0fUU4aeIWssKTA3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBlM2wlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PX/En1Kd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBlM2wlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PX/En1Kd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGuIKw3995530
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amWzFW2AhltZZiBpdafVGSL8sTRgUnuUyXbxrb/TJ1c=; b=IBlM2wlMmqeFHzE2
	wOWomBDbwP7QrhCvlVkGxcI9aMBJLS5dDoXUAUC00axbhIBBeU6oOEyHJWA/kVY0
	FrZHO2ySgFs6qJBcYOLLd/+oKkcBb6oiMEAa7MsmhE7tE5XsFsg0rvujVPuK4zmB
	riOzJp+hD4PbmO4Kx4+wl00kLYv4tsdzH8VGmTzGWE/fgRrmvunji+kr6o7uc9d4
	K72iuduBvH+MCTPK5MeQhitzF42fS3xuqLWIwt8OFzt2S4kKpwYM7IJ3dd5pNljR
	rWJmEll7upmriXcTaPhJymm0GzIEi6yrNGXEY9nCiM4MX79mf4Uta1hTzFOkfbma
	xtKEJA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8ur7c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:53:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso116981021cf.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778694831; x=1779299631; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amWzFW2AhltZZiBpdafVGSL8sTRgUnuUyXbxrb/TJ1c=;
        b=PX/En1KdI+o72BLH/J+fTLjIb0AnSOdKf8HhBPxcpAXy45ZWmqz3vMiEwLtOFHccIj
         oXjp2KoEHqu8me2d+X/yI6TjQ61ASeMIK/+aEyZINmB2g+a3w1gEQfQrrsrflpI/iU7E
         uAyPt6mihHj+DkfBR0JbyMEvG7Z+01+g2EfJZKyWDjb3E2egD77xaXGaB5/HoulWjL9c
         MBTYkTtlunvWLYIW0ZVaIYLHXtIgnsd5OMCKKSkhg+kXTMtMXs1Hn3XnyCmO7aoS+v5p
         8BRyH8KkP8JgwFgT5DRZcgj3k3wEUi/PLeCQ0WK5csIa3o7lRaJjNf0WxVDf6OyFW1hc
         6Ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694831; x=1779299631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amWzFW2AhltZZiBpdafVGSL8sTRgUnuUyXbxrb/TJ1c=;
        b=cChqEvVAuiVeYKEDGElMCGzdEG6ZU2zzpZcsc1CexsmOP4Z3b8+6P6Mh/DCYSAhOvd
         T35Ojfah+2t864uDaQCv96oMRZTbF2h8hy9nbSo17NGfKLt/aWCNeBcQziLa///JdBul
         17etxRBIICsRBr4P66U7v4WKTpNVrmxjXOr2b2aNFvkS3WnqGfHABEWV0/OxCvBiJVHt
         XCsowOkUmbdJ1rF0ZvUPr2UzscJ4rMmKXPvjATcHW9KbE69+PFJ1vEnzPAfGhnnp01/J
         DGFSPT271W1JimYfe46OwwxSUrQRSpLTabPTxxy+tYlfwEmIS3oWkuoF2Zl1ooqqtqgo
         escg==
X-Forwarded-Encrypted: i=1; AFNElJ/SVGAsGjhAOM2tR0jz7xmGPq0FnE1RNmV8F4F7ITlOTct5er68SIv+kYxmWNdLZon3N2stA6sPALPS@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXWDnYl1SeS/+Hpb3illYUfcm5LUED3i/LQne7y/gYfyg+RmB
	hqzOkCpsz7Mx+VfS3nGojGRd4uOTqaFlQpwU9sD213LJQikx1UgaJVXanu5SAxExHDXP7cp6BO7
	vSOqcluMPJ3ZI5OV62cEkYBW4XE/AE0YS7dn6Vr/K6e+aelGjaPlVsCHg/NFef3f/7nXu3zsQ
X-Gm-Gg: Acq92OHMNkJFV9RyT2hotrl+ikBlD041TCXleY7mkUi9NKaoalkOFhDK6TALEFNvqJj
	lGKVf2s+4Ozbud/hxJ1A7pyhesJO9t8h92DCzZlMU3qR+cNV8WmH1vorqqXyWIjmJiqgkBrH2gO
	N1oKaxsJNPIEF5Ku8yM+TsIaqDXXltbyEG+wRj/BXjjsxtCI8rQ3f0GkuuTZpAteEK3mz1n4yBh
	gKi71wco3mGwc9YUB807kfrMYOtT6mLSGft71CWfCjQyiFfd6f7G/s6YMsgbgA7Tm/vjgvJgV8i
	B4VKaNZ+y9WNex9cxo6qxgSuQdCVLZEpTm5AQ7IFNjt+z2JzMSkid698KFc3dhG2X9Ngsz3RXvN
	nGnBxVEB7QmddgUYgq/Sj0E7dpYhD7BmGGkaf55RQppJjcrykZ7GuPGk4V/ji5BuT9WC+WnlY7C
	wbbvxji+nw3uC+/e6hCx9eH5N9cdfR5VZzAhQjW3w3UClvlQ==
X-Received: by 2002:a05:622a:215:b0:516:35fe:5524 with SMTP id d75a77b69052e-5164155bc78mr7504691cf.5.1778694830835;
        Wed, 13 May 2026 10:53:50 -0700 (PDT)
X-Received: by 2002:a05:622a:215:b0:516:35fe:5524 with SMTP id d75a77b69052e-5164155bc78mr7504061cf.5.1778694830374;
        Wed, 13 May 2026 10:53:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cae06b4sm109561fa.28.2026.05.13.10.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:53:49 -0700 (PDT)
Date: Wed, 13 May 2026 20:53:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
Message-ID: <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04baaf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=U2egry7Pn7Pb3urGTtEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: YD6zAD5Jua5mOBdk2cwNo5i6PkS19EJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX6mo9zdI9lkUq
 Og/VidCbCG1cGssaM94UahemrU4o9h2vKg/NkDqChzfVyvHLuw62oB2jV0NhEOFL38LgSRRZTUR
 w5cFcTBFUpAbZSoWcU7LhBsqR3lPXS9jaIv3rNIgs/ylWUIgcYCU5JM48ziglJJ0ZpO2gKtMAh1
 luk99zkyprapyhai8JW/1pGpAFYQSrs2L5Z3MKrLtB5t1gE/J0JVcEI7lXxmU7WNRQZmCvEL5eu
 IcpbUUmwH77pY2ZL2dNGNmHPdNxZSm40vo5/lWFrTtLo2tDU0TwyKt0ih+UNPMNi/Q5diKy0Xiu
 NSCKNCnUn3A1+aVrJqk5jLEOq6YLELC3lWDeOo+hpnksW1MVkLuqd/3AVqIaAjB0wPGqRUE/ATR
 NWSp7sI6ch5yf/iWKE75Nf2ed55KkvtF1bOj/su3d5/GcY2Z+9QNPUM6SnWbQ8eM0Mc061ICFPx
 vtoJ0CRBNwdWWqHIJeA==
X-Proofpoint-ORIG-GUID: YD6zAD5Jua5mOBdk2cwNo5i6PkS19EJj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130179

On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
>  1 file changed, 135 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index c57aea44218e..5089416ec32c 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -26,6 +26,7 @@
>  #include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  #include "kaanapali-ipcc.h"
>  
> @@ -7045,13 +7046,15 @@ nsphmx-3-critical {
>  		};
>  
>  		gpuss-0-thermal {
> +			polling-delay-passive = <200>;

Other DT files use 10 for GPU thermal zones polling interval.

> +
>  			thermal-sensors = <&tsens5 0>;
>  
>  			trips {
> -				gpuss-0-hot {
> -					temperature = <120000>;
> +				gpuss_0_alert0: gpuss-0-alert0 {
> +					temperature = <105000>;
>  					hysteresis = <5000>;
> -					type = "hot";
> +					type = "passive";
>  				};

Why don't we keep both passive and hot trip points?

>  
>  				gpuss-0-critical {
> 

-- 
With best wishes
Dmitry
