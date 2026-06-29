Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9B3358360
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782772047; cv=none; b=MXjFII4ef4GqlzmNJhTJ9lmuPXSIwgYIs+xGS42cigMwfuPSGOiJV/1M9nI8GA7bUc7Ba08iw/szw/m4f1gPvfIzsHJOjoFbrt6k4BPCEvJ5f5kq14cfZhZK5v3/JbbKKTxP3qjkZLGPlEu8ZxnAJUiywNiykkIajbXgIjchv3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782772047; c=relaxed/simple;
	bh=oBUfxKQSOoqc3F1m++J4pP30DGvBdHoCOJwpaLicfqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NPV2kXT/cO9ab6m+OW4C2VI30ayItbZdMFRl8DED8ECM+4bBoU/jngyXUR4BGf/XXcEWmXcPx1ZUluiuduDsY56AHxTkc/mtD2oOp1UePKPO3kr4+R/h2S0mEsQuLeNy5LDqnhen3Sk1zSMJNrx/MDDAk/4JEPTtKfKmpAiJ23w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVmt0ruy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVmt0ruy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C801F000E9;
	Mon, 29 Jun 2026 22:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782772046;
	bh=1cI6rcjZoaklNTXCMoDFVhT5gu3S/3sxs54Xma7nZgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LVmt0ruylRc+aDA/PK33rM6S6PnGN3PD47bMYlJBSsSZ2Ul49RFFUgp5EpViGKnVL
	 YGrqEAjSyHWTKEXQx/d9+ok4s2bTK8V0OzFCaQlLqvF0xruEKdYhY0+rEh4YRTtva/
	 8Wyc9QF5z5VlFMlS7uRUrX/ayI7/wk2NQP1G1dGZzbsEQwlEeXn5ewd03UP4afmuBb
	 k0GdU0tBRuW98xdWKJ/YGSer2IGpHGHaD6TeByr9eyPZmxK/VYCzSRzYQMkZcw8QlD
	 MvmtMWA9ZDrhsz0aS0U9PJT3+I+Rkd0JOdJVMmdLQxKFdWIV2sTeBavbsGT/Az83Xm
	 6RmpfCtAh9R2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/2] net: pse-pd: add Realtek/Broadcom PSE
 MCU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Jelonek" <jelonek.jonas@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628222705.4052815-3-jelonek.jonas@gmail.com>
References: <20260628222705.4052815-1-jelonek.jonas@gmail.com>
 <20260628222705.4052815-3-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 22:27:25 +0000
Message-Id: <20260629222726.00C801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect module owner assignment in `rtpse_mcu_register` allows t=
he transport module to be unloaded while active, leading to Use-After-Free.
--

commit 7bb530c7721986789a60e3b5029b0d7f2ddc58d4
Author: Jonas Jelonek <jelonek.jonas@gmail.com>

net: pse-pd: add Realtek/Broadcom PSE MCU driver

This commit adds a driver for the microcontroller that fronts Realtek and
Broadcom PSE chips. It splits the implementation into a shared core module
and separate I2C and UART transport modules.

> diff --git a/drivers/net/pse-pd/realtek-pse-mcu-core.c b/drivers/net/pse-=
pd/realtek-pse-mcu-core.c
> new file mode 100644
> index 0000000000000..718788d13d90e
> --- /dev/null
> +++ b/drivers/net/pse-pd/realtek-pse-mcu-core.c

[ ... ]

> +int rtpse_mcu_register(struct rtpse_mcu_ctrl *pse)
> +{

[ ... ]

> +	/*
> +	 * Depending on the MCU firmware configuration (which might be different
> +	 * for every board), it isn't known whether the PoE subsystem is active=
 or
> +	 * inactive by default. At this stage, the PSE chips might already deli=
ver
> +	 * power to PDs without any explicit enable.
> +	 */
> +
> +	pse->pcdev.owner    =3D THIS_MODULE;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this assign the core module as the owner instead of the calling transp=
ort
module? Since this executes in realtek-pse-mcu-core.c, THIS_MODULE resolves
to the core module, leaving the transport module (e.g., realtek-pse-mcu-i2c)
unpinned.

When a consumer gets a reference to the PSE controller, it pins the core
module, but an administrator can still unload the active transport module.
Unloading the transport module triggers device unbinding and devm resource
cleanup, which frees the pse structure while it is still active, leading to
a use-after-free on subsequent PSE operations.

> +	pse->pcdev.ops      =3D &rtpse_mcu_ops;
> +	pse->pcdev.dev      =3D pse->dev;
> +	pse->pcdev.types    =3D ETHTOOL_PSE_C33;
> +	pse->pcdev.nr_lines =3D info.max_ports;
> +	pse->pcdev.pis_prio_max =3D RTPSE_MCU_PORT_MAX_PRIORITY;
> +	pse->pcdev.supp_budget_eval_strategies =3D PSE_BUDGET_EVAL_STRAT_DYNAMI=
C;
> +
> +	return devm_pse_controller_register(pse->dev, &pse->pcdev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628222705.4052=
815-1-jelonek.jonas@gmail.com?part=3D2
