Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6518411F88
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786572904; cv=none; b=PaeM+75PNlM9Pi53tSA3yEa3YXaFqh01vdqpRm0Pj0H+QblO3+ty7C5es9QtY2eXo0SQn5R8GSuZhEWhxCI/uL9M3r6x/zZrfxWrlZ4SFlmjfk/ZRtoVN4mMjZSUFtKR3TK/VSHEl8TsN0JSHN3LZzl1A8yS0NDOyWeRI9tUSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786572904; c=relaxed/simple;
	bh=mkOUZQIiv5m2PPc4SpTo8b8PYIAxEkmFwh9ZytxPBtA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NbNFpBSe9XN5Ac/UlIYl6yuZDU89jrCuvOsSFCCrkufOo3EoVLxvnLCxhvF4MlsvAVQfUg+iu2Jp5IKZl1t8CljUfwc0PrI8PaPmVKLwF//c4Qs7XSsGTIk6LIc0Ywh1SnWGs/jESgIXaXJHgz3imNMyKj1sdibmp8FFxb6C4IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6W72Lrh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6W72Lrh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE291F000E9;
	Wed, 12 Aug 2026 22:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786572902;
	bh=geJG+8Pa12U4TCaWMIBgX/dJEUjhsFHIEf3UVirUea4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H6W72Lrhy/Im111yUUEbIWyECjR5e4mzcehK4yh40gjDL2rnCQFNgBL8e3AO788nj
	 orXdPnSoUF7nhEkLpQDW41NmpElg7pbPyZ3kG0aIoOPU/K92fsAESXqkMXZU5eUMEr
	 U8mFfHDQmiaLWlthzQANCQJMVCWYzWxvjUTOLDtueZODbvgc2yo2mgSzlEo25xLig7
	 jy+y2hwZI2tUSLgRH1eqQU3oQQ9ygrnFpBKVNsMiBeNRoVpVvPa6Uc2i5gxKjQdMYz
	 AJ6ugx3/SgFsoyfid1Yl5jgueHfnAiGEr1g5/BKYBF2GnXkzOznX5dqfKnz/E8ps/3
	 5tqRfUYlnqoSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] nfc: s3fwrn5: drop of_match_ptr() from the I2C
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260811220135.472380-2-jorijnvdgraaf@catcrafts.net>
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net>
 <20260811220135.472380-2-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 22:15:01 +0000
Message-Id: <20260812221501.EEE291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Preexisting endianness bug in S3FWRN5 firmware packet length parsi=
ng and construction, leading to wrong length values on big-endian architect=
ures.
--

--- Patch [1]: [PATCH v5 1/6] nfc: s3fwrn5: drop of_match_ptr() from the I2=
C driver ---
commit 5cffdb84b592ca672d62f53d2f736890c7d61164
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

nfc: s3fwrn5: drop of_match_ptr() from the I2C driver

This commit drops of_match_ptr() from the I2C driver to ensure the same
code is used across all configurations. The OF match table now relies on
MODULE_DEVICE_TABLE() to count as used.

> diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> index 4ba7626117118..cb73993446e09 100644
> --- a/drivers/nfc/s3fwrn5/i2c.c
> +++ b/drivers/nfc/s3fwrn5/i2c.c

[ ... ]

> @@ -219,7 +219,7 @@ MODULE_DEVICE_TABLE(of, of_s3fwrn5_i2c_match);
>  static struct i2c_driver s3fwrn5_i2c_driver =3D {
>  	.driver =3D {
>  		.name =3D S3FWRN5_I2C_DRIVER_NAME,
> -		.of_match_table =3D of_match_ptr(of_s3fwrn5_i2c_match),
> +		.of_match_table =3D of_s3fwrn5_i2c_match,
>  	},
>  	.probe =3D s3fwrn5_i2c_probe,
>  	.remove =3D s3fwrn5_i2c_remove,

[Severity: High]
This is a pre-existing issue, but does s3fwrn5_i2c_read() parse the firmware
header length correctly on big-endian systems?

Earlier in drivers/nfc/s3fwrn5/i2c.c:s3fwrn5_i2c_read():

	data_len =3D (phy->common.mode =3D=3D S3FWRN5_MODE_NCI) ?
		((struct nci_ctrl_hdr *)hdr)->plen :
		((struct s3fwrn5_fw_header *)hdr)->len;

Because struct s3fwrn5_fw_header defines len as a __u16, reading it directly
from the packet without endianness conversion like le16_to_cpu() swaps the
bytes on big-endian architectures.=20

Can this lead to allocating an incorrectly sized skb and breaking firmware
communication on these systems?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811220135.4723=
80-1-jorijnvdgraaf@catcrafts.net?part=3D1
