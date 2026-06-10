Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D00D40D564
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080008; cv=none; b=dhK6w8fbHAeSRLAsneXERxWYGyNgaosAOrqxqXAUO4Dd6frucuaPLF4ZKcEQ8A4QXfd67thD3qBPOJt6N6jTJD1y48LnkFzTZj4HkMUsnwKfbtHPz+xlfTztMk2233THp2H8r5w1nAmAoxY0LIQdBaaCKmes3A+2P1gG+VpWR74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080008; c=relaxed/simple;
	bh=hh9kNn4NnP+zGgv6rIG95xT273NtDx4KJbMFh3H+Hlo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ksi1uUmkpxbl7n0nhgPvUIdPtGFPeY/sWbinN5hwK4iJCwE4NUHYFWubmmCTTnSCnOT0rI42gRzauZhiACozzBDAP+CWJCBZWShyfRbQf2pdEZz5dWI7IdzidgNDUSrhPy29Uxs/k0Qogp0M7Ifbmfmde73xKpeSlday7FDjolc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mD2+nA45; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mD2+nA45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29F71F00893;
	Wed, 10 Jun 2026 08:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781080006;
	bh=ha6ohkISed51f8pj3VBBUIoEau06A9qj0/TufibD094=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mD2+nA452B0XneniOi6eQ/qtRVugfdgxpdmFk25mXOEoFN/FrH71nDZGhfOIYILFf
	 r3cpIo3rAnZGHsaRIY4Caq30evBJ1C2tkvqaxXct2s/lJoSAfwerjNra0Dz/NcZdu0
	 4w/DDBEORj93vA/2n8MA5HyhFBpwpvGtpmV/9ARwbQkpiKbrbRiJTaIujRU12cuI7l
	 EQBNbIX8sVlv2Q0NoslGMmA9d2k59cM3G27CDxUNljYcqu4YoJFApJ9Huyxa4AYig4
	 w6caQh6xokOYZuH7ODeqleWX/sla3s+InVkQsIS49NyZjdDFXJNxLZq+z00EgY8goF
	 OyhCtlk4LreyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/3] dt-bindings: timer: mips,p8700-gcru
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksa Paunovic via B4 Relay" <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610-riscv-time-mmio-v8-1-a865206675c6@htecgroup.com>
References: <20260610-riscv-time-mmio-v8-1-a865206675c6@htecgroup.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:26:46 +0000
Message-Id: <20260610082646.B29F71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mismatch between the node's unit-address and the first address in i=
ts 'reg' property in the device tree example.
--

commit 28ad318962744fd052dc7a14265d2214d613bc60
Author: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

dt-bindings: timer: mips,p8700-gcru

Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
platforms. The GCR.U memory region contains shadow copies of the RISC-V
mtime register and the hrtime Global Configuration Register.

> diff --git a/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml=
 b/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml
> new file mode 100644
> index 0000000000000..3498255762cce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml

[ ... ]

> +examples:
> +  - |
> +    timer@1617f000 {
> +        compatible =3D "mips,p8700-gcru";
> +        reg =3D <0x1617f050 0x8>,

[Severity: Low]
Does the unit-address in the node name (1617f000) need to exactly match the=
=20
first address specified in the reg property (1617f050)? This mismatch will=
=20
likely trigger a unit_address_vs_reg warning during dt_binding_check.

> +              <0x1617f090 0x8>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-riscv-time=
-mmio-v8-0-a865206675c6@htecgroup.com?part=3D1
