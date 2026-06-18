Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793123D9670
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769743; cv=none; b=E7rMxWirVe6t09FJvgCulIXpvvYPfGXZnCN4JxU87Ga8cIC/RoGo6bXbofxlOPSM01qIOVE77mvD54dC+t5yThnVT5P2dpI4cqGh3Zfwx5if7T/01pVGAKm6/oQPHS9KSBgxi+Aecd2U/R0axohRWj1L4buyETVOdxLVfIOpby0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769743; c=relaxed/simple;
	bh=MqyKelc+I+JSSuo/yFM4Dzl5MOLVuNu/0AORiiYbzr0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u5/os17jZhrsydg5NG8jibjLtgJbIrH3ALUOLFiSemlqMGYcV3o+t+CvSToh409zMaRnwErI65Yz4/fm1B/fdXMfpPvzQt32+GeaxTC7zwn0ZE41axKEDpvlbmYNqTARXKj9qD9cQD6XA2E7z3B03QrgT8cMM4RWXm38NxcUXI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAJ1mOR/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAJ1mOR/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EE41F000E9;
	Thu, 18 Jun 2026 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781769741;
	bh=29D/vAB0fc6kid4f71TlY6oecsm8iUd/WDGEzZQIMU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FAJ1mOR/XKMp03jaZppkM1vLj5ETVAcHdPdsrONjXCINfaaN/MYaYWTbEozJa4odN
	 vcO33+7ev8qmt7HbJHF2De5L5nlGRSz1Dqey1SpLnfhebURbkGkGCgws8pFHt6NQAO
	 zIxz+epZrvixgyAJdhMcxnHiVak7nKRweydNl5oukZyMoULUIy0USzvO+cUwXeWKpZ
	 NDzInJySN0+dXTQyzfG5pSYU8r2Axl/XSp7b8cfE3vERLoSugZDjKzZpkMPu4nr8rI
	 iisHpVWQWThWyot45dvLd+rn81cmySfKz9I4XIcdmPwbDy31se8NUKffejHbODdzQ0
	 C4ny/yPbMA7DA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/16] spi: spi-mem: teach spi_mem_adjust_op_freq()
 about post-config ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260618073725.84733-5-s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-5-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 08:02:20 +0000
Message-Id: <20260618080221.06EE41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Overloading `op->max_freq` as a magic exact-match token to identif=
y post-configuration operations breaks frequency limit semantics, preventin=
g valid operations from running at tuned speeds or erroneously allowing unt=
uned operations to bypass safe limits.
--

commit c232673d530121d1e383d41f1db73523ed370bfb
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops

This commit extends spi_mem_adjust_op_freq() to allow post-configuration
operations to run at higher speeds. It bypasses the max_speed_hz cap if the
operation's max_freq exactly matches the post_config_max_speed_hz value.

> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index f64eda9bbd9f0..b0b111642a358 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
[ ... ]
> @@ -584,9 +584,18 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
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
Does this overload op->max_freq as a magic exact-match token to identify
post-configuration operations?

If an untuned operation (e.g., a write or alternate read variant defined in=
 a
flash driver with a static hardware limit of 104MHz) happens to exactly mat=
ch
the configured post_config_max_speed_hz, won't it incorrectly bypass the sa=
fe
max_speed_hz cap?

Furthermore, controller drivers like Cadence QuadSPI appear to rely on this
exact same equality check to decide whether to route the incoming operation
through the hardware PHY:

drivers/spi/spi-cadence-quadspi.c:cqspi_use_tuned_phy() {
    ...
    return f_pdata->use_tuned_phy &&
           op->max_freq =3D=3D post_config_max_speed_hz;
}

Could this cause uncalibrated operations to be erroneously executed via the
PHY at high speeds, leading to potential data corruption or hardware lockup=
s?

Would it be safer to use an explicit boolean flag (e.g., op->is_tuned) rath=
er
than hijacking the frequency limit field?

> +
>  	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
>  		op->max_freq =3D mem->spi->max_speed_hz;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618073725.8473=
3-1-s-k6@ti.com?part=3D4
