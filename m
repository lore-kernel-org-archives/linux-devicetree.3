Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400662;
	b=zwm515vXKS6FoTllUuccukNmj1A8Tj/XCaoLOcsIOmCIkvJfdE5zjjxNkX+Zmg4A8svv
	 AuwvGUhw5u0RMRk68pvcPnrCkFBorHx3b8UFWLgI9n19wm5UuY3ed0as0DNoL6uyYPnzf
	 bzoWrxVnhLuS9J2IOMI7S+VkJb2rMna1mEhUfn0acJK6UIU2jJxNWSTiGx3Ho7w2Xq9IK
	 OaoAjMerMQ62VnOoBIyLSHa74AKiZDVg1Aws2PowUyaufSwufJ3PIZEKfoTuGpd1945AV
	 FK1at8dhjgkJLXZ+sak4cXS0nrBY3t9cTgP5oW1KrTQOJpbDcKrsqJroAJHOOb/p5/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j7Eov7QCrd5XGLBKc9xY69NQW70wVEQfOB1xyPudY0M=;
	b=dgTXawcRjntf1TRUoie4aumR+3joydU+LyfTEHXXLsqxQEKV0HQHsp/53zotAaaIXiSZ
	 BaLNDo/T+KW9DlW23hKrtBlU0OJZGQbUrszbS5uzisZDcd1Yuc9q+WYoGiyvZ+wc1G3jf
	 8GRAFUPK2XFN51n8bUcDwd/EPcCf7kePYYRbfVdMnEXTPpa4qzK2Y0YHRpPKYqthi4p1k
	 G71Ab54MruppIGCMwAFQiTNpiUskyWVryJGv69TKRWbqaE9Tmv2QWcf8VKY2vANX+aaHY
	 lSv/8mSrf1ICV10U+8a0C4FuvUf1LiLfOb9XuOKeR20cVv2MY5WL19AmRd8mhD5V56Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFHZ8li5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TsTa0C/B";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633A7606A326
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 633A7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFHZ8li5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TsTa0C/B
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZMjO708112
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7Eov7QCrd5XGLBKc9xY69NQ
	W70wVEQfOB1xyPudY0M=; b=YFHZ8li5L4X9140/AZUrRCb8X38ZctH0/QEhSMvb
	7ODW3rWz/hQ/Km2Q4gsTNJ7uW09FggFfhpmYZiOP74/jEgDG7+sbYk9Ryp8CleEj
	O4hehlMqkEs8irOFwd8egTprRksuaWKMIA0T3Cf4x1izcl4zpPPaDKhauHG2lxbu
	opDD9nQtEIHel1L5PsM92NBt+Fitt/2aZ5msIfevKiZoUFVbOvRZL8WSzz2HQgTY
	4+qgE+TTY1ESp1wwL8qAF6L+GverVjB8WBxTZJyZvog5u4fgvfxdJSqBVfdOs5Vw
	eTzBwhzaHrWyg2w6Xpq08VyEDHRT52LXsjOPipJ20KKRDg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33hba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:37:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ea0c20af3so59769756d6.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400660; x=1795005460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7Eov7QCrd5XGLBKc9xY69NQW70wVEQfOB1xyPudY0M=;
        b=TsTa0C/BgDZvFvGW2TSP0xoIKSR4h6Wbt1D9hhkDhKA+2ugwkGeANRjdnJS0iIUlkN
         rpMEra6CgfGkVMW35lQxsspZJVQusaQ1bcy2lJbGhJEu8NoqYRKATi3nnPeATbO88BLG
         OtRS0AflCelqUlvs7UqyxSGpwhbYCUemYWIHhk9l6kIqmJEheFcqxKsO8I13uAC5Zxht
         SPv/bRAi98UKC+54AbGFZkcx8Xq5XkjsSF4PlTXevRe7SH/bb6sQyqBUnewQsImI6A6w
         69BWgQgxoz60EvS6+1+kq9+HM16RXLEEBhLxxA3MJSeXtQvRizk43hCI+q0R5igx9ZHX
         29eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400660; x=1795005460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7Eov7QCrd5XGLBKc9xY69NQW70wVEQfOB1xyPudY0M=;
        b=pOsvRiXHnwMBeV767H8BXparx6Rav3+2KmkYqQZcuEMh/hQoeveWzqx616dXpxdNR9
         GXQMzXznxSmD4/OVc83DAbBKvD6Nyml1u+G+xPY05vNbEutBMkx2K/nRusMyp513QwDK
         aPS7276a3cUH8p6r8mQEdTqp6oiassBNPV6UsCVSehfLNux//npBkFPBc4jdXmE0SIS6
         TjMC8hyJ2Dc42QNJQ8yTv3a/0NQpmq2nChV+b7rzEaRwcG/m2KYhF6PxSPi564gPoFPu
         DYcODF+v0JR1SxnOZG6t5vd0WTWjlg/Q5M20urDK5AVDefjamxsW+HRop7jgtDwqhnfp
         TQPQ==
X-Forwarded-Encrypted: i=1; AL+hErEwUAFtvmjRMgSgse4n6Z/R3S8aBJCRPMq8Jvj/pHIg69MkGokWNP5GlB6Z5ojwDEpc6XDhfN/YRDSR@vger.kernel.org
X-Gm-Message-State: APuU4Z+EGD+hX9z3cmncCocyb9JfiWqe1+zAS7usFVaY0mH2MjsdH1OR
	dv8TzhSJQm+LHuMgZEGIn5EpEoh6akhI3DTlUSfnmxU9mM/wPop5/yJ3Ry8CY89n0+O0fwpzqnv
	nhh3AQ/YhKVdHOYwykDuBPERA9tJqzH9UCLFaj/Q5bHF2TSKFKu+3ySmemYokzPUO
