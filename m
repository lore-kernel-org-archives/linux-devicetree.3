Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201624;
	b=GYRI902I45uFMZV22tX8khdHruQvjgrKy42P0PpJhzySRZO35tSUAG3ul1/Q7a8XdHzr
	 nxLAdHA9oyA6bHu3NvKs37qh4MtrASgzDnXqwTZyQ651HkAp3x7dcI0X00EzveCXr/cLb
	 +ItuuhUyRveB1tSlBO8dgPfj2cSAw37hCeG1kJAkNEYm3mFOPi6oPr4n18R080P8m/qdN
	 gFlvW57mD+oTdkpOjzYDah+FdhzPtCPx+61XCB2sPmh8Xfq8vOXPY/FaQI4nFL2hV4NLk
	 qpKFWdjOuODocnQZtSyYj/DtEll1803KYlsuGcOooOw5rWJ57wAylMQ3/YDiAN1Qa+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=sw3TaqHVAMSM60hMWawgwXd2cRFA6h38Z/DQRogJXS8=;
	b=lRxFfN90B44A33WyvPRO7C6KTMdXum5G05k8OwRc5GuHe6GgVuOcayIassD6Eo7oeiQg
	 JPyeITTfWCP43jcDir7mNbsWyuk2k4xQX1S+oAV8Y6/smwvag9s15WT5/kOcIEkrokUVd
	 imxaHUioZuMlycPn2UQlTryRVDl4dFvyKQelk/hOKHCgX+DuM9sZZRNDeXkBKO8KqAHsF
	 OQYtK5+tfVfx7frW4QPNSYdjsU71FJRzJQLUI2Q58z4IYsnTLoU90ZXcn1NSWKgL+MoHU
	 TsioKnf2KQSsL6HzloX/4FGYPtD7Tmz21kao9wi0D7wlzzXg1LNBYjrsxG1/a4yfTGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u3wb+6rI;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A45B606A330
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A45B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u3wb+6rI
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso7567575e9.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793201621; x=1793806421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sw3TaqHVAMSM60hMWawgwXd2cRFA6h38Z/DQRogJXS8=;
        b=u3wb+6rIEuU4l60j65Ldqcn00GpoDrZbMrucF3NtAgHCS0WUMM3CoPaWMpaYZrlSdO
         Nz8+ZAPQlZWhIdIKTP+mU77SEweff8gWic4434t7Xg5DXhGObTs2CbZN/4pSfgWpUoG6
         jjZ7IFuw7QBYJVVBD7O0oZ9kI6XrXps2lF/FUPNkmIe/w0CHM32vk/4FLWGde6Y0SLeB
         xHnD8EgWqEYzDX2Cqdgz/EQ4+ZBUZurUtTbHC5K/xVqv0ropahbIk8H44ZWObeILaqf5
         NFV2hJoYQs6EI7jS+UZkJ6PwXiXq9AWCDpxDtt2z7RwxS0mrbzXRApzsYFmZnTE1H1qZ
         y/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201621; x=1793806421;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sw3TaqHVAMSM60hMWawgwXd2cRFA6h38Z/DQRogJXS8=;
        b=qYkBlWXV2mIs/Om1DS3Ucr/RvNCePDkIxLeqNuFO90RvJwXgwK+CA2Slpzx3LGQa6l
         +zDHNU+jTm8IGGXzsWTBj/b79V8SZLr5r4ueHGtsuc1tKyvGzzhMMMBTh2lP+pprHQSI
         sVU031+nF+GlIHZyFWhoQXIoV9Kv0XbEU1cmeGlx4shkZ2qoxGtUZ++yExG6WNjv8P+3
         NQYqFt1tGl5Lwy0jvd6utM800SUTP40NqOtjNzL+U30nHD//yjwPmfgRbrvIaQ1s0Kuw
         znuXaT5C59x5tkfTpbMrBaiMlszmULX/UzJNoENhJ9BTgq2LrgWjXavRqY3I7+zIdMvy
         SSyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbt1jG7221lWFxPQIdKkqc4jn0iSxet9SLI6nca93cyjq4AkiNcZGzQSE6hmAW9bKp2nNr83IjwPJc@vger.kernel.org
