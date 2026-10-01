Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8664A37B032
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 00:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790815418; cv=none; b=rCY1c03K3QrvLLS2e08Y4pZjrYvzI9Iup8umVJI5cwtq4NssgI7rGDCcM4edIS+r7y8kQ8F1fj4tOdX90CtMSdOipJSmeCr4It90MAYAqhZOhdCGZonrPwn++y2qayM30cbwnyF7q1r0VXrhiaO24TbLyQ3q4kTrrytSlLiI7K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790815418; c=relaxed/simple;
	bh=cyLUkHDw0rOteiZ0d9G56/3XyJ40Ceebpxn64MLmNd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJQkTZ4pjJ7QhVuBhyHuW/vQ/+mkVZBWdTlmE6Cia4ecpTNgvH49u3U7vqLW+gXuOoFKDTlt/qGgyjb3IiCZ/A9oMdkQMRgOj+/ewYkCA+c4Yjk4G4aiX1Xcj317UEPKhsDBTr1CCVLHDGH7+LC/IrSgaQ2X+31nifMULsPP+mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtKAsRXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FV4EBIIb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtKAsRXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FV4EBIIb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHf6xG1110137
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 00:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/YjcEN7BDbe1iCeqE6MfpaqcpTrbhOInw48Y0omQ9g=; b=ZtKAsRXLvhfaowk1
	fl3P+MjUdwjsYT4zBYuV/SxekN9B1MluKLMDWrvZ+r6vzuC+1orOZyObIK1CDr5d
	AyKdwi8vMclA+1J50tXc6w/Oo1g2Cu1xwmLQ5RoF9pi/7br20bv4EpOPykSmK61n
	cC8JXgZtEY9W0oEcbLPq040v2kCM0YtrTl6K9ImJFAWa+xj2Ug/7cWg/fbAHYNAx
	50WjiyR/6tDT9Ee9W9HjbYiRCIDeAtu+ZrdGNh2oiTq19hjtdzqGfkHws2dSeCaK
	wtD2xrCDPHI399ocLKuBqimXyqsoLJBys3EOBM3tFlR0itWO9w3xp2o8eWf3cPFr
	IgrBRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh83rck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 00:43:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0c7126e7so1052949185a.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 17:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790815412; x=1791420212; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/YjcEN7BDbe1iCeqE6MfpaqcpTrbhOInw48Y0omQ9g=;
        b=FV4EBIIbmEvwe/l1iZYqqzd18kK1xVImnmFot0HsWihyiAWZW3q2JWF/FvI80E47Nj
         J8fhtNdi1zzW8PQRv9GBLZkhOJxHuWtrLTMOdvvRWEga7rlLzaLoPrXDKnBXSV/UAv2q
         HyyFUGI/3mxIWrE5CuqVwjd5U9eN3fh3b2cggc427jOxQmsr28+b6ZAGVbJqhe+cgk27
         H1g4/nKBDP2pb7TTLdhd+gQZnk650W9Zd4LGaomkM7cZpyiVRa52N0Db1M572/OfTvVC
         D/ejzxW865hk+eJlO3GsPfW2tZ5thJ7UPx8fKWHADHP3PQAPPyd/gSG7M0G6pZf9qB9x
         vLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790815412; x=1791420212;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6/YjcEN7BDbe1iCeqE6MfpaqcpTrbhOInw48Y0omQ9g=;
        b=CuGAqYkyzVgl4PyAUnpZVYclqk602f0nbaRxV76SePN1dFvUyLQcX5wilWiqRrxtzT
         WlepzmypjGDydQDwBxO6TGF9vInha+tw87DNAVGJTjxJhPORZ/E2LQYIbt5tJPDmHXte
         Fgn/0nW1+AlkCfReSoraAfj3F7U+KNDp2SfWuHDzRoiqErilt09yRoT7Fbkk+D3Bj5Fg
         ar9BDnptVSDybfcJvkgbCUYcPy5e0FxUxI8KaR0vWItp6fKadJsER+QTe2yIXbs0z4GC
         4aaQDSaq+hFvrw5a4iIi4o9UUWsT+VpyVxlHvNX6R3sGlM7TKmYyZ6eptU+76acTocAw
         LABw==
