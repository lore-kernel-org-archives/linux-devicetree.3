Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F6BA3D
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781877185; cv=none; b=uuNs0j+aj8m3dwVU5nZ5iRIhWl2u7ingRHso0+L6SuHLY1ENPeJ/tgusc7sBZk2a1iAp+rjlKlEep5Kdj1bvRUxavizc2yNlbqJUrD0QV1DDijz+TEHbExXQ36x/GNA6zo8CwbcEQ0QmYBZgBOzJi3UDgKUdsgITaWpFY0oEXkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781877185; c=relaxed/simple;
	bh=sVipsdU423aK2kXA8DaITqJSJy41e/eMqvYTgsBPUI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBy5XwpT3cGRdG1DQbOikNjK61K6B1Marj/lal22DIHMPv8zvth5GqoxEPoHmAn7EQ2zZz/r2qvu+C4x9eDDpBER1mG/KLPCPTiRiGhRKfUj30ZaLWMrgm9x927ZlvoEgajRwp/Rai7tECny2YnmHPoGucuqITcZfBI7qppn4Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Or4/zeFf; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Or4/zeFf"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4627adcf4d6so1433489f8f.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781877181; x=1782481981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6K2Ur05gdAaavOchY4pKqxsRI8lOAATul8r2ADh4jMc=;
        b=Or4/zeFfB6/caHr7OnIAtL0o6U0vXVGHTNDlLu2sHdxt1j/VKfKsqJxW1tu/jpJT4a
         2lSemQHtUf+LjeEbhjdRAQJstXtdy6nP6DjTE+UvonWdQPt9iuQRNZ78gEdASwQA99Kf
         Zd8LDWLSf1FnDmwaGuw+B1BCnCtHSFiWpDgIrlUuJj8bJWN7SWBVb8hrFUafHAqhte6+
         UtAdT7wWIdPCb1GbWaiF0InCsxjONpXwNboayWfUqMQmfiPyhYvvYaC/0TPX7VNziKjB
         Kbwk7dBUQXWg7OpQ6tJ3lvgmYWoLsXehDIAXyMSFW2A7G92bxNFLpsYXmHfXZZ8Lk3YM
         dz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781877181; x=1782481981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6K2Ur05gdAaavOchY4pKqxsRI8lOAATul8r2ADh4jMc=;
        b=JLyUg7M7PlPEPInaDnanZtVSNgBA11AKqjNOjJgZ0glM5fZtUQJmJMSmMJOhJdd/OV
         qOS0jgyn1XVZjum0bFnqfzG0iWqBe6B2fV8J0HY+SUI01DGMLQHqk8ki382/LN02FU7i
         nhaWLiaP4/Ca3lgzQwUK5j2AvzGOkeFfgKaU0pHrV8Jp5GZY5Cg2lmy8i++oKvFvTaOw
         oBlyW2aVxU61GNe8C0j8Z0hlzmuWKHRahue+yZsykmFKeS/Y03aEtpX9lzgxJhE8rTUW
         CXODuW+SEd4dwdg1DGkC+L6E+hmbHAo07HwL4HAFPJtsZnAh9geZQKaw/pNVwCucVh4m
         Q6gA==
X-Forwarded-Encrypted: i=1; AFNElJ8Zp4oAa66dmm1GI8T+tNeJ5wxdyL+qHgEmaFT7sLJMTWbz6CtUdu/9q9E468Q5hksFTSn4MEzaP9Yl@vger.kernel.org
X-Gm-Message-State: AOJu0YwvkYJgz6maLJrH2u84by/hKOM1KUOsuthrv8rJf+AgutmM1vu4
	l6EKVUzPFDTjfIp1WaRrkJV+F8c7zVZN60/ToxHFKq6s/IPWKJZscORuYjkCiZgQGfA=
