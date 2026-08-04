Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB3F34165B
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861861; cv=none; b=PKjlzICoz1ykPjaHWxWY0bzIlqaI4EGIleKQxR2abm/WRrpkIRQuq1C4rzz5W61JNqAx8aZMIDw2Qibi8rhLZe3K1CuqcXmFyQtjE1kCt9IcHbE60IsAydW3tUGQI0+U7qzSSgOUGhUBFwSOdj/7ENarwQQk4V2ppI9rOOjGm6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861861; c=relaxed/simple;
	bh=bI26sW12DrVbY0oAVvPG98jogMQkqnRYuImRUFmz61I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iMC8YM78iBdJc8o84Ib3H9m05EstYnxVvGvALg9d6rQsWrzXHiN02B4C7Mi11OHaHIEY/U87voCQi52u30MoeafCo0ANNu4Vfm5sh+Wr9g0j+kbkRqffzx9bxRGNZG3bVtVRwBZbiXPUGytdtPtK+7Tm1Fy/30LWx97KaXZ5W6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFbtVH2y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFbtVH2y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7671F000E9;
	Tue,  4 Aug 2026 16:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861843;
	bh=8VQoeAn5OZzGWdH4awMsy6Nm5Oc7dIUL34ENiiWH4NA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFbtVH2yNNhsrcWKH5ZNNA2hoNc6Ny3lesa9PkTna72b9WvLJgVBedSwADb127Ycs
	 K+EIdiCNCAo1l1fbeWPpBRC3dTHVrJAAxT1IGIbTNhfQx4MqgI4pOIvQiar/1pJJI+
	 SM/UP+yKRWe+MYg676quRtTcOvmYYRA2fQgBH2sbxIFMQM5yfbcznlClG6R8azKxWE
	 JJRslUvFa2lKJWtDScrGMpsraYwa3d5aGLtFg8hrFL4zM25qHN15a4Nw1216/B9i9Q
	 Q1NZZmas6OlDuobMiSXZpw8paqYlM57Q9Lmo+85O272qc6NrCoS8W0+gRqFeSJ0h9p
	 LtF7lmexGMCXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 32/36] pinctrl: airoha: add support of en7523 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260804160419.3592327-33-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-33-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:44:02 +0000
Message-Id: <20260804164403.4E7671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware Initialization Failure due to hardcoded EN7581 SCU compat=
ible string
--

--- Patch [32]: [PATCH v9 32/36] pinctrl: airoha: add support of en7523 SoC=
 ---
commit 61589d8a38efeb6abcc7cf58f8f68ff7e19a7f82
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add support of en7523 SoC

This patch adds support of Airoha en7523 SoC pin controller.

> diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/ai=
roha/pinctrl-en7523.c
> new file mode 100644
> index 0000000000000..91490418e9ab1
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
> @@ -0,0 +1,1156 @@
[ ... ]
> +static const struct of_device_id airoha_pinctrl_of_match[] =3D {
> +	{ .compatible =3D "airoha,en7523-pinctrl", .data =3D &pinctrl_match_dat=
a },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
> +
> +static struct platform_driver airoha_pinctrl_driver =3D {
> +	.probe =3D airoha_pinctrl_probe,

[Severity: High]
This isn't a bug introduced by this patch, but will this probe succeed on t=
he
EN7523 platform?

Looking at the shared airoha_pinctrl_probe() function in pinctrl-airoha.c,
it unconditionally hardcodes the EN7581 SCU compatible string:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_probe() {
	...
	map =3D syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
	if (IS_ERR(map))
		return PTR_ERR(map);
	...
}

Since the EN7523 device tree uses a different compatible string for its SCU,
won't this lookup fail with -ENODEV and cause the pin controller driver
initialization to abort?

> +	.driver =3D {
> +		.name =3D "pinctrl-airoha-en7523",
> +		.of_match_table =3D airoha_pinctrl_of_match,
> +	},
> +};
> +module_platform_driver(airoha_pinctrl_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D32
