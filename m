Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5AA2116F4
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 01:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437219; cv=none; b=UQcTj3wQTr0Zb28SwL4buFFs0fWFxZVO6qIBsAqRIzxEiNonB4Pxp7B2rCjH2y+6PHuiZZczYi2FO+Lb3p2nz/t1MCcgtTWg66J+KxLz5eqXrvvZBMyRS8WUV203pOr2JWjwx8C43H/TtPkZ2F90XZxgnLfhcpwZSaKfGyyttCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437219; c=relaxed/simple;
	bh=nKSD+rDb2HuVHLMljKNHX0Rpivy8lz6cvCHGTmKA0so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkjn90Hf3B42iMJlFh2MfzsLnPBKmAKcpHxSDjKgQyLWdHETR0ktR2qwdRxlaPglLGpOjaVf1ryPXLWiYlJYlfFKdP02vCtQZjIvMrK9WpPlLUksGcoPyF1EIjejsGYl1zP0xSIPh6q+TF+uv6+CY6kTBsxglWE5JFxwQ/TovLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUkUmJ0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M6s0ZJq8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUkUmJ0p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M6s0ZJq8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635AU2dO1809860
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 01:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cZxF5REp94u5kL1p8dA+O2An
	Kkpz1KjKI2JPT67f56A=; b=KUkUmJ0p6LzrJN1Tex3g4B+6KhmAgpEes9/Gfedn
	xyqTJmMTh7E5aPVxY02iyLEf++ONsI2w7plI+C2IbojBqMYOCpwxEtBP22IuoOqv
	Y1J71FgGkDGSkRKq6tH/zmBdKBEHmNwDw+yKBlGURkgo/ZKCSAvO6+n89WpppkNe
	xqQM/EDgjQTH17K2bWA0LVmzZhSl5+HXQlVNnxL3MkAbXz3i+y3CxiIJendfGpVC
	Vlpy0wrdQ8d0izFHtwRkBGLGGCpZPAF77rV74w8fiq/RGDHB45LHQZoQGlMzU+kh
	188pGDUxqV5ZLPmCJl/FFq8XwMtJEb2hX4TMqeUf7yJD9g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7ubggb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:00:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a0ef4a7021so56584066d6.2
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 18:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775437216; x=1776042016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cZxF5REp94u5kL1p8dA+O2AnKkpz1KjKI2JPT67f56A=;
        b=M6s0ZJq8mAw6dFfsGESLkivAQvnRIXftnYOmGB7tooOMONxDuvugxkWS9kF8iHkcxF
         wS2PZbE8OPr+WHo71idfrwSxDHNBfoUk2wIOvp08Q/LIHXpsXJ+g2zJjk/k1Rzm2iw2T
         p89E1OhynJJbzp9d7fmHrUV6+KOAnYpjdpp+t9Siho3TiUoIMqDppOKG7zCu5RjDqCFC
         SQgMhlu5t4RGdfBIT+XmP5/9xga2Zbw40D4AHPEsosQi0JAuswHgjV4G0a2H8xf7SQkD
         78kPAE3/6x4Y8Mui+BajaYyZdKbSQQl5fdW7IWQ6c0b13KdPgo6QX9wy+PVsFy+cf+qs
         U8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775437216; x=1776042016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZxF5REp94u5kL1p8dA+O2AnKkpz1KjKI2JPT67f56A=;
        b=ml8kBIh8OvZIDKwOVlBz5kslaKWh7sA+bz55MH4W07uY6p+p44AmpzqQ7fxeNmJ2Wd
         y+/VHbyyrdD7c9EXuOSa3TROCLKU9BUZ3RkA8HBxjxRepj//AR4AckISv0jcorfjWEVF
         L9T/mcwbNa/MmbJHjVyI4fIM4BHFGIqU5MATBQ0SZg4KuyqudOXQV4cZNHVQ2GwXtnVt
         YjkVJr8q2ElapS8beJ+t9YC/mn5IKMcvgJG8dZxE+mr0O/9NjFxJWJ9Mo9+IIE7N+teh
         eks2C9wDg2uz6Dgdq+uOKkLlm/Jeb/rTOt7ReVZ6hj0Gs0IRgcpAKtqT1iA7/QPNwUT/
         RzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+m46Nhch5gJzH9qGEag2VoWBi3vpnIHNz9qr1yvxwPM9ZXXTPL6we1xY4P+0I/ovokxMXqpNCLS9a@vger.kernel.org
