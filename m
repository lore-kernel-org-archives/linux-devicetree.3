Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF84756CD
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 17:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679371; cv=none; b=du3iGzfdETAs3xzqDszRQmQ60BNz+87pxptWuaBQa0E7yGQTieVYeABqMm+y/A+UXlWMvFSut/w5f5yK3soA6t9mZOE4nv6naVH7WIPP+Qsp1b/uvg7GucT+U8tSbgC79uFC/84jXwY5CMvbW++AWIMzEIXVSKyVaGKBVF3/TxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679371; c=relaxed/simple;
	bh=0YEsPM1TVakoUbUjZDzjkzlAcEaGzmSudYEQJiUOgV8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Od5GMI0o3yUURx+GSJM6H1uNLxRs6Tiw0mUz8JH9CPiFY0eeXUdK4/ezDcCrcTd48/MYBv4HdrZtjXGSjswvTfDsMXL03oX/7m/PNHPtlK8+bPzgBHkiXbqFKVwHfz38L/zvmJwdGFvoZZpZ2Izs6GiaXSIBZqn+VGIuobrZLq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcD7f0dY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcD7f0dY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158011F000E9;
	Tue, 25 Aug 2026 17:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787679367;
	bh=ZlZiutI7XNGPr4j9CADZGXBtP0RCvYn7c97OhXfZmF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UcD7f0dYRckApY2vPgbUULJ8/s7xCZ5qwwRhqnxPgPtAPM0efbUkWmd4aHYVUG8RD
	 iBRWGj4sGOss89sY3HxqRiwp81rG+NdytrFQ9jCZ4nIvh/C9xGbCvCwucD9NVHDO+9
	 zTeP/w/y102rnjityySgoR3VgZVRW8VEn4UMSU2BfDPlmaaQUgryNzhLm+5c1wB9Lf
	 aGJTjQZ8XsdIl4MuKXdaw2w80KrARjzRfzGAiM8xQoMzvKCCp+gAfkhTMSVbLNsKsA
	 1CehrfV9y7A2xUHbo/Z3pDqtqo/t28wNoVeZX1ute24MhqU5TMHSUKIsrTBXFCgcKk
	 mXD0J5sDzIh8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 14/18] spi: cadence-quadspi: reprogram PHY DLL on
 runtime resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Pratyush Yadav" <pratyush@kernel.org>, robh@kernel.org, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Michael Walle" <mwalle@kernel.org>, conor+dt@kernel.org, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>, devicetree@vger.kernel.org
In-Reply-To: <20260825171737.776052-15-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-15-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:36:06 +0000
Message-Id: <20260825173607.158011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Disabling 'use_tuned_phy' on DLL resync failure bypasses the P=
HY DLL while continuing to run at high speed, causing silent data corruptio=
n.
- [Medium] Iteratively reprogramming the global PHY DLL for all chip select=
s on runtime resume causes redundant delays and overwrites state.
--

commit 9b2d8bb539c61392a12afe8d25c966ba88c70398
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: reprogram PHY DLL on runtime resume

The PHY DLL loses its programmed delay values and lock when the OSPI
controller is power-gated during runtime suspend. On resume,
cqspi_controller_init() reinitialises the controller but does not
touch the PHY DLL registers, leaving the DLL in an unlocked state.
Any subsequent PHY read or write would then fail at the cqspi_resync_dll()
call inside cqspi_tune_phy().

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 530335f002fb4..94d67e8bcfbc4 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -4042,6 +4042,28 @@ static int cqspi_runtime_resume(struct device *dev)
> =20
>  	cqspi->current_cs =3D -1;
>  	cqspi->sclk =3D 0;
> +
> +	for (cs =3D 0; cs < CQSPI_MAX_CHIPSELECT; cs++) {
> +		struct cqspi_flash_pdata *f_pdata =3D &cqspi->f_pdata[cs];
> +
> +		if (!f_pdata->use_tuned_phy)
> +			continue;
> +
> +		cqspi_phy_set_dll_master(cqspi);
> +
> +		cqspi_set_dll(cqspi->iobase, f_pdata->phy_setting.rx,
> +			      f_pdata->phy_setting.tx);
> +		ret =3D cqspi_resync_dll(cqspi);

[Severity: Medium]
Will this iteratively reprogram the global PHY DLL for all chip selects on
runtime resume, causing redundant delays and overwriting state?

The PHY config register (CQSPI_REG_PHY_CONFIG) is global, yet the resume lo=
op
iterates over all chip selects, writes each CS's RX/TX taps to the global
register, and triggers a full DLL resync each time. Because only the final
CS's taps remain active in hardware, the driver's cqspi_tune_phy() function
will redundantly re-sync the DLL again on the next transfer to any other ch=
ip
select, completely negating the purpose of pre-locking them during resume.

Furthermore, master DLL lock is independent of the slave RX/TX taps.

> +		if (ret) {
> +			dev_warn(dev, "cs%d: PHY DLL resync failed on resume: %d, disabling P=
HY\n",
> +				 cs, ret);
> +			f_pdata->dll_locked =3D false;
> +			f_pdata->use_tuned_phy =3D false;

[Severity: Critical]
Does disabling 'use_tuned_phy' here on DLL resync failure bypass the PHY DLL
while continuing to run at high speed, causing silent data corruption?

If the PHY DLL resync fails during resume, setting 'use_tuned_phy =3D false'
causes subsequent flash operations to bypass the PHY data capture logic.

However, the SPI clock frequency (op->max_freq) is not downgraded and
continues running at the high PHY-tuned speed (e.g., 150-200MHz). The
controller's non-PHY fallback cannot reliably sample data at these high
frequencies, resulting in garbage data being read from or written to the
flash.

> +		} else {
> +			f_pdata->dll_locked =3D true;
> +		}
> +	}
> +
>  	return 0;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825171737.7760=
52-1-s-k6@ti.com?part=3D14
