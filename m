Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEAA238C1A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637492; cv=none; b=Gx4Yab0xCIl8PZqXG7/t0bRhx8GyYYiCuqZaDKxavlB5gGZNXNGiwv26ALXKbcDExFIKXiWvQPnBTdoXULfmKjVCun6QbWOPpwpQ63eWlwjbXfKNKW4FYR0XTyCVuzMhru9xxcBAPF8ExABVQ5XlG1libDJgNsPGRACTvsxDZNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637492; c=relaxed/simple;
	bh=+s4wue3fo+eRRQXI6O1UDx5VrbAirtkAZd1hnEpuCQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iv0iO5omTv35wyHnzwRRYmEA2EpRQ2x3vAg6FkSL9vXmoMOQZYnGmGl7CjkI/PUypi1b8n2VyGeDPWLEY18BMb8i0bU2lljsnFVAs2bgP/m8rpgkFhlEhl2ohbiMKdIXWBBsyd59U0OV3XScXGjeLwHKVNsELjihkxGu/1FuOUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnfQvCm9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQ93WDe/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnfQvCm9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQ93WDe/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARTVk1455591
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oFR/ZjnA7aiJL98A84yTG7kq
	GldPgkhkZvdUyz39BOI=; b=gnfQvCm9rRhi5DfOsyPOt/sZRovX0OmiJZ9Ca8uA
	PVSuq1GPQzmsZsNPUDSxMIIFy0KVW7AhMNoLa5H6MVD7UgeFtV7s69HN+jgEGeU9
	TAGrZukdY/LP/0j4EQTDlO4zDWPSZ9ANatoz+SZSOlsMC7ympiKJB50l3pzcXTqV
	H2vaPizc7ezkXg/w/xmnOvqcMr2Eys+fo+UYP2IemJ98YfQmywaAer3+fiI1w28F
	Tj4KJK398lHxT1lW9BsNSl5TqBbJUQ6SmU7AwFMV864y+UoBhcelmpqcZHNQRAG7
	wyX+ACDz+xtvKL6NPvpN8FdOTGD6epWLwiMn03zRWxGwwQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujb02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:38:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e63de75aaso5275518a91.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637489; x=1785242289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oFR/ZjnA7aiJL98A84yTG7kqGldPgkhkZvdUyz39BOI=;
        b=AQ93WDe//1fYSy0mZM6WEvVOHRfZDJBMQeWh27uwNc5BZf3Fh0odslXsy1s4/cXOpo
         OfdTFMYlnEwhyGyYXnkXvGd2jt/HPmH43pnjucWABn6AAVeHctBQCAklYBY2LCsheQUZ
         ZZBBNhiJS4etWNUHbeIDgOvSAMab6TOXc0CPK0ofK9EjrN6kHg8UhaYLJdpSOzk8CZCP
         YO/A6cy15fggPJDjroP3AKpoVwQ2J6JhGO6bjx5lINpgU2eKXT5/t5Bon+wOazpa+qKU
         udX76FUMYrHKMeS0VIcpl8Ux4Ppwaf+0R+HoF+iBK6G0qKn3Z1XviJ/aTyhjvAU4w1ll
         HsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637489; x=1785242289;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFR/ZjnA7aiJL98A84yTG7kqGldPgkhkZvdUyz39BOI=;
        b=GIMWbtDqOcjnIdWdKnz60hvnELnBnPSxVBn9QdACXkHp90dTRMdj6B5rPRYXNyMGTX
         09nBEGn8+mi6iecrAxqRe3Az6CCpO653R3CpZvmoEucBtXUUXUA63Wl0SmjLHvU2SUjG
         8VGc2ZH8PYHRmt7yhLzhJzR5am38hzLXSwIA5zufEYLBlhEeYnW/kBFjJemdfYmFa2xk
         E3ongRxZGsaf1Gu/bCJVd8H1bVTQxPlDuokSMykss5hi/SmKKPnFoU1YJUvQ5hhYQ5fC
         x4T9fo8BBKs6Hx80I0Q/T5z6KsUHAzde0DZ9v1GWJqb0dBAnefY9Jpej99s3FLh8klpe
         Wb4A==
