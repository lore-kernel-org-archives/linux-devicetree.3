Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509B495041
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637577; cv=none; b=IEJY/n6lnoIUrFkJZ53afIZKe/KoIc+wav8KZz0645j7esBAXkFWktnTNbre5wgLjMOPodhVZTPaHeDpa6oHz5v2hYm9ISScFg7zzYnd9o/63XzlINGr6TcP5+Ywk28Kf98tgMimkg0GFtampDevuaJuq9qnPY3fPoVoWrvApfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637577; c=relaxed/simple;
	bh=fD3/vFXgvvzSdNqW7fvrrvSHvj0RmzkuXbWK/FDtaTU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=F9CdOQnkbqvJZsZdU1hgbPvrwKxt8hO/uEqb3RbLNmohPPCuzuxFkN68Y4DiMUFopUGwbq3C+y1Md93LDEQ0th68jjWlX5apMB5UvA58aDlJv4Cd+hTJKWTwSKsrxJWr7p7/QUOJ0NJ9U5nMYX66kLSVC9fXFwanZ+r8qYcUZeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiN3qX5f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiN3qX5f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A152C1F000FF;
	Sat, 10 Oct 2026 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637575;
	bh=IjAf6m0/m97/TACyHqDNIHZngGJ8OIOgPsGEt2ZUN/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MiN3qX5fuWdfAtHc4OGZgOVLii96y/XvrJSMeNgqRYQCXIpYTjh8me4Q6mHUIV4wQ
	 oajZnbC6JZL6zMb+LR0Bk30+fogk2m5uI5IxAWB/iURAdqqCR8RFH3h2u8lZW28s4q
	 w5oSeF8tWrZ9rQdYGRFxu07VNhEd0bjcAxXqy535MNO4ta0v8vE7vmM/J/jywsWgpJ
	 1Iek2mT2Tono24PkC7RnRZj6UxwPpJc8ENYQ5FaXr+t2ZmUbUCjC+QhocWc/Kn7LJM
	 c+DaFNaq0NGjpAZwOfhklZfAuD5fDRbjJ9xZw8XG14rIbVINlDBkiVfj4hqgJp5h58
	 +U2qO9I19KCUQ==
Message-ID: <sashiko-outbox-166561@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/24] dt-bindings: net: Add ZTE ZX279128S MDIO
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261010130024.177503-15-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-15-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:06:15 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: mismatched unit address and reg property in example
--

commit d87fe100db3ff2c1a1530b83613444c72717dec8
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

dt-bindings: net: Add ZTE ZX279128S MDIO controller

This commit adds a new device tree binding for the ZTE ZX279128S MDIO
controller. It documents the required properties, including the register
block, clocks, and pin control configurations. An example is provided to
illustrate the node structure with child PHY nodes.

> diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yam=
l b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
> new file mode 100644
> index 0000000000000..49ff7e7b1ad46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/zte,zx279128s-crm.h>
> +
> +    mdio@9a101000 {
[ ... ]
> +        ethernet-phy@8 {
> +            reg =3D <8>;
> +        };
> +
> +        ethernet-phy@10 {
> +            reg =3D <10>;
> +        };

[Severity: Low]
Is there a mismatch between the unit address and the reg property here?

In Device Tree source, unit addresses in node names (like @10) are evaluated
as hexadecimal, while unprefixed integer literals in property values (like
<10>) are evaluated as decimal. This means the unit address evaluates to 16
in decimal, which doesn't match the reg value of 10.

Compiling this example with make dt_binding_check will trigger a
unit_address_vs_reg dtc warning.=20

Should the node be named ethernet-phy@a if decimal 10 is intended, or should
the reg property be updated to reg =3D <0x10> if hexadecimal 16 is intended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D14
