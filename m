Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D73E1701
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092670; cv=none; b=J0a+kFXmOGWJfUR8DJprYvPYEDDEnaFUFhL4QhQiw4TO5oW7vVEnCC4y53lbChCZLLcpxSJRPFzE4UlQQ4Xt/1WcXxOPJKP9C2Ds25yMsFQxdmLkd5hdj/3gwC8QQsVsQBkWEH4tYX8IHL+nQ+OcuuIMMs/f8m5OVnY7vzbxm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092670; c=relaxed/simple;
	bh=c1gwi+oOAjzd/PdlgL+JEByy8hvn6WB0akyhQ8i3Luw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hVI12MEb8xNz0Z6UuzL9rGwyL+WhJPUoXuxouj0q/WIuS5mqbakANaiwNZKK2oxMigxhMo9IlxlyRxNWI1XWqtUg3xY0nggCfB7kcshIQN3MeVdq6GkNddS7eEDq+muHPf6OsKe7BYyXQz4T5SgU532mmw3CW/QgYSw1463rX0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxsWjQrg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxsWjQrg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F15DC2BCC9;
	Mon, 18 May 2026 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779092670;
	bh=c1gwi+oOAjzd/PdlgL+JEByy8hvn6WB0akyhQ8i3Luw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KxsWjQrgn/lSzP1D4E2ysjb0lhiB5Q3drhN7FrvRS3be+JGOJGN3iH+8ehBn2PkGZ
	 RZdU6HycBNCfKdnFHRu5fl7Tgj96zYk6uo1SOmBhLC+sa8cJqDURi1f0hrKTKIZJTS
	 9DhjRjCHLVXlBpjPTGrUx0I4BSl04IhLyh+6FKmpxJdRXUGbIFmkO34W7bsWqglsgq
	 GiACyiuHAHtOos1Q2AiWkhlC55sauAzsLYto1yUaY0ZUree9EwKhPmwIIj9QZbmPhs
	 7xcZGJQyl17L2pOreM+XbFXVSLrc0LaTFJDyAHjXfUCQblYVKIn2Yt2heAhd0JKVD/
	 1uNwynNmq9XIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] bindings: iio: adc: Add StarFive JHB100 SARADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xingyu Wu" <xingyu.wu@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518081852.116909-2-xingyu.wu@starfivetech.com>
References: <20260518081852.116909-2-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 08:24:29 +0000
Message-Id: <20260518082430.3F15DC2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Typo in the `reg` property schema keyword where `maxItem` is used i=
nstead of `maxItems`.
- [Low] Hardware-specific properties `upper-bound-mv`, `lower-bound-mv`, an=
d `scan-freq` lack a vendor prefix.
- [Low] The `resets` property allows 2 items but does not document their or=
der or meaning.
--

commit f51adfa18df9b732393baa87f11dbef506bb4b5b
Author: Xingyu Wu <xingyu.wu@starfivetech.com>

bindings: iio: adc: Add StarFive JHB100 SARADC

This commit adds a new device tree binding document for the Successive
Approximation Register A/D converter found on the StarFive JHB100 SoC.

> diff --git a/Documentation/devicetree/bindings/iio/adc/starfive,jhb100-sa=
radc.yaml b/Documentation/devicetree/bindings/iio/adc/starfive,jhb100-sarad=
c.yaml
> new file mode 100644
> index 0000000000000..ba8e19b72ad71
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/starfive,jhb100-saradc.ya=
ml
> @@ -0,0 +1,62 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: starfive,jhb100-saradc
> +
> +  reg:
> +    maxItem: 1

This isn't a bug, but should this be maxItems instead of maxItem? The
dt-schema validator might silently ignore the unrecognized keyword, allowing
nodes with multiple reg entries to pass validation.

[ ... ]
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 2

When allowing multiple reset lines, should the binding define their expected
order and meaning? Usually, this is done by providing an items list with
descriptions for each entry, or by defining a corresponding reset-names
property.

[ ... ]
> +  "#io-channel-cells":
> +    const: 1
> +
> +  upper-bound-mv:
> +    description: The upper bound voltage value of the monitor.
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +
> +  lower-bound-mv:
> +    description: The lower bound voltage value of the monitor.
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +
> +  scan-freq:
> +    description: Number of the scan cycle interval.
> +    $ref: /schemas/types.yaml#/definitions/uint16

Since these appear to be custom, hardware-specific properties, should they =
be
prefixed with the vendor string (e.g., starfive,upper-bound-mv) to prevent
future namespace collisions with generic properties?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518081852.1169=
09-1-xingyu.wu@starfivetech.com?part=3D1
