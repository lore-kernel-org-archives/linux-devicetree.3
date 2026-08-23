Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013B538DC46
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787489725; cv=none; b=fNTAF4igX9zxzr+iBVboji9zK1ppiOtEoDL2SNd4UwwV47hikfpKVXvR7LPsEm0blG0KOIqcXbac/uY4E/YXXcVYkozjuVsZ4elUXzT/Z78ZcWr5uJoqdOR24Vk03RmsZpCwJYFsZL0ZcE/T3gtLD8yDIV4QGwdYefEQ9kc3kyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787489725; c=relaxed/simple;
	bh=7H+QRnVkp5spW6VNF16Q8SehioK5tX6/Szt3426/OUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pT7nq8eOb2E79wC1ooJ86NgJtEzzq1Bn9/a1xUrqeMOufYSO0X12G8RuxawMZm+ec3ILBoKhz/FrgpwZ3tboac2IJXMHbUx4RT8/4FOx6mguiXd2cGIKFd2dgnI14f5wJ39Y+RxXxmI9kQGa9ZUNPLkXPiOGBC+eW7xNKMouMLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfBe743C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu/BowuR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfBe743C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu/BowuR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67NAA5oZ698419
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 12:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rWtDIrQYEyI6JicjlZo1CV9b
	6jk+qjMeQz26se4HqAY=; b=TfBe743Cs+W1oBb77dg0jwDuip5GwO7na2ocqDX2
	cgdkBmLKpqwgPzbmijLZ58YEDkux5/lSo6YWhldinYkaeP1cEwC2IdL86NiwXKCu
	JXbPmAa8PaAEzoe8EbfVLgLNuR4Y/HOzWV3kN40Eh86u9VVy3dha5PjYn4BznVeP
	HA7+4k8PmTN8ROvdbpg0kE3K1QjhZMQegTbx3mfGAlmoDa7hlzZIcY21Viat3Dqs
	L+3MdxYYtpcymSWlcQffRBEeL3sWRaglVaMKbpaAfJ2fJ3geyjG/w3FEgredWzG3
	XxC/nSGyCvpRApwaqncIfw+YnjEPK4mfADgBae86ybCzNQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g743xkdhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 12:55:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so4231181a91.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787489722; x=1788094522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rWtDIrQYEyI6JicjlZo1CV9b6jk+qjMeQz26se4HqAY=;
        b=Hu/BowuR59wLy2/kP8x3YYOXXO7ev8DZzuM8VDBR9nUF3GJ8CuRiIgbBeeL18i1wBk
         bnTrypjOalenR1Ec6Pc8CPQPMJ4n7FvpIEy2OQ+lUco7OveGXbdImXq97EQSo2E+mFGY
         8QB4yVcnh9w7x42FXySxwsYA5Hz+DFq2iwIWd7QvMmWqzL5JNANdtTOTdJbJua9igNKz
         7JGWV0h8sU3IWHcSjKkZleZw5yn5nHPPGgML77KyzfIYAmP3gtH1Q3Et/TbdDlG0EZaM
         rkih+2oHTlqTH9uTxQblaujWykcQeetM0I1eDxNIiQ1OzUQZl5ygYIj7n9V6hxN42suz
         c51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787489722; x=1788094522;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWtDIrQYEyI6JicjlZo1CV9b6jk+qjMeQz26se4HqAY=;
        b=kMGGJ1Oltz/WyEGkhhg6kzouY+pF5TW54Hq+1JN7Gx4sErRMMtF1Zec0k7vX8Ptpc3
         iYZCyb51TrEi+/4Cw7VlfiH2PXzwq9q0iohE7H/KGGgc8+2GF+iwawdV/lx0QFyX2baQ
         nT3+DWnXEWd6ZchG7Oc2F/K209i9FgcrwL0Bf8sVC1Gn4wuzCU8yabr+tmTj2nUmOwFS
         yGvaTwGj+2YWnmXLDhZqXPC4ruAL4H5W3DL2fjxwUgPbyL5kP/PktAPKjdRFbYlFygIE
         wSCJXB37fhRQu/dRwXDn1Hwx8m+8I0fcjURMuSMwl/VbSJEiPn/VmGqR6ENARaFQMVLk
         sPwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7ucnC1e91gfRMpKm4xzTUbWoNQtz/pKuEWr9z8Zi5Kd70AkDRsm+CusFTwozF3ulyXe+ECyqTRr85@vger.kernel.org
