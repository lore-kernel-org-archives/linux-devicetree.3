Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C4037DAD4
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315474; cv=none; b=AiMdqdLmsFa5vCmY6YudAB+DO5yIVnQr6eFqpq8TzSCek5wKFRvabsw7ZzNVGzagNUX9ieQP+7H+ojIEkiRtijMD7lusFCsuzUFYaHbvaxDF7sg1QJhk6RTa+rih0idUUuTYCHly18bp9RTI1pgubrEsvP7IESO17K+39liZ2jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315474; c=relaxed/simple;
	bh=xa/tU5wRqGohTWAJMxT/6MNJ9n8OUpMHJkuwhXpm+lM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dv6w7VW1mewZlFndMs9hTcIRBKsDgVL56sNh5yCAdayf249iRgdsHNQtuVbWejqrPiKDv8nt1UMX7HDAlwZYZQa4JWE2p53ZyEmHJUTEzA3AAmDaZPD4AJCl2cC3C8pYfXTtSkqxVGyWeq5UuWPgRgJISBmVEWdXipinW6LF9g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYHdkPAr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYHdkPAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8961F000E9;
	Fri, 17 Jul 2026 19:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784315472;
	bh=CYZ0DPv8l35rB76J6zj9DpjK/i7BPDhEA8RWwniQqAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HYHdkPAr92D/0kPvvK3Ra9ki4lYSivymRvqiHgGQe6L6MBCoLZTo8l7FJ6lOnDoiB
	 JhIeggxah9rdYXtut6LqD2wLdj0ZLEJA3FYCCqTsYXf4+zOOUe1JlUtOZp0BRBE0EF
	 46P3VyY1XRkVC+oYgVcD2jmya8SAUKXQq7+PuQdGVRW7mG8t0qEzIa7UEYJ9pMIcQa
	 yNRXPzlJ66L53ZVTqDeukuQOpP7Hw/ie9e9Js/l67TF+BKNFwh852+LebIOQEoz7C+
	 Nf8ZyTnJNrrDpZCyLNvYfH39SrgfQAXVti0+dfEDbEkxwAmun3u8V5reGx/7eS9bum
	 bOzu5Osqeuw0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/17] spi: spi-mem: teach spi_mem_adjust_op_freq()
 about post-config ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717185116.2065505-5-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-5-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:11:11 +0000
Message-Id: <20260717191112.5E8961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing hardware limit clamping for post_config_max_speed_hz
- [High] Exact frequency equality check overloads capability field as a sta=
te flag, causing tuning failure and regressions
--

--- Patch [4]: [PATCH v5 04/17] spi: spi-mem: teach spi_mem_adjust_op_freq(=
) about post-config ops ---
commit d5308ce32807c28e1b6f48e6c7412cc09f81f812
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops

This commit extends spi_mem_adjust_op_freq() with a bypass for ops where
op->max_freq equals post_config_max_speed_hz. All other ops are capped to
max_speed_hz, integrating the policy into the single frequency-adjustment
point.

> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index a88b9f0383564..e20eca1b82457 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -591,9 +591,18 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
>   * Some chips have per-op frequency limitations and must adapt the maxim=
um
>   * speed. This function allows SPI mem drivers to set @op->max_freq to t=
he
>   * maximum supported value.
> + *
> + * When @mem->spi->post_config_max_speed_hz is set, ops with @op->max_fr=
eq
> + * equal to that value are treated as post-configuration ops (e.g. PHY-t=
uned)
> + * and are allowed to run at the full post-config rate. All other ops are
> + * capped to @mem->spi->max_speed_hz, the always-reachable base rate.
>   */
>  void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op)
>  {
> +	if (mem->spi->post_config_max_speed_hz &&
> +	    op->max_freq =3D=3D mem->spi->post_config_max_speed_hz)
> +		return;

[Severity: High]
Does this early return bypass the hardware capability limit clamping for
post-config operations?

If a device tree provides a post-config frequency that exceeds the
controller's absolute hardware capabilities (spi->controller->max_speed_hz),
could returning early here force the SPI controller to configure unbounded
frequencies?

[Severity: High]
Since op is often an ephemeral local variable and op->max_freq is a static
capability bound initialized from flash driver templates (such as
SPINAND_OP_VARIANTS), will this exact equality check fail to match during
actual operation?

For example, if a flash command supports up to 200MHz, but the board is tun=
ed
to 133MHz, the equality check would fail. In this scenario, does the tuned
operation incorrectly fall through and get clamped to the slower untuned
max_speed_hz?

Could this also cause pre-tuning operations to accidentally bypass the clamp
if their natural maximum frequency happens to match the board's post-config
target frequency?

> +
>  	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
>  		op->max_freq =3D mem->spi->max_speed_hz;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D4
