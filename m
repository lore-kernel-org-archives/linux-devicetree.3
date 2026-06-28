Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34F03A2543
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782651146; cv=none; b=MKmir6vq/9I8pScAFIFikoyyHXoJqGOpTz7HDIfV2E3lXwNvqgR8HzPfF90HF+oVexPMvIDh9/tozGAGAwmjncSU7937IyGu6lfUlfvUAHwhuRKfL/OHUP2r88UAACNFCyIMK5wWXh3q9lKzZazmW85u1be1gEzCpe+lmzGkdTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782651146; c=relaxed/simple;
	bh=mwS9saVYWkCn6Tplir65pcgz5nI5PSgQdvoETR6U73Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sGtu/z325NsMUFs00yTiaNzmNB/E1I3xx1m03Jq1Z63KfQt2gr5GmR5FT/ttNnM9aGBStfO9hPm/M2K4PAfAV1OpRhWyUH1rBLq6AdwMvHMTJbdhl9dpXd/bulJOIwBqE8LSlV84oKcuBLsXW0onWpjBfOPg/t6F+T7ppnXCgdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AT/ohRrU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AT/ohRrU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2221F000E9;
	Sun, 28 Jun 2026 12:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782651145;
	bh=laVsmBJ9NC/U/GKCean09cIEFiGnlMhkHZXOUV9ozWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AT/ohRrUlCidEMnwYO14fzUzIJDDEMcYcr9G2As6E3cgDx6Q1QrsT4JYoe/XXo9Gz
	 7XDYIuWu+MUu9Ha1jCgCfbknwGM8GWT4hNCyKNYjqZvXDk9O2CNaooQ1aufunWjyOg
	 uNLSlMaeG76FRWvqdslqn/ddVwovW14QmYieVFU18DUQqPZ9GvW8O0h8rM8szEYhCD
	 6G2kpBdMxxRXTUVH0CMSaHAjCZXW5xXBn1y3kX683gGqsRXsPsX0LD2sVpamUYwT65
	 Jl8zF66xbX7lyfg27HTfeRJ3Pkbzzsl8z8S0vM74EjVcxuZOgD69E9VgqGFHb1YBjR
	 PudOEm8VspoSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 carrier
 board DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiqi Li" <lijq9@lenovo.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260628124318.627393-3-lijq9@lenovo.com>
References: <20260628124318.627393-1-lijq9@lenovo.com>
 <20260628124318.627393-3-lijq9@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 12:52:24 +0000
Message-Id: <20260628125225.1E2221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `cd-gpios` property for the external SD card slot specifies `G=
PIO_ACTIVE_HIGH`, which inverts the typical hardware polarity and will like=
ly break card detection.
--

commit 088caacbb90a6db1efc42acd89fb5cd05dff08d7
Author: Jiqi Li <lijq9@lenovo.com>

arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS

This commit adds a standalone device tree for the Lenovo ThinkEdge SE70
carrier board, which is based on the Tegra194 Xavier NX SOM. It configures
core peripherals including a custom 40-pin header and an external SD card
slot with a dedicated 3.3V regulator. Unpopulated PWM and fan peripherals
are explicitly disabled.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dt=
s b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> new file mode 100644
> index 0000000000000..969ea1783bbde
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

[ ... ]

> +		/* SDMMC3 for external user SD card slot with dedicated 3.3V power */
> +		mmc@3440000 {
> +			bus-width =3D <4>;
> +			cd-gpios =3D <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;

[Severity: High]
Does this active-high polarity for cd-gpios correctly match the hardware?

Standard mechanical SD card slots typically pull this pin to ground (logic =
LOW)
when a card is inserted, meaning GPIO_ACTIVE_LOW is usually required.

If there isn't a discrete hardware inverter on the SE70 carrier board, will
this configuration invert the card detection logic and report the slot as e=
mpty
when a card is actually inserted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628124318.6273=
93-1-lijq9@lenovo.com?part=3D2
