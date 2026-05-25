Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74E337F72A
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779708385; cv=none; b=mhDv9DbEbUrn58ONc3bfG1csV8ivkAcLMo8RlNpOp+65QY3L0Yjd5tOJqKW0GAV0l/Im9guRU5kCZp6MuimO7BGAzaCfu4nGhrKJAt6viQHOm1tsqc9peQSr79WDrmZfwykhcGx/lGXyZDthkjAvmtIHFFKGWEXSr+J7NIlA+To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779708385; c=relaxed/simple;
	bh=97oWPjrHcifjDqS4lVIBvXeAswz3239l1JoGy25p25Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I/GIVbWyaDRAbujRSeSIKPaI7FbhXQipS2hvoBevuDxenEO+0H1riDXr7+/sdXGgFJoGsORuahIMaMVUWQky0jTgPSwEnSMniIcJbM0bC5JodV0f5NVSTvyfWkb5tpw3ZRlZfIb5A9uZwawGfh3/ilUCfgWurLAxOjg8vgCy068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClRXlRwg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClRXlRwg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5062B1F000E9;
	Mon, 25 May 2026 11:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779708381;
	bh=TH+96+WnRjJ1XBmwJc5AclzkhoEK6OfqWIFLpp0Regs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ClRXlRwgEeylkZn2IT3SBdTdgwwQVI4VIukUc4y/2Lm+YDUHmUkiZR1RtgP0s88fC
	 LCKVCKANUP5pm2e15LhmrYgnxP1ww/wGEaWQEdv3w+o9opBRBhWuzKohkpMMCoVblM
	 vN36xm2L3LLmenyex+qizW82X9ZYSq/3U+g7PVAKNYtqKfit78kxnT5fjYCQi5R0i6
	 Trk3bfe2Zo+eKSTZS0kQk9lJoaIpIi6ZQdTPyDTnBhZ9w1JlyzY48BRgS38AzA5nDi
	 BzRKgDBx0WRD495dqovH9XGGEYSZzjNd+P0qbEX2gp5Dch+l6ky/8Ry7d8KhQLOiSN
	 vmYpoiBZZqB2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] serial: max310x: honour rs485 properties from
 per-port DT subnode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525-b4-max310x-rs485-dt-v1-3-e6c19b4d5592@vaisala.com>
References: <20260525-b4-max310x-rs485-dt-v1-3-e6c19b4d5592@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:26:20 +0000
Message-Id: <20260525112621.5062B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Temporarily overwriting `dev->fwnode` and `dev->of_node` on a regi=
stered, globally visible device introduces a data race.

Pre-existing issues:
- [High] The `out_uart` error handling path evaluates uninitialized `port.l=
ine` values, erroneously unregistering active ports belonging to other devi=
ces and corrupting the global `max310x_lines` bitmap.
- [High] Pending workqueue items are not canceled on the probe error path, =
leading to a Use-After-Free when the port structure is freed.
--

commit 3e1bd1a61fad1b712f05a7d2af4ef0dec8419dd9
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

serial: max310x: honour rs485 properties from per-port DT subnode
   =20
This commit updates the max310x driver to parse RS485 properties from
per-port DT subnodes by temporarily reassigning the parent device's fwnode.
It falls back to the chip-level fwnode for single-port variants.

> diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
> index 5cb7d01e40466..745498034293c 100644
> --- a/drivers/tty/serial/max310x.c
> +++ b/drivers/tty/serial/max310x.c
> @@ -1426,6 +1426,9 @@ static int max310x_probe(struct device *dev, const =
struct max310x_devtype *devty

[ ... ]

>  		/*
> +		 * Temporarily retarget dev's fwnode to the per-port subnode
> +		 * so uart_get_rs485_mode() picks up the per-port properties.
> +		 * For single-port variants, fall back to the chip's own
> +		 * fwnode so legacy DTs that declare rs485 properties at the
> +		 * top level keep working.
> +		 */
> +		if (port_np) {
> +			device_set_node(dev, of_fwnode_handle(port_np));

[Severity: High]
The commit message mentions that probe is serialized, but the GPIO controll=
er
was already registered earlier in the probe function. Does temporarily
overwriting dev->fwnode and dev->of_node on a globally visible device
introduce a data race? Concurrent subsystem requests resolving GPIOs might =
see
the wrong node and fail non-deterministically.

> +			ret =3D uart_get_rs485_mode(&s->p[i].port);
> +			device_set_node(dev, saved_fwnode);
> +			of_node_put(port_np);
> +			if (ret)
> +				goto out_uart;

[Severity: High]
This isn't a bug introduced by this patch, but if we take this early error
path, are the pending workqueue items canceled? The workqueues were
initialized earlier in probe via INIT_WORK, and skipping cancel_work_sync()
during this early exit could allow background workers to dereference the po=
rt
structure after it is freed.

[Severity: High]
This is also a pre-existing issue, but does the out_uart error handling path
evaluate uninitialized port.line values when jumping here? Because port.line
might evaluate to 0 on early probe failures, it could trigger
test_and_clear_bit() against line 0. Could this corrupt the global
max310x_lines bitmap and erroneously unregister active ports belonging to
other devices?

> +		} else if (devtype->nr =3D=3D 1) {
> +			ret =3D uart_get_rs485_mode(&s->p[i].port);
> +			if (ret)
> +				goto out_uart;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-b4-max310x=
-rs485-dt-v1-0-e6c19b4d5592@vaisala.com?part=3D3
