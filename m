Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2991AAE28
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 00:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775695799; cv=none; b=OzkK6SkHV8YpliF8iRR5aG8q3clLJG2YVXvP8tkGSXkr8t0tVTsW6TFaY4DFDjYdmCtSOdh8tGsGgpNnCqPlGw6HZ8LH8WKVnNiGvn7RJ2fzo9ZO7CdR8OGBCmWuputgDLr4HFSQ5BpTuHLLCeRZ/SVNrtHgawRsq7ApKvJzVv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775695799; c=relaxed/simple;
	bh=3okOik6LRshMM4f19RzdCp7PI0VZaZepZ3WWKumDOtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9gzLJr++G/6zXpGCfPEbMsmdQTacHWw6q0sAt7qhq/vTeZDjJHRiFL4SoSsDlc79izSsEReKrchHa9aJYC8B0YjLTD6XWvcCSgFj132zG4J3+H9j66E1ihc/+Un/UU4/P0FjSVxsx/E2NU6o1U6SKlZsqmCJGdjBm0P5oYqXuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H997VMoG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHV1FgJE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H997VMoG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHV1FgJE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638JXfBW3325993
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 00:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqEE6rmLZOuTWDnBfLI0DnPCbDUB+b65JdryhdhG+uQ=; b=H997VMoGJtsBo9IP
	5hoqIg7GV92AcWKMb8ztxkKxeiK+7qXPwfWN/IcOtKTagUwXSixzQLjsquQ13ngp
	QTTKonO8bDJq8Ih0/tUiHEN0P+draBnmYPBhThZ35T2LINShFDimMI5Zx/0CYtDX
	lTeaizxr8uX6MR1wdKk31hsLkbXTvDWhRS3ptJJL9vtL2/XkRPSfEynVJbXddsfP
	0aMvMU8gO3Dzl1iuZQbWWZrNqtwj1FMLQXjtugwRdidjtjR7lXREY27ZzFFKi15v
	adVT1JkMUepaDUZptultXwq07GC6UfHemKx+ThlJWox2mR3GdDDPeTvFRDW+QmAb
	78ZIvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddw9mrw5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 00:49:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d68dbb77bso10182621cf.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 17:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775695795; x=1776300595; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bqEE6rmLZOuTWDnBfLI0DnPCbDUB+b65JdryhdhG+uQ=;
        b=cHV1FgJERC3h5ANAl2qhMQQ+xWS5t/m/MwH8Kem+EC+CSu91vXvZklQSa6ibfYqYnP
         Y+TgLoXIYHZMNw86+ZCiklYGOpZfKObcO6YemK7ZWd3Pc/0UYtM6w93LQ7AMua0UCwyW
         +Gg5N4kUBQM5duO0sieFI4XXOKtFnBljAFwWm6JCLo+UbZMZvtJlYhlH51nsG7t/XUVC
         OkaZk6gt7mn0CamQPO41tBeqhuKWMEQuA53Ax0Ka7jDCCJzDkcBQrEppz1FO7AiUTeQy
         SWxXfG675KR4ydf5oCRHs/W7QXcaEU7Wpfeh1Vz/EF3o0usX2Am6MQXFQC1WLY9yMSCT
         ZEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775695795; x=1776300595;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bqEE6rmLZOuTWDnBfLI0DnPCbDUB+b65JdryhdhG+uQ=;
        b=a/Qtta5UFWYZ6MnsD0tKbb8KbarA3ROK1o0YGzzkhJB+oH/5NjH6bHlqvQGdPTBcOe
         c7X+gndTE/LjYpSho+eF+19rVRlj974QvHmNlDwPynnUnCMab2G4A4WW/ZSNHV7/54bl
         5Nu/ZwX6MFmWlYHHD7xxIZpoBAvtENkXpqJ5k5qEqxFQotsbdwJVMBt+diob9Omock3l
         d7O4OILUeyaiFptlGgLnflAvinbpuzE6pJ6xJGka1zZVO8toZoFhePVrwsN9CszkEaeW
         /ruHXyxMdu+DbkjIqICdYPRBsDsLvKGYQhKkvKYH5g6JjQ68kruYOU1yJjfZ9QbZjdPb
         //Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV+RpJiGq9sxjLTPiCBdoZ62FGliQ9P4417Y8Vm0pACHqYj0N/eUZhJVpW4z8EKywYBwStqedcm8OnY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw14nf4QqeWur6LZJ3rFE+/rHldzsqnolIkGza2ASxJQWWvefro
	tVXOF2KnbCuGuJpMyeBHhBaBeejnRmqjz9vbU7V4L1Bf3Y3r4h9UPi9Dgx9r1K6j1QMeaK1QIxq
	zgTZn9wUwDVcILi65W+an0MldnbN6pHJ71TRMuMkfjRYLy4PBJAUHSr6KxrEp+nOI
