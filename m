Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900EC2FB97B
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779051788; cv=none; b=lf331e8e5r04YWNxPs++4Ek47PX9L/tktppRJZnQ5mAnlQTcXPtuYmYZRPbI88qFUFNxAEeQ/dePuJvq6CAxns1FcLC6TroZMyCa/HBzmKde8059BUu3Ey/F5txPAsNV341Tav7aNZQUnrIhfBAwSNGag1M6QMKK3xBD3BLx+JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779051788; c=relaxed/simple;
	bh=NoGjoz7ljns+CMqTGt667ziDj0pK8O6jA7MO1n0+ZUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKAOZfOm3teA9ONmwqfyjJcJGBAUkZ1g0BRl+RrlHvw38HnlTRABBtB3G7kbRk+3QX7mnGkGQVR9GgRkgQI4aQGShhP3RIWIzCsKsXz/HRPhfY9kE0rHG3UYbgfSVpOWo0W+OSp5nDTWTov4604IluyAf16OBDjYCt2HgGRpq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8yoWMEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVw+KgJp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8yoWMEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVw+KgJp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HJcqu2483452
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 21:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VVSuzLLDRHb7QkGv2Hj4Tw1K
	ZRnYa7BJhMxXlF9ykEI=; b=M8yoWMEMDAISG1SGUaIJrOGqjepTyR3+P0mzvQ/i
	rxQhKUxNBhUrib+kXilfFOBdKKBe6Am1gTkH4FcPxOeR0Dhy2ldF2ici9V5M7EeG
	HgfuhJ+IE5pYepRqXXPIhyM9Sn6xb4izhSEaxyDFgckl8p1D57MqJ6oJ0wu7Hnbh
	pwBYCPJ/+awgjCRBXiDIGluErU1xR9EFs9t6raJhbQdkEdmzx/fiaGBrOWAWNESh
	VyKoA4NxLwGCbYgsKgzBYwjPy4MUySM/JMh5HkIO5VkxtX806OFsm8NaWXeRQW+k
	Y6RncfVnstTkXzKKFdSB3Z0/L1qN0CMTUfjp0i3Y715drQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcjf7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 21:03:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso50059421cf.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779051786; x=1779656586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVSuzLLDRHb7QkGv2Hj4Tw1KZRnYa7BJhMxXlF9ykEI=;
        b=YVw+KgJp6YkhZS9O/pITv7ELNJaQKaRJmfd2bXg1cCJlq6Pxr7eiVwvLK6BJsGGwJl
         1s15cqWKLHYz4Tmq+hTVs/L3YUNkCdT5ThP7Lo00bgWcYISsT63CSsoY2GtMmG1wrhrO
         Jn2mEVZs79sy63zut7GkD1rsgTii0r8F4ynzw+jYzyUkIn8eFRfhWlWdi5tJR3a284+w
         JZzZihEQMd5EayQZbm3pAgXsBeYnnsGuGLzxxq6TT8Fz8IOi1STPtVPnG8qEIL+rhI7T
         Ltktidr1nbAw3Nc+k0NJYdVBdvPa1fYKVt4hY+bvpWisNjlmxUOwJ+gxI0TPFd2u09ik
         KKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779051786; x=1779656586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVSuzLLDRHb7QkGv2Hj4Tw1KZRnYa7BJhMxXlF9ykEI=;
        b=OG0psrUpUMKFBskvquSr6KJaE8GAiCQI2bvGLUIUJ7fdjsxVuW1qZ5qRD1Wxi8noni
         qX/QJY2+WCuqwgTMOjsKqCBP1gNHQixqvMoKwpkN9RO/UX0eTeIm9Wy+AUC75umRd2sU
         e1Fu8uUSmXb4t7OvbB6847y32OUg+YrlalrDa3knmZuTRTugG04p0m9Er0+OWzsW16AI
         c+/xqX7K75sUhzVnzsiXX6YSA+etW9X1zvy3WJ6WurmJrJuBqh49dPQO/l3eMaWnTUym
         MtPJ5Je/mV6LbWEppEJvOmO8n3vtaS6kkRcQRGtc+d+dlMZyLRikdUsg04PxdJXi6btS
         SGqA==
X-Forwarded-Encrypted: i=1; AFNElJ9teYLDphqIqAUl+yRY8Zf3kMRjkdE1kZqYDgc6uTy9VQ+at1GSCsDlJZHfYz4L2u9qvtO12S0fNnYf@vger.kernel.org
X-Gm-Message-State: AOJu0YwwVSN7VnlOarxwP1jL/FeC6lbdfIUzXkLAXfr5RtaeWWifKm6+
	dtyjnRb9JjQLo9YBlFfePhlhZstc3nmDG5JVfVv2JGOEHI5fMijqHGQXGTqnHWtPT+5tIgt8k/6
	XquhuISCd8OxsTNKpQD+BXiBHvA5KqDBFPWCHyubv76hlGh+Cera3LSvommIG9PBg
