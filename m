Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F992348C69
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500885; cv=none; b=KO7pj4u7TX0MdPYH0A6lBwgwLERghkcJcgqKMCqlSlHFLF0vrnaEqGm/qqsb5RX/DY0oFe7rANXoMydhMpnEJKlnBzYcoDWGmUhL2aHVKf4S25Apn9SqWdM+xb8Uqp4AVUGqWp5fKwIjy1dXEAmAQ/hDWZ8LtmfNZsPFrAxMmc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500885; c=relaxed/simple;
	bh=76QslRNChdF0Sp/T7Vk7mLJo9oGXKbhNNPuS9qQ08Sc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kqkg420gG4aRY4a/9qPahtUWEJ4dPEdIRlZoan387nMHozv85Ubct3Ei88wU57UuuafUTj0PzwNrvYvQw0/te8NF3doRz5L9A6V5KAuZ3QklmIUnipHNt8xqvq9w5ANkH/jD5RhpYJnD+2X6Mz18K7Zgk7PuzKqB6uPTL9GTx20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzpNnk5E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzpNnk5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55391F00893;
	Wed,  3 Jun 2026 15:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500883;
	bh=GoVd0tiBR7luviAQZk6ul1SMrQmyXseFnC501Lj4X1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GzpNnk5EOpYMxFDadF37UmMBhDIGFE7XUWn9tuPo1ig0MVmm62/tw9feuI+xeogmy
	 TGVWLvKuc5Iykyx3uInv9acr+Pk02VmJQ39hvuEDpcHHzhGhOcs6mJW2vHwE95axDY
	 fcKX8nMuM4gFk/ULI8x+GHyvT+NVEINoUblUyCXiJy2vyhpHfAtYiM5PN1tZZXoJ3T
	 Llgud4ROMJ0ZzOjR19wJuKv+uIj7CmoEBO9BtutI9AMayjpssIxIgfvNblKRCrtz6H
	 W82p1bY0IpnNDdiaaW1W2u/z0CYKwi/MG3It2FK/L6WEnC3D8iohUgQv90kIDa88p/
	 7oCVb4juyTH6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <350c2fb454951fd2c9d959f1d94802fea8fa8152.1780498640.git.andrea.porta@suse.com>
References: <350c2fb454951fd2c9d959f1d94802fea8fa8152.1780498640.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:34:43 +0000
Message-Id: <20260603153443.A55391F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `pwmchip_remove()` on the error path if `of_syscon_registe=
r_regmap()` fails during probe.
--

commit 90d2019e94496c6949f2d04c2605c6a197b16d6a
Author: Naushir Patuck <naush@raspberrypi.com>

pwm: rp1: Add RP1 PWM controller driver

The Raspberry Pi RP1 southbridge features an embedded PWM
controller with 4 output channels, alongside an RPM interface
to read the fan speed on the Raspberry Pi 5.

Add the supporting driver.

> diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> new file mode 100644
> index 0000000000000..052c3ae770569
> --- /dev/null
> +++ b/drivers/pwm/pwm-rp1.c

[ ... ]

> +static int rp1_pwm_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D pwmchip_add(chip);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
> +		goto err_disable_clk;
> +	}
> +
> +	ret =3D of_syscon_register_regmap(np, rp1->regmap);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register syscon\n");
> +		goto err_disable_clk;

[Severity: High]
Does this code leak the registered PWM chip?

If of_syscon_register_regmap() fails, the error path jumps to err_disable_c=
lk
without calling pwmchip_remove() for the previously added chip.

Since the memory for the chip is managed by devm_pwmchip_alloc(), it will be
freed on probe failure. This leaves a dangling pointer in the PWM subsystem,
which could lead to a use-after-free if accessed.

> +	}
> +
> +	return 0;
> +
> +err_disable_clk:
> +	clk_disable_unprepare(rp1->clk);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780498640.gi=
t.andrea.porta@suse.com?part=3D1