X-Forwarded-Encrypted: i=1; AKwUvBz+849gsjZEM1DLGgU3NyqcaE17ucEdGF0RM1+i3h4XwtneedC7oHZt+ThE03jxpbLPnG3QVc/IAT4N@vger.kernel.org
X-Gm-Message-State: AFuF++lr9BvPrw7BN/93h+HBjiHgojQaOj0g6juTbF+7qD/mDWu+KUsL
	7zIaT42YmnMGCdTG7B8XOb8/Z739eXRT/6giBRiXMqovo9u7KJBhqJf0w+t+yLq2d90NEyzknoY
	AddHEVqzl63WCH/GlT1uLqEH0csCuhuB55oVFrN3HhD06fgDsjh83gDrX/9gu+PkG
X-Gm-Gg: AYBFou3ZEsU/xrMs6wxNuRxB4y6IPCZvc46oxM++Crn48h1CSYR2rTCzy4hyCLNP8xW
	yYodYR0LyGTbbJ+9SirTTcAUYSVPDvwrmonqj5XscpCahVdlBAVbC1qKnGfgjuA/qbhN2BaZreZ
	ZRCLY8PCRCp5+tgX0DpPzTBKBFp1uCSA6I+5Vk+ajaMdSAxGjdphtaPnM8HyHp7sLRffl0YeCsK
	tWFFsn5dhafao9ftET8kcLeLI3DDXHOqZPsimqoHS/3Jd/IwLR0j4ZFMdUgA6hEYDzVZF9Ykbl8
	cfkIsPQjG479gwyNFFb7b9KSzjDSHkqZ6gHZYzOVDnz5X7GSEzh2tXTHYFSmLWnN+AK+D2e/1tR
	I8A8FRcxvlu4KHkDwzpouBmSkXBGQUZCCQZVWJtGlQ6EcK9FyqVPUD2wRodd/Vq8NyV+xSMKAFs
	pCAk3mcdibMMTQ
X-Received: by 2002:a05:620a:8906:b0:939:de6c:cb45 with SMTP id af79cd13be357-93ca980e5ccmr626387685a.47.1790815411551;
        Wed, 30 Sep 2026 17:43:31 -0700 (PDT)
X-Received: by 2002:a05:620a:8906:b0:939:de6c:cb45 with SMTP id af79cd13be357-93ca980e5ccmr626381885a.47.1790815410920;
        Wed, 30 Sep 2026 17:43:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbf047sm332884e87.76.2026.09.30.17.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:43:29 -0700 (PDT)
Date: Thu, 1 Oct 2026 03:43:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Jun Nie <jun.nie@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel
 support
Message-ID: <d3xs3kzc2wg5lkouaemdicrbtsoquff6bvmnlmuxwh4kspfs2d@b77l43axr6a4>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll>
 <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org>
 <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
 <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
 <2lcpzwh7fxecpffnakpnp5lecrm3e6u64ztat7cd75nuxofxa2@clj27bzgjy3r>
 <4d053234-06d8-4268-b60a-2fccc78da654@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d053234-06d8-4268-b60a-2fccc78da654@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwMSBTYWx0ZWRfXw358BYQSbFUF
 HNLeTLB913U2DsgRlogH9as5nvuQk5bZdyUjOEb4FKGRbV3zQKJbwTKXKd8B1M5GECzENkHd9a3
 dhsePM3npDHjdc3ljD8YPHrUrRu/1Jjvn1bT7rE27iHb6uUeKDUSEgTNXyIG9DXxb474/iE8VMP
 MK4noITB0VVjf48QI3GXJDxqBM9cJco7Tx9tjvZswM/jyiLSdFjjtKyLNzezJs2OnkQB/f/k2wU
 Do0RkN7QrSQGvK4XRqxMbYImVzk3EG/fjCJlaAoWVjLOJUXf/oaneK7oDogoAr8iDF/3hRpYSJs
 Xa/SV1d9fs842/jGw0Ms6hQ6aCcbxEp/rKqYT1FW5LNPjqs+L9elDpa+25fdHZ8nVyutOddBhMc
 SjnXgXzUv5xYVCuh2FDmGba6WTiJ2/tp2jFYlonpY+dXRLw2Vs1nGlzz+L4SXTvefvz7a0ko1+f
 ChXOWTellVUUEBST+nQ==