X-Gm-Message-State: AFuF++lJHamH1fMxTKcGrSmizLOc6vuMpUAMdg9Bd5/ZTL9uSAFEt1AB
	LBg0H85ljBChH3G7bPw4NXB0JJEUgVuz/j2RkyaDUPC7aPm1y4cdja6HalT28aO8Ui9t7KWyqPb
	8ggqi/hKJ3q5sPPyMwwGo/yepBzDcNAQ9QsRNK6lx4AJBTr4BKOLz5sZMmXnOzF5A
X-Gm-Gg: AR+sD10lg4XzRonrh3il51VlzZiCPKq8oBoNhLMQew8l+EaQGPPKRtjRLKkb1OA2oCV
	V9GuGlNzEGSmTU/DYTdL1dizX2QLBsX95Sn+9dszVKm2nH+j8NfeESWrFNmNBuqX6+UAiHSKNwu
	dDhkug3srxpCTIDI9BHXegDyoHxw6NPLuvXGJKd9XFfHOLPZuzMhblqcuuPWye5ZPDviq9/ZQvj
	PfwAnqaAtE5kPMSb6PTw2PWnlsuVg0vDKnnBWI8faTpqlWBjOo3aKylUDu71GgU6gzxryOs5vsf
	WblQp4IaSFZuEODAgdXCZANJGV1Pd6UUyn1qf7V9w7/1ca6ICeKr48h3nTSI3Rbf8XH3TkjwJaN
	yIt56+na9wB4EXuifK+NDl3nmvw==
X-Received: by 2002:a17:90b:4b02:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-395df2595femr18223921a91.10.1787489722289;
        Sun, 23 Aug 2026 05:55:22 -0700 (PDT)
X-Received: by 2002:a17:90b:4b02:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-395df2595femr18223837a91.10.1787489721847;
        Sun, 23 Aug 2026 05:55:21 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14186173199sm15411282c88.9.2026.08.23.05.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 05:55:21 -0700 (PDT)
Date: Sun, 23 Aug 2026 18:25:11 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <aortr3FLsAMxcVXs@hu-mdsor-hyd.qualcomm.com>
References: <20260808-lt9611c-v7-v10-0-ee90a136d82a@oss.qualcomm.com>
 <20260808-lt9611c-v7-v10-2-ee90a136d82a@oss.qualcomm.com>
 <uuuph37ftuyuqpbayqbotnsqgqn367ytdam627jl3cqcxkzana@xq2pky3dobyx>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uuuph37ftuyuqpbayqbotnsqgqn367ytdam627jl3cqcxkzana@xq2pky3dobyx>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIzMDExNiBTYWx0ZWRfX8AETxFC4sMcp
 5KXM9JffIkEpDASPxGEulpO37AiUjXr9JAFbei0SHNVN81y37phX3dfjTt+CBL2D6vQv+1KAWiM
 OnXaG/qH6nWjgQEVFrzJR27ialS6a9c=
X-Authority-Analysis: v=2.4 cv=HYckiCE8 c=1 sm=1 tr=0 ts=6a8aedbb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=pMoGBK1uSPhNkBhojBIA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: d5jmh1lc6iGHiYRTrnYq2hiV8iR9dL3p
X-Proofpoint-GUID: d5jmh1lc6iGHiYRTrnYq2hiV8iR9dL3p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIzMDExNiBTYWx0ZWRfX3VpR2Zuqs0a5
 wT3PRRDhRQ0KTNG4bRKuSVRh4oH9tQYSpv/Fz8OQVsokM6JS3hoEGZUVE1bbOtK2VxPEsbZDJIU
 hJIKqD7+Nj+jXxuctP7BbsH++nQqo7llOCfuFmG1EvI3RcSOaobAQQVhs9/OwjPp0ilk56vlwW5
 tIWD0zRN51B9r8le+Qk0ll8G/m+sXWo4jySS5E4f3iM98JxzPr+ZN9QMUljgHdTS11eNwGer06L
 2B38QBppeEKg+FP4neqDoRHGSrXQgb/rPYPYKk5ibgGi6Mp5TU3NHx3FTEfPqsoDP0P6DkP1sMO
 ZQcB8XalMJsbNoZDnRZ6Ka/bChplD9UTNgcH2SJdXUBX/3LF3jglCixnHmWJZJXJE+BARniIOmf
 izx9WsQJie6as5ZEl606DHHtDDfiKH0CakTqiL/o4eUg5OnfMr/ak88TKw1KP/T2B0qFm5SF+VL
 71CtBGVQifHlWCFtk3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-23_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608230116

