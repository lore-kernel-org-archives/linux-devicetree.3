Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B76C431499
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108048; cv=none; b=gFFil9Wi7cwlcY8uKM1BWdQpsgTN6PfVytGviOd1ca/sO4x8Jk4XHSfMcTtZ0+UbfWO+2L0IG23BFzcwMOcWtowNoDczRfVanbPymox+jPHwV4RJz9LPF5+ZAfgdnz/qfS1zOZDOYewAEjbdRIFkNWbuD91En4mryQ6PCaEO6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108048; c=relaxed/simple;
	bh=jpQmVdSYnmVxKZY27i0/sMmzXcu+53a3et8skWxbM1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KBrhptAwDPn4BOOoH+9tlNQwNyi/My4hm8hz1C9Arpw3u+gn5gP9xp0Y/yjy9tEuRAkUKDevcxDt2h2WzsdoCFXJxmQ64uVfCc5fkTuTQsQVW2us+eiVlx312pQKnfDoOXlgccJbrsR73jnT7PSzzWm4G17168Un379tlls3d7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lr/NB7jX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lr/NB7jX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF131F000E9;
	Wed, 15 Jul 2026 09:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784108041;
	bh=rEkVsrAGUzUyCrDxDqCXVloTGlUHO9PhXXw6QPRGdeQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lr/NB7jXkPYeQyRFuT/E/dG/Vv4mRQSKxoNHAtIh3ra3/6qN8oGk4e3rxASJaixDf
	 9F2phxhIFc3fMxR4v1wcxHj0vHnwnYNw87OlWQ2f6SN36lC1a0Our0K9rqmhJxseJE
	 b3HNnptuYnJ8vaoJcj7hj+eQq37GCwEugvTWxnJ700wf4M7yf9+QQyfy/UZ9zDFsxA
	 6nsjwXIyw8jjwMJHqwUuG6F7Pg22FMG9zoyciEz7Id7OrIG3YdCcwWLFXvOy0VkwpE
	 ZMMlDieS0uiiXKekwRkSDaHMPEPcGstu0tdmn6j8QvWMYbo5zUXqHt1Du1A2R/3dVC
	 eX1L10l5fXvaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 13/16] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715085348.3457359-14-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-14-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:34:00 +0000
Message-Id: <20260715093400.AFF131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing initialization of `list_head` causes a NULL pointer derefe=
rence on the `pwrseq_unit_setup()` error path.
--

--- Patch [13]: [PATCH v5 13/16] power: sequencing: pcie-m2: Add usb and sd=
io targets for E-key connector ---
commit a4efebd06d30c32580111345a5d6a16748b52be2
Author: Chen-Yu Tsai <wenst@chromium.org>

power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector

The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
UART for BT. This commit adds power sequencing targets for SDIO and USB
by renaming existing units to wifi and bt.

> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/se=
quencing/pwrseq-pcie-m2.c
> index 01f9f6a717464..8ae55e87db74c 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -69,46 +69,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_=
unit_deps[] =3D {
[ ... ]
> -static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data =3D=
 {
> -	.name =3D "uart-enable",
> +static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data =3D {
> +	.name =3D "bt-enable",
>  	.deps =3D pwrseq_pcie_m2_unit_deps,
> -	.enable =3D pwrseq_pci_m2_e_uart_enable,
> -	.disable =3D pwrseq_pci_m2_e_uart_disable,
> +	.enable =3D pwrseq_pci_m2_e_bt_enable,
> +	.disable =3D pwrseq_pci_m2_e_bt_disable,
>  };

[Severity: High]
This is a pre-existing issue, but while reviewing the new power sequencing
units being added here, I noticed a potential NULL pointer dereference in
the core power sequencing error path.

Does the error path in pwrseq_unit_setup() crash when freeing an uninitiali=
zed
list?

When a unit is allocated in drivers/power/sequencing/core.c:pwrseq_unit_new=
(),
the unit->list field is not initialized:

drivers/power/sequencing/core.c:pwrseq_unit_new() {
	...
	kref_init(&unit->ref);
	INIT_LIST_HEAD(&unit->deps);
	unit->enable =3D data->enable;
	...
}

If pwrseq_unit_setup() fails before adding the unit to the list (for exampl=
e,
due to an out-of-memory error), the cleanup path calls pwrseq_unit_put(unit=
).
This triggers pwrseq_unit_release():

drivers/power/sequencing/core.c:pwrseq_unit_release() {
	...
	pwrseq_unit_free_deps(&unit->deps);
	list_del(&unit->list);
	kfree_const(unit->name);
	...
}

Since INIT_LIST_HEAD(&unit->list) was never called, the list pointers are
still NULL. Calling list_del(&unit->list) will attempt to modify next->prev,
resulting in an immediate kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.3457=
359-1-wenst@chromium.org?part=3D13
