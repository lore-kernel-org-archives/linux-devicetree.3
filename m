Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C32F3C19
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550095; cv=none; b=Y7yeiBWVSBMEl/qfarnZLEqkKcjlKliXovQiQvGRBmH2m/sB8I/TjgfIiedIWvqAL3PsjuIrv4DyPWjqFIJp2Ttn1v9IXKkmR64FxiLbuFCL+Yj0XeT+GTobC+Xt1ECfMeWL2vujRzkifm2GY9tI48Sp6yf05ZmKff9GPjBEbdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550095; c=relaxed/simple;
	bh=/Zxj1lYSo60NzbVRm4vnmTE84WJW2vUAWuMY7POQ8v8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TB4DNzSQIZ4JjBykg8STiI2yd7aKu11JAdkOVe41dxpDFxiwWJdj5grqOsmF6SZ4+VpqXCWKrI7rICQY6/ljQUIFfUdkoWSOyFn1NzldtxvZO4LNdsKIGcMc6Rx3BlFRauaKe2ieSR9R1c7vas7Z9cdj7kjTNN1qCuZir0DSZ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RgoMNEPP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RgoMNEPP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375611F000E9;
	Wed,  8 Jul 2026 22:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783550093;
	bh=gQ0ECWCAzesek7PVXIpqGNs58P98N92r1Ddn96KCVvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RgoMNEPPnmI7E306Mi+z8WBalbETJOSj+TRQa6Poc9vQa+9kyJbaagoZmJCpilVlo
	 Htd30FEmFLm8eOxquguJWvo2d3e+sN+eT8ZHLZpTQQXWTqW0YRkCns6EIs4Lay56Oo
	 IIXYhRy28dQE353be6n5sc8lVKcQ14mCm4PYcLMUSUEX0aNJEYFCsH4cZtNnHG6KVK
	 /SYhEj5rdqfzzkzWtOypCCctwlYGNk7mimRzom+aKmi1piw4KjnpjESjlzU9Ol+Kci
	 96UYK/kT6LOSFq7Lh/BLaTkQYSWIedCZCttudZQfkrdPDyjFnoCHkMIUYISMddh8mv
	 lVUNlEOCWyCDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 02/13] net: ethernet: oa_tc6: Handle the OA
 TC6 SPI protected mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus" <ciprian.regus@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-adin1140-driver-v5-2-4aca7b51a58b@analog.com>
References: <20260708-adin1140-driver-v5-0-4aca7b51a58b@analog.com>
 <20260708-adin1140-driver-v5-2-4aca7b51a58b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:34:52 +0000
Message-Id: <20260708223453.375611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Integer truncation in `oa_tc6_check_ctrl_write_reply()` causes out=
-of-bounds read and kernel panic
--

--- Patch [2]: [PATCH net-next v5 02/13] net: ethernet: oa_tc6: Handle the =
OA TC6 SPI protected mode ---
commit f765aab54c97488541b3e9e738aa5de9bff2269a
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: Handle the OA TC6 SPI protected mode
   =20
This patch implements the OA TC6 standard defined protected mode for control
(register access) transactions. In addition to the current register access
formats the oa_tc6 driver handles, 1's complement values of the data field
are included in the SPI transfer frames as an integrity check.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 0727d53345a33..8b96558834960 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c
[ ... ]
> @@ -284,10 +321,10 @@ static int oa_tc6_perform_ctrl(struct oa_tc6 *tc6, =
u32 address, u32 value[],
>  	u16 size;
>  	int ret;
> =20
> -	/* Prepare control command and copy to SPI control buffer */
> -	oa_tc6_prepare_ctrl_spi_buf(tc6, address, value, length, reg_op);
> +	size =3D oa_tc6_calculate_ctrl_buf_size(length, tc6->prot_ctrl);
> =20
> -	size =3D oa_tc6_calculate_ctrl_buf_size(length);
> +	/* Prepare control command and copy to SPI control buffer */
> +	oa_tc6_prepare_ctrl_spi_buf(tc6, address, value, length, reg_op, size);
> =20
>  	/* Perform SPI transfer */
>  	ret =3D oa_tc6_spi_transfer(tc6, OA_TC6_CTRL_HEADER, size);

[ ... ]

> @@ -302,7 +339,7 @@ static int oa_tc6_perform_ctrl(struct oa_tc6 *tc6, u3=
2 address, u32 value[],
>  		return oa_tc6_check_ctrl_write_reply(tc6, size);
> =20
>  	/* Check echoed/received control read command reply for errors */
> -	ret =3D oa_tc6_check_ctrl_read_reply(tc6, size);
> +	ret =3D oa_tc6_check_ctrl_read_reply(tc6, length);

[Severity: High]
This is a pre-existing issue, but does oa_tc6_check_ctrl_write_reply() safe=
ly
handle the u16 size being passed to it?

The size variable is declared as a u16 in oa_tc6_perform_ctrl(), but
oa_tc6_check_ctrl_write_reply() takes size as a u8:

static int oa_tc6_check_ctrl_write_reply(struct oa_tc6 *tc6, u8 size)
{
	...
	if (memcmp(tx_buf, rx_buf, size - OA_TC6_CTRL_IGNORED_SIZE))
		return -EPROTO;
	...
}

If size is exactly 256 bytes (which can happen when writing 62 registers in
unprotected mode, or 31 in protected mode), the size parameter truncates to=
 0.

The subtraction size - OA_TC6_CTRL_IGNORED_SIZE then becomes 0 - 4 =3D -4.
When cast to size_t for memcmp(), this becomes a massive out-of-bounds read
that can cause a page fault and kernel panic.

Additionally, if the truncated size is greater than 0 but less than the act=
ual
size, memcmp() will only compare a few bytes, silently bypassing the full
integrity check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-adin1140-d=
river-v5-0-4aca7b51a58b@analog.com?part=3D2
