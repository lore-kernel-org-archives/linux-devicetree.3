Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E37F40B6D4
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 19:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797403; cv=none; b=Fx3HffZhxcAmCADtFHihTT1pCeDbsNLLo4nVRvQCLonEO0JS2JWBmX7MxJTnZjiGQNR3oUAEAiLzzPKwoPEIn8+o0H4Jfy+rTv3THyc0PDOy4Y9JxAhYtQInZILe6DgU2t/UTA8Ts7FwTCc3I+uUUh+SQ1LGWpNWWN2T1SaBCJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797403; c=relaxed/simple;
	bh=2dC9A9LB/DC0XhjvaBbr6vG0m60dUwffQrb9zaIDjwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/G/4PL5/IqBLW6IV9KWsc8jplW7mUFC0VCHCj7uKeEiArQfMHwlfI5ySnAP73HNSaTZ9J1OQ4dcPjywqSkR5Cdgw3Oyi4bqrXGyy2+I7HJVpgrRRTYKPRuzoUt3K13KYILI9dtgikxVZHNfpKEPhfd7eT6Hj1mAyUmheii9FU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHZLvR+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qktn4+59; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHZLvR+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qktn4+59"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHedFr1198560
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 19:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	007PSKl5xLWMYdPRP2bDBtZ6gH/PmdJJeMhutR+eJOA=; b=MHZLvR+lJBkqEsIZ
	Zs/mnDoPFEP6EiqWdJtGzMF52HeZLRW2KXrPLQciTRjzKqomyUnMry4XKgbuVqWX
	eMK6bPuEYd+NOqe0CYLjR7rokFmy5StvslTdRKpoU0Bgs+2R+P1k+nKbuFkYbrxM
	bl9YZ3PIOZYVmFHOFvE0lAF75gqDOTh/mxpNb/lyf1KvtqT0F2UkTYUfC+cGaW0x
	Sau5pNyCk7VuPEJ4rZode64wBcZg8mNu96+Z+JHAKXM3/a0Tu3jDKf+02a01avL3
	J6Ab2+O/9cwgCe4/i8TURpLAtFv82pCcmSedUAZxrcdTsxUmBVQrUhfvQHTIwp+B
	ILN4nQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136thq20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 19:43:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso1057887285a.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790797399; x=1791402199; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=007PSKl5xLWMYdPRP2bDBtZ6gH/PmdJJeMhutR+eJOA=;
        b=Qktn4+59NHf2UdFRg6VmXBwxaoywB8zKKcBC6bVUp8hB3LPHQwCuBY/fmtRkIiuaK9
         qsRO6MoY5LIBlI/NAV9D83HfQ1+eE5NYfaMPDB/hScBfitlXBjV5J4SmEoNn13OutZOy
         0X4TG+Agg26bWAQSLsgKtMFng21h7+R5jNZl0n/sH92pBMW9PR6Ny9vBVeyO5Squ5Upn
         ZrkSDJqWOZQM1CR51RZouFEdZWiS33Q72fxKVf1JdFj/Wt/BIRZjhLG6tC7eayoTFr0S
         XUuHko4g1QstcbQV9RKgQglmVd+A1eebXdF0tlTE0P5QJN0LUNNCcAHc562Hs4G0bbZh
         haew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797399; x=1791402199;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=007PSKl5xLWMYdPRP2bDBtZ6gH/PmdJJeMhutR+eJOA=;
        b=A97pw5Sul4vB/x0FyRuLkBfWzyb4zYAlb278y01MoI0fItNy9i5FII4KU2ohMA7NOG
         9riaVfvpHsZ7+NQ7Uj5DlR0rG7ntdpE1u9RvCArSBOZM8YuKn7s811QYSLGPPXXgmwWi
         7jDvIjyE4ozdrt09LKKyzJtTYzq64OUwypU8GCpyP+RVDYmcjwbX6OVfydn/4lweOBvf
         83vyZcNEI0AB66xL3xFcOFEsZJTsICmrJsr3kc2ClrUneqM/ssbBjaF1lOBb2zR9Q/8J
         +e0zNk5bxkVdz/ARuQm4YU1DI47GU+3aL1srcTlxybjroyN6ngiqk07umbSEJ8bneqWB
         O8yQ==
X-Forwarded-Encrypted: i=1; AKwUvBw740w1d7J0EVY2qGtm6RFKrFphCbx8aCxDDA9xzIoOA6YEzUxjYSIdD834LCxDpEQSwpnddZ1NusZo@vger.kernel.org
X-Gm-Message-State: AFuF++lkOao4r6CzBCqma9AsTMOTQeI96yOz78MvQJzNlwZDnJnpdXQI
	nNLG3ZpAJ0l9/yPlSJ+1vhSahXVo+Lr0xHSV7H5elDo2zbV4N6ZSRCSs06uofVU0QGG7AomiztY
	cHGhjEJCIjHvzACKlImLzaZgHowqebZLIIfazVvNrWR/4lJHk8RRn1deynVcy181P
