Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2164143C046
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380645; cv=none; b=o8XT0dHlb7FDgn1aZf//KAvBURw2t0m2CY7m7E95dAKkRiXXNFrpQWAfvVH1J+yBW1wzXuXlkfpXAxx1boqazCr1/x0I6W5UkvYh3GtDsDGGZEsd/3+tawcWEQlyXRUFI6XdVz9g/5q5UbtMYMkxs6uCWvNSzOjc7whmhcOJobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380645; c=relaxed/simple;
	bh=pAwr7ayk0V/tlwNCnYRSBDA8TAi1RcahEaozrrkh5R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nX4dsVjss1iJ8QhLc3ujwD57ulT8cKHlzPAp01rjxr4VMnm84V/xAbiCq81DByLMDWreFE3U3VLkejvCxW1L5mzqeMB1FHflQcGybruHj00f1i6YVn5Io7ERhY/mfaLW5k12rQ8++W8g0Y7CxR9m+dZLXRLmLtpA6dBO5E9nkyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqCSj7QM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LH0Jg3nE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqCSj7QM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LH0Jg3nE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SBgkxk1625116
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2zv7YjboLNX5OIPh/Lp4HnJi1K9lh7I+BCrXXl8Atq8=; b=VqCSj7QMgVw245+v
	uVaVAvzSCkXtWwWt4a/+jaMqjNcIzp69jqP0mTZmZU+WGuxIsoeFQI/PJUAX1GCj
	SlYISJh44WI5tVwMNuC+XAj+wCxEz5genVNd4VLDN3G+6C3wm3UTUG+WlBTvE+53
	z13o/vssK0eBxH7Wmsev9oHPwkyNG6kaEWXIPhuGSv67TSCeatzRly5y/4+o+ppY
	gUEmPNMB/ZCwvCSedJPb9W3eIk/BXiW2hMvUIpNmZqkuvpPJGh8sq5vIk888soHG
	63UdiXEqX84v19jDt+o4wIEwVoxbVVxybaQvxFxyP5XXGrVDjXpOmQKsbPTruFwL
	vEj2Ew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsb0yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:50:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso102012451cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777380640; x=1777985440; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2zv7YjboLNX5OIPh/Lp4HnJi1K9lh7I+BCrXXl8Atq8=;
        b=LH0Jg3nEMP68UFg9wQlwLMw+drIz323HkOCNEpVts9BaKF4M6MBkJJBpDpahxKsADW
         cKX7eSHF2kyMR+2IWe7sNRACQ+2UPkR2AtVkM9m4ZUWHLP9JelfIErdRWyw4MliT1Ano
         ALNbVjZfi1wPAeCH0CuI3Sme5AELEh5UlCbvUFJgiNKGvVFo5/A/DnDE/Re5VQ73Jaat
         7MuVjllLLhKEAJLt2u+YhZaRi/8Ytv3Glp8NUwh8H8e8BljQ4PQlAFxwWYCXDkxY2uUa
         Afx54Ay7cfXBRYIjC7kGqyQT/eNJUMmiAk3LqRUj2iZXNXDzxdKYm75sJvx6vV/IOAbJ
         LdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380640; x=1777985440;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2zv7YjboLNX5OIPh/Lp4HnJi1K9lh7I+BCrXXl8Atq8=;
        b=JisAmvn/kXvpxsdAfcvyP60qvkkt2W7CYQXlN9JvD+SfpG5tVlBeiQiA8ABGg4d2Qy
         4lEWkS+bHQehH0aS5LJibFiW9YJgGr2rR6a/DNsN7QpX6dC3RHRt7VChouewoL7vuEfC
         xxyT/0lA1sS/67spyyhKyGD8rTrwWxDrd/i4XYOUX2SSlU53rIsu/E6S6zelIF+xjgw9
         5lbEFSnMG1eIozwNoTaJFA+1D0Krs4JUq2FvJPbUaJ+g+o/r4nRBkjpVSpppfL9NNcyJ
         fbnWUE/yi3qTwjF8CX53zUXQc4NwJV9bS1kCLaF3d1Jl/mp7SihXaoDf16zPFaT2N/xv
         lxBw==
