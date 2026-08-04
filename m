Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC74582D4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861537; cv=none; b=c+zQMnUI7x9nUN2EajxxeMr27aQvC96jRVuCUYZ582NcAMROVONlk2/HhnzZWCcHECZCR87tazwW+gGBMfUtYtQ3tispPlX2xGqp63hMPdhSYlyWFfaCmRiY9xivIOtH74J3MybB6zrtHwt3VYbMbdHGYSWP20bLpP3mRASGfHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861537; c=relaxed/simple;
	bh=zYGCF/YCZFLB0WuJWxrAPLPtkgFCsxKv6dHM7XMT67s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ENje0ue4Igu0jqZsJOskHRvtnGXygAicQZV6VkNaTVwkSQEDVvZxwIkiTS7duHGUv45hB/YqJ+jLIt88DDlr9GmoHGsx7zznNyWsd/FY0Rir/5RJM4Ve3Z9FQWsyVq7nlmg7uDjZqEKpMYk0pAkEeSqRO0Dr4NrnCZf3SMxUGzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XV66/mUH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XV66/mUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA46B1F00ADF;
	Tue,  4 Aug 2026 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861498;
	bh=at/VviD5y85KPSz3WjC4PGRXCERrRswQCSRzf//95vM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XV66/mUHDDdVNqpVMd4rMzuSp/A6ApctqrqQKpnnaz8ei6bwxCTHeoUpVR8CIOsmQ
	 CrKVFje/nLRa4zx/tXp+0eZI5aTKbanv32OFxN0zc9y7SLtK7BCmbmLY62kaNK6Fgz
	 Vy+8R5IcoI+lJCcaj+5H5yEFboSgaXx1NrWTp3JrWEe+OBl3ONYgRQhEcabuBE2Q9d
	 vZTi3QB2fg8J8qtt13oJjtfJRnAUGxr/jxLd6ecRx0RB29QhgOWeY2e6CLBEsFHIR7
	 cMBt30cZA0TtUgaSBhxHcNx7LW/k+JHBmCeSZ8to4asoBzKmOIRyQrProaJvcqXqO5
	 JWboJ13cPz8hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 30/36] pinctrl: airoha: an7583: add support for olt
 pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804160419.3592327-31-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-31-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:38:16 +0000
Message-Id: <20260804163817.CA46B1F00ADF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware Pin Multiplexing Conflict due to missing mutual exclusi=
on in register masks between `olt` and `pon_alt`.
--

--- Patch [30]: [PATCH v9 30/36] pinctrl: airoha: an7583: add support for o=
lt pinmux ---
commit 83ceff2ddef41f5f471bb95f51c02740f7fc8a11
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: add support for olt pinmux

This commit adds support for the olt pin function for the olt pin group in
the airoha an7583 pinctrl driver.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
> @@ -393,6 +394,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] =3D {
> =20
>  static const int pon_pins[] =3D { 15, 16, 17, 18, 19, 20 };
>  static const int pon_alt_pins[] =3D { 36, 37, 38, 39, 40 };
> +static const int olt_pins[] =3D { 36, 37, 38, 39, 40 };

[ ... ]

> @@ -651,6 +655,19 @@ static const struct airoha_pinctrl_func_group pon_fu=
nc_group[] =3D {
>  	},
>  };
> =20
> +static const struct airoha_pinctrl_func_group olt_func_group[] =3D {
> +	{
> +		.name =3D "olt",
> +		.regmap[0] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_GPIO_PON_MODE,
> +			GPIO_OLT_MODE_MASK,
> +			GPIO_OLT_MODE_MASK
> +		},

[Severity: Medium]
Does this mask configuration safely handle mutually exclusive routing?

Since olt_pins and pon_alt_pins share the exact same physical pins,
should the bitmask for olt_func_group also include GPIO_PON_ALT_MODE_MASK
to ensure the pon_alt routing bit is cleared when olt is applied?

Similarly, pon_func_group does not appear to have been updated to clear
GPIO_OLT_MODE_MASK when pon_alt is activated. If a bootloader initially
configures pon_alt and the kernel later transitions the state to olt
(or vice versa during runtime pinmux state switches), could this leave
multiple routing bits set to 1 in REG_GPIO_PON_MODE and cause electrical
contention or incorrect IP block routing?

> +		.regmap_size =3D 1,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D30
