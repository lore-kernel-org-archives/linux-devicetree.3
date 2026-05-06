Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB75302146
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778097998; cv=none; b=tfx4b2yW8hxqaR9XDXmGvOyGXpGCHYrkNM8X8ZiU1TL8yt2UQsWA95PJFop4Uz3T1AagfAQbCa2XYyug03p1KqVKW52wWlFLULXovB01mJi2DZ6xkj6/cIhVjVRtGs/j1xeoI4CmpLpMsuFOnZRN/vPFQ0j6AURHDir+BvUuDbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778097998; c=relaxed/simple;
	bh=mcUz4QS83zBCBmA+5NkdjiHkaSlDp8O5urz79tnkPfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNwFSyF8Ek0W0X+4dUhD/Aq6yYsXTDGQ40zfQMDOuEZWx4Sdh5IDR51z9rruz42oPPgHgvn9d2+u00enAnnOHl0aHGBlUnnH4mtGuFYfdaPcW4B1XYc2/3Z10Of9Z7ukRU1yHNb2HJnaKshPR2qibi/btthXGpGYVdPlk931ma8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYv/QorB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqeQBkd+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYv/QorB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqeQBkd+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646JuVEE3924358
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 20:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qO4ADo7z/ejk030p69Qyox+9
	T6YbJpVgw4i/wWrNUSU=; b=CYv/QorBGK4AFE3PHI+dT2g6cWJ/C/nZQ7cmF1gL
	s9mW2F9Ha8lm/obT75sxr96YipPIkGZ+VqrIlzA6wy5MnI9dlp2qaN/Pbkfyyj9S
	PdsGcCySK70KbPxRJxUNqW9p6gulquhOuAM2dfK3/j44ggnETGU6A6fn+rrZ/UOy
	P8N6iS6IL+KemtftBRWmlsOowh03W96oZTPHtyNd9WevHe1ojf2DReYlw6lwihDu
	R5UTz04qqytLDZYmMk1M6lVWHmUL9c3PTQMIXfeaJozVINqeuZIfa4BLnStIrkCM
	lPNy+wXbHEY857nxu8AlLgZI3cIOKBxTO/UfZEjNTXz5qQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88812u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 20:06:35 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-62f2ebe5700so213488137.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 13:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778097995; x=1778702795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qO4ADo7z/ejk030p69Qyox+9T6YbJpVgw4i/wWrNUSU=;
        b=fqeQBkd+jR/MmQBBG0B5/wLhDnc2sHQ/HrUWxwykLJiQMgUwyYTof8eP7oBOzTf+2M
         GKppN+7FMPJQciPwYoH9ojs3KWDMzmUsXyWyY6oq6dXxfqNL4jRqLMUYWifHktNZs2Og
         alV6gb+aT66XCs+akXkrnDz+onQrbrzWOTGMtaOVBJZbyouR/2OqK7Emyn0b36Fim4ik
         5HywXNqCQpPj/TzfjwujlFZ/bibLqSGIDKqeuOJUvBMyYIy9e9QHjC+l+zs7Gyx15CSO
         m1PgwPVkVz50pXPoilNB38l4gWMCna2TLW4htZvfGarsZXrFZKO1QFzP/khdOGSyYJGG
         KjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778097995; x=1778702795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO4ADo7z/ejk030p69Qyox+9T6YbJpVgw4i/wWrNUSU=;
        b=T/JdUIROHwr1MKaU44brLdObbe9WHwtO5MNz6iyDMr6OsvgjwqoPUbpSzUyvkQfo/B
         AcflqfiXyS3VYT5t1d0KSJ4Akjc5inxJnYTWO9SlImPpdMxhROGPJ7hHgZfx9SS2d5Vq
         I91eZKQc32GlrFAHPytprLbm239/EATAXwHg2xbRPtHlIofj6aW5dJJuD9CLgPFvZgnk
         lbhlcAWoKdcSo4g3JEjj1kW7N0eSLjI7dxCcVl032SuGbcFJf/4g8v9FCCCR7XdL6Yp1
         8KQKEGWJtUha6UaNmktsbAj9Ifr6p4y0aSFUTkuz4nKd2Ilf3rJulFgZj1j70sazQdEn
         ThbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+syC+FVN7cVGG3CipMc394aDjCwswH/dVgTKUJuZdu+SWEOEKXYvXHBj543QWSikU7s7TuLMxUBRL@vger.kernel.org
X-Gm-Message-State: AOJu0YwE/DDTJxGCSpFkzdopXgKCszZZ6Gu/6QyA2ciRNIaaYfkzj08V
	5iPLAdAFPpp9Z+C9ViV9NjPRx62Da3338ZG2oSTYKsHWa2VVRqtyqvn0NO/f2wi88Bhdl7W7fKZ
	Dd/VcK8muKNRhXrW8C5A1Vz2vRWdJ81HTAh5/TT5n62GFBGDSzj5H4vRcoVjJkMh8
X-Gm-Gg: AeBDieu8q6Ptfl6YVM1PAjAW69/rmXc84QMsiJF2ETmgnbxAKF/HFSAL1Ddjg82ZomK
	XqD5ugUgj0SXWZzUwn11jhpTd9msq5Y7oXGF3u4b0BVy7epKPopzTREuE5/nKZ9OmDuRPPCnbam
	Fwv7iQ6z+BoFkTGOd5BL1EQsNWoWNZ4qYzELjOxwg41zqEMtGhyH+EADKgPSizs6z5yuhWW8A8H
	ObzTP/+Av16SbadIJICySPUyFxcmhh6T0P4bqwQFiwWF/i51anr0w/PvHmxMP99Y+C8LhMY8huu
	5Y0ZU8SFpilsfs/DZSEcCw3Y2bwe//jHfWR4MqlhDVfTpl1IcdPEQATZ+hQJUNMZeKMJXfwHjm2
	oPsh9GJQkkTWBEVn4x9auyruCvr5J9wtTHkBWOfMZmqUJBl8zXOdPdt/DK4FHcGtk1u0gp5vMw0
	yWhKrdciCaN3kGDjzzFXPQ5Bm/Bh/SiLSqx503LNHbbJDX53f35pzrdCFt
