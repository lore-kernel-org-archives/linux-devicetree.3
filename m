Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF2B3F9FB
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768528; cv=none; b=qzw1ZUMSTMI+2XsbS4EFLubJnGxXHDZ8CiGH5kFUE7avFeOqBXi+CkCQk6AxSpY4I0dQrn6DbjT/i65v7t0CmA1kwBzKoyjX0Q58PewA2Hxos4p4+rO8T3RaZ7j67dOvGiMRXu5f15jV+hrI0jOKHkXjJP93wo1Oj+wyQA4nhAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768528; c=relaxed/simple;
	bh=m475hLuw6U6wSOl82bx8Me8xars1AC6HJG5AapPEa/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZoOgaw2Jy+z02pV3cuRyBvyvz4Fg3zCLum7+tva/5H7RMzb+RJV5e0UohWEGpYeTH3rQrPYnIz6Oho4kVEZGOI2uN6xi0GrCNeMNAzX0S3kxKUnSAKgWTC0ECHY/PGLZgzkAhWiRBCdDJjHJ+5dTjFRTFCZfUH7eBhsKbhVfb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nS7jfthG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6z1+RfO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nS7jfthG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6z1+RfO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L568Bw1013380
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4t45Lgn7dwXMmmKVbWR/ZBMaXSGMvVAOUfQkfld2OU=; b=nS7jfthGZHNXb7Mh
	Vdch+YKiQiidV8NXIWqdapD0YxAw49paKjfW7S5WhjOwn7AKEwjt+h4J/uO2A/Ov
	9sCqLS7ZYmabip9y8r2m5xU2pN72vWX5u5L33mFpDjNRtiuy28OQ7yheL4B5fmKh
	9NJ2oPoDUspp36TYCEiZgCb8TZKqjEKaRsc+XIfPy0eWRr+x3LrbyI7tNWQh1oUa
	rcgeVsu2nJEvY2w5RKd1WyoXTnpg/xPsnS88H27Ygkua409P206rDH/7uO7oxsrz
	TKUZMX0B9AviOjdbEhK7er1jmSK2oidb1xcRQqKi6FQXfRXk9BoSZCsgElyhGgHb
	IDWDFQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt902t6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:48:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-611af0d600bso1629193137.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768525; x=1777373325; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4t45Lgn7dwXMmmKVbWR/ZBMaXSGMvVAOUfQkfld2OU=;
        b=F6z1+RfOtPl8ZgAmsvq/AMGhlhMWI6gTOdZjsagmdb87Q7Xhx08V3z1pjIGXF2+Fvt
         XTyqJWvKV+whn4SD63RnBwcju9jeXn15uBaM34/I4FKQE2LIpJ7vvTjqarjCcwuoq0Wg
         w5WXpVBeLM7HcynsuKkhgDoYCKhdl6883/rW450+OPgaFuCAu5ANrTXjRIAU9jaE2Z/z
         lcN6p5pFBps/ab9qb41FnFDFhAaKS8WvAlRLsJf40ocsmk+dkJXKaD6YPaGTadfhx6UW
         Kxt3jZUw6qgaZYXLvdPgYjQYAouzhxwadUkniio7M116tLvW25quI4YwzyYoeA2qvuEc
         Bg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768525; x=1777373325;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4t45Lgn7dwXMmmKVbWR/ZBMaXSGMvVAOUfQkfld2OU=;
        b=SPSBM9i/xKMqNiEOz1mknNh1FTcN3ydfzuCOAri2buoMzSRlo8vEeB5XFysq3WYKQQ
         htW6axPmB+XpWDEifumdq2kGuKJwI0Xq1xd/yaoEDc+uHjsujwXdluBWRzuCRzgmvsV1
         ypUoBrc8JHTLfDXyDInGqBWZhWpNL/TgdKAdcW84DNn0Y6qGUPCffhwrvQGGfYwuwaPr
         NI5K6zeflRVQ1H32BZjm9uZ4RbsNy9hcwmOdRz9uAgbgMEssyU8AF3FWZwdlNvqtzzqP
         TE1EncHQ5yUKaX9Gc1Y1y82hPTZoiYHXh5abT06500Hs0HMaPO5sQzxyvF4WgmYSeQ7y
         mmwA==
