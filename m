Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF5E40F8F8
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231993; cv=none; b=mXpehr81jFjXd8dwIjEbi+3KFtJoplMJoM3JsyVnQjGQyqY3ObQ4nPNps4tbHKjZ6BRivwAP0u5z5HJrnSSUF5hQ1rwMYcglemqYtUxbPHOHi1BFRCXSIVlKF4E6K1s1tHYtteIPGesr01YrOkudmlUl+tvwl2HpHvz7R/KkEwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231993; c=relaxed/simple;
	bh=6uZKgjBvBjK3cpzd0tBApliTV9pYSCq8TtHAoji1CVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkuIpH3yD6B2kgI68NLVX+hC4Z6iOUnD1j+jEBXmQnadDXjzDLZDUU8G2uxg7SGP2i/zHPsoWsWdNkYF8s7g7P2sfM2OBtkVxxNP06c/7qA4D7twp776otGFE5MCsaXR97EuuCPjg8QEnkOmrke7xGEdFjE+cciyl72d8oh6Tl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGBJ0wLC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLMWPtY6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGBJ0wLC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLMWPtY6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82DMh2480113
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	su9taqsUBmJfG0aVGq0+6MjA0mnYfyHXK4TkmUilqdQ=; b=CGBJ0wLCP2LyyDQn
	xpeVSOKMEnPLG4Tc0N26aasAunVTmVlopOCUKZtsZghn1CLBBDz9CHs40uFU3wHV
	2UYWNe/VQwLnBp1eehmSKd6naEQ5L+k+q437jlrgjwu7IHAhhF3BuCXY1po/Er8X
	Ba50k6UX8P5U7W7MJW+OUugB1+AFxC/K3Lv+xVey958I9s6lUsuZj+05eVI+BC5o
	RFE/5GGV/BUvn30TTfP3FMHC5y7HeDNk7RtMbjiCamvA1V3GjO4HrDz6qlT1JHR1
	+PjjFsRqceO2KyvcabhP/b+pjTgvB9z1A8jcTCW/244iWlg87+qDPTGMZ6hytBTP
	q8ifCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy11a12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:46:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so33607671cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231990; x=1785836790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=su9taqsUBmJfG0aVGq0+6MjA0mnYfyHXK4TkmUilqdQ=;
        b=WLMWPtY62yK/rgKDS9ibjCj8pECLSb5x1cf/39Oq78Q8zzCTaLMiIAXvwren2y20W8
         pM6AVETFNVgSDDaDHpSYd5ZQLid9n7VK1rjVPuIKiTiMCwBot3sdHfKNca6V2n5+WP+q
         r7sg/aMh8CnrcRMNsNma/FfuMWP2u29rraHLz3xKkftDqAsiqS1LfOXwTH9HPjXGqaPF
         Kvn/71T59jj/eJS3Lw1f48pU3I6SrFvsVajP+ytGbYSkexA9yPXaPUJft+iuNzvs9LWk
         EU06dW9xEqJprrAZiSFpDfa2mhae0foH6NxY0SW+KBMxSPaCeKgtKuwXMNcfQpzt7ssr
         gL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231990; x=1785836790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=su9taqsUBmJfG0aVGq0+6MjA0mnYfyHXK4TkmUilqdQ=;
        b=KZ1nmj4rIz1GVkMEtN1R3YOeJix+c24x6ltW09Gp5dQlRfhFZsjZcdcCowPdgOpSZE
         obflfOXTHWyZBf7TQpzLfN1EGciGrwgJxZXtmukKzwng32/HqtG3YTlYHE40jE1/QRwx
         hfMNdQVtpXRP1g+vtGh/pJnvjCrKmL4jA3XFWAnBAFo2GKu5t4TK79Csd8jEuVz22Xdi
         +8qUfqznelZdIGyaO0eZ2T67d+7KnUrT21mhEsWdDas5GkVybB7EYtWlPjCkaY2pL5VE
         Q9U5LIcAjB3FKd8qGdHJYu1zxWAG3iQRZqZTf3zRGyr2hK6dJd4wFTd3HL/yTThG80uC
         3qkA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3XY/X4pZfWyCDdjRzpuaAlS+auU12qXTW/ctRHrzyWzGgueNkz2UT+Rmjm+DGsaP9Kd53K4jOQYUU@vger.kernel.org
X-Gm-Message-State: AOJu0YwKjE7GO7NE/QYUsSETcIGlt+jAnw7dvsTTX6K3DNoFqoYkQG9y
	p83JdJgwkoE4fRaJcZTzqYlxuGy/PDBk1sVoUUQBQo0WT9Gd+i5SvU0ahC0KIQv9VJJOPXbl5rf
	zW7UxoOxQn4os/WUChx/MQFLbrSPARbj11+R+yF+Wiqzsu6VpKvzrTZ0AEiqFV3iF
X-Gm-Gg: AR+sD10wC81c8qBZf0HLKJ1AxWqXmejYcwnweN+mhcGV6/o26IxUEAaxNDGp0Exwgqs
	SZf/5HiGjpuSuAPwwTILiKn6FZae/4una1+wCZyI8Akngc6dy3CH4CxSV1Dam0Z2dSHvNgdahTh
	/N20ecao9Tak8GcszHzXQNmH4uV5gYb5WheS/iA+qv3U/4jIhYR/U0jV4qMv/gSVlLQRd4Dzk2x
	vXTZvF3z/a71LFGRKRZDrQHrk2th6f+phHPNFmeyvk0wbs9phLAopfq6rKdqhBmX6iJxCa8hYBG
	E5c8icsxKD6DX74wsLsfNAapZk44XzcKHeJhevTG0eXglGsLQBv0TNNNExQ6gQlqARqa9D6Im6L
	CdrLp/UADMF1SNdKI80K5DRJYNNEkBTwFvSQ9YhrbIkNUg3AtVxMud3PJjPiADOX/Rlr7CnlcZI
	vREkIkxAsSvDaD6g==
