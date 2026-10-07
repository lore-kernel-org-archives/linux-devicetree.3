Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2B63CFF5A
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379427; cv=none; b=XAlWvaMJS3mzA15xHxveR1d28EahRuU/WFvWpLicnfneRv3w1+V5MuXiyidDvRrGYgxyFTT5AHGx/UGt0EevaCCtFz+PSAAVj1AzprMXvJHTQ6aW0AkScz/vNDmKUAIB00W72HR6AtI+u+FvbKToqaq5mZmsUTJ78F668zDRWuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379427; c=relaxed/simple;
	bh=mQsliMn1SLv97iUfP+osd1J6vLUHUvKgPR541ZNY6lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuvX8322KNWOzLsffEBEfP0B48FAz0OgaWlNIhdP8wLhx4GTuf59sSWXvtwAWTTXRPablq+Vn4kbHQb1aOoBu2vB4J8pEYkIuCP3Q8FhAoBjmZsMpQ0xqKX4WuI0x89DX01oDKvrK+7AVBtyUAZlrkljTdsXpMl89TcvTpzqyb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyN6id0g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvL4SPIE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyN6id0g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvL4SPIE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV5b0640809
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 13:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=od/ltRzE348gH+PAnRq5JK25
	RMcjNc/ilrPe7ahtxwU=; b=jyN6id0gSsAnxV6VXP5219pJfa0SnX9aV4tRRPrS
	wLSN9cfqHQS+uSh6c1HCJYp7Swy6KjdA7sFRQVDHnuL48ZS/5q/jeLk3G17mYJqt
	VEJTwcUQLYDrj36WugDVjVkE6hDTq04bBsU0jlzAoko9Fhv4PLWolNo92ljYjVoe
	HWX+ngyykneVl52olGUhIf8AjicMlqHwRERG+c6r2aNKkrjabMu84yizbMLurIIB
	1wSwLFydOCEYyfpgvU0+k4JyMBz03KhSsSHGnjyIsi1Mn3Ba3KfCwmVcYa9L3gF9
	U48zluwhnddUC4j/S5WEcfwHWXoWJ+4eR/E66a3LS7OZ6w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c71abs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 13:23:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c039041433so3597128137.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791379407; x=1791984207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=od/ltRzE348gH+PAnRq5JK25RMcjNc/ilrPe7ahtxwU=;
        b=kvL4SPIEueft8aug5RxfbV3PAkFLkKFTHZAWuuvVt+UxcSSxLMHBPgmvWHh+FF19G1
         m/C/abKsqE5AvH0yec+bR7tBX4uoD9LArBUwU5iAww9Rla1sAaERMLrbpLDxD0wVgyPa
         uK8iTP9aMW+tdYYz0K7eL0P/sQHsQFMdTFt0FWH3RenJvjMm0uMPDGya5nPsMBcsY/1M
         qJnbsxbEAPgIp0zS7AFHu/Bqp3mJ7TOIWvtWWI+2EKEIjMzu7P3dx2LtId3yT0Ym6kaX
         S5LUkuGz+889OrqzpHPU7h85yFoCyCr5tSaKlOXqJUvipREUt40LOXb1VWC4QIzSiUY0
         4bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379407; x=1791984207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=od/ltRzE348gH+PAnRq5JK25RMcjNc/ilrPe7ahtxwU=;
        b=aLZSecAk0/8r5dqH9bweB6SKvcnm5dtfHMjzNLK1MYpSfnpDruR9Th0ubcW4MCiQYu
         kZ5bxYv7AFRcN7Iw/J+PF/v/NH6bvZSz51FmZ9eDQy5RaHhpXxjtBDtNyDcqNuqBk/A1
         6BBrOWgUCMy/LT40rzMzCIYIm9MhGm/uVyyvyJGJuvx1AhXKsGGCHJq6dbtHX6XhF95L
         2KI7HUWBsmnC9kDDxzOsmIhBHTrwGYiBltPZTNVsnjq95tZ32YafbG6yqwlAlSvLtSVB
         ER+XlNw5//cWKK26N4Jzi5rb0NeRaujpJu+USGNX2IGKTXLCW2B6M3RBZcNqdMBJ8nkr
         XKpg==
