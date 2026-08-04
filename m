Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05C5481A9E
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863552; cv=none; b=M23ufhDeTCWzQxqwKDQptRPrgyetkbBf42ThMrqR9DPIvaHBtGytHbdoh5T5HWY+y+lNJ0KRv9M7FYofsJSbC2qwxrDsOkGYsCK50RYUSUiTyOWWnJ6CdPVoumPcaqSJw+UOSj7WwuQlajLkhT9BOXt5azwfsNbg9uD43sa8Jxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863552; c=relaxed/simple;
	bh=P15mhGTAHN03UUxTt2ICvG5dzMPjnehVnICxKR6Ku34=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=byY4tyn13bKSXb+96UbeSUGZKdQ6hL2ce2bup3Bq1CGvVX8C1YBoE1toJkTkvNZwXaTjU/MDFt8/UgDJKDYLmsbu1g2tfRAbl8qBU4RA92Gq0YrAKlPaSTk1hd9VMUf0D0YatbdFugwSj9W8aMhx5c7IO4W2H5YuVB06UmldeJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2aPrhJK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2aPrhJK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF9E1F000E9;
	Tue,  4 Aug 2026 17:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785863535;
	bh=doSS1NYhXqXud9rGZz+Q87BCc/R8b0aSLwfe/tMIONw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L2aPrhJKjqGN6l76GDXQvbZ6r4GvCGy4i/AZiwZU1Ljf4Aq04pVtTmx8iZmSBu0ai
	 +lXy27B4u5ojv8i/DhBlLTDn7UXxJ/Z4HNshl9SqFdtoJk1cTL5c8zzbtAit/oqnep
	 mPr+YdXr0hK5mQv2slE15/EDEZ7go6AqojEIHI5boIOJ6PZWbD+SQPzCR2gjV7dmH7
	 /D1ChOk/ySi0urAB3BEUlyRhk5r7zo3q6C4lu7zCkaWDXgLPt0Is/UcZpECWzYSTgn
	 8xmxXD37xN5ZX/hdCvCZKtF3Og5nD0sgyrOdwavQ2TfM6+vdlHODVTKScMD+AmTWLi
	 T63hhfW4U6ZiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 09/11] clk: realtek: Add RTD1625-CRT clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804163807.1285869-10-eleanor.lin@realtek.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
 <20260804163807.1285869-10-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 17:12:14 +0000
Message-Id: <20260804171215.5BF9E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Nullifying `regmap` in `rtk_clk_remove` introduces a race conditio=
n that leads to a NULL pointer dereference if the driver is unbound via sys=
fs.
--

--- Patch [9]: [PATCH v12 09/11] clk: realtek: Add RTD1625-CRT clock contro=
ller driver ---
commit 9b8b892d0fe2cab055b1375b43022988ae2354a2
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add RTD1625-CRT clock controller driver

Add support for the CRT (Clock, Reset, and Test) domain clock controller
on the Realtek RTD1625 SoC. This driver acts as the parent device and
registers the reset controller as an auxiliary device on the auxiliary bus.

> diff --git a/drivers/clk/realtek/clk-rtd1625-crt.c b/drivers/clk/realtek/=
clk-rtd1625-crt.c
> new file mode 100644
> index 0000000000000..982ef73785ac5
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-crt.c

[ ... ]

> +static struct platform_driver rtd1625_crt_driver =3D {
> +	.probe =3D rtd1625_crt_probe,
> +	.remove =3D rtk_clk_remove,

[Severity: High]
Does adding this remove callback and allowing sysfs unbind expose a NULL
pointer dereference race condition?

Because the clocks are registered using devm_clk_hw_register() in
rtk_clk_probe(), they are unregistered during devres cleanup, which
happens after rtk_clk_remove() completes.

Looking at rtk_clk_remove() in clk-rtk-common.c, it explicitly sets the
regmap to NULL:

    for (int i =3D 0; i < desc->num_clks; i++)
        desc->clks[i]->regmap =3D NULL;

If a concurrent clock operation occurs (like reading the debugfs
clk_summary) between rtk_clk_remove() returning and the devres cleanup
finishing, will CCF invoke the clock callbacks with a NULL regmap and
cause a kernel panic in regmap_read()?

> +	.driver =3D {
> +		.name =3D "rtk-rtd1625-crt-clk",
> +		.of_match_table =3D rtd1625_crt_match,
> +	},
> +};
> +
> +module_platform_driver(rtd1625_crt_driver)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804163807.1285=
869-1-eleanor.lin@realtek.com?part=3D9
