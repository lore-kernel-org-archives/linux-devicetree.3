Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60F53290A6
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122966; cv=none; b=PyqOxbQiGwEOV2nYpXEwBqfE6QAGCBTSKzqO0yfa4H8jq0YCSn20/kuFp8Gs1hbvSrYe6fnLiRMpi7BKLtgLFK0dhxc73PE5PL3k33HkVDE3ZU0ZSyWXCUX65MEzqqlaoJS9ghIzaKr7GN3GeO0pAZONu89wD4Ia9p8zvcc09FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122966; c=relaxed/simple;
	bh=ftRClBeYK8uSlbQPZhD1okyTCzkY7r+1vIQYxu6vxhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxyEU68XRkezQ0jHvT3eUma8M0+z6QtTgUHqrWVaj6MTZ5icdkWa33zOm/LLv6q3C49Fq3jrV5507p9tKcxsQQB5eZ6fz1l829WCqg20fdH/1VTDUnWTYYz2ySHwg/ll9hXBXmiqJH84jI9WYBQRTBDTUVen7KzO7nE3V4/3lFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mn75JHuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDMGQLk1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn75JHuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDMGQLk1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQ2bR1021930
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 23:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=831YkkMtfz85xC+Ki05XtBOm
	3sqOTqm30sA4vibS6XY=; b=mn75JHuM9d9DcziUCoj7eC4I3diociCa+WIkVbDD
	F+9etyGe2nOFh5ooPwbolCQKZrwj+uIuzzEfVGE87mg9kTRaD2CmPESHScaGCw6Y
	5neSQ4OUnuMNlMPRPBIbnXdjqq4wKoPu3wAcr+Dz9WRZBHM/loDC5TUCTor32nFF
	Z+Z7Q34DEDmjb0k3xufCswKmr5IBjeynhilXXqBKsOq/1qXG5anbJIdGFfhBKK5z
	dHCcoLNZHyrrItWKsaWzhWwDSJs6bUa6YgTcQkmUvSm7D7opHa8Tky72S37cMv0v
	p7SWvzNSu/2pIInjNGb+XOViF4DBDy5jDzcTlz3HWPuWKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u333bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 23:56:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1852a86fso11785511cf.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 16:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783122963; x=1783727763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=831YkkMtfz85xC+Ki05XtBOm3sqOTqm30sA4vibS6XY=;
        b=RDMGQLk1B0ysakg5JrWKprSIXA0WV2GnXs8jq4uuQMZxzSQmNjCt0ccWP4pO0Fd/C8
         UF1slX8x6G0TaBt95/mCg20phDRww74Et9cTXseNJ+KWmZr/qQ23JI5VgTPnP1+pTpsO
         QgLZVnArtZS8UoLP6FLJzAMA9zgyDCcz1gpbnyOOIpBOydtNl6a4Hevtpx7LSVrSSvj4
         a728T87qvDmiaxykIITDxW1YeX/gycsSRJZCPdJbY838TpQmNGbTFIOfHvu9ZgAPtp0c
         Nit8ewhB5o0s69i+EGZ0MHmvPVL++pp1FnYi8dshM4XuutSPdIYncXAxWia0nlWiM24j
         z8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783122963; x=1783727763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=831YkkMtfz85xC+Ki05XtBOm3sqOTqm30sA4vibS6XY=;
        b=fneBxjDAGDGMDh5Wt6C+lSTNrSZD5m+p5nPSIy9wuk4cUcJLmN/tfhmsMYzd7ZZc9B
         X7cy0qK/LPI4xBpq2IOus9dy1BqC1LbaPzzB5rZ9fWVH/pJ0wbnnn6SduBHvKNVQImah
         RL1SS2nYOPSJeDvhxmnwz8ajVttUCQAo4CWnaqHTo1XvmXta+REuBM19bNzIaccMXECC
         yX7P31yy9YCzezQLL9R1z0arN9PEvuOqdJV43CAvsQrWOCydiEYDKzyMwXLkuij8hgJx
         Lm/F+u4IQ90P43cZp7XJ/IMw2VporPmySb4SM7BESZzKsNeyOs3ofiskrSnGkS7p5mI9
         aDKw==
