Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339685;
	b=iXBV9Y78gBW25Je3HgQh/xDl0lct8WQlj8x+byYoqgh4VB3hld0NMdXpakiWiq0/E2oW
	 TLXUgjkPI2JAK16cq8e33sRr7gT+iU5Ka5/AqBwkpYgHFHl0bWpW5G3Z4nJbWQ3sILNhQ
	 RBUehoCWaEe9GQ+XTKuSFg7Md1dHpD2SckmTbP558Z/JXl/c2gWC51nZ2EPjo+3R6nyff
	 UYia8BlTNkDZ0+MuHpOAaoZoNQoUAw+qZYz7Mr5yCK1sKQi7C7U2E3t9oAFy+cO9g3wWD
	 yyfpW0I1hKJPf6BlgSO4g4GftUfX4mX2NEtiROzHHj0jjxTrozkZ9hUxOHs0T2adrFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339685;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zc1mZxmk6KfQkLOLB1GDFYx1v5GLlDgwKgHVaRpjBpY=;
	b=Ju4ibdavx6Mi0+vEeQDIrCasIBEZMNnELYnsaOZ1KEnFxd1+4Z99HQ6QeRzuI5Ha9eqG
	 0e4RO6TVL94rHLGlaB2fFBoKvNiAH8oa3KCSkdcoqUdtpoOQDD4+Zg0/3+EtDSEc92ObA
	 939XIcH079IiawwtT/l/pvHdr/Mur0IJ21a4+g4SYgXeB39wTmgWFYJnmB8aK5hlXw9pf
	 fGOggoa6YqCMaytceGZKKxz+h2WVzSK8ET8p2onWii18YKmMft4pV6FpPzZ3yZNF+itYP
	 AY3Q2+8tqVJ83kxgsxjzKwUBaCYActHbCcMUfDDvUoDSNb6o+mbSbqp7PSvfK8CXFIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TOkEeLMO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BBB606A339
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TOkEeLMO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621BD1F00A16;
	Fri, 30 Oct 2026 05:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793339684;
	bh=zc1mZxmk6KfQkLOLB1GDFYx1v5GLlDgwKgHVaRpjBpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TOkEeLMOLKW7Kl02RhL8cXkhTV1AV7LC8BcQSioTGHJNCmue42otBWYA9JA05EICl
	 Y4pYvkCRmLKTgxR1YKSHpe3V4cpxdyfIuMHYOmq6gY74QMWj9rU0rwq1eaOUXdbAde
	 Rnze/i8+dUZSfRF3Pz6EhR02p/QTZtsDxARyLxq4Qv1m22sX4Ab3mEy2yDqZ7wXgPD
	 CYIH4SqEvmEFsnyHEyiSFlI+fkjorppVJF7o2yYy1QOpwee83xeC2deixjLjtuclqC
	 SQ15IAEdxYBX7RjOOkv1+4+aYepUM3EPiO6aUI57XEYFCCRuH34qgzlhdNf/k2Rt/d
	 6GJQK/ItxH62Q==
Message-ID: <sashiko-outbox-190580@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] drm/panel: ilitek-ili9881c: add Mingjun
 MJ070BI30IA2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-mj070bi30ia2-v1-3-a0f65b65c290@iscas.ac.cn>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
 <20261030-mj070bi30ia2-v1-3-a0f65b65c290@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 05:54:44 +0000
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
- [High] drm/panel: ilitek-ili9881c: bit-shifted registers in mj070bi30ia2_=
init
--

commit 77fed3fe20435bd131c211abca1d6f6a36c89b5f
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

drm/panel: ilitek-ili9881c: add Mingjun MJ070BI30IA2

This patch adds support for the Mingjun MJ070BI30IA2 7" MIPI DSI LCD panel,
including its initialization sequence, display mode timings, and device tree
compatible entry in the Ilitek ILI9881C panel driver.

> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/=
drm/panel/panel-ilitek-ili9881c.c
> index c3d5ab67121d9..83148c40e25ca 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -2198,6 +2198,201 @@ static const struct ili9881c_instr waveshare_7inc=
h_a_init[] =3D {
>  	ILI9881C_COMMAND_INSTR(0x36, 0x00),
>  };
> =20
> +static const struct ili9881c_instr mj070bi30ia2_init[] =3D {
> +	ILI9881C_SWITCH_PAGE_INSTR(3),
> +	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x02, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x03, 0x73),
> +	ILI9881C_COMMAND_INSTR(0x04, 0x13),
> +	ILI9881C_COMMAND_INSTR(0x05, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x06, 0x0A),
> +	ILI9881C_COMMAND_INSTR(0x07, 0x05),
> +	ILI9881C_COMMAND_INSTR(0x11, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x09, 0x28),
> +	ILI9881C_COMMAND_INSTR(0x0A, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0B, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0C, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0D, 0x28),
> +	ILI9881C_COMMAND_INSTR(0x0E, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0F, 0x28),
> +	ILI9881C_COMMAND_INSTR(0x10, 0x28),
> +	ILI9881C_COMMAND_INSTR(0x11, 0x00),

[ ... ]

> +	ILI9881C_COMMAND_INSTR(0x36, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x37, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),

[ ... ]

> +	ILI9881C_COMMAND_INSTR(0x43, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x44, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xA0, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x51, 0x23),
> +	ILI9881C_COMMAND_INSTR(0x52, 0x44),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x67),

[ ... ]

> +	ILI9881C_COMMAND_INSTR(0x6E, 0x16),
> +	ILI9881C_COMMAND_INSTR(0x6F, 0x16),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x71, 0x06),

[ ... ]

> +	ILI9881C_SWITCH_PAGE_INSTR(1),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x0A),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xA6, 0xA6),
> +	ILI9881C_COMMAND_INSTR(0x55, 0x3D),
> +	ILI9881C_COMMAND_INSTR(0x50, 0x9E),
> +	ILI9881C_COMMAND_INSTR(0x51, 0x99),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x20),
> +	ILI9881C_COMMAND_INSTR(0xA0, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xA1, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xA2, 0x26),
> +	ILI9881C_COMMAND_INSTR(0xA3, 0x13),
> +	ILI9881C_COMMAND_INSTR(0xA4, 0x16),
> +	ILI9881C_COMMAND_INSTR(0xA5, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xA6, 0x1E),

[Severity: High]
Are some of the register addresses and values in mj070bi30ia2_init[] shifted
left by one bit (perhaps from a MIPI DSI bus capture or transcription error=
)?

When ili9881c_prepare() sends mj070bi30ia2_init[] to the panel controller,
four entries appear to have bit-shifted command addresses that leave their
intended registers unprogrammed while writing to registers that are later
overwritten:

1. In Page 3, between registers 0x07 and 0x09 (where all other ILI9881C
panels program register 0x08), the sequence writes to 0x11 ((0x08 << 1) | 1=
),
which is already programmed in its normal sequential position after 0x10.

2. In Page 3, between registers 0x37 and 0x39 (where register 0x38 belongs),
the sequence writes (0x70, 0x00) (0x38 << 1 =3D=3D 0x70). Register 0x70 is =
later
overwritten in the 0x5F..0x8A GIP output mapping block with (0x70, 0x06),
leaving register 0x38 uninitialized.

3. In Page 3, between registers 0x44 and 0x51, at the start of the standard
0x50..0x5D GIP sequence (0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, ...), the table
has (0xA0, 0x02) instead of (0x50, 0x01) (0x50 << 1 =3D=3D 0xA0, 0x01 << 1 =
=3D=3D
0x02), and register 0x52 is set to 0x44 instead of 0x45.

4. In Page 1, between register 0x31 and VCOM2 register 0x55 (where other
ILI9881C panels program VCOM1 register 0x53), the sequence writes
(0xA6, 0xA6) (0x53 << 1 =3D=3D 0xA6). In Page 1, 0xA6 is a positive gamma
register that is unconditionally overwritten a few lines later by
(0xA6, 0x1E), leaving VCOM1 register 0x53 uninitialized.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-mj070bi30i=
a2-v1-0-a0f65b65c290@iscas.ac.cn?part=3D3
