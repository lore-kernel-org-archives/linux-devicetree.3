Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D58F3502A3
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930940; cv=none; b=K63LKlbl7w5hJcoWz2jtesDHI+Ou8kliPqMmIleAzRZNFJ+WhuR+k5DaRr/C1taOe6TKW+Pmvkg9SsUslkvSLUPOwQrj6IGqC3Le9FilMK32HRzkz3/QGzyFiEyegoCUYdJwlNVl0y/NtFbS3y3G/kwTUaWqBfZz3VPutdsO1GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930940; c=relaxed/simple;
	bh=zRJbEvc/Cai1G37TKLyuLQVn3nQDWICBPpFD4CPulq8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BKj+QkYSNI7dqxYei3sXr3+dx53kv/Z2oDRwtU5JBHa+DuG8/BRjZAtLpgyEpq0fcTk+tRPehfcYEhDuQvl8J29ca9oMkyqtYEl8qcLXJEPYJMG3eoRsfmGZgGGoNJWznuxYnKxs9nN2ANZX30RL5avlwEU+OVwQDE7cijkdd1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOwSmKlz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOwSmKlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFA91F000E9;
	Fri, 28 Aug 2026 15:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787930938;
	bh=bi8aKnmgbudjQiXYbPWdnE0QDlb1het5d4ucF7BotKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EOwSmKlzEveh6h+TvQ/nOhS6xFG0kagqeKoKzxL2JjYZF3UGi+0O7Flzx56tyGkMD
	 UFbh7zH0bia+51vXMtNlewRYPwA5nRgffuK8Kb5fpkXkobcDRBz+ZDsR5cVzc1OdHB
	 kIKUEZk7mBl5SjdcYbsjnQE7JJX388lHQLbaugj963QYvjZhndykjvqXUMwWX3M75f
	 oiaZ1Sn2j5aTLT+zYrL5NbRr4db1bT2Joa3nZVvivjx7F553xPHEDHOB+k79P/3SMw
	 mLehuZNrjYbMpvmnKOajC0w4n8+bbwM8OddQ6eblNZb/D5XiQfkq6fNo5Xjdr/PkgP
	 nEQg4fWUBuxKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: dwc3: Document ST STM32MP2
 DWC3 xHCI USB controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260828150937.174735-1-marex@nabladev.com>
References: <20260828150937.174735-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:28:57 +0000
Message-Id: <20260828152858.6AFA91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Introduction of an un-prefixed, undocumented generic property `over=
-current-active-low`.
--

commit 5c70b019c9a119b961b9928eb41cf7a19bb476a6
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller

This commit documents the ST STM32MP2 SoC single instance of the DWC3 USB
controller. It details the glue logic wrapper controlled by syscon along
with the controller itself.

> diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
> new file mode 100644
> index 0000000000000..96bd557327252
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
[ ... ]
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  over-current-active-low:
> +    type: boolean
> +    description: Over-Current signal polarity is active-low

[Severity: Low]
Should this property include a vendor prefix?

Since this property is defined locally rather than inheriting from a common
core USB schema, introducing over-current-active-low as a generic un-prefix=
ed
property could violate devicetree naming conventions for custom properties.=
=20

Would it be safer to prefix this, such as st,over-current-active-low, to
prevent namespace pollution and avoid conflicts if the subsystem later
standardizes a property with the identical name but different semantics?

> +
> +  st,syscfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828150937.1747=
35-1-marex@nabladev.com?part=3D1
