Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18477397343
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699442; cv=none; b=RPu+kqKbWWItUklKBhy1CjpiDIlVpoEeMD+Se9wR4KmxcI4cqcfHfBQzi0Vy/6ML17/zwc0pm7sieNnFi/0cxOfRTk+dGViOo45Mab5GS9Bv7YL3bbWBN1gSDlvu4lChucmEgBEk1IK9n5gdkOkOS0nn+IPmomJ5cs1jA0VVi/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699442; c=relaxed/simple;
	bh=5Or+pqAB9m5OzfsYviMP5IQl0iR5xnzBtnlVVyKRyJI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PJET7T7zfhGp8U3CSrOluwq2/SNAKDC5bzcYbJ1cm35zU8rrOybgljQnA1pbyLKwLOX4K7YSg9vO453HM/n3v0E4eWJj8q0SIiBC2Xl1US2APUxDh6G//VbUFX1HnxRuVbXLQgW6WbJh86QxzWNwHaR2BBKXfu+OJNIjWzfX4vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFSWORPN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFSWORPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7448D1F000FF;
	Fri, 18 Sep 2026 02:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789699434;
	bh=5Or+pqAB9m5OzfsYviMP5IQl0iR5xnzBtnlVVyKRyJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EFSWORPNqlrUjIYNpZwgdDf+t22JkqjXC7oKydRAzGfKMsCMU0Z+QM6CE1WGTeo6E
	 bxXSsGC41oQJbGCuw9ghZojiKlRJyPJq1oCAp3s53fGB9uLbvc3c4TSFlikvOctgiO
	 nxR+RN+5gX30nXBoWFU4rEz+quM5d4MpCUTo4Rva+SNBoj9MMpbiq4CwkglqPsNqEY
	 vejRQCtQTWIx6GnRn0qc2YsXDbJF++mS8ZiKuZmJ4y+tMUYSurlm1AELVi9AiynN0X
	 CCeWvl+SL/H9oVm+EsoQ8erVoRST5UEpSH/3TsiWATBlQnue4yxKcjZQcKjVkY9wg9
	 0utF3J17ivrvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: spacemit: Add power domain
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-04-k3-pm-support-v1-1-0acd2b36b96f@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
 <20260918-04-k3-pm-support-v1-1-0acd2b36b96f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 02:43:53 +0000
Message-Id: <20260918024354.7448D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] coding_style: incorrect SPDX comment style in C header file
--

commit 3ce4bb2badb48920b29e15de6dfdfcdbc013d6c4
Author: Yixun Lan <dlan@kernel.org>

dt-bindings: power: spacemit: Add power domain controller

This commit adds initial power domain driver support for the SpacemiT K1/K3
SoC. The controller is part of the APMU and manages power across multiple
power domains, including isolation and power-on sequences.

[ ... ]

> diff --git a/include/dt-bindings/power/spacemit,k3-power.h b/include/dt-b=
indings/power/spacemit,k3-power.h
> new file mode 100644
> index 0000000000000..54b39f2f09364
> --- /dev/null
> +++ b/include/dt-bindings/power/spacemit,k3-power.h
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

[Severity: Low]
This isn't a bug, but should this C header file use block comments (/* ... =
*/)
for the SPDX license identifier?

According to the kernel licensing rules in Documentation/process/license-ru=
les.rst,
C header files (.h) require block comments, while C++ style line comments (=
//)
are reserved for C source files (.c) and Device Tree sources.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-04-k3-pm-s=
upport-v1-0-0acd2b36b96f@kernel.org?part=3D1
