Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF3330F7EB
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 21:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089803; cv=none; b=R4zEVYfxRdHhYqgHxSS8yU+T9S/C5ca1tbZOlw5Nibvz7G1D2BMdSgC+IXH6BYYdLsN8dO+nLY475w7Mzz2j1tPp6uNfKhwQx/IcWK2bo4+bcTwIgzlHVDgyoizM5ofe77XnByyEbK/g1Icd9l9Ii6pVLWPf7LYeMEDAh5papPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089803; c=relaxed/simple;
	bh=IAK70KkaliK57jbjM/L0vb5pwfEEjfYBPAcHmJhCEzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZX3agcmUt1+JD0WmqFqn9hO7M6P3D54cxIH1wtedr9mSkniS4EaL66M3DsjD5tvYVhGk/U7ubikeFTTVlgOP0r+c8n2WphEZpUt8JkFN9/ErP3a2NisPfDnscj9LUhR5mcMAZaJ/u4c2W2RB3rfsGlTtTZ6B3/vjo6i3TwnTd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8PTKP+u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbv5yyzb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8PTKP+u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbv5yyzb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILbnFQ2502963
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 21:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P7BPpuyOAx/6G4Ser6+Spcf7
	5yZCb3TK3+4BU1JJ8sw=; b=m8PTKP+uoPf28BKwFVEPaZACdGfC1JG0lYxtMX5M
	VUdEthTZTTwB/p0lDcBx5VuPtR74dDaMZj5TPbTLr+sQwHLtrW0b0poVrAJHWO3t
	/nQLFy4m+TN6FCLudcaHGld7FvqHyRSy6jHH8qupq4uCkHCNtyC/3pLhRnhWaxeC
	ufqYDztxEGVdckiSlOQeAe5BKiByD8AUm9dg8/vp7Bn3/SlhgJaIc+GVBFZZD6ti
	rxUhPOwL4pqXbUTjYomA0PkMaeeHN+Q2lL6M8AWKQ765irYdjky08JI7iOOPXtuY
	nVTA7yoIzua3aV+tOJIKX3BS65YFEpql5M7ztGx3pP2c0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yftr1xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 21:49:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930edb4362dso41227885a.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787089799; x=1787694599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P7BPpuyOAx/6G4Ser6+Spcf75yZCb3TK3+4BU1JJ8sw=;
        b=hbv5yyzbzNXEgz+12BSSKcUekvEmg9sQ1YQqyXu1f7AAYqFi6qBScOKfq0NRDiflR+
         2sI2WgqSS/UJvY/36k00M+44lqv7BaojpEs+43tgtH7axtYVwtYsQhCRrKY2ZCBu5/+h
         w7S8eikcL1EEREQUSuYgVZm4qGZK26pHN9adMrmxhBq9jSKNlwJcMAmwKKs2tXU7RPAI
         ixK5+fl3iG2nS1PWHBoJSWVDyWM9pRMoToqYyIjReRS3G02eTKn080u694IPajHQ3K2O
         VqwsJKXwC+oLcmWO4hKX/kXQ8feOYQRftR9Oq1nBuiN9oZSeD68Ayz/2hm13Pgv9Yako
         Pu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787089799; x=1787694599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7BPpuyOAx/6G4Ser6+Spcf75yZCb3TK3+4BU1JJ8sw=;
        b=LkER0GxF7jRY/H034LW8VOC6uoHLTqBBRdSui5d8sko4PJCSu6IzBLzRoewry7ie8m
         F353ESmVtjOEsbP6kGXPPzD4ChqyRXic8O47p4SBB+PqYV0vefX5svQn2QzrKV5XhWMu
         yW8Kq0ZEz6a+ONT/60Iw2ZrumnjcPuigdDO/cCsIypB66HvpmGO2fKFJ4QbZycKMzu+q
         z98gE2E6stTx7RtVsZsLeGT5nqB/oFHTXV36mevrljlY0E3H1/UJdIlW/zGgoXmT+LS2
         yBoV66dvd6Nh8je6L3ZBae8eAKn7Lr84tArzPcaCAdsGmmO286pIPVB8Bk1wPuizWL0E
         ehiw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1TF1T+LqbHLTQO1igrDGHzXGJ8ZW7gx16RFWZFudpLsdHPpVxOBMg9U936MwJx7Nurchfdcl1Ahk8@vger.kernel.org
