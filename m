Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A5E12D1F1
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778649447; cv=none; b=LNa2k9yzlQitfEjlkIxRsDS5HLaGFYIijMG1QP2sWQ+piVgekrCAottbr25EcNshAWT22lfi7pV5VMuSU/oxQq1fvz2FqkM+YHixh3B3OYA+VNV8P3ldU2kkYSAucwec5JHMudh7n76uMNzcaYGnugg0hYYzt821GWZKH5eNM04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778649447; c=relaxed/simple;
	bh=/n6hLF4a+7TfqnLQeFG97FnRZJALeK/1yBhTklwNiIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BlSTplb/YMejI30hekj+hzUC8K3V3EMWPnr5lRJmRvJvTEuu5IdJWvEzPICy6ms2l3rQvn6dwWGAE8R2ZINadgiHYZImAZcxrLcTUA3eexqpwuMBbdUYZNNfdGHdDQ+YKHGIrFNo0J3VAaEZKmD6hb1QnJluOllI8VbUbY9mR9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1KZfZWp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1KZfZWp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0571AC2BCB7;
	Wed, 13 May 2026 05:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778649447;
	bh=/n6hLF4a+7TfqnLQeFG97FnRZJALeK/1yBhTklwNiIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=c1KZfZWpBmkWDk/7DIboGCrJ3nsigllMmdJsgP3mInQgK5kYOktoggUv7RGizyZNm
	 o6McO03BhdzCzlpV7U8Y1EAh8e1JYg5aqIhvUrUgssAodPG1xGSqG+xpQCbXXi87JO
	 gv7TagdJ+7JOujNqOLEAIN89Xom7yOB3YS7c0HLDZYNUFhAl5tn1+JJCZl9l/RL7jJ
	 +p/wRZ4QVrGe7Adqq4aaKD/6rJfupojYnb6q34Z2blHTDB2nztb30uwJcvmlvI7li8
	 zQMwRixYh19vG4quGwgpg3EWYSqmKDGBvGOE1Nk8WDrrpyK3tD9vw+ZaZuweiQ3mfn
	 duUHWe9ZVlKaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: Add bindings for StarFive JHB100
 SoC trng controller.
Reply-To: sashiko-reviews@lists.linux.dev
To: lianfeng.ouyang <lianfeng.ouyang@starfivetech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512062404.4540-2-lianfeng.ouyang@starfivetech.com>
References: <20260512062404.4540-2-lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 05:17:26 +0000
Message-Id: <20260513051727.0571AC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The commit silently removes the `starfive,jh8100-trng` compati=
ble string, breaking backward ABI compatibility.
- [High] The schema enforces an invalid device tree compatible array order =
(generic fallback before specific device) for the new JHB100 SoC.
--

commit eafedaf1268d7bf5cd0934352607dcf457417047
Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>

dt-bindings: Add bindings for StarFive JHB100 SoC trng controller.

This commit adds device tree bindings for the TRNG controller on the StarFi=
ve
JHB100 SoC.

> diff --git a/Documentation/devicetree/bindings/rng/starfive,jh7110-trng.y=
aml b/Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
> index 4639247e9e510..11346d77b2f6d 100644
> --- a/Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
> +++ b/Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
> @@ -13,8 +13,8 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: starfive,jh8100-trng

Does this break backward ABI compatibility?

Device tree bindings are considered kernel ABI, and removing this line drops
support for any existing device trees that use the starfive,jh8100-trng
compatible string. The commit message doesn't document or justify the remov=
al
of the JH8100 support.

>            - const: starfive,jh7110-trng
> +          - const: starfive,jhb100-trng

Does this enforce an invalid device tree compatible array order?

In YAML binding schemas, the items list enforces the exact sequence require=
d in
the device tree source. By placing starfive,jh7110-trng before
starfive,jhb100-trng, this sequence puts the generic fallback before the
specific hardware variant.

This violates the device tree specification which mandates that the most
specific hardware match must come first.

To support both variants falling back to jh7110, would it be better to use
an enum for the first item containing both specific strings, followed by the
fallback constant?

>        - const: starfive,jh7110-trng

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512062404.4540=
-1-lianfeng.ouyang@starfivetech.com?part=3D1
