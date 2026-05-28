Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673AE3F7A98
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981056; cv=none; b=buevSGiclWcdx89ifqxzQ7dq2EM07jnNDeoQTkoby7KgTiiX3JedqRSSP2IGd//sFppPC3W8nACaNzJAYoGQ77qqXT7Q8cGoX5VoMZQQh/qNLzI1ebLo4ZoTtU6FejHrQwn7FfCQsxCFwrvVOBcOWAtyWX62JgaMYzFq6Qo45j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981056; c=relaxed/simple;
	bh=qB59GDxeOzfFEo2ABLadizqzu4u+BHGe5oO0iPJROwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTj3IpZ6wmSxswVCzTi6S2hdqL5mrJE3I0OV0S0H/+UKC5o91iTILUlJOwQwzoQcoaN/Qs0tc2Kb/avFzh+d0KV6vZDITTCWM0jA5zHshSQjUGCKCsPaTxoLr7AcQM8T01+0fMxx6zBqGUdfD5SC/7F+9hXhoRqx1Eke0WxZTgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvUJjWtB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEJ3o7GK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvUJjWtB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEJ3o7GK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vT9E4184495
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MrTyGK6KcoIsnvoY5xT4plln
	nzDePsNnnJ9IKqp9/J4=; b=XvUJjWtBGXR2teUs2k8VcFJ+kfwqrRC+BgUhrPch
	qlLPIrze4ugRNe95tp/HEYFb+qHghNddhOqt0oglVJ6TIDjYJ44HXLrAqiZEIP9n
	l34t3jw6CNbsLJQETIWM3CDeM8h8RYTMu7FC6NLN1WqdyBMWfNnMy2Cj5SQ2e2bu
	PGLyzym8BE6DXQMDGMIvWR1RLRtcy6qt8wEPLSbMH/k5PjW30N9/GS9gC/aFb9E8
	AfKF9137LoFHb1/6GnNSKV9LESMVjhFsBnb4B94UmcmNu0OxZBSJ9l8OpFiqWn9m
	MnUuMNJuQYiERr/Lpa34OUOnkL+81Su+hEBVeIZV8X78Qg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yf3a04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:09:37 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-69dc70d4b0aso4174264eaf.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779980977; x=1780585777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MrTyGK6KcoIsnvoY5xT4pllnnzDePsNnnJ9IKqp9/J4=;
        b=cEJ3o7GKiYI0GBAMjL5TLjVITbovmvZbfcG8mvSngqnXNhBAds2Vp3U9GHaRCOu1lf
         84DUkXZH/9POoAbgMEUxRII7Qu0XRJqpZh8+GlLXAJk5PH7mLRmDCMBGnh7Llx3YMykx
         xhjIBGQXW1Ukgqmv8eWbrr4xtcpdMI+A1clxPewJzmPfplH3f5GPY888KLBkglQyXDcJ
         rvVtJtmJxZRcnQab5R6CpR5+H3qieFMDIjPCCBaxpxdcZOrdawyOn/g2BpYY7GpxepPq
         VUpLumr1TSQ3A1aQWCfc9lqFH0kYBKX+sA7vvTPZu9jGdxOMmvynTcMM2b8mTS8JMhgz
         qR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980977; x=1780585777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrTyGK6KcoIsnvoY5xT4pllnnzDePsNnnJ9IKqp9/J4=;
        b=q3d+X2IHQVNifLt/wihIkCVCsIpjfOLZGduCVknWq5Wt2UDRKXIZU75r50WEaU+oLJ
         11078HwCNvyJSsNbztncvdKUS5AyJBVmAZIDu4Zb2bmD5GH7XGrU4MJJNpd+ILgBsxMO
         XJkCtDEpbjRIasMfhGmZPcPMri8LinrW7Pnjf3HwaJq3lcmgHDnd8JUntfw5GaqOjBkJ
         7gaXAaznoJO3JVoydco15YBGFTw+U4o8VONAWtZ9ZZOIxHx4tRnB4i18iP8MVAOCR5G5
         O/Nrj0ndLK/QA0zZbvG/Ibk7o+MaVLhLM6k4l93oNMqOyEq0S96W0BBURwsCZE7Bq7f8
         MwkA==
X-Forwarded-Encrypted: i=1; AFNElJ9YqsD1U/d6YiH9AMVFUDsyk/FtRiIuXrSLX20xAyVgcHKdsiWCQKN/b/6TdowX3KjNUVOEQIdkLody@vger.kernel.org
X-Gm-Message-State: AOJu0YyFj+8gIfNudAf4CqBMBWkzPqUhIY1k+8jpslnkRFAp9OgtrHO1
	r0aTDAEu1oaaQPcE7WKTqYEVI0UPA27xxztY9v6TlUam7Cy4wg6PYJOx8YJUtBOztx1xzSma1WW
	6OrPr9fyEXiu9vzUUy2uMZ3+af0SZGwAtScrig8PM40iajB4WgJImyuBaElhecGnz
