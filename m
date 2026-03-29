Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B47C3603FA
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774799482; cv=none; b=rbMdXF1z2cDUM2MP173uo7g0wafTRg4ThNDIf0LRnOVs30Pk7/qQ7rIuPB384+rDBWHYV61mJ/gxktNPfmB2QVzWjSqXmlS+PPMrgbSld1f1jWHd9sMBDgGbMoM1T10Ro9QpT+eypMbKCehy5+J//2m74+GVGChQv9hGhkZZyC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774799482; c=relaxed/simple;
	bh=2eJkXHOIbbRbu6BB4Fzky2gcZpiRh8tGPD3ppZUZ9Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiU0ecU3HPJjlBpsFe6YtC92uKbf2U2V+O0+fTU+Vrc27xTcPhYt1cPkxi5izybFR0Xn1FxTocsBXRytchkkBYRxOOU85914wz32PsXXMnIDFoXZXfvBPUjXv2mAuu4Lc1uIi8FOJT39pgMFdachZnI77ch5Nn461qOH4FjgoH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ghppxhz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qy4CqwGI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ghppxhz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qy4CqwGI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhSx11754383
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 15:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+XFKuPsubpCNTnF1xZlcgXY3
	EdV75Y5UQd0HC6KEMlA=; b=Ghppxhz0cewlrm+xU5N73BddzzJzL4zFWUnQgLaZ
	oV6UxWEEcMyQzO3IueRm9Jykw0oT3RhXG2qZR/KJh0naNjrbkV3KmoI4A2/IvzNQ
	RkQtm6dZqEhq7Pd614O2jlBZZtNsGicUYPSXdT2yHUquemPargpJM8cIPxPuRQjA
	ZcnW5QOobeilIxQTpP0Sw0pedHSMP2iaVYhIUeNTf+wlVi5vFOhaM1bINHMZFlKa
	iEocgYF1/ihFECxwyDGhSOb1T9zG+omGxteROAm8kdig6bv4aWquA3Qn6+7dUyp1
	kTeeu8ILtECPH+yf98EkbQnl33dKmvv/oCddauwRZO06lg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmh69w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 15:51:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ba09affso108983891cf.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 08:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774799478; x=1775404278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+XFKuPsubpCNTnF1xZlcgXY3EdV75Y5UQd0HC6KEMlA=;
        b=Qy4CqwGIvKlNiegYOxaI7zH6/u8+yCtP0UtvWMM66YR7StfxKkg9ezE4zPtJI97ca1
         Pem7WGMr12wk0lYkIc5EIVI2jXiau/rm0jQDNGIpeP2pVOVkndr5AiRDcpTCmOA0vurp
         xTnCXojODkaqZVNzjZ6V724mj4fy8k8fSoMLvdJh5T5car4X8oayvYiYsQjSdLUeK7Zm
         esBCONyOUicDFtYryOrZXgxVTpoSOST5IYkWm7d59ayzKnHxfRKdqQP7UG+1QO9GtXiq
         qd0Q7H2LtEiLdBRlqUzOpxJnNtlesMU6tQCi/0CkvNmYNytWnccsRiKd7d73MqLobZoM
         +Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774799478; x=1775404278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XFKuPsubpCNTnF1xZlcgXY3EdV75Y5UQd0HC6KEMlA=;
        b=HErPsf3u95Aoae4QR7yNC+5IS+c3dgRiiVDf4I7DmdRE2KchIYrq7W9h2PxC9xO4eI
         7nl4JxPGIAA6wAeybdHNWnOx4g7FEI0rRAnnp3pzVnlnZPD2x7LmUoo7YHZrAngOUuoa
         xU5snZS3WVSvRZ/hY+Shaw6lZcrmvPQWeaAJ3YEqk8tACQqoQU/pYGIz4PVLwSq2aXlH
         6u4cG/dHR/w7Jqs9WXRdHNL/uvGukPpuHUnsOSyVqY2SWP7yZDRNZtlsGf5VWqLJJAFo
         4oCjceP4r0E/hitg1ezcMwHDPsPsCqskCeTTPZDqKQmP6pXaQVVLU8Kn/OjIk4W821fj
         kpAg==
X-Forwarded-Encrypted: i=1; AJvYcCWTy/SZjx3tRqXVtJVSitntrbaHwV9Oh+FOxU8pIU3ErjS9FNLwi/jPYOAhUXt4NXxGv7FcfVDZ440+@vger.kernel.org
X-Gm-Message-State: AOJu0YyPVYcYRTmzRdK198rrm0+Aqg0RMFJE6gJfcaJvkCBs1lqKYaK6
	ngo1NRyqB9a3po1hXB8pAyXnm7IqGKpWcf8cVboV/F1YNv1EXvF/rg1yEa6P5fgdoIL2p2MaZV9
	P4g44/VWoSNT7TSzdOpMmlKuobAjBYYxLpUC1YFzOhBSf+zGaYZxwAmirvN+5AtwR
