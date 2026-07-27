Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A5740099F
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156111; cv=none; b=Izd9j8Au91VM2e0PwODHIT80HYk1z15Dw6ARkh8dKnOf3sTKHHvIwgGvS1aH4bzYkk6Iao2+ZNmXi+qAeYdz9n+kfnY/85KoGiKR4J4ZroeT/c7u49hosF4OkRdq88JiXg97O9AOjAz5Kcb3xNLP37prQhMGixMWNLy1wecMks4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156111; c=relaxed/simple;
	bh=XtUQvqtEQ6rhI2N8Zh1L6S0UQ8i1oVo7jtruO0BZBy8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AXlLpXEHEAtbRZiNhCyNWGcGUj0GKvUnS43qoo6XNRg7+hq3h2FRQONyf/rpdNbN3hGbIQ99ogLtLDFUD7Jr4kpfGINlwABA084phSPtoWrRdf3tunoKms8kUxBk1SymDgb/tlJCiqyqZZtbXHIoW5vKhwq2xOgbFGH3+OuDavs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayuGdpoJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayuGdpoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B606B1F000E9;
	Mon, 27 Jul 2026 12:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785156110;
	bh=QuLqZ3bcoRAMm5HTSH//K9CO8bFe2goHNnf88E20Sy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ayuGdpoJHR33pQ8s18ekY6wIIhkWxUo3DmNOUMH1rO8XDYY+VbbMzOwVhzFhjoOh2
	 2PY8x+4EQu1CupUkGUxY4PSAE67cOGpW7lGNY54Do4Mhi6DRW2UldoGz6EYrKVDJ/h
	 4BJ5qr1PbEmWuMPkd2akZcX+aMjowiTdPzgyRdHMyhuYlbWykkZZDzWU+q2HhoMHAx
	 PWVwfYX1XTT33Jm36E+zi1UntPAJ9AUXYW6otV3W2DyuDamApwTb7jVhaN7kEep2ac
	 SfXxU4Ud3Eg2MZeUHTwsGIyiSiMib2sBpZjKX5zlAO3ZgVdANUsux02Bla8GvOKDFp
	 KVu/FGtNOJQRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/16] dt-bindings: nvmem: microchip,sama7g5-otpc:
 add sama7d65 and dt node example
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727122633.117435-8-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-8-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:41:49 +0000
Message-Id: <20260727124149.B606B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Kernel panic on error path due to incorrect usage of cleanup.h=
 with ERR_PTR.
- [High] The dt-bindings introduce a tag-based packet reference example (0x=
41435354), but the tag resolution implementation is entirely missing from t=
he core OTPC driver, causing reads to fail.
--

--- Patch [7]: [PATCH v4 07/16] dt-bindings: nvmem: microchip,sama7g5-otpc:=
 add sama7d65 and dt node example ---
commit c38200e184c8f58a1ca93cb43c4f35660c0b276c
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

dt-bindings: nvmem: microchip,sama7g5-otpc: add sama7d65 and dt node example

This commit adds support for the sama7d65 compatible string. It also adds a
device tree node example demonstrating how a tag can reference a packet
stored in the OTP memory.

> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-ot=
pc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.ya=
ml
> index cc25f2927682e..04b44660554ea 100644
> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
[ ... ]
> @@ -48,4 +54,20 @@ examples:
>          };
>      };
> =20
> +  - |
> +    efuse@e8c00000 {
> +        compatible =3D "microchip,sama7d65-otpc", "microchip,sama7g5-otp=
c", "syscon";
> +        reg =3D <0xe8c00000 0x100>;
> +
> +        nvmem-layout {
> +            compatible =3D "fixed-layout";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +
> +            calib@41435354 {
> +                reg =3D <0x41435354 0x2c>;    /* Temp calib data packet =
TAG */

[Severity: High]
Does this configuration cause reads to fail because the tag resolution
implementation is missing from the core OTPC driver?

This example uses `nvmem-layout` `fixed-layout` and defines a cell with
`reg =3D <0x41435354 0x2c>`. The NVMEM core passes the byte offset `0x41435=
354`
to `mchp_otpc_read()`.=20

However, the driver strictly expects ID-based addressing (`packet_id * 4`):

drivers/nvmem/microchip-otpc.c:mchp_otpc_read() {
    ...
    packet =3D mchp_otpc_id_to_packet(otpc, off / 4);
    if (!packet)
        return -EINVAL;
    ...
}

Passing `0x41435354` results in calculating an enormous packet ID
(`0x1050CD15`), which exceeds the maximum number of initialized packets.
Will this cause `mchp_otpc_id_to_packet()` to return NULL and the read to
always fail with -EINVAL?

> +            };
> +        };
> +    };
> +
>  ...

[Severity: Critical]
Does this code trigger an invalid memory access on the error path due to
incorrect usage of cleanup.h with ERR_PTR?

drivers/iio/adc/at91-sama5d2_adc.c:DEFINE_FREE(nvmem_cell_put)
    DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (_T) nvmem_cell_put=
(_T))

If the optional `temperature_calib` nvmem cell is missing, `nvmem_cell_get(=
)`
returns `ERR_PTR(-ENOENT)`. The error path returns early, triggering
`__free(nvmem_cell_put)`:

drivers/iio/adc/at91-sama5d2_adc.c:at91_adc_temp_sensor_init() {
    ...
	struct nvmem_cell *temp_calib __free(nvmem_cell_put) =3D
		nvmem_cell_get(dev, "temperature_calib");
	if (IS_ERR(temp_calib)) {
		if (PTR_ERR(temp_calib) !=3D -ENOENT)
			dev_err(dev, "Failed to get temperature_calib cell!\n");
		return PTR_ERR(temp_calib);
	}
    ...
}

Since the error pointer evaluates to true (not NULL), it is passed directly
to `nvmem_cell_put()`, which unconditionally dereferences `cell->entry`,
causing an invalid memory access.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727122633.1174=
35-1-varshini.rajendran@microchip.com?part=3D7