X-Forwarded-Encrypted: i=1; AFNElJ9dzj8J91syV65pO5SLhwM+Hsdxk1YkD7HCkDXp+Upb5JViox1dD9PmHE9v5IfqwNaD7r2rcvkkxsYl@vger.kernel.org
X-Gm-Message-State: AOJu0YwrQCGTSCvtzCbGcc0V4XL4qzz/qICgcu1TzvPXBraEQf2Cqxal
	69rJ1CDw8b9v3dGHUBzNlOQiOJwpE9fHoeHogDDS2Wv0Mkr9bMt1jZ8PxwGYlX8GcGMPQB+1Pb0
	LCyMduMRmYP82Vb/6AOMNgKnZmAxHlMHnE+RpNffapwaa1WTRS/qWTizRdAbA4/lJ
X-Gm-Gg: AeBDietzXa1iqFkQgEzUYNBNpmRs8Pt04wYnDdeKRnrTQaK3j6z/dIl4g2DoQdjELqO
	X5vxb5X4uZa420c40/KrEJYjnvSDhFQso6OTAbSHReqp4rH2ERhAlhTOXSzKy5MgJTpuyd5VB3a
	tmUIcj9Vkv3ijW1/KRX9mV0JMTKkBWEHZIbYDw7HUUy4CP/HtT25rAaf7nPYGIETR4z/6eA/IpC
	ngBz3tIBvKc7qz+UNnZB8axTPQ6yryzeD9OksQwpfiCNsZ1KcPYHdjMlzcQoEwD+ioh3qt69gTX
	UE2t4jMDvcrFhOD4f3ms89anSvwQfEbZfT7vROmFDC8KXvYU1+YgukGOrJEhRMDzG0MvAmJb72A
	6erV9btGgalFy0HiHwCk9FNqR855WU1pb15mMRf4FB+n7rraZcNGaSle6BjK8H2wpOcgG6kmcAR
	/d8kaKGPXHV81DttajZDyxDDOTpu4YlStMh6Htxg33gNO3Kg==
X-Received: by 2002:a05:622a:996:b0:50f:b494:7887 with SMTP id d75a77b69052e-5100e20201bmr35852401cf.51.1777380640268;
        Tue, 28 Apr 2026 05:50:40 -0700 (PDT)
X-Received: by 2002:a05:622a:996:b0:50f:b494:7887 with SMTP id d75a77b69052e-5100e20201bmr35851781cf.51.1777380639579;
        Tue, 28 Apr 2026 05:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5f03sm593888e87.51.2026.04.28.05.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:50:38 -0700 (PDT)
Date: Tue, 28 Apr 2026 15:50:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, mripard@kernel.org,
        Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v1 2/2] drm:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI
 bridge
Message-ID: <pwwozhtttczv56bekqjl4vxrueqfblvjjjnnjnvuqlw2qahqlh@2yhvlnjsiqrv>
References: <20260428063224.3316655-1-syyang@lontium.com>
 <20260428063224.3316655-3-syyang@lontium.com>
 <ygxqqtql2puvej5bkmac3vhlwd4lv2f4mcjim2ornq5gj7rsoo@6zfnqckp2d7a>
 <CAFQXuNYV_Jzi26FN23b8zgw-UEsgheo8R4OVzz2TG4YZnJoYcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNYV_Jzi26FN23b8zgw-UEsgheo8R4OVzz2TG4YZnJoYcw@mail.gmail.com>
X-Proofpoint-GUID: LDDcPHrZfqTRo7rq2wpPBKlTBZdfuaQx
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0ad21 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Kz8-B0t5AAAA:8 a=9OX4YJtEninwzQWm1icA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExOSBTYWx0ZWRfX9CUSoP3AH/zA
 hqcZswqzHq8LLpf+VQcbbRSgrqcJuccCmcj9oxHmMp2gBlRxbgZfF0Tx86fnUXu3qgs2fvTxkMQ
 QIsubXC/bR1eb7O88+/B0rzf/2GjT885T1JTkizMb8JqpHTm874/M6qBx+B71j6T7lYSsSgKALs
 g0pEOq2Cp6GWZI3WxJDN6WwNzjtFhBg+Ls29offA7z8Q+VFrJJDXekbwegJ0g1brMOndl38areh
 c8INa3EUIPNuEi3o+0BXiNSWiZh/36P/RiFkoSz/NHq/Kmw8izQhNvJWd4tF+jPazFrE2QSHvYu
 grVTMn3mEPzEYslLbtxw/jO/ju6IdQGYem8FDjAF+9a4irzk/d2bZHuZIpMUrqedVGBPj13M8cb
 WQmb8jQljfO2acY7DgP1zpSCL5qO8I/DNHu/Ey8e98TNobOWcFyL+FUh2Q2aIdHsWXRInIKUXF/
 nIF7CgaERR5EymY4haQ==
