Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891B53F1AC6
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975777; cv=none; b=vA3Dxy8KSxrrEkYx0arUwa85X0lEmKisdXvGGyOt79GBBfJxet47tLeja3qcC+vE9bH1rSVcWsMRRlSXDkumSa0zpzbKIRvvUyResPD2ylawAvWmPmQcJJtGGQZa7R4BLUizcXgOgtQ5a5f1aRFOgUijQ1XCIJzaF+XaC+QNNOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975777; c=relaxed/simple;
	bh=K1h2h70Kg7mlBm5CKFkhFRtqimQPKIZhcitVm8oxotI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YKavJj9AJRS4+Ve9d5nwhb+MZfP9+3eWxt7KXoBJYJBN53Tcgyg95KlKC10519MUB56h3M2NfRzpf0tok3v/vktdSok81ul4WEK3LXePbRD8wSJKq+qIdXQLvlY3YqKZe+nhdHS3NUmV5bD+CMw0P2f0eBGjHZR0UOadu04u/0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvmmH36u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvmmH36u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC481F000FF;
	Mon, 21 Sep 2026 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789975773;
	bh=3GNvKHndknsRuysIzkoAIGFKz/RGLhmcpCgAkEsB+pc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IvmmH36u9ncRWwVVZmo8V6FL7XGqxdUOWNRUkbwWFbkLoq3xwUQcSF8L1UrNFihGd
	 RA6NlzZ5BuYCgR6oyVubt+wvCed8hXkv7wwvhoeYFyE77XgzdG9C5762pmnRT8onyw
	 sHocARzB+CnaHQKchn9/bDG2NkEabpMvvudyrpegUZlAlDhfd92Ldagc/VMczVd8iT
	 k5w6zuvbSj9erWIRy3SxgK3TrARD9JGYESAKScx8Tyde/1gaXXvt+/itgN3QjpZq59
	 OTaGH3iJAljhTTLA7AJhJVDnCwQQ/8ggs/8svcuvApHi9KSE23wxvocpqSaUj41t1+
	 HKKlTLDrAdAyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] pwm: add Axiado AX3000 PWM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921-axiado-ax3000-pwm-v5-2-202aad28e129@axiado.com>
References: <20260921-axiado-ax3000-pwm-v5-0-202aad28e129@axiado.com>
 <20260921-axiado-ax3000-pwm-v5-2-202aad28e129@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:29:33 +0000
Message-Id: <20260921072933.8AC481F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pwm: axiado: misinterprets constant-high hardware state as 0% duty=
 on readback
--

commit 0be6bd48e49f4eaed6639766408acd48c1985d0f
Author: Petar Stepanovic <pstepanovic@axiado.com>

pwm: add Axiado AX3000 PWM driver

The Axiado AX3000 and AX3005 SoCs include a single-channel PWM
controller. Add a driver supporting period, duty-cycle, and enable-state
configuration through the Linux PWM framework.

> diff --git a/drivers/pwm/pwm-axiado.c b/drivers/pwm/pwm-axiado.c
> new file mode 100644
> index 0000000000000..781053e255f03
> --- /dev/null
> +++ b/drivers/pwm/pwm-axiado.c
[ ... ]
> +static int
> +axiado_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> +				 struct pwm_device *pwm,
> +				 const void *_wfhw,
> +				 struct pwm_waveform *wf)
> +{
> +	struct axiado_pwm_chip *axpwm =3D pwmchip_get_drvdata(chip);
> +	const struct axiado_pwm_waveform *wfhw =3D _wfhw;
> +	u32 period =3D wfhw->period;
> +	u32 duty =3D wfhw->duty;
> +
> +	if (!wfhw->enabled) {
> +		*wf =3D (struct pwm_waveform) {
> +			.period_length_ns =3D 0,
> +		};
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * The constant low encoding doesn't hold a period. Report the
> +	 * shortest one, the output is low for all of it either way.
> +	 */
> +	if (period =3D=3D AXIADO_PWM_PERIOD_CONST_LOW) {
> +		period =3D 1;
> +		duty =3D 0;
> +	} else if (duty > period) {
> +		duty =3D period;
> +	}

[Severity: High]
Does this logic misinterpret a constant-high hardware state as a 0% duty
cycle on readback?

The driver's comments indicate that a zero high time is interpreted by the
hardware as a constant high output (100% duty cycle). However, if the
hardware is already programmed with a zero high time (e.g., by the
bootloader), axiado_pwm_read_waveform() will read duty =3D 0.

When this state is processed here in axiado_pwm_round_waveform_fromhw(),
it fails to map duty =3D 0 to duty =3D period, returning a duty_length_ns
of 0 instead of 100% duty as documented by the hardware behavior.

This could cause an abrupt output flip from 100% duty (constant high) to
0% duty (constant low) when a consumer driver probes and inherits the
initial PWM state. If the PWM controls a voltage regulator, this drops the
voltage to 0, which could cause a system crash. For a backlight, the
screen could turn black.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-axiado-ax3=
000-pwm-v5-0-202aad28e129@axiado.com?part=3D2