X-Gm-Gg: AfdE7cnhKTpu2MBm5LO7LHiKC2GT8FOe7X/BLe61NNxHwyn1PPRWKt3nhauMKNYZ7jH
	nQYLawhdE4UMHGdHMj6n/vUsArJ243m2ATLTdI7dEsHdctUOq6xmAfEciTs1CYoC+jsF3GVNC1n
	F3t91c5/aZgSLc4tVTtChKDGxvxYa3Yvvxmh5DeZosUF3xalM5IGTepgGzoD9Hciy7qfAd8xTkO
	B+AcR3KkoA7O0UcQw0MbEriXqJDldV0jDQgKIDLr3mMjOy8w5Z9vBB/EfdIig0ILZaKSy0/TW2g
	4e00kMUzwpxPmUbPmgwPYh0kFglkk7ryry8olzzarNYqwv5PgqpeVfTHKycvWSgY67tqwO5HdEg
	5tDkFNwkK8iDAerJ4Qc7Z/YO+gVoS2nPRVdERZ0UG9Xbki0CiKrmOWI60tuPW1VZJ860GMK5uwR
	qHs98IC0x3zpmhA+I4m1D8Xz8Is2OaPm9WDltXYnM8VcORf83Zddx5vVgXr0HRIgfry0pfolXwi
	1k=
X-Received: by 2002:a05:600c:e558:10b0:490:bcc1:4edb with SMTP id 5b1f17b1804b1-49240e95442mr41686305e9.27.1781877181010;
        Fri, 19 Jun 2026 06:53:01 -0700 (PDT)
