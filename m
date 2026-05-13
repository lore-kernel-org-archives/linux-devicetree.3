Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF127083C
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778631508; cv=none; b=RYjregTrVgqTVo3OBF5FibGJUZwXTtDkaloGfwaftLJioOh63f+P4Wj3G+N56kiuw65ixInzqWo5CL1Q7iuO/sXySxLOFkfMbtGE2YHFIHanB4Ffu2tLx0yVi24D4BlNRq+mh2gZ35hdSFwOxuhLTidqzUdKWj5B62P/oIe3WB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778631508; c=relaxed/simple;
	bh=/wysMBoxn/JZG8PFW1EcxBwvHpTzVch326O1oqlGASg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vD9MpAgT81fdkyCLEQ+TRNKfHFx8zUBftE6EsDtDicDWfTed61nxu1a6y0xAx+9WH+FUUprK5z3tJeRiL+9aV4gzEu4n1zeNrrz7KcjqloQyraFVFQt27voWmfx9qHXbHG/rc8qezllHEgwwLfFh5rx6UT00T5XFMPdXlqKzxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbUXUv1Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbUXUv1Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B4DC2BCB0;
	Wed, 13 May 2026 00:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778631508;
	bh=/wysMBoxn/JZG8PFW1EcxBwvHpTzVch326O1oqlGASg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UbUXUv1Qxpk0JBOUOBU/DHg2K0tJulEccLsOGVmLBgJUpto2XEDqpJt8Km5dcoupq
	 SGODwBiviaED4gU6fLSo8cZI7hSs+JZWc4YXRP/7u46vTwZHhdoeYbGr6TuigeEoIn
	 tf/cFfascEjCs97hUhBUtn6JIObWJYKHqSjDnTuN2hLf6Gq8/1z358dfCexuqI8iYc
	 Kq55sfgnYTRD6rhCm5KvISRyjOgne251MT5KX96xX+cq1o56hbMsxm6tZ9JrMxY57C
	 sC72p/Dp0PDUNGlerS+9MCg5Wnpl7ygUaJwG+AruFwP/gfx1Ai89qqVaepIBuXhYVR
	 2D7IVDQ/ZqIoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/3] dt-bindings: dpll: add SiTime SiT9531x
 clock generator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <rouhi.ali@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511211453.20671-1-arouhi@sitime.com>
References: <20260511211453.20671-1-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 00:18:27 +0000
Message-Id: <20260513001828.44B4DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The schema omits the standard DPLL schema reference and uses `addi=
tionalProperties: false`, preventing the documentation of hardware wiring.
- [Low] The device node name in the examples violates the standard DPLL sch=
ema naming conventions.
--

commit 88ed321f90ac52e086a07eae925ac22020338107
Author: Ali Rouhi <rouhi.ali@gmail.com>

dt-bindings: dpll: add SiTime SiT9531x clock generator

This commit adds device tree binding documentation for the SiTime SiT95316
and SiT95317 DPLL clock generators.

> diff --git a/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml =
b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
> new file mode 100644
> index 0000000000000..0b05f0de65b9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml

[ ... ]

> required:
>   - compatible
>   - reg
>=20
> additionalProperties: false

The commit message notes the device tree describes the hardware wiring
for the inputs and outputs, and the driver parses standard DPLL properties
such as dpll-types, input-pins, and output-pins.

Should this schema include a reference to /schemas/dpll/dpll-device.yaml#
and use unevaluatedProperties: false instead? Without this, schema
validation will reject boards that configure the required DPLL wiring.

>=20
> examples:
>   - |
>     i2c {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>=20
>         clock-generator@68 {

This isn't a bug, but the node name clock-generator@68 does not follow
the standard DPLL naming convention.=20

The core DPLL schema enforces the pattern ^dpll(@.*)?$. Could the node
names in these examples be updated to match the standard dpll pattern?

>             compatible =3D "sitime,sit95317";
>             reg =3D <0x68>;
>         };

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511211453.2067=
1-1-arouhi@sitime.com?part=3D2