X-Gm-Gg: ATEYQzwF7ChfamhSgyWzaRbnT+Nuk4ktPha4uFwD12UXCgh38L08Q/olo0YGzSLpg5B
	l56BMWOyoJmSzk3t2KvqFdKav1rebcAxxXgHkk4LKnQz064+tPLK/NAK/nab86bJeQik3jx8s5B
	d5/sXxRohrUAR16+PrWYYBx8PDkr77uTndQyt/FrJnc8waWXykyVrXMbNanpSMHHofr308gC7QK
	XA/c5s+oq6aP5ajuOGhebsveOEJoUeJ3pRG8xnudkJeKKvY8sUX4GwMfpwyf/HIzi9n5r8llAAl
	uTcmPPJDVQuFLAGEW/vd/VcHpnZI2cpLUjxPHGyM5bZ1tyyeUqaDY2mkddruhaNzmFRHNjPXcZK
	S5E6tt+OyPFHUY6072mkRmVaE2peKLH0Kwit9aO1HfSpTpC8Eow2SeZRwc7/0TP3nh3j2nFNdhy
	FaeKUiy7PB1y9LJYHyEn2XsMP7VqfPscYcBmA=
X-Received: by 2002:ac8:57d4:0:b0:50b:69c2:b86 with SMTP id d75a77b69052e-50ba38b7f26mr125930431cf.27.1774799477705;
        Sun, 29 Mar 2026 08:51:17 -0700 (PDT)
X-Received: by 2002:ac8:57d4:0:b0:50b:69c2:b86 with SMTP id d75a77b69052e-50ba38b7f26mr125930101cf.27.1774799477136;
        Sun, 29 Mar 2026 08:51:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838b8db8sm9767781fa.29.2026.03.29.08.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 08:51:15 -0700 (PDT)
Date: Sun, 29 Mar 2026 18:51:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <s6kyh5wyamcxyd7xsbu5wrrpndpdb5xhxapmxze2qgblng5eiq@hl36nzg2lldg>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
 <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2>
 <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com>
 <o2sbqzcix74u46g74sil2c3b6mgd6zsrmafesoqltfbbrzqhjh@uochk3so46yx>
 <VRCUEe2qHZa0a8HzVvhoRtAZyXO8pBU_l96B6U1kL5EFVSJyQBfYeKDvqPit-qpPRtIjUbtl7TH0JegJ7LXvctAxgyo50K6rTC5hwNjuV5k=@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VRCUEe2qHZa0a8HzVvhoRtAZyXO8pBU_l96B6U1kL5EFVSJyQBfYeKDvqPit-qpPRtIjUbtl7TH0JegJ7LXvctAxgyo50K6rTC5hwNjuV5k=@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyMyBTYWx0ZWRfX8Ctq+8GIZaxn
 fsCUTk7FEzUnCSDdO156KOFZ+m3ArlKNsmIKx5SwP8zW9vxwR0QxB4TiC/qnEeezR7TIkj93cRf
 mwWham5hwS1Foh2cQAY7Te/dtQcVrW/74D60+v5o9VdcFIFqViUpxNB1gp4eDG0KOCWeh7i8VhQ
 y3klUZ6HXeh889ifltieY3IP8H4VoxykRu0X0jIMP24VkstEkZmeTjf4L0VZoA/Vqxd+VB+IaNF
 ByJwGV9swrXcp8R+LasJpr3IJMVH98Nf0LIW2rR3AaRUs1cZdLLQ53wqo4lRK1ibtTygi+Toam9
 W2EB53JA8880IPZK4LEIzxHDanpZ8KVGuNf5A8P1qcNhgZKjT5fwevCtTRUpEwwhEmx3qwP8DIZ
 zeBFJWPiAvzgsA52cGmwjCQsL656EAl9j3OU2qASyMH+qGpiJljJyN9XgkZP1z512UlM/u2cZM1
 LddL5NPcRnlojd81ECg==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69c94a76 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=j0FgyEIfbjhtT0SB758A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: OWdFSrY96WvlDh7URIf5o5AjapA1UVYv
X-Proofpoint-GUID: OWdFSrY96WvlDh7URIf5o5AjapA1UVYv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290123

On Sun, Mar 29, 2026 at 03:26:48PM +0000, cristian_ci wrote:
> On Sunday, March 29th, 2026 at 12:12, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Sat, Mar 28, 2026 at 05:30:53PM +0000, cristian_ci wrote:
> > > On Friday, March 27th, 2026 at 23:57, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > > On Fri, Mar 27, 2026 at 03:30:49PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > > > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > > >
> > > > > Add the description for the display panel found on this phone.
> > > > > And with this done we can also enable the GPU and set the zap shader
> > > > > firmware path.
> > > > >
> > > > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > > > ---
> > > > >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++++++++++++++++++
> > > > >  1 file changed, 73 insertions(+)
> > > > >
> > > >
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >
> > > I wonder if I should, instead, edit the compatible property by adding a
> > > second string (for the fallback), like this:
> > >
> > > compatible = "flipkart,rimob-panel-nt35532-cs", "novatek,nt35532";
> > >
> > > and, therefore, add "novatek,nt35532" string also to (patch 1/6)'s
> > > bindings example. Let me know what you think.
> > 
> > What would it mean? I think we usually don't include the IC into the
> > compat list for the panel, but feel free to prove me wrong.
> 
> I've noticed use of that in this [1] patch series but I don't know why IC 
> string is used there (in the example) if the specific panel string (the 
> first one) is already defined in the panel driver.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20251001135914.13754-2-caojunjie650@gmail.com/

That's why I wrote "usually". In the end we also have several
(unfortunately) panel devices which use IC for compat string, etc.


-- 
With best wishes
Dmitry