X-Gm-Message-State: AFq9FYLkytvBDnrW8dOPTZ4Sx0ZTcHgvqzcTWqwJpqFVnX17O7+eFheu
	wJQBr4o2UHdaSOuLyMKNLRlCpFkbBzu9Z+6JUyesg2Y5bNhJyq8sUzAux2yRzmNyjqM=
X-Gm-Gg: AYBFou0UMpkMQG4tIa3mADZgHzArWkCXIVm8QdQA+YjVh/IVrfgtaeR5Qr4TgeEDZzN
	u+HJ0tDJnzoA5JsbP1QnaRMfb0b2vXzUMqr65rjop9azg/czYL/tgTim6cluFw9kP5vdFMomva7
	qqh9IWEVHzGJSHjc13q22207PQbBggEviBKT7CxCjlqwzWWvjrvdGTx/Z4gONixOtBiBnxKz8iT
	Wdx06okTeZsll74OOfp/LCodM4lT1/PpXwf5gQUeAcv78VKxGROuXensIsKvKK+feGFD1aZx/BM
	2LDQSJdknFyffN5dJ2uBhodWaGdWu2SA597+n++rWvrvAkjCXErcrwjurIODcvQsLuwntyotxRy
	Wq1z2TL1GgSgq6skdyprbaP17i9VUG0cjd5XXQwvig5UoWRl19ATMHxcIgFjyg7Wxifcsyk/TcT
	FKJCwN5YDL+EcnzdJU8svZwjHkyMhlwcRHmQcHvXChd3C2DimitVNxr9onRDwrV3INX1WCaSK8R
	s7IdyS2+zFbzeI76o3XiKDxBr2Ri/WsW9EapFdUiWbKaWRHMap/jOz8Fj9/rxUJFFqwRJmVmRw+
	NEmmOfsuUiTpMXH8FLLH7szFYFobz28zS0VP3zXmeQ==
X-Received: by 2002:a05:600c:1da8:b0:4a1:d992:9476 with SMTP id 5b1f17b1804b1-4a966c3ffd7mr64028635e9.23.1793201621321;
        Wed, 28 Oct 2026 08:33:41 -0700 (PDT)
