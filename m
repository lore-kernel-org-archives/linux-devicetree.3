Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38133803DA
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657468; cv=pass; b=JyVoLEkkDuim/iH9EmAC2cQsUkcxIc+rJ8SJMN/HwMaKnJXxYd2MAYIW/pGvdhdZtKA+1W0wo1rt0wt5jcWky4TFwPn3XxdICjhoZ8PjenPws0yNBbIx5Ql/DiVVk7OM2PtzUdMMnjeXKwy7Fj5DS/wt4BcqcugHSnSUgZ0QvxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657468; c=relaxed/simple;
	bh=CxkwXF4stC70CxtxD3ed4kEKhzWg9FkFvQoSLlbYxjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCKzK0rgNw3BWNW/4f11WbnEJjzTRL898Ybm3ix0QRst/WjxuJe1HQZ4YBI7pEvHo5xdtDlDwbodlbJuBBbS4Mb5QfkEEWFjt1lY/Y5sAXp3E6JrxcZw0ZViqFbFTg8JgA97YhiEzEjP40Ya7xmh9Jds5n+O5QfOiiJf6AwsTtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFvzIRcj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tv+rJwkx; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFvzIRcj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tv+rJwkx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JGx5sp3892420
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4NuAfMN9eyz4TRquu5PlBEnBt375CYV7jzzMXN47mDM=; b=PFvzIRcjm6hzb6ed
	FO5d3Kx6XyaU0cpdIH1D+ByCMow1sL5s8FSvRg8SQiE8xTF4MiiCJBAqpGtF5K0J
	158vcuQ4idZcmROY4v1mKsAUZgAQnGIHun5HMzfOQ0v5LlPAiMg+nBLEZXRGueaR
	dvFK4/pJk+A4piduTnDLNpxZG6wnBnNWuEKjhsQggOGBQ+xdpKvyrpD27kHKkCO+
	+BosbSLNYWd8op8IsRL3ttH8i7WtJnBkZeG9fv8FeHS16erA7B84tKoDGO1JcXCh
	7igzbN86CvVe3WLrn/kE1p++S0FL5pihCn6oCZDfBSGbRRXnF1FcrWqI6KY2k2mf
	uuI0iQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkynec741-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:57:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so2865520a91.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 20:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776657464; cv=none;
        d=google.com; s=arc-20240605;
        b=f7SS2lMXRZWWhGgZ69OCGu24/wxffBKizdQNYlOdfsihuby/WghicKM7CLlF/lCyJX
         UFMxO0iKEOly6YIzcTgAYjabG+Y7WH+xJ+D5TrmasyRt0PQ4HMhcxLLLM+80BHacGSQD
         ac4wp9AmAY20jNTBIVMYsbdtKN0kazGkVQe3InUN9eyYWmEbyWqfiZHwAMyGxF1QELwb
         NMoJokAnajyGeZTKk5HnijNJBYO92sTwZkNZkZ2W0G2LTrbPu4QuFiz77DZaIlcgkZbA
         3Zutz3QUrqjVtGgyYOE+KMbPm4sPuhvblEd/j+ND2vE8oKwzZzP5JJim+skwAUL9kMt5
         gXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4NuAfMN9eyz4TRquu5PlBEnBt375CYV7jzzMXN47mDM=;
        fh=DPKCyo/P8ySVOtqAEgwuMootV8123BAqDfoWH5LPw7w=;
        b=ZjNBKTf9UA10uzEptnNt/8CwoC02EUWtapc2Qooo6mq2xnxRO/JuBjhmq4uIsNU720
         bjGOpbTsG8QZXZqRHvOcesMPP5cLVrGJSNbi0LEKp8ZRLLQt4k7ybe5bfT0WQMfnYxfO
         TyyEyGD4lS7HkUnhwMdqcerBuS0wsu4mZejM4q29LsMV9VhYEo5P+WBqwv66YBDJiTAP
         5fWoky79flzcnxqMF4CfU+JpEaxXz12mwKcuOMEuv5PMcGDO+AkRWxZM5DUMlavTKZOs
         MvS0G++CzXW+tzCs2d1iQICvYH1J3TFRmXGkGpd8uSOmc4QxH3xy9vBdFE+03lElDXR/
         Wpbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776657464; x=1777262264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NuAfMN9eyz4TRquu5PlBEnBt375CYV7jzzMXN47mDM=;
        b=Tv+rJwkxn0GGaoGkqKO56LjDtC1CfV+nsr36ahiQWHxYBSPGMlQ8jha3aq32huDt6d
         znaKwGEjKko1dP64Jo13VOeMi3uCd5BEr4wiOHOsK/e5444Cgw8vzaW0kQNO9xGaL4kZ
         Z866/b9gNDWZiMKtM5Sys8jfnS3jIOhmy8U0zox6/vC3YMUvS/cBPg21uI6sljC2atcn
         Pb4pQUWuwOKoo81BowckxciMRHnW+SsnKF06kSpwy2xhGYojgVkJa0TbslhfMKhldeBJ
         A7XiCkMQnnCIlIUGfOFFrG47Xx4rmMK9OOQbYFuPFAPKcS4XSeOZT7UnRPDgLCRllZGN
         EliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776657464; x=1777262264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NuAfMN9eyz4TRquu5PlBEnBt375CYV7jzzMXN47mDM=;
        b=nlBtSurDnGxjw2n8d2UFs/CB2KdARAyq4XNYp1A5R00AK3bS3dhqsANcCM5hWVSgyn
         3Pd7ABAXjFgGvgrR/a56vmkGWwGk+Nel9Pk6aDINDmvb7UwMidgmnULskfhmXGKA84KG
         WW8SUR8JPUGg7Ow4xFglasqDFJJhpWyTKMw5VhYjHRVvX6tbf+W432TDjhKURQVYPoFM
         /G4hwT+D0RZF6xToTHIgaFpo4RNSpEMuaIr31CIVlLu0v2QZCSzGel5+irYYZ7Tsd1Mw
         zfTN/7iL5rUW4H6nvWErg6z3Z5yAuKfAVwsQ3wCnmjvTr4gP+DXqcRV0niuIPmniDHN7
         40NA==