X-Gm-Gg: Acq92OFx03z8J/dBb3wCYEVPh3/yp15nQNM+hLdWQG9ki4r5fOwPcbobcpKqcsK3jpf
	RV0QdXoOrogUxECOf6Bli5Ch70IOJh9HjoP5HPAXOwalZCne60Sy5KIrrJxUW6G5tz6YtebHK1r
	KRPmZkZDWBnbPEyoC9vUQShTCZFE18tYxM0f5otd+h6l1R7kcfKlJ8sqE6QgwPwMRkxsg72G2N+
	WmjOSWvfXfyedNZ8/tcm36U5Qm9uZbqg1GtkXw5g++mKm5+StEJryv+Mbk6CiZTpj0CzLdWN2bk
	KS2ahGRQ4+uOVf4p2r/Xx5gFjcTZIsec3ghdxuY7ChFwall2TEuOrRUKz6nuWVPRMrSXr7kg67a
	BS52iW0J9JBRYCFKHeZpVA0jMR/nZQZyGtuXXGKzpqilLL1jj2ghGau6RaO7JndwD4oIhzUVf8k
	ZRDx/tYhOucnbMZGmlII1iFNgsOowHsEluPbVe/J1F0drQ3w==
X-Received: by 2002:a05:6820:8c6:b0:696:1cb2:20d6 with SMTP id 006d021491bc7-69d7ec6ef65mr13725855eaf.30.1779980976972;
        Thu, 28 May 2026 08:09:36 -0700 (PDT)
X-Received: by 2002:a05:6820:8c6:b0:696:1cb2:20d6 with SMTP id 006d021491bc7-69d7ec6ef65mr13725844eaf.30.1779980976487;
        Thu, 28 May 2026 08:09:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa46322390sm1983716e87.53.2026.05.28.08.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:09:35 -0700 (PDT)
Date: Thu, 28 May 2026 18:09:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos: Fix GMU unit address
Message-ID: <yqsjjn4ubx2t6rinwuvsxyxs7f3r2nzsqgjhfgrggjwcsfthb4@2th5dv2ydmyp>
References: <20260528120342.46343-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528120342.46343-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: S5Pb_2DXSr7k6ZTvGZQ3ike6iSkCuBGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1MyBTYWx0ZWRfX+NOl+uRAbgXz
 KJKjw266c0P1FeaazqELo0hcY/OldHwYdEiApJMBlRU0HscU0qvraLKY4Q/IVTFY1MsoY8NDxFF
 pkFwCM2uD2s1yoM8G5UHXN9fFtehIelYACp7wWK+mcMuvNvOqAEDj1CYEVEcQL4g1+5v1VktbWz
 OozVGSYKzJtO+iRtcrumESlqPjGvRDypLNE5BGzzV97s4N4JS/CJUIN6dHc8KKTR6IOud3lTvON
 e6rcxAWA2h5j916qYxLgku1DxwfLOhz3tUkS/aZKS04XX/x7cLMXlP4jTuCjp0cRsWxSk6qQiDS
 HyKZZhDDa7KK+9GF7v1lNTuAkFKNaXcdnVSCBCn7vRxg59T4xbRLizLb9ZAQWG838BOPMCNpv2m
 5zoDMJPs4IQRJyESqr9GXtL2D7TAwb5ozmVwenMTTvg+QizSYXeWnzY28trdxFmzJuLShzNMvzg
 sXsPlMxRgRyHiCACRKg==
X-Proofpoint-ORIG-GUID: S5Pb_2DXSr7k6ZTvGZQ3ike6iSkCuBGF
X-Authority-Analysis: v=2.4 cv=G8gs1dk5 c=1 sm=1 tr=0 ts=6a185ab1 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rz0GGPVgkkwhC3TLr2YA:9 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280153

On Thu, May 28, 2026 at 02:03:43PM +0200, Krzysztof Kozlowski wrote:
> Correct unit address of GMU node to match 'reg' property and fix dtc W=1
> warnings like:
> 
>   talos.dtsi:2020.20-2055.5: Warning (simple_bus_reg): /soc@0/gmu@506a000: simple-bus unit address format error, expected "506d000"
> 
> Fixes: 8de397a5618a ("arm64: dts: qcom: talos: Add gpu and rgmu nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
