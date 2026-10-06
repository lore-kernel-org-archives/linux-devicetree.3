Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB06353A6B
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 08:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276289; cv=none; b=hQGETjpD9/EJDTZmGQpWTiU/swKAhzj1FwG5oB0Uv/iTMC5S64Y+g6wHgFCrDm+WFJWzfQRfZr2P7oJ5uDvR4aawMfFUZ6qAHAMrVxYDHQJImvtIa3Hs5uWQwHU+cpH2O0+dzPO9siXswww4puYFXRIo6Ih2aaSlLBlYLNbVSDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276289; c=relaxed/simple;
	bh=7YmBTHoy3MPaT5BsBbS42Qf9/DKp7GeBBcBDaey6hlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sEMlSPBbK1o8sIo7UxAAZKM22ilvFzAs/KYi3ycZ9SiQGhim6bl+wb18no1Kw7Qj1ct88lwqVVRbKXTRJf+8LBQ6I2AtXFbtpZFj/AZ6NoD/HsDNYd0RaHHRrrEJ1vS9BbdUZ7EB2BMZ5gKj63J2rnb91GYn3XaQPIfVV2Z7ugw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUvZDD5E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUvZDD5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512DB1F000FF;
	Tue,  6 Oct 2026 08:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791276287;
	bh=7t0R04JCWp9cm6m8mc21+6QU4rIivwasSgxpnr+WFAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nUvZDD5E56lgtAsiZFPiQLJZlyOc4XMjN0i3aKbk7Bzi+5QwaSLvvsveANZyb3uMC
	 OS8I89ctE0blRT/okkG7NuHdxDd5tdTafj1RSCuDj2s7cpYP7tTUhjcLuvjt+xiKuY
	 H94giWyHbdztHlO0J7YalPQsT/uUtKNkuwteLjRtr+perWuCLQineyv+IzZJJXjL5q
	 c+l67pgyabcEakgRwrXOCoEsF1bLlh7VIFSAL4O+nmsQNQ78v0uMrqGw73IuE0jGKm
	 KtlNgBM5mzavitPgQxUUOCTm6lAanpKs+VVxSdhEVy418GervecrZjzPFgH4PYRcHw
	 wZm5C22tm5Pkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] regulator: Add RPMI voltage service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Yeong" <joshua.yeong@starfivetech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261006083259.2206001-3-joshua.yeong@starfivetech.com>
References: <20261006083259.2206001-1-joshua.yeong@starfivetech.com>
 <20261006083259.2206001-3-joshua.yeong@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 08:44:46 +0000
Message-Id: <20261006084447.512DB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mailbox: race condition and UAF due to concurrent lockless access
- [Medium] regulator: mpxy_reg_set_voltage_sel incorrectly rejects 0V selec=
tions
--

commit 88daa08f06769cd53eb8f46c2849474d0f855277
Author: Joshua Yeong <joshua.yeong@starfivetech.com>

regulator: Add RPMI voltage service

The RPMI specification defines a voltage service group which can be
accessed via SBI MPXY extension or dedicated S-mode RPMI transport.

Add a mailbox client based regulator driver for the RISC-V RPMI voltage
service group. The driver enumerates the voltage domains advertised by
the platform microcontroller, reads their supported voltage levels and
registers each of them as a regulator.

> diff --git a/drivers/regulator/riscv-rpmi-regulator.c b/drivers/regulator=
/riscv-rpmi-regulator.c
> new file mode 100644
> index 0000000000000..ea230bcb6a479
> --- /dev/null
> +++ b/drivers/regulator/riscv-rpmi-regulator.c
> @@ -0,0 +1,893 @@

[ ... ]

> +static int rpmi_reg_set_config(struct rpmi_reg_domain *mpxy_reg, u32 con=
fig)
> +{
> +	struct rpmi_set_config_tx tx;
> +	struct rpmi_set_config_rx rx =3D { };
> +	struct rpmi_mbox_message msg;
> +	int ret;
> +
> +	tx.domain_id =3D cpu_to_le32(mpxy_reg->id);
> +	tx.config =3D cpu_to_le32(config);
> +
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_VOLT_SRV_SET_CONFIG,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +
> +	ret =3D rpmi_mbox_send_message(mpxy_reg->rpmi_ctx->chan, &msg);
        ^^^^

[Severity: High]
Since multiple regulators instantiated by rpmi_reg_probe share the same
mpxy_ctx->chan, could concurrent regulator operations (such as from sysfs
or consumer drivers) cause a race condition here?

Because the client is set up with tx_block =3D false, mbox_send_message will
asynchronously queue a second message if the channel is busy and return
immediately. The rpmi_mbox_send_message helper then calls mbox_client_txdon=
e,
forcing the queue to advance, and subsequently returns.

This destroys the stack-allocated msg variable while it is still queued,
which would lead to a use-after-free when the mailbox controller later
dereferences this dangling pointer. Is mutual exclusion needed around
these mailbox accesses?

[ ... ]

> +static int mpxy_reg_set_voltage_sel(struct regulator_dev *rdev, unsigned=
 int selector)
> +{
> +	struct rpmi_reg_domain *mpxy_reg =3D rdev_get_drvdata(rdev);
> +	struct rpmi_set_level_tx tx;
> +	struct rpmi_set_level_rx rx =3D { };
> +	struct rpmi_mbox_message msg;
> +	s32 volt_uV;
> +	int ret;
> +
> +	volt_uV =3D mpxy_reg->desc.ops->list_voltage(rdev, selector);
> +	if (volt_uV <=3D 0)
        ^^^^

[Severity: Medium]
Will this improperly reject valid 0V operating states?

If a consumer requests a voltage mapped to a selector that evaluates to
0 uV, or the hardware advertises a range where 0V is a valid operational
level, list_voltage() will return 0. The check here returns -EINVAL for
0 uV, but 0 uV is semantically permitted in the RPMI specification and
by the core regulator APIs.

Should this check be strictly < 0 to catch errors returned by
list_voltage without rejecting valid 0V targets?

> +		return -EINVAL;
> +
> +	tx.domain_id =3D cpu_to_le32(mpxy_reg->id);
> +	tx.level =3D cpu_to_le32(volt_uV);
> +
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_VOLT_SRV_SET_LEVEL,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +
> +	ret =3D rpmi_mbox_send_message(mpxy_reg->rpmi_ctx->chan, &msg);
        ^^^^

[Severity: High]
This appears to have the same lockless concurrent access issue with
a stack-allocated msg variable as rpmi_reg_set_config().

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006083259.2206=
001-1-joshua.yeong@starfivetech.com?part=3D2
