Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B091F4611
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 02:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786155864; cv=none; b=H6bP7QnyCRpBsONJnNjnBgWKLqgw9/WMxUqlognqpbaaTlYxzVWcPa8ncYlZn2AJqwGVeP4EBJzf8YMtIQW4dhT5MFOjpkDKKfjtgphqFFtmOXj78V9iCB1ygb6Fng8GPG58rECH2xAyYZxnL+nmi1+oI6KPANGLpQHM24tgolE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786155864; c=relaxed/simple;
	bh=cmw8q86aN3502a+ZmWeB+j5eEhZo93qllRPcehDRI38=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IW9fZEcLt+gW3LImbXnKqJ5dKVppilU2u7T9TOZQsGOFhzCmWQkWpvWnwOhvFnqXIP05WYYvpHJBju2IlI+1jTrQ6g/Xca2GaRI7RsT3LJ8+05yZmCcwWUkjvSZ62AkibmnIxSiqIKTGzUlnCJFpd+Envnzk4nXRKmZnCuhGgpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIymSU/5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIymSU/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8471F000E9;
	Sat,  8 Aug 2026 02:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786155863;
	bh=XFtRS05FcXBEC94RpAu5iCeFfmq5bYLSUc+TKJ0VlYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MIymSU/52g7osxd8rEkx1Li+CrV3ASfQMgQ3hCbyNAFqiI+XrMJJPOn/ekVWdFHBA
	 v1qt+Tlxy1/PptjcpMRTudBLyw12T9BppCgc8L2HA8NxOT3Xp2SxBmpR93VlM1J1fE
	 dUlotlSWPHs0eMoPaTMTjX7VdnGyNNdI+n2Yavy8oRIOVDOd8/y0V/raaC6LeFsqxm
	 YEm+XeFdIQsFILrAth9UY22d+jeCMFthIGtjapfT+1+SB3scf5t+p3vpCNtkFLO6vU
	 WXfhljvGhuIJYnkSVufH1r9yTcTySm9u3mb/j60UJJC2q5B45kjtVgKzaFuNd9pkrw
	 75RwxXgM3DwEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] nfc: s3fwrn5: use the "s3fwrn5_i2c" string
 literal directly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807021001.239389-3-jorijnvdgraaf@catcrafts.net>
References: <20260807021001.239389-1-jorijnvdgraaf@catcrafts.net>
 <20260807021001.239389-3-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 02:24:22 +0000
Message-Id: <20260808022423.2F8471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing endianness conversions when parsing firmware headers and o=
ffsets, leading to failures on Big Endian architectures.
--

--- Patch [2]: [PATCH v4 2/6] nfc: s3fwrn5: use the "s3fwrn5_i2c" string li=
teral directly ---
commit 9d4d91e92081c012d8837ad241bfc3be79ee322a
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

nfc: s3fwrn5: use the "s3fwrn5_i2c" string literal directly

This commit replaces the S3FWRN5_I2C_DRIVER_NAME define with the string
literal "s3fwrn5_i2c" directly in the driver. The define was an indirection
for a fixed ABI name and was only used locally within this file.

> diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> index cb73993446e09..c528c085b43ef 100644
> --- a/drivers/nfc/s3fwrn5/i2c.c
> +++ b/drivers/nfc/s3fwrn5/i2c.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but can this code cause failures on Big Endian
architectures due to missing endianness conversions?

In s3fwrn5_i2c_read(), the 16-bit length field is read directly in native
byte order:

drivers/nfc/s3fwrn5/i2c.c:s3fwrn5_i2c_read() {
    ...
    data_len =3D (phy->common.mode =3D=3D S3FWRN5_MODE_NCI) ?
            ((struct nci_ctrl_hdr *)hdr)->plen :
            ((struct s3fwrn5_fw_header *)hdr)->len;
    ...
}

Could this improperly byte-swap on Big Endian systems, leading to oversized
allocations in alloc_skb() and invalid I2C reads?

Additionally, in s3fwrn5_fw_request_firmware(), 32-bit offsets are copied
directly from the little-endian firmware payload into native u32 variables
without using le32_to_cpu():

drivers/nfc/s3fwrn5/firmware.c:s3fwrn5_fw_request_firmware() {
    ...
    memcpy(&sig_off, fw->fw->data + 0x14, 4);
    fw->sig =3D fw->fw->data + sig_off;
    ...
}

Since sig_off is byte-swapped to a massive value on Big Endian systems, does
this result in an out-of-bounds pointer calculation?

When s3fwrn5_fw_enter_update_mode() later calls s3fwrn5_fw_prep_msg(), could
copying from this fw->sig pointer trigger an unmapped memory read and
kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807021001.2393=
89-1-jorijnvdgraaf@catcrafts.net?part=3D2
