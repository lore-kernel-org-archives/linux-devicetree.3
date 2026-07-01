Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0F3BB102
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903433; cv=none; b=TdoE+PUBHD9vC5MJ0z0Q4ZtV6W+5F1MGNCAVX/bDcoraVJA2T7V5CuavVZL+Doj3jtTJKEmeamKbxliHgwrzajSqPNHZlYmwiVkVUx/byXS7BLY7+urhW0GmB5CmuN9V6tgtmiln4nLpkIaliRF84EvmcRGhzzcwnOzT+CrUuXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903433; c=relaxed/simple;
	bh=RyDjfIfFxu4w0JNE7bHpdPPm0w1XLNjxhRx6CSky4/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O6ebht5OIEjfXIjm3YzHfhw3VYhRXxYIle4GT5NksW1bCcic73imkK2FxnKHjFSIdI0V1XbYSuKAtTpOgnVAR0Mr/fV7Z17IiQ9Ys+aIckqeUGEDQR0rCFRHneBW+beibvk2r6d1v8PDvuNS6UPeqWERy2+dQnb/W7ZS3IW0zr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dls+X2GR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dls+X2GR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59BE1F000E9;
	Wed,  1 Jul 2026 10:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903429;
	bh=ZGLts+3bOniJYL1S9gZlAlhyvwtZ03zc77vQOgGNi5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dls+X2GRSZPiT/O5TdMAlEimrDlUvedSk3v7UJNWbzQ9Jtqz1SJpw94InwA1MYbkQ
	 p4aErzC0tI3E9y36TZU5uI67RNlUb4p29Dw9MV5blLdb8WoIzumsqFhWrqWrUwygnc
	 tKKJW2GcYGvknDf64tnFZbDSyUML2a3SYHYclRYoNHgTCWKCep58AX2CqDemOn8/Uw
	 wFQqGu1Jm9NQIc1cLRbNmsRvcDGfVgDuD4Z9pawnz1K7hvNT5zVRdZfKh4k4aZNNX3
	 KdMhEvq+vdvMfU4DnShGaEXLiuOHuFAD/jdnp9RTBSuyg45KsKyzwTchdKRocdc9nq
	 QkwHZZJfDR9yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 2/2] net: pse-pd: add Realtek/Broadcom PSE
 MCU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Jelonek" <jelonek.jonas@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630105651.756058-3-jelonek.jonas@gmail.com>
References: <20260630105651.756058-1-jelonek.jonas@gmail.com>
 <20260630105651.756058-3-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 10:57:09 +0000
Message-Id: <20260701105709.A59BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Premature probe failure due to unhandled -EBADMSG during MCU dis=
covery.
--

commit f15f1883adfcb0dd6df322e408ed55d0bfd48ac7
Author: Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: net: pse-pd: add Realtek/Broadcom PSE MCU driver

This commit adds a driver for the microcontroller fronting Realtek and
Broadcom PSE chips over I2C or UART. It abstracts the underlying protocol
dialects behind shared core logic and transport modules.

> diff --git a/drivers/net/pse-pd/realtek-pse-mcu-core.c b/drivers/net/pse-=
pd/realtek-pse-mcu-core.c
> new file mode 100644
> index 0000000000000..11a0abece37bd
> --- /dev/null
> +++ b/drivers/net/pse-pd/realtek-pse-mcu-core.c
[ ... ]
> +static int rtpse_mcu_discover(struct rtpse_mcu_ctrl *pse, struct rtpse_m=
cu_info *info)
> +{
> +	struct rtpse_mcu_ext_config ext_config;
> +	unsigned long deadline;
> +	int ret;
> +
> +	/*
> +	 * The MCU may not answer on the bus yet right after power-up or
> +	 * enable-gpios assertion: depending on the transport it either stays
> +	 * silent (-ETIMEDOUT) or does not ACK its address at all (-ENXIO /
> +	 * -EREMOTEIO). Retry within a bounded wall-time window so a slow boot
> +	 * still probes, while a genuinely unresponsive MCU fails with its real
> +	 * error instead of deferring forever and masking it.
> +	 */
> +	deadline =3D jiffies + msecs_to_jiffies(RTPSE_MCU_BOOT_TIMEOUT_MS);
> +	do {
> +		ret =3D rtpse_mcu_get_info(pse, info);
> +		if (ret !=3D -ETIMEDOUT && ret !=3D -ENXIO && ret !=3D -EREMOTEIO &&
> +		    ret !=3D -EAGAIN)
> +			break;

[Severity: Medium]
Will this prematurely abort the probe if the MCU emits transient garbage
during its boot sequence?

Looking at rtpse_mcu_do_xfer(), it returns -EBADMSG if there is a checksum
mismatch, or if the MCU responds with RTPSE_MCU_OPCODE_BAD_CSUM. If a parti=
ally
booted MCU produces invalid bytes on the bus during this startup window,
rtpse_mcu_discover() will immediately break out of the retry loop and fail
the probe since -EBADMSG is not in the allowed list of retry errors.

> +		msleep(RTPSE_MCU_BOOT_RETRY_MS);
> +	} while (time_before(jiffies, deadline));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630105651.7560=
58-1-jelonek.jonas@gmail.com?part=3D2