X-Forwarded-Encrypted: i=1; AFNElJ+Q9Wnsg0lwMydXh7AnBhqVVumBrNfNoUpwC639ZRCN2DQoJrdQp1ryp7anKi661//iDh+hckzBNqOy@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+oHFXqMxc34aejPK2dxsCJvaSGaGK94A7VLvPS5WjJfeJD2O
	qT0WFhS1gJfsqHbFEyQnQg61fOE604SJDXFiqo9KA3wPWz+oroVtyFPRwD+hHyjME9r9uvCCfZ9
	uspP17/jX4HscYLi9sH4BsEt17DTmECSWpe5evaPoH9dCmHn1G+gILcBSoiBg9JPVHRClIkoMQu
	eOvCOefJXdAfbbCxP39/d3ftFqzENDET0VxBSTV/8=
X-Gm-Gg: AeBDies/e1vWpDip236QfsfXggS7Nd8NsDI3fskZNCj75udkLE0tmp1YrepKlavAKMW
	7Vv26aKIm+HNiGavq0KurgQULBi4b8K7551vYz6Wps+e1IE1vOtUP4OsxuOXUe/YetywmXrqJke
	aRHpKZNKqjSA37G17ITlSKSSm1ekIOfdSoblgLXNi9WJiS23Ylar8vJiFdZW4Kelf0zT0+cGVZm
	dU92x6Wib8awek=
X-Received: by 2002:a17:90b:5865:b0:35b:929f:7e8d with SMTP id 98e67ed59e1d1-3614046cdb7mr12549117a91.14.1776657464098;
        Sun, 19 Apr 2026 20:57:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5865:b0:35b:929f:7e8d with SMTP id
 98e67ed59e1d1-3614046cdb7mr12549078a91.14.1776657463429; Sun, 19 Apr 2026
 20:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420023354.1192642-1-syyang@lontium.com> <20260420023354.1192642-3-syyang@lontium.com>