X-Forwarded-Encrypted: i=1; AHgh+RrdpHgrJmkjqq3xwIljtqs+6/63W2OEDZaXKndK6NI4o/7xaQx59WHNMd1Yo1fXcPwc+GvnMrBTaMXY@vger.kernel.org
X-Gm-Message-State: AOJu0YzO8lvtZ+RVsILwWHASwoe7xBvoOu/CDIYtY7eZnyMH/KPwQG10
	swX0bgbd0yV9tGasBnrUlT1r7q9817S+KyJAxLBW7UsrTG1xdLzurhQq6/1O+VQD9/cfaySxsxY
	bhNM2hZZQ54PAMCH0RMqrOoSaUdiW6bF6ycZgkPQXN0OU/wQt3YJxCJmMjXc9Sf9H
X-Gm-Gg: AR+sD12kuVYg7ExuJ6SBJuOmH42bMH0FdRUGP1dMQ+nLmzPtEAvl57+QcwGkviPCb1f
	qEuKZ7IhDb4pmZYBvZo+eqv7X0E3/vtAMbhPwDXEeMXigaB52942osB8AKHel8l9ZgnhzPAqK1x
	tOcbDknLvXOCo0lIkMnw3w5prTgu9sIliBxcWTZDvLRHCj3Sig+F6uEkrABsxhtSXid6vvS5Oz6
	t1OWyHoMnkBA9ryIA7niZM7jYX6i8j3tK4JwKXW4y7BTfRMvH7X56TGNHda4wOiiuGOnOgBlGgr
	FQyTYXaJlTBLEesiDwwVHCsLVTwDj75iw5xY8bqr3fuzwPfl5iMk27JkUfVKNehDDYWxidzDX59
	coos7Gv7NQCoZy6O8ThFk2SgiAw==
X-Received: by 2002:a17:90b:258d:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-38e4b446c37mr16944601a91.14.1784637488716;
        Tue, 21 Jul 2026 05:38:08 -0700 (PDT)
X-Received: by 2002:a17:90b:258d:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-38e4b446c37mr16944576a91.14.1784637488212;
        Tue, 21 Jul 2026 05:38:08 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9237cd97sm1576802a91.15.2026.07.21.05.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:38:07 -0700 (PDT)
Date: Tue, 21 Jul 2026 18:07:57 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sunyun Yang <syyang@lontium.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>, y@hu-mdsor-hyd.qualcomm.com
Subject: Re: [PATCH v7 2/2] drm/bridge: Add Lontium LT9609C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <al9oJQfVo9XO7rAZ@hu-mdsor-hyd.qualcomm.com>
References: <20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com>
 <20260716-lt9611c-v7-v7-2-7553a14735fc@oss.qualcomm.com>
 <85505d92-ebe3-4ffd-84e1-8fe26994e053@kernel.org>
 <altfrJgx2IjO1g33@hu-mdsor-hyd.qualcomm.com>
 <767e5a58-3d2e-4f80-bb85-d300757a9dbc@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <767e5a58-3d2e-4f80-bb85-d300757a9dbc@kernel.org>
X-Proofpoint-ORIG-GUID: _59BSAXdE7RE_xDhDfaUMqlZD3qSHaoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfXzqO0c2NNi03g
 JzARCSqvxtHgOD7iXjCK9h3CAYSeeAC0Z9ORBbUKV8Qg6B1amJ8Gc8WEoH0+71TkyM9QTbZgN6X
 ka7PFrafFGTR74OGv08kx4BqYj/C6WGxONRW/dFQlqyQzovzKFbTxX4m2YPhR9YPf0tsv8a7M4E
 BqcvwJVR94DcqsLFFoeNkg2OzVP+COFrPhR5hPUgE5FEhvsq7aSqb2jKTnFAj4c324YevLQxW6x
 skHl7Yb4uKO4gidcEdk6WRYapQG7DiDHysKo96V+lxolR9pEJffsSsOYLCAdgx9G5Mm4d6fpZzS
 lQIaXPWSaclc57RsezDSe394Z3GY4TzyyT/kCQ9/0CUfpUDnsEjrJggeoomTDZdTcSimPb6rHZv
 8zTnIEdi4QKEcBjTo8H/1i1DURROCp0uVEH9IYRE3a1Xmk7yCx0rFKlneGyviacKlLWUTbGy0cG
 9dw9y7kNPV3nqbGq7qA==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f6831 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8 a=EXFPzEZa-quHJTxolLAA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: _59BSAXdE7RE_xDhDfaUMqlZD3qSHaoY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX+HQe8OTlkEp4
 s3kcu/xIlFS9iOyYUZQJrSTWFpQBKey1rtlYaifZ8cOOKZQciDof788jUr8Ehojnmpn2JQ8demc
 siM/1uTQuxsgs2SHtSKK2jcXeDDPrJ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210134