Received: from [192.168.0.167] ([109.79.76.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm30167148f8f.47.2026.10.28.08.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:33:40 -0700 (PDT)
Message-ID: <29c988cf-2bd8-4970-b96a-a5784fa071f6@linaro.org>
Date: Wed, 28 Oct 2026 15:33:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 10/15] media: qcom: camss: vfe: Add support for VFE
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 15:20, Hangxiang Ma wrote:
> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
> 
> In the Kaanapali camera subsystem, the front-end blocks are referred to
> as TFEs (Thin Front Ends). This driver continues to use the VFE naming
> in some places to preserve consistency with the existing code and avoid
> unnecessary renaming. Support is currently limited to three output lines,
> matching the constraints of the CAMSS framework.
> 
> Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
> CSID configuration has completed. In addition, the number of AUP_UPDATE
> requests must match the number of buffers queued to the write master
> while it is being enabled.
> 
> Although real-time TFE traffic is routed through RT_CAMNOC, both
> camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures
> that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
> reset in a fully idle state.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   drivers/media/platform/qcom/camss/camss-vfe-1080.c | 213 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>   drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
>   drivers/media/platform/qcom/camss/camss.c          | 126 ++++++++++++
>   5 files changed, 343 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 218ba3a95939..42a14e8fe1b7 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -26,6 +26,7 @@ qcom-camss-objs += \
>   		camss-vfe-340.o \
>   		camss-vfe-480.o \
>   		camss-vfe-680.o \
> +		camss-vfe-1080.o \
>   		camss-vfe-gen1.o \
>   		camss-vfe-gen3.o \
>   		camss-vfe-vbif.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
> new file mode 100644
> index 000000000000..68798f13fbea
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-vfe-1080.c
> + *
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 1080
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +/* VFE-1080 Bus Register Base Addresses */
> +#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
> +
> +#define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
> +#define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL		(BUS_REG_BASE + 0x128)
> +
> +#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + 0x500 + (n) * 0x100)
> +#define		WM_CFG_EN				BIT(0)
> +#define		WM_VIR_FRM_EN				BIT(1)
> +#define		WM_CFG_MODE				BIT(16)
> +#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + 0x504 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + 0x508 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + 0x50C + (n) * 0x100)
> +#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
> +#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + 0x514 + (n) * 0x100)
> +#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE		(0xFFFF)
> +#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + 0x518 + (n) * 0x100)
> +
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x530 + (n) * 0x100)
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x534 + (n) * 0x100)
> +
> +/* VFE lite has no such registers */
> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x538 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x53C + (n) * 0x100)
> +
> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x560 + (n) * 0x100)
> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x564 + (n) * 0x100)
> +
> +/*
> + * IFE write master client IDs
> + *
> + * VIDEO_FULL			0
> + * VIDEO_DC4_Y			1
> + * VIDEO_DC4_C			2
> + * VIDEO_DC16_Y			3
> + * VIDEO_DC16_C			4
> + * DISPLAY_DS2_Y		5
> + * DISPLAY_DS2_C		6
> + * FD_Y				7
> + * FD_C				8
> + * PIXEL_RAW			9
> + * STATS_AEC_BG			10
> + * STATS_AEC_BHIST		11
> + * STATS_TINTLESS_BG		12
> + * STATS_AWB_BG			13
> + * STATS_AWB_BFW		14
> + * STATS_AF_BHIST		15
> + * STATS_ALSC_BG		16
> + * STATS_FLICKER_BAYERRS	17
> + * STATS_TMC_BHIST		18
> + * PDAF_0			19
> + * PDAF_1			20
> + * PDAF_2			21
> + * PDAF_3			22
> + * RDI0				23
> + * RDI1				24
> + * RDI2				25
> + * RDI3				26
> + * RDI4				27
> + *
> + * IFE Lite write master client IDs
> + *
> + * RDI0			0
> + * RDI1			1
> + * RDI2			2
> + * RDI3			3
> + * GAMMA		4
> + * STATES_BE		5
> + */
> +#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> +
> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
> +{
> +	struct v4l2_pix_format_mplane *pix =
> +		&line->video_out.active_fmt.fmt.pix_mp;
> +
> +	wm = RDI_WM(wm);
> +
> +	/* no clock gating at bus input */
> +	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> +
> +	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
> +
> +	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
> +	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
> +	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
> +	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
> +	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
> +	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> +
> +	/* no dropped frames, one irq per frame */
> +	if (!vfe_is_lite(vfe)) {
> +		writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
> +		writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> +	}
> +
> +	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
> +	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
> +
> +	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
> +	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
> +
> +	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
> +{
> +	wm = RDI_WM(wm);
> +	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
> +			  struct vfe_line *line)
> +{
> +	wm = RDI_WM(wm);
> +	writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +
> +	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
> +}
> +
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static void vfe_reg_update_clear(struct vfe_device *vfe,
> +				 enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}
> +
> +static void vfe_addr_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	camss_addr_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static void vfe_addr_update_clear(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	camss_addr_update(vfe->camss, vfe->id, port_id, true);
> +}
> +
> +static const struct camss_video_ops vfe_video_ops_1080 = {
> +	.queue_buffer = vfe_queue_buffer_v2,
> +	.flush_buffers = vfe_flush_buffers,
> +};
> +
> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
> +{
> +	vfe->video_ops = vfe_video_ops_1080;
> +}
> +
> +static void vfe_global_reset(struct vfe_device *vfe)
> +{
> +	vfe_isr_reset_ack(vfe);
> +}
> +
> +static irqreturn_t vfe_isr(int irq, void *dev)
> +{
> +	/* nop */
> +	return IRQ_HANDLED;
> +}
> +
> +static int vfe_halt(struct vfe_device *vfe)
> +{
> +	/* rely on vfe_disable_output() to stop the VFE */
> +	return 0;
> +}
> +
> +const struct vfe_hw_ops vfe_ops_1080 = {
> +	.addr_update = vfe_addr_update,
> +	.addr_update_clear = vfe_addr_update_clear,
> +	.global_reset = vfe_global_reset,
> +	.hw_version = vfe_hw_version,
> +	.isr = vfe_isr,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
> +	.reg_update = vfe_reg_update,
> +	.reg_update_clear = vfe_reg_update_clear,
> +	.subdev_init = vfe_subdev_init,
> +	.vfe_disable = vfe_disable,
> +	.vfe_enable = vfe_enable_v2,
> +	.vfe_halt = vfe_halt,
> +	.vfe_wm_start = vfe_wm_start,
> +	.vfe_wm_stop = vfe_wm_stop,
> +	.vfe_buf_done = vfe_buf_done,
> +	.vfe_wm_update = vfe_wm_update,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 4f8867daea4c..221abf7bfd47 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8550:
>   	case CAMSS_8650:
>   	case CAMSS_8775P:
> +	case CAMSS_KAANAPALI:
>   	case CAMSS_X1E80100:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
> @@ -2020,6 +2021,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
>   	case CAMSS_8550:
>   	case CAMSS_8650:
>   	case CAMSS_8775P:
> +	case CAMSS_KAANAPALI:
>   	case CAMSS_X1E80100:
>   		ret = 16;
>   		break;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 8312e4c91e98..0a91440cfe43 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -251,6 +251,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
>   extern const struct vfe_hw_ops vfe_ops_340;
>   extern const struct vfe_hw_ops vfe_ops_480;
>   extern const struct vfe_hw_ops vfe_ops_680;
> +extern const struct vfe_hw_ops vfe_ops_1080;
>   extern const struct vfe_hw_ops vfe_ops_gen3;
>   
>   int vfe_get(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 12dfe760fc54..6ff82dd2aeaf 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -156,6 +156,130 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
>   	}
>   };
>   
> +/* In Kaanapali, CAMNOC requires all CPAS_TFEX clocks
> + * to operate on any TFE Full.
> + */
> +static const struct camss_subdev_resources vfe_res_kaanapali[] = {
> +	/* VFE0 - TFE Full */
> +	{
> +		.clock = { "vfe0_fast_ahb", "vfe0",
> +			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 360280000, 480000000, 630000000, 716000000,
> +				  833000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_1080,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 - TFE Full */
> +	{
> +		.clock = { "vfe1_fast_ahb", "vfe1",
> +			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 360280000, 480000000, 630000000, 716000000,
> +				  833000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife1",
> +			.hw_ops = &vfe_ops_1080,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 - TFE Full */
> +	{
> +		.clock = { "vfe2_fast_ahb", "vfe2",
> +			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 360280000, 480000000, 630000000, 716000000,
> +				  833000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe2" },
> +		.interrupt = { "vfe2" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife2",
> +			.hw_ops = &vfe_ops_1080,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE3 - IFE Lite */
> +	{
> +		.clock = { "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_1080,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE4 - IFE Lite */
> +	{
> +		.clock = { "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_1080,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_kaanapali[] = {
>   	{
>   		.name = "ahb",
> @@ -5727,10 +5851,12 @@ static const struct camss_resources kaanapali_resources = {
>   	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
>   	.csiphy_res = csiphy_res_kaanapali,
>   	.csid_res = csid_res_kaanapali,
> +	.vfe_res = vfe_res_kaanapali,
>   	.icc_res = icc_res_kaanapali,
>   	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
>   	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
> +	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
>   };
>   
>   static const struct camss_resources msm8916_resources = {
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