In-Reply-To: <20260420023354.1192642-3-syyang@lontium.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 06:57:36 +0300
X-Gm-Features: AQROBzDuHCxgMmmFpKDT4Ipp2d3UNEXb2dAWBVpqFXh8PQS3rxikxWU_4-0Mve8
Message-ID: <CAO9ioeXDfTdETEBQknoLehk2aiabCgse109sDgJoPHuQ_07nKQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: Add LT7911EXC edp to mipi bridge driver
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        yangsunyun1993@gmail.com, xmzhu@lontium.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HbokiCE8 c=1 sm=1 tr=0 ts=69e5a438 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=Kz8-B0t5AAAA:8 a=cLmkJLGFUxb_degII6UA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: jbamsEGKRxwJcJNHI7NkXbAXC1eSbfqf
X-Proofpoint-ORIG-GUID: jbamsEGKRxwJcJNHI7NkXbAXC1eSbfqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzNCBTYWx0ZWRfX8afiPciX7LfR
 +BlY1qwoIhNB8asf5405pvVezwNuoTgUUozzMPJy8WmLB0vWh5l91uS3fEZWYz3BEKnrvNy41Rp
 nIgvHeb536x31gao+jNpC0Sji7mUtxwNqNqKPPNm/m8+bsaKtHuy198xi7EfaXABSM4ZiZz/AsA
 zq4+dLDEJqQNFwtw1nRwNd4BnwBrT2sN9z1LMXUWqAVPZexKoMkTmJJyRvBv3QkXXCmyF3m2d0W
 skAx/zz6cWYXrbMNIeOzZAxVan/x5qXzNcdcclE4rUdJchagl0zGYNVx6I++wLnC503MayijuTF
 KYCkWDCwHt1K6N0nIvW2K4sv5/hVE9DpBSV14uPykfWn20QX9z0lI1ehXBtlONfOjB+9Jkmr9gv
 E0033upB24t+o8AcbRgOnrah+uUmdKiiGS8hbWUFjuD0Og5tmeC8dgLFpQVmRuafNoylkb3htZw
 l3utJ9m41/RANe1i8fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200034

On Mon, 20 Apr 2026 at 05:34, <syyang@lontium.com> wrote:
>
> From: Sunyun Yang <syyang@lontium.com>
>
> LT7911EXC is a high performance  eDP1.4 to MIPI chip for

MIPI what?

> VR/Display application.
>
> -eDP1.4Receiver
>  1.Support SSC
>  2.Support 1/2/4 lanes
>  3.Support up to 4K@60HzRGB/YCbCr4:4:48bpc
>  4.Support lane swap and PN swap
>
> -MIPI Transmitter
>  1.CompliantwithD-PHY1.2&DSI1.1&CSI-22.0=EF=BC=9B1 clock lane,
>    and1/2/3/4 configurable data lanes:2.5Gbpsperdatalane
>  2.CompliantwithC-PHY1.0&DSI-21.0&CSI-22.0;
>    1/2/3 configurable data trio=EF=BC=9B2.5Gsps perdatatrio
>  3.Support1/2configurable ports
>  4.DSISupport16/20/24-bit YCbCr4:2:2,16/18/24/30-bit RGB
>
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig             |  18 +
>  drivers/gpu/drm/bridge/Makefile            |   1 +
>  drivers/gpu/drm/bridge/lontium-lt7911exc.c | 571 +++++++++++++++++++++
>  3 files changed, 590 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index c3209b0f4678..bae8cdaea666 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -202,6 +202,24 @@ config DRM_LONTIUM_LT8713SX
>           to 3 configurable Type-C/DP1.4/HDMI2.0 outputs
>           Please say Y if you have such hardware.
>
> +config DRM_LONTIUM_LT9611C

I thought the patch is for LT7911EXC

> +       tristate "Lontium LT9611C DSI/HDMI bridge"
> +       select SND_SOC_HDMI_CODEC if SND_SOC
> +       depends on OF
> +       select CRC8
> +       select FW_LOADER
> +       select DRM_PANEL_BRIDGE
> +       select DRM_KMS_HELPER
> +       select DRM_MIPI_DSI
> +       select DRM_DISPLAY_HELPER
> +       select DRM_DISPLAY_HDMI_STATE_HELPER
> +       select REGMAP_I2C
> +       help
> +         Driver for Lontium DSI to HDMI bridge
> +         chip driver that converts dual DSI and I2S to
> +         HDMI signals
> +         Please say Y if you have such hardware.
> +
>  config DRM_ITE_IT66121
>         tristate "ITE IT66121 HDMI bridge"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Mak=
efile
> index beab5b695a6e..54b293d1663e 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_DRM_LONTIUM_LT9211) +=3D lontium-lt9211.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9611) +=3D lontium-lt9611.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) +=3D lontium-lt9611uxc.o
>  obj-$(CONFIG_DRM_LONTIUM_LT8713SX) +=3D lontium-lt8713sx.o
> +obj-$(CONFIG_DRM_LONTIUM_LT7911EXC) +=3D lontium-lt7911exc.o

Keep the list sorted, please.

>  obj-$(CONFIG_DRM_LVDS_CODEC) +=3D lvds-codec.o
>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) +=3D megachips-stdpxxx=
x-ge-b850v3-fw.o
>  obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) +=3D microchip-lvds.o
> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm=
/bridge/lontium-lt7911exc.c
> new file mode 100644
> index 000000000000..d1c1d9e073ef
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
> @@ -0,0 +1,571 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> + */
> +
> +#include <linux/crc32.h>
> +#include <linux/firmware.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>

