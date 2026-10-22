Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663871;
	b=ibh7+S1Vm52Ayhu8X2sv1Z5oobteuz+47jN5WlmCgW/NscCQP1jzJRXZ0Jedoox6Rnu7
	 QZA+PBoXy8QengPaLV8SJsUmJBrD+kyLXp8KK+qoWf38ss+KUPKPWKg6u+QcMa6Yo0R7Z
	 RWwoPhcw+9L21li+4SfqLwT3IFufm/h0V5fXBHH2hRkNd4ZsE0/Rk5rWuqTmZxu3Kr5mW
	 VRl1IB04U+9bRgZBqNiU6PTMl1EMUngdBWHwSLvChf4Udwk4erfc0Ssq2jZ9m71OghqqY
	 8kvwSG0ezC9zyP9iAcBFVkpL5onBo9ZqFwd1YBrlEXaO/m5G6HfooF0f2/sGsUdplug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c9B2KZJqk7yWavVCYYzwu+zA2gBsyHi3wZ3RoLDA4uc=;
	b=GnvCm4bSfNUiup5AA6WQTtEJrfzK6FVYGc7vcYe0KvFAMyyRIs58EzeSwv/CfTmbX4z1
	 DdnCOW2QM0D9hrutRt0AXacp78PJQ/2NQl7IpDmR1NMcMqqWlWqSvYodfzXOprfc4+rbr
	 CBinh+PNWtw02odsMVY9dABQp04yyz1HyLt+73GPzzDOuOXCOW4RdqndRkqDKFPOW6vm7
	 ICy+YMO+tfcozfTMDxFuQzcoH5cxoNEm1WpNgAa6sFPWVVkgRlgdaCbLAfHE3jNB+xRVr
	 gicq2kp4sARaYcynCedmF6DKowCU2Kot4uHo7FcZQEAQghZxbyJjg0dXEBP20kyOZMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYujOQpX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bpM5udWg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0479606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0479606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYujOQpX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bpM5udWg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0ZZ43923272
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c9B2KZJqk7yWavVCYYzwu+zA
	2gBsyHi3wZ3RoLDA4uc=; b=EYujOQpXhcPwGx6szVYQ8PLBcWiS28DJul+ISrVy
	qRkwyx5acOfFAWNU6K1SExdLPLSHUn/iJyosKfM05T7TbgwW5ePvuB48nJ+CiWR0
	W7ASmhJhxWxOh/l8KlXO2Fdlp5A5+HEgMoXE4EoGt8or7fb3r4mWXtaJlYp6RjAH
	YKuNR8t1gg88vK9YjHmnFSJpX5FNm2UrhmMT4eA51I7zwuF9IH71SmnlNlKRJBva
	a3wZfxLcRNyp5/cBBERKjj05VcwSGy3ioBUqLPWMoNhgeBotgf/r6ylNvDS/1InA
	Xw6LQczcS9b69ypRVK9T4wkpbk1AQUhGr1jQwCPc67lmVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhu67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:11:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so363681485a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792663869; x=1793268669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9B2KZJqk7yWavVCYYzwu+zA2gBsyHi3wZ3RoLDA4uc=;
        b=bpM5udWgFBFhk3Uqu2R0w4RTvAcp666jjgc2hPVrd4sRye/z87hkJ/AlKuK5pkVLnI
         HlFEFUr1VjzmFCtTFlmCNhdJ8GZBgsWB3IYC5PhyqET5Ys3z+bdXoNBNEl8jN4G/oArg
         vCshPds+IEq8o7aUfLhui3e+xugO2ko7zWJTkShrnZYfI0H/HEyodWkzrrqXdAoXwV+q
         e2jdZ3u5TYN1CU8A1UMoSHT6wvOau16F6ixgVCiJ6FiSqFN9X0fikNOx1p7sjugg78g0
         Ql35CvdC7syquwAfR8RIBdWYfpV+qBB4vrqPSEOGN1E3gVwD/wZ6BtfoaLZx2sNKFSa2
         Z8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663869; x=1793268669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9B2KZJqk7yWavVCYYzwu+zA2gBsyHi3wZ3RoLDA4uc=;
        b=JawUdoDFXF7po50s8Vw8XV6cykhS8daNm+k1vdu4k721erUAawKQPT9McSxXlZOBGG
         umh8MeLyhdJRlKKu1Me8XcxJLDPaQGeLDOZLAZDcacsjrC98O0wVeJbLweDNlZekkloL
         1bu0D+7JP23XjUry+x3KrxlhAwdmDoBXTz0W1PfzkAaJDbLmAtK2YsqaQD6xuX1E8jud
         990BHkoZn3+gB/Ci3hNxy+vFLQrlBRSYZ7nP6YdFsoNmH9aEUjrJvtj5zpJpdrrCecJu
         bMmYd+EaVq9CxkWGGeLZoaEgFuqXezP7TKaGf2UC6ZIl/eegyHZ5bIgSsplvlGrmse6d
         8+4Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/lweTD4KS1OaVek+/5ROStzFN3IWlyPs+5aY5ua2LOx4mVpCdhwEPCUBS1pmT8/1jpH2uty6joZ1V@vger.kernel.org