X-Forwarded-Encrypted: i=1; AFNElJ+OUBervMnxsDiYCduiiDsjkJTlkopsajwdnY88ufgJX4w3WqIx+dNSVxTm4hYNZesd9xzj9ROH3kDY@vger.kernel.org
X-Gm-Message-State: AOJu0YyTs2aN2YFPCQn/ZM79yk8uEhIxVuWXlC1j6h2lGolWhCCZe7wX
	aA55bxoJ1huq6przwJPu3TQ2ZthBt6lgnN4I0CpFEMDxr+YO1m9yaT+8tscZaAiVTukT2FmYRvm
	q/pXmWft44X7d/B8sxjammHMbyKrytjOW7O+vre5KSgJ6eHA5JZOBqfMbNw/HJplz
X-Gm-Gg: AfdE7clTYJNNpxyI+VDIvJOQvbpBLzbp9MeUE9qXjTCizw7pe2cUquKcwcqlZVenpDi
	FnPGVy9eYR+w0jnngiAUamxrEbn5YlMf9TpgHtKCWzypxdCCI5USUa9UYr4DDKilSc3FeMAMS2N
	ojqCyksWwo4ATzpM7HbGWYy0osOGNsU/ycBBwW480iXKCC9RloE6jU+ypc4QTvnuJ04vv0aPJJP
	f6LMxwO05pAqo74TdFXxGRA/JUfeHAhIKT5hls9xkE6w2QC+Xsks2g82eE+gqx1S+AqZ2Ouuge0
	7qw/3xt3C1R63M4w5OlDZgBslpCit6H52LViMdExAqyYdiZbENomYbUrA67jesT1nSfuCnb92VR
	yJtJT9d0bD/z58LZlN6orOmCHUJ4td4KtWYx6g5WPH+fvTtGpfVDyQQxZq5CUthprZ583WEd/AN
	kYaY+XdggEwBbTMgPJcvCpaFip
X-Received: by 2002:a05:622a:1196:b0:51c:1fa1:80d3 with SMTP id d75a77b69052e-51c4c307336mr24520521cf.49.1783122962810;
        Fri, 03 Jul 2026 16:56:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1196:b0:51c:1fa1:80d3 with SMTP id d75a77b69052e-51c4c307336mr24520261cf.49.1783122962434;
        Fri, 03 Jul 2026 16:56:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb714sm833240e87.51.2026.07.03.16.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:56:01 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:55:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct config
 for sc7280
Message-ID: <4rd4l5ioccdiggvlwl623qsdoy2udy5cr6sigyxrg5pbdll37g@sboebzvzlr6m>
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
 <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
X-Proofpoint-GUID: QPu4vHWVAaVnbDXYtFtukB1io74pVAp0
X-Proofpoint-ORIG-GUID: QPu4vHWVAaVnbDXYtFtukB1io74pVAp0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MiBTYWx0ZWRfX7sExkNvzYJsw
 czg1t9zTOO3LpzBrcdENdyxL4YipjNsMZWl8MR+gpu+SEizkpc9sULyTO+6+VaeLrnI+V0sp0B5
 CGTLLP8TiJI+ko37b75oQ5ST09ati7E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MiBTYWx0ZWRfXzG8S3Zr7fA0c
 tjNgr9gsrEYqVin2sxXIzIvg0XzxxRrkm/Yq0yHSgl3YS1sVnf3B5cRq3xQWqIcdz9QJQ8hgNKB
 rWZSHWvMH3YhB5X+0PeiLKKlDhgrjeQyJm8SrHuVXvkA5AvJq/AIVX0MeMeamv9Q6AERX0uj8fv
 iRKa7pNda6xRJxnWeWsKrwpFtNysKmC2MUucugljzek2FaSd7Zu9ki+cwqh1K9eg74DfMZ83wQI
 AvDm2TEwLKnvhVpcAtrsU+1NNgYJwybOXsfbXfpjNloxiJpTztoJXxCtwRhCgyXdsSPCA9KLYbB
 xn3Am+83X6F4Ez/EGgJ8JQ8iGO+p+ngQtS4Gr0pgSgBWd8A7F88l9hxIqJYX94dkQu+K3B5Ew6n
 lXhUNeVUNMnJDJlNCB3j7vwUpUmvcnWfu4xkH6RIAR+hx6Vjv5MGQEijEFsD16jtQyFJ7mrn6w1
 X9O4w0PqZlIXKbEEXMw==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a484c14 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=6H0WHjuAAAAA:8
 a=SMZjMqxzaKuBaJ7l-ysA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030242

On Tue, May 26, 2026 at 05:29:54PM +0200, Luca Weiss wrote:
> With the v9 data, the controls will have completely wrong names and
> using wrong code paths that do not apply to v9.4.
> 
> Note, that this will change control names so it's a breaking change.

Is it something that we want to keep as compatible for the old DTs? Or
is it completely broken and unusable?

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
