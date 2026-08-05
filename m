Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412FF40BCA1
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925510; cv=none; b=CZ4JVEfQ+U0zrHECgUjoPb5eVHwPFQmO+3mJHvolB5FqdATzs0ha6E9NjFZi9HsUvINaXO/liMzO9Mx4hupKznKlWGZFJ1quIX0cBUSV2CJNXhT9kmggWSNCSXH7DabUCk9gMiGkQFLVCIWQsMEF9365nBIEFZA8gyZpMm2RRcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925510; c=relaxed/simple;
	bh=MsOcqiuYoLPwJq6Th51DAQjWDBPbNtEG9HG1bMuaXWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mnmZxOMD4ctl7nBfM46kevmTeRD72JwAfrW6wTTuvD0I7FHODsVqOk/Ae/6DylAqOnz5aWyT7gePyOF/MpRNDgqIZD4lWucel7o8AmJLDMtffBaJXJkWpzQZu4INurT9kjiA+U5YK1McbAIN1yBUu0xcU2rES9t1pqMAlkf4Lmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+hODbm8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+hODbm8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469251F000E9;
	Wed,  5 Aug 2026 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785925508;
	bh=eMYbF7bdMymmLmjSRYmNIC7/0QLbmi7xQsQWWClecHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E+hODbm8XGrrgU3i5jV7ScIGb+YE90WU7OTQS9AYGKY3LYIyPsED1uWu2fuJBOfZT
	 E4zpQr5oEsxdCoEW7s0eWuwAUqm3Uok2L4db6Qx5JrceW+ku6TpcNGwwY6N2v6NCFC
	 OF0vD8TFhcH8Pr5zghOVdFgnnN5AJlg9iu2csDj9ojsjCfw45NBtN5xuBIkDMxuxg/
	 uJ+643JMQ+VSaZ3nCM6Bvqmay/udb9CtjH1+5BIpHSpi4uJDkBj16nyvegF9d3Cx7E
	 TzKn2gWD+pxowzDclq3L7qiGPircMT38J8Cv+LisxBMC+P2OeRSHG66QyMXinKU/Dw
	 XP7mmvU7OtNgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] spmi: apple: lock around FIFOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-t603x-spmi-v4-5-c15a12d9a7d1@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-5-c15a12d9a7d1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 10:25:07 +0000
Message-Id: <20260805102508.469251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Copying raw bytes to/from u32 variables for writel/readl causes by=
te swapping and data corruption on big-endian architectures.
- [High] The FIFO flush command is written to the response register (SPMI_R=
SP_REG) instead of the action register (SPMI_ACT_REG).
--

--- Patch [5]: [PATCH v4 5/6] spmi: apple: lock around FIFOs ---
commit 69b70a7086a8bbc17681a468c0f31368df078c1d
Author: Alba Mendez <me@alba.sh>

spmi: apple: lock around FIFOs

The driver was missing locking around register interactions.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -79,6 +81,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u=
8 opc, u8 sid,
>  	size_t i =3D 0, j;
>  	int ret;
> =20
> +	guard(mutex)(&spmi->fifo_lock);
> +
>  	if (spmi->prev_fail) {
>  		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);

[Severity: High]
Does this flush command write to the correct register?

Looking at the error recovery path in spmi_raw_cmd(), the FIFO flush is
written to the response register:

    writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);

Should this be written to SPMI_ACT_REG instead? Writing the flush command
to the response register might fail to flush the hardware FIFO and could
corrupt the response register state.

[Severity: High]
Can this I/O access pattern corrupt data on big-endian architectures?

Further down in spmi_raw_cmd(), the command and response byte streams are
accessed using writel() and readl():

    memcpy(&spmi_cmd, buf + i, j);
    writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

and during the read phase:

    rsp =3D readl(spmi->regs + SPMI_RSP_REG);
    i =3D min_t(size_t, sizeof(spmi_cmd), ilen - len_read);
    memcpy(ibuf + len_read, &rsp, i);

Copying a byte stream into a local u32 variable and then using writel() or
readl() performs CPU-to-device endianness conversion, which will swap the
bytes on big-endian systems.

Should these accesses use stream-based accessors like writesl() and readsl()
instead to preserve the expected byte order?

>  		spmi->prev_fail =3D false;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-t603x-spmi=
-v4-0-c15a12d9a7d1@chaosmail.tech?part=3D5
