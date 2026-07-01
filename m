Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2C0481659
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912779; cv=none; b=seBiH6nFxnZ1w/FtTUL6itxfcRi+767IEtszmeWKrmsFjMHAt0dSvkwrCelaMDHDmQs8DQ+z4QqahB7Ay18f7ar2HAHOAIQD2Oiaoq6fXNsZnVwwCdHnFtpd9AkPxSEY7RIMSuLCfy5Kv1J4b/fgB3Qwu0BfoiaFVwfYUkNaEM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912779; c=relaxed/simple;
	bh=w9oZqnAV5yymsF2qeLyCxQswqDvmsRY2flJcZYB87L0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gtY00F3YM6RJ2W5xOIWnKgvRCkQ60dxsjjHFLdaQzURwXKuKh7gZdF9FWrvU3GApZfq6XYxxnYSkfxQUFDAhNSRAx1afsN14PqZvMkRKVsC2vCZsek7rX8wHM4d/Ad7IUrCnpl/daNX/OCeUo5S6SPYjBe8+GDn6IYViKOM4rmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NX7ndozU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NX7ndozU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068AA1F000E9;
	Wed,  1 Jul 2026 13:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782912778;
	bh=/Qmhn00wqR0JHfT8xe2TDDH1YbFF43yp/QmMygYxZVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NX7ndozU8hrNT5oXfCwdi0tV+DapMOs3UnjVFzvayNM4tjUDSzcuCZvPPlypG5iST
	 aF96wtHnqqJd4JFvtwhS1G4+0WXAWHRPpjCtVfFw8/KpcN41pK/C+fZ7AdnGVWDSRq
	 Bsr56nRBa/BGZKqtrq5SqGEfxqhYn9GIkiL1JDHCYaX/M27Tq2y9UaAHAmp/k71pMb
	 1gGwKV3HXO4IbwbvJYEwrSe40LpuqD4G6fburLSUvkQB0tklh73P0dtxcCgNp5/Ltr
	 oQBV+mBgByCdtV2u+GE9QLzEMj/2alJSNfGzsMsXwWZCJoXq5XecvV0SL70ttKa6p5
	 aOHmJS4tw7zOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: firmware: add mbedtee,rpc binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xing Loong" <xing.xl.loong@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260701132514.186953-3-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
 <20260701132514.186953-3-xing.xl.loong@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 13:32:57 +0000
Message-Id: <20260701133258.068AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `maxItems` constraint for the `interrupts` property.
--

commit ad51309fadfb753784caac099277a6b19357c757
Author: Xing Loong <xing.xl.loong@gmail.com>

dt-bindings: firmware: add mbedtee,rpc binding

This commit adds the YAML devicetree binding for the MbedTEE Trusted Execut=
ion
Environment driver. It describes the shared-memory regions used for RPC
communication between the Linux REE driver and MbedTEE OS on ARM/AArch64 and
RISC-V platforms.

> diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml =
b/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
> new file mode 100644
> index 0000000000000..08ae255d32c2a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml

[ ... ]

> +properties:
> +  $nodename:
> +    const: mbedtee
> +
> +  compatible:
> +    const: mbedtee,rpc
> +
> +  interrupts:
> +    description:
> +      GIC interrupt used by the TEE to notify the REE of pending RPC
> +      responses (ARM/AArch64 only). Not present on RISC-V platforms which
> +      use IMSIC platform MSI interrupts allocated dynamically at runtime.

[Severity: Low]
Does this property need a maxItems constraint?=20

Without maxItems: 1, device tree validation will not catch configurations t=
hat
accidentally supply multiple interrupts.

> +
> +  msi-parent:
> +    maxItems: 1
> +    description:
> +      IMSIC MSI controller used by the Linux driver to allocate the

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701132514.1869=
53-1-xing.xl.loong@gmail.com?part=3D2
