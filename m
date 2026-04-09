Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4B31F4C8C
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 00:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775694794; cv=none; b=J64951fHXl9QvK/eSuPUijFEahNhOZEsVgIjlv6KgaqjsNHZvl8Y867Zwz1ITqzNwFLNRSoUNgG6f86oGrwTseGNNUmOLIVOnDndjCT8e8M4gmnP+rrT5R/mTrVAEFSHojOqc1pXaHBbPU9+qh7YGrSr8Q05d8EDOaA643Wuf4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775694794; c=relaxed/simple;
	bh=A8ButF/p6fdC2H7a1NdKyYUkorvb3n2bFFz9qjWRh+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPmKwUHT7YuhN87Ph7tFq6Czcu5AM+IoLU9X3hvDRqmpvvVvd1M+91pI043xs1pWXXd2JqJwT4jZha+opXrFduULaLkSQ3Zk9aJKr+ugx/FgJILPfjr8GzrKmAMiHNGjrtsx+R4RJN+y4Phohx6wle5gCTfvFLxOtp4DoREwoWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0SCwCZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8ngqrOu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0SCwCZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8ngqrOu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638HwL04062247
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 00:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VPebicgWeW163zCIOfHExmD6azJCLCKyS+x3r/GXDMs=; b=U0SCwCZX3X+QreX9
	INbBys5rUwg4oR4+lxiJ0/igdZze1ifAZ31n4ckjOaqtp4PddKYI0NqBsoo6Slzr
	BLu+rfuircUxWKya33zjFb4xxCJYdat8hZ/pEDp4LlW/tzPR5CBo+pYnNu9hpkEZ
	Jp+3dUcS4gepNuPz11Sui0I/9Dg6mBmxLUa+1r9KixFd43258J3AcbKqC/3Pj01y
	xJk7eZdDCFnqA7IarC4Og7y6T0oSh7fgkqRTjz0GeTFp80sV4hUHuW8bqOXDi9tZ
	RjasNPCPjBWJIanc0RLrlq1mRPczMnUaZ7WL32It23eqLUzfp3NNusw5NUaK1omr
	Yp6mpA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dduvv19ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 00:33:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so12990521cf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 17:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775694791; x=1776299591; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VPebicgWeW163zCIOfHExmD6azJCLCKyS+x3r/GXDMs=;
        b=i8ngqrOuPsF478PUL/XIMkS6DrQEVaKOaqErk5nt+MvfuTZtTlU8njVyCFJrIhgP56
         bNHSEGvJKd4bH6+0RwfOPMmfsQIrI4volbIE7kOfaZpfDy8dCoUrNYJiNxda6nm5Ivkd
         v6M5AOhRlXwv6iabexF0YQQLXZhQrXmXJuXcI70q2fCTV0QhNsQba3cF5KNoF68gbAbV
         lhMCNjG6Nqa3QwmmOn4a66rrn6CnPSzeeYLRAZeh8kl91IP09UFjZcUxBEPsMPuYXOE5
         Wp51zWcvht42a+X1hAHaUUrQJE39/iROolKRw17pLnFyFLlUCtYEKz8r2XPCgZVEnb3O
         9nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775694791; x=1776299591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPebicgWeW163zCIOfHExmD6azJCLCKyS+x3r/GXDMs=;
        b=iZnwVTbD18bn24uT3/hFekBsz/JiRvQ6BpWqxaLNF5GSiEaJMcLuLDvTgNvbWIkBse
         CTWj3wTMEziNlZJ490db+Ri0zomn2IOuaohE1NCZUXhaLfHgTSt8AqTbFPKEWbOIY9MJ
         +YNARIEDIaqAUp/ifDHkh1bSkiWiMULEx476XNaV1eZehAbULF4DYEg+bONx8BX1NBoa
         CoeKlG/67NwrAUxvUk9vbLggydFn1vPBkpw9Ss1tPwm/h7IRLLfatZ0jGuRP8BZMEFGp
         OCz1i3q9TH+YGLjfLPFl4dq8GHi+jx9+X4UvJ3/ZpqNhf37pmv850RaYRmCDcFaz4nJI
         FxwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFdaO9D38+xY+X2mxoJt/FpxxZ7qMkmphBrUGQMsP213wF5B4lBRzwgW38pvDddQtHMTwgGmRN8N8P@vger.kernel.org
X-Gm-Message-State: AOJu0YyC2bmNO3O0Gw2WGSI7Lay49Gq9shXmnnqiIoRr6WysStGmkohK
	Apw/ooPHNEHh3iiO5Cy+Y1/4cdDym8NbrCzv/pOj13MXGvj/CjFpvS/GUX+9C13b1STkvdhoWFb
	VvaQLS707sIRZFDKUTyzqmiN5uH0GqkljEfb68SuYXiS/na3A/RTt/luf+IWr/QtU