X-Gm-Message-State: AOJu0YyzIHDD4/NTXtXIjA+Tx24tkjgIlOeyIpxtTGFlF3TtEQdHmtmO
	uZLzdUXmCb1n9kZ/G2qadn+DtPJVI8fwpDFqFf1HE5h2mQmVXDkuN1BfhIrk2+5fmeIbSbzWhsb
	JlxBXh+8C7bQu8Ct+0JjfneGowohyD0GBsNc+1H2bzSCLj2dT/YAoNEO3I6rghVMG
X-Gm-Gg: AR+sD13HoIdmknlUZIfxi4kgrjDz4QR10jMdLADNbyRjWaaTe/fY6p3jpMmRhb8T+c3
	dtnTWfWmrXaw9Fp0mIlvbWULL6OQ7p3n8rdeszCtqHSY4OOwah1JcW4G4J2Q0zRBMDlZsITGm9C
	udsfSNwW1gLniaROq10AiI22cz/bu2jn0bKJJgtvkGKqPQ+NJK16k5JAgl6IMVKfcJRMFqhHNRD
	6fshNZT5OEXQltywQvVmiM00e0u83TyN13yuOsMGk3dY4LZ8f3jNulvqvuRKG4s23AF3BJ1k7CT
	AJfnb6ThkYbiQJl2RyjbBlMuKmH01rhmJE93PKm2A4TmCKjAvSBUPKUbHTn/SOg5A0Lb4uEg6fR
	C0hrMkzJkVcxHYN31uU5mxhnkKNXwx1Hi95SfKWmuvmjy1nqNqUEc2FQf3n89h+uygY0nJEY1MJ
	tHmSRMu6kWXJ5D
X-Received: by 2002:a05:620a:600a:b0:930:b4f9:f327 with SMTP id af79cd13be357-9371e316b8bmr44562385a.33.1787089798630;
        Tue, 18 Aug 2026 14:49:58 -0700 (PDT)
X-Received: by 2002:a05:620a:600a:b0:930:b4f9:f327 with SMTP id af79cd13be357-9371e316b8bmr44556785a.33.1787089798036;
        Tue, 18 Aug 2026 14:49:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1f31c0sm15151191fa.40.2026.08.18.14.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 14:49:56 -0700 (PDT)
Date: Wed, 19 Aug 2026 00:49:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: mohit.dsor@oss.qualcomm.com
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
        vishnu.saini@oss.qualcomm.com, Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v10 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <uuuph37ftuyuqpbayqbotnsqgqn367ytdam627jl3cqcxkzana@xq2pky3dobyx>
References: <20260808-lt9611c-v7-v10-0-ee90a136d82a@oss.qualcomm.com>
 <20260808-lt9611c-v7-v10-2-ee90a136d82a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808-lt9611c-v7-v10-2-ee90a136d82a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a84d387 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Kz8-B0t5AAAA:8 a=6b6BgIowys52Drpq0AoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE2MCBTYWx0ZWRfXww4wG4ksOP8K
 AT5VhbfaKWfDeW5K7wJFTqA17KHXCuRI+KfXtk7dgm7C6IHMEZnrnxvK91Qyyo/zr5kJ46YedY/
 Xz+ZTFTxBlzpfbFd5bXoWVw3HOqcKC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE2MCBTYWx0ZWRfX/n2qPSHuvJN1
 XGpYEUuRlX5tRILG0QnabQEQ4R5fItyPGrVflMh3opYKcJ8/WybNx+uwXVaH7RNnr3Jbv3fxqrW
 FdgU2erHJCtqdo1eBdBI418U4C0zo0+cQXhQ1XJqVMELGtXPFZNJwPXtL+4CHneDqMDd+sTEHp0
 hsIxcCu/1IUJXAy1Gjlv0hk5TvT4eIBA4Zf285HiLOb7XAPw7sMteIvdAmlRAAFR07jDNYWBLOi
 tx2+6ENM8Y8wZYfzByGHTIqhmY79yyX2W6wK8MehgP1YQivuSTAc/hRzktfyoMvMj/N2lh1aE2U
 opTPZr+5DrtPbkwERXZSXqj0pFOyiRTwgh6JrT981nHBWCvqUWWnzUVSvbJtdT4SYQWc2QdRntg
 oNHdqi/eGI6fIzu8cU4WRNZ5O/r55BZ3DVQV68YbWXPvfEv/jdKf9gwuzo3EThnMwWOBFEL+f9Q
 y5/ooV2y1h9Qg6OUG3g==