On Wed, Aug 19, 2026 at 12:49:53AM +0300, Dmitry Baryshkov wrote:
> On Sat, Aug 08, 2026 at 01:37:51PM +0530, mohit.dsor@oss.qualcomm.com wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> > 
> > LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> > mipi dsi and output hdmi, differences in hardware features:
> > - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> > - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> > - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> > 
> > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > Co-developed-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > ---
> >  Documentation/ABI/testing/sysfs-lontium-firmware |   10 +
> >  drivers/gpu/drm/bridge/Kconfig                   |   18 +
> >  drivers/gpu/drm/bridge/Makefile                  |    1 +
> >  drivers/gpu/drm/bridge/lontium-lt9611c.c         | 1283 ++++++++++++++++++++++
> >  4 files changed, 1312 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-lontium-firmware b/Documentation/ABI/testing/sysfs-lontium-firmware
> > new file mode 100644
> > index 000000000000..8700933ba0f0
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-lontium-firmware
> > @@ -0,0 +1,10 @@
> > +What:		/sys/bus/i2c/drivers/<driver>/.../firmware
> > +Date:		July 2026
> > +KernelVersion:	7.3
> > +Contact:	Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > +Description:
> > +		Read: Returns the current firmware version loaded on the
> > +		Lontium bridge chip in hex format (e.g. "0x0105").
> > +
> > +		Write: Triggers a firmware upgrade of the chip using the
> > +		firmware file loaded via the firmware loader.
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index 4a57d49b4c6d..d1597548e578 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -177,6 +177,24 @@ config DRM_LONTIUM_LT9611
> >  	  HDMI signals
> >  	  Please say Y if you have such hardware.
> >  
> > +config DRM_LONTIUM_LT9611C
> > +	tristate "Lontium LT9611C DSI/HDMI bridge"
> > +	select SND_SOC_HDMI_CODEC if SND_SOC
> > +	depends on OF && I2C
> > +	select CRC8
> > +	select FW_LOADER
> > +	select DRM_PANEL_BRIDGE
> > +	select DRM_KMS_HELPER
> > +	select DRM_MIPI_DSI
> > +	select DRM_DISPLAY_HELPER
> > +	select DRM_DISPLAY_HDMI_STATE_HELPER
> > +	select REGMAP_I2C
> > +	help
> > +	  Driver for the Lontium LT9611C(EX/UXD) DSI to HDMI bridge chip.
> > +	  It converts single or dual MIPI DSI and I2S signals to HDMI
> > +	  output. Supports HDMI 1.4 (LT9611C/EX) and HDMI 2.0 (LT9611UXD).
> > +	  Say Y if you have hardware using this chip.
> > +
> >  config DRM_LONTIUM_LT9611UXC
> >  	tristate "Lontium LT9611UXC DSI/HDMI bridge"
> >  	select SND_SOC_HDMI_CODEC if SND_SOC
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > index 15cc821d85b7..f322f3f89f6b 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -16,6 +16,7 @@ obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
> > +obj-$(CONFIG_DRM_LONTIUM_LT9611C) += lontium-lt9611c.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT8713SX) += lontium-lt8713sx.o
> >  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 000000000000..e6887f2c89a6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > @@ -0,0 +1,1283 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/crc8.h>
> > +#include <linux/firmware.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/unaligned.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/display/drm_hdmi_audio_helper.h>
> > +#include <drm/display/drm_hdmi_state_helper.h>
> > +#include <sound/hdmi-codec.h>
> > +
> > +#define FW_SIZE (64 * 1024)
> > +#define LT_PAGE_SIZE 256
> > +#define FW_FILE  "lt9611c_fw.bin"
> 
> Lontium/lt9611c_fw.bin
> 
> With that fixed:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Thanks Dmitry, will fix it and add R/B tag.
> 
> 
> 
> -- 
> With best wishes
> Dmitry
