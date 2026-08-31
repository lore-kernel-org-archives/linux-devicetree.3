Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4997941DDF7
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193907; cv=none; b=oHNUjtLmCgxZZTDfwChIyvtO+f6/21zsZR7jcThCEbviSpdFpqITtdgxnFs/E6yD/0baMQi3EiZgs/jQKMycH0Pbm5BjILub9rgZQmgGpXVnq3SJGeyta8x2/fB4mT9G4jIenlRhNu6hKtfOFye982jRHVLLk6fOAUIiRo4kqq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193907; c=relaxed/simple;
	bh=vEAhAX85LTwceyK05+kWAds87V0DQukKFsgDUe4g/uI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J+p0xgPog51zwvbj3oldEWY9fGaMtuMdbzjfLJki97OwHboRWwB1sgnsSmbqI7v+c1ANh0opqzcXcEnRC306n8HyXXnuU+0l66Ad68HmijVBC2iqDGfegpNThfL+JbijKCuWiPSKGdu7mTbqrOnw0Y0zPziD3KBBr0Xf2mR9xHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdooP6hU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdooP6hU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11E11F000E9;
	Mon, 31 Aug 2026 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193905;
	bh=bsXdF7bObVx4KgIPzB8fdupjRdlVhg1MdsZfH81ujUM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QdooP6hUvMfswf6RjeBRIIbvJCg8ghAA9cAuAjhMQSyKUDfU8opP8g0eztu9TiOyt
	 SdQ4boN/YvplBVmS2qgODDpVAbklysJv4T1u/j7BXQDtcUzKfGIWWDeyweEUSZBxtW
	 sXWUfcKmcjg1ImZ+3qIxaLUpzhOWbjpkk4uHQX648L9wxNVum6MI9g4B8k/RCCKXuj
	 oScH9h0WqnlVzm6X/JmwH3R4+7xblcHIhKPsueh1BD4L8h7/xqvt4eSZWoEtsiytie
	 +ofLNkT1cF9BmXQ/eZwX3OkBe4Plqidsc7rryN8bWdblw4ftxJAC82xeWwIaM3ZBXN
	 iqYoPuggxqd6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: clemente: Remove nct3018y rtc node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mike Hsieh" <mike.quanta.115@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260831-clemente-remove-rtc-v1-1-84fc5787a6bb@quantatw.com>
References: <20260831-clemente-remove-rtc-v1-1-84fc5787a6bb@quantatw.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:31:45 +0000
Message-Id: <20260831163145.A11E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing the RTC node to rely on userspace instantiation violate=
s DT principles and breaks early boot time synchronization.
--

commit d669dbe540f28ffaac22aefa950b8d7090cfaf67
Author: Mike Hsieh <mike.quanta.115@gmail.com>

ARM: dts: aspeed: clemente: Remove nct3018y rtc node

This commit removes the statically defined nct3018y RTC node from the
Clemente device tree because a second-source RTC chip might be present. It
defers the initialization of the RTC driver to userspace or an early-init
script.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
> index 820d39a929746..51e90a4fba0ea 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
> @@ -958,11 +958,6 @@ io_expander3: gpio@21 {
>  			"",
>  			"";
>  	};
> -
> -	rtc@6f {
> -		compatible =3D "nuvoton,nct3018y";
> -		reg =3D <0x6f>;
> -	};

[Severity: Medium]
Does removing the hardware description of the RTC and deferring its
initialization to userspace break early boot time synchronization?

Removing the RTC from the Device Tree prevents the kernel from probing the
RTC driver during early boot. This breaks CONFIG_RTC_HCTOSYS (which runs as
a late_initcall before userspace execution), causing the kernel to boot
with a default epoch time. This can corrupt timestamps in early kernel logs
and trigger false-positive failures during early root filesystem mount
checks.

Additionally, using userspace scripts to instantiate permanently attached
on-board I2C devices via sysfs (new_device) is a well-known architectural
anti-pattern. Is it possible to have the bootloader fix up the DT for
second-source components before passing it to the kernel instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-clemente-r=
emove-rtc-v1-1-84fc5787a6bb@quantatw.com?part=3D1