Received: from localhost (p200300f65f47db04359fc0e70763236f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:359f:c0e7:763:236f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fd15470sm79804975e9.2.2026.06.19.06.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:53:00 -0700 (PDT)
Date: Fri, 19 Jun 2026 15:52:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, javierm@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/solomon: Add SSD1351 OLED display driver
Message-ID: <ajVJYpBM7sn_aofN@monoceros>
References: <20260610164428.180091-1-amit.barzilai22@gmail.com>
 <20260610164428.180091-3-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sxaa2xduwleqhihl"
Content-Disposition: inline
In-Reply-To: <20260610164428.180091-3-amit.barzilai22@gmail.com>


--sxaa2xduwleqhihl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm/solomon: Add SSD1351 OLED display driver
MIME-Version: 1.0

On Wed, Jun 10, 2026 at 07:44:28PM +0300, Amit Barzilai wrote:
> Add a DRM/KMS driver for the Solomon SSD1351, a 128x128 65k-color RGB
> OLED controller driven over a 4-wire SPI bus (clock, data, chip-select
> and a Data/Command GPIO).
>=20
> Unlike the monochrome and grayscale SSD13xx parts handled by the ssd130x
> driver, the SSD1351 has a native 16-bit RGB565 frame format, so the
> driver uploads pixels as RGB565 rather than down-converting to RGB332.
> Its command set (column/row range 0x15/0x75, write-RAM 0x5c) differs from
> MIPI DCS, so the generic mipi_dbi helpers cannot be reused for the pixel
> path and a small SPI command/data layer is implemented instead.
>=20
> The driver advertises XRGB8888 to userspace and converts to big-endian
> RGB565 on flush via drm_fb_xrgb8888_to_rgb565be(), building on the GEM
> SHMEM and atomic modeset/shadow-plane helpers with damage-clipped partial
> updates. Panels wired with a BGR sub-pixel order are handled through the
> colour remap register.
>=20
> Also add the DRM_SSD1351 Kconfig/Makefile entries and a MAINTAINERS
> record.
>=20
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> ---
>  MAINTAINERS                       |   7 +
>  drivers/gpu/drm/solomon/Kconfig   |  14 +
>  drivers/gpu/drm/solomon/Makefile  |   1 +
>  drivers/gpu/drm/solomon/ssd1351.c | 556 ++++++++++++++++++++++++++++++
>  4 files changed, 578 insertions(+)
>  create mode 100644 drivers/gpu/drm/solomon/ssd1351.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e80296449ba..1e2b662c5aed 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8377,6 +8377,13 @@ F:	Documentation/devicetree/bindings/display/solom=
on,ssd-common.yaml
>  F:	Documentation/devicetree/bindings/display/solomon,ssd13*.yaml
>  F:	drivers/gpu/drm/solomon/ssd130x*
> =20
> +DRM DRIVER FOR SOLOMON SSD1351 OLED DISPLAYS
> +M:	Amit Barzilai <amit.barzilai22@gmail.com>
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
> +F:	drivers/gpu/drm/solomon/ssd1351.c
> +
>  DRM DRIVER FOR ST-ERICSSON MCDE
>  M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
> diff --git a/drivers/gpu/drm/solomon/Kconfig b/drivers/gpu/drm/solomon/Kc=
onfig
> index 400a6cab3a67..957dc36dc495 100644
> --- a/drivers/gpu/drm/solomon/Kconfig
> +++ b/drivers/gpu/drm/solomon/Kconfig
> @@ -30,3 +30,17 @@ config DRM_SSD130X_SPI
>  	  Say Y here if the SSD13xx OLED display is connected via SPI bus.
> =20
>  	  If M is selected the module will be called ssd130x-spi.
> +
> +config DRM_SSD1351
> +	tristate "DRM support for Solomon SSD1351 OLED displays"
> +	depends on DRM && SPI && MMU
> +	select DRM_CLIENT_SELECTION
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
> +	help
> +	  DRM driver for the Solomon SSD1351 RGB565 color OLED controller
> +	  connected via 4-wire SPI. It drives up to a 128x128 65k-color
> +	  panel and uploads pixels in the controller's native RGB565
> +	  format, exposing a standard DRM/KMS device to userspace.
> +
> +	  If M is selected the module will be called ssd1351.
> diff --git a/drivers/gpu/drm/solomon/Makefile b/drivers/gpu/drm/solomon/M=
akefile
> index b5fc792257d7..35ca60e4cf36 100644
> --- a/drivers/gpu/drm/solomon/Makefile
> +++ b/drivers/gpu/drm/solomon/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_DRM_SSD130X)	+=3D ssd130x.o
>  obj-$(CONFIG_DRM_SSD130X_I2C)	+=3D ssd130x-i2c.o
>  obj-$(CONFIG_DRM_SSD130X_SPI)	+=3D ssd130x-spi.o
> +obj-$(CONFIG_DRM_SSD1351)	+=3D ssd1351.o
> diff --git a/drivers/gpu/drm/solomon/ssd1351.c b/drivers/gpu/drm/solomon/=
ssd1351.c
> new file mode 100644
> index 000000000000..7c4a5c461afb
> --- /dev/null
> +++ b/drivers/gpu/drm/solomon/ssd1351.c
> @@ -0,0 +1,556 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * DRM driver for the Solomon SSD1351 RGB565 color OLED controller
> + *
> + * The SSD1351 drives up to a 128x128 65k-color OLED panel over a 4-wire
> + * SPI bus (clock, data, chip-select and a Data/Command GPIO). Unlike the
> + * monochrome and grayscale SSD13xx parts handled by the ssd130x driver,
> + * the SSD1351 has a native 16-bit RGB565 frame format, so this driver
> + * uploads pixels as RGB565 rather than down-converting to RGB332.
> + *
> + * The command set (column/row range 0x15/0x75, write-RAM 0x5c) differs
> + * from MIPI DCS, so the generic mipi_dbi helpers cannot be reused for t=
he
> + * pixel path; a small SPI command/data layer is implemented here instea=
d.
> + *
> + * Author: Amit Barzilai <amit.barzilai22@gmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/spi/spi.h>
> +
> +#include <drm/clients/drm_client_setup.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fbdev_shmem.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_modeset_helper.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_rect.h>
> +
> +#define SSD1351_WIDTH 128
> +#define SSD1351_HEIGHT 128
> +
> +/* Commands */
> +#define SSD1351_SET_COL_ADDRESS 0x15
> +#define SSD1351_WRITE_RAM 0x5c
> +#define SSD1351_SET_ROW_ADDRESS 0x75
> +#define SSD1351_SET_REMAP 0xa0
> +#define SSD1351_SET_START_LINE 0xa1
> +#define SSD1351_SET_DISPLAY_OFFSET 0xa2
> +#define SSD1351_SET_DISPLAY_NORMAL 0xa6
> +#define SSD1351_SET_FUNCTION 0xab
> +#define SSD1351_SET_DISPLAY_OFF 0xae
> +#define SSD1351_SET_DISPLAY_ON 0xaf
> +#define SSD1351_SET_PHASE_LENGTH 0xb1
> +#define SSD1351_SET_CLOCK_DIV 0xb3
> +#define SSD1351_SET_VSL 0xb4
> +#define SSD1351_SET_GPIO 0xb5
> +#define SSD1351_SET_PRECHARGE2 0xb6
> +#define SSD1351_SET_PRECHARGE 0xbb
> +#define SSD1351_SET_VCOMH 0xbe
> +#define SSD1351_SET_CONTRAST 0xc1
> +#define SSD1351_SET_CONTRAST_MASTER 0xc7
> +#define SSD1351_SET_MUX_RATIO 0xca
> +#define SSD1351_SET_COMMAND_LOCK 0xfd
> +
> +/* Re-map / Color Depth (command 0xa0) bits */
> +#define SSD1351_REMAP_COLUMN BIT(1) /* reverse column (SEG) order */
> +#define SSD1351_REMAP_COLOR_BGR BIT(2) /* swap sub-pixel color order */
> +#define SSD1351_REMAP_COM_SCAN BIT(4) /* reverse COM scan direction */
> +#define SSD1351_REMAP_COM_SPLIT BIT(5) /* odd/even COM split */
> +#define SSD1351_REMAP_65K BIT(6) /* 65k (RGB565) color depth */
> +
> +struct ssd1351_device {
> +	struct drm_device drm;
> +	struct spi_device *spi;
> +	struct gpio_desc *reset;
> +	struct gpio_desc *dc;
> +	u32 rotation;
> +
> +	/* Scratch buffer holding one frame of RGB565 pixels for SPI upload */
> +	u8 *tx_buf;
> +
> +	struct drm_plane plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +};
> +
> +static struct ssd1351_device *drm_to_ssd1351(struct drm_device *drm)
> +{
> +	return container_of(drm, struct ssd1351_device, drm);
> +}
> +
> +/*
> + * SPI access. The D/C GPIO selects whether the bytes shifted out are
> + * interpreted as a command (low) or as data (high).
> + */
> +static int ssd1351_write_cmd(struct ssd1351_device *ssd1351, u8 cmd,
> +			     const u8 *params, size_t num)
> +{
> +	int ret;
> +
> +	gpiod_set_value_cansleep(ssd1351->dc, 0);
> +	ret =3D spi_write(ssd1351->spi, &cmd, 1);
> +	if (ret)
> +		return ret;
> +
> +	if (num) {
> +		gpiod_set_value_cansleep(ssd1351->dc, 1);
> +		ret =3D spi_write(ssd1351->spi, params, num);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Send a command followed by a fixed list of single-byte parameters. */
> +#define ssd1351_command(ssd1351, cmd, ...)                   \
> +	({                                                   \
> +		static const u8 _params[] =3D { __VA_ARGS__ }; \
> +		ssd1351_write_cmd((ssd1351), (cmd), _params, \
> +				  ARRAY_SIZE(_params));      \
> +	})
> +
> +static void ssd1351_reset(struct ssd1351_device *ssd1351)
> +{
> +	if (!ssd1351->reset)
> +		return;
> +
> +	/*
> +	 * Work in logical levels: 1 asserts reset, 0 releases it. The DT's
> +	 * GPIO_ACTIVE_LOW flag handles the physical inversion, so this pulse is
> +	 * correct regardless of how the board wires the RES# line.
> +	 */
> +	gpiod_set_value_cansleep(ssd1351->reset, 1);
> +	usleep_range(20, 1000);
> +	gpiod_set_value_cansleep(ssd1351->reset, 0);
> +	msleep(120);
> +}
> +
> +static int ssd1351_init_display(struct ssd1351_device *ssd1351)
> +{
> +	u8 remap =3D SSD1351_REMAP_65K | SSD1351_REMAP_COM_SPLIT |
> +		   SSD1351_REMAP_COLOR_BGR;
> +	int ret;
> +
> +	ssd1351_reset(ssd1351);
> +
> +	/* Unlock the controller and allow access to all command registers */
> +	ret =3D ssd1351_command(ssd1351, SSD1351_SET_COMMAND_LOCK, 0x12);
> +	if (ret)
> +		return ret;
> +	ret =3D ssd1351_command(ssd1351, SSD1351_SET_COMMAND_LOCK, 0xb1);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ssd1351_command(ssd1351, SSD1351_SET_DISPLAY_OFF);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_CLOCK_DIV, 0xf1);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_MUX_RATIO, 0x7f);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_COL_ADDRESS, 0x00, =
0x7f);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_ROW_ADDRESS, 0x00, =
0x7f);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_START_LINE, 0x00);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_DISPLAY_OFFSET, 0x0=
0);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_GPIO, 0x00);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_FUNCTION, 0x01);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_PHASE_LENGTH, 0x32);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_VSL, 0xa0, 0xb5, 0x=
55);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_PRECHARGE, 0x17);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_VCOMH, 0x05);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_CONTRAST, 0xc8, 0x8=
0, 0xc8);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_CONTRAST_MASTER, 0x=
0f);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_PRECHARGE2, 0x01);
> +	ret =3D ret ?: ssd1351_command(ssd1351, SSD1351_SET_DISPLAY_NORMAL);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Select 65k (RGB565) color depth and the orientation. 0 and 180 degre=
es
> +	 * are reached with the column/COM-scan mirror bits while keeping the
> +	 * controller in horizontal address-increment mode, which matches the
> +	 * row-major pixel data produced below. The hardware can also rotate by
> +	 * 90/270 via the vertical address-increment bit, but that transposes t=
he
> +	 * upload and would require a transposing blit + window remap that this
> +	 * driver does not implement; such rotations are rejected at probe.
> +	 */
> +	if (ssd1351->rotation =3D=3D 180)
> +		remap |=3D SSD1351_REMAP_COLUMN;
> +	else
> +		remap |=3D SSD1351_REMAP_COM_SCAN;
> +
> +	ret =3D ssd1351_write_cmd(ssd1351, SSD1351_SET_REMAP, &remap, 1);
> +	if (ret)
> +		return ret;
> +
> +	return ssd1351_command(ssd1351, SSD1351_SET_DISPLAY_ON);
> +}
> +
> +static void ssd1351_fb_blit_rect(struct ssd1351_device *ssd1351,
> +				 struct drm_framebuffer *fb,
> +				 const struct iosys_map *vmap,
> +				 struct drm_rect *rect,
> +				 struct drm_format_conv_state *fmtcnv_state)
> +{
> +	unsigned int width =3D drm_rect_width(rect);
> +	unsigned int height =3D drm_rect_height(rect);
> +	unsigned int dst_pitch =3D width * sizeof(u16);
> +	struct iosys_map dst;
> +	u8 range[2];
> +
> +	iosys_map_set_vaddr(&dst, ssd1351->tx_buf);
> +
> +	/*
> +	 * The panel expects RGB565 most-significant byte first; the big-endian
> +	 * conversion produces exactly that byte stream for the 8-bit SPI words.
> +	 */
> +	drm_fb_xrgb8888_to_rgb565be(&dst, &dst_pitch, vmap, fb, rect,
> +				    fmtcnv_state);
> +
> +	range[0] =3D rect->x1;
> +	range[1] =3D rect->x2 - 1;
> +	if (ssd1351_write_cmd(ssd1351, SSD1351_SET_COL_ADDRESS, range,
> +			      sizeof(range)))
> +		return;
> +
> +	range[0] =3D rect->y1;
> +	range[1] =3D rect->y2 - 1;
> +	if (ssd1351_write_cmd(ssd1351, SSD1351_SET_ROW_ADDRESS, range,
> +			      sizeof(range)))
> +		return;
> +
> +	ssd1351_write_cmd(ssd1351, SSD1351_WRITE_RAM, ssd1351->tx_buf,
> +			  width * height * sizeof(u16));
> +}
> +
> +/*
> + * Plane
> + */
> +
> +static int ssd1351_plane_atomic_check(struct drm_plane *plane,
> +				      struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *plane_state =3D
> +		drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_crtc *crtc =3D plane_state->crtc;
> +	struct drm_crtc_state *crtc_state =3D NULL;
> +
> +	if (crtc)
> +		crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +
> +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						   DRM_PLANE_NO_SCALING,
> +						   DRM_PLANE_NO_SCALING, false,
> +						   false);
> +}
> +
> +static void ssd1351_plane_atomic_update(struct drm_plane *plane,
> +					struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *plane_state =3D
> +		drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_plane_state =3D
> +		drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state =3D
> +		to_drm_shadow_plane_state(plane_state);
> +	struct ssd1351_device *ssd1351 =3D drm_to_ssd1351(plane->dev);
> +	struct drm_framebuffer *fb =3D plane_state->fb;
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_rect damage;
> +	struct drm_rect dst_clip;
> +	int idx;
> +
> +	if (!fb)
> +		return;
> +
> +	if (!drm_dev_enter(&ssd1351->drm, &idx))
> +		return;
> +
> +	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
> +		goto out_drm_dev_exit;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		dst_clip =3D plane_state->dst;
> +
> +		if (!drm_rect_intersect(&dst_clip, &damage))
> +			continue;
> +
> +		ssd1351_fb_blit_rect(ssd1351, fb, &shadow_plane_state->data[0],
> +				     &dst_clip,
> +				     &shadow_plane_state->fmtcnv_state);
> +	}
> +
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +
> +out_drm_dev_exit:
> +	drm_dev_exit(idx);
> +}
> +
> +static const struct drm_plane_helper_funcs ssd1351_plane_helper_funcs =
=3D {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check =3D ssd1351_plane_atomic_check,
> +	.atomic_update =3D ssd1351_plane_atomic_update,
> +};
> +
> +static const struct drm_plane_funcs ssd1351_plane_funcs =3D {
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
> +	.update_plane =3D drm_atomic_helper_update_plane,
> +	.disable_plane =3D drm_atomic_helper_disable_plane,
> +	.destroy =3D drm_plane_cleanup,
> +};
> +
> +static const u32 ssd1351_formats[] =3D {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +/*
> + * CRTC
> + */
> +
> +static void ssd1351_crtc_atomic_enable(struct drm_crtc *crtc,
> +				       struct drm_atomic_state *state)
> +{
> +	struct ssd1351_device *ssd1351 =3D drm_to_ssd1351(crtc->dev);
> +	int idx, ret;
> +
> +	if (!drm_dev_enter(crtc->dev, &idx))
> +		return;
> +
> +	ret =3D ssd1351_init_display(ssd1351);
> +	if (ret)
> +		drm_err(crtc->dev, "Failed to initialize display: %d\n", ret);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static void ssd1351_crtc_atomic_disable(struct drm_crtc *crtc,
> +					struct drm_atomic_state *state)
> +{
> +	struct ssd1351_device *ssd1351 =3D drm_to_ssd1351(crtc->dev);
> +	int idx;
> +
> +	if (!drm_dev_enter(crtc->dev, &idx))
> +		return;
> +
> +	ssd1351_command(ssd1351, SSD1351_SET_DISPLAY_OFF);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static const struct drm_crtc_helper_funcs ssd1351_crtc_helper_funcs =3D {
> +	.atomic_check =3D drm_crtc_helper_atomic_check,
> +	.atomic_enable =3D ssd1351_crtc_atomic_enable,
> +	.atomic_disable =3D ssd1351_crtc_atomic_disable,
> +};
> +
> +static const struct drm_crtc_funcs ssd1351_crtc_funcs =3D {
> +	.reset =3D drm_atomic_helper_crtc_reset,
> +	.destroy =3D drm_crtc_cleanup,
> +	.set_config =3D drm_atomic_helper_set_config,
> +	.page_flip =3D drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +/*
> + * Encoder
> + */
> +
> +static const struct drm_encoder_funcs ssd1351_encoder_funcs =3D {
> +	.destroy =3D drm_encoder_cleanup,
> +};
> +
> +/*
> + * Connector
> + */
> +
> +static const struct drm_display_mode ssd1351_mode =3D {
> +	DRM_SIMPLE_MODE(SSD1351_WIDTH, SSD1351_HEIGHT, 24, 24),
> +};
> +
> +static int ssd1351_connector_get_modes(struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &ssd1351_mode);
> +}
> +
> +static const struct drm_connector_helper_funcs ssd1351_connector_helper_=
funcs =3D {
> +	.get_modes =3D ssd1351_connector_get_modes,
> +};
> +
> +static const struct drm_connector_funcs ssd1351_connector_funcs =3D {
> +	.reset =3D drm_atomic_helper_connector_reset,
> +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> +	.destroy =3D drm_connector_cleanup,
> +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static const struct drm_mode_config_funcs ssd1351_mode_config_funcs =3D {
> +	.fb_create =3D drm_gem_fb_create_with_dirty,
> +	.atomic_check =3D drm_atomic_helper_check,
> +	.atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +/*
> + * Driver
> + */
> +
> +DEFINE_DRM_GEM_FOPS(ssd1351_fops);
> +
> +static const struct drm_driver ssd1351_driver =3D {
> +	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops =3D &ssd1351_fops,
> +	DRM_GEM_SHMEM_DRIVER_OPS,
> +	DRM_FBDEV_SHMEM_DRIVER_OPS,
> +	.name =3D "ssd1351",
> +	.desc =3D "Solomon SSD1351",
> +	.major =3D 1,
> +	.minor =3D 0,
> +};
> +
> +static int ssd1351_probe(struct spi_device *spi)
> +{
> +	struct device *dev =3D &spi->dev;
> +	struct ssd1351_device *ssd1351;
> +	struct drm_device *drm;
> +	int ret;
> +
> +	ssd1351 =3D devm_drm_dev_alloc(dev, &ssd1351_driver,
> +				     struct ssd1351_device, drm);
> +	if (IS_ERR(ssd1351))
> +		return PTR_ERR(ssd1351);
> +
> +	drm =3D &ssd1351->drm;
> +	ssd1351->spi =3D spi;
> +	spi_set_drvdata(spi, drm);
> +
> +	ssd1351->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH=
);
> +	if (IS_ERR(ssd1351->reset))
> +		return dev_err_probe(dev, PTR_ERR(ssd1351->reset),
> +				     "Failed to get reset GPIO\n");
> +
> +	ssd1351->dc =3D devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
> +	if (IS_ERR(ssd1351->dc))
> +		return dev_err_probe(dev, PTR_ERR(ssd1351->dc),
> +				     "Failed to get D/C GPIO\n");
> +
> +	device_property_read_u32(dev, "rotation", &ssd1351->rotation);
> +	if (ssd1351->rotation !=3D 0 && ssd1351->rotation !=3D 180)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Unsupported rotation %u; only 0 and 180 are supported\n",
> +				     ssd1351->rotation);
> +
> +	ssd1351->tx_buf =3D devm_kmalloc(dev,
> +				       SSD1351_WIDTH * SSD1351_HEIGHT * sizeof(u16),
> +				       GFP_KERNEL);
> +	if (!ssd1351->tx_buf)
> +		return -ENOMEM;
> +
> +	ret =3D drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	drm->mode_config.min_width =3D SSD1351_WIDTH;
> +	drm->mode_config.max_width =3D SSD1351_WIDTH;
> +	drm->mode_config.min_height =3D SSD1351_HEIGHT;
> +	drm->mode_config.max_height =3D SSD1351_HEIGHT;
> +	drm->mode_config.preferred_depth =3D 24;
> +	drm->mode_config.funcs =3D &ssd1351_mode_config_funcs;
> +
> +	ret =3D drm_universal_plane_init(drm, &ssd1351->plane, 0,
> +				       &ssd1351_plane_funcs, ssd1351_formats,
> +				       ARRAY_SIZE(ssd1351_formats), NULL,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return ret;
> +	drm_plane_helper_add(&ssd1351->plane, &ssd1351_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(&ssd1351->plane);
> +
> +	ret =3D drm_crtc_init_with_planes(drm, &ssd1351->crtc, &ssd1351->plane,
> +					NULL, &ssd1351_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +	drm_crtc_helper_add(&ssd1351->crtc, &ssd1351_crtc_helper_funcs);
> +
> +	ret =3D drm_encoder_init(drm, &ssd1351->encoder, &ssd1351_encoder_funcs,
> +			       DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret)
> +		return ret;
> +	ssd1351->encoder.possible_crtcs =3D drm_crtc_mask(&ssd1351->crtc);
> +
> +	ret =3D drm_connector_init(drm, &ssd1351->connector,
> +				 &ssd1351_connector_funcs,
> +				 DRM_MODE_CONNECTOR_SPI);
> +	if (ret)
> +		return ret;
> +	drm_connector_helper_add(&ssd1351->connector,
> +				 &ssd1351_connector_helper_funcs);
> +
> +	ret =3D drm_connector_attach_encoder(&ssd1351->connector,
> +					   &ssd1351->encoder);
> +	if (ret)
> +		return ret;
> +
> +	drm_mode_config_reset(drm);
> +
> +	ret =3D drm_dev_register(drm, 0);
> +	if (ret)
> +		return ret;
> +
> +	drm_client_setup(drm, NULL);
> +
> +	return 0;
> +}
> +
> +static void ssd1351_remove(struct spi_device *spi)
> +{
> +	struct drm_device *drm =3D spi_get_drvdata(spi);
> +
> +	drm_dev_unplug(drm);
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static void ssd1351_shutdown(struct spi_device *spi)
> +{
> +	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
> +}
> +
> +static const struct of_device_id ssd1351_of_match[] =3D {
> +	{ .compatible =3D "solomon,ssd1351" },
> +	{}

s/{}/{ }/ to match the most used style.

> +};
> +MODULE_DEVICE_TABLE(of, ssd1351_of_match);
> +
> +static const struct spi_device_id ssd1351_id[] =3D { { "ssd1351", 0 }, {=
} };

Please make this:

static const struct spi_device_id ssd1351_id[] =3D {
	{ .name =3D "ssd1351" },
	{ }
};

Best regards
Uwe

--sxaa2xduwleqhihl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo1SbgACgkQj4D7WH0S
/k5yiQf/V1GjSHL/YJOeItQRR2nKyOkpuOkKFoQWKjenYLzQk6Ftl9W6jLcvof9P
EsN2dXl9MhYaoNm+qz6RxpszySADy0WL76cjudX4Ve3/rrjA+mOKpREKE2SB9SxI
4DWQ52Ye0sidxS71qnMN1NGU/YJHmRy6sTpeMOJ23w4vnQOcRGkmV+87Sg7Y40J7
8q0qA2iNbBA2l7Gs3VVCPCYPQNr92KiKcpFky2BF5zYoLf8pIvCqArDtCzra50lB
AdPewSz843cps4zWxuvwmjwURtkyvemQvsfb2ULw3Qd8ddGRsxYpYdQ8ZUsjiWqr
9QTZ2/NSWDe8bGy3gEE5p1sQcunRxQ==
=Xxwr
-----END PGP SIGNATURE-----

--sxaa2xduwleqhihl--