X-Gm-Message-State: AFq9FYJupkgScjABd8nbXv2QRkWOqn+x4zoA+OHxEGMtsUU4gJngFdOA
	nxOFy4IzBPBTVtWvAr2o0rLqESEU5CSS9HWnd02fbdCM5vBHj9Kh03elLgXKhPjB7DRkIJRhylU
	yNB5308pHoz6Sz0GxMsRfUHM+30d0qvsAjQolpUb5R5d4kowT7fah/Z3Hfw13fNfL
X-Gm-Gg: AYBFou3WQDd8BaSpvs4bp/74TFw6riSYWQ8dKzSkF5kZZ2otkTrMgcBQ22ppw3g5n9C
	fyybllJD6j6/B/H/ZPwh88SmEuHoJCes6S9gxU0WunMMlYuXjmhsjoBWSs8Bv7h3omZS/QseEJ2
	c3VWt/jqje3uDY+OEXYIo2aAJS6Htc3w5SfQMHPR/ii1TMBg6hgz3yFdwuslkti9HI5ZnGIXx9/
	1ZJ3AS0qOA3MtoQIMyvlaMfOHu95yxnMQRhVhdiFgk6pXqMMbPMLoFsXP0+TRGEfhKS9wOZndiS
	39AWT9FjIV4F99ob+mAIwWsd4yqj5UF38BqI0c159wKEMi9G8HMNelGvLfk/pOj6zh6XtV4VWjb
	n+JLZY7kkgAxf3kxlwiVtGHOcGCe3Q3/o+KIQ7xcTxON6xYvLwGQRsolBm9RsEbdg7oepaFEZyQ
	nppzL5uw/yoKp7
X-Received: by 2002:a05:620a:8909:b0:93f:1936:b20a with SMTP id af79cd13be357-93f57f777e6mr833147385a.76.1792663869253;
        Thu, 22 Oct 2026 03:11:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:93f:1936:b20a with SMTP id af79cd13be357-93f57f777e6mr833144685a.76.1792663868810;
        Thu, 22 Oct 2026 03:11:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f5541e4sm6578571fa.10.2026.10.22.03.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:11:07 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:11:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] drm/msm/dp: Add DisplayPort controller for
 Kaanapali
Message-ID: <7p6lfgpiav4hqsxafx552i5ck2evnczrpkpb3ggjszvwzsajvy@75h6d473f752>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
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
In-Reply-To: <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfXwnDRxoQMb7wQ
 /kS4ntBJONoyYwv2EKA52/vhbWrFfWkVxH1ZAvA2Ib1rJSE9oATjmUzIE8smePqWi7PzOtZwloE
 rdF3U7KUt8GNqJ2IzzK9lb1gn1M3313DLV/TMn8Zgt53rjuZBa0Jphs9IsJv2k65neYNqcbrjXb
 QGCIh0TnrBZQl2mmmslE+XXH5Hg9kJZNG+J4zsS9k/zCCvYwyRoBG3LdNkjl6WUFcoGBdd6EhF3
 ABjWfTh98izE/vq2CLoks23o8/wrY3N0tFyWTAkRVp+LsjOZKJw0+SVmtlBeuNqH2N0SkPeDTqf
 617EvnaIkJlYwBllwTEvTBLKPVtY/90aOQ8ky5lko2YMWwKiWIr4qn/3oOLp/ycSr4cl55uC7Ke
 56nqPk154mMjMsXYeJ/rONZphybghUK9y31opfGK7w6rzZDmz8O50xNtDZ1M4ykiLTzSLzBsbBh
 UmIIQ7ZISQ/bt/s0H1w==
X-Proofpoint-GUID: ydumUX7c4RigHPOLfiYKe-_wKjQ61DXD
X-Proofpoint-ORIG-GUID: ydumUX7c4RigHPOLfiYKe-_wKjQ61DXD
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9e13d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=OHVtJ8ySOF6wsxM0GN0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX8hmaHxCKVwGE
 7SJvogTfBhjOX+07NYXrjFrmLsx1r6IfvEZ03Yif00oOwZokg9vKjLB5EGUxw9PYNsAljosqxPw
 zdwB89GBv9O2FLMQVdTpcPzLUzaRLmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On Thu, Oct 22, 2026 at 03:19:43PM +0530, Balaji Kalkonda wrote:
> The Qualcomm Kaanapali platform comes with a DisplayPort controller
> with a different base offset than the previous SM8650 SoC, add support
> for this in the DisplayPort driver.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
