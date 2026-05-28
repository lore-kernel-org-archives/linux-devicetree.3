Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DD912E1DC
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980570; cv=none; b=dEn6Rwd2PYDZijFgWvbWTe0aQvEuX17Cl3W90MQRQBE+7obX7noGn1x6R/Ydq3D3+2fVOOjRtEKTO9VKeeaQTOFzh/sxosOgCWEbNeWxwk/yg8YluQnW8071zdp1+uX5oXz8q2cFXradfsT/7F1tguHk1thNFc5O/yJMFT9e3oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980570; c=relaxed/simple;
	bh=SD9APboWDxHKBy0imJggxwLEQn6gBBrTxSx1MB1LoGo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qgxvXJAH2gFZDaxUNQyTPtlsQFzfUXaq8i5jN/yknZITiPKn+zn+6U5/jxODUVqAhXpLlpaYO+bEnMp7RONxuwIo9XQmXO85tlMBt6b86YJmbD4XtwItwDjr0UQQNOoGpu4yfo90nP789ebTBbHHZIN2dvW213CVjXnqskLlJBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCPi9CH8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCPi9CH8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08FD1F000E9;
	Thu, 28 May 2026 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779980169;
	bh=8eh7m+xS1WDj/EYE+7dS+fLtZFgglUwZ1LOaRH+PNgY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hCPi9CH8tdyC1uWwNhT5kgqm96bJSawn6AjtxCKFWKWMaLnYA+y4FOBFdg8m0qcoY
	 MIR40eIr93Q6p2sQIvP49jadtjFEYVXkONWiY1IpYYJMosOuI+5Y5AXZK9pZX/Z/QD
	 Ln/VeYADw5Hay2bbZEyyIAjZdoVd9mEOtxiIpGliCaOcuBmL1elWU5XoKam1O301To
	 yRgJOyC8ZnlXRek8mqUAnlTfLlVxIfa2gRcYVXs1WG3s79dW9e23RszbJ1JuGl/BCB
	 HLYbUazTCi3mu35PibOH+t1gLxrnJxWxmJLTfSxmFZw1g8pDT7qr81AtkWPOmkAUUD
	 7K4Q1h0XCh/qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] mfd: lm3533: Add support for VIN power supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260528135123.103745-4-clamor95@gmail.com>
References: <20260528135123.103745-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 14:56:08 +0000
Message-Id: <20260528145608.D08FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `lm3533_cells` array is allocated on the stack without initial=
ization, leading to memory corruption and kernel panics.
--

commit d39c7ac544b69e1a515d2b34cf44f319c6f00c0a
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: lm3533: Add support for VIN power supply

This commit adds support for a 2.7V-5.5V vin power supply to the
lm3533 core driver. It acquires the regulator in the probe function
and toggles it during the enable and disable sequences.

> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> index 8495e91198711..519f8c16a3f35 100644
> --- a/drivers/mfd/lm3533-core.c
> +++ b/drivers/mfd/lm3533-core.c
[ ... ]
> @@ -324,7 +336,9 @@ static int lm3533_device_init(struct lm3533 *lm3533)
>  	u32 count =3D 0, reg;
>  	int ret;
> =20
> -	lm3533_enable(lm3533);
> +	ret =3D lm3533_enable(lm3533);
> +	if (ret)
> +		return ret;
> =20
>  	device_for_each_child_node_scoped(lm3533->dev, child) {
>  		if (!fwnode_device_is_available(child))

[Severity: High]
This isn't a bug introduced by this patch, but it was introduced earlier in
this patch series (in "mfd: lm3533: Convert to use OF bindings") and
remains unfixed.

Does this code pass uninitialized stack memory to the mfd core?

In lm3533_device_init(), the array is declared on the stack without zero
initialization:

	struct mfd_cell lm3533_cells[LM3533_CELLS_MAX];

When processing the child nodes, only specific fields like name, id, and
of_compatible are assigned. All other fields in the mfd_cell structs,
such as pdata_size, resources, and num_resources, remain populated with
uninitialized stack garbage.

When this array is passed to mfd_add_devices(), the mfd core processes
these garbage values. If pdata_size contains a non-zero garbage value,
mfd_add_device() will call kmemdup() on the garbage platform_data
pointer, which could result in an immediate kernel panic.

Furthermore, if an available child node does not match any of the
supported compatible strings, count is still incremented:

	device_for_each_child_node_scoped(lm3533->dev, child) {
		...
		if (fwnode_device_is_compatible(child, "ti,lm3533-als")) {
			...
		}
		...
		count++;
	}

Could this cause a completely uninitialized cell (with a garbage name
pointer) to be processed? This could also lead to a crash during mfd
registration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528135123.1037=
45-1-clamor95@gmail.com?part=3D3