X-Proofpoint-ORIG-GUID: _bxJNWhNSW0pVgm_aWmg4MPQ-yLDWipM
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abdacb4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=vnREMb7VAAAA:8
 a=VwQbUJbxAAAA:8 a=T0OYp5YwtksmxRz7AhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _bxJNWhNSW0pVgm_aWmg4MPQ-yLDWipM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwMSBTYWx0ZWRfX2G4RQV9f5IvV
 DKcu9bcxieT2eFCrBvzFSPbYlDRC99BN1bxyeyEeVlfuJgrwamr6Q8ga2hB6rBSXXZvr36evNsV
 vUVMkH9EFqvVLX/1O+vyT65ESVed2nA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010001

On Wed, Sep 30, 2026 at 09:18:55PM +0200, Neil Armstrong wrote:
> On 9/30/26 21:04, Dmitry Baryshkov wrote:
> > On Wed, Sep 30, 2026 at 06:43:47PM +0200, Neil Armstrong wrote:
> > > On 9/30/26 09:44, Linus Walleij wrote:
> > > > On Tue, Sep 29, 2026 at 3:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > 
> > > > > This entire binding seems like stitching two devices together, which
> > > > > might be fine (I don't even remember this stuff... two months old) or
> > > > > might be artificial grouping of separate devices.
> > > > 
> > > > I think that's a good point and fair pushback.
> > > > 
> > > > Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
> > > > https://www.youtube.com/watch?v=6tNGW8PoSzw
> > > > 
> > > > The current binding does not reflect the physical topology of the
> > > > actual device, and the bindings need improvements. I have a feeling
> > > > there is one display controller with two physical panels.
> > > 
> > > No there's really 2 controller and 2 separate panels, but they are not
> > > classic panel, they are a pair of panels+lens which are in front of
> > > the eyes which forms a single "image" for the brain, so they are
> > > technically a single display and requires to be hard synchronized.
> > 
> > Yes. However this approach makes it impossible to share the code between
> > the double-panel drivers and single-panel drivers. I think, that the
> > panel driver should still reference a single glass+DDIC, while letting
> > the DSI host driver to handle the bifurcation.
> 
> Yes, and no, it must really be considered as a "single panel driven by 2 identical controllers",
> and even this is really purely software implementation issue.

[...]


> > > Describing both panels into separate nodes would only be possible
> > > if we described a "VR display complex" nodes linked to both panels
> > > but this would probably be solved by actually describing the "display"
> > > linked to a DDIC controller and is out of subject for this serie,
> > > and can be added later when we properly define things.
> > 
> > I like the VR complex idea. In the end, you have two modes which you
> > most likely might want to support:
> > - L+R, having double-width CRTC scanning over a double-width framebuffer
> > - Mx2, having a single-width CRTC and a single-width framebuffer
> >    displaying the same picture to both eyes. I can imaging that knowing
> >    about L+R might be an explicit opt-in feature of the DRM interface.
> > 
> 
> This makes no sense to support both modes, and this will never be used,
> and anyway this is purely software implementation.
> 
> We're defining bindings here, describing the real reality, not hypothetical
> situation that will never happen.

Let's ignore software issues. On the hardware side, you have two
distinct DSI panels, each having its own set of controls, own DSI link
and own backlight control. 

-- 
With best wishes
Dmitry
