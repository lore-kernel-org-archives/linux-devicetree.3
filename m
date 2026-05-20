Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7763EDAC6
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288061; cv=none; b=gVwNJRl51C80eCJNQWP07+6LTet3U1pVJwMpK2heEPTMjmcINfwXG28jDmL3L1ianziZx7RU8cZOsTLFJdNQgjGw9xg5b7mFXv2T1U6qwExoRkGsrc6JO0Qj+3iQlUv4X6BBvsnIGmbVbcE8JFVey7xAvf8MFeCiLBhFg/RmbTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288061; c=relaxed/simple;
	bh=o94bj6Ks4NsrpTvF/CI60JZpg9pQPot9rosy5WPizGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AH0fhI6EKawGl3XIKTIFRinD9HpqekL68I2/KKhWxuxcnpw3LBOpcNyrbW0AXzWNl6j3K8oWK1rT5OeB1dWQcdEFAb0V+/bZTYMVffu4EU9dtAILY2aF+oUndzGPAxgFP99zIHjZ5tvsCXj+yT/KrTA9NXw2RRqWVfl0/4pSwVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ys+yadcY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ys+yadcY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B161F000E9;
	Wed, 20 May 2026 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779288060;
	bh=wYZ1v4vkEbZwHquGAX9rCGZ5cVIdlsHmRJO3/4PXEK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ys+yadcYsV6AsMYrNSdyZnDAjtnIZURig8r3iQz35VlmSUk6CqlIRTHb48W3K7dQa
	 PWzYPQWh6Byq+dGp3q/kh4piwgs+q8c/JyQu12uYjo87141AbevrP4gYE66/3yYgJJ
	 JthDLAnpBzoFVDk1A+jZlgo3SqY8cuR9YaMB48vyqoKyIJx5czXBeogYU4nxeVOYiH
	 +sqF3ze5kgJ42Qfl3VMJE8txLIM+HPxnsUtLlr1TJ/I9q/ihLuQfRhDwNjQIKIcw7a
	 vzGKnUiVNjDPdgEsvS31W/8TEbvNp5q2mD3s6TJYsR3Yz3bNiM/yyAlp+ZaoerQ6Hr
	 dacCvpneXwSyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/8] soc: bcm2835: Use IS_REACHABLE for function
 declaration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520-rpi-otp-driver-v5-1-b26e5908eeac@linutronix.de>
References: <20260520-rpi-otp-driver-v5-1-b26e5908eeac@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 14:40:59 +0000
Message-Id: <20260520144059.C8B161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Misuse of IS_REACHABLE to hide Kconfig dependency mismatches, le=
ading to silent runtime failures.
--

commit dcaefe39201e65d292203c3c769d9af92e05fa3c
Author: Gregor Herburger <gregor.herburger@linutronix.de>
soc: bcm2835: Use IS_REACHABLE for function declaration

This commit modifies the raspberrypi-firmware header to use IS_REACHABLE()=
=20
instead of IS_ENABLED(). The goal is to simplify Kconfig dependencies for=20
drivers relying on RASPBERRYPI_FIRMWARE and avoid linker errors when=20
COMPILE_TEST is enabled.

> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm=
2835/raspberrypi-firmware.h
> index e1f87fbfe5542..eb33838e0cd10 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -174,7 +174,7 @@ struct rpi_firmware_clk_rate_request {
>  		.id =3D cpu_to_le32(_id),		\
>  	}
> =20
> -#if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
> +#if IS_REACHABLE(CONFIG_RASPBERRYPI_FIRMWARE)

[Severity: Medium]
Does using IS_REACHABLE() here risk silent runtime failures?

If a dependent driver is built-in (=3Dy) while RASPBERRYPI_FIRMWARE=3Dm=20
(which becomes possible when changing the Kconfig to just=20
depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST), IS_REACHABLE() evaluates=
=20
to false.

Instead of Kbuild catching the dependency mismatch with a visible link erro=
r,=20
the compiler will silently substitute dummy inline implementations for the=
=20
firmware API calls. This allows the built-in driver to compile and link=20
successfully, but it will fail at runtime (e.g., rpi_firmware_get()
returning NULL).

Was the original Kconfig expression explicitly structured to catch this=20
built-in vs module dependency mismatch at configuration time rather than=20
hiding it at runtime?

>  int rpi_firmware_property(struct rpi_firmware *fw,
>  			  u32 tag, void *data, size_t len);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-rpi-otp-dr=
iver-v5-0-b26e5908eeac@linutronix.de?part=3D1
