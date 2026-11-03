Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739916;
	b=VY4ABDNOV6+4Z4Afmg0SgmF9noPSJdSEuu3f7dExsGBCUbEYQahfBYIq36ILYnruVAc6
	 fPJBrDHxq0aaKsM9gVvISycvvKMl+uxtt2gZJXHQCFS42RGDLklXXwsAqwnrfKOcu/gHE
	 uwu5VnvlUMeVKgvw5R8YNMgrQHay6aagRsBh7EtRobdXzfVvu++iSWS84dDvTLTfAZbMi
	 0Ae+oXIVdzFbCY/hggyCfNOCzIJ5wzzFh2syduYPPF3bLYo5ksWhbLhHBNrYCx5+uzMZ/
	 8oBVYmNPc/mt8h9JQc0VibmgKz0A6bLaY/XmWb4YdfkNfY0NbtcgVssR40699Gb7f/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739916;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ODH+I76KvbHZgpFAyHU+cwv1v9uuSX3SbZqiaCAAvnI=;
	b=ZMShefku2VDBFgDT/NFmXYywwUv0DyKRUwFlpDNwZi2w+w6iQZORrdGRh0gN4CLAVFyv
	 euvSRhDnIAZeTwbZC+tdW3c2VaCdBBOlaqs0VZdgUQuWjD/ejqnzpQKK9SRCVRUHcFMkV
	 DtXeJC3lxXJJYfQLnF9nYKdXcVy9Gob9SY4igFsvy5UpF+m++sAOxfpCgCTMHZL2FPiui
	 KUGsovw47n+d2txahKn21EJD2EgajaIIgmo6R0INuNwMYT6T89+jwDkC9XCaibWcq7I4t
	 cLamZ70uqUGEk+f88wPyLKn/mkpxibvhg/pFYhHWvZJTV3nQcFaNhhDPQWlC3C/VFfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XiQJEIIK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A34606A31B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XiQJEIIK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA05D1F000C1;
	Tue,  3 Nov 2026 21:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793739916;
	bh=ODH+I76KvbHZgpFAyHU+cwv1v9uuSX3SbZqiaCAAvnI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XiQJEIIKdpAlMI3iVIl1td1l1byxJWO3lKFLCCe0FRpEKzVbl8OVHK0MCg64RSEcI
	 em1PO61l5oeeHm497nEGdilErz97RS2m3mwRu+N6jjQHFjdTT71JcPv3bJ5EqjkaUp
	 NVSSO6TdmZZwmIKzNaebh+po3fhh2ZBU6AIjmchbHSsJUuQ9rL6eUk1A/6Zw3i3Bh3
	 Lx8U6CsYptc/E52baY8OXBmwSBkjpKIYJQXdn9DStJxORvGoAMhF6TnnPMsfLEKjFX
	 NstYKM9p7zv8SJXXrPhYpMC46jhw0hzjmx7Z2a+fhOCJi/CLx8qy5NgONBskRxoodg
	 c6KdaG3cPYq3Q==
Message-ID: <sashiko-outbox-196034@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] drm/ch1115: add support for Chipwealth CH1115
 OLED controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Tmljb2zDoXMgQW50aW5vcmk=?= <nico.antinori.7@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <01cee5640e8637cbe0cd49e920f3aeed2c60640a.1793735996.git.nico.antinori.7@gmail.com>
References: <cover.1793735996.git.nico.antinori.7@gmail.com>
 <01cee5640e8637cbe0cd49e920f3aeed2c60640a.1793735996.git.nico.antinori.7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 21:05:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/ch1115: out-of-range display offset 64 sent in ch1115_oled_i=
nit()
- [Medium] drm/ch1115: missing DC-DC disable in ch1115_encoder_atomic_disab=
le()
--

commit e5268b4f2a7c534421925bdee0145caf63c50632
Author: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

drm/ch1115: add support for Chipwealth CH1115 OLED controller

This commit adds a DRM driver for Chipwealth CH1115 monochrome dot matrix
OLED panels connected over I2C.

> diff --git a/drivers/gpu/drm/tiny/ch1115-i2c.c b/drivers/gpu/drm/tiny/ch1=
115-i2c.c
> new file mode 100644
> index 0000000000000..08fee5a09f4f9
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/ch1115-i2c.c
> @@ -0,0 +1,859 @@

[ ... ]