On Sat, Jul 18, 2026 at 05:55:18PM +0200, Krzysztof Kozlowski wrote:
> On 18/07/2026 13:12, Mohit Dsor wrote:
> > On Thu, Jul 16, 2026 at 02:56:02PM +0200, Krzysztof Kozlowski wrote:
> >> On 16/07/2026 13:31, mohit.dsor@oss.qualcomm.com wrote:
> >>> From: Sunyun Yang <syyang@lontium.com>
> >>>
> >>> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> >>> mipi dsi and output hdmi, differences in hardware features:
> >>> - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> >>> - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> >>> - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> >>>
> >>> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> >>> Co-developed-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> >>> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> >>> ---
> >>>  MAINTAINERS                              |    7 +
> >>>  drivers/gpu/drm/bridge/Kconfig           |   18 +
> >>>  drivers/gpu/drm/bridge/Makefile          |    1 +
> >>>  drivers/gpu/drm/bridge/lontium-lt9611c.c | 1293 ++++++++++++++++++++++++++++++
> >>>  4 files changed, 1319 insertions(+)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 6dea93a41962..30be2eaf2bec 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -15184,6 +15184,13 @@ S:	Maintained
> >>>  F:	Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
> >>>  F:	drivers/gpu/drm/bridge/lontium-lt8912b.c
> >>>  
> >>> +LONTIUM LT9611C MIPI DSI TO HDMI BRIDGE
> >>> +M:	Sunyun Yang <syyang@lontium.com>
> >>> +M:	Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> >>> +S:	Maintained
> >>> +F:	Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> >>> +F:	drivers/gpu/drm/bridge/lontium-lt9611c.c
> >>> +
> >>>  LOONGARCH
> >>>  M:	Huacai Chen <chenhuacai@kernel.org>
> >>>  R:	WANG Xuerui <kernel@xen0n.name>
> >>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> >>> index 4a57d49b4c6d..b8959b8e2ad0 100644
> >>> --- a/drivers/gpu/drm/bridge/Kconfig
> >>> +++ b/drivers/gpu/drm/bridge/Kconfig
> >>> @@ -177,6 +177,24 @@ config DRM_LONTIUM_LT9611
> >>>  	  HDMI signals
> >>>  	  Please say Y if you have such hardware.
> >>>  
> >>> +config DRM_LONTIUM_LT9611C
> >>> +	tristate "Lontium LT9611C DSI/HDMI bridge"
> >>> +	select SND_SOC_HDMI_CODEC if SND_SOC
> >>> +	depends on OF
> >>> +	select CRC8
> >>> +	select FW_LOADER
> >>> +	select DRM_PANEL_BRIDGE
> >>> +	select DRM_KMS_HELPER
> >>> +	select DRM_MIPI_DSI
> >>> +	select DRM_DISPLAY_HELPER
> >>> +	select DRM_DISPLAY_HDMI_STATE_HELPER
> >>> +	select REGMAP_I2C
> >>> +	help
> >>> +	  Driver for Lontium DSI to HDMI bridge
> >>> +	  chip driver that converts dual DSI and I2S to
> >>> +	  HDMI signals
> >>> +	  Please say Y if you have such hardware.
> >>
> >> Please wrap the code to appropriate limits.
> > I checked the others in Kconfigs they appear to be similar,
> > still i will try to fix it.
> 
> This is nowhere close to the limit expressed by coding style.
I will fix this.
> 
> Best regards,
> Krzysztof