X-Gm-Gg: Acq92OHy9cFKldkHhBcOHdX9VkByjj1MGfE3wcrnVNuwCF0h2qrH6P+jRmossM0YY0I
	Ghe8OarNEMwkmq9Y9VAjbrlZoocoQKYrupXR0nVzfs1x7mMT4wqHRcLNbY2LGmjZihT5dVYEbjY
	p9FX22iybHGszVhhCc3lADj2+7gCfUgYZH6qyi5c1eJnGO07DaqRt5NEuA+e8tfWybisO+ynD8r
	BTVE3fdsfvdKYocCSo+OjR+hr5MrNVxjwUh2n6zDDFTD5pF2rVtrGaM5WSfviU/fSrvOnN9f0AT
	ni2V4vJ4sIGpeSot06QrsqTQoWB1yJkLxn1vmfL1exv1WNO3SMHcm71HztBoAYnVPd+o78zq9MT
	2deL75y4cI1sB2mobZdBONAqerCJSCvTXh/jKy60MkTxPIjPKekn24FNywkIXRbIlBaO6W62x1y
	IayaXT3WTe5EJeZFRFbXtq97OjnHNvPlrCCXCiQ+ujubdbXg==
X-Received: by 2002:ac8:7dd3:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-5165a22d156mr183972291cf.44.1779051785710;
        Sun, 17 May 2026 14:03:05 -0700 (PDT)
X-Received: by 2002:ac8:7dd3:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-5165a22d156mr183971831cf.44.1779051785286;
        Sun, 17 May 2026 14:03:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882e734fsm7520441fa.18.2026.05.17.14.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 14:03:02 -0700 (PDT)
Date: Mon, 18 May 2026 00:03:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Frank.Li@oss.nxp.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
        Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: display: simple: add avic,tm097tdh02
 panel
Message-ID: <qfyc3kuhd5qwgtbbvhix5upyfcn5s26vty2yrnkzun7vuujgco@44itayac2pfe>
References: <20260515195935.2415466-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515195935.2415466-1-Frank.Li@oss.nxp.com>
X-Proofpoint-ORIG-GUID: e5DatTq7kxVU4U46AAAdYt-5hwXPy0RQ
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0a2d0a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8
 a=402Ol7Zq4xy1YCkJ2sQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: e5DatTq7kxVU4U46AAAdYt-5hwXPy0RQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIyNiBTYWx0ZWRfX/b5/M+UVfnrV
 PDh8T/d24oorlbkXUqL2xkDyU54uGB7/qLx/rmxTCvfjSmhn+KmAw9umiIQwtp6rWma6Spom+9v
 2SvXD22Iefy+IYU0oUE0LacCnF7H7GB42J0KMpJ++TyLb9sCqR1wHR3E9xPAfo00ACQVs4eLlgy
 xx0kiAVhbG6hmCpyv8A/bLhN7Qe7+m4Pzype2fGwaL3rPOx1Fq2WHY9bSTchdvAg1FozW5YYRU4
 4Ob76ew72LxZjmoFKBfAvdwIEdfXkJny0bA+FJlqZ0rIShYzMW6wR1/4QTWwhrg0aVzdudOUS1X
 CxbDr1syfnKk4hxdm96LkzUrIsy0gCHtOdNitcr4Z7jmCuam1IF4dNWA2ETKR4jF8KHa/GkhLBH
 87j6xtFxmDsgscp2cxtDH8hVGYBk01y0ZEX5VJbnfYZHbTlkQpZ5yG8+Ao/gm0qr3uygNEAbdM4
 ZuTmNGjmrIF+G06nGdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170226

On Fri, May 15, 2026 at 03:59:34PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add compatilbe string avic,tm097tdh02 for AVIC Optoelectronics 9.7".
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index fdf522a15d2ea..a8f057208e23d 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -63,6 +63,8 @@ properties:
>        - auo,p320hvn03
>          # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
>        - avic,tm070ddh03
> +        # Shanghai AVIC Optoelectronics 9.7" 1024x600 color TFT-LCD panel
> +      - avic,tm097tdh02

Not without the corresponding driver changes.

>          # BOE AV101HDT-a10 10.1" 1280x720 LVDS panel
>        - boe,av101hdt-a10
>          # BOE BP082WX1-100 8.2" WXGA (1280x800) LVDS panel
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
