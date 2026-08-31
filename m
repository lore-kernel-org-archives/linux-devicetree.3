Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7105D35E1B1
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146249; cv=none; b=RW84geZuuvOJ2WXeGk4Jtiq7ZlSWetQw5ccrdYgsV71YcId5DAyzMsM3BavY5REzFC+IgHF5mBmIdgvbFvxfNHQoIBvMCkx6HtDLWL7+dmkioh3GH0OqJuQDoYQQ/EOuHICcp5uRaP5tWRxty2KTlsV/e108JlFemPFiEDLCCeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146249; c=relaxed/simple;
	bh=UOIlIK3tsmu6cEpZVDQaUvOZRbiX2tg4iL8GD70Vh6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J4qkEqDAschsmp29Ot5fvtXxyCuHhiqIbOrl1Ok/xA2GFAFS0p2TfboDjeyjZo8B1hCOhxgiNxD2d0jx6ldlOvRRxx+cH4PaFUBS3dmm/cw+pljiFz/HSWgv0AcxSbTqR9ray18Nfg0Bu70nakQ4IKBkp5H/9kb3HqgVDPoK4Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGh6QhA6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGh6QhA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BF81F000E9;
	Mon, 31 Aug 2026 03:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788146248;
	bh=DUNM0BNT0teudH+YzeYFv468BgVT27sy9/gvneYeveA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fGh6QhA6zvjjmDzQORo/gld1imU7uAMyCxpatZ2mCFERZL9u9E/tmV2Bhcwc7b6L3
	 H6A8JMJ4b8ryv7dJIeq4WW7W6v51nSLOJwjETwz531R5oGipdWbWpafZmlsefFnf40
	 OPCF0ZrBlMfNLQux+qNLE0NUAXTAai9XpqJL/B1JZ2o8gy8houdTSU2C5bgIH0fhx2
	 zQHWn0XPMwHD8hPyWq59U43Q18LKcq0sd0YXHhQBZK1EYumKCQ59teT8Yk6gkBzbzZ
	 S5wKyQowQ4+gQ9uF8nVqV7t2+5zzf666yM38t05m/M3fO4X5VDH+LJK8Yx0Fd1Qozz
	 x1G0KGX+vlNJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/8] usb: misc: qcom_eud: add per-path role switch
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260831030147.1500616-5-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 03:17:27 +0000
Message-Id: <20260831031727.E7BF81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it is a pre-exis=
ting issue that remains unaddressed in the series. Missing locking between =
sysfs `port_store` and `enable_store` leads to race conditions, unbalanced =
PHY operations, and potential PHY refcount corruption.
- [High] This problem wasn't introduced by this patch, but it is a critical=
 pre-existing bug. The hardirq handler calls `readl_poll_timeout()` which u=
ses `usleep_range()`, leading to sleeping in atomic context.
--

commit e05abacd8a248a2f644735928e7cccc3961822a1
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add per-path role switch support

The commit replaces the single chip-level role switch with per-path role
switches to properly handle multi-path configurations. It also forwards
role change requests from the EUD to the respective USB controllers
and removes the unnecessary role switch call from enable_eud().

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 03d1c200658c8..45c90d9f3b1f6 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
[ ... ]
> @@ -270,12 +273,15 @@ static irqreturn_t handle_eud_irq(int irq, void *da=
ta)

[Severity: High]
This isn't a bug introduced by this patch, but it is a critical pre-existing
bug that remains unaddressed in the series. The primary hardirq handler
handle_eud_irq() calls pet_eud():

drivers/usb/misc/qcom_eud.c:handle_eud_irq() {
    ...
	case EUD_INT_SAFE_MODE:
		pet_eud(chip);
		return IRQ_HANDLED;
    ...
}

Inside pet_eud(), we sleep in an atomic context:

drivers/usb/misc/qcom_eud.c:pet_eud() {
    ...
		/* Delay to make sure detach pet is done before attach pet */
		ret =3D readl_poll_timeout(chip->base + EUD_REG_SW_ATTACH_DET,
					reg, (reg =3D=3D 0), 1, 100);
    ...
}

Does this code trigger a "BUG: scheduling while atomic" and lead to a kernel
panic when the EUD_INT_SAFE_MODE hardware interrupt fires?

The readl_poll_timeout() macro uses usleep_range() under the hood when a
non-zero delay is provided, which is invalid to call from a hardirq handler.

>  static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>  {
>  	struct eud_chip *chip =3D data;
[ ... ]

[Severity: High]
This is also a pre-existing issue, but I noticed a potential race condition
between sysfs callbacks that modify the port and enable states locklessly:

drivers/usb/misc/qcom_eud.c:port_store() {
    ...
	/* Port selection must be done before enabling EUD */
	if (chip->enabled)
		return -EBUSY;

	writel(port, chip->base + EUD_REG_PORT_SEL);
	chip->port_idx =3D port;
    ...
}

and

drivers/usb/misc/qcom_eud.c:enable_store() {
    ...
	if (enable) {
		ret =3D enable_eud(chip);
		if (!ret)
			chip->enabled =3D enable;
    ...
}

Could concurrent execution of port_store() and enable_store() lead to race
conditions since they locklessly read and write chip->enabled and
chip->port_idx?

Can this result in unbalanced PHY operations, PHY refcount underflow, or
permanent resource leaks if the port index changes during an enable
operation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831030147.1500=
616-1-elson.serrao@oss.qualcomm.com?part=3D4
