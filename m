Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BFD3F86EB
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784309627; cv=none; b=Fec39/Iem0NuGdPdA1Nkeit5tgRFkMenVP7sDq9L5/bKefQnbYV+NULQrB0/xHlE3E5L6nAidQAZczTf9ru2jfaljcCD+ibYxj1miPwsNehHzK4C8l9LsgOvKGsVwbSejYfAEV5UiXtT6jHta+bsJA2/UsE/7DzhRY2RCSqTb6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784309627; c=relaxed/simple;
	bh=LO43GylO5z9Qd2Xw+vm4dYMlQDwM0GXOxPDWX2/Kvp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iY3EodzL2e/1m6vNM6m8mFfZcwe0b+5YUbQut/H2Z+uQ8bxWZvkVPlXNcJBsJiKXXQbq1F6TilxVueX6bKCWn6qbDTxSQRbwYxPdsa4s6vGnjAIwwW3aDl8kA3lm6p4EuNWkUzpgvOOpz/jKNWRX9fNHScodnn9GIoja8LvRJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jziyFpmr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jziyFpmr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB8F1F000E9;
	Fri, 17 Jul 2026 17:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784309624;
	bh=eU3NES0xlV3ZbzjV63yNph5XVVq0Un4qVqFOmYpyhfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jziyFpmr3SfMiQQt8z0jgdZR7GjJYfXYxb/9cwWOx9tRHIM3U0T8VjLSQ3PORfhvM
	 CVAbE7ZdAc8yIeB6FdUb8bK3Zqh+uDoGEWqbxgdxfFps5M2HI2y9FoxjZHqVsk1j4b
	 whI9KoDXD8cDaq1w/mIdKznwLepJo/7bjrebvPXVqUvTq0D9PKMsKamyr1H4rnrb6v
	 ih1G51uutYygaZ4IgMyglnlGDinuZ8S20wni3Mv0lNV4cpbtKkjaH+RawBxJ1T4rZI
	 vjI4DQqIVElBP7j5Lf3ZQIuEi+ua2scUIX5s3DOZZvdGAG7rCYjd+c2Kn9v6w70Q3J
	 qUGCKF1tSxjcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: add DAPU Telecom
 DAP8211R(I) PHY binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716173325.653164-2-a.shimko.dev@gmail.com>
References: <20260716173325.653164-1-a.shimko.dev@gmail.com>
 <20260716173325.653164-2-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 17:33:42 +0000
Message-Id: <20260717173343.BAB8F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The vendor prefix 'dapu' (used in the filename 'dapu,dap8211r.yaml'=
 and the property 'dapu,tx-inverted-clk') is not registered in the 'vendor-=
prefixes.yaml' file.
--

--- Patch [1]: [PATCH net-next v3 1/2] dt-bindings: net: add DAPU Telecom D=
AP8211R(I) PHY binding ---
commit 3e68dcf4de91d264592b244d85a077b73ce34c7c
Author: Artem Shimko <a.shimko.dev@gmail.com>

dt-bindings: net: add DAPU Telecom DAP8211R(I) PHY binding

This commit adds device tree binding documentation for the DAPU Telecom
DAP8211R(I) Gigabit Ethernet PHY. It specifies support for RGMII with
configurable TX/RX clock delays and introduces the dapu,tx-inverted-clk
vendor-specific extension.

> diff --git a/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml b/D=
ocumentation/devicetree/bindings/net/dapu,dap8211r.yaml
> new file mode 100644
> index 0000000000000..d4012fa17a1e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml

[ ... ]

> +  tx-internal-delay-ps:
> +    description:
> +      RGMII TX clock delay in picoseconds (0 to maximum).
> +    multipleOf: 150
> +    maximum: 2250
> +    default: 1950
> +
> +  dapu,tx-inverted-clk:

[Severity: Low]
Is the dapu vendor prefix registered in vendor-prefixes.yaml?

Failing to document the dapu prefix in
Documentation/devicetree/bindings/vendor-prefixes.yaml causes standard
device tree validation tools to emit a warning or error about an
undocumented vendor prefix when processing this schema.

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If present, the RGMII TX clock to the MAC is inverted (180 degree
> +      phase shift relative to the data lines). This is a vendor-specific

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716173325.6531=
64-1-a.shimko.dev@gmail.com?part=3D1
