Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEE52417D9
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315035; cv=none; b=aH+hqoED/h1QJn7FhU2S5ESC4STGYE9yNJUas7klZOzF1uIWcRb5q8daFv+SO1cEmsqaBFfMblkHfCQmbKzp7jpfNbrjdoTkU6DKEaQr5Ge/tmX0+Krd2qy5iQbImLeZjG/w5wcXZxf4Vy++FB+tg1DikTuts2FF40Xgc63wYWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315035; c=relaxed/simple;
	bh=nfSxdE3IECAQvBYb/8psL76syPWrZyCE/NpeX59ljN8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YoJCKuaXwdJtNZmKgDCuCjmG3KHnbqSG5uCPYTk7m4iT/r0MksfY06SV3DKtmUqyxzcgkvGlZT0mu/R4BIh125L/AM70Wuu8iBJVMW+OCOdQMj6iHhWgFeJfJ0rUd8HmW1lLXrRT3X/PsNR3/4/o21BTfn5abXjR+Psi1mLr4fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+GPD6eI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+GPD6eI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21001F000E9;
	Fri, 21 Aug 2026 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787315027;
	bh=k9HwTYukLahIJ9LI0gyQKkSUqmnZZlR5yGlEE6izkbk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F+GPD6eIGGJDctFb4KOzt32US9ZeBfXeSpHBZOAlnqVrCbMUfS5FwAz2Xn8kkSP7i
	 9Cr2L5r52ngEgkRfCgCr4cbT1Pv/uWzMEqe023AXplCiNoXXoQ0+w0IdCi75Yqkacd
	 uNphN0NSdpPnfoUnz2gm2Ucda6hUFzvyJUqs1S2LSgeIgb86qM25oLexKZ0ANJBTYb
	 hBYcXW0SyYqfC+7faxieynrjMRvjXAZcAQ95qwOGKDJYjs3QvICMt/UneUMvjAjbO3
	 L+pDvORZ9Snpel1/0zU7oBkr4E9QsU+Riyw+tMG9yTklmhtAnh4USKF4WcWJI+e1TF
	 p/qg1q6N9DFKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 04/18] spi: spi-mem: teach spi_mem_adjust_op_freq()
 about post-config ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Pratyush Yadav" <pratyush@kernel.org>, conor+dt@kernel.org, "Michael
 Walle" <mwalle@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, robh@kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, devicetree@vger.kernel.org
In-Reply-To: <20260821114822.4040338-5-s-k6@ti.com>
References: <20260821114822.4040338-1-s-k6@ti.com>
 <20260821114822.4040338-5-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:23:46 +0000
Message-Id: <20260821122346.D21001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi_mem_default_supports_op() incorrectly rejects standard operati=
ons if post_config_max_speed_hz equals max_speed_hz on controllers lacking =
the per_op_freq capability.
--

--- Patch [4]: [PATCH v8 04/18] spi: spi-mem: teach spi_mem_adjust_op_freq(=
) about post-config ops ---
commit 66e4cfc36fb55feef18471a08846b1db198c893f
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops

This commit introduces a bypass in spi_mem_adjust_op_freq() for post-config
operations matching post_config_max_speed_hz. It also updates
spi_mem_default_supports_op() to require the per_op_freq controller
capability for these operations.

> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 5f973ebfb8b6e..cd4bc4c914e7f 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -206,7 +206,8 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
>  		return false;
> =20
>  	if (op->max_freq &&
> -	    op->max_freq < mem->spi->max_speed_hz) {
> +	    (op->max_freq < mem->spi->max_speed_hz ||
> +	     op->max_freq =3D=3D mem->spi->post_config_max_speed_hz)) {
>  		if (!spi_mem_controller_is_capable(ctlr, per_op_freq))
>  			return false;
>  	}

[Severity: High]
Does this incorrectly reject standard operations if a device tree configures
the post-config frequency to be identical to the base max_speed_hz on
controllers lacking the per_op_freq capability?

If spi_mem_adjust_op_freq() sets op->max_freq to mem->spi->max_speed_hz
for standard operations, and post_config_max_speed_hz happens to equal
max_speed_hz, this condition will evaluate to true.

Could this unnecessarily require the per_op_freq capability for all standard
operations, such as reading the flash ID during probe, and prevent the
device from working entirely in this configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821114822.4040=
338-1-s-k6@ti.com?part=3D4
