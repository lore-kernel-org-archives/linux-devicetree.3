Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E97F2ECD32
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566726; cv=none; b=gqBtBJFYCwz9iag9t52Ye9qN6KPEOT+6xOoFqiSS5hEnvjHbQOv+4I9Gn/OsgMO0DlDuotnuiCAhl//+v9GLp+Lt/y0tZmqTxUmlk9qPyiTlkRVp4ma4shxVhrc6RPIyEJmiq7hezxKg262fHF5QcLQAPaL8uAUw4waVdfaARTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566726; c=relaxed/simple;
	bh=+dbtsfBGM5QlF/ap1FP686dpELozsfjap/u31rYB5ro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZiHo4Go/leadEyWVMk1L+GHunMI+HEOkzmyzxycxzt8QsT4DKPtrQRU+wR8ZQZmSW1SZShCEEspx4V7XwC55ocDJYbTRJP8HucOZE8yAOTOYlpoZ3CQhqVrfGMmwiCBkSekUZqMRTqPMXEqRmFXrTFen4IHa4ypUZ8kSick46Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6gRwaXf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6gRwaXf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D75C2BCB0;
	Tue, 12 May 2026 06:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778566724;
	bh=+dbtsfBGM5QlF/ap1FP686dpELozsfjap/u31rYB5ro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=p6gRwaXfHa8IUMeRkj/b6aHj5DwIGHc3tcJRFDv6qqDg5EYmCeApW1byZW7mqx6CG
	 MEWY+9mTy3jqFIXmhSja2M4E5EAQC/a94BYuoSrltUiEkWSS5Ya9Zu+Q9WPBo7CiRg
	 RD9I1hMJupIzK/Rgte6tHzAQcTYazuiEmN5XLFL3RCOyl9vESCGll6r7ttq1hndNsk
	 5gt7lZW9mhRFKzLPAb+1L1Af//iPH/IbowYqIWY7pX5WsH4azrP1Az6wRN7TaIuW9M
	 jGhzSbb5jzR2DNwDqubWCcvr3t7tniGrmot1k5HIRFkMHR8JCj0hOpX2jt5t2C2lN2
	 OZAZHpVFtISjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/10] clk: amlogic: Add A9 peripherals clock controller
 driver
Reply-To: sashiko@lists.linux.dev
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260511-b4-a9_clk-v1-9-41cb4071b7c9@amlogic.com>
References: <20260511-b4-a9_clk-v1-9-41cb4071b7c9@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 06:18:43 +0000
Message-Id: <20260512061843.C1D75C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing multiplexer value table for `usb_48m_pre` clock
- [High] Register bit overlap between `gen` clock divider and gate
- [High] Incorrect parent clock selector referenced by `hdmitx1_pixel`
--

commit 4a10654bfda3abb70d26d386a44e76675278fccb
Author: Jian Hu <jian.hu@amlogic.com>

clk: amlogic: Add A9 peripherals clock controller driver

Add the peripherals clock controller driver for the Amlogic A9 SoC family.

> diff --git a/drivers/clk/meson/a9-peripherals.c b/drivers/clk/meson/a9-pe=
ripherals.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/meson/a9-peripherals.c

[ ... ]

> /* Channel 5 and 6 are unconnected. */
> static u32 a9_usb_250m_parents_val_table[] =3D { 0, 1, 2, 3, 4, 7 };
> static const struct clk_parent_data a9_usb_250m_parents[] =3D {
> 	{ .fw_name =3D "fdiv4", },
> 	{ .fw_name =3D "fdiv3", },
> 	{ .fw_name =3D "fdiv5", },
> 	{ .fw_name =3D "fdiv2", },
> 	{ .fw_name =3D "fdiv7", },
> 	{ .fw_name =3D "fdiv2p5", }
> };
>=20
> static A9_COMP_SEL(usb_250m, USB_CLK_CTRL, 9, 0x7, a9_usb_250m_parents,
> 		   a9_usb_250m_parents_val_table);

[ ... ]

> static const struct clk_parent_data a9_usb_48m_pre_parents[] =3D {
> 	{ .fw_name =3D "fdiv4", },
> 	{ .fw_name =3D "fdiv3", },
> 	{ .fw_name =3D "fdiv5", },
> 	{ .fw_name =3D "fdiv2", },
> 	{ .fw_name =3D "fdiv7", },
> 	{ .fw_name =3D "fdiv2p5", }
> };
>=20
> static A9_COMP_SEL(usb_48m_pre, USB_CLK_CTRL, 25, 0x7, a9_usb_48m_pre_par=
ents,
> 		   NULL);
                   ^^^^

Since channels 5 and 6 are unconnected, should this macro use a value table
similar to a9_usb_250m_parents_val_table?

Passing NULL might cause the framework to write the unconnected index 5 for
the fdiv2p5 clock, potentially silencing the clock output instead of
selecting index 7.

[ ... ]

> static A9_COMP_SEL(gen, GEN_CLK_CTRL, 12, 0x1f, a9_gen_parents,
> 		   a9_gen_parents_val_table);
> static A9_COMP_DIV(gen, GEN_CLK_CTRL, 0, 12);
> static A9_COMP_GATE(gen, GEN_CLK_CTRL, 11, 0);
                                         ^^

Could this cause a register bit overlap?=20

The divider is configured to be 12 bits wide starting at bit 0, which means
it occupies bits 0 through 11. However, the clock gate is also defined at
bit 11 in the same register.

Writing to the divider might inadvertently toggle the clock gate, and
toggling the gate could corrupt the most significant bit of the divider.

[ ... ]

> static struct clk_regmap a9_hdmitx1_pixel =3D {
> 	.data =3D &(struct clk_regmap_gate_data){
> 		.offset =3D VID_CLK_CTRL2,
> 		.bit_idx =3D 12,
> 	},
> 	.hw.init =3D &(struct clk_init_data) {
> 		.name =3D "hdmitx1_pixel",
> 		.ops =3D &clk_regmap_gate_ops,
> 		.parent_hws =3D (const struct clk_hw *[]) {
> 			&a9_hdmitx_pixel_sel.hw
                        ^^^^^^^^^^^^^^^^^^^^^^^

Is this the intended parent selector?=20

This references a9_hdmitx_pixel_sel instead of a9_hdmitx1_pixel_sel. This
hierarchy mismatch might cause parent and rate adjustments for hdmitx1_pixel
to mutate the wrong clock selector, leaving its own hardware unconfigured.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-b4-a9_clk-=
v1-0-41cb4071b7c9@amlogic.com?part=3D9