X-Proofpoint-ORIG-GUID: LDDcPHrZfqTRo7rq2wpPBKlTBZdfuaQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280119

On Tue, Apr 28, 2026 at 04:12:40PM +0800, 杨孙运 wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年4月28日周二 15:49写道：
> >
> > On Tue, Apr 28, 2026 at 02:32:24PM +0800, syyang@lontium.com wrote:
> > > From: Sunyun Yang <syyang@lontium.com>
> > >
> > > The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
> > > and output signal/dual port mipi.
> > >
> > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > > ---
> > >  drivers/gpu/drm/bridge/Kconfig             |  13 +
> > >  drivers/gpu/drm/bridge/Makefile            |   1 +
> > >  drivers/gpu/drm/bridge/lontium-lt7911exc.c | 497 +++++++++++++++++++++
> > >  3 files changed, 511 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c
> > >
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > index c3209b0f4678..8cff2bf15b09 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -132,6 +132,19 @@ config DRM_ITE_IT6505
> > >       help
> > >         ITE IT6505 DisplayPort bridge chip driver.
> > >
> > > +config DRM_LONTIUM_LT7911EXC
> > > +     tristate "Lontium eDP/MIPI bridge"
> > > +     depends on OF
> > > +     select CRC32
> > > +     select FW_LOADER
> > > +     select DRM_PANEL
> > > +     select DRM_KMS_HELPER
> > > +     help
> > > +       DRM driver for the Lontium LT7911EXC bridge chip.
> > > +       The LT7911EXC converts eDP input to single/dual port
> > > +       MIPI DSI output.
> > > +       Please say Y if you have such hardware.
> > > +
> > >  config DRM_LONTIUM_LT8912B
> > >       tristate "Lontium LT8912B DSI/HDMI bridge"
> > >       depends on OF
> > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > > index beab5b695a6e..70ddca75dd3a 100644
> > > --- a/drivers/gpu/drm/bridge/Makefile
> > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > @@ -13,6 +13,7 @@ obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
> > >  obj-$(CONFIG_DRM_INNO_HDMI) += inno-hdmi.o
> > >  obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
> > >  obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
> > > +obj-$(CONFIG_DRM_LONTIUM_LT7911EXC) += lontium-lt7911exc.o
> > >  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
> > >  obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
> > >  obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
> > > diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
> > > new file mode 100644
> > > index 000000000000..85cb6cedbfa3
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
> > > @@ -0,0 +1,497 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> > > + */
> > > +
> > > +#include <linux/crc32.h>
> > > +#include <linux/firmware.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_mipi_dsi.h>
> > > +#include <drm/drm_of.h>
> > > +
> > > +#define FW_SIZE (64 * 1024)
> > > +#define LT_PAGE_SIZE 32
> > > +#define FW_FILE  "lt7911exc_fw.bin"
> >
> > Do you plan to submit the referene image to linux-firmware?
> >
> I want to submit it, but I don't know how. Please help me.

Read the README in that repo.

> 
> > > +#define LT7911EXC_PAGE_CONTROL 0xff
> > > +
> >
> > [...]
> >
> > > +
> > > +static void lt7911exc_remove(struct i2c_client *client)
> > > +{}
> >
> > If it's empty, it should be dropped. .remove is an optional callback.
> >
> it will be fixed in next version.
> 
> > > +
> > > +static const struct i2c_device_id lt7911exc_i2c_table[] = {
> > > +     {"lontium, lt7911exc"},
> >
> > Drop  the "lontium, " part. The I2C ids (unlike OF ids) don't have the
> > vendor part.
> >
> it will be fixed in next version.
> 
> > > +     {/* sentinel */}
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(i2c, lt7911exc_i2c_table);
> > > +
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
