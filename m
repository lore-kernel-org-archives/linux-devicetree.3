Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFEE423E9C
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902648; cv=none; b=qwXizyrFTGeOndeYB0qp2fUahzGuSF10VjNBb4rcrdP/3qdQJeRrjOGPsL0CLSzBVE+KiyCZCT0s+s00+lkzGusFXYfqSYiaC/cLPng1FO2PnFHlPrYq22YSHmaH5qnzCdipZl2lBdaNndlAgS7vMbZeFg1eUqQ8ukWq1ych9GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902648; c=relaxed/simple;
	bh=EPa4rk5XEjOX31+JX8/CHwNXvP6Fn3zvhRoHmb0x6zo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mYBgNXfpmTiXXUJ8pcoCogWCegPCIk7HJwZSnvOhf4VAB1NcyeVv1zYAAClYj/vqAZZOhlyMAt7EFNTJJdJO+LhqqWP9ZcrSbYudshpGkhfgbty3Rx3+WIhGVhCKIPt7G+WfjQUrk8SBHNFdmbFV/8MKz68yqcs79MAQ3grJXZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8sKiOE1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8sKiOE1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B761F000E9;
	Fri, 24 Jul 2026 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784902646;
	bh=+jR72HA9+yNtO+k0XT5rT6X1Q/oxzF+kCzfJvB9au8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l8sKiOE19/+NjBW1gXIOY3WwHcPA+XDwPEgAhOxWuufJmNmIRdFaymt93FqJlgA7T
	 SFeiiTyxHp0DkukLoA6pU8AwHdtnec5MfdSraiAPLWn3VnkqBbn6JHmJxGtcIPfM91
	 xyyCN2LobjLajWzYQXR20KC4Ww/kwxdrWDXzGqkdSHXMAbpF8j+jITQ4vQ5pt1RfFa
	 olSTsVwR/OFZ+1AlEtFwtY08KlD5Nnb1mttTN6+G1Qr2bB+SGIZc2kd6//Qxk9gJUs
	 JU/2tViZLZOT5dYmoeTUP/hNy4ZAyYwvxE1TOTMkWIeJxq+aGoWtHIyYK/s6XUZuye
	 Go1EGK7+IO6rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/7] clk: Add devm_clk_bulk_get_enable()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723123838.125145-2-suraj.gupta2@amd.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260723123838.125145-2-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 14:17:25 +0000
Message-Id: <20260724141726.54B761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The docstring for devm_clk_bulk_get_enable() incorrectly claims it =
returns an IS_ERR() condition.
--

--- Patch [1]: [PATCH net-next 1/7] clk: Add devm_clk_bulk_get_enable() ---
commit 0e92e9409720067c1f28a37f1eb2bb60ddaa0d56
Author: Suraj Gupta <suraj.gupta2@amd.com>

clk: Add devm_clk_bulk_get_enable()

This commit adds devm_clk_bulk_get_enable() to get, prepare, and enable a
mandatory set of clocks with device-managed cleanup. It introduces a
wrapper around the existing __devm_clk_bulk_get_enable() helper.

> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 998ba3f261dac..0289ac4c6e48e 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
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

[Severity: Low]
Does this documentation incorrectly suggest using IS_ERR() on the return
value?

Since devm_clk_bulk_get_enable() returns a standard integer error code
rather than a pointer, consumers following this docstring and attempting
to use IS_ERR() on the result would encounter compiler warnings. Should
this instead state that it returns a negative error code on failure?

> +int __must_check devm_clk_bulk_get_enable(struct device *dev, int num_cl=
ks,
> +					  struct clk_bulk_data *clks);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723123838.1251=
45-1-suraj.gupta2@amd.com?part=3D1
