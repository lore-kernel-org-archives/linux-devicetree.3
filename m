Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC0D1DE4F1
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784928; cv=none; b=IA+a+hLbbDlJDvJnkmlu4J5Sl0OxEPzitCReIFFQc0aNbJQ8Y3hjnYcnAOYKnEC+YajtlsDAfmeeVfhusyZbR84CD92bxM0NVhpp/grDw7P1gNA0XttQgKX81wSDITVMXVuEC3XFzvd6BmF9D26tZXnBzaPaaKuphjFpBHCwQ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784928; c=relaxed/simple;
	bh=ieQqM2fZphMlIJnK+lf769vq1uOOn7kBwEdvPtWeYKI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=W5iC24yoZQxAw2qzg/RVlM5wgeubMJZ8cqtUC52MnnjLVBVXBWNz4XLB8AN32gkc+NGK9O2ScH5dWz+L//8t1EKnJfIoTrbzofR57Y+phYwBHtfTZnpRZyAIC6yPMhqladHSiFQpHSmaL9BrPN7IVczdZ31XTeOOCkJxPyo3ei4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k2gspCCT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k2gspCCT"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4626fdc829aso710261f8f.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781784925; x=1782389725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inCOSQIAKG2kUmLnvzspFcMK9tKYXafQB5tSO3TUyjc=;
        b=k2gspCCTeF8yvdqJKQhpnDOAQNZK+CWtxloc297N0DxMPGuFsYd1rf3DiBqoRSPT0N
         bD77qnJIeEv6d1bniWc+8NL5SFFH6ju0gyvlp1CNm51m1O2vQvFmvHsuwbuwP0h+l2et
         PxHjaRUQfZ6cXnn2IQAnMdrUwbI+BFHjA0sNeEBFl8ZzxlN0az31hypMHGmfj0fobRQN
         +ES9z0LWDHlyZnHmleq2hSaJDpYYrzirdgQmurG/dbBJZcf3GVYTM0y1HLwJcVZZlO0X
         TaXN23Y0MncYOGod/NDRyjvO9m9uurrc08k2f3yQSIkbahisnu4VDCRYmtiAN7PnjxSx
         K7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784925; x=1782389725;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inCOSQIAKG2kUmLnvzspFcMK9tKYXafQB5tSO3TUyjc=;
        b=rR2on8JDc4xGe2mmYNcVCK83zVCFJpgs4DoJsdKoBVho74Dm/1y78zRB8M6kR/vgrU
         nhLCvhhqftFbHV388AtEtuhrhbYjZ06lG+3/nkebY6AUcbWD3Ee1MwBag/mHjxvTsytA
         O97CGExHFmPiCUid88rsAwIHL63B3KTaRUc8QuO5kSIl5TCwP1TSSLM/gcmLqcJIzBKc
         ZrT0i41QpqRJhI+nBbNOTQKj0oEiuXHEKhzuHuPN+tOSyvvKuN4N43n52dhusOgiF8L+
         xXifa39PPjE/2NIef28Bz1BUDb1UooCtj8JWHd/+h/ceEQX2PauQNonXyQBS96B3DfMf
         Wg1g==
X-Forwarded-Encrypted: i=1; AFNElJ816/OD6W1cX9HLYh8zFCawIFWXbfj5O7AJQUvxYPtwwAIi414sHkiOYXUz0ASGQ/7Vnv3ZA441UQ1M@vger.kernel.org
X-Gm-Message-State: AOJu0YzH83lOddVbyefPkrPMunpZUHiAbZAly5C/nCZfv100ldumBLzd
	55zoAQGQ48omuZXUqci592zVyt0FoS5GPjPb6jYXSdEUJZeCjhmmY5t92XhFCUzBLY4=
