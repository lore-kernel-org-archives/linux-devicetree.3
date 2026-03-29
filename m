Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CFE2D3739
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774778732; cv=none; b=paGPvbkId4jVf5p3oB3EEdksz2UaKH94mhcw33Do/IWXoy4BdO4hQwZTRYnAoRRAQGCv+D7hPMDQjY9KnAK+65lHXQHP7KUZUHkvUEiZ7CtVpgMHt1/OTQf8b8hO+ebe9Gy+Qq2eX0XX9Z3BeOxsPNA2I/mgFMSoG/y3I1I/Pf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774778732; c=relaxed/simple;
	bh=f76w4smlz+hTMhqq8j7EslmWV277pO2GsxXhCfGqo00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjSvYMX4vSVhVa5Vu0RDbsfGgLb1U4qEZxxSziOnMcBKXEaxOwg8nd1IvOi01vYYvrNDXEwvpVwxwAvY/mqkOrdU/kGalqYQ4Gr6I7LzMZFniuEIsOiJ+lijjsZj6wN459LHtqxR63CTZGf1DUx3S3pLug3oBkwGG21w1qAoIjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9S8b4Pq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sg5DYr3y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9S8b4Pq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sg5DYr3y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T6Fs8B043269
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JaiqO1qH1s6Lg7602BQN0CxF
	8FKSe/qUocsXjuCSObg=; b=l9S8b4PqvOFQrX/E7BnEIuqqHeaY7rle1VyRjVzz
	0wTVMOj05Gy/uwdx6o3CEzM8DWeisasE/GRkfUGySj4dHUM7D0/a0tqMQFjwfR5p
	KRcJNK3NXlcgKlCmKs8WEjcfw9JwtJfK1hvhoiW4b9M61LGclJj4mvWZUUwY0i2e
	an1jpXEqh8h1PQWT68rDuiBNgocdiEukL2aYskBrORCO3N0Jw4s4/EIGadbw/g7m
	MNPcxFGRV1SEW7DYKOpCyyy3ZWxoxRTb6hy5l6VmdkpDy47FFkLPf4erPENYnAA3
	jXgY68BBbHlQ6yRdcvov/hBNPX1Jqd/OZ9l6lTtaxg5SqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqjpx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:05:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so33765971cf.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 03:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774778729; x=1775383529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JaiqO1qH1s6Lg7602BQN0CxF8FKSe/qUocsXjuCSObg=;
        b=Sg5DYr3ygG9kJ88tPZ5hbm4EPkUXlrsTl0tlwL2LXsowaa0iS8sqdZvM9Cpy3Z9n0A
         R0sZjTKfK8uhTMTA+l/+E8/Vq2OHAT3RFXtqSG/LSNo1TCs7NQ6Pu7/IjQPUNb9e9lYy
         QjG2Ne9cAYllLrM/QKbnra69pkWFSBinURSXMAYVxkMmW7Qqjh7+XgAPar7gvEOs4oWT
         wZ5BqbltI9W8igLWJTrP+r7pO8qPwUqBFqMszCN2trynRasQNOmJhKyCAIPUlvGUxAzY
         dtbdir7E6UQocEEKvhdhpR8GMBay16HbGdgCcd3YWltCzTKe1eWCyKP81TFrFePerCuo
         90+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774778729; x=1775383529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JaiqO1qH1s6Lg7602BQN0CxF8FKSe/qUocsXjuCSObg=;
        b=SNEIohAB6K3RmHCfSaHfwoBRdrgtifrZFKdI+OuXygIqfsaxpuILvTK2gKHyRhy/Ga
         ANtLYFBpOfK52AHO/PUmQJa8+6CcK/IC8mma4SBXu07mg8y0ubsjeLafJcTouZDXiVUK
         J0Bwgi1JoMmHqg/zHqYolIOI0Hndd7Qq1o7Hsxfu1kBGHXUC7EPFaBuLcUQlFieDJ1eO
         RnB5kKqv2cNWZ8YehNucChx43PgVsuLW+hI3FbmXfebHpCYCTbLfNhO6O3Ajjmu0YsdU
         DEK66AqMh75A4mdqLyjCTkWMgLBbTwPRdyIiLQ259jVYq485vlrxK3+GuG73ETduHt0W
         DGnA==
