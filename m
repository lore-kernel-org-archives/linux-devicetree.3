Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993E23F7A94
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423494; cv=none; b=KBYVgD9BUWidq2b0+5cThriyIuCm74OrAsq1fnMbn3wt2S7NgqKRQc5YcPy78xx+b2+LpoWhlOfoGCWtTKxsRczI5J4ZRW7vTCj9u5ewK+abnLgidED/guW2ASMTBCWq7DhoC+cFAHlKgOe28aIkDqEJG0o2WPM0MoD7bn3v4RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423494; c=relaxed/simple;
	bh=NR0bkDV1QOKg+10SikLdx9qiPIQFykZsDLERb7G23uM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J+Ay7BFoKRrzkiKigvL0+b9duOLmiubOLBLEzLNahv904aA+7UQym76s6ulyeVWrqEMncPZs5sNMD7uF/dMhH87ch2tHytWLO2Kk2YlaElMclqa9IROiHLbzVbkuYor4BjfCWF4frZX0dvYsWcYvgSP3N7ymtDGg+VBB85b4Ff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BO3zqmPl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BO3zqmPl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2840A1F00A3D;
	Tue,  7 Jul 2026 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783423492;
	bh=ZNh/PZwB2OeHoUzha/BnCKKANz3ipWgvTwILkIfaq3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BO3zqmPl4YLGOhHlDAgWHgnjtto/xIxSymz/9rYY1nd5/RbJtxsW0I9U+XbNSIF4A
	 iFdOp5x4zymrKBb4HRAlrjqHgClkXTw8scHze9rH1x799zPabLAMNaDF0kO1Jw+crK
	 Yb8/qu6I/q9MEPJSW7+epSIGaZgMes4ugNzZqFX4yMCLszwXrVHx6ZyTwLcbI9ccsz
	 euVqOqGlfkZzlVGHz52jl3GWZzWaAcntIs01N1OpoNxJZP1Q88566ucoW8RxJwdyJ1
	 uTbBLRsP5355rWGN4y8gby2TmyQmAYZghBTkSPkHT4ZaEmG07VB1oti+LBVMTaygoe
	 vEtsa8wfi4HrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 3/4] net: pse-pd: realtek-pse-mcu: add I2C
 transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Jelonek" <jelonek.jonas@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706112425.3149226-4-jelonek.jonas@gmail.com>
References: <20260706112425.3149226-1-jelonek.jonas@gmail.com>
 <20260706112425.3149226-4-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 11:24:51 +0000
Message-Id: <20260707112452.2840A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unsafe DMA on stack-allocated buffers in native I2C transport.
--

commit 0cfb33bb6548fde90d8e33161d69d564f969591e
Author: Jonas Jelonek <jelonek.jonas@gmail.com>

net: pse-pd: realtek-pse-mcu: add I2C transport

Add the I2C/SMBus transport for the Realtek/Broadcom PSE MCU core. It
registers the MCU on an I2C bus and provides the send/recv callbacks the
core uses to exchange the 12-byte frames.

> diff --git a/drivers/net/pse-pd/realtek-pse-mcu-i2c.c b/drivers/net/pse-p=
d/realtek-pse-mcu-i2c.c
> new file mode 100644
> index 0000000000000..6e6e3645c5090
> --- /dev/null
> +++ b/drivers/net/pse-pd/realtek-pse-mcu-i2c.c

[ ... ]

> +static int rtpse_mcu_i2c_native_send(struct rtpse_mcu_ctrl *pse, const s=
truct rtpse_mcu_msg *req)
> +{
> +	struct i2c_client *client =3D to_i2c_client(pse->dev);
> +	int ret;
> +
> +	ret =3D i2c_master_send(client, (const u8 *)req, RTPSE_MCU_MSG_SIZE);

[Severity: High]
Does this code pass a stack-allocated buffer to i2c_master_send()?

If the underlying I2C bus master driver uses DMA for this 12-byte transfer,
passing a stack address can trigger a BUG/WARN on systems with
CONFIG_VMAP_STACK=3Dy, or corrupt memory due to cache line sharing.

It looks like the req buffer is allocated on the stack in the core driver,
for example in rtpse_mcu_port_query():

drivers/net/pse-pd/realtek-pse-mcu-core.c:rtpse_mcu_port_query() {
	...
	struct rtpse_mcu_msg req;
	...
}

> +	if (ret < 0)
> +		return ret;
> +	return ret =3D=3D RTPSE_MCU_MSG_SIZE ? 0 : -EIO;
> +}
> +
> +static int rtpse_mcu_i2c_native_recv(struct rtpse_mcu_ctrl *pse, const s=
truct rtpse_mcu_msg *req,
> +				     struct rtpse_mcu_msg *resp)
> +{
> +	struct i2c_client *client =3D to_i2c_client(pse->dev);
> +	int tries, ret;
> +
> +	for (tries =3D 0; tries < RTPSE_MCU_I2C_MAX_TRIES; tries++) {
> +		if (tries > 0)
> +			msleep(RTPSE_MCU_I2C_RETRY_MS);
> +
> +		ret =3D i2c_master_recv(client, (u8 *)resp, RTPSE_MCU_MSG_SIZE);

[Severity: High]
Can this code also pass a stack-allocated buffer to i2c_master_recv()
for the resp pointer?

Like with req, resp also seems to be allocated on the stack in the core dri=
ver.

> +		if (ret < 0)
> +			return ret;
> +		if (ret =3D=3D RTPSE_MCU_MSG_SIZE && rtpse_mcu_resp_is_final(req, resp=
))
> +			return 0;
> +	}
> +
> +	return -ETIMEDOUT;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706112425.3149=
226-1-jelonek.jonas@gmail.com?part=3D3
