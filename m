Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4057236F901
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784833843; cv=none; b=t4x3figeFHVDwWFrc+IUDrU5DJCDSboaSkqxOLrX0uUA+JlZvZbbyeJkhSL+lJn0hbhql7b6EGYEUqkmTFH7m1gSIG3YBcjStlN+wnMVUl5S0t4dP/VF1MaqQxiZBHnDHReVgCpdS9+xkj2q7wy5Ot4WDqXrZX9iQ/iYqqmXa90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784833843; c=relaxed/simple;
	bh=PzXMRpcjpSGGyRxG8iT7q+Ut05Z7qhFXnc9nAnDWcCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F6RVIvgNpxsQRnjjC+65j0GAire1UUMa9xbmEpInZtaXjlo0iwlKeYMbIi2Z2GpqpuL2UvkWcbrOgut2dISOB0cHZVKIwSr5xQ0wgoFAHYF1FMtiga46gjqfU/whWaZdLnHF17cLT/L6GG7A6KqvXcpqxXP2iQ2xSW2/qrXMgsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVOdimD5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVOdimD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56FC1F000E9;
	Thu, 23 Jul 2026 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784833838;
	bh=gD+hpwaAia5FwqlBtFAelpk4N6gKg4WxERzKXmMJxnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aVOdimD5mTPAKHeFPBtIw6zYLbWBAasgkBGk3rS4zMlFD9PUedtnAZM2oExifv3Rf
	 B8UsIfzqCXBPafpHG3nujxqzbJkJge4NvDjfxybSKj0j09ydUYDMQQ0wgU1yEWkwEn
	 PeAqnNfGblzbT9bEL2/QeoLQDMpObsAn6r4Ph7Yx1EBilkBTLkaGxbRYPntFmHksGn
	 xgbwmyDEEdfTmVR4XWlvHZ3cQbFfHdwGzXx/OWvr4HnVF9aMmoiBP45un7O9+Fu0So
	 RevtVS8GdJlv3pO2kgeXXOeaQiuK3vmPRqrHLQ6TXufgnO5SQn26tKn1urq8fR3lny
	 0lcbhwzEjOsBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: airoha: Add additional reset
 for PCIe PERSTOUT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723190133.22577-1-ansuelsmth@gmail.com>
References: <20260723190133.22577-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 19:10:37 +0000
Message-Id: <20260723191037.D56FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unprotected read-modify-write race condition in `en7523_reset_upda=
te()`
--

--- Patch [1]: [PATCH 1/2] dt-bindings: clock: airoha: Add additional reset=
 for PCIe PERSTOUT ---
commit 18436d020bf626a2783583bd282cd113ebcf4808
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT

This commit adds three new reset identifiers for PCIe PERSTOUT lines to the=
=20
Airoha EN7581 reset bindings.

> diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/dt=
-bindings/reset/airoha,en7581-reset.h
> index 6544a1790b83b..25e75534daa94 100644
> --- a/include/dt-bindings/reset/airoha,en7581-reset.h
> +++ b/include/dt-bindings/reset/airoha,en7581-reset.h
> @@ -62,5 +62,9 @@
>  #define EN7581_CPU_TIMER_RST		50
>  #define EN7581_PCIE_HB_RST		51
>  #define EN7581_XPON_MAC_RST		52
> +/* RST_PCIC */
> +#define EN7581_PCIC_PERSTOUT0_RST	53
> +#define EN7581_PCIC_PERSTOUT1_RST	54
> +#define EN7581_PCIC_PERSTOUT2_RST	55

[Severity: High]
This is a pre-existing issue, but does adding these new reset lines expose a
race condition in the driver's reset handler?

Looking at en7523_reset_update() in drivers/clk/clk-en7523.c, the code
performs an unprotected read-modify-write on the shared reset register:

drivers/clk/clk-en7523.c:en7523_reset_update() {
	...
	val =3D readl(addr);
	if (assert)
		val |=3D BIT(id % RST_NR_PER_BANK);
	else
		val &=3D ~BIT(id % RST_NR_PER_BANK);
	writel(val, addr);
	...
}

If two independent consumer drivers call reset_control_assert() or
reset_control_deassert() concurrently for different reset IDs that reside in
the same 32-bit register bank, can one of the updates be silently dropped?

Since the reset framework delegates hardware-level locking to the provider
driver, it seems a spinlock is needed here to prevent concurrent updates
from clobbering each other, which might leave a device permanently in reset
or prematurely pull it out of reset.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723190133.2257=
7-1-ansuelsmth@gmail.com?part=3D1
