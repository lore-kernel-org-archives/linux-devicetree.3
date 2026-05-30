Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAE7257851
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102158; cv=none; b=GcCHUDrObnnKlBE3LIV1xgOWwqYtwLVwP7+9pAE26rrqeISG7OZcupQF9YKqlp1AIfvqT2z6liYdDWEgjSzXDucviQNUhdp4ZGbqGAdapAVAui1OLjTJ2GD/kXF7zXfonfqurwKWHGjz9ZlO0pY57mHDG7BvFSJV6RNyP25UwYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102158; c=relaxed/simple;
	bh=lCeRbD8eCvBjLCF18XkwhcITe0znH6WkE6sFIGiCKtc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l9oKyxef+92dxks8qja3Fplk6agzdQzeX3uoyy/PRoFTpL/NZc7djzf6tne706dIBDfp8bTEDBNJfW9zju021zHvGMY6+uvWW6SbPHICOiizwxxgEwDhOYMbIHCJ6TiMrgfYzjOJbMsy/pv6Oa5pWobz2hxExrD9z/cUwoj646o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hShMWbgk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hShMWbgk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B10F1F00898;
	Sat, 30 May 2026 00:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102157;
	bh=/bfkc/TBJoa44M4EXtJIfyaiv5LRhMuCSqysd3QwGlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hShMWbgkrHuhsJdeklHUbwZpf4UvgT4ncwWdwEk8j+ahWqPqhIVqnu/jWF2NvcpaN
	 IzNB7n7Lh2ZRXKheDaSqocUXkJFprZmuLdHK/44Y2qafhw6rRvrI6CUsyoFkVY7Z5i
	 6U9UtQ6XuVkfZMIwFo1IixyGYh4RIXbEKfTQl+rmU4tQ6358/+kP/CE04tdw/D8XsD
	 XNcm9RrjwJnfOzCkL3+26SlEjvmNjiuc6YpsO/NFREkA4rU22uIBGwcMnMyYF377BZ
	 KV6MiTlGm9fyzIfin9bpSdUc5Tww6n3k8ra2wsru5S7Pv2A3caeQ9g67flHAT0oVXU
	 50lb26AMisafQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 04/10] net: ethernet: oa_tc6: Export the C45
 access functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260527-adin1140-driver-v2-4-37e5c8d4e0a0@analog.com>
References: <20260527-adin1140-driver-v2-4-37e5c8d4e0a0@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:49:16 +0000
Message-Id: <20260530004917.5B10F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Missing forward declaration for `struct mii_bus` in `include/linux/=
oa_tc6.h`.

Pre-existing issues:
- [High] `oa_tc6_mdiobus_read` silently masks negative error codes into `1`=
 due to using a `bool` type for the return code variable.
--

commit 4bde583a95e265a961f05530eea079dbd8883081
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: Export the C45 access functions

The C45 access functions can still be used by some Ethernet drivers
which set the OA_TC6_BROKEN_PHY flag. Export them.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 7ae3639beaddd..4a1fd9fd75abe 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c
> @@ -499,8 +499,8 @@ static int oa_tc6_get_phy_c45_mms(int devnum)
>  	}
>  }
> =20
> -static int oa_tc6_mdiobus_read_c45(struct mii_bus *bus, int addr, int de=
vnum,
> -				   int regnum)
> +int oa_tc6_mdiobus_read_c45(struct mii_bus *bus, int addr, int devnum,
> +			    int regnum)

[Severity: High]
This is a pre-existing issue, but looking closely at the related
oa_tc6_mdiobus_read() function in this file, it declares the return value
variable as a bool:

static int oa_tc6_mdiobus_read(struct mii_bus *bus, int addr, int regnum)
{
	...
	bool ret;

	ret =3D oa_tc6_read_register(...);
	if (ret)
		return ret;

Could this cause negative error codes like -EPROTO to be silently masked in=
to
1, which the MDIO subsystem might treat as a successful read of 0x0001?

Should the type of ret be changed to int here?

[ ... ]

> diff --git a/include/linux/oa_tc6.h b/include/linux/oa_tc6.h
> index 6c38bf49e2a7e..95e041d7d77b6 100644
> --- a/include/linux/oa_tc6.h
> +++ b/include/linux/oa_tc6.h
> @@ -32,3 +32,7 @@ int oa_tc6_read_registers(struct oa_tc6 *tc6, u32 addre=
ss, u32 value[],
>  			  u8 length);
>  netdev_tx_t oa_tc6_start_xmit(struct oa_tc6 *tc6, struct sk_buff *skb);
>  int oa_tc6_zero_align_receive_frame_enable(struct oa_tc6 *tc6);
> +int oa_tc6_mdiobus_read_c45(struct mii_bus *bus, int addr, int devnum,
> +			    int regnum);

[Severity: Low]
Does this header file need a forward declaration for struct mii_bus?

If another file includes linux/oa_tc6.h without first including mdio.h or
phy.h, this might cause compiler warnings or errors since struct mii_bus
has not been declared yet.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-adin1140-d=
river-v2-0-37e5c8d4e0a0@analog.com?part=3D4