I think you use more than that.

> +#include <drm/drm_of.h>
> +
> +#define FW_SIZE (64 * 1024)
> +#define LT_PAGE_SIZE 32
> +#define FW_FILE  "LT7911EXC.bin"
> +#define LT7911EXC_PAGE_CONTROL 0xff
> +
> +struct lt7911exc {
> +       struct device *dev;
> +       struct i2c_client *client;
> +       struct drm_bridge bridge;
> +       struct drm_bridge *panel_bridge;

Use next_bridge from struct drm_bridge instead.

> +       struct regmap *regmap;
> +       /* Protects all accesses to registers by stopping the on-chip MCU=
 */
> +       struct mutex ocm_lock;
> +       struct regulator_bulk_data supplies[2];
> +
> +       struct gpio_desc *reset_gpio;
> +       const struct firmware *fw;

Do you need to store it during the runtime? If not, please remove from
the data struct.

> +       int fw_version;
> +       u32 fw_crc;
> +
> +       bool enabled;

What for?

> +};
> +
> +static const struct regmap_range_cfg lt7911exc_ranges[] =3D {
> +       {
> +               .name =3D "register_range",
> +               .range_min =3D  0,
> +               .range_max =3D 0xffff,

Is it an actual range?

> +               .selector_reg =3D LT7911EXC_PAGE_CONTROL,
> +               .selector_mask =3D 0xff,
> +               .selector_shift =3D 0,
> +               .window_start =3D 0,
> +               .window_len =3D 0x100,
> +       },
> +};
> +
> +static const struct regmap_config lt7911exc_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +       .max_register =3D 0xffff,
> +       .ranges =3D lt7911exc_ranges,
> +       .num_ranges =3D ARRAY_SIZE(lt7911exc_ranges),
> +};
> +
> +static u32 cal_crc32_custom(const u8 *data, u64 length)
> +{
> +       u32 crc =3D 0xffffffff;
> +       u8 buf[4];
> +       u64 i;
> +
> +       for (i =3D 0; i < length; i +=3D 4) {
> +               buf[0] =3D data[i + 3];
> +               buf[1] =3D data[i + 2];
> +               buf[2] =3D data[i + 1];
> +               buf[3] =3D data[i + 0];
> +               crc =3D crc32_be(crc, buf, 4);

How is it different from crc32_le()?

> +               }

Wrong alignment.

> +
> +       return crc;
> +}
> +
> +static inline struct lt7911exc *
> +               bridge_to_lt7911exc(struct drm_bridge *bridge)

One line, please.

