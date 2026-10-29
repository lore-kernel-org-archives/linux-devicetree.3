Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288413;
	b=47Nfiv2J/RY03GG51JCmsiNFu7kUJF0Ls5+MGr76nTfuJcQOkFK693E3VKq2JB0u6/hK
	 h+mEAZy/bCwKxTjS/CWbRlS55eLMji/sQq1jeTxrM9i2P6gIgDD77XSGn3Y2bfbMv+6Gd
	 eY9RqmGEvBkjxXGCLsRYo/YLDYslohXSyUtb38Hzw/guqOYtvfKNrgTIDY7u6fIydO8vJ
	 k/XGsKcjfnqbJMCu8drfo+ipvcVfAOJtOHibRaZDpCMK35V+IVs7CquuK+VZa3DP52CJI
	 YpswfgfpS/SH0uTsvaxPEYCx5Kc8ubbc3qy88cDJHrujNZuNDz4eZu7ZEbikeVHGYmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288413;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RHw1aYirtGLWEJrMfPnVO+TQAlJFan7Jz73AK4ixAno=;
	b=oEMwtsVU5QYQ5lFYPpeHmy2zZmkC5dzUfcRytmlugxEH2MqM5Ck908YAw95WzPwUsvaV
	 bVl0Sg4n84hF3P95EhL7vfNB8hxOF1V4ztPuqMeGSXNkF1zmYKDesdtzT8BM3cqalWZR/
	 WZ+ppKP2wMDBKaxtd3RBxUZ08eybcGWHQxjRvBm/7/OaM23OIVsUbK9VLl2yjbR8fZD3m
	 gMD4Ji8Tu8UmAXhbmndROSwt5FqLKDKwMpfvpUvRiaVTutwgdWHuJ7c8oikyjzmI2R0+E
	 i+4KAwb3SmrfLhS6fXzalDlnU2LPZVWe5CEtwjpYcU4C9DZEfFo7OjJ8Gqh7lXt0YDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XlzxxB18;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E463C606A331
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XlzxxB18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3136C1F01816;
	Thu, 29 Oct 2026 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793288412;
	bh=RHw1aYirtGLWEJrMfPnVO+TQAlJFan7Jz73AK4ixAno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XlzxxB183dig8nNxRzKCrPIxh70Y4BKALIobC8q0/qnRgD3RNFSU3mtKeAUi2Z/fP
	 vi21RvPbHIqFDc4WlNwbOKXQcAUQMmt/n8WgR6MYNZCkXULqtWhbbBEQTRA3lF36du
	 G0gpVoH59013sIji8bJjc7lgQdscMas3EuntuudpUJRmqbTvmQRGUyTthdz/VnAEWg
	 Q8w6PDj9grKL0awA8K8XAJUKDP6/WFQl7pKpSXurbxbBsSNzH9z6PXtNwhMG4bUmIz
	 vM176+PYhg3CEoCXDhPutAL5KofX0/5FopNjP9yhvhjHSiIVEmzyguspptaPKwl9/E
	 gCZKBmhRDpKHg==
Message-ID: <sashiko-outbox-189624@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/11] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI
 Type B panel driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029152909.234584-4-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
 <20261029152909.234584-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 15:40:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/panel: selecting DRM_MIPI_DBI without SPI breaks CONFIG_SPI=3Dn=
 build
--

commit 6d2fecb3d7209826695a1566f8263dc71e26e02f
Author: Svyatoslav Ryhel <clamor95@gmail.com>

drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver

This commit adds a DRM panel driver for the Hitachi TX10D07VM0BAA 4" WVGA M=
IPI
DBI Type B panel used in the LG Optimus 2X P990 smartphone.

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7a520b4d60fef..0e86628bcdb80 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -274,6 +274,20 @@ config DRM_PANEL_HIMAX_HX8394
> =20
>  	  If M is selected the module will be called panel-himax-hx8394.
> =20
> +config DRM_PANEL_HITACHI_TX10D07VM0BAA
> +	tristate "Hitachi TX10D07VM0BAA MIPI DBI Type B panel"
> +	depends on OF
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_MIPI_DBI

[Severity: Low]
Does selecting DRM_MIPI_DBI here without a dependency on SPI cause a build
regression when CONFIG_SPI is disabled?

Previously, every Kconfig symbol selecting DRM_MIPI_DBI either depended on =
SPI
or used conditional selection on SPI. With DRM_PANEL_HITACHI_TX10D07VM0BAA
selecting DRM_MIPI_DBI unconditionally, drivers/gpu/drm/drm_mipi_dbi.c can =
now
be built with CONFIG_SPI=3Dn.

In drivers/gpu/drm/drm_mipi_dbi.c, mipi_dbi_dcs_read_commands is defined
outside the CONFIG_SPI guard:

static const u8 mipi_dbi_dcs_read_commands[] =3D {
	MIPI_DCS_GET_DISPLAY_ID,
	...
};

However, its only user is mipi_dbi_spi_init(), which is inside the
#if IS_ENABLED(CONFIG_SPI) block:

int mipi_dbi_spi_init(struct spi_device *spi, struct mipi_dbi *dbi,
		      struct gpio_desc *dc)
{
	...
	dbi->read_commands =3D mipi_dbi_dcs_read_commands;

Because drivers/gpu/drm/Makefile enables -Wunused-const-variable:

subdir-ccflags-y +=3D $(call cc-option, -Wunused-const-variable)

building with CONFIG_DRM_PANEL_HITACHI_TX10D07VM0BAA enabled and CONFIG_SPI=
=3Dn
triggers an unused-const-variable warning on mipi_dbi_dcs_read_commands (wh=
ich
becomes a build error with CONFIG_DRM_WERROR or CONFIG_WERROR).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029152909.2345=
84-1-clamor95@gmail.com?part=3D3
