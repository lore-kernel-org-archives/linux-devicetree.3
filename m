Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768BD21767D
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784988124; cv=none; b=r7GvPu+ocojQM4LRF8VwnoLktRKli5Da/EAQ9ruKK/bn8qOrIAfnm4N34ZyhqxouruUUoT6i5aC4yRRr6XLrCc/mWZ+0feeP5+70rCg5qtFretByUw5NVgJt/zECfluGsoQcTsZqdwxoZ50WXekJavNQXcGD/JbaQter+/TYZvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784988124; c=relaxed/simple;
	bh=UZQIN5pF4dDV8kq5eilmwUUwvhRcRT9FVT/vEWEl8w0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t267eCt4hstSQ8yhKsZXVjpyCpTmaAf49Pi3FbhqzN6s6bz/B86OV2aYwmJK3PY/iVr9EVIH267zlR2lzqgxasvF8qbVTc6B2571rcM6N96MszKVhEQMeERbF9/2WYCjw9PyG4uBhE4HJy5txlMfAynGV4f+eJrYsts1UZAkshg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btA+RIBh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btA+RIBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190DD1F000E9;
	Sat, 25 Jul 2026 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784988123;
	bh=a9DIMxggyA+0gWjH3DQvGV4ggascungr3GvXG9kJC1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=btA+RIBhUab7b9cFLKS0ucnSKcrosRUc0IV8Yyhp6gFBySC48iPsFW0SOrLprukri
	 29D8ri1UZeF/wxl32kty9aobt6XiiveU/udU9BscI5JiqAxiBKsycBIyEkKOoVpr6D
	 G/SkzDubB/xd3WEKgANeRx9lPJt5kSn1uFu+XLN2Qa18+T2VG3+eU2RBISv0AhxdGO
	 SYTfuqC/S7rqTPUGaM8RMWdYSGyXPe7ON7CadM6EWKdbTTcbvDtqk2BPVLI6v9OuJJ
	 Z4lFQovYdg6qnv15tW51ag9oA7T2fhGno5Zbonn8M6csqHV2sg7aden6evkgrNSzHW
	 licU68fHcEkog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] spmi: apple: Implement remaining commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260725-t603x-spmi-v1-4-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
 <20260725-t603x-spmi-v1-4-e1a29fcd2d38@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 14:02:02 +0000
Message-Id: <20260725140203.190DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent SPMI commands from different contexts will interleave I=
/O register accesses, corrupting the hardware FIFO.
--

--- Patch [4]: [PATCH 4/7] spmi: apple: Implement remaining commands ---
commit 98224e3bba3190837586da097a367e28d4210468
Author: Alba Mendez <me@alba.sh>

spmi: apple: Implement remaining commands

Add support for zero write and power management commands to the Apple SPMI
controller.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 4678a9e5270aa..d69d16665ce85 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -63,18 +63,27 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_c=
ontroller *ctrl)
>  	return 0;
>  }
> =20
> -static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> -			 u16 saddr, u8 *buf, size_t len)
> +static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			 u16 param, const u8 *buf, size_t len, u8 *ibuf, size_t ilen)
>  {
>  	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
> -	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);
> +	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, param);
>  	u32 reply, rsp;
>  	size_t len_read =3D 0;
> -	u8 i;
> +	size_t i =3D 0, j;
>  	int ret;
> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
> +	while (i < len) {
> +		j =3D 0;
> +		spmi_cmd =3D 0;
> +		while ((j < 4) & (i < len))
> +			spmi_cmd |=3D buf[i++] << (j++ * 8);
> +
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> +	}

[Severity: High]
This is a pre-existing issue, but can concurrent SPMI commands from differe=
nt
contexts interleave I/O register accesses here and corrupt the hardware FIF=
O?

Multiple client drivers registered on the same SPMI bus might perform
concurrent reads and writes using their own regmap instances.

Because spmi_raw_cmd() is entered concurrently by multiple threads, it issu=
es
multiple sequential writel() and readl() calls to the shared hardware FIFOs=
=20
without holding a bus-level spinlock or mutex.

Could this lead to malformed SPMI bus transactions if thread writes get
interleaved in this loop?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-t603x-spmi=
-v1-0-e1a29fcd2d38@chaosmail.tech?part=3D4