> +{
> +       return container_of(bridge, struct lt7911exc, bridge);
> +}
> +
> +static int lt7911exc_regulator_enable(struct lt7911exc *lt7911exc)
> +{
> +       int ret;
> +
> +       ret =3D regulator_enable(lt7911exc->supplies[0].consumer);

If you are not using bulk interface here, why did you declare supplies as b=
ulks?

> +       if (ret < 0)
> +               return ret;
> +
> +       usleep_range(5000, 10000);
> +
> +       ret =3D regulator_enable(lt7911exc->supplies[1].consumer);
> +       if (ret < 0) {
> +               regulator_disable(lt7911exc->supplies[0].consumer);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int lt7911exc_regulator_disable(struct lt7911exc *lt7911exc)
> +{
> +       int ret;
> +
> +       ret =3D regulator_disable(lt7911exc->supplies[1].consumer);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D regulator_disable(lt7911exc->supplies[0].consumer);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static void lt7911exc_reset(struct lt7911exc *lt7911exc)
> +{
> +       gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
> +       msleep(20);
> +
> +       gpiod_set_value_cansleep(lt7911exc->reset_gpio, 0);
> +       msleep(20);
> +
> +       gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);

Yep, it's active low. Invert polarities here.

> +       msleep(400);
> +
> +       dev_dbg(lt7911exc->dev, "lt7911exc reset");
> +}
> +
> +static int lt7911exc_parse_dt(struct lt7911exc *lt7911exc)
> +{
> +       int ret;
> +
> +       lt7911exc->supplies[0].supply =3D "vcc";
> +       lt7911exc->supplies[1].supply =3D "vdd";
> +
> +       ret =3D devm_regulator_bulk_get(lt7911exc->dev, 2, lt7911exc->sup=
plies);
> +       if (ret) {
> +               dev_err(lt7911exc->dev, "failed get regulator\n");
> +               return ret;

return dev_err_probe();

> +       }
> +
> +       lt7911exc->reset_gpio =3D devm_gpiod_get(lt7911exc->dev, "reset",=
 GPIOD_OUT_LOW);
> +       if (IS_ERR(lt7911exc->reset_gpio)) {
> +               dev_err(lt7911exc->dev, "failed to acquire reset gpio\n")=
;

return dev_err_probe();

> +               return PTR_ERR(lt7911exc->reset_gpio);
> +       }
> +
> +       return 0;
> +}
> +
> +static int lt7911exc_read_version(struct lt7911exc *lt7911exc)
> +{
> +       u8 buf[2];
> +       int ret;
> +
> +       ret =3D regmap_bulk_read(lt7911exc->regmap, 0xe081, buf, 3);

Do you see a buffer overflow here?

> +       if (ret)
> +               return ret;
> +
> +       return (buf[0] << 16) | (buf[1] << 8) | buf[2];
> +}
> +
> +static void lt7911exc_lock(struct lt7911exc *lt7911exc)
> +{
> +       mutex_lock(&lt7911exc->ocm_lock);
> +       regmap_write(lt7911exc->regmap, 0xe0ee, 0x01);
> +}
> +
> +static void lt7911exc_unlock(struct lt7911exc *lt7911exc)
> +{
> +       regmap_write(lt7911exc->regmap, 0xe0ee, 0x00);
> +       mutex_unlock(&lt7911exc->ocm_lock);
> +}
> +
> +static int lt7911exc_prepare_firmware_data(struct lt7911exc *lt7911exc)
> +{
> +       struct device *dev =3D lt7911exc->dev;
> +       int ret;
> +       u8 *buffer;
> +       size_t total_size =3D FW_SIZE - 4;
> +
> +       ret =3D request_firmware(&lt7911exc->fw, FW_FILE, dev);
> +       if (ret) {
> +               dev_err(dev, "failed load file '%s', error type %d\n", FW=
_FILE, ret);
> +               return ret;
> +       }
> +
> +       if (lt7911exc->fw->size > total_size) {
> +               dev_err(dev, "firmware too large (%zu > %zu)\n", lt7911ex=
c->fw->size, total_size);
> +               release_firmware(lt7911exc->fw);
> +               lt7911exc->fw =3D NULL;
> +               return -EINVAL;
> +       }
> +
> +       dev_dbg(dev, "firmware size: %zu bytes\n", lt7911exc->fw->size);
> +
> +       buffer =3D kzalloc(total_size, GFP_KERNEL);
> +       if (!buffer) {
> +               release_firmware(lt7911exc->fw);
> +               lt7911exc->fw =3D NULL;
> +               return -ENOMEM;
> +       }
> +
> +       memset(buffer, 0xff, total_size);
> +       memcpy(buffer, lt7911exc->fw->data, lt7911exc->fw->size);
> +
> +       lt7911exc->fw_crc =3D cal_crc32_custom(buffer, total_size);
> +       dev_dbg(dev, "firmware crc: 0x%08x\n", lt7911exc->fw_crc);
> +
> +       kfree(buffer);
> +       return 0;
> +}
> +
> +static void lt7911exc_block_erase(struct lt7911exc *lt7911exc)
> +{
> +       struct device *dev =3D lt7911exc->dev;
> +       const u32 addr =3D 0x00;
> +
> +       const struct reg_sequence seq_write[] =3D {
> +               REG_SEQ0(0xe0ee, 0x01),
> +               REG_SEQ0(0xe054, 0x01),
> +               REG_SEQ0(0xe055, 0x06),
> +               REG_SEQ0(0xe051, 0x01),
> +               REG_SEQ0(0xe051, 0x00),
> +               REG_SEQ0(0xe054, 0x05),
> +               REG_SEQ0(0xe055, 0xd8),
> +               REG_SEQ0(0xe05a, (addr >> 16) & 0xff),
> +               REG_SEQ0(0xe05b, (addr >> 8) & 0xff),
> +               REG_SEQ0(0xe05c, addr & 0xff),
> +               REG_SEQ0(0xe051, 0x01),
> +               REG_SEQ0(0xe050, 0x00),
> +       };
> +
> +       regmap_multi_reg_write(lt7911exc->regmap, seq_write, ARRAY_SIZE(s=
eq_write));
> +
> +       msleep(200);
> +       dev_dbg(dev, "erase flash done.\n");
> +}
> +
> +static void lt7911exc_prog_init(struct lt7911exc *lt7911exc, u64 addr)
> +{
> +       const struct reg_sequence seq_write[] =3D {
> +               REG_SEQ0(0xe0ee, 0x01),
> +               REG_SEQ0(0xe05f, 0x01),
> +               REG_SEQ0(0xe05a, (addr >> 16) & 0xff),
> +               REG_SEQ0(0xe05b, (addr >> 8) & 0xff),
> +               REG_SEQ0(0xe05c, addr & 0xff),
> +       };
> +
> +       regmap_multi_reg_write(lt7911exc->regmap, seq_write, ARRAY_SIZE(s=
eq_write));
> +}
> +
> +static int lt7911exc_write_data(struct lt7911exc *lt7911exc, u64 addr)
> +{
> +       struct device *dev =3D lt7911exc->dev;
> +       int ret;
> +       int page =3D 0, num =3D 0, page_len =3D 0;
> +       u64 size, offset;
> +       const u8 *data;
> +
> +       data =3D lt7911exc->fw->data;
> +       size =3D lt7911exc->fw->size;
> +       page =3D (size + LT_PAGE_SIZE - 1) / LT_PAGE_SIZE;
> +       if (page * LT_PAGE_SIZE > FW_SIZE) {
> +               dev_err(dev, "firmware size out of range\n");
> +               return -EINVAL;
> +       }
> +
> +       dev_dbg(dev, "%u pages, total size %llu byte\n", page, size);
> +
> +       for (num =3D 0; num < page; num++) {
> +               offset =3D num * LT_PAGE_SIZE;
> +               page_len =3D (offset + LT_PAGE_SIZE <=3D size) ? LT_PAGE_=
SIZE : (size - offset);
> +               lt7911exc_prog_init(lt7911exc, addr);
> +
> +               ret =3D regmap_raw_write(lt7911exc->regmap, 0xe05d, &data=
[offset], page_len);
> +               if (ret) {
> +                       dev_err(dev, "write error at page %d\n", num);
> +                       return ret;
> +               }
> +
> +               if (page_len < LT_PAGE_SIZE) {
> +                       regmap_write(lt7911exc->regmap, 0xe05f, 0x05);
> +                       regmap_write(lt7911exc->regmap, 0xe05f, 0x01);
> +                       //hardware requires delay
> +                       usleep_range(1000, 2000);
> +               }
> +
> +               regmap_write(lt7911exc->regmap, 0xe05f, 0x00);
> +               addr +=3D LT_PAGE_SIZE;
> +       }
> +
> +       return 0;
> +}
> +
> +static int lt7911exc_write_crc(struct lt7911exc *lt7911exc, u64 addr)
> +{
> +       u8 crc[4];
> +       int ret;
> +
> +       crc[0] =3D lt7911exc->fw_crc & 0xff;
> +       crc[1] =3D (lt7911exc->fw_crc >> 8) & 0xff;
> +       crc[2] =3D (lt7911exc->fw_crc >> 16) & 0xff;
> +       crc[3] =3D (lt7911exc->fw_crc >> 24) & 0xff;
> +
> +       regmap_write(lt7911exc->regmap, 0xe05f, 0x01);
> +       regmap_write(lt7911exc->regmap, 0xe05a, (addr >> 16) & 0xff);
> +       regmap_write(lt7911exc->regmap, 0xe05b, (addr >> 8) & 0xff);
> +       regmap_write(lt7911exc->regmap, 0xe05c, addr & 0xff);
> +
> +       ret =3D regmap_raw_write(lt7911exc->regmap, 0xe05d, crc, 4);
> +       if (ret)
> +               return ret;
> +       regmap_write(lt7911exc->regmap, 0xe05f, 0x05);
> +       regmap_write(lt7911exc->regmap, 0xe05f, 0x01);
> +       usleep_range(1000, 2000);
> +       regmap_write(lt7911exc->regmap, 0xe05f, 0x00);
> +
> +       return 0;
> +}
> +
> +static int lt7911exc_firmware_upgrade(struct lt7911exc *lt7911exc)
> +{
> +       struct device *dev =3D lt7911exc->dev;
> +       int ret;
> +
> +       ret =3D lt7911exc_prepare_firmware_data(lt7911exc);
> +       if (ret < 0)
> +               return ret;
> +
> +       dev_dbg(dev, "starting firmware upgrade, size: %zu bytes\n", lt79=
11exc->fw->size);
> +
> +       lt7911exc_block_erase(lt7911exc);
> +
> +       ret =3D lt7911exc_write_data(lt7911exc, 0);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to write firmware data\n");
> +               return ret;
> +       }
> +
> +       release_firmware(lt7911exc->fw);
> +       lt7911exc->fw =3D NULL;
> +
> +       ret =3D lt7911exc_write_crc(lt7911exc, FW_SIZE - 4);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to write firmware crc\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int lt7911exc_upgrade_result(struct lt7911exc *lt7911exc)
> +{
> +       struct device *dev =3D lt7911exc->dev;
> +       u32 read_hw_crc =3D 0;
> +       u8 crc_tmp[4];
> +       int ret;
> +
> +       regmap_write(lt7911exc->regmap, 0xe0ee, 0x01);
> +       regmap_write(lt7911exc->regmap, 0xe07b, 0x60);
> +       regmap_write(lt7911exc->regmap, 0xe07b, 0x40);
> +       msleep(150);
> +       ret =3D regmap_bulk_read(lt7911exc->regmap, 0x22, crc_tmp, 4);
> +       if (ret) {
> +               dev_err(lt7911exc->dev, "Failed to read CRC: %d\n", ret);
> +               return ret;
> +       }
> +
> +       read_hw_crc =3D crc_tmp[0] << 24 | crc_tmp[1] << 16 |
> +                               crc_tmp[2] << 8 | crc_tmp[3];
> +
> +       if (read_hw_crc !=3D lt7911exc->fw_crc) {
> +               dev_err(dev, "lt7911exc firmware upgrade failed, expected=
 CRC=3D0x%08x, read CRC=3D0x%08x\n",
> +                       lt7911exc->fw_crc, read_hw_crc);
> +               return -EIO;
> +       }
> +
> +       dev_dbg(dev, "lt7911exc firmware upgrade success, CRC=3D0x%08x\n"=
, read_hw_crc);
> +       return 0;
> +}
> +
> +static void lt7911exc_pre_enable(struct drm_bridge *bridge)
> +{
> +       struct lt7911exc *lt7911exc =3D bridge_to_lt7911exc(bridge);
> +       int ret;
> +
> +       if (lt7911exc->enabled)
> +               return;
> +
> +       ret =3D lt7911exc_regulator_enable(lt7911exc);
> +       if (ret)
> +               return;
> +
> +       lt7911exc_reset(lt7911exc);
> +
> +       lt7911exc->enabled =3D true;
> +}
> +
> +static void lt7911exc_disable(struct drm_bridge *bridge)
> +{
> +       /* Delay after panel is disabled */
> +       msleep(20);
> +}
> +
> +static void lt7911exc_post_disable(struct drm_bridge *bridge)
> +{
> +       struct lt7911exc *lt7911exc =3D bridge_to_lt7911exc(bridge);
> +       int ret;
> +
> +       if (!lt7911exc->enabled)
> +               return;
> +
> +       lt7911exc->enabled =3D false;
> +
> +       ret =3D lt7911exc_regulator_disable(lt7911exc);
> +       if (ret)
> +               return;
> +
> +       gpiod_set_value_cansleep(lt7911exc->reset_gpio, 0);
> +}
> +
> +static int lt7911exc_attach(struct drm_bridge *bridge,
> +                           struct drm_encoder *encoder,
> +                           enum drm_bridge_attach_flags flags)
> +{
> +       struct lt7911exc *lt7911exc =3D bridge_to_lt7911exc(bridge);
> +
> +       return drm_bridge_attach(lt7911exc->bridge.encoder, lt7911exc->pa=
nel_bridge,
> +                                &lt7911exc->bridge, flags);
> +}
> +
> +static const struct drm_bridge_funcs lt7911exc_bridge_funcs =3D {
> +       .pre_enable =3D lt7911exc_pre_enable,
> +       .disable =3D lt7911exc_disable,
> +       .post_disable =3D lt7911exc_post_disable,
> +       .attach =3D lt7911exc_attach,
> +};
> +
> +static int lt7911exc_probe(struct i2c_client *client)
> +{
> +       struct device *dev =3D &client->dev;
> +       struct lt7911exc *lt7911exc;
> +       struct drm_bridge *panel_bridge;
> +       bool fw_updated =3D false;
> +       int ret;
> +
> +       if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +               dev_err(dev, "device doesn't support I2C\n");
> +               return -ENODEV;
> +       }
> +
> +       lt7911exc =3D devm_drm_bridge_alloc(dev, struct lt7911exc, bridge=
,
> +                                         &lt7911exc_bridge_funcs);
> +       if (IS_ERR(lt7911exc))
> +               return PTR_ERR(lt7911exc);
> +
> +       panel_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +       if (IS_ERR(panel_bridge))
> +               return PTR_ERR(panel_bridge);
> +
> +       lt7911exc->panel_bridge =3D panel_bridge;
> +       lt7911exc->client =3D client;
> +       lt7911exc->dev =3D dev;
> +       i2c_set_clientdata(client, lt7911exc);
> +       mutex_init(&lt7911exc->ocm_lock);

devm_mutex_init()

> +
> +       lt7911exc->regmap =3D devm_regmap_init_i2c(client, &lt7911exc_reg=
map_config);
> +       if (IS_ERR(lt7911exc->regmap)) {
> +               dev_err(dev, "regmap i2c init failed\n");
> +               return PTR_ERR(lt7911exc->regmap);
> +       }
> +
> +       ret =3D lt7911exc_parse_dt(lt7911exc);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D lt7911exc_regulator_enable(lt7911exc);
> +       if (ret)
> +               return ret;
> +
> +       lt7911exc_reset(lt7911exc);
> +       lt7911exc->enabled =3D true;
> +       lt7911exc_lock(lt7911exc);
> +
> +retry:
> +       lt7911exc->fw_version =3D lt7911exc_read_version(lt7911exc);
> +       if (lt7911exc->fw_version < 0) {
> +               dev_err(dev, "failed to read FW version\n");
> +               lt7911exc_unlock(lt7911exc);
> +               goto err_disable_regulators;
> +
> +       } else if (lt7911exc->fw_version =3D=3D 0) {
> +               if (!fw_updated) {
> +                       fw_updated =3D true;
> +                       ret =3D lt7911exc_firmware_upgrade(lt7911exc);
> +                       if (ret < 0) {
> +                               lt7911exc_unlock(lt7911exc);
> +                               goto err_disable_regulators;
> +                       }
> +
> +                       lt7911exc_reset(lt7911exc);
> +
> +                       ret =3D lt7911exc_upgrade_result(lt7911exc);
> +                       if (ret < 0) {
> +                               lt7911exc_unlock(lt7911exc);
> +                               goto err_disable_regulators;
> +                       }
> +
> +                       goto retry;
> +
> +               } else {
> +                       dev_err(dev, "fw version 0x%04x, update failed\n"=
, lt7911exc->fw_version);
> +                       ret =3D -EOPNOTSUPP;
> +                       lt7911exc_unlock(lt7911exc);
> +                       goto err_disable_regulators;
> +               }
> +       }
> +
> +       lt7911exc_unlock(lt7911exc);
> +
> +       lt7911exc->bridge.type =3D DRM_MODE_CONNECTOR_DSI;

So, this is the DSI host. Where do you register one? Where do you
populate the DT entries (if there is a panel attached to this bridge
it will be a child node).

> +       lt7911exc->bridge.of_node =3D dev->of_node;
> +       drm_bridge_add(&lt7911exc->bridge);

devm_drm_bridge_add().

> +
> +       return 0;
> +
> +err_disable_regulators:
> +       regulator_bulk_disable(ARRAY_SIZE(lt7911exc->supplies), lt7911exc=
->supplies);
> +       if (lt7911exc->fw) {
> +               release_firmware(lt7911exc->fw);
> +               lt7911exc->fw =3D NULL;
> +       }
> +
> +       return ret;
> +}
> +
> +static void lt7911exc_remove(struct i2c_client *client)
> +{
> +       struct lt7911exc *lt7911exc =3D i2c_get_clientdata(client);
> +
> +       drm_bridge_remove(&lt7911exc->bridge);
> +       mutex_destroy(&lt7911exc->ocm_lock);
> +}
> +
> +static const struct i2c_device_id lt7911exc_i2c_table[] =3D {
> +       {"lontium, lt7911exc", 0},
> +       { /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, lt7911exc_i2c_table);
> +
> +static const struct of_device_id lt7911exc_devices[] =3D {
> +       {.compatible =3D "lontium,lt7911exc",},
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, lt7911exc_devices);
> +
> +static struct i2c_driver lt7911exc_driver =3D {
> +       .id_table       =3D lt7911exc_i2c_table,
> +       .probe          =3D lt7911exc_probe,
> +       .remove         =3D lt7911exc_remove,
> +       .driver         =3D {
> +               .name   =3D "lt7911exc",
> +               .of_match_table =3D lt7911exc_devices,
> +       },
> +};
> +module_i2c_driver(lt7911exc_driver);
> +
> +MODULE_AUTHOR("SunYun Yang <syyang@lontium.com>");
> +MODULE_DESCRIPTION("Lontium lt7911exc edp to mipi dsi bridge driver");

MIPI, DSI. It LT7911EXC or lt7911exc?

> +MODULE_LICENSE("GPL v2");
> --
> 2.34.1
>


--=20
With best wishes
Dmitry
