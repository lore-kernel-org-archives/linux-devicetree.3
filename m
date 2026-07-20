Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E0539934B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533417; cv=none; b=kNwCj+c5dgotuzKifyYv897K72+fOc+R7qIJ4dQxpYg6XSbjsusPsQuUGvRni8vd9Fjse5LI5166LCZ4QWehdHUrkbK75vdN2qw+9fWqUpfBRPqEQJUieJIoG0Bg7nt6/fy17UZcX/cHHu/5+p58XzdHs96/ZYltPqv7t9NOUY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533417; c=relaxed/simple;
	bh=ZyN+sy1SalzdpOzo0iwNDubc1ysxjgttasOmwInoZOI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BoXRqfIPPGbJ5YxPyMoB7CNEP1ho9yK1Ia0n+WbcSCA/Ogh0cG7Pxt5zxNfNpK8o9nKtO7srpUkHKx0z2xkaqi/jGMZjB/NVnDIGfRa/OAGbtIdaFSDg4GlBHHOcV7SXNhIAYMj2W53FhPoKsSSulXAKs54JC9uefRpkSHoeFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGepy3gO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGepy3gO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F18B1F000E9;
	Mon, 20 Jul 2026 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784533408;
	bh=gmm3vhVK/eoXr8/4cb+GWd9+j4TO3tlIDB0ZHWDbv6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hGepy3gONjYzxxJnTulCmOlHOEqSCnrTKWsBbq/Iit0tdqVekQe7e63zxqvl6tzv+
	 rfH5Os1kBlC9UVnKSd+jW0fXBqoaE/ImQAmL6MaiN6oP/b31pvM8NgzpXaWrBstRX0
	 UuZYPKFnNL0DqP6hgewKICbmInNuSBxZ98jIZ1v7oZfIEwUGjDj2B7kfqq60MyQfXX
	 zQ2W3WgLFMn0PI/+XGwy1H55upTPh4vGoSeBcUbFamJKlvFeh7eg8DmTzyvVis2lMH
	 gt7FOrNnVpmLfLA0XBGKndiJYfx413CviNOjvDbD6qfj2qJuuc3BF5YM6+FbcH52Uo
	 rqiF+gd6BIAhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: dw: Document missing optional
 core reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
 <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 07:43:27 +0000
Message-Id: <20260720074328.1F18B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The binding schema adds the `resets` property but intentionally om=
its `reset-names`. The driver strictly requires `reset-names =3D "core_rst"=
` to find the reset control, causing it to silently ignore the reset.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: i3c: dw: Document missing option=
al core reset ---
commit 673b06088a9b59875d717db2c9afb56295ac87a9
Author: Shubham Patil <shubhamsanjay.patil@amd.com>

dt-bindings: i3c: dw: Document missing optional core reset

This commit documents an optional core reset property for the DesignWare I3C
master IP. It adds the resets property with a maxItems of 1 to the schema
but explicitly drops the reset-name property.

> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index e803457d3f554..dc7ee38001d6d 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -38,6 +38,9 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  resets:
> +    maxItems: 1
> +

[Severity: High]
Since this schema intentionally omits reset-names, device trees cannot
provide it without breaking schema validation.

However, doesn't the driver explicitly rely on reset-names to find this
reset control?

Looking at dw_i3c_common_probe() in drivers/i3c/master/dw-i3c-master.c:

	master->core_rst =3D devm_reset_control_get_optional_exclusive_deasserted(
					&pdev->dev, "core_rst");

Because this searches for the "core_rst" string in the reset-names
property, won't it fail to find the reset and silently return NULL
without the property being defined in the device tree?

This would turn all subsequent reset operations into no-ops. Should
reset-names be added back to the binding to match the driver's
expectations?

>    power-domains:
>      maxItems: 1
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720073510.1869=
623-1-shubhamsanjay.patil@amd.com?part=3D1
