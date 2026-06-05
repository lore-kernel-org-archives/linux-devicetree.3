Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A1325392C
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 21:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693491; cv=none; b=jUfKj6+QZgAOm6gsn4uwo0PplXdw/8YhrvhjWMvnYeKs7Oppnn+IJZkKpevCQQ0lMtmqiEqCo1bg2rfm8T0D3nZpV4cFwdU6CzQ+2kp8ykdEJGOngZYxKZ2LSSA2Iuh3XWbSN4ygByCPZ1TKXIYdEAAQdSPIayinAr6SXRTqHtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693491; c=relaxed/simple;
	bh=hTWqifJAf+XOW/NEZhvl+kgaXDLilPCVLRvRs+HRJOM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bzZTrHfcq4UC0snjJHMfrcUUX93Dvc/ZkVj0HHOHgKHrFZvMsjYkAIdJY0Myswh9pzIDIvNQh8DfTqYXWE0DsvJxsjmYNsEY0xCzhUCg35mKYEe1YpCT1zAZd9RZb7xmsbiXMKs8XLcLicLuw1R5GxA07I4oAykkX6nAF0NfUwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zt4QqzsD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zt4QqzsD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F601F00893;
	Fri,  5 Jun 2026 21:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780693489;
	bh=va7V3F+EWbEwEQBYmO/w57cQpKi0b4qkgp/B7KhEhZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zt4QqzsD0VgAASuDUix9SCSawJ62T3KMF6NAqs0Xg9sGC6AFvSYczbw0TDVNvDdV9
	 DTu5YdeYKZFWoMA6cHvdIcAeGPXCuXu+N0NVAqQ9ZPSZC5Bl5MpBjdK0y4XAg8Fkz6
	 OdS/o1BJHjk4OqcVC7uWsTMViweMDWXNMhwo2Wtue4Bqf/Y9p74os3bS89U6hfRQUL
	 V/OatuI7XXllKqCWVxASqx8Td9L1mCjjP5qt2gKqB0urv1Nj6U0Y5i2coGHk9oEn68
	 Wq7LmUDxeBEJz8A1CnuPKe1BW5Auq+5GYJx7Gaz4dBMAPyNdDQUO5smnTOx2ZfJ/C7
	 pcTnSeRI6WJjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] irqchip: irq-crossbar: Handle renamed irqs-reserved
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260606-crossbar-v1-2-f67f7cb9ee50@gmail.com>
References: <20260606-crossbar-v1-2-f67f7cb9ee50@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:04:49 +0000
Message-Id: <20260605210449.81F601F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch uses double quotes for including a system kernel header (=
`#include "linux/of.h"`) instead of angle brackets (`#include <linux/of.h>`=
).
--

commit 45bcc0524f9b113a66a6033e639fbb294bcfc7da
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

irqchip: irq-crossbar: Handle renamed irqs-reserved property

This commit updates the TI IRQ Crossbar driver to handle a renamed device
tree property. It tries ti,crossbar-irqs-reserved first and falls back to
ti,irqs-reserved to maintain backward compatibility with older device trees.

> diff --git a/drivers/irqchip/irq-crossbar.c b/drivers/irqchip/irq-crossba=
r.c
> index cd1134101ace0..64b042ce11a9a 100644
> --- a/drivers/irqchip/irq-crossbar.c
> +++ b/drivers/irqchip/irq-crossbar.c
> @@ -5,6 +5,7 @@
>   *  Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *  Author: Sricharan R <r.sricharan@ti.com>
>   */
> +#include "linux/of.h"

[Severity: Low]
This isn't a bug, but looking at the global includes in
drivers/irqchip/irq-crossbar.c, should this include use angle brackets
instead of double quotes? Standard kernel coding style expects <linux/of.h>
for system headers, as using double quotes forces the preprocessor to search
the local directory first.

>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/irqchip.h>

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-crossbar-v=
1-0-f67f7cb9ee50@gmail.com?part=3D2
