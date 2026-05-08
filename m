Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FD22F8EB0
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275708; cv=none; b=Veb7fY0TS8JmcyCOHZcddA4CwVrjzOu3Uc2nn0pdCRx0OuzepiqR5T06DU4hgXAvq+hnLEXfIJlOgQesV0tQnuGYZeIxtja+oXdioNntGPHYdq0WZjffz/xT1+Uf0pxYZ+R5sKzIf42x1JLO6wVp0KGwgkF78kzez0bvzuBwCgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275708; c=relaxed/simple;
	bh=AOGJwcmjLaF+D3MSff/pYJ9D9imDhv6bVHVIFFZnOFs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TC+OZ3YVYf+G1RI5aVRiI5j5UP47Zpoa3JCjK6/FYWiGdUAzfGSrew1dYOmQEATYlMHYGZDdoa82hiYBm0UL/9GVrukN/h3czfPrcdayHtgwIWoCXrF7RnxztWMNKbcIy/oT9Eaf1IT6l/fZvrN7J9U3bYDqiq+9kU0bdhQp8po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmwuHOu+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmwuHOu+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F432C2BCB0;
	Fri,  8 May 2026 21:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778275707;
	bh=AOGJwcmjLaF+D3MSff/pYJ9D9imDhv6bVHVIFFZnOFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HmwuHOu+hL9YWf58rABup+kb2Vswlm73q2cyosJFd3HzpAEhU6JcSjMa/szY8GYWP
	 KvBoZzHa8v+gXzg/Y0KxYl0Emu/LOJUf6S5QrbSx3pAPxb9u1xiSz2WdgMoffrGy6E
	 rm6FnFOI/vh1jfDkocfaY5GvVAu2YaoQvZ+I51UtYUARQpWsvA0g7raov/FjMslfMe
	 jKipfD0LvBqTh+/QR53K1J6PETbN338DxPHn5m6jPsv9FolDd9/ADiPYi4OvzY8lh9
	 4/xYA1az8TjCU6B+LnjwCqx3rmQga/3tJYK3o3AMOvKRiXvQQ8oa7o/xEkyuiBzuUv
	 vMcut6mld/I5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] leds: is31f132xx: Fix missing brightness_steps
 for is31f13236
Reply-To: sashiko@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260508131139.1523597-6-jerrysteve1101@gmail.com>
References: <20260508131139.1523597-6-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 21:28:26 +0000
Message-Id: <20260508212827.9F432C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The commit being fixed (a18983b95a61) broke the driver's lockless =
design by introducing multi-register PWM updates.
- [High] The commit being fixed (a18983b95a61) introduced an initialization=
 order regression where hardware is reset after LED class devices are regis=
tered, wiping their default states.
- [Low] The commit subject contains typos in both the driver and chip names=
 ('1' instead of 'l').
--

commit 368d92722167efb41b11021742d19656c04d1740
Author: Jun Yan <jerrysteve1101@gmail.com>

leds: is31f132xx: Fix missing brightness_steps for is31f13236

This commit adds the missing brightness_steps configuration for the
is31fl3236 chip to restore proper brightness control.

> leds: is31f132xx: Fix missing brightness_steps for is31f13236

This isn't a bug, but there's a typo in the subject line where the number
'1' is used instead of the letter 'l' in the driver and chip names
(is31f132xx and is31f13236).

> Add missing brightness_steps for is31fl3236 to fix brightness control.
>
> Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")

Since this patch fixes commit a18983b95a61, are there a couple of other
regressions introduced by that commit that also need addressing?

The driver lacks a lock for brightness updates, relying on the assumption
that intervening update register writes from other channels are harmless.
While this was true for older 8-bit chips that use a single PWM write, the
IS31FL3293 requires two writes (LSB and MSB) per brightness update.

If two LED channels update concurrently from different per-LED workqueue
threads, an update register write from one channel could interleave between
the LSB and MSB writes of the other channel.

Could this cause the hardware to latch a torn brightness value?

By swapping the order of is31fl32xx_parse_dt() and is31fl32xx_init_regs()
in the probe function in commit a18983b95a61, the driver now registers the
LED class devices before initializing the hardware.

During registration, the subsystem evaluates properties like default-state
and sets the initial brightness via I2C writes. However, immediately after
device tree parsing, is31fl32xx_init_regs() is invoked and triggers a
hardware reset, which silently wipes out the PWM values applied during
registration.

Does this initialization order wipe out the default states entirely?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508131139.1523=
597-1-jerrysteve1101@gmail.com?part=3D5