> +static int ch1115_oled_init(struct ch1115_device *ch1115)
> +{
> +	u8 commands[] =3D {
> +		CH1115_CMD_OFF,
> +
> +		CH1115_CMD_CLOCK_DIVIDE_RATIO,
> +		CH1115_VAL_CLOCK_DIVIDE_RATIO(CH1115_VAL_CLOCK_OSC_FREQ,
> +					      CH1115_VAL_CLOCK_DIV_RATIO),
> +
> +		CH1115_CMD_MUX_RATIO,
> +		ch1115->height - 1,
> +
> +		CH1115_CMD_OFFSET,
> +		ch1115->flip_vertical
> +			? ch1115->y_start_offset
> +			: CH1115_MAX_HEIGHT - ch1115->y_start_offset,

[Severity: Medium]
Does ch1115_oled_init() send an out-of-range value for CH1115_CMD_OFFSET wh=
en
flip_vertical is false and y_start_offset is 0?

In ch1115_parse_dt(), y_start_offset defaults to 0 when the chipwealth,offs=
et
property is omitted, and is otherwise restricted to [0, CH1115_MAX_HEIGHT -=
 1]
(0 to 63):

	ret =3D of_property_read_u32(np, "chipwealth,offset", &val);
	if (ret) {
		ch1115->y_start_offset =3D 0;
	} else {
		if (val > CH1115_MAX_HEIGHT - 1) {
			dev_err(dev, "chipwealth,offset=3D%d must be [0-%d]\n",
				val, CH1115_MAX_HEIGHT - 1);
			return -EINVAL;
		}
		ch1115->y_start_offset =3D (u8)val;
	}

When ch1115_encoder_atomic_enable() calls ch1115_oled_init() with
flip_vertical set to false and y_start_offset set to 0, the expression
CH1115_MAX_HEIGHT - ch1115->y_start_offset evaluates to 64 (0x40), which
overflows the 6-bit [0, 63] vertical offset field instead of wrapping modulo
CH1115_MAX_HEIGHT to 0.

[ ... ]

> +static void ch1115_encoder_atomic_enable(struct drm_encoder *encoder,
> +					 struct drm_atomic_commit *state)
> +{
> +	struct drm_device *drm =3D encoder->dev;
> +	struct ch1115_device *ch1115 =3D drm_to_ch1115(drm);
> +	int ret;
> +
> +	ret =3D ch1115_oled_init(ch1115);
> +	if (ret < 0)
> +		return;
> +
> +	u8 command =3D CH1115_CMD_ON;
> +
> +	ret =3D ch1115_send_command_list(ch1115, &command, 1);
> +	if (ret < 0)
> +		return;
> +
> +	backlight_enable(ch1115->bl_dev);
> +}
> +
> +static void ch1115_encoder_atomic_disable(struct drm_encoder *encoder,
> +					  struct drm_atomic_commit *state)
> +{
> +	struct drm_device *drm =3D encoder->dev;
> +	struct ch1115_device *ch1115 =3D drm_to_ch1115(drm);
> +
> +	backlight_disable(ch1115->bl_dev);
> +
> +	u8 command =3D CH1115_CMD_OFF;
> +
> +	ch1115_send_command_list(ch1115, &command, 1);
> +}

[Severity: Medium]
Should ch1115_encoder_atomic_disable() also disable the internal DC-DC
converter?

When the encoder is enabled, ch1115_encoder_atomic_enable() calls
ch1115_oled_init(), which turns on the DC-DC converter with CH1115_CMD_DC_DC
and CH1115_VAL_DC_DC_ON. However, when the display is disabled via KMS or
during system shutdown via ch1115_shutdown() -> drm_atomic_helper_shutdown(=
),
ch1115_encoder_atomic_disable() only sends CH1115_CMD_OFF, leaving the DC-DC
converter enabled.

By contrast, ch1115_remove() explicitly sends CH1115_CMD_OFF,
CH1115_CMD_DC_DC, and CH1115_VAL_DC_DC_OFF after calling
drm_atomic_helper_shutdown():

	u8 cmd_list[] =3D {
		CH1115_CMD_OFF,
		CH1115_CMD_DC_DC,
		CH1115_VAL_DC_DC_OFF,
	};

	drm_dev_unplug(&ch1115->dev);
	drm_atomic_helper_shutdown(&ch1115->dev);

	ch1115_send_command_list(ch1115, cmd_list, ARRAY_SIZE(cmd_list));

If ch1115_encoder_atomic_disable() sent CH1115_CMD_OFF, CH1115_CMD_DC_DC, a=
nd
CH1115_VAL_DC_DC_OFF, wouldn't that properly power down the DC-DC converter=
 on
both KMS disable and ch1115_shutdown(), while avoiding the duplicate command
sequence in ch1115_remove()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793735996.gi=
t.nico.antinori.7@gmail.com?part=3D2
