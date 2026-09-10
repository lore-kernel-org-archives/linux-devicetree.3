Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE4A3DCD95
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030875; cv=none; b=mebvBNLpn7cE+suu9T7dnHjsbPeGEIpD73qxh0F5p4gwommD52nVPZ2hAxG52bABYRS3xxy6Zq7CVKeUQI/vKWzgbhnvaSTDWwqLE0QwV6VXXaQWJtWP59fKIeyihH9S/SYUjk4JNy9oCBTwnADowcUFymNe+w2u4RoPsSD995I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030875; c=relaxed/simple;
	bh=pEXZ3F/N7mrUrVtNTSn1xhcDMAoXGzeg+2a19ajBOVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RGJF1URw3eBi85IMCZXb4oZWabYGF/7NIbSCqJgkday8sAhMhtNm4rlCer9LiRIhjE1A32vQlS+KRbrd86PxWouQTIpJqz6NkN7mhPPGeCgoGrxC3Hyeorwm0Dsd8IBfkSsn71yzr+Y8BpcrBJ1XFgWKoVnp5glOKW66bBZcwRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQU5GUSR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQU5GUSR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AA11F0089C;
	Thu, 10 Sep 2026 09:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030863;
	bh=1rBlXhR0HfVwzl/YqazqynZU63cCguhxLyhTVJN15go=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQU5GUSRTUZ+3YQURSxhTHCZckgjf/idIy5wPGmMR8YGFnRgmzyz1ZPROTKSLGhz6
	 MNWs0O/PrTvRprkdryAf8/YdzO0/hD6uSjhbARv0pAe963y9wx8PcX6qzZCb5OSa7B
	 sObkdI4RGr7NdF7aI3WtcWg8zDztoOX24dfegkaoTmYYDUz11l9ixbEDaHP9rBUw0M
	 rgkrYIvGbb1193SMXpbJ4xR2yDE7eU5Avvis0VfY+KS05B39I4nNNxcWqLRmLkY35R
	 hMfmiwluJhdkQJb8lQe/kyzm6TjmfGTOe/UPmBsF6PyjEU4MFmJSSErUsdBZcuNqb6
	 BnS1xKRiO1MQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add MPS MPQ4210
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260910-mpq4210-regulator-v1-1-d37e208dfc8d@vaisala.com>
References: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
 <20260910-mpq4210-regulator-v1-1-d37e208dfc8d@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:01:03 +0000
Message-Id: <20260910090103.98AA11F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `mps,fb-voltage-divider` property schema omits `minItems: 2` or=
 an explicit `items` list, allowing incomplete arrays to pass validation.
--

commit 9d4fa47cff6967eb8bf59f67ec44cae66abc946a
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

regulator: dt-bindings: Add MPS MPQ4210

This commit introduces a new device tree binding for the MPQ4210
buck-boost controller. It specifies standard regulator properties and
adds the mps,fb-voltage-divider property to scale reference voltages.

> diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml=
 b/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
> new file mode 100644
> index 0000000000000..e9e7a87e7533d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml

[ ... ]

> +  mps,fb-voltage-divider:
> +    description: An array of two integers containing the resistor values=
 R1
> +      and R2 of the output feedback voltage divider in ohms.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 2

[Severity: Low]
Does this schema allow incomplete arrays to pass validation?

The property description mentions an array of two integers for R1 and R2,
but without minItems: 2 or an explicit items list, a device tree node with
only one element could silently pass dt_binding_check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-mpq4210-re=
gulator-v1-0-d37e208dfc8d@vaisala.com?part=3D1