X-Forwarded-Encrypted: i=1; AKwUvBx843GOvP9NjC4oHgE24SPhqi+7t+MYDUOpVSfyc3V9u+yQcqKmq+Jj3RbED4N+IUyUbp8WtwOJ/Yb/@vger.kernel.org
X-Gm-Message-State: AFq9FYIknA35cZyeLw7QiL9A6xDfGGuNNr2DkcwLA6x0M9GYrdG1ImxL
	g+Wj2G9ccPlASozDPv2iG+pkUbbPTQDnnXciTLS8dscJ/JishdK2oyY22GF9xWn3dILS4/faFGK
	EdouJl5DgajhnSvjs8Dol6PL2IexplRRKVjAGOuF4o9H/CwTb4lM3zT4ccCJy5Xrc
X-Gm-Gg: AYBFou2LhyiYgLNzxiN3Vo8b5Ukr62QXp+ouk3ofmCzaTbuCpPrseRrBO7dgL91R1nC
	XgRQZAgl1iV1UD+F2D+cAIUNTb9fRlH91ywa2ubQ54ghQzzLb1AWzddEgZT3QxNsWcZr7S09x6m
	/Wdjccm6Hd3EnU7Ye/gszLhxtQBLHn27HbeDIT8NoUi/hC8i7HL8FcnFYyLXeJGICuie/w+aW6g
	4YE5lRWyhayu3VWJs4YXyvnKs2qu0tluPbw7hiG4OWXnIP8nqCitP/WQYxBvpHibEBYe0pPDlz/
	r/f8u9GX3ZDgIGF+Zug5wYdRPUKn20g3lHMJ5iAzk05yMx1+ungEwgCu8Zoem+dv/p9ZyRKPW10
	hAwbY2sWVVw9+dijFu6qWd0pSgfTq7MF78tiTG3FLr9GLYQH22aMLxs9N/v76TpuuARVrOmaIXg
	==
X-Received: by 2002:a05:6102:5088:b0:7c3:1898:e8e2 with SMTP id ada2fe7eead31-7ca3890b52cmr688227137.13.1791379406731;
        Wed, 07 Oct 2026 06:23:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5088:b0:7c3:1898:e8e2 with SMTP id ada2fe7eead31-7ca3890b52cmr688194137.13.1791379406242;
        Wed, 07 Oct 2026 06:23:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd308255dsm29300e87.35.2026.10.07.06.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:23:24 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:23:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] platform/surface: aggregator_registry: Add Surface
 Laptop 8th Edition
Message-ID: <zgg4st367m4s7gfttvmt7hi4khx5haw4436hmde72mu56xyft3@t4fxnw6c7jlm>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-3-406fc042162a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-mahua-surface-laptop-v1-3-406fc042162a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfXzchgK6ABgol0
 Bn8PimwoFTb8go8TeqJDXtBrHwFKCAiqwU0Vmb2VaeEOzZzzMUDOQrzc8jlcnzjP6hpPP0BBiVn
 hNTj2Szp6NrgXVPD4GWMvB8ngFPbgZs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfX/9pRcAZx8ybm
 ttDsiXEJjWXMbP0GUtH/puQF0tOW5ZuA2a3VqKMo5TW9gY29XH9RAXX28dyn3caIjRnTxp5X+ey
 nwYejxtEvJ6ai61fBCNsBisRxojcN1uJZe89pn4Hr6XClWGwACFa5Pb+QrQMhJVpaFTkDQLfIKd
 wjYQnOkOqNue8EcAz10S2FUXWxmfI6FW/bO2rFS7AYbak7QHFguT0swqdt+w4ShWreCwYblIh5b
 aN6tvL+A1hkYpgti56qOjZHGLGyg1mU1h687A7SAHYh2vaTiHb14x9GiQ5lV3K1q9ssEP6F4x7z
 tDESOBV6Ok+T2CLzQBGtKlvUYRHZZxOl1Gmubzj7D6Qhh5Lutk2anTP5urQ5q6G/TP31wIuKA64
 xuzSOZljHQBdRxik58atcuv9VRNj9NUNHQXoIj+Ugx9fWxXLg05NOs0Gnf6hGa4v1SMxitBDsoF
 8s1fsfUHIOXcPeVpu/w==
X-Proofpoint-GUID: E4uG7pm53sUvloyXMxx8V1NngERp-XDw
X-Proofpoint-ORIG-GUID: E4uG7pm53sUvloyXMxx8V1NngERp-XDw
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac647d0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lafGyRzbQaP5-a-rDggA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070053

On Tue, Oct 06, 2026 at 02:50:29AM -0700, Gopikrishna Garmidi wrote:
> The Mahua-based Surface Laptop 13.8" 8th Edition exposes the same SAM
> client devices as the Surface Laptop 7: keyboard, fan and platform
> profile. Battery and AC status come from pmic-glink here as well, so
> the Surface Laptop 7 node group can be reused as is.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
