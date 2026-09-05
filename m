Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE0B1D63E4
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611790; cv=none; b=pd7hG/Ea7DoiB5ZFuSgZMsNHOXQaTh7VmMjY76EcrlnRPUbSnCXAZwu99zB+D1gfuH7dWGV19Zfe4rIozeTvYC0NRVetMSAlj/QcPuWFbovy3RfCqkg5EKvLwcTE4mvFMAy5CSje/LYeL1IhsF5+D+YQ+jR/xxQMkhzp/6rc/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611790; c=relaxed/simple;
	bh=rSa5ftihswLHR7Rc9u1SOzIvkrrjDZiCDa1Xb7VpYfs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dqVM/bjG6nBVtsS2KLu+N+R9HsNDMmoHmWbB69MBUinuxit5iCdbqNgN/Dxuztv74HvTX9zDEV/FD+/m+iMkoMZAZyjiQpgtXifYHX+YkqBQ4vunM6mjqdA1uR7bWJ/esYQ6ihYOJuLpHWlvRB7HFrZkhUbZDgcGCxI5V/pUwNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVCK8hiB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVCK8hiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF03E1F00A3D;
	Sat,  5 Sep 2026 12:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788611789;
	bh=o3MCRJ+qqYJneNOG7AKq6Cvo6Ewwxg/vuPm7YRbYf9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kVCK8hiBBleXAUxDNFCrLHxrN3D4LXBNNfSiNVzp2ZtFMIYcLZx/IAfxWnbWKBi8d
	 GsGWRrzw+pghHLW/wCKuS5QFQgCLJf8qP+NlMuA1uLXzkaVRbHG90n0MKZPsvN4u7U
	 h1LZZVaP3lIqC1uiAicU9+K4oO1As3Th6AxbFhhjpIhrVzGogmg7CUBm/K5cIWJVHg
	 PRRWhSySDR0Wk/yEM0WCrSPL6TQ1PSOc39AwB3VbmeTmewJr853/4NURDwdvH9N6eV
	 bCzdt36sENiLx84LppbHk4076l9svBSfjRSo2vEPnCh1xnbIhIUsdPH71A1XC/U0GE
	 oREQZjJdMJeyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 1/3] dt-bindings: net: wiznet,w5100: convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-wiznet-link-gpio-v7-1-69f01b70c96f@marmottus.net>
References: <20260904-wiznet-link-gpio-v7-0-69f01b70c96f@marmottus.net>
 <20260904-wiznet-link-gpio-v7-1-69f01b70c96f@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 12:36:28 +0000
Message-Id: <20260905123628.AF03E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mismatch between v5 changelog claim and actual implementation regar=
ding the `interrupts` property.
--

commit 71f148f5cb00ff21bcdd03a6c89a26a42be35836
Author: Arthur Crepin Leblond <arthur@marmottus.net>

dt-bindings: net: wiznet,w5100: convert to DT schema

This commit converts the Wiznet w5x00 SPI Ethernet controller binding from
plain text to DT schema.

> ---
> v6:
>  - Put back the reviewed by tag from Krzysztof Kozlowski from v4
>=20
> v5:
>  - Remove gpio/gpio.h include from DT example
>  - Make the DT interrupts property dynamic from the compatible one
>  - Fix DT bindings errors

[ ... ]

> diff --git a/Documentation/devicetree/bindings/net/wiznet,w5100.yaml b/Do=
cumentation/devicetree/bindings/net/wiznet,w5100.yaml
> new file mode 100644
> index 0000000000000..601d828bae927
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wiznet,w5100.yaml

[ ... ]

> +  spi-max-frequency:
> +    description:
> +      According to the w5500 datasheet, the chip allows a maximum of 80 =
MHz,
> +      however, board designs may need to limit this value.
> +    maximum: 80000000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

[Severity: Low]
The v5 changelog notes mention making the interrupts property dynamic based=
 on
the compatible string, but it remains unconditionally required here in the
global required block.

Is the changelog description out of date, or was the dynamic property logic
unintentionally dropped from the schema during a rebase?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-wiznet-lin=
k-gpio-v7-0-69f01b70c96f@marmottus.net?part=3D1