X-Gm-Gg: AYBFou3u9R1e0Oqvo23GgjWyuiizObauhICSmOKNFWAFWIWBB61BkcNX/8Wzwpl8qY1
	8P2LNorCDO1jzdpap6yaKK+cwbBCCpXMwjD2M5dmr+Rdblecg96jweOEh7usn2Gds/9prR49BU1
	0ClRpcXMEM7icq0x086tPwcS6dBq7SGH11k2Lo5EFZ4xYGrpc4tESMj6gZs8mgCWKQ99kx1gFPh
	zv86dfNOefCeUiGdHKgKRfqG6q4Vpt4M1PtSlapISfRHAOiZpCPt78e5JVPmDDtblz1dhzV9VNX
	V6CjbvT/y0d89KW3e7rTB2KVyE2vIk+qEnVO2kMtyevRi8/s8qWQ5SPEG8rqX0Afa3F6erIjrkG
	6V06OCWeXwDdswPfC0bY+jpwJyBTYhZYsQoqIBJmuZSq0hov0WwV5RNEBLBCchfk8kkbesJv3dR
	eQ+cLvQV6Vw7+W
X-Received: by 2002:a05:620a:880a:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-93ca98aec8fmr429665285a.64.1790797399150;
        Wed, 30 Sep 2026 12:43:19 -0700 (PDT)
X-Received: by 2002:a05:620a:880a:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-93ca98aec8fmr429658785a.64.1790797398603;
        Wed, 30 Sep 2026 12:43:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba44059773sm18477e87.11.2026.09.30.12.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:43:17 -0700 (PDT)
Date: Wed, 30 Sep 2026 22:43:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Message-ID: <kgnrsnko7u4g6bpxudfo6yqubhd5gcyrdyovjfkohlgo63yrwn@xbgp7jgv6ns3>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
 <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
 <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX7kb/jYj1xh0I
 3Pxb86EI1ZIoSiASd70ctfsFfaCV4IHe3bE+Znoldpjzu9gildQBMLauvHGhC55OYerDMS6tQdF
 Y+7m1xJBMupSujS9lDxa1+ZAgAVR12g=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abd6658 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=gnaAZu_HdrVRTMOkdIcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HiY3YjXR8tdPIDzLAwLeDmetVNfBiE3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfXwBeMXt4vn+3r
 Eqx0S3g+Pn+S/qHS6BO45YD8uyDCFfA11F+ZyhAqFdRrMTJCEAGldEzADJN19CAnvk/NnYvssBm
 oEKQbsZEZ2DDdS5uWxvMNOTwpZGbFdWs6S44ZfsO+IMNrNW/o1NS/H1WGRG79X8LvssnjlEVhhh
 shA8U6o5E83BZD4IpnfIcZY5T+RriegijgLVbDxoNN+yq31WpxPcpUag7G5t2SEX2b3lEOr4/70
 FqE2NqelG+Cn4ZcebxS44JelA+84PIckdzTWNcsmX+17kZwwG145c+ialVkcdD8pZXVJlFsG5i1
 YNvfIhcFsC9jaeR3l+dINxoa7LomYnFlfmNOSwK9OHhS41RlAwFbnWUAzKnkxDk2r2+SRiaGbDZ
 vUzzeO/C4ao8mnsOzrmVPt2la+MAYnwDGQjbwzYYdR3rEC1v2tzksUFGvjqOQQzgZvQDZgFhoW2
 W3f2pM8p970hREVL4AA==
X-Proofpoint-GUID: HiY3YjXR8tdPIDzLAwLeDmetVNfBiE3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300080

On Wed, Sep 30, 2026 at 09:52:48PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年9月30日周三 00:05写道：
> >
> > On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> > > Some devices treat two independent physical DSI panels as a single
> > > logical panel from the CRTC's perspective. However, two separate DSI
> > > hosts are still required to drive the panels individually.
> > >
> > > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > > allows a panel driver to inform the DSI host that it is part of a
> > > dual-panel setup, enabling the host to coordinate both physical
> > > displays as one.
> > >
> > > This change does not force individual panel driver to manage
> > > system-level display topology if the driver does not intended to
> > > support dual panel topology. Only the driver that set the flag to
> > > true need to take care of panel topology.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  include/drm/drm_mipi_dsi.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > Do you have a single MIPI DSI device, or are there two independent MIPI
> > DSI devices? In the latter case, the flag is wrongly placed.
> 
> Yes, there are 2 mipi devices, and 2 mipi hosts. This flag is used for
> mipi device
> to notify host they are one of dual panels, so that horizontal
> configuration(width)
> in mipi host can be handled correctly. Where do you suggest to put this flag?
> Thanks!

Into the msm DSI structures. We already have several Qualcomm-specific
flags. I'm thinking from the 'generic device' point of view. The
'dual_panel' doesn't mean anything if the device has more than two DSI
hosts. You need to specify which hosts are mapped to L or R channels, etc.

-- 
With best wishes
Dmitry