X-Received: by 2002:a05:6102:84d2:b0:605:38d2:26cc with SMTP id ada2fe7eead31-630f9036c70mr1761189137.26.1778097995243;
        Wed, 06 May 2026 13:06:35 -0700 (PDT)
X-Received: by 2002:a05:6102:84d2:b0:605:38d2:26cc with SMTP id ada2fe7eead31-630f9036c70mr1761167137.26.1778097994655;
        Wed, 06 May 2026 13:06:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a881dcc668sm1634919e87.53.2026.05.06.13.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 13:06:33 -0700 (PDT)
Date: Wed, 6 May 2026 23:06:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, yangsunyun1993@gmail.com,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v4 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <zcteqdnovguyiae22jnittje4au5pcohdcyga5l5wk42v5rczk@5x2qs7x5tfq7>
References: <20260506095100.78998-1-syyang@lontium.com>
 <20260506095100.78998-3-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506095100.78998-3-syyang@lontium.com>
X-Proofpoint-ORIG-GUID: G1-xKTYPBoDBEdH2XtiPvUDY9pi5uLqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE5NyBTYWx0ZWRfXx9KRwpRlOCL8
 q7DYoC3EWtd8T4ts25fn1wWxWjtWSbAzgle30LItoMs44Q7pUH6TRAakKLTdhHUe9JQc1P5U2XQ
 6GVKj3kUOOgxgaSqHe9l73lfy+a05hOH/mKhG8AyqfDJWF3BotoocwNVqs/zfZSq6MWYXZoZCh5
 f0SlKNNKo5sh9JBt9x0jV1330ou1gIUbcZx+jreXU8uYxnPphOedEq/lwYEvqdbRYbIEq/Pyf5r
 VQIuNT3oPhVy9b6r3ffahtqxZH3FzGFEGLlUqA902dyMqT0vzUGgeZV+pPNwZSC+SxRWWAmFlSe
 n4Pa4uijDmGKPVNqkOKvxpZfSr7GSxnTCSnXuKkQSrlqm8z7MRnIoyxRpOSugbUs6O9KIsE5S7z
 3Z6+Ry3HaXcrX4l3upMChv2Mnvf7t3GL9NKXAxS9fL/sdETQP6949SgpgOK2HpcxGfRsCVolO9/
 DGTJBFw2HdlLj3JGDbQ==
X-Proofpoint-GUID: G1-xKTYPBoDBEdH2XtiPvUDY9pi5uLqe
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fb9f4b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Kz8-B0t5AAAA:8
 a=FAN-CsSX0s4W6alzs7AA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060197

On Wed, May 06, 2026 at 05:51:00PM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> mipi dsi and output hdmi, differences in hardware features:
> - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig           |   18 +
>  drivers/gpu/drm/bridge/Makefile          |    1 +
>  drivers/gpu/drm/bridge/lontium-lt9611c.c | 1211 ++++++++++++++++++++++
>  3 files changed, 1230 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611c.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index c3209b0f4678..32b85a2a65d9 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -177,6 +177,24 @@ config DRM_LONTIUM_LT9611
>  	  HDMI signals
>  	  Please say Y if you have such hardware.
>  
> +config DRM_LONTIUM_LT9611C
> +	tristate "Lontium LT9611C DSI/HDMI bridge"
> +	select SND_SOC_HDMI_CODEC if SND_SOC
> +	depends on OF
> +	select CRC8
> +	select FW_LOADER
> +	select DRM_PANEL_BRIDGE
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_DISPLAY_HELPER
> +	select DRM_DISPLAY_HDMI_STATE_HELPER
> +	select REGMAP_I2C
> +	help
> +	  Driver for Lontium DSI to HDMI bridge
> +	  chip driver that converts dual DSI and I2S to
> +	  HDMI signals
> +	  Please say Y if you have such hardware.
> +
>  config DRM_LONTIUM_LT9611UXC
>  	tristate "Lontium LT9611UXC DSI/HDMI bridge"
>  	select SND_SOC_HDMI_CODEC if SND_SOC
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index beab5b695a6e..92688be9692f 100644
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
> index 000000000000..3131f4a32dfd
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> @@ -0,0 +1,1211 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Lontium Semiconductor, Inc.
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

So, this file doesn't have any subdir (like all other Lontium firmware
files), but then you submit a file to linux-firmware with the Lontium/
subdir. Could you please settle on one location?

> +#define LT9611C_CRC_POLYNOMIAL 0x31
> +#define LT9611C_PAGE_CONTROL 0xff
> +

[...]

> +
> +static const struct drm_bridge_funcs lt9611c_bridge_funcs = {
> +	.attach = lt9611c_bridge_attach,
> +	.detect = lt9611c_bridge_detect,
> +	.edid_read = lt9611c_bridge_edid_read,
> +	.atomic_enable = lt9611c_bridge_atomic_enable,

There is .atomic_enable, but no atomic state management here. Was it
actually tested?

> +

-- 
With best wishes
Dmitry