X-Proofpoint-GUID: eZHCHS7wfO546lGeMPMAg9vAFUrwtG52
X-Proofpoint-ORIG-GUID: eZHCHS7wfO546lGeMPMAg9vAFUrwtG52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180160

On Sat, Aug 08, 2026 at 01:37:51PM +0530, mohit.dsor@oss.qualcomm.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> mipi dsi and output hdmi, differences in hardware features:
> - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> Co-developed-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---
>  Documentation/ABI/testing/sysfs-lontium-firmware |   10 +
>  drivers/gpu/drm/bridge/Kconfig                   |   18 +
>  drivers/gpu/drm/bridge/Makefile                  |    1 +
>  drivers/gpu/drm/bridge/lontium-lt9611c.c         | 1283 ++++++++++++++++++++++
>  4 files changed, 1312 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-lontium-firmware b/Documentation/ABI/testing/sysfs-lontium-firmware
> new file mode 100644
> index 000000000000..8700933ba0f0
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-lontium-firmware
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/i2c/drivers/<driver>/.../firmware
> +Date:		July 2026
> +KernelVersion:	7.3
> +Contact:	Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> +Description:
> +		Read: Returns the current firmware version loaded on the
> +		Lontium bridge chip in hex format (e.g. "0x0105").
> +
> +		Write: Triggers a firmware upgrade of the chip using the
> +		firmware file loaded via the firmware loader.
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 4a57d49b4c6d..d1597548e578 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -177,6 +177,24 @@ config DRM_LONTIUM_LT9611
>  	  HDMI signals
>  	  Please say Y if you have such hardware.
>  
> +config DRM_LONTIUM_LT9611C
> +	tristate "Lontium LT9611C DSI/HDMI bridge"
> +	select SND_SOC_HDMI_CODEC if SND_SOC
> +	depends on OF && I2C
> +	select CRC8
> +	select FW_LOADER
> +	select DRM_PANEL_BRIDGE
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_DISPLAY_HELPER
> +	select DRM_DISPLAY_HDMI_STATE_HELPER
> +	select REGMAP_I2C
> +	help
> +	  Driver for the Lontium LT9611C(EX/UXD) DSI to HDMI bridge chip.
> +	  It converts single or dual MIPI DSI and I2S signals to HDMI
> +	  output. Supports HDMI 1.4 (LT9611C/EX) and HDMI 2.0 (LT9611UXD).
> +	  Say Y if you have hardware using this chip.
> +
>  config DRM_LONTIUM_LT9611UXC
>  	tristate "Lontium LT9611UXC DSI/HDMI bridge"
>  	select SND_SOC_HDMI_CODEC if SND_SOC
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 15cc821d85b7..f322f3f89f6b 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
>  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
> +obj-$(CONFIG_DRM_LONTIUM_LT9611C) += lontium-lt9611c.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
>  obj-$(CONFIG_DRM_LONTIUM_LT8713SX) += lontium-lt8713sx.o
>  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> new file mode 100644
> index 000000000000..e6887f2c89a6
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> @@ -0,0 +1,1283 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/crc8.h>
> +#include <linux/firmware.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/unaligned.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/display/drm_hdmi_audio_helper.h>
> +#include <drm/display/drm_hdmi_state_helper.h>
> +#include <sound/hdmi-codec.h>
> +
> +#define FW_SIZE (64 * 1024)
> +#define LT_PAGE_SIZE 256
> +#define FW_FILE  "lt9611c_fw.bin"

Lontium/lt9611c_fw.bin

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