X-Gm-Gg: AeBDievIISo72HKWEwtD3Gz7HGD/0qUrm1REhXaGMy94LkVzeBPTuJGPeLYwHKfwP5o
	9bbIVE3C0Q4ebOC+iaf3uaZB7cj6KBUyvIasEH/K8M4gjxh4fdrPcorEBzMCaaZD+rWlvcnFVE4
	ARTjEcfCZ0U2v2aILB6EMg/h5pALYTn2lN7AC0wPw+93twiOMY1XpW8LhUNv4/jmOTU0OyVw1M8
	qw2MW4MbW2N71ZgNpB/Ea8zb4Gta8lg4G/3j7ApBjbYKcktvuxhxrFQQJEV+KV7DE9APEIs7lih
	bq2t6dViRQP6OfIq9bFy2tANPx8d5OQM2k0l7AKa9P7vdzHPr5+SXcc5O2NeQUmgbG5oz1VeokX
	dQmnHhAhn/DHUJ6YjWRfEFHraece9zDYnN/eaR3vKRtqNO5trSQxjehKUNuFVkzAd3cOIT6c3BH
	i/us4RdHsQa70aG+yDzIDwx4bG6OieJ+hDpGc=
X-Received: by 2002:a05:622a:11c4:b0:50b:4946:2776 with SMTP id d75a77b69052e-50d62bb43c2mr334343511cf.22.1775695795216;
        Wed, 08 Apr 2026 17:49:55 -0700 (PDT)
X-Received: by 2002:a05:622a:11c4:b0:50b:4946:2776 with SMTP id d75a77b69052e-50d62bb43c2mr334342991cf.22.1775695794781;
        Wed, 08 Apr 2026 17:49:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd34f0sm5150705e87.76.2026.04.08.17.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 17:49:53 -0700 (PDT)
Date: Thu, 9 Apr 2026 03:49:50 +0300
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
Subject: Re: [PATCH 14/19] drm/panel: jadard-jd9365da-h3: support Waveshare
 DSI panels
Message-ID: <z3obsnbmdvvlzs3cxm57osbax4ivg2zq2zk6xgp37n4hni7y6i@smwn362nhn6a>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-14-5e9119b5a014@oss.qualcomm.com>
 <CAD++jL=jUd4sQ1bhwcBRYpFFApP6vdJw2BoQwxoWShUKdEb9oA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=jUd4sQ1bhwcBRYpFFApP6vdJw2BoQwxoWShUKdEb9oA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=69d6f7b4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=EEnmvuoukryqth22VUsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: tq5BEVctS1J09coc8wDYESL_YavM7Ny6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAwNCBTYWx0ZWRfXwccXAjGgMu1y
 fsYPuCu0Z+NM8pU20Hdbl5yfogk+ejcLTOXQMU6OnWnsltxcyyNGJpxA/ljobrEMtuaxT5S4xpx
 MNGUXBv5hpBKE2fCz7bbztgjjHRYfwtZhu6rPM//iphOPKJbFEs+yY/Lu4dqnOmLco8egvjoOJX
 w0+e141txz8vTfJpGnF6aBBQfH6SlqmVPIUMcSpKMVKu6s6iI+xkt/YgcBWbxO25Y6cIt2Ae33g
 FPD5RRt2czuTZ0qnrYfmngPXQnzSrJG5shQPcFyHFXoBk5uBeVzzabkLTL/WjY5QcB4K2AugxwJ
 KgW3HdFLNoLibpGDusqDwI5PsoHaJFo5vHQ/b+1ptWEE2Bt48R7iL2/BfRCHLgdwBOv+Yz3HXED
 pDGM3L6Ovrm0RkgxE9TCfXRKNA6fMMjIXDBbM/GR27dgGzWMzkakU+Qbv1MwF2WyynUxdue7zOK
 tg78No+eHlVQsuhpFGg==
X-Proofpoint-GUID: tq5BEVctS1J09coc8wDYESL_YavM7Ny6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090004

On Wed, Apr 08, 2026 at 10:24:17AM +0200, Linus Walleij wrote:
> Hi Dmitry,
> 
> thanks for your patch!
> 
> On Wed, Apr 1, 2026 at 9:27 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > Add configuration for Waveshare DSI panels using JD9365 controller.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Some more words with details on all the panels added perhaps?

:D

> 
> > -       desc = of_device_get_match_data(dev);
> > +       jd9365da_switch_page(&dsi_ctx, 0x01);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x41);
> 
> Predictably I'm not very happy with all the unexplained magic and nonestisting
> defines used here. Do you have some info/defines?

No, unfortunately.

> 
> But there is also one more thing, this looks like a big "jam table"
> with just register+value tuples, so construct something like:
> 
> struct jadard_jam_tbl_entry {
>         u8 reg;
>         u8 val;
> };
> 
> static const struct jadard_jam_tbl_entry jd_3_4_c_init_jam[] = {
>         {0x00, 0x00}, {0x01, 0x41}, ...};
> 
> (Ideas taken from drivers/net/dsa/realtek/rtl8366rb.c, take a look
> for code and all, you get the picture.)

Few months ago the code was moved exactly in the opposite direction. We
added all _multi() functions and made shure that the code is as
efficient as the register tables. On the other hand, having it as a code
allows better control. E.g. handling 2/4 lane case would require extra
hacks to the register tables, while the code handles that without extra
hacks and without loosing effectiveness.

> 
> Yours,
> Linus Walleij

-- 
With best wishes
Dmitry