X-Forwarded-Encrypted: i=1; AFNElJ8jbGV0hse4L0QJwtWVbyCL4DbOI66kREt7gDNiiNT84p6nGQ1m8PWEGoTJ1nkXOOo4i/u3VpG1aksP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3m+OCqsojfecmqY0H7xTsiAehF50oWkzycVjuFwNrqU3eIupr
	ntS9k68/nNOrjsU9gqsF9T3OJWXgNEUAKdxnHtTxSnbvh1UEnCovIQJTYYDWCwFCQ6Iqu0bgESg
	dC/Mym9Z94AnMzTnFkunC9ju35JYarr4sv+4D0rp0oV1KdnPx36DHP8p0uGoXY/4l
X-Gm-Gg: AeBDiesldxJqIOscYSbrKiyEKck8S2y+zdNYaCwHcRhRNOPQBNzIR57b2G3Zkt4tXyo
	r7NhIsuXxydMAKdBonHMJUZYpEDeZpL3eoZD0/UMT8+dOvCQCdC9qtDeEVJip9YQfhNlPkp3q/b
	e18jGgVAuozyTURZBPeGFGMZGpuc7FyxLj16TFdhzQsJgCSwTgP9IlPR+z+9ArZab06/v6tbiWK
	3TFK8v3twcHZNv5baWnxp28OEbbhaiKKJ15vqk4g/cu/CtB02RTlvrJqrGrLslwpI5AoASiGY7m
	rvIH1IOG6zmbHI1d7Bx4PDN0jyuQ4lLXISu95wYqUksttaldoP90VnRv4t8F/MYFWqRuqP1CiRX
	RatnsHLYuFX3eG78FNPvBcou6MRqSWJArvnTRJQjDpTUSg0mdrOnvtFeOC7/lHNXHUGtDg6G+Ro
	05748o2crdfQQAQUgmXZcqFQ6+ujvhYwM16XbDRlmMtQG+tw==
X-Received: by 2002:a05:6102:5124:b0:609:2cf6:51d8 with SMTP id ada2fe7eead31-616f4546f50mr7665091137.3.1776768525070;
        Tue, 21 Apr 2026 03:48:45 -0700 (PDT)
X-Received: by 2002:a05:6102:5124:b0:609:2cf6:51d8 with SMTP id ada2fe7eead31-616f4546f50mr7665075137.3.1776768524453;
        Tue, 21 Apr 2026 03:48:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5591sm28516331fa.5.2026.04.21.03.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:48:43 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:48:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, mripard@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        xmzhu@lontium.corp-partner.google.com, tzimmermann@suse.de,
        xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v3 2/2] drm/bridge: This patch add new DRM bridge driver
 for LT9611C(EX/UXD) chip
Message-ID: <mvthlwcekj6i2h7bi5lns7ycictafjjyninvubp6adgaqxchkz@372c36cxon5t>
References: <20260420061644.1251070-1-syyang@lontium.com>
 <20260420061644.1251070-3-syyang@lontium.com>
 <stkoeboxioodtki3nyksdglihgze243u25ui7dbyac4tuuobgx@ncl4j6l4vfqh>
 <CAFQXuNYXP1fiJtUiMb5iBL=jVXTB8HX8JLzto_eGOZvUaeZkfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNYXP1fiJtUiMb5iBL=jVXTB8HX8JLzto_eGOZvUaeZkfw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e7560e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Kz8-B0t5AAAA:8 a=QNpe9V7w-6MnJwGHkaoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: YZfb8q_bclSFzYRvZgIDX9lV8mHFQ4kv
