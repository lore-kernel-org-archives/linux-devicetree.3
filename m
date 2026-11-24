Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561031;
	b=GQMC1ou7y4ePyrbhxZOkfniNo9fT4jzQ1K1m2ZPwhNX1myXxWFiSS+iNTndmpKp13z8l
	 4ds43T7Mz2QNoH/Jgits1/wcGp/Yqv7e22xAp2llvZweYZUucwxLet1avhPmrMbuI/hyH
	 +mgNCbIIpYA0n+s5MAcs1Ql+exiJ8P5viiwq7r5WTdn6u4/CULwiP2fzEEENSI4+nmP1Y
	 tbj0LHFwMBDsZZ+k0gsa47DxATScagVrp3U6yVa5/iEkRsrUwdWs/+vE5+Tv2ce/U4AsJ
	 dzSOt2hDUavJYSJGuOWVyWKMs4KSIXRYSa12Uub5idcDhYv/7vCqRH+k1tqqOycJ26A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561031;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KpRE3CBpJv/pWgohS3D/8H0oDOITIaYId10Gw2caMzU=;
	b=i8NskOilIchil4N5QP0sEu+2t6R4CHzPXS8XRkJ7WZwwdmATrUka/8Q7uO7jr9GM2nUp
	 sGLIKfEsYvA8Dmhvx1tkcwdJqJ2wg5y0n++atAmLz7zT/5Jxowa6cfmI55ILUxMcDXn4o
	 7LIg1F30iS4sWAcf777Mfdo4aH7PG4jjjR2gyfZ0VgXl9CTXCSdnXxUhwSvdzacTWgc4b
	 O+5LLJRdSKDY6kfOQUac5XGSlkDYWwoCQEcuvkzWbRsB9VjgiLLllGiI2gtfK30mhbKyv
	 y0YCpz+D9XK+BLPjg5YJpD6RU9gHKwhZz87fDdQo7byyYEjWMGz94AuvcfKNcr4WZnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjZOyLoi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F32606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjZOyLoi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CFF1F000D8;
	Tue, 24 Nov 2026 22:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795561030;
	bh=KpRE3CBpJv/pWgohS3D/8H0oDOITIaYId10Gw2caMzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YjZOyLoiDqRYwtHLhjxZZ0pL6UNzQETLK+eBLNjVUuHxojYTXDIWhpDj+4+U1ZGNQ
	 Ce4yAEu5enFJs1gZ79xhVBrisxzCWSelfIa/pn25qhiXGWKfUkUda+YaQUEoYbuFJh
	 ry45J3obJzgMAUKl9PaFJD0408yjOr/9G3mg+vo5CXfDSJe1NwcbwKzZvDA0YzLG/L
	 +T029gB+neOhPLz1h3QSTHnz1ffX+/m/MJmqidgtMz0b3uPOACt3sAI8D++ZwPF8F1
	 LYcreS1tCTWgbl47zkQV7RarJhh5gQywvWgvHcjMKbBJR7njt801eLth9lx5PGbGKZ
	 xxck4iXZGm9EA==
Message-ID: <sashiko-outbox-232181@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261124224318.227478-2-ansuelsmth@gmail.com>
References: <20261124224318.227478-1-ansuelsmth@gmail.com>
 <20261124224318.227478-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 22:57:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: phy: airoha: single 4-byte registers modeled as
  reg blocks
--

commit 4195ba1ead4d27d20beddf043b1dfb9d83d460c7
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY

This commit adds the Device Tree binding schema for the Airoha AN7583
Gen3 PCIe PHY.

> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen=
3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-=
phy.yaml
> new file mode 100644
> index 0000000000000..a8ec5ac781ccc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.y=
aml
> @@ -0,0 +1,65 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: airoha,an7583-pcie-gen3-phy
> +
> +  reg:
> +    items:
> +      - description: PCIE G3 analog base address
> +      - description: PCIE G3 PMA base address
> +      - description: PCIE detection time base address
> +      - description: PCIE Rx AEQ base address
> +
> +  reg-names:
> +    items:
> +      - const: g3-ana
> +      - const: g3-pma
> +      - const: xr-dtime
> +      - const: rx-aeq
[ ... ]
> +    phy@1fc7f000 {
> +        compatible =3D "airoha,an7583-pcie-gen3-phy";
> +        reg =3D <0x1fc7f000 0x1000>,
> +              <0x1fc7e000 0x1000>,
> +              <0x1fc30044 0x4>,
> +              <0x1fc35030 0x4>;
> +        reg-names =3D "g3-ana", "g3-pma",
> +                    "xr-dtime", "rx-aeq";

[Severity: Medium]
As reported by Krzysztof Kozlowski on v2 [1], should xr-dtime and rx-aeq
describe the enclosing PEXTP register block(s) instead of individual
4-byte registers?

In the companion driver header drivers/phy/airoha/phy-an7583-pcie-regs.h
(added in commit "phy: airoha: add support for AN7583 Gen3 PCIe PHY
driver"), 0x1fc30044 and 0x1fc35030 correspond to REG_PCIE_PEXTP_DIG_GLB44
(offset 0x44 in PEXTP_DIG_GLB at 0x1fc30000) and
REG_PCIE_PEXTP_DIG_LN_RX30 (offset 0x30 in PEXTP_DIG_LN_RX at
0x1fc35000).  Binding two single 4-byte registers as separate reg
regions locks the DT ABI to the registers currently touched by the driver
and prevents accessing any other PEXTP digital global or lane RX
registers without changing the binding.

[1] https://lore.kernel.org/r/20260831-elastic-turquoise-puma-f032fc@quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124224318.2274=
78-1-ansuelsmth@gmail.com?part=3D1