X-Gm-Gg: AeBDiesOA1z3T4EUJIhsMOqXXWaLPUfG5BcPl0d7nPsSeesuVdAwJXuLwi+cSEXdZqj
	DbT0yRQXrh2R+8LG/jtUT3tZs4ZvtjquUsrSmEjvnqL2WlLeCqmgr3ecOserQQyG/B30quqEa7E
	ShJyWweaueSUr6+BpvoFjXMwoHQh8Vvt+YmTH1Ff2j6/XxtGGOO2l4EFV9SVILbNiBX/aRhLkhC
	iIguuD4nkaRJAsQI73qEJ224vi9TmADkhHlno31u9PLB1fE9teZxXzwvR/L1a2yZkPSzC1RpMll
	Tr4OTf+TK/Zihj9biGz8HoWZsSMly0/Bd8cjqsoSJzPXYlRuP5BI6kBEWHCwwKble2ZKSPksb3U
	1FfCXg/Pt6zU0hHNrD4A1qT+XkD1uXpBfm2I3u8osAJwweONSTXze+tEJrQETed8j8cYdSVNPzf
	Yium2vlzo/HvB/37tr61Cqz2YPRf+bV/NjK5w=
X-Received: by 2002:a05:622a:208:b0:50d:857d:7ad5 with SMTP id d75a77b69052e-50d857d7d33mr242507761cf.59.1775694791174;
        Wed, 08 Apr 2026 17:33:11 -0700 (PDT)
X-Received: by 2002:a05:622a:208:b0:50d:857d:7ad5 with SMTP id d75a77b69052e-50d857d7d33mr242507291cf.59.1775694790651;
        Wed, 08 Apr 2026 17:33:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd3698sm5136232e87.77.2026.04.08.17.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 17:33:08 -0700 (PDT)
Date: Thu, 9 Apr 2026 03:33:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 10/19] drm/panel: himax-hx8394: support Waveshare DSI
 panels
Message-ID: <fc5iilgkotgp62aq455qblguh2ktpgqpjl72wxh5oydl4bnkv4@ph65twdn2566>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-10-5e9119b5a014@oss.qualcomm.com>
 <CAD++jLmG_y2dunkyzH7KDtphN6WORzt87f5CpqzAtCUtALv8CA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmG_y2dunkyzH7KDtphN6WORzt87f5CpqzAtCUtALv8CA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAwMyBTYWx0ZWRfXw8Lbffx/Ft1Z
 hHR6DKbCYziQ6ir6YZxo4CoIWvzuHqC5k2PsjkHTZ2yVzIgQQ0EwGHWWx1+7GY9OZkh3qrFsmP7
 ZLRDaANMJ2cHp/wBEaH5SItGMuGBnblh0c/PScbW+pHcHRNidI5KO4J6S0haCBj7kpT/3q7e3w+
 y/3SbhzERT0g5Qx0CsUQ8VvD5gNDrBxflhInPQGao8xjLxKSSPmZLWYbIGNUGEj3pXigcYTc9pW
 6y3cnkqJ6Le1qp93xjQw+kJckbq6pQEoc7ZeqL95Q63kDuxJQRN86SnFRGg8PfY01nJvlnpSliE
 zzrlB/3puAoCs5DPzyEZ7iHYZg0E2durDxQopKaXTvv9y0BzgdpuZPbbXgjvj/DcGzWd6o5IGke
 x8PVWc+F52ElAGcvK+GLGFzleNHmxsT1HGKRpXNBnR2gJ4yArIu3x7w08CAZo5D+qZ+/nouYzMx
 UcbTjpZGbd97fGzWlIQ==
X-Authority-Analysis: v=2.4 cv=DrxmPm/+ c=1 sm=1 tr=0 ts=69d6f3c8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=UUk_dXEGBgzJ8t3P0IwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 7Mmsp08Pg9iFu9xtEab-pGY1IRIvBc85
X-Proofpoint-GUID: 7Mmsp08Pg9iFu9xtEab-pGY1IRIvBc85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090003

On Wed, Apr 08, 2026 at 10:10:13AM +0200, Linus Walleij wrote:
> On Wed, Apr 1, 2026 at 9:27 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > Enable support for Waveshare 5.0" and 5.5" DSI TOUCH-A panels.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> This looks excellent, good documentation and references to (incomplete...)
> datasheet. Maybe this datasheet has the defs I was complaining about
> in the other patch?

No :-(

> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij

-- 
With best wishes
Dmitry