X-Proofpoint-GUID: YZfb8q_bclSFzYRvZgIDX9lV8mHFQ4kv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwNSBTYWx0ZWRfX7issV+D5QeNM
 ddZ6ReVZTHB6ubsHgwgTFaymzlBSGHdaBkk1JLH0uDHwnjW/YgjzuVxbrJJYaT/IZtPb+yF9I99
 +hG5QA8VOQurHfYEbWeDvUst0xuwyWx4B3eVI+KkIJYBjzacNiQIpv7iE99Jx/yB2sgGwR/ynSm
 Pz5vRcOez60KwleDO582/HxjAt2vpfjrRC0ifYFIvRxz3mpYPECbQczqsgAH8WQywh2WmHqGP0X
 TrQGQMtDYk7MGNdFENY4eqGCkDXXftqScMJfDWIMdmAIVpcPTa9UPUA/3C32I0QF72pJfg5WhhP
 2Sjw1c0MlSdeeNfWRPkogBWIQDnSTZ5/729dKLipyKx/Cxa0gL9NDtMu+uToyvdG6HUuqxPNj10
 xsVzoYWEF5scjsZsVAqC6ROzGuvUjliZeDTo82a9117qyyDfDnUBcDdPrE3hbL5FIPEV+8Sh91l
 0UL1xsolD4b4piJW9ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210105