X-Gm-Gg: AYBFou1BVZ28ikwSamHxPyXFqwXU/4SVZNOrCYrM3vA38ZeRz2GQ+a5Gn0HCgVaQYsn
	LJz+0hw7JN31+8e7vrUt114/AmZGXD5170QR4e1NMnB7U/DcPSzxv4Lzs4wubGBImaXzXebqGno
	h+WwXIfRHtoO4vi0D76UG20ENF9Ph2QJ3wxeo2oOi6mdLOt4jhtYaTeE3sc/qlG42yyX8TSQV50
	fIYfg+QvPtnA7pa3Y4GReRg5NScGR1mH4hUidV8XtOMQq1aITw3tIQTmutzm7yiCZ5l4XiOiqyj
	XkWZyJX58HD7pcqu7T7cf+VU4WE8ONsOIxC8FOgE3WfgliLuo3GvIK7k9Mp0Oh/F7dSobZJBjL9
	ftLG3uvOB641E0YDCdt7KSJwL3PbUtnh3Z9+mm5gwglVe3ZvCd9Pt3F4SHZmR0fb3HlqueBtRrf
	yfN7dPng/ogFWbgJ8kXeJ+SCXzdME4y2aoKDNZ54EipEm5YuM8bPZzVmDFR5ixvA==
X-Received: by 2002:a05:6214:20eb:b0:91c:63a1:1432 with SMTP id 6a1803df08f44-91f03e0068dmr39814966d6.6.1794400659393;
        Wed, 11 Nov 2026 04:37:39 -0800 (PST)
X-Received: by 2002:a05:6214:20eb:b0:91c:63a1:1432 with SMTP id 6a1803df08f44-91f03e0068dmr39814136d6.6.1794400658706;
        Wed, 11 Nov 2026 04:37:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0928bd0asm10461021fa.36.2026.11.11.04.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:37:37 -0800 (PST)
Date: Wed, 11 Nov 2026 14:37:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Jens Reidel <adrian@travitia.xyz>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Alexander Baransky <sanyapilot496@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Romain TISSERAND <romain.tisserand@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
Message-ID: <oubzclitudtqiv64wvg5lvxvbhuffxmc5bgbsdz4ou24pfhbb4@decarhvjzl2a>
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avRM_GhtR8vMdTO4@houat>
 <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
 <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af46194 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=1dMmzAFpFYDdDQwHOzYA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX7kQ9C6FMSQjk
 a+2x/kN2yEgQUFuHZxBoihzX0n60nhEpyhOjC4SB0tmt5OPtRLZYLc1DM1s587wcfIAPLZKpiuf
 CsUQc06yBjMP0OzsKv4nLNSKJdc5enXAN6wz2xy3+JZv5li91jG0O/aS3dXEOugXkAzoMVmRIcR
 RsP7AvYY3ZjjW0uPjMhVKFa8W7lj0/vwLlb2kh6C5qWf6KB4BV0Zyui2Wt35m25amlTL/8z+9TY
 AyyUzhLfsthDPuePNmJPiBKchRGQV17VjU/00uodS20t6RFy4Q4fKiW1pegpPnlsH+yF5xuTpq6
 MImAzpldeMOkI0dpStLbK62vpOtEsbRbzeg236qqiipm7P2kiBEYiUq84wly15GEFK9T6S89wQp
 raFhtlmBrUkJihsWc7jhO6a+Ulcv+WKHgl80FppmiKa6M0pqBl/60E4LempkSkvZ4mS3EHt2enT
 jqW/Pdnyo+4Esmugrew==
X-Proofpoint-GUID: ARMzZt-asrAZ83foaGiZlrfJDOlLa3cV
X-Proofpoint-ORIG-GUID: ARMzZt-asrAZ83foaGiZlrfJDOlLa3cV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX61IBTBcEY9Nj
 D3dkgA/I7BOM+xhjxWl5a7qoiDc2dc3eS+REwgQY2yM3MHYnc5AiURVPoCjHGnjMXehf191/A2h
 44f+EfLk7w/RrsTTRelFx/BQFx2bpSE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

On Wed, Nov 11, 2026 at 01:31:39PM +0100, Krzysztof Kozlowski wrote:
> On 11/11/2026 13:30, Krzysztof Kozlowski wrote:
> > On 11/11/2026 12:13, Maxime Ripard wrote:
> >> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
> >>> DSI panels can be placed under DSI bus directly and many Linux DRM
> >>> drivers will work fine with it: mipi_dsi_host_register() adds device for
> >>> such panel and DRM driver does not use OF graph to configure lanes.
> >>
> >> That's not true. We do use the endpoints to configure the lanes through
> >> the data-lanes property. See drm_of_get_data_lanes*
> > 
> > Some drivers use endpoints, some not. As discussed on other thread,
> > there are more than which do not.
> 
> "there are more than one which do not."

Which means that those should be fixed. We have legacy cases where the
drivers assumed that, but we should not target legacy.

> 
> > 
> >>
> >>> The affected here Linux panel drivers do not use OF graph, either.
> >>>
> >>> Requiring graph port for such panels is tying the binding to one
> >>> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
> >>> requires the port.  The port is not needed for the hardware to operate
> >>> and for some of the Linux drivers, so it should be optional.
> >>>
> >>> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>
> >> DSI busses can handle multiple devices, and multiple data types. If we
> >> were to drop the port node, how does the upstream video device know
> >> which device it should send its video output to?
> >>
> > 
> > We do not drop the port node, who suggested that?
> > 
> > You do get, that we are not talking about the DSI host, but the panel?

The panel might be driven by the host directly or there can be other
chips on the bus (someboby has been asking about the retimer or
something else sitting on the DSI bus between the host and the panel).

-- 
With best wishes
Dmitry
