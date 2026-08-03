Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC010371068
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751299; cv=none; b=H8R1sPsaqyieRNOfQJ/3w4j4LBj4e4oQ9QDb+ko8YSZiV5nM8dBABYvmnk06T4AaWYsG091Pjgf+pYVtZHMe4LYduYvH0pkHlW/n3I6nYJP28ZTti93cXyX3gIJLLsxr/JvSXDnBrHceR2M0InU2W/jvtZwkpXiDtv2v3iUvNfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751299; c=relaxed/simple;
	bh=y1AttGBQDlwouhSiFkapjMYdRVY+Y78QXI+87kEnXMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X1dbK5LkQSZCjCD5mK18c/OLbT5GnRjvQkc/4kwouXa56vg33OQZ34loC+ygOerI+AqW9O68D2+5UrlCFx4tXDLdtWNR34lV4/NkywxxYG4sZ233HTjfZZPfPOfba+JIqY2jr0ielgZyJho3MbEVhFsBSusWTWfyB8zv4WEcFik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdC3/NJq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdC3/NJq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3081F000E9;
	Mon,  3 Aug 2026 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751297;
	bh=Rl70Ethzir0io5LSej1IPvBT0LZecWU9gWjw9/2zehA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RdC3/NJql484h2Dh4F8hcj6jmPub0895boXdSSTAaDtezwrz7PnicVZlSalJFyaOc
	 MAVY2rNexeLBHqMANM929qS2yN2Xhe/wN6r5PICjuU4j9M09CD2P/r+5bNZlxRBtj6
	 MkZsM09lX698iVO6vlseE9oAROJ6J8YshzjAgyDDJR22owEt+4QMS99it21+tt+PTm
	 QRi4rMxXxMp+1TAWwtvM688OOGH+hg6wdpOBFL0eQEX2yvGIhGtEPLUR3RDrbVmNoC
	 3w9EXmL74O3mkXnTYgZHUgQWjllmrQ4iyEJBrFT70DwAEBgjBn3cx66CWMsVRki0He
	 OGnL2tLJyC6hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 3/4] net: pse-pd: realtek-pse-mcu: add I2C
 transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Jelonek" <jelonek.jonas@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260802100114.720594-4-jelonek.jonas@gmail.com>
References: <20260802100114.720594-1-jelonek.jonas@gmail.com>
 <20260802100114.720594-4-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:01:36 +0000
Message-Id: <20260803100136.ED3081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `const` qualifier is discarded via casting when passing `req` t=
o `i2c_smbus_write_i2c_block_data`.
--

--- Patch [3]: [PATCH net-next v11 3/4] net: pse-pd: realtek-pse-mcu: add I=
2C transport ---
commit 3cb487f7edfeb05d920f7d12d74317a730a8187a
Author: Jonas Jelonek <jelonek.jonas@gmail.com>

net: pse-pd: realtek-pse-mcu: add I2C transport

Add the I2C/SMBus transport for the Realtek PSE MCU core. It registers
the MCU on an I2C bus and provides the send/recv callbacks the core
uses to exchange the 12-byte frames.

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

> diff --git a/drivers/net/pse-pd/realtek-pse-mcu-i2c.c b/drivers/net/pse-p=
d/realtek-pse-mcu-i2c.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/pse-pd/realtek-pse-mcu-i2c.c

[ ... ]

> +static int rtpse_mcu_i2c_smbus_send(struct rtpse_mcu_ctrl *pse, const st=
ruct rtpse_mcu_msg *req)
> +{
> +	struct i2c_client *client =3D to_i2c_client(pse->dev);
> +
> +	/* Send opcode as SMBus command byte; remaining 11 bytes as block data =
*/
> +	return i2c_smbus_write_i2c_block_data(client, req->opcode, RTPSE_MCU_MS=
G_SIZE - 1,
> +					      (u8 *)req + 1);

[Severity: Low]
This isn't a bug, but could we use a const cast here to avoid discarding the
const qualifier from the req parameter?

The i2c_smbus_write_i2c_block_data() function takes a const u8 * for the
values array, so a cast to (const u8 *) would preserve the const-correctness
of the req pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802100114.7205=
94-1-jelonek.jonas@gmail.com?part=3D3
