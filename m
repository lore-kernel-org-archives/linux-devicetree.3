Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58423290A6
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465609; cv=none; b=gv6c4/SLv3iki53xl5pf7nLdQOFOu5gGb4AYqtRtN8qz0zQybn3fppauc0qL+pJDZdZ+a6okvs2fWAHUJhNP3PfGimedyqQ5aJRsW1C9Jy0WH91eKi8Hq1UJprREmQytk9Bre1h9SeNidT3aYbPuW+OsKT5JWi+g7KXJOKyAYIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465609; c=relaxed/simple;
	bh=uGoNMdzK97yeIHZsxqdVyuBsLPihvFBZ0NMVkAkh2sc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tGzXVe/mKtwdeUlLVxoezravKrMkYGD66MZn4GduTg/QjSekm8sNKDY7sVlLQ1pZIVo/NjJAYsRtLbZxc+5hq9so6JNAMHQvrQMqcbap/qysz+tjhokDHrDyaUWFKzF7p2xhrxKPBHtLehe0UcrjHLFoKFePJLr2PLQDmi9mqxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDAb+UXg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDAb+UXg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12121F000E9;
	Fri, 22 May 2026 16:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779465607;
	bh=D16QJkDoyfql+Dm59k6Kv7ApwXufUsBYhAAzLx3tw/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QDAb+UXgazKbEy72J4IMCAtHZ6vZP5x7daG80V4oVTyhwBouXrTcLLzNBcnvZMyN9
	 I1VMv1ffycAsJTQmZPG2/tE4W1sSW8Ikd6UAziI6iqVzlVpWJuat0eS6dpCr9Y86Fi
	 /OjACfoeps2TAl9zUZJCf0RIRAUIGknO6AjBeXMcZgIGApnHn0xHPly60ms+WDVPYs
	 /sRM/1F8u/ssPFVornCsIhEAVwlyIMC4FM6E9CrlRSHXgMXvIKvS8MVwojYsP4VCRH
	 hFR1AZpm0UoEBm4l1kaqvZ4MTUyf/LDXaaepMFBY2b714phZ2NYzgzYdawf5ZpSjZ4
	 epP+6d3kvfnVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/10] soc: bcm2835: Use IS_REACHABLE for function
 declaration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260522-rpi-otp-driver-v6-1-b0eac97d1428@linutronix.de>
References: <20260522-rpi-otp-driver-v6-1-b0eac97d1428@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 16:00:06 +0000
Message-Id: <20260522160006.F12121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Replacing IS_ENABLED() with IS_REACHABLE() introduces silent runti=
me failures (such as infinite probe-deferral loops or silently failing oper=
ations) by hiding unresolved module dependencies behind inline stubs.
--

commit 4df320b82133df67fcde1204534b53b54b092612
Author: Gregor Herburger <gregor.herburger@linutronix.de>

soc: bcm2835: Use IS_REACHABLE for function declaration

This commit modifies the raspberrypi-firmware header to use IS_REACHABLE
instead of IS_ENABLED for function declarations. It aims to simplify
Kconfig dependencies for dependent drivers while avoiding linker errors
during COMPILE_TEST builds where the firmware is modular.

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

[Severity: High]
Could this change introduce silent runtime failures for dependent drivers?

When a dependent driver is compiled as built-in (=3Dy) via COMPILE_TEST whi=
le
the firmware is compiled as a module (=3Dm), IS_REACHABLE evaluates to fals=
e.
This causes the compiler to silently substitute hardcoded inline stubs
instead of linking against the real firmware functions.

Consequently, the build succeeds but the drivers might fundamentally fail at
runtime. For example, devm_rpi_firmware_get() returning NULL could cause a
permanent -EPROBE_DEFER loop, or rpi_firmware_property() returning -ENOSYS
might break all NVMEM reads and writes.

The previous Kconfig dependency forced dependent drivers to =3Dm in this
scenario, guaranteeing functional runtime behavior and using linker errors
to enforce correct configurations. Does using IS_REACHABLE here mask these
module dependencies in a way that breaks the drivers at runtime?

>  int rpi_firmware_property(struct rpi_firmware *fw,
>  			  u32 tag, void *data, size_t len);
>  int rpi_firmware_property_list(struct rpi_firmware *fw,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-rpi-otp-dr=
iver-v6-0-b0eac97d1428@linutronix.de?part=3D1
