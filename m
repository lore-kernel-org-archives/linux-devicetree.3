Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A4C3D3CEA
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215910; cv=none; b=Lf27+/CZJG64dlRQjJSQnnCpaZwPyhuWv6gSgBn2ZujY+1+j14OKjXmiax1R0L8V6x6q5Gp6sKOfB8/5UIuVEyJhfgBxvWZ1KdowgwHzaA7jsKvDSPQRP3bmYA1oXP6vR+xfQo81BjgTSYnWqY2Ju4Ady/+QvIcP2AgNtWDxrso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215910; c=relaxed/simple;
	bh=5CcXXn6+BwFfAvP4rbr/OYsjn6L0cau2QAjPj8pX+hY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aza5FZEJ0ZbI8xCQBw/cTwavMlfQID1FLOyyKM6B4vyRASE+lj1OYTkFzWKrmFnEYlr4DFFv95U5cjX3FdtnoIOrPfVrmN6oTVJCYUAP1dGEw7ty9GG3grFgzsOm/adYFXqeQr5bHiI43LQ5maiff0UASTRE7vVd3vv7WEgEJVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkGjd3Xn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkGjd3Xn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F4E1F000E9;
	Tue, 23 Jun 2026 11:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782215909;
	bh=+OrHBx5KmtZSwiMkXWh3TDGe3EjunhKof10Lh3YKLCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LkGjd3XnRr1UvRZzg0m1gkIksYIait3mhRVVFKFAk1ASSkKiCJo2bxMYk22OQFt61
	 58WgpVYfsyDjm7LSin8ijHiHe+Oz8bt9lGKvNkX3+1kPOx4QQLpip4nRair+sHzhMa
	 SHvd7quKXxGbY216Cub45GnVCM2zZATjVfWEYekPDxMO8GY8xGAkSXKtds8InzDjXs
	 aEYzJMLPKCQxZuYSI/ML5b//m0jOL3dKQiOjt8lCtBulOmSAjFjBmz8/y7jBwJ3ggC
	 FKvc+s1kwqtO3ivvX/wK3EnTgeJstLB9nF0QzReTeefGC+zgNXhC8RXtu4d2WW7hJK
	 R0Lh30QJ1o2PQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/12] nvmem: microchip-otpc: add tag-based packet
 lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260623105944.128840-6-varshini.rajendran@microchip.com>
References: <20260623105944.128840-1-varshini.rajendran@microchip.com>
 <20260623105944.128840-6-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 11:58:27 +0000
Message-Id: <20260623115828.23F4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing serialization in hardware register accesses during NVMEM r=
ead leads to data corruption on concurrent access.
--

commit 9261dabb0a9ba8aa6fc617051559e1385e26b1cc
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

nvmem: microchip-otpc: add tag-based packet lookup

Add support for accessing OTP packets by their 4-byte ASCII tag while
preserving backward compatibility with the existing ID-based lookup. The
driver resolves offsets matching valid legacy selectors through ID
lookup, falling back to tag lookup for other values.

> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otp=
c.c
> index df979e8549fdb..cbb4822a97c04 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c

[ ... ]

> @@ -154,12 +232,11 @@ static int mchp_otpc_read(void *priv, unsigned int =
off, void *val,
>  	int ret, payload_size;
> =20
>  	/*
> -	 * We reach this point with off being multiple of stride =3D 4 to
> -	 * be able to cross the subsystem. Inside the driver we use continuous
> -	 * unsigned integer numbers for packet id, thus divide off by 4
> -	 * before passing it to mchp_otpc_id_to_packet().
> +	 * From this point the offset has to be translated into the actual
> +	 * packet. For this we traverse the table of contents stored in a list
> +	 * "packet" based on the access type - packet id or tag.
>  	 */
> -	packet =3D mchp_otpc_id_to_packet(otpc, off / 4);
> +	packet =3D mchp_otpc_resolve_packet(otpc, off);

[Severity: High]
This is a pre-existing issue, but does mchp_otpc_read() need serialization =
to
prevent concurrent hardware register accesses?

Since the NVMEM core does not serialize reg_read callbacks, multiple threads
reading the NVMEM device simultaneously could interleave hardware register
manipulations.

If mchp_otpc_read() loops over mchp_otpc_prepare_read() concurrently:

Thread A:
    writel_relaxed(tmp, otpc->base + MCHP_OTPC_MR); // Sets address

Thread B:
    writel_relaxed(tmp, otpc->base + MCHP_OTPC_MR); // Overwrites address

Could Thread B overwrite the address Thread A just wrote before Thread A
sets MCHP_OTPC_CR_READ? Both threads would then poll the same status regist=
er
and consume from the same data registers, which could lead to corrupted
payloads or invalid hardware state.

>  	if (!packet)
>  		return -EINVAL;
>  	offset =3D packet->offset;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623105944.1288=
40-1-varshini.rajendran@microchip.com?part=3D5
