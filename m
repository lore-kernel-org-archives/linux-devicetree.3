Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C9D42F71F
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174929; cv=none; b=A8l8XUJbFwuAFF5o9kGniyg290fU1H/IYdEXydRngg7jEkRsQkTM69ZxWYLZ9p6wIggUn7EoXluwv6sfpGb88CidxTFZXa9RmGmZR7kufAU1xVcTvmrP4bnE+aZopiLDWmgAVJEqxaSRQXSDdHcVJbQSIYjxdgfr3H8GA2XITEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174929; c=relaxed/simple;
	bh=pyp0qCthc/9uW6tQ/Q26hHYBfSwfXjyxPRQuxXqr/Rw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kJfd4gsA56kdTLHjRRXxNJHHGN5noTbKxdCqG7YAry6A4aPMyPqOOiNzjekkxRACt/MHx5vozCbQj9AuCt0Dl7V6zE95aAs23T1tdJKno+6FafCujsx+YUVoRKWHGk7wkiLmBJ+Me1NBEsovp5XzCi5SxvkFZ5nokcCaanXnOyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fbb0bss4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fbb0bss4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0B41F00A3A;
	Mon, 27 Jul 2026 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785174917;
	bh=T3efGXNMr3g58XwCl24w1ad7Bcsl96zujn+qnKVi9/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fbb0bss4i0cqfFWbyZUEpWQlzMMXj+ERSQYf9lMwxcOdUgS+XfCgsFGgCDPEwRi9n
	 Jt2Htg3FH6jLREJzFGXO0jUTY7ojNVilHVFDJURZvKW/b9/WajFP1/M0x4Tb3mQKvW
	 o2D4XeU9ZNDGaGhM+6UuK99wBd6naLqFDq/36AYvmQJE9KFMZepSXarmna8t+/wIcc
	 NJv7nM+iLAbTHLo8eD1ignKW9Sd1StrXEMVPBjRowLNcPr3L01A5R/KVj6EkgyLM4F
	 6OJ2K3kz0t0uxwQD66n3MLp4NssM2zXrTf3V1I5SX7Pn0pk0JgqGEAOBR0KXryTPG7
	 q0AxShbudU7qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 09/35] pinctrl: airoha: an7581: fix mux/conf of
 pcie_reset pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727174141.664933-10-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-10-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:55:16 +0000
Message-Id: <20260727175516.CE0B41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The fix applied to `pcie_reset_func_group` for the EN7581 SoC to c=
orrect the mux polarity was missed in the corresponding `an7583_pcie_reset_=
func_group` for the AN7583 SoC, leaving its PCIe reset pins broken.
--

--- Patch [9]: [PATCH v8 09/35] pinctrl: airoha: an7581: fix mux/conf of pc=
ie_reset pins ---
commit 666ae88b706b2dfd8c306248b5e161abf530d833
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins

This commit fixes the pin mapping for pcie_reset pins on the AN7581 SoC to
match the datasheet. It also corrects the pcie_reset pin function to proper=
ly
configure the pins for PCIe reset rather than as GPIOs, and introduces dedi=
cated
methods to set these pins as GPIOs or PWM.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index b90917d64f158..8815b25edcee7 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -1431,7 +1478,7 @@ static const struct airoha_pinctrl_func_group pcie_=
reset_func_group[] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_PON_MODE,
>  			GPIO_PCIE_RESET2_MASK,
> -			GPIO_PCIE_RESET2_MASK
> +			0
>  		},
>  		.regmap_size =3D 1,
>  	},

[Severity: High]
This is a pre-existing issue, but since this patch fixes the mux polarity
for the EN7581 SoC's PCIe reset function by writing 0 instead of the mask,
should the same fix be applied to an7583_pcie_reset_func_group?

Currently, an7583_pcie_reset_func_group still applies GPIO_PCIE_RESET0_MASK
to REG_GPIO_PON_MODE. If the device tree requests the pcie_reset pins
function on the AN7583 SoC during device probe, won't this incorrectly
configure the pins as GPIOs instead of PCIe reset lines, breaking PCIe
device initialization for that SoC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D9