X-Received: by 2002:ac8:7f51:0:b0:51c:ba4:d837 with SMTP id d75a77b69052e-529d6faf3eemr12028121cf.18.1785231990288;
        Tue, 28 Jul 2026 02:46:30 -0700 (PDT)
X-Received: by 2002:ac8:7f51:0:b0:51c:ba4:d837 with SMTP id d75a77b69052e-529d6faf3eemr12027861cf.18.1785231989834;
        Tue, 28 Jul 2026 02:46:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1d8514sm1905891e87.42.2026.07.28.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:46:28 -0700 (PDT)
Date: Tue, 28 Jul 2026 12:46:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sunyun Yang <syyang@lontium.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com,
        xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com,
        qdchen@lontium.com, llzhang@lontium.com, hfxia@lontium.com
Subject: Re: [PATCH v17 0/2] Add Lontium LT7911EXC eDP to MIPI DSI bridge
Message-ID: <waw7uhdebjavtcdgcgvrdhos3vcervc3b6ggooj2zgkd6yq47v@kkzdagga6hoj>
References: <20260715015438.2770155-1-syyang@lontium.com>
 <tfkg2cjn4uznzy57rpkqwan26sduqzptnb7uwsucfboz37wz7k@rukuu36mozif>
 <CAFQXuNazLnXOr+qRug4De8W3U932aG9LVRVWgkHAE=ALSQ+ZGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNazLnXOr+qRug4De8W3U932aG9LVRVWgkHAE=ALSQ+ZGA@mail.gmail.com>
X-Proofpoint-GUID: CJStukk4Agg0FYpttMm0T5WfYkI6X5zJ
X-Proofpoint-ORIG-GUID: CJStukk4Agg0FYpttMm0T5WfYkI6X5zJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NSBTYWx0ZWRfX5qp5CuwZiLs4
 eFpkK9gDzC/R5j5j79bhI8Bd0MSH7lbb08sQEZUajq55j5+gAfOQN5+orPfdhxOJyNGysxHGglK
 bn98pB/X+BTbP+HPuYFu7Fei+LhK3w4uTrTY1NHVGwHoNe211GXj6rroKi81itejPRrPuUbEWM5
 CWyDtyv/mJEctJk0ZeFy46yVsiLp50tzO9U8YBd2AEw5Uk8bIN7Y0vnF/58tbBDuqODuEh+COcW
 jjPb3+OA6VTdzNofkxFalQTUv2idvHwIT/oSeZIbKaknxXcs+YDqX+0qPkkwsIOOUv016jXnd83
 4jjknYEUhzNT+DLbm+IgEmom+7/cdt7AaO+xUWoWXt4iNJGL1bbtSmPIO2YJ67UHpni+SSiBNGD
 Hjl6UrH1cc0bRgAdAu2+SeYZTwBeGZ4rMi6pblntxhwBuKhoWthXpetSfRp9rr3exd+oNAmbXnP
 JFjeMonI0vUr7v67xnQ==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a687a77 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Kz8-B0t5AAAA:8 a=xH18JlJX9u6X0IBL-vEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NSBTYWx0ZWRfX+6s6USaRsFAM
 noqJiPWyicb44L9JbzjxMvDxBCifnnQNlBZItjkP1kZkuq9B/43QKmKmDFu+og9qJrcc/pvwqoV
 /JB1Kt8llYFQfHbHmJKliWCVwOMYifs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280085

On Tue, Jul 28, 2026 at 09:56:11AM +0800, Sunyun Yang wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年7月28日周二 09:22写道：
> >
> > On Wed, Jul 15, 2026 at 09:54:36AM +0800, syyang@lontium.com wrote:
> > > From: Sunyun Yang <syyang@lontium.com>
> > >
> > > The LT7911EXC is an I2C-controlled bridge that receives eDP1.4
> > > and output mipi dsi. This series introduces:
> > >
> > > - A device tree binding YAML file describing the hardware
> > > - A new DRM bridge driver implementing the basic functionality
> > >
> > > Signed-off-by: Sunyun Yang<syyang@lontium.com>
> > > ---
> > > Change in v17:
> > > - dt-binding:
> > > - drm/bridge:
> > >  1. [High] devm leak and list corruption on panel rebind                                                  [sashiko-bot]
> > >            False positive. The -EBUSY guard at the top of host_attach() (line 527) rejects re-attach
> > >            when output_bridge is already set, so neither devm_drm_of_get_bridge() nor drm_bridge_add()
> > >            is reached on panel rebind.
> >
> > This is not a changelog. Don't mix replies, with the changes in the
> > patches.
> >
> In the driver code, when I reply to the issues raised by the AI bot,
> the AI bot does not respond to me.
> In subsequent submissions, can I simply not reply to the AI bot's
> questions and only modify the issues that are useful for the driver?

AI is a _bot_. Talk to people. You should reply to the bot directly as
that's what the reviewers will see and consider.


-- 
With best wishes
Dmitry
