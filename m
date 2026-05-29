Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8869F35CB95
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051019; cv=none; b=TE3dDouilCG2DlVGyg782olg2zsGPAGg+DWFUN+uET2glYkG7c4WimHfa5iTmrU/KY31Io3Cj4jApuYCAd3mY2lTnplfQLp8zTZhwrQ3xZ9FLJOrDvHC2a8gCAlwXtRxD7F3oQuIogpDb56iwai9M+N4NYVdaGqDQLHh/CHMFjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051019; c=relaxed/simple;
	bh=EAIEJjm0jIOS5IHpQ78DNU7xW5RmV+f4XbJs1G6RckU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pULTgP4LVGRmeKdU+vy14glJYGl41rRT7aiBl5xOS8tMPdrf6KXrYtfye67LyrS0xsl8KlIAlgBaZ0L//QyJ5/7Iso8qxK0iK1VzhadaDLM6tKK95EYbnMud5ADhsk/xPA4JAmD+KojK/MXQlh3hJ+rczTKGEcV+vGHn1ibs6eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxEC8U1V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxEC8U1V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036371F00893;
	Fri, 29 May 2026 10:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780051018;
	bh=WaevtHnMGHuKEF6o3UEnV5wzj+CY7lnIfhcVdBSn1t4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fxEC8U1VL67t4iCTgkB4G7mnRs/3AUy0qBwMQMh0266bA/9CplkUwmJpeUBG+5oHk
	 fYMrUctFi/y7nD9akWZBYqjcJzJsqV4mwRS1ETdQzk1pV4OAaeRbYSR3lBuhVFre2B
	 pEF6UZ5MDwf+Jk6pCW+nFHRRvVMS5yJ6bm+3cL+zjdXHgqAwlDiJ4Hg9eJMlI5tODH
	 3qFSZnb/2uD6zDQGj34fd8KxlErMC3lik6DZFqdtunsZgBRV3gu4QAXKGkPCjt2yoo
	 ToklkuP44pNkdc56k8AlmvtsJz3spoF2x6RhRpqAzvXvSGA119JgCpZr4LiJj9zci5
	 H9TDLeVIh1+FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/10] ACPI: APEI: introduce GHES helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-7-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-7-2e0500d42642@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 10:36:57 +0000
Message-Id: <20260529103658.036371F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] CONFIG_GHES_CPER_HELPERS is missing critical Kconfig dependencies (=
ACPI_APEI and GENERIC_ALLOCATOR) required by the code it enables.
- [Low] Compiling an object in a deep subdirectory directly from a top-leve=
l Makefile bypasses directory-specific build flags.
--

commit c3231ce0a6f8ed7d287ec012f30d2735da8daa00
Author: Ahmed Tiba <ahmed.tiba@arm.com>
ACPI: APEI: introduce GHES helper

This commit adds a dedicated GHES_CPER_HELPERS Kconfig entry to allow the
shared helper code to be built even when ACPI_APEI_GHES is disabled. It
updates the build glue and headers to depend on the new symbol.

> diff --git a/drivers/Makefile b/drivers/Makefile
> index 0841ea851847e..27a664cb45ea7 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -31,6 +31,7 @@ obj-y				+=3D idle/
>  obj-y				+=3D char/ipmi/
> =20
>  obj-$(CONFIG_ACPI)		+=3D acpi/
> +obj-$(CONFIG_GHES_CPER_HELPERS)	+=3D acpi/apei/ghes_cper.o

[Severity: Low]
Does compiling an object in a deep subdirectory directly from a top-level
Makefile bypass directory-specific build flags?

Since Kbuild evaluates this in the context of the drivers/ directory rather
than descending into the drivers/acpi/ and drivers/acpi/apei/ Makefiles,
any directory-specific ccflags-y (such as those for ACPI_DEBUG_OUTPUT) will
be ignored.

Could this be addressed by descending into the directories instead using
the standard Kbuild approach?

[ ... ]

> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index f165d14cf61a3..13ef0e99f840b 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -6,6 +6,10 @@
>  config ARCH_SUPPORTS_ACPI
>  	bool
> =20
> +config GHES_CPER_HELPERS
> +	bool
> +	select UEFI_CPER

[Severity: Low]
Is this missing select statements for GENERIC_ALLOCATOR and ACPI_APEI?

The ghes_cper.c code uses gen_pool_alloc and gen_pool_free, which depend
on CONFIG_GENERIC_ALLOCATOR. Without selecting GENERIC_ALLOCATOR here,
selecting GHES_CPER_HELPERS in isolation results in linker errors for
missing gen_pool_* symbols.

While this doesn't trigger in this specific commit since ACPI_APEI_GHES
(the only selector) selects both, this missing dependency causes build
errors later in the series when RAS_CPER_ESOURCE selects GHES_CPER_HELPERS
without also selecting GENERIC_ALLOCATOR.

Please note that while the ACPI_APEI dependency issue is fixed later in
the series by the commit "ACPI: APEI: share GHES CPER helpers" through
added #ifdef wrappers, the missing GENERIC_ALLOCATOR dependency remains
unresolved.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-topics-ahm=
tib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com?part=3D7
