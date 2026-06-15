Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81723AEF44
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505218; cv=none; b=b4WDKA0XEzF6HucVI8d1QnHaLJtTDZe/Xlrwbwa88OuKEzZklnaZcuZO8flTQZKwmSQBgxOiqZbuYWP8z0ONavsLZudgKd3Ao2bCY0iEBZuFW5sU6PD3kHBFFcjDkvnUyj4J6Z0lYaSvavSkPfN/fJUQpwnC3/WxW3g2cMHs0jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505218; c=relaxed/simple;
	bh=RYlnN1UoBKJgX9hvRab5U1l5YkbUWHZc1gsJoTEd9EQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uXboBlnuJYdsYmmfMpNK+wji44h5wMdfjo2RMuGwJg3x+9Op9sdp6MFMpj5uyzdy4RGWxfazikks535PRTmx3e4i0dzLHl4GRGVD6XO8jFuL4nGsz8HTGJ03XKVg9dD+ldtzH07s7zpOfakMew4Go6Iy72S5OrdV7FRvK+Pt8iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZttmN3Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZttmN3Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9C91F00A3A;
	Mon, 15 Jun 2026 06:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781505217;
	bh=aVmKumIUX09Q1EFqB0mffVlzsyVYAuR20E79BUfelUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fZttmN3QM7M+IpW/mQsIZK0lwB+H/vt+OpWoYxS+2M5XYvF1tyUmnt1MKbbaeOqsN
	 mMawyC1o1U9obz0oLQPksvayxIVhvMKxoVmto+nspRoRLRsZ/VVL5OnGXyVh1uMBc9
	 Dm68bwJa7XwX0GzgU56r1ka70rQmTpAylgxAi9vC/NghBknTMAW/cbdFpIxRnG7ZsJ
	 QIvhGApWo+x+B3VxPobUg3tzcwUxh2UCZX4KfiBg4w+vLz/211JrbySACG3cQ2c44h
	 wbVlANPOVmlLoOl9w9yZV7spffCq0z/o9o8fnpiltuZfZbjblc+Kkixt5zh17H2Vg2
	 96gk4pE3Iwukg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] iio: dac: ad3530r: Add support for
 AD3532R/AD3532
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260615-iio-ad3532r-support-v2-4-84a0af8b83fa@analog.com>
References: <20260615-iio-ad3532r-support-v2-4-84a0af8b83fa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 06:33:37 +0000
Message-Id: <20260615063337.6D9C91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `AD3532R_MAX_REG_ADDR` macro is off by one byte, which breaks =
read and write operations for the highest channel (channel 15).
--

commit 26c7d468b3bc4ece87a824dffd3ce6a739dc9fcd
Author: Kim Seer Paller <kimseer.paller@analog.com>

iio: dac: ad3530r: Add support for AD3532R/AD3532

The AD3532R/AD3532 is a 16-channel, 16-bit voltage output DAC with a
dual-bank register architecture. This patch adds AD3532R-specific register
definitions, channel specs, per-bank register arrays, and per-chip
regmap configurations.

> diff --git a/drivers/iio/dac/ad3530r.c b/drivers/iio/dac/ad3530r.c
> --- a/drivers/iio/dac/ad3530r.c
> +++ b/drivers/iio/dac/ad3530r.c
> @@ -39,6 +40,22 @@

[ ... ]

> +#define AD3532R_SW_LDAC_TRIG_0			0x10E5
> +#define AD3532R_SW_LDAC_TRIG_1			0x30E5
> +#define AD3532R_INPUT_CH_0			0x10EB
> +#define AD3532R_INPUT_CH_1			0x30EB
> +#define AD3532R_MAX_REG_ADDR			0x30F9

[Severity: High]
Will this maximum register address break accesses for channel 15?

Since ad3532r_input_ch_reg(15) correctly returns the base register address
0x30F9, and val_bits is 8 for this 16-bit DAC, accessing the channel requir=
es
reading or writing 2 bytes (addresses 0x30F9 and 0x30FA).

If max_register is restrictively defined as 0x30F9, the regmap subsystem's
bounds check will reject the access to 0x30FA and return -EINVAL during
regmap_bulk_read() or regmap_bulk_write() operations.

It looks like this might be a copy of a pre-existing bug in the driver, as
AD3530R_MAX_REG_ADDR is set to 0xF9, which would similarly break channel 7
on the AD3530R.

> +
>  #define AD3530R_SLD_TRIG_A			BIT(7)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-iio-ad3532=
r-support-v2-0-84a0af8b83fa@analog.com?part=3D4
