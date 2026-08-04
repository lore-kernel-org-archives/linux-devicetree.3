Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5976C3EFFB9
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861525; cv=none; b=QWJAsVhiHQRfh2hgKolTEHrE/EviUdbJwn1xyPGQaEPSzPWe/kwnu3sfq+BKaO2HzNW23uHTheZONiF04+vhRcyVoKTidyKGalclE0MxvGb6Uae5zRcjGE/oXEvzgLMKlZJsKBk293VPq9yLi3PTjqveZupp/khxrw7+1kazp7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861525; c=relaxed/simple;
	bh=hSI4g5EwNSKmHRTpx2v9HkYmD28KlrR8wf9vA0eVP3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cWycC+iVFW2rSf3arOEK50yIsZTudqAuN+8TNApwiAgUmEaoasKhcrz819tia0nWHHHpts9codrUrqIy/HuCadLX4Cy4XcQBlRoQelvXOfgIDFxAGcCt1z3k7WY/Dqe7B69P0Dq0X88ciNQV+ufPIdJBaPAXKAKTwBPXG4HDyto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDLHygkK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDLHygkK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53481F00A3A;
	Tue,  4 Aug 2026 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861504;
	bh=xNinFUtf1JXhPxGiF2py219zG01w37MM3AdFHoBnTH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZDLHygkKIM+RuAu0JY9OYht9rfsbivM4YAF+peBIsrp7BNCtsCb6abN/vNghPJ8mE
	 U2a9n9zk+GpeLMeppAhttUBHw+BBtyk81Qh9GqpRuzic/BbJZo4ZZx0RBLDHvm/rGg
	 zrYlQhcecq4BSdF/cZT+gR7TTodjpXiT9yz0hnwxbuV1Ud/wntFbVUHcUyxfJ22PZ6
	 foLpJWHGS7ZRmCo5/Ay/VowjSfwwEAxZFNUQZm3EHSJJmR8BeU338WOmlS83jKkBGS
	 YaErMr+l1ay7UBICXwE+RUNKxtarhy18NDL5T5rIgc8y2q8cTANcSxsTb3MiBBj4Zp
	 85iiquRzWTneA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 24/36] pinctrl: airoha: split driver on shared code
 and SoC specific drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260804160419.3592327-25-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-25-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:38:23 +0000
Message-Id: <20260804163823.E53481F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `mdio1` pin group is orphaned because it lacks a co=
rresponding pinmux function mapping, making it unusable dead code.
--

--- Patch [24]: [PATCH v9 24/36] pinctrl: airoha: split driver on shared co=
de and SoC specific drivers ---
commit 183c2af4d64e75f7c6e2fd8f6310a303940ea68d
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: split driver on shared code and SoC specific drivers

This commit splits the combined an7581/an7583 source file into shared pinct=
rl
code and SoC specific drivers.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
[ ... ]
> +static const int an7583_sipo_pins[] =3D { 34, 35 };
> +static const int an7583_sipo_rclk_pins[] =3D { 34, 35, 33 };
> +static const int an7583_mdio_pins[] =3D { 53, 54 };
> +static const int an7583_mdio1_pins[] =3D { 43, 44 };
> +static const int an7583_uart2_pins[] =3D { 34, 35 };
[ ... ]
> +static const struct pingroup an7583_pinctrl_groups[] =3D {
> +	PINCTRL_PIN_GROUP("pon", an7583_pon),
> +	PINCTRL_PIN_GROUP("pon_tod_1pps", an7583_pon_tod_1pps),
> +	PINCTRL_PIN_GROUP("gsw_tod_1pps", an7583_gsw_tod_1pps),
> +	PINCTRL_PIN_GROUP("sipo", an7583_sipo),
> +	PINCTRL_PIN_GROUP("sipo_rclk", an7583_sipo_rclk),
> +	PINCTRL_PIN_GROUP("mdio", an7583_mdio),
> +	PINCTRL_PIN_GROUP("mdio1", an7583_mdio1),

[Severity: Low]
Is this mdio1 pin group an unintentional leftover?

It is defined and added to the group list here, but it lacks a corresponding
pinmux function mapping in an7583_pinctrl_funcs, meaning it cannot be
referenced by device tree pinmux setups. Additionally, pins 43 and 44 are
already assigned to an7583_i2c1_pins.

> +	PINCTRL_PIN_GROUP("uart2", an7583_uart2),
> +	PINCTRL_PIN_GROUP("uart2_cts_rts", an7583_uart2_cts_rts),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D24