X-Gm-Message-State: AOJu0YwUc9cSiI83RrpNQvl9u3fKTKsV4CaIV9nia0o2CTPUWVQ7dcvx
	1SvuootpjR7anZVRTdjVGqCdpEcRLgVTJf9xSK9pT2sTC7rExjHA23RCb93UKSvwTLodI6pTRzE
	h8yzbSL33dMueH3p9DiKWcqSlPQtsdyosKRi6efq6Bqsoidqv9CMph8dr3LfCeRwt
X-Gm-Gg: AeBDievc2DSY5EKtqWX0B7HvzNPjP7V07v07HUDXStV1BLqPi2GmnFtKknyR1E4hR1J
	B2lC5MEhL1VShLU4qHiVxHbLU02gUoilDFWu88aXqSZMey8iBm8V1Kux4ts0zrTdyLGWvcFMLWG
	6MU9YWiKgp/m8AW0jKrWwZuJ4HJMxZyoWBNS/h+mSJ61SKGSw5dcsZIrrjzpPpGBRk/svA4f7vx
	yzzWoeojYvU02ZaZSA1ZN6zECOaaADGkKaGJBSN174ZcAv3WU88CI9rvxcCNTSVFkQ5gwKsi7tv
	UFfkBVAlLPeJRK0gdNmIbcyxTSsQP3GoBk/yaaPyRYMib4W73YGUTm2uAFHuwmhL/7NoN4JIBsa
	SjHWkmP+SteRGRDPjbZzjKVARbxXUAg45M0DIAW3banNEj/74bOZJxIFZRLsHa8O4cK8/eRt0zq
	FbdFVKQyseDL0JN67tvcYCJyGaRHmDkIULbU0=
X-Received: by 2002:a05:622a:14c8:b0:50b:48a6:6ba4 with SMTP id d75a77b69052e-50d62b349b4mr159032711cf.48.1775437216430;
        Sun, 05 Apr 2026 18:00:16 -0700 (PDT)
X-Received: by 2002:a05:622a:14c8:b0:50b:48a6:6ba4 with SMTP id d75a77b69052e-50d62b349b4mr159031701cf.48.1775437215710;
        Sun, 05 Apr 2026 18:00:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc5fa7sm2983778e87.45.2026.04.05.18.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 18:00:13 -0700 (PDT)
Date: Mon, 6 Apr 2026 04:00:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8750: Correct DPU VBIF
 address space size
Message-ID: <qudsx5dveuuwhkdkm6akfe77hkchejjttph5f5r7kyldi7icnr@cnnfs4emy4ii>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-8-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-dts-qcom-display-regs-v2-8-34f4024c65dc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAwNyBTYWx0ZWRfX+Hzwr+oVtENC
 wtRAW3H1lX0+3hnqD+vsU4i6ScuoVVUodtDlD9BRbez9qQTKWYxk5yBUQUS8xan3bK/aK4v1mC8
 fyptoHjKJQfivQQzrF1Ioyjf13VN6b9wHKvmLKPveVtkD7nkfFu2qnQDoFos1RyDGOpDnswvwPR
 BHuODFPGO7SjEcKj+wXa1JhCGVBKZdTphZSQRKDDxeasvfFtvFQmHBv2qKZJXJ92FCTxZteuR3S
 MNe/A5Lt2uCl4b7MM4WX7VHPdcA5lcWlJOYLSuuRiZy9M/7JzKns2utZs2dtmIJKZLu/5c0LSyE
 WPJOOLR6/pe12x/eq9POGp/UPMhNTB7JryK/BuvzkmbvYFZTSrhS9FySF+PHiffeSvQyjp1zkxm
 cDjfiQravjBAya7JSX8BQ44Np+42JjpDUe6EntQzVhPLGtvSs1v8kUn9fZAKmKanbGQZndAd1i3
 S21A8nnsNB1h3PRaISA==
X-Proofpoint-GUID: Z2bfjyk5eAw4nRN0RGpaHjpHBsNklyre
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d305a1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=fzqTxgmSy3qf8bfLeY0A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Z2bfjyk5eAw4nRN0RGpaHjpHBsNklyre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_08,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060007

On Sun, Apr 05, 2026 at 04:34:04PM +0200, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long, so correct the code even though
> missing part seems without practical impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
