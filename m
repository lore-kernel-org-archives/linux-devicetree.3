Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5884369D42
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126396; cv=none; b=Y0MnMPpx0NszlHWqb9n5yADIm3ItAtcgw87FKlqhSXW3BZimfKBsSMPwyEeqpwyAAgUdo87gl4b4E2RxrmlaPq32s9eyikGNAacFhyzLtseajV9UMl4BMq9evYMlLu8hSAg1b0BBPltd1WH/D1XNS1/eoVgewLuE4GPZ3Y6XIGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126396; c=relaxed/simple;
	bh=qKSBmllXj7lcOQnoibEGpz/FD9/NAJLaveEVDgZQGBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VnCcNQu/QVNl3tjkVEndQNiscnR+ghT4urhO2aiZrPmaYWyK5A5nNHByI0SrGG3HeIfHHx3ewgH06l/shEh1e9gJi3IdPmlAWa+CssM3CIW5ir3PMAkQU9ZEPprgcPB3bkeHxJ1zBNZgHtXu3v11MRH6NJyNBAi3us/TJ2cEVjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0psTIdA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0psTIdA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDB41F00A3A;
	Fri,  7 Aug 2026 18:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786126395;
	bh=Es07NcvMUvl/2lyVzI7iAxZ8MqBcj9T1mwCcaDyVOqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j0psTIdARKL6iFgXeuoCUjHJMLnIyTrqK6LZS4HogAf2DQ7scj1Q/cXyexJtVkCks
	 BJLWIkJqLPI26nAUTFdpjmOJa4KFwOkW4PXBULY3NAuu/LGgnme8UPMuCFjQ6u5TTi
	 TvQs0rT+ywbJogXn57Rz4uVMC7vRUY+eRSL/Hh6hCUiwl4rVCSd71GGDGGLFK/EdTV
	 LmF2W3debVy/Uitw0c48Gbta82zg4eFONCajwADDHN8GqP6hb+AuFxgmCznZYJOr5M
	 KPBp8cDNapLwIUi1p0Mg+yjxMpjYtK9aeUqYZOwVUMK5axHyvL95XROSqS2+fS8k19
	 yxo0KQylpSCkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/7] clk: Add devm_clk_bulk_get_enable()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806181153.1213996-2-suraj.gupta2@amd.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260806181153.1213996-1-suraj.gupta2@amd.com>
 <20260806181153.1213996-2-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 18:13:14 +0000
Message-Id: <20260807181315.4BDB41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The kerneldoc for devm_clk_bulk_get_enable() incorrectly states tha=
t it returns a valid IS_ERR() condition on failure.
--

--- Patch [1]: [PATCH net-next v2 1/7] clk: Add devm_clk_bulk_get_enable() =
---
commit 319855f04a85138c6a1bce0e994003875d466d17
Author: Suraj Gupta <suraj.gupta2@amd.com>

clk: Add devm_clk_bulk_get_enable()

This commit introduces devm_clk_bulk_get_enable() to allow consumers to
get, prepare, and enable a fixed set of mandatory clocks with device-managed
cleanup.

> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 998ba3f261dac..0289ac4c6e48e 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h

[ ... ]

> @@ -502,6 +502,22 @@ int __must_check devm_clk_bulk_get(struct device *de=
v, int num_clks,
>   */
>  int __must_check devm_clk_bulk_get_optional(struct device *dev, int num_=
clks,
>  					    struct clk_bulk_data *clks);
> +/**
> + * devm_clk_bulk_get_enable - Get and enable bulk clocks (managed)
> + * @dev: device for clock "consumer"
> + * @num_clks: the number of clk_bulk_data
> + * @clks: pointer to the clk_bulk_data table of consumer
> + *
> + * Behaves the same as devm_clk_bulk_get() but also prepares and enables=
 the
> + * clocks in one operation with management. The clks will automatically =
be
> + * disabled, unprepared and freed when the device is unbound.
> + *
> + * Return: 0 if all clocks specified in clk_bulk_data table are obtained=
 and
> + * enabled successfully. Otherwise returns valid IS_ERR() condition cont=
aining
> + * errno.
> + */
> +int __must_check devm_clk_bulk_get_enable(struct device *dev, int num_cl=
ks,
> +					  struct clk_bulk_data *clks);

[Severity: Low]
Is this return description accurate for an integer return type? The function
returns an int, but the documentation suggests checking it with IS_ERR(),
which is designed for pointers. Using IS_ERR() on an int return value will
trigger compiler warnings. Should this just say it returns a negative error
code on failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806181153.1213=
996-1-suraj.gupta2@amd.com?part=3D1
