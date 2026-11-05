Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856544;
	b=gN9SsnGmHTwqICugA1kqAAD6+5NATltAEhB6R48049479X5PaKhJup0nPlZcFRLwQhEy
	 WYSsIIZgjGfNePjaaaNLsjzGU0csX3KIj9aA7n7m9w09y0nRFSH1/UINRr9NAmOn3Lm13
	 AALcdHH0HuUCacQDvFprt1Y4e2xhpju9Eg56+CpMegvwrJj9XRrtcQzjNJsY1UZeazdaq
	 uHcV8Q55/yPKzgznsinWggRf4frke89QF+3GOjg+JniVCAO31JZTleKgwtSRnkvzjSVlH
	 zSy8MdNhpyjjN0C3BviqexLwjCHmzb64KqLy8OWh4WP4X34Wbwo/s+HLTw7RGxwzNzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856544;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kzZq8pBuZBmTU1uBhwyC4n3yNBmTtXf5VSWuGTN+JNc=;
	b=u1UsV4VWepC587jWNrlcVkaCgg57DU6FZuDVy8lRY+vAMXk2n+RhC69s4l9I7xA9QU+i
	 LzEKwka/08gp3+R8QsfJmjTcK6xG+VFCKDMKUbHLM3bKcxuBksfjS1z9ht8SJe3m1v0gt
	 5/wzaOpDD/qqp5GFcUBWWleWGIIRfind48w1Um8ODGXaMzHlXC1xBn0NDckUdfnQkCi7K
	 zoaIX2PzIosaxgoL8HLi0QYkkmFd+Syy7xmX2Gq45+HRxqby0EBlEJWrRVeOMaZGHA+Le
	 f5WSOHApyn9LEgJfMtwVcjltSzcP+GVR8tocBTaOytE052eDE6p9dE1RV7pbD0NlRUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lb4DX8ch;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBE2606A32C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 05:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lb4DX8ch
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093CA1F000C1;
	Thu,  5 Nov 2026 05:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793856543;
	bh=kzZq8pBuZBmTU1uBhwyC4n3yNBmTtXf5VSWuGTN+JNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lb4DX8chXiKMDjnHM/s1TTejJ5z6mEWhWL1h8g+vZxLF0N43tnhw7RXwiVmS9bdgT
	 uzC5ZgdHcZtzDBfX0+mNRezD63h1WUktQQ5kw9J1bt2teTws6n/pHVG5ZKk1997WGq
	 eoOpGbloXKg1k4+EY7io0DW3LHFY4UmzBDKaCaVosd/kTVYQiLZLlBTubRYcNnFTx6
	 HVUDxderEh1XyHK6H26VLvjn/DzH9k3OsrqrYuIBYQHDEIvQj+FAAaKjR/1qrltvsK
	 Au4HLFVd2xrNVkZCCX2KrxkkUBr7WmQO/XUPxRuml/0wtHN9rBr9l9Sq0ltCmJbrOf
	 u9a6ugiHYjH3w==
Message-ID: <sashiko-outbox-198596@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] remoteproc: amd_mbv_bram: Restore reset GPIO
 direction after PL reconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105051902.1646651-3-ben.levinsky@amd.com>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-3-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 05:29:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] remoteproc: amd_mbv_bram: processor not held in reset during fw =
load after DFX
--

commit 1347fae87b8f238d03e271a968bc4d43270edfb5
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: amd_mbv_bram: Restore reset GPIO direction after PL reconfig

This commit replaces gpiod_set_value_cansleep() with gpiod_direction_output=
()
when asserting and deasserting the soft-core reset line, and adds a reset
pulse in amd_bram_rproc_start() so that the GPIO output direction is restor=
ed
after programmable logic partial reconfiguration.

> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc=
/amd_mbv_bram_rproc.c
> index 6cf33c7b7e641..da621f62f7df5 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
[ ... ]
> @@ -94,8 +95,24 @@ static int amd_bram_rproc_start(struct rproc *rproc)
>  		return ret;
>  	}
> =20
> +	/*
> +	 * Partial reconfiguration restores the PL GPIO hardware defaults but
> +	 * leaves gpiolib's cached direction unchanged. Re-establish the output
> +	 * direction and generate a reset pulse after firmware has been loaded.
> +	 * gpiod_set_value_cansleep() is insufficient here because it changes t=
he
> +	 * value without restoring an output direction lost during DFX.
> +	 */
> +	ret =3D gpiod_direction_output(priv->reset, 1);

[Severity: Medium]
If partial reconfiguration restores the PL GPIO to its hardware default inp=
ut
direction while the remoteproc is offline, is restoring the output direction
and asserting reset in amd_bram_rproc_start() too late to keep the processor
in reset while firmware is loaded into BRAM?

In amd_bram_rproc_probe(), the driver notes that the processor must be held=
 in
reset during firmware loading:

	/*
	 * Keep the processor in reset until remoteproc has finished loading
	 * firmware into the executable memory window described by reg and
	 * translated through the parent bus ranges property.
	 */
	priv->reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);

However, during rproc_boot() -> rproc_fw_boot(), remoteproc calls
rproc_prepare_device() -> amd_bram_rproc_prepare() and then rproc_start(),
which runs rproc_load_segments() -> rproc_elf_load_segments() and copies the
loaded resource table into dual-port BRAM before invoking
amd_bram_rproc_start().

If the PL clock is already running (such as a shared PL clock required to
access the AXI BRAM controller during rproc_elf_load_segments()) and DFX le=
ft
the reset GPIO released in input mode, the soft-core processor can begin
executing from BRAM while rproc_load_segments() is writing the ELF image.
Even though amd_bram_rproc_start() subsequently pulses reset for 10-20 us,
any writable segments (.data, .bss, or the resource table) modified in BRAM
by that premature execution will not be reloaded before the processor starts
again.

Should gpiod_direction_output(priv->reset, 1) also be called in
amd_bram_rproc_prepare() so that the processor is guaranteed to be held in
reset before rproc_load_segments() writes to BRAM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105051902.1646=
651-1-ben.levinsky@amd.com?part=3D2
