Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877498;
	b=nJoKFYKGBgAOk7Ef3vxXVl88Zv009zSrUHtlTeSAWw3dZf1yqBly4wYyVcWlwUJXWJwb
	 OObIKvzMmInC58807xnlBWmT4mhPFAM0tM0xeXUeFufmkYNWscz12E/sIbUviQ819Y+bW
	 BAIl4CEzJ8XXXIXgQiVTUOM3eGZxDIpJb1/JytSJK1d0H7EMFzhmX+W1MLUZXKhShUqHg
	 1c7hawEzNAzJewIjL1ol4LnjADLdRNLnYYPcMfiTwPm9So2JJ9SOwwz45M1uvGHuDiJWa
	 A5D01zc4pnokXP38U5bX8CVpMFomBJ4Nvpv3CSlY0xanjGmyROyu29aryrEZwadKSQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877498;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rwkoPLfqLMt8+KY9KmDINo6RWXIs/1Kdx/CcqZY0kiw=;
	b=YL4bHpM6VlMeDgqPbkhLNrs5wscnC7E2oKRuuGqtYFmCzSst8umjDXruJmjVmycq96vD
	 pdeam6IdtXqx+IemFyfqI8Fu/sJlj6GmUBSZl8hSgBWIRZkGH9mYHspEGLETcWM9kFZeN
	 XEyPa5/P53nv0yk6UR47P/+RoOnLu9SsHxPtllVgVdPTaOKD1/PLjxyxXZkxMj/QjZp+P
	 YrPlZLyiEOMRSZiU6x3i5/1vevGi6tl6Y2cvsRke49Xr3IhqRYzqFe3d1/sMAX7C/Ihhy
	 p7lvmX5Zt2dKtxbqZFviwoRgC3TxOt8QDAm4fj0vxYHbRu+hVLojnpVQRUVfwE9AHrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cj1O+bRG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EEB606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cj1O+bRG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253251F000C1;
	Thu,  5 Nov 2026 11:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877498;
	bh=rwkoPLfqLMt8+KY9KmDINo6RWXIs/1Kdx/CcqZY0kiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cj1O+bRGbMIw+OUOgTIrCCzEjiql24LmruT9mzBkkAiqyP5GiUrnVv4OdyMJ9nNrA
	 SsEhICNYeLEOwsY0P1TJX8JAbzFLAmGYVsTpM9DBl2LXPM5SH6y0ansl49MAsWQwpD
	 C/PhwTM2NbyPr+sAm/LcwsVpaW2DlnV/wuEp8DnOcXP0zWw4kdKpsf/LCLR/hh1/F7
	 IgnuEoc4Deld5sYyhJK/xkbmCNC0SDiybaGlxl5E3L5D7C92o3qdLexJXdS8mZD5Q5
	 +WIClJJBVL9Hv93CmUnuHf4ERtVMhJMVhXUHU3N27crP8AUCy4KGtJaNifjO/xVaG4
	 SkVWsyS4v/Hhw==
Message-ID: <sashiko-outbox-198934@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 03/19] spi: parse spi-max-post-config-frequency-hz
 into post_config_max_speed_hz
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, praneeth@ti.com, sebin.francis@ti.com, u-kumar1@ti.com, srikanth.boyapally@amd.com, m-shah@ti.com
In-Reply-To: <20261105105832.2134313-4-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
 <20261105105832.2134313-4-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:18:16 +0000
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
- [Medium] spi: unclamped post_config_max_speed_hz in __spi_setup()
--

commit 3a575dbc26c781e2f3bb4d2e533de6da92715c51
Author: Santhosh Kumar K <s-k6@ti.com>

spi: parse spi-max-post-config-frequency-hz into post_config_max_speed_hz

This commit adds post_config_max_speed_hz to struct spi_device and parses
it from the spi-max-post-config-frequency-hz device tree property in
of_spi_parse_dt(). This allows SPI devices to specify a higher target
clock frequency to be used after controller-side configuration such as PHY
tuning.

> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index c29ffac59c8f0..3f6add21154ed 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2825,6 +2825,8 @@ static int of_spi_parse_dt(struct spi_controller *c=
tlr, struct spi_device *spi,
>  	/* Device speed */
>  	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
>  		spi->max_speed_hz =3D value;
> +	if (!of_property_read_u32(nc, "spi-max-post-config-frequency-hz", &valu=
e))
> +		spi->post_config_max_speed_hz =3D value;

[Severity: Medium]
As reported by Sashiko on v4 [1], when a device tree node specifies a
spi-max-post-config-frequency-hz value that exceeds the parent controller's
spi->controller->max_speed_hz limit, can spi->post_config_max_speed_hz
remain uncapped?

During device registration, of_register_spi_device() calls of_spi_parse_dt()
and then spi_add_device() -> __spi_add_device() -> __spi_setup(). In
__spi_setup(), spi->max_speed_hz is clamped to the controller's maximum
speed, but spi->post_config_max_speed_hz is not:

drivers/spi/spi.c:__spi_setup() {
    ...
	if (spi->controller->max_speed_hz &&
	    (!spi->max_speed_hz ||
	     spi->max_speed_hz > spi->controller->max_speed_hz))
		spi->max_speed_hz =3D spi->controller->max_speed_hz;
    ...
}

Should __spi_setup() also clamp spi->post_config_max_speed_hz to
spi->controller->max_speed_hz when both are non-zero, so that
post-configuration SPI-MEM operations and PHY tuning do not request a
frequency above the controller's hardware limit?

[1] https://lore.kernel.org/r/20260618075445.389E11F000E9@smtp.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105105832.2134=
313-1-s-k6@ti.com?part=3D3