X-Forwarded-Encrypted: i=1; AJvYcCXQADQMA5KZ/12b5arZ3HJCkIM+4G5uwUkcATq4vCf3R3q642O682kH4t0cRBSbbMbhzBpYkHucyN7d@vger.kernel.org
X-Gm-Message-State: AOJu0YzOYoXbsadgGEA+646q9Db6nfvM5zh6pJZlAHdcNW/Dei8+wCLc
	dAkJBYHkQOSKG8SdWkYUpKYDVaTKUGIuydXYXrHpmyE/498xZnGPqEBVKTDKiCglMzl2jeVcVKD
	3PQN4cV7ygGWMJoRElMoDxJ4DxF/DZvacBYuzqRECrvwQqTrcUGji7Fv1PT7rn2th
X-Gm-Gg: ATEYQzyvjRMEn8gsms/iga4PT1bkEmQ463AbE2njR6rnIKm+ncPpf9roxZ13P7GoqZG
	ChORBA1cuUj4MRv9Tc3QKWYKT5m4B3Lr9YZL6HHAv+xqh+Pl08iOgNomOK51F77JKMqrM17+Apm
	MCxYw8RKcaWMVE/U43Ef/dZwOlr74DmDMkJFCbr0+giIjqKPAsxuRb3u33aK2ZxuJeMunhe8CFf
	ukADvgtSRg6yIw9WBE9zCp+oNHF7vuQUoaq+ZGKcG+OndrgQAgK64dpfx1k9UXuCV5+C6DPDFnO
	Vy6GR/wFNjy4IvqvrU/jZ8+XHRXoZD3H8r2l+vfxs1H1fyYM/k8/ydoGyJWzzbuvhEd+slcNqds
	fUmMpLOmOLC89rmNM9015i1S32FEinSvDODusej6ktxbJ9CLDixclQ+6SCF70IXFLB0dSQMrjNX
	DNfblSX1Z8oSpzVv1hxkv1kF3FM20QVgQQ7tY=
X-Received: by 2002:a05:622a:8:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50ba3836481mr121712721cf.21.1774778729076;
        Sun, 29 Mar 2026 03:05:29 -0700 (PDT)
X-Received: by 2002:a05:622a:8:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50ba3836481mr121712401cf.21.1774778728557;
        Sun, 29 Mar 2026 03:05:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8373096esm8697771fa.15.2026.03.29.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:05:27 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:05:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
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
Subject: Re: [PATCH v4 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <3qsp7fawh3wtvpvb7zvupfjpio4dhg7po56gudrttb2jcatqz2@gqhdobwalhlg>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-2-06edff9c4509@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-rimob-new-features-v4-2-06edff9c4509@protonmail.com>
X-Proofpoint-ORIG-GUID: rIVZ2XHYoKy_exBghLAkxLawuuOIHWDt
X-Proofpoint-GUID: rIVZ2XHYoKy_exBghLAkxLawuuOIHWDt
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c8f96a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=f_kZLxWr8KFBRA8n9fgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NyBTYWx0ZWRfX2XE4sLw2Sp/H
 AAXXW049eW/I6Zj8q2yEOxzpUgPdPoC4JY8hRZpiLvmWu8E54/qs5nYeDmS8JBHkPfXBCYF3JsF
 jpFj4x96a6lOosr1I30mVcILv23EPC3tZAWbi9SIYMv2Rc2JbYvz5EhTK9WTaePaYAw9aBCpDIt
 5q6sdP8mV5GnyGp2MsR3oYFEf+c34PjsMnGYHj0NsTyVDvjUiZ7AnHB5SKBoe8eqI14h0zt+tpm
 SCVcQQUn0fuIRHNPB+UaHju5GDcvO3JktrJZzR/i/CSVWJFFpyJwnCTPQnHU6BVb1lAUrfs+bUI
 fzn7tD9CVCTCuy03XUm9FFR0WeXL4I1jAHEDhsKbtvL4o/n3Ab29KL6WlBjaepZAQIF4YQfputi
 CGwZj8odS4FTIGwiznSwxf0FkpjCg2pshi7PKbfB1zrwrEDX9TIHqsZTFKA/2SlSy9gb5qKkWIh
 4Q/lUX1kUQGswtbDoWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290077

On Fri, Mar 27, 2026 at 03:30:48PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add support for Novatek NT35532-based 1080p video mode DSI panel.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt35532.c | 796 ++++++++++++++++++++++++++
>  4 files changed, 808 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
