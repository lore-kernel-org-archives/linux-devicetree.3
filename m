Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23BA38911B
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786878731; cv=none; b=WSp8NQ8RaoNGqDsDF4Qd7UiT7LZMr3pAuE/m0tWgGQ027ObDLxIhMn7NLZKUbNy8WF7/r76RuywW8OYNSHTdd8ixdP6xbNxdhgm0+RhtHZ5eg/p9VNXVeCt0Au+SheEwT7y1guAy4NZhCJNFkkhhbRPm5UGCWZEgpAacpgraSbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786878731; c=relaxed/simple;
	bh=WhPsm+38Rcwe0+KLJlSDHc33Z/52pXWczkKEABnuzEc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MJ7Z58yFS4eCu7eC1g7RzEI/gr0ro1Fryc0Lw95hI8N/wvs9cciwShXZOTGlmgXTwag9Ymws9BLz6fBXsul8lqn8RE0DGrOQ8QkUIRd2O2S1voOgaa4FXwYbf7NxNfVerEnAGkp1c32vUjRCnLzI4UcSmSm3ZYR8dMatW6A9CWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9649fL6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9649fL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2441D1F000E9;
	Sun, 16 Aug 2026 11:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786878730;
	bh=qiZtiCXc3ZjObe074Gzh+AtKzWB6ww9YZKClfu6Tz/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I9649fL6SwVxqrFzKt7uS464wQ93/YfUVUHFXlKI5I/aSvPP0Jip7Ho9An85rOXsI
	 5JtsSxqBN3LN79RCltLFKMVmzv19ptftpyBCn0v/VMc32OHka12ZFYEN+sady6kUCk
	 m1ZQip3FDuP+fBGQZN3eOIqe2TsKYvD9JBrB+PjotLqg9skfoUJKGKCtcPCZJEaXn0
	 CySxHZ+3e1oDpPQBvU0xqdTXZj5XQSO/l3NVxg2cXeY0+HoCYd0ltpsaeYLkTx0fLG
	 o+gqA1zZdw632cWtp4K9F106YAdJ3gmw8ii8DAesJk4l3uAyk/XV7b9konAIsNr8X6
	 AqpcnGQHT8xNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: add ASRock X470D4U BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tan Siewert" <tan@siewert.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816-ts-x470d4u-v4-1-cd08e78287ec@siewert.io>
References: <20260816-ts-x470d4u-v4-0-cd08e78287ec@siewert.io>
 <20260816-ts-x470d4u-v4-1-cd08e78287ec@siewert.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 11:12:09 +0000
Message-Id: <20260816111210.2441D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The invalid compatible string `asrock,x470d4u-data64-bmc` is improp=
erly added to the dt-bindings UAPI.
--

--- Patch [1]: [PATCH v4 1/2] dt-bindings: arm: aspeed: add ASRock X470D4U =
BMC ---
commit d0559c4cf1eefd31825e79b49e2443b883b69be6
Author: Tan Siewert <tan@siewert.io>

dt-bindings: arm: aspeed: add ASRock X470D4U BMC

This commit documents ASRock's X470D4U BMC board compatibles in the Aspeed
device tree binding schema.

> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -40,6 +40,8 @@ properties:
>                - asrock,e3c256d4i-bmc
>                - asrock,romed8hm3-bmc
>                - asrock,spc621d8hm3-bmc
> +              - asrock,x470d4u-bmc
> +              - asrock,x470d4u-data64-bmc

[Severity: Low]
Is this compatible string factually correct for ASRock hardware?

The "-data64" suffix is typically used exclusively by Facebook/Meta hardware
to denote a specific 64MB SPI NOR flash layout in OpenBMC (e.g.,
"facebook,wedge400-data64-bmc").

Could this pollute the stable UAPI/dt-binding schema with a fictitious
device configuration for standard ASRock X470D4U hardware?

>                - asrock,x570d4u-bmc
>                - bytedance,g220a-bmc
>                - facebook,cmm-bmc

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-ts-x470d4u=
-v4-0-cd08e78287ec@siewert.io?part=3D1