X-Gm-Gg: AfdE7cmeJiT/70Xtk2kH8jfrTEZPawxdf0bQFguYZGouBZyU/wPevSixySJE7eRGxOm
	illYtxpBxwFzLcW6jV0KL1K5SGgrPd7fiuY1atrlyjdWUpxUtqOFMbaw6LpPwD9rETzix4Xyfu7
	X+++1Gu1BtFd5UPIpdWZRHwoSG3MaDVklsD8melTGYPaXYkFAQzu35u4okY3HEkIuwz70I202B8
	C45oWbC3RDQ+gD4PhNWac1r15dDb51l0/DbrlguWeJeX62ycuMxqHUE3A1b4Eo2pwGGHX9pg8zJ
	4SKGSZhPih8vGk4wt5FxkJDNld0I46E7BaInheSoDErZiS+9tDVExBErhC6DCpCC/2wUp/9QMbC
	mxOICzaf1qigm+OIEtemDY5v908IKncGwjJ69AGCS4/LLk39Ce0MXePpXYnTNM1+L/8aeJhDtr/
	DkrfKjnrMJhjMIdEHOPtHfRzOQx/NM9/eCkBoAlRjLaGITakEhRTDJkpBa1/P+u1xUcQ==
X-Received: by 2002:a5d:6f1e:0:b0:460:18e9:c0da with SMTP id ffacd0b85a97d-4623f8b1a7emr15360704f8f.10.1781784924347;
        Thu, 18 Jun 2026 05:15:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0? ([2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm66742170f8f.35.2026.06.18.05.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 05:15:23 -0700 (PDT)
Message-ID: <8cdf7a20-91ed-48a1-9cf0-0dc86d1d23ae@linaro.org>
Date: Thu, 18 Jun 2026 14:15:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 2/2] drm/panel: Add Ilitek ILI9488 controller driver
To: Igor Reznichenko <igor@reznichenko.net>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Kael D'Alcamo <dev@kael-k.io>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260617143245.372182-1-igor@reznichenko.net>
 <20260617143245.372182-3-igor@reznichenko.net>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260617143245.372182-3-igor@reznichenko.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/26 16:32, Igor Reznichenko wrote:
> Add support for Ilitek ILI9488 DSI controller which is used in
> FocusLCDs E35GH-I-MW800-CB 320x480 MIPI DSI panel. The mode timing
> was adjusted after STM32MP157 testing. The previous 14.256 MHz mode
> worked on AM62P, but was awkward for STM32 DSI/LTDC clock synthesis.
> 
> Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
> ---
>   MAINTAINERS                                  |   6 +
>   drivers/gpu/drm/panel/Kconfig                |   9 +
>   drivers/gpu/drm/panel/Makefile               |   1 +
>   drivers/gpu/drm/panel/panel-ilitek-ili9488.c | 289 +++++++++++++++++++
>   4 files changed, 305 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9488.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac87c217ab1f..987635948cde 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8040,6 +8040,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
>   F:	drivers/gpu/drm/tiny/ili9486.c
>   
> +DRM DRIVER FOR ILITEK ILI9488 PANELS
> +M:	Igor Reznichenko <igor@reznichenko.net>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
> +F:	drivers/gpu/drm/panel/panel-ilitek-ili9488.c
> +
>   DRM DRIVER FOR ILITEK ILI9805 PANELS
>   M:	Michael Trimarchi <michael@amarulasolutions.com>
>   S:	Maintained
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7450b27622a2..37987e47f3f7 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -284,6 +284,15 @@ config DRM_PANEL_ILITEK_ILI9341
>   	  QVGA (240x320) RGB panels. support serial & parallel rgb
>   	  interface.
>   
> +config DRM_PANEL_ILITEK_ILI9488
> +	tristate "Ilitek ILI9488-based panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for panels based on the
> +	  Ilitek ILI9488 controller.
> +
>   config DRM_PANEL_ILITEK_ILI9805
>   	tristate "Ilitek ILI9805-based panels"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index c2c5cf817116..a1344a0a3fd0 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
>   obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
> +obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9488) += panel-ilitek-ili9488.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_CORE) += panel-ilitek-ili9806e-core.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_DSI) += panel-ilitek-ili9806e-dsi.o
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
> new file mode 100644
> index 000000000000..7302766034fc
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
> @@ -0,0 +1,289 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <video/mipi_display.h>
> +
> +struct ili9488_desc {
> +	const struct drm_display_mode *display_mode;
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +	unsigned int lanes;
> +	unsigned int bpc;
> +	void (*init_sequence)(struct mipi_dsi_multi_context *ctx);
> +};
> +
> +struct ili9488 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct gpio_desc *reset;
> +	struct regulator_bulk_data supplies[2];
> +	const struct ili9488_desc *desc;
> +	enum drm_panel_orientation orientation;
> +};
> +
> +static const char * const regulator_names[] = {
> +	"vci",
> +	"iovcc",
> +};
> +
> +static void e35gh_i_mw800cb_init(struct mipi_dsi_multi_context *ctx)
> +{
> +	/* Gamma control 1,2 */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xE0, 0x00, 0x10, 0x14, 0x01, 0x0E, 0x04, 0x33,
> +				     0x56, 0x48, 0x03, 0x0C, 0x0B, 0x2B, 0x34, 0x0F);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xE1, 0x00, 0x12, 0x18, 0x05, 0x12, 0x06, 0x40,
> +				     0x34, 0x57, 0x06, 0x10, 0x0C, 0x3B, 0x3F, 0x0F);
> +	/* Power control 1,2 */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xC0, 0x0F, 0x0C);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xC1, 0x41);
> +	/* VCOM Control */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xC5, 0x00, 0x25, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x36, 0x48);
> +	/* Interface pixel format 18bpp */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x3A, 0x66);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xB0, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xB1, 0xA0);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xB4, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xB6, 0x02, 0x02, 0x3B);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xE9, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xF7, 0xA9, 0x51, 0x2C, 0x82);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x21);
> +}
> +
> +static const struct drm_display_mode e35gh_i_mw800cb_display_mode = {
> +	.clock = 14400,
> +
> +	.hdisplay = 320,
> +	.hsync_start = 320 + 60,
> +	.hsync_end = 320 + 60 + 20,
> +	.htotal = 320 + 60 + 20 + 42,
> +
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 20,
> +	.vsync_end = 480 + 20 + 10,
> +	.vtotal = 480 + 20 + 10 + 33,
> +
> +	.width_mm = 48,
> +	.height_mm = 73,
> +
> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static inline struct ili9488 *panel_to_ili9488(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ili9488, panel);
> +}
> +
> +static int ili9488_power_on(struct ili9488 *ili)
> +{
> +	struct mipi_dsi_device *dsi = ili->dsi;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ili->supplies), ili->supplies);
> +	if (ret < 0) {
> +		dev_err(&dsi->dev, "regulator bulk enable failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(ili->reset, 0);
> +	usleep_range(1000, 5000);
> +	gpiod_set_value_cansleep(ili->reset, 1);
> +	usleep_range(1000, 5000);
> +	gpiod_set_value_cansleep(ili->reset, 0);
> +	usleep_range(5000, 10000);
> +
> +	return 0;
> +}
> +
> +static int ili9488_power_off(struct ili9488 *ili)
> +{
> +	struct mipi_dsi_device *dsi = ili->dsi;
> +	int ret;
> +
> +	gpiod_set_value_cansleep(ili->reset, 1);
> +
> +	ret = regulator_bulk_disable(ARRAY_SIZE(ili->supplies), ili->supplies);
> +	if (ret)
> +		dev_err(&dsi->dev, "regulator bulk disable failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int ili9488_activate(struct ili9488 *ili)
> +{
> +	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
> +
> +	if (ili->desc->init_sequence)
> +		ili->desc->init_sequence(&ctx);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 120);
> +	mipi_dsi_dcs_set_display_on_multi(&ctx);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int ili9488_prepare(struct drm_panel *panel)
> +{
> +	struct ili9488 *ili = panel_to_ili9488(panel);
> +	int ret;
> +
> +	ret = ili9488_power_on(ili);
> +	if (ret)
> +		return ret;
> +
> +	ret = ili9488_activate(ili);
> +	if (ret) {
> +		ili9488_power_off(ili);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ili9488_deactivate(struct ili9488 *ili)
> +{
> +	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 120);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int ili9488_unprepare(struct drm_panel *panel)
> +{
> +	struct ili9488 *ili = panel_to_ili9488(panel);
> +	struct mipi_dsi_device *dsi = ili->dsi;
> +	int ret;
> +
> +	ili9488_deactivate(ili);
> +	ret = ili9488_power_off(ili);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "power off failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int ili9488_get_modes(struct drm_panel *panel, struct drm_connector *connector)
> +{
> +	struct ili9488 *ili = panel_to_ili9488(panel);
> +	const struct drm_display_mode *mode = ili->desc->display_mode;
> +
> +	connector->display_info.bpc = ili->desc->bpc;
> +
> +	return drm_connector_helper_get_modes_fixed(connector, mode);
> +}
> +
> +static enum drm_panel_orientation ili9488_get_orientation(struct drm_panel *panel)
> +{
> +	struct ili9488 *ili = panel_to_ili9488(panel);
> +
> +	return ili->orientation;
> +}
> +
> +static const struct drm_panel_funcs ili9488_funcs = {
> +	.prepare	= ili9488_prepare,
> +	.unprepare	= ili9488_unprepare,
> +	.get_modes	= ili9488_get_modes,
> +	.get_orientation = ili9488_get_orientation,
> +};
> +
> +static int ili9488_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct ili9488 *ili;
> +	int i, ret;
> +
> +	ili = devm_drm_panel_alloc(dev, struct ili9488, panel, &ili9488_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ili))
> +		return PTR_ERR(ili);
> +
> +	ili->desc = device_get_match_data(dev);
> +	ili->dsi = dsi;
> +
> +	dsi->mode_flags = ili->desc->mode_flags;
> +	dsi->format = ili->desc->format;
> +	dsi->lanes = ili->desc->lanes;
> +
> +	ili->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ili->reset))
> +		return dev_err_probe(dev, PTR_ERR(ili->reset),
> +				     "failed to get reset-gpios\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(ili->supplies); i++)
> +		ili->supplies[i].supply = regulator_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ili->supplies),
> +				      ili->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	ret = of_drm_get_panel_orientation(dev->of_node, &ili->orientation);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get orientation\n");
> +
> +	ret = drm_panel_of_backlight(&ili->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get backlight\n");
> +
> +	ili->panel.prepare_prev_first = true;
> +
> +	ret = devm_drm_panel_add(dev, &ili->panel);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to attach to DSI host\n");
> +
> +	return 0;
> +}
> +
> +static const struct ili9488_desc e35gh_i_mw800cb_desc = {
> +	.init_sequence = e35gh_i_mw800cb_init,
> +	.display_mode = &e35gh_i_mw800cb_display_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.format = MIPI_DSI_FMT_RGB666_PACKED,
> +	.lanes = 1,
> +	.bpc = 6,
> +};
> +
> +static const struct of_device_id ili9488_of_match[] = {
> +	{ .compatible = "focuslcds,e35gh-i-mw800cb", .data = &e35gh_i_mw800cb_desc },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, ili9488_of_match);
> +
> +static struct mipi_dsi_driver ili9488_dsi_driver = {
> +	.probe	= ili9488_dsi_probe,
> +	.driver = {
> +		.name		= "ili9488-dsi",
> +		.of_match_table	= ili9488_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(ili9488_dsi_driver);
> +
> +MODULE_AUTHOR("Igor Reznichenko <igor@reznichenko.net>");
> +MODULE_DESCRIPTION("Ilitek ILI9488 Controller Driver");
> +MODULE_LICENSE("GPL");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
