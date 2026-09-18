Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F75C2931CE
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723693; cv=none; b=t6af3QRWwuDqPIyIJqU53kP9GS6tFHjDG/mHOEC0DIzL+oG41cMpeRy/J+ajfgH3VLcdR57aH8JRyF8QCHUZTDdZMK/EKhTssEkdV6Gq0WYjCA97nvv9E6K5OJSBFNcie2SEHxRHoigocM9yQGZpv1Z00kZCaFfS8lA9OetNqhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723693; c=relaxed/simple;
	bh=+Qxj3YxE54n8VWvrdUZkiL3DwbWUR9Js1kStC/BpZzw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VbfcJEvQnmP8KlI9/j5A88ZP0KvZm/rVCCDITHpLf0ELcYthawwNUl13wFwR24fA+AShbnvd6rqvMNsAmMiJ8edTH0g8RM+B67nMyfmtJlG89mKEqytRwuFcs2VVro+2XbbmEClyQxDKBmfvchGlZCkgFxhO1NWnut+xv0+hFBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+SLn2LN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+SLn2LN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEB21F000FF;
	Fri, 18 Sep 2026 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723692;
	bh=tEsON2AvPpo06tc035T5p2YrsUbCASDxB5doXz77QhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f+SLn2LNlL0HygRuBD2p6FgYV+7W79R1lWu8i8AABsgwKFVz3qPOAey89hNd9NsvS
	 AlbtUxn6RYFSRoUlNm2lddwxeoBHEzVQTgS1KIKYKU18qu66rfJ06K/MIKPAcCTiKr
	 gJNTuTeccE5E28Fh+y4EYmt0+lp0teA9FPmbaoHwg5wuRQjZ4N/VXUJ9tICAsf9DTg
	 IF58fO/L7hegIkDPtenbf92l/ZZI98+aecag09yfq/Vff5x6W/T41L/3PClt8aGJZK
	 +AsvoUg39y0XuYNw+OVTqkIEV+hp6F1PZ+zo7uQA9OjZWLVyDbwlmYAc6JRlhlltOb
	 IpBwzGtorB4Vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/11] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C
 driver into two modules
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-mcp47feb02_refactor-v7-9-82ca794eafe2@microchip.com>
References: <20260918-mcp47feb02_refactor-v7-0-82ca794eafe2@microchip.com>
 <20260918-mcp47feb02_refactor-v7-9-82ca794eafe2@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 09:28:11 +0000
Message-Id: <20260918092811.ACEB21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] kbuild: Kconfig backward compatibility breakage during module sp=
lit
- [Low] iio: dac: mcp47feb02: PM operations exported outside driver namespa=
ce
--

commit 8ebb6f8ca4b9fbd374359f689f69be2c855ffca3
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: refactor MCP47FEB02 I2C driver into two modules

This commit prepares the MCP47FEB02 driver for bus-specific code by
refactoring it into separate core and I2C files. It creates a shared
core module to support upcoming SPI parts and renames Kconfig and file
structures accordingly.

> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index 3b3c77d8b3e1b..c99c32b229fb6 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -593,9 +593,13 @@ config MCP47A1
>  	  will be called mcp47a1.
> =20
>  config MCP47FEB02
> -	tristate "MCP47F(E/V)B01/02/04/08/11/12/14/18/21/22/24/28 DAC driver"
> +	tristate
> +
> +config MCP47FEB02_I2C
> +	tristate "MCP47F(E/V)B01/02/04/08/11/12/14/18/21/22/24/28 I2C DAC drive=
r"

[Severity: Medium]
Does renaming the user-visible Kconfig prompt break backward compatibility
during kernel upgrades?

When users upgrade their kernels using make oldconfig or make olddefconfig,
their existing CONFIG_MCP47FEB02 setting will be discarded because it lacks
a prompt. The new CONFIG_MCP47FEB02_I2C defaults to 'n', resulting in the
driver being silently disabled on existing configurations.

Is it possible to keep the original config name for the user-visible option
and create a new hidden config (e.g., CONFIG_MCP47FEB02_CORE) for the
shared code to ensure seamless upgrades?

[ ... ]

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02-co=
re.c
> similarity index 73%
> rename from drivers/iio/dac/mcp47feb02.c
> rename to drivers/iio/dac/mcp47feb02-core.c
> index 7312c2c96141e..91fad42df2168 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02-core.c

[ ... ]

> @@ -668,7 +461,7 @@ static ssize_t mcp47feb02_write_powerdown(struct iio_=
dev *indio_dev, uintptr_t p
>  	return len;
>  }
> =20
> -static DEFINE_SIMPLE_DEV_PM_OPS(mcp47feb02_pm_ops, mcp47feb02_suspend, m=
cp47feb02_resume);
> +EXPORT_SIMPLE_DEV_PM_OPS(mcp47feb02_pm_ops, mcp47feb02_suspend, mcp47feb=
02_resume);

[Severity: Low]
Does this macro export the PM ops symbol without the intended IIO_MCP47FEB02
namespace?

The driver establishes a dedicated namespace IIO_MCP47FEB02 for its core
exported symbols, but mcp47feb02_pm_ops is exported using
EXPORT_SIMPLE_DEV_PM_OPS, which places it into the global namespace.

Should this use EXPORT_NS_SIMPLE_DEV_PM_OPS(mcp47feb02_pm_ops,
mcp47feb02_suspend, mcp47feb02_resume, IIO_MCP47FEB02) instead to
maintain namespace encapsulation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-mcp47feb02=
_refactor-v7-0-82ca794eafe2@microchip.com?part=3D9