On Tue, Apr 21, 2026 at 03:37:52PM +0800, 杨孙运 wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年4月20日周一 20:18写道：
> >
> > On Mon, Apr 20, 2026 at 02:16:44PM +0800, syyang@lontium.com wrote:
> > > From: Sunyun Yang <syyang@lontium.com>
> > >
> > > LT9611C(EX/UXD) is a high performance Single/Dual-Port MIPI to
> > > HDMI 1.4/2.0 converter:
> > >
> > > -Single/Dual-port MIPI DSI Receiver
> > >  1. Compliantwith D-PHY1.2&DSI-2 1.0
> > >  2. 1/2configurable ports
> > >  3. 1 clock lane and 1/2/3/4 configurable data lanes per port
> > >  4. 80Mbps~2.5Gbps per data lane
> > >  5. Support RGB666, loosely RGB666, RGB888, RGB565,16-bit YCbCr4:2:2
> > >
> > > -HDMI 1.4/2.0 Transmitter
> > >  1.Data rate up to 6Gbps
> > >  2.Support HDCP1.4/2.3
> > >  3.Support CEC,HDR10
> > >  4.Support lane swap
> > >
> > > -audio
> > >  1.sample rates of 32~192 KHz and sample sizes
> > >    of 16~24 bits
> > >  2.SPDIF interface supports PCM, Dolbydigital, DTS digital audio
> > >    at up to 192KHz frame rate
> > >
> > > -Miscellaneous
> > >  1.CSC:RGB<->YUV444<->YUV422
> > >
> > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > > ---
> > >  drivers/gpu/drm/bridge/Kconfig           |   18 +
> > >  drivers/gpu/drm/bridge/Makefile          |    1 +
> > >  drivers/gpu/drm/bridge/lontium-lt9611c.c | 1365 ++++++++++++++++++++++
> > >  3 files changed, 1384 insertions(+)
> > >  create mode 100755 drivers/gpu/drm/bridge/lontium-lt9611c.c
> > >
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > index c3209b0f4678..32b85a2a65d9 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -177,6 +177,24 @@ config DRM_LONTIUM_LT9611
> > >         HDMI signals
> > >         Please say Y if you have such hardware.
> > >
> > > +config DRM_LONTIUM_LT9611C
> > > +     tristate "Lontium LT9611C DSI/HDMI bridge"
> > > +     select SND_SOC_HDMI_CODEC if SND_SOC
> > > +     depends on OF
> > > +     select CRC8
> > > +     select FW_LOADER
> > > +     select DRM_PANEL_BRIDGE
> > > +     select DRM_KMS_HELPER
> > > +     select DRM_MIPI_DSI
> > > +     select DRM_DISPLAY_HELPER
> > > +     select DRM_DISPLAY_HDMI_STATE_HELPER
> > > +     select REGMAP_I2C
> > > +     help
> > > +       Driver for Lontium DSI to HDMI bridge
> > > +       chip driver that converts dual DSI and I2S to
> > > +       HDMI signals
> > > +       Please say Y if you have such hardware.
> > > +
> > >  config DRM_LONTIUM_LT9611UXC
> > >       tristate "Lontium LT9611UXC DSI/HDMI bridge"
> > >       select SND_SOC_HDMI_CODEC if SND_SOC
> > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > > index beab5b695a6e..92688be9692f 100644
> > > --- a/drivers/gpu/drm/bridge/Makefile
> > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > @@ -16,6 +16,7 @@ obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
> > >  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
> > >  obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
> > >  obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
> > > +obj-$(CONFIG_DRM_LONTIUM_LT9611C) += lontium-lt9611c.o
> > >  obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
> > >  obj-$(CONFIG_DRM_LONTIUM_LT8713SX) += lontium-lt8713sx.o
> > >  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> > > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > > new file mode 100755
> > > index 000000000000..a6d11d0bddf5
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > > @@ -0,0 +1,1365 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> > > + */
> > > +
> > > +#include <linux/crc8.h>
> > > +#include <linux/firmware.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/media-bus-format.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > > +
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_connector.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_edid.h>
> > > +#include <drm/drm_mipi_dsi.h>
> > > +#include <drm/drm_modes.h>
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drm_print.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +
> > > +#include <drm/display/drm_hdmi_audio_helper.h>
> > > +#include <drm/display/drm_hdmi_state_helper.h>
> > > +#include <sound/hdmi-codec.h>
> > > +
> > > +#define FW_SIZE (64 * 1024)
> > > +#define LT_PAGE_SIZE 256
> > > +#define FW_FILE  "LT9611C.bin"
> >
> > lt9611c_fw.bin
> >
> will use lt9611c_fw.bin in the next version
> 
> > > +#define LT9611C_CRC_POLYNOMIAL 0x31
> > > +#define LT9611C_PAGE_CONTROL 0xff
> > > +
> > > +struct lt9611c {
> > > +     struct device *dev;
> > > +     struct i2c_client *client;
> > > +     struct drm_bridge bridge;
> > > +     struct drm_bridge *next_bridge;
> >
> > Use drm_bridge::next_bridge instead.
> >
> it will be fixed  in the next version.
> 
> > > +     struct regmap *regmap;
> > > +     /* Protects all accesses to registers by stopping the on-chip MCU */
> > > +     struct mutex ocm_lock;
> > > +     struct work_struct work;
> > > +     struct device_node *dsi0_node;
> > > +     struct device_node *dsi1_node;
> > > +     struct mipi_dsi_device *dsi0;
> > > +     struct mipi_dsi_device *dsi1;
> > > +     struct gpio_desc *reset_gpio;
> > > +     struct regulator_bulk_data supplies[2];
> > > +     u32 chip_type;
> >
> > Define a enum. Having if (chip_type == 2) doesn't help readability.
> >
> it will be fixed  in the next version.
> 
> > > +     const struct firmware *fw;
> >
> > Please drop it from the global struct. It is not necessary once the
> > bridge is up and running.
> >
>  Remove from struct.
>  I need use fw  to calculate CRC8 and update the firmware.
>  Can I use a global variable for 'fw'?

Of course not. You need the struct firmware and CRC only when reflashing
the firmware. Pass them within those functions as arguments.

> 
> > > +     int fw_version;
> > > +     u8 fw_crc;
> > > +     bool hdmi_connected;
> >
> > You've lost the imortant comment here.
> >
> comment about hdmi_connected ?

Yes.

> 
> > > +};
> > > +
> > > +DECLARE_CRC8_TABLE(lt9611c_crc8_table);
> > > +
> > > +static const struct regmap_range_cfg lt9611c_ranges[] = {
> > > +     {
> > > +             .name = "register_range",
> > > +             .range_min =  0,
> > > +             .range_max = 0xffff,
> > > +             .selector_reg = LT9611C_PAGE_CONTROL,
> > > +             .selector_mask = 0xff,
> > > +             .selector_shift = 0,
> > > +             .window_start = 0,
> > > +             .window_len = 0x100,
> > > +     },
> > > +};
> > > +
> > > +static const struct regmap_config lt9611c_regmap_config = {
> > > +     .reg_bits = 8,
> > > +     .val_bits = 8,
> > > +     .max_register = 0xffff,
> > > +     .ranges = lt9611c_ranges,
> > > +     .num_ranges = ARRAY_SIZE(lt9611c_ranges),
> > > +};
> > > +
> > > +static int lt9611c_read_write_flow(struct lt9611c *lt9611c, u8 *params,
> > > +                                unsigned int param_count, u8 *return_buffer,
> > > +                                unsigned int return_count)
> > > +{
> > > +     int count, i;
> > > +     unsigned int temp;
> > > +
> > > +     regmap_write(lt9611c->regmap, 0xe0de, 0x01);
> > > +
> > > +     count = 0;
> > > +     do {
> > > +             regmap_read(lt9611c->regmap, 0xe0ae, &temp);
> > > +             usleep_range(1000, 2000);
> > > +             count++;
> > > +     } while (count < 100 && temp != 0x01);
> >
> > read_poll_timeout()
> >
> will use  read_poll_timeout() in the next version.

Or a more suitable definition from <linux/iopoll.h>. Please check those
and find the most suitable.

> 
>  > > +
> > > +     if (temp != 0x01)
> > > +             return -1;
> >
> > -ETIMEDOUT
> >
> return value of -1 means the chip did not receive the operation to
> write 0x01 to 0xE0DE.
> Below:
>      if (temp != 0x02)
>             return -2;
> means the chip did not receive the operation to write 0x02 to 0xE0DE.
> 
> -1 and -2 help us determine where in the code the error occurred.
> If both return -ETIMEDOUT, it would be less friendly for debugging
> when we encounter issues.

Inside the kernel it is expected to use drm_dbg instead of returning a
case-specific return codes.

> Please confirm whether I should change all of them to return -ETIMEDOUT.

Yes

> > > +
> > > +static int lt9611c_hdmi_clear_audio_infoframe(struct drm_bridge *bridge)
> > > +{
> > > +     return 0;
> >
> > Hmm? What if we need to clear the infoframe?
> >
> don't need to clear the infoframe.
> 
> can remove.

No. We need to be able to stop sending the infoframe. Please implement
those.

> 
> > > +
> > > +static int lt9611c_hdmi_audio_prepare(struct drm_bridge *bridge,
> > > +                                   struct drm_connector *connector,
> > > +                                   struct hdmi_codec_daifmt *fmt,
> > > +                                   struct hdmi_codec_params *hparms)
> > > +{
> > > +     struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > > +     u8 audio_cmd[6] = {0x57, 0x48, 0x36, 0x3a};
> > > +     u8 data[5];
> > > +     int ret;
> > > +
> > > +     /* Validate sample rate and width (LT9611C auto-detects but we still check) */
> >
> > What for? You don't trust ASoC / ALSA core that the rates would match
> > HDMI_RATES?
> 
> Chip has limitations on sample_rate, sample_width, and fmt, and cannot
> support all formats.
> The validation here is to ensure that only the formats supported by
> the chip are used.

Again, for sample rates, is it different from HDMI_RATES? If not, it is
useless protective coding.

> >
> > > +     switch (hparms->sample_rate) {
> > > +     case 32000:
> > > +     case 44100:
> > > +     case 48000:
> > > +     case 88200:
> > > +     case 96000:
> > > +     case 176400:
> > > +     case 192000:
> > > +             break;
> > > +     default:
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     switch (hparms->sample_width) {
> > > +     case 16:
> > > +     case 18:
> > > +     case 20:
> > > +     case 24:
> >
> > and no support for 32?
> >
> no support for 32

Then check for that rather than listing all the widths. If you check the
hdmi-codec, you can't get 18-bit samples at all.

> > > +MODULE_LICENSE("GPL v2");
> >
> >
> > I think, checkpatch.pl should have flagged this.
> >
> yes,  it is need use GPL?

If it flagged the line, why didn't you fix it? What did checkpatch say?

> I see that many of the latest code still use GPL v2.

-- 
With best wishes
Dmitry
