Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11372306B3D
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788122031; cv=none; b=TrV6e/FrIMYrDDpPWynvOwvz0ijE+l+2wwwR3qsBA2HHM59C1D5m322/YcIqgYpGvBdyc4gUdqpkLkKhJx8K/Os5XUM+5qMAz2hJHTPOzwFWAC1z5Ep5sX3EnKtdmmkSJqOFNZvZAu2yby8ZITzSRZHXB+zBJ4s6boHH/AeJ3lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788122031; c=relaxed/simple;
	bh=jxYY/cu8wOJybkjnm8Qd4a3n35lbro1HjXbTVyjBU5k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RGYaM9GDWYZtycvBTSVCDE0hTqB/uvdWNpX1BYuUf6VDbAK+ZTm4gbSR9juoThF1zDC3xZK1OFquTBeVltaAlFvTr7hr3E5yc7dMrqtEthtM8+AwjUDoPQiRPv95L0n8Bt9WGfjkNdr4jJJcKdvPZIsrX2J9wu9p3SAPkLz+OdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKEov6fU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKEov6fU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F701F000E9;
	Sun, 30 Aug 2026 20:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788122030;
	bh=FPAR38/SkTpiZVK94fLiIdaQdlUts68/FbMeJ/zZRQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UKEov6fUjrlcBimGGOK1aSuxLuKjLYHZ1ikoST3BAA35Nlk8LR0YwLdobt4PYrzfy
	 m6FB9nGI4JBlTg4nbUflmCNDSTe388t6d+z01qneXchtc74TZo6uKBlhdUip5nkJux
	 Cl3y+bh7h//OaJYZzP6fx02E19Ya29d4NZWoQZ8UMj6vn7eDc/6+VcX0dG7U+ha1yp
	 MUh+5nnurhR9/9+CzCCELZQ0ANsXn7/MZiag2Q9unE2ltUCE/pxtm48pT8lcAAf9D2
	 kr6xYlPv1U596HwFBR4n8iJKrJi0ZjdKCiKNUXeTob5qgcGtk952CtFWShzK3MsrQo
	 tNuNdlX+zwnMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/19] thunderbolt: Try reading host DROM from device
 tree first
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-6-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-6-44bc9348683c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 20:33:49 +0000
Message-Id: <20260830203349.B1F701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Integer underflow in `tb_drom_parse_entry_generic` allows an a=
ttacker-controlled Device Tree or DROM to trigger an unbounded kernel memor=
y read.
- [High] Inadequate buffer allocation size in DROM copy paths allows out-of=
-bounds reads during header parsing, leading to a heap information leak.
--

commit 579084ce1fd77c747852aa3d8eca1094e3c9a9c1
Author: Sven Peter <sven@kernel.org>

thunderbolt: Try reading host DROM from device tree first

On Apple Silicon SoCs the DROM is provided by a device tree property.
This commit updates the subsystem to try reading from that property first
before falling back to other methods.

> diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
> index 2a13fa6888ba1..389de7df84f65 100644
> --- a/drivers/thunderbolt/eeprom.c
> +++ b/drivers/thunderbolt/eeprom.c
[ ... ]
> @@ -500,6 +499,22 @@ static int tb_drom_copy_efi(struct tb_switch *sw, u1=
6 *size)
>  	return -EINVAL;
>  }
> =20
> +/*
> + * tb_drom_copy_of_apple - copy drom supplied by the device tree for App=
le Silicon to sw->drom.
> + */
> +static int tb_drom_copy_of_apple(struct tb_switch *sw, u16 *size)
> +{
> +	return tb_drom_copy_property(sw, "apple,thunderbolt-drom", size);
> +}

[Severity: Critical]
This is a pre-existing issue, but does this logic leave us vulnerable to an
unbounded kernel memory read if an attacker-controlled Device Tree or malic=
ious
Thunderbolt device provides a crafted DROM?

In drivers/thunderbolt/eeprom.c:tb_drom_parse_entries(), the validation
incorrectly permits an entry with length 1 to bypass the length checks:

	if (pos + 1 =3D=3D drom_size || pos + entry->len > drom_size
			|| !entry->len) {
		tb_sw_warn(sw, "DROM buffer overrun\n");

If entry->len is 1, pos + 1 > drom_size evaluates to false, proceeding to
parsing. In tb_drom_parse_entry_generic(), this causes an integer underflow:

	case 1:
		/* Length includes 2 bytes header so remove it before copy */
		sw->vendor_name =3D kstrndup(entry->data,
			header->len - sizeof(*header), GFP_KERNEL);

Since sizeof(*header) is 2, header->len - sizeof(*header) evaluates to
1 - 2 =3D -1, which is promoted to SIZE_MAX in kstrndup().

Could this cause an immediate kernel panic when strnlen() hits an unmapped
page?

> +
> +/*
> + * tb_drom_copy_efi - copy drom supplied by EFI to sw->drom if present
> + */
> +static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
> +{
> +	return tb_drom_copy_property(sw, "ThunderboltDROM", size);
> +}
> +
>  static int tb_drom_copy_nvm(struct tb_switch *sw, u16 *size)

[Severity: High]
This isn't a bug introduced by this patch, but does the DROM copy path allo=
cate
an undersized buffer that could lead to a heap information leak?

When reading DROM, drivers/thunderbolt/eeprom.c:tb_drom_copy_nvm() (and
similarly usb4_copy_drom()) calculates the size based on a potentially small
DROM data length:

	/* Size includes CRC8 + UID + CRC32 */
	*size +=3D 1 + 8 + 4;
	ret =3D tb_switch_drom_alloc(sw, *size);

If the data_len is between 0 and 8 (for example, 3), it allocates an unders=
ized
buffer of 16 bytes, which is smaller than sizeof(struct tb_drom_header), wh=
ich
is 22 bytes.

Later, tb_drom_parse() performs an out-of-bounds read on the undersized buf=
fer
at byte 13:

	tb_sw_dbg(sw, "DROM version: %d\n", header->device_rom_revision);

Additionally, tb_drom_parse_v1() performs out-of-bounds reads at byte offse=
ts
16-19:

	sw->vendor =3D header->vendor_id;

Could this reliably leak 4 bytes of adjacent heap memory from kmalloc-16 to
userspace via sysfs when sw->vendor and sw->device are exposed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830-b4-apple-s=
oc-tbt-v1-0-44bc9348683c@kernel.org?part=3D6
