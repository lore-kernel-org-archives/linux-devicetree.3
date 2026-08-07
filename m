Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4438827A916
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119012; cv=none; b=g9dRfbMiTOj2aJsvJvMXKvHm1WEUi+Ra0pIpDIDgSWtNKZp9bEyi151GDCIe+y5M+boxG99veVgT26pI7b80a25mPCRMmIez1rlTgaKggQaJrYgq5B4bRhzHtGREZ6+JYBI5RRLWAOstjDLbj1+TufacO+HnOio51BM4gSJNiyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119012; c=relaxed/simple;
	bh=PkqzAOStNoBcchJ5CTN8o9dbfsKTmeqVwgVVcuy1/qE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SRsLNHAvG9E3eOKcKHx7Af73QwJY7EdR8MiLwytAnyYqXGvSMuxmWFBony+VQuvUzuTVByOyues0UC1QitPieFS0sxd/HbG3p0wJF35SYeRFhE0lRwthPlaNrjiSrjcQdzPjVkNNZ8RxZdKwBhFHCewJsNEPLbokAVqvpC6k+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0PPSGeC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0PPSGeC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE571F000E9;
	Fri,  7 Aug 2026 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786119011;
	bh=Wpa+m4rBd4Til9w/IC/GiMIPdVsz6JhK8c8aagG35cY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z0PPSGeC7y8+aH36b54WG+inRbEALYcqyqZdCHSLhIdiDpP0LY4PtAEkWcsktQorW
	 IC4VTCccxBmeX5DQsSmhLX3XxjThI61qLVfIpeU8UBL4EzLleu8j7ASpUddJ9aLnX6
	 wWlfKGz+a49ryW5rr31WuZWbMbgwI70WsBD0gN5k2koW2/WlfNzMdD314+NDsD4jvH
	 PEFYH63WJIcrqjrl9E0YhHxVPuI9kVzHBxjmQrnm05Mobd+dNEFFKN206JeM9GPHqD
	 1ywfgaFGbp0JUSl1Unbie9nn3QiGMOu6ExdZthkrtleYY0w8nIo938e110WxOYgHZb
	 z4i2A+VqXdyyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] clk: cs2600: Add KUnit test for CS2600 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Fitzgerald" <rf@opensource.cirrus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807155406.752721-4-rf@opensource.cirrus.com>
References: <20260807155406.752721-1-rf@opensource.cirrus.com>
 <20260807155406.752721-4-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 16:10:09 +0000
Message-Id: <20260807161010.DCE571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing length validation for read messages in the dummy I2C trans=
fer function allows a heap buffer overflow.
- [Medium] Integer overflow in delta frequency calculation causes improperl=
y strict test failure bounds.
- [Medium] Device node reference leak on KUnit assertion failure.
--

--- Patch [3]: [PATCH v7 3/3] clk: cs2600: Add KUnit test for CS2600 driver=
 ---
commit 2362317ae5c3adcc9e6eb5a18429400bcf90b30f
Author: Richard Fitzgerald <rf@opensource.cirrus.com>

    clk: cs2600: Add KUnit test for CS2600 driver

This commit adds a KUnit test for the CS2600 clock driver using a mock I2C
host driver and regmap. It validates the frequency ratio and PLL
configuration register fields against hardcoded tables of expected settings.

> diff --git a/drivers/clk/cirrus/clk-cs2600-kunit.c b/drivers/clk/cirrus/c=
lk-cs2600-kunit.c
> new file mode 100644
> index 0000000000000..2fd3f3ff4ef3f
> --- /dev/null
> +++ b/drivers/clk/cirrus/clk-cs2600-kunit.c
[ ... ]
> +	for (i =3D 0; cs2600_kunit_bclk_divs[i].pll_out !=3D 0; i++) {
[ ... ]
> +		/*
> +		 * Actual reported frequency can be slightly out because of
> +		 * PLL resolution, but should be within worst-case PPM.
> +		 */
> +		fdelta =3D (cs2600_kunit_bclk_divs[i].bf_out * CS2600_20_12_PPM) >> 20;

[Severity: Medium]
Could this 32-bit multiplication overflow for large values of bf_out before
the result is stored in the 64-bit fdelta?

[ ... ]
> +	for (i =3D 0; cs2600_kunit_fsync_divs[i].pll_out !=3D 0; i++) {
[ ... ]
> +		/*
> +		 * Actual reported frequency can be slightly out because of
> +		 * PLL resolution, but should be within worst-case PPM.
> +		 */
> +		fdelta =3D (cs2600_kunit_fsync_divs[i].bf_out * CS2600_20_12_PPM) >> 2=
0;

[Severity: Medium]
Does this have the same 32-bit overflow vulnerability as the BCLK divider
calculation above?

[ ... ]
> +	/* If there is a second packet it is a read */
> +	if (num =3D=3D 2) {
> +		ret =3D cs2600_kunit_i2c_read(priv, addr, &val);
> +		if (ret < 0)
> +			return ret;
> +
> +		bebuf =3D (__force __be16 *)msgs[1].buf;
> +		bebuf[0] =3D cpu_to_be16(val);

[Severity: High]
Could this write out of bounds if the read message length is less than 2
bytes, since msgs[1].len is not validated before the write?

> +
> +		return 2;
> +	}
[ ... ]
> +static int cs2600_kunit_case_common_init(struct kunit *test)
> +{
[ ... ]
> +	/* Wait for probes if the test case init already loaded the overlay */
> +	np =3D of_find_node_by_name(NULL, "cs2600-test-consumer");
> +	if (!IS_ERR_OR_NULL(np))
> +		cs2600_kunit_wait_for_probes(test);
> +	of_node_put(np);

[Severity: Medium]
If an assertion inside cs2600_kunit_wait_for_probes() fails, the KUnit
framework aborts the test thread. Does this result in a leaked device node
reference since the of_node_put() call would be bypassed?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807155406.7527=
21-1-rf@opensource.cirrus.com?part=3D3
