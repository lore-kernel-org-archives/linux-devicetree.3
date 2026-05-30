Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E6F231832
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102158; cv=none; b=I3QRNkYp+wxY3zka8It7oM5xMHzWZ3Bg4MvlEoYnWK7N3CGeDM5sD5dKOijesnLb4xRWraUTGQ3DHsoGLaTuDUrGe/+eWMZODFirTJSV0TzzN7KJ+QIOi6MrLPH1I990guKSyxXsxQ+3S0toVRfOjpo1CEs3oSujv8LN3bXd/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102158; c=relaxed/simple;
	bh=v66nW3HS48cIE4ixI68+nvEeLICnGE33sd8u3SDQE2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B2Mx+NkBCrBt6CHciN2QHbtvKx1E/7h1Bu9JbiGY5UQneva7i/1LjoXAX9UfpoBDQfokO3Y+rdiKC0ckjqj8Sj3dJKi2cOjbc2/oL3YIS2qv4nVs3c5FasyekzrRzXhSLQC8sewW/wT0LM2VcdylCQ5lzMJKHZn8MvQOCqTarS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrRGCBR8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrRGCBR8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC361F00893;
	Sat, 30 May 2026 00:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102156;
	bh=W/MGUPoYxj5b8XWdpJwTD4/YFsnr7w0tunBPm45cMjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JrRGCBR839e7oXceWDSI1qoy+BgWOrp/Qk+v+ZlMIBx1UX2bAUCvrnDEg2WvbLjFo
	 I5UTE0EcbFpiWhLKMIvGS1iWk3S+JlmTNUgLUZO8LH1Yq3oWwvpp923q6l8iG2/PMs
	 byjPhrkBZfoX+X3gyuYtb6ktPLwhNajuiOvd30N9X5M3v9fClkgVa00Ha9uTPsu2l2
	 LASMcEQbl5rQNAK/2Nxs98fhj2g1wKGa62PlWz2Jkl40tf17DW++mgTSXyyjaJAOp0
	 VlSZwMftjr9LIciDw+1VDtW0DIDY3DBI5lEj8NTgtcYrjMncVWDkdDh12xI4328Psj
	 2d/z90QKk/s9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 02/10] net: ethernet: oa_tc6: Handle the OA
 TC6 SPI protected mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527-adin1140-driver-v2-2-37e5c8d4e0a0@analog.com>
References: <20260527-adin1140-driver-v2-2-37e5c8d4e0a0@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:49:16 +0000
Message-Id: <20260530004916.7BC361F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `size` parameter in `oa_tc6_check_ctrl_write_reply` is typed a=
s `u8`, causing silent truncation of the calculated SPI buffer size (which =
can exceed 1000 bytes). This can result in a massive out-of-bounds memory r=
ead in `memcmp` (leading to a kernel panic) or silently bypass the echoed d=
ata integrity check.
- [High] In `lan865x_remove`, `cancel_work_sync()` is incorrectly called be=
fore `unregister_netdev()`, allowing concurrent network operations to re-ar=
m the work and cause a use-after-free.
--

commit c0da5b95b1c819bcfca6fdf140a28225ebed8980
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: Handle the OA TC6 SPI protected mode

This commit implements the OA TC6 standard defined protected mode for contr=
ol
(register access) transactions. It adds 1's complement values of the data
field to the SPI transfer frames for both the host and the MACPHY to act as
an integrity check. The protected mode state is read from the CONFIG0 regis=
ter
during MACPHY's reset.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 91a906a7918a2..baba5aad84dfa 100644
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
> =20
> -	size =3D oa_tc6_calculate_ctrl_buf_size(length);
> +	/* Prepare control command and copy to SPI control buffer */
> +	oa_tc6_prepare_ctrl_spi_buf(tc6, address, value, length, reg_op, size);
> =20
>  	/* Perform SPI transfer */
>  	ret =3D oa_tc6_spi_transfer(tc6, OA_TC6_CTRL_HEADER, size);
> @@ -301,7 +338,7 @@ static int oa_tc6_perform_ctrl(struct oa_tc6 *tc6, u3=
2 address, u32 value[],
>  		return oa_tc6_check_ctrl_write_reply(tc6, size);

[Severity: High]
This isn't a bug introduced by this patch, but does this size parameter get
silently truncated?

The function oa_tc6_calculate_ctrl_buf_size() correctly computes the SPI
buffer size as a u16 (which can be up to 1032 bytes in protected mode).
However, oa_tc6_check_ctrl_write_reply() is defined as taking a u8 for
size:

static int oa_tc6_check_ctrl_write_reply(struct oa_tc6 *tc6, u8 size)
{
    ...
    if (memcmp(tx_buf, rx_buf, size - OA_TC6_CTRL_IGNORED_SIZE))
        return -EPROTO;
    ...
}

If the truncated size is less than 4 (for instance exactly 256, which
happens for a 31-register write in protected mode), could the expression
size - OA_TC6_CTRL_IGNORED_SIZE underflow to a negative integer?

Since memcmp expects a size_t, this would be promoted to an enormous
unsigned integer, leading to an immediate out-of-bounds read and a
kernel panic. If it truncates to a value >=3D 4 but smaller than the true
size, could it silently defeat the integrity check by only comparing a
small fraction of the buffer?

While this is a pre-existing issue, the introduction of protected mode
doubles the payload size, making a 256-byte overflow much easier to hit.


[Severity: High]
This is a pre-existing issue, but could the teardown sequence lead to a
use-after-free?

Looking at the driver teardown patterns, cancel_work_sync() is being
called before unregister_netdev(). For example, in lan865x_remove():

static void lan865x_remove(struct spi_device *spi)
{
    ...
    cancel_work_sync(&priv->multicast_work);
    unregister_netdev(priv->netdev);
    ...
}

Because the netdev is still active and registered when cancel_work_sync()
is called, could a concurrent userspace operation (such as modifying the
multicast list) invoke the ndo_set_rx_mode callback and re-schedule the
workqueue?

When unregister_netdev() subsequently proceeds and free_netdev() frees
the priv pointer, when the re-armed work eventually executes, won't it
access the freed priv and crash? Should unregister_netdev() be executed
before cancel_work_sync()?

Note that the newly introduced adin1140_remove() driver in this patch
series appears to copy this exact same flawed pattern with
cancel_work_sync(&priv->rx_mode_work), potentially introducing a new
use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-adin1140-d=
river-v2-0-37e5c8d4e0a0@analog.com?part=3D2
