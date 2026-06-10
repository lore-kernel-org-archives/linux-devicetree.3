Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9998333122D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105302; cv=none; b=IJ1Y9nUEaTo8TRpn2giCN9qafAVzm+71uEuzo9SzVF/TtDLfJDRRkkjjRQCiyKJnuFb8aVTHCfdo0XqtBDcH2V26Wu5cRtK27aPEgYc7lrSiFV3XWn3byL40BrZlJLqkW2KLcPW2hx6JGKiDWv6hV/6jcxP187IiFYWzjnOk2xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105302; c=relaxed/simple;
	bh=zU9vfe4imQLgEgVO03w6FCJJFOD/APUNqTwfWnSZGuM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WT9gX7qZ0MGmj/aGpPJGTAR/hr5ry4O9GpxkY5zgrJ9PZ7dyVEOE5vIBh0WvVO0VuConAB/ySfd26Q0teMvVgr5Eiy/4feYsxyv3pdsGuLDw1C8fd3P39EBd8OWrfmoRQ1ypzqBtdJLl+JqA9D7VdZy8OTXwYGl1bZCR7gEM/3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlkMdCwv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlkMdCwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D7C1F0089A;
	Wed, 10 Jun 2026 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105301;
	bh=mpOYfCGmcAhi9Fcc07wQ9DXhJsHAepxzIPglrgs8C7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UlkMdCwvzf2nvJkaJ4OgesgN3XluBNsK9ExiaGQhhOrfwobDNQf2EhQZKJLQw2AWx
	 t4md7fM/jGo0CfvAg5Aw81nWbzvqcxsY7sdsGYKpzl8fWfth3egVLiu8Oz7kVyQMd6
	 Qw3ug92H12stdoHJCxUORN6WkgF8P4Os6GyHpBfC+aAvHqTZAIIrP5AmqNZ/x4TQKq
	 AcgWzR4XQHLJR/BRVAtwBtKbwK9Onb0X+74QNj2RKCJox3r5dFmGnQ7i8aj+ctMoHo
	 W9GTsPYZRvuPJ/Kcs0bhud+12Xhoci50jXcGFY/lxrSFsQiRufPCv1Wcx29n7eZVHP
	 1+IiQXB2Mj1lA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 02/13] net: ethernet: oa_tc6: Handle the OA
 TC6 SPI protected mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-adin1140-driver-v4-2-0753e28ee004@analog.com>
References: <20260609-adin1140-driver-v4-2-0753e28ee004@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 15:28:20 +0000
Message-Id: <20260610152821.16D7C1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `size` parameter in `oa_tc6_check_ctrl_write_reply` is typed a=
s `u8`, but it receives a calculated `u16` SPI transaction size from `oa_tc=
6_perform_ctrl`. This size can be up to 1032 bytes in protected mode or 520=
 bytes in unprotected mode. The truncation to `u8` causes integer underflow=
 in the `memcmp` length calculation `size - OA_TC6_CTRL_IGNORED_SIZE` (wher=
e ignored size is 4). For example, a size of 256 (which occurs when writing=
 exactly 31 registers in protected mode or 62 in unprotected mode) is trunc=
ated to 0, causing `0 - 4 =3D -4`. This negative value is cast to a massive=
 `size_t` value, resulting in a severe out-of-bounds memory read.
--

commit f635b76e9df199f1fc90b685521cd415a107c2a3
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: Handle the OA TC6 SPI protected mode

This commit implements the OA TC6 standard protected mode for control
transactions. It adds support for including 1's complement values of the
data field in SPI transfer frames, which acts as an integrity check.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c
[ ... ]
> @@ -283,10 +320,10 @@ static int oa_tc6_perform_ctrl(struct oa_tc6 *tc6, =
u32 address, u32 value[],
>  	u16 size;
>  	int ret;
> =20
> -	/* Prepare control command and copy to SPI control buffer */
> -	oa_tc6_prepare_ctrl_spi_buf(tc6, address, value, length, reg_op);
> +	size =3D oa_tc6_calculate_ctrl_buf_size(length, tc6->prot_ctrl);
[ ... ]
>  	/* Check echoed/received control write command reply for errors */
>  	if (reg_op =3D=3D OA_TC6_CTRL_REG_WRITE)
>  		return oa_tc6_check_ctrl_write_reply(tc6, size);

[Severity: High]
This isn't a bug introduced by this patch, but could this lead to an out of
bounds memory access when the size gets truncated?

Looking at oa_tc6_check_ctrl_write_reply(), the size parameter is typed
as u8:

static int oa_tc6_check_ctrl_write_reply(struct oa_tc6 *tc6, u8 size)
{
	...
	if (memcmp(tx_buf, rx_buf, size - OA_TC6_CTRL_IGNORED_SIZE))
	...
}

Since oa_tc6_perform_ctrl() calculates a u16 size (which can be up to 1032
bytes in protected mode or 520 bytes in unprotected mode), passing it to a
function expecting a u8 will truncate the value.

If the truncated size is less than OA_TC6_CTRL_IGNORED_SIZE (which is 4),
for example if the original size is exactly 256, wouldn't the subtraction
underflow?

This would pass a massive size_t value to memcmp() and cause an out of
bounds read on the spi_ctrl_tx_buf and spi_ctrl_rx_buf buffers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-adin1140-d=
river-v4-0-0753e28ee004@analog.com?part=3D2
