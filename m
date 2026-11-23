Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427745;
	b=tMo2CXihEz5oeuHCfsRMNG7EMi3UaPBc+jw8g932RyfhlDDCFJWoJPPKKs/CHdadZ//r
	 aQ98+pMVeYWvQavANudU90K1Db+Ug8Z2jZsMkzNB2YVpy4Ziyj5QeYMxbcKtEWTLrctM8
	 1mIubs9xEx0XZOLwiEIF7QYZeQ5ZNz8VyqWcnO635iKqMIuK0HewSUI4UesBhqR9iH85O
	 QDWN83H1QQVs7X4L5dXAHsavzeo0rcbyj/fStgeDWfshPJVwrMSGFIV8HIzhct+G3YnCG
	 X9k7p4tZjKoJvklMMc9H4bhjGoX+OCqFeJOoy8BdB5k+o5bEUrg7h9Kguj/f0rKvrCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427745;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6la6sExbZf3UDj3whqci5hiXuRTgL2TT0YTzN9W0cA8=;
	b=aJtXvnSKHafZcx86UT/JLLCOYp0ZmdJN+qfmoRfG3NLFZzJIg1Ei6A99Uz+awhI61TMG
	 ejDR44SMj+c66o/N6VrElwhZ3TkInyAEzYJTGv0ioS2dBS8DYPU+j1k6/IpUm1gOnh9r6
	 2UnX4XK0v8WpH+VPhIOqDR3lPPet/qEQrcYuFA+NN1fjFjZRlcLcGSinxTHauMKIlyBG/
	 VWSafYM17YPPp4FaudBof7umUgEjmrRWJUcdCV4ybodRTeHC7ux60WcYz/4xWIYxZb7MV
	 2298CJwF37Q9lXcio24mnb1ePH+NyiEzosuChPvOjy4yJjeOYUYaoEbtOyo0KOLIMlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q/NPsF1n";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B01F606A331
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q/NPsF1n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A641F00A19;
	Mon, 23 Nov 2026 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427745;
	bh=6la6sExbZf3UDj3whqci5hiXuRTgL2TT0YTzN9W0cA8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q/NPsF1nXH69Hgh8naikJ3a3tz8VXk1Iaql0SeYWDTTDuUAovwSFMg351X6bE/4ud
	 KXbdTOH2ifIsGknNzld6eI2USJwn/ECSCvB795lWIO0uR0UXp//bKUdu0hphO76g0C
	 3nmYbwjCtyMgTK2EiaLJEw9YLYqWJKmYnXllDkdCXFTawd1qxkyuOQKWvRU8dtTKbU
	 6byz4a6xpz09+3CGzIA6APjhev1naUF8X1A5I9VwaPXybWCLMSRuv0fN7iHzZRphX8
	 OLECcKTg50W7WTwgVq2cQ8JIEwSvJWx3uXyCocDSXjAxNOA8lquv9sRbpsJoupmNQr
	 18ZeFNqa4GrBw==
Message-ID: <sashiko-outbox-229013@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] mailbox: marvell-mhu: add Marvell MHU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Cercueil" <paul.cercueil@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123094542.44101-3-paul.cercueil@bootlin.com>
References: <20261123094542.44101-1-paul.cercueil@bootlin.com>
 <20261123094542.44101-3-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 09:55:44 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] mailbox: marvell-mhu: undeclared ioread64()/iowrite64() under
  COMPILE_TEST
--

commit e362a8700ec12375ab4fa67b4954b2473fced942
Author: George Cherian <gcherian@marvell.com>

mailbox: marvell-mhu: add Marvell MHU driver

This commit adds a mailbox controller driver for the Marvell Message Handli=
ng
Unit on OcteonTX and OcteonTX2 platforms.

> diff --git a/drivers/mailbox/marvell_mhu.c b/drivers/mailbox/marvell_mhu.c
> new file mode 100644
> index 0000000000000..de7690897cc99
> --- /dev/null
> +++ b/drivers/mailbox/marvell_mhu.c

[ ... ]

> +static int mrvl_mhu_send_data(struct mbox_chan *chan, void *data)
> +{
> +	const u64 doorbell =3D 0xff;  /* Arbitrary value, SCP requires a value =
*/
> +	struct mrvl_mhu *mhu =3D chan->con_priv;
> +
> +	/* signal SCP */
> +	iowrite64(doorbell, mhu->base + AP0_TO_SCP_MBOX);
> +
> +	return 0;
> +}
> +
> +static bool mrvl_mhu_last_tx_done(struct mbox_chan *chan)
> +{
> +	struct mrvl_mhu *mhu =3D chan->con_priv;
> +	u64 status;
> +
> +	status =3D ioread64(mhu->base + AP0_TO_SCP_MBOX_LINT);
> +
> +	return status =3D=3D 0;
> +}

[Severity: Medium]
As reported by kernel test robot on v2 [1], does this fail to build under
CONFIG_COMPILE_TEST on 64-bit architectures with CONFIG_GENERIC_IOMAP=3Dy
(such as x86_64 and powerpc64)?

On CONFIG_GENERIC_IOMAP architectures, ioread64() and iowrite64() are not
declared unless linux/io-64-nonatomic-lo-hi.h (or hi-lo.h) is included.
Using readq() and writeq() directly, or including one of the 64-bit
non-atomic I/O headers, would avoid the implicit function declaration
error.

[1] https://lore.kernel.org/r/202611212016.DdozCIS5-lkp@intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123094542.4410=
1-1-paul.cercueil@bootlin.com?part=3D2
