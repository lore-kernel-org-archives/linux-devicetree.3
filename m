Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B0C3AF676
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434360; cv=none; b=eUMTnEJK6gyB21+F9MB1EeYF2t4gjOmA8pgVEEj2hCnnagscfMyct0XYhktb8fWT92rnhq/rA73Mg9oFOOH4+Xe/6x/G2xDd+ivlbCBZPHfVfVU/sIeywyBwqRoFPIzfs0on+qjuS1tgoiG95ERoOmThp1DtDUx4NzAD9CoxFac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434360; c=relaxed/simple;
	bh=LS6P6W4vPaHdn+epo5WlsPBRKHxaA3DoH472XVK3S7E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z/G7p2Ym2grWrkLhnneonhpUDoBrotV7HQ10ycqvS5qAJazEHZoqberHRajV2gzfhd9eVAUEtTbAWSYyCvJ2tst/YmELExI01CEvGFKcd4hnK7bWJw6P2U7x0St3poV5FWfQfTwnQr4Jgs4ZeWvaH6RLrP/HmKo6Sd2Nd3tXSgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfqYcjg1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfqYcjg1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE5D1F000E9;
	Thu, 30 Jul 2026 17:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785434359;
	bh=2mxrWWR13H0R88U4cHuh6I6VeSlWLAXO2TlyCFHFW14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PfqYcjg1cwQj2pwyr1odAgwalhiTVWAGjlYWnmrUxzK7wUUAxOO5UQ3nwu8SSBl7W
	 egvp5tyi0yHCGLiK1+Lw/iqdSY6MYnmn3tC2cNlYwIQFUim2WMi4ED8HX9O70pthmS
	 ZHxJHQvCEGd9yNJMytazyQYQavTdyBIGhwbx3MqLfUjIPWwxG+lggJ+yYnitnMgqHJ
	 jEUMom5YMXC8kXElNT1XnPdSucrIGlPIUcRfSW8FclbICbYFEeYZdOO3FTUV569r/t
	 BkR3AWVbVzY4tGx0tKgLXoNjP3SPjqyZsN6mTutvMJjBR02y8j+UM60igkSwD0BStC
	 BFXw++YcGFfYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/15] ASoC: msm8916-wcd-analog: add pm8950 codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730174353.108023-14-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-14-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 17:59:18 +0000
Message-Id: <20260730175919.0CE5D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing NULL pointer check for the return value of `of_device_get_=
match_data()` leads to a kernel panic if the driver is bound via a non-OF m=
echanism.

Pre-existing issues:
- [High] Interrupt handlers are requested and enabled before the component =
state they depend on is initialized, leading to a NULL pointer dereference =
if the interrupt fires early.
- [High] Component removal powers off regulators while threaded IRQ handler=
s are still active, leading to hardware accesses to a powered-off device.
--

--- Patch [13]: [PATCH v6 13/15] ASoC: msm8916-wcd-analog: add pm8950 codec=
 ---
Note: The format of this review report is altered to provide a free-form su=
mmary of findings without directly quoting the original patch code due to r=
ecitation restrictions.

commit 16b89870656fc786971dbd432019e6b7585632a2
Author: Adam Skladowski <a39.skl@gmail.com>

ASoC: msm8916-wcd-analog: add pm8950 codec
   =20
Add regs overrides for PM8950 codec and implement matching reg overrides
via compatible.

In pm8916_wcd_analog_probe(), the code retrieves match data using
of_device_get_match_data() and assigns it to wcd_reg_init_data, which is
then immediately used in a loop condition.

[Severity: High]
Does this code handle cases where the driver might be bound via a non-OF
mechanism? If of_device_get_match_data() returns NULL, the immediate
dereference of wcd_reg_init_data->seq_size will cause a kernel panic. Could
a NULL pointer check be added before accessing the match data?

In pm8916_wcd_analog_spmi_probe(), threaded IRQs are requested using
devm_request_threaded_irq() and unmasked. The ASoC component state
priv->component is initialized later in pm8916_wcd_analog_probe().

[Severity: High]
This isn't a bug introduced by this patch, but can the interrupt handlers
execute before priv->component is properly initialized? If an interrupt fir=
es
early during initialization, pm8916_mbhc_switch_irq_handler() will
dereference the uninitialized priv->component pointer, leading to a crash.
Should the interrupt registration be deferred, or the IRQs kept disabled
until the component probe completes?

In pm8916_wcd_analog_remove(), the regulators are disabled using
regulator_bulk_disable(). The threaded IRQ handlers are tied to the platform
device via devm_request_threaded_irq() and remain active.

[Severity: High]
This is a pre-existing issue, but does this function properly synchronize
or disable the associated threaded IRQ handlers before powering off the
regulators? If an interrupt fires right before the regulators are disabled,
the IRQ thread could wake up and attempt to access the hardware via
snd_soc_component_read() while the device is powered off, potentially
causing a bus timeout or crash. Should the IRQs be explicitly disabled
before turning off the regulators?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730174353.1080=
23-1-mailingradian@gmail.com?part=3D13
