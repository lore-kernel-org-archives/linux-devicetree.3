Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E5547127B
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946777; cv=none; b=st0gjWK9f8P2aSvbClSu55zBixF4ifVpNmXAG/a8SWMoqgWSk8+1daSrgYCcqJVMtMrGvVeGJk3RDfF8c4VT5R6qeJ6ysoGN/ewCFdXNhSxwkFAupqKRp+2sy0yVnQB+MD4QtYuWYqJlVoJFbcXAAVjfdWl5Y6f1XBJ9k9JMLk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946777; c=relaxed/simple;
	bh=NS8GaBZPF0OmwzZ2yGP7BUPyMHD32JrL93VGaJ1KJ8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kA46FlIZb6jokq6x0fMaRyL1UlSmcaGCSoNqYwyrVqJYOmlV0mRn+UtYgApVC9HOT/VBM+gWvEz02krxwGJBREJuQkumqcgn3r28qXUHkXdMjRV7t9Pt5KbuWWj67WohQs6kxBeP151AiNamM1y0BiRtYzC2IPdAB5cf+lB6f+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvUkF3DU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvUkF3DU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F8D1F00AC4;
	Wed,  9 Sep 2026 09:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788946766;
	bh=tRPtJzoa4c8qDgpH/zimyvZ6AcJTpVbYxVoV4PuKeM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mvUkF3DUxqVWzGWEqtcKtgGx0IxVT4e4ymah1tUa+Lga2sCOcntvThRhe3F45SpY2
	 aLgHNdhr0+V0lFi0BeW5NBOUZEmKKSmWJE89YpCPNoXlL4nhWtLYMBsl4ceR08pub0
	 nbhclwvd0XcKXPiwTE/mqhEKyTWViwjoC5LB/ywNKcFDyUwC0WOZ+ojRAAQusSfx6+
	 ecbQAO6rzqjiKZ7RUuzUO034A+9Q1ZZET4B3ES8i3nWX5nuk9uSaChKuLUhz+LBwCB
	 MJGeO7nGvyfCEx3opRleG6jaFWXzDzDx7utKOMGjAv73EKAD+v/qVoaDNfXbX6rkHq
	 mLbn04WnBFLXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 1/4] dt-bindings: net: dsa: microchip: Add
 KSZ8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260908-ks8995-to-ksz8-v10-1-7379239eb65f@kernel.org>
References: <20260908-ks8995-to-ksz8-v10-0-7379239eb65f@kernel.org>
 <20260908-ks8995-to-ksz8-v10-1-7379239eb65f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:39:25 +0000
Message-Id: <20260909093926.34F8D1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added compatible string 'microchip,ksz8995xa' (a 5-port s=
witch) is incorrectly added to an exclusion list meant for 3-port switches,=
 bypassing generic DSA port validation.
--

commit 2397d2b8fd3c47150c21e2d07ecb537ee6972ff6
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: net: dsa: microchip: Add KSZ8995XA

This commit adds a new compatible string for the KSZ8995XA 5-port switch. It
updates the main properties list and an if-then conditional block in the
device tree binding schema.

> diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml=
 b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
> index 8d4a3a9a33fcc..ed39530b6cbbb 100644
> --- a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
[ ... ]
> @@ -122,6 +123,7 @@ allOf:
>              enum:
>                - microchip,ksz8863
>                - microchip,ksz8873
> +              - microchip,ksz8995xa

[Severity: Low]
Does adding this 5-port switch to this specific enum block bypass generic
DSA port validation?

Since this list routes these specific compatible strings to the 'else' bran=
ch
which enforces a 3-port maximum limit, adding the KSZ8995XA here appears to
apply 3-port validation rules to a 5-port switch.

This could lead to incomplete schema evaluation for ports 3 and 4, either
allowing invalid configurations to silently pass or causing valid
configurations to fail validation when running dt_binding_check.

>      then:
>        $ref: dsa.yaml#/$defs/ethernet-ports
>      else:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-ks8995-to-=
ksz8-v10-0-7379239eb65f@kernel.org?part=3D1
