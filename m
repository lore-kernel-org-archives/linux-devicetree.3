Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720143815CF
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939114; cv=none; b=l4jX1U+afeKE6FHl2Ql1Ma7oRcwIoCPPUTo2GxAtUNJJIcaAWThpNzHAeirBVLr0TklCLsfXskmzl8sQOOzTj008UJtS14tUuE+4xczHaqrViGunIiPOOuqoWRRuRYGmVcg51/rYIuv59d8ZBvByCC1ph9jQYIGtKwzyyhd3l6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939114; c=relaxed/simple;
	bh=vfWpPIkPwKo+uqg2HG2dGmFGAj3On15BBa9M46cY/CI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KgjcliO7nxUk6ElkMYViEfjgnIjZgu3WzifafWOhKouUQFoxCMnWKOHR4Bxe9vXqgwiIxoGVKZz9rufTz8KH4O+IOI9zmwQnBz4xOXD1U0n2NXtJViN9/K1kiRf6C8y+KWGduVXOp4BhFiqzhuMsz6t2oq2Yd2moBmILXDt5wdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lu0XLf0X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lu0XLf0X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08531F00A3A;
	Wed,  9 Sep 2026 07:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939113;
	bh=NMM9hKTBn8UtUT3ezDZyxknOwwpqcZ33EE8YLjUfMdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lu0XLf0Xb+D0s5X98+1lF3R4TDsz3wW0CiuHlrJBp1kHMNRStQT5aXtTWAj3HQLGH
	 QHAQava7JDA0m+t0eeJ8/bjfR1rde+5f9UX4P6HBA9xk/mtzlZ+XHRrz7Vv+jDYQwy
	 /kCSLKFodd7145QrkFY7Sox/In4ArxC55jgcnCahXMhBmxcfTJY8Wupik9oU1lDL0e
	 ZZ2PEAEeT8MDzRjE3h9TgQi6++mcBKgPA2IywYXLhhooKvSAOoZWlL26+PhN50bGNk
	 smpka0JOL70lSn33JgPJZuYyN3EsTFlsnB2qxZEaqrmsgQvY2wWWj7GCgFUeRWUKQb
	 szQpeH6yOxRDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/5] arm64: dts: qcom: Add Kalambo SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909-b4-kalambo-crd-v7-2-f5685804478a@oss.qualcomm.com>
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
 <20260909-b4-kalambo-crd-v7-2-f5685804478a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 07:31:52 +0000
Message-Id: <20260909073152.C08531F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing disablement of bwmon_cluster0 after CPU cluster 0 removal,=
 leading to a synchronous external abort upon driver probe.
--

commit 917eea48188cf7e004e9ea44ee5963d8c898f1e5
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Kalambo SoC

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 (cpu0-cpu5) removed, leaving only cluster 1 (cpu6-cpu11).
The surviving cluster is re-added in the cpu-map as cluster0.

> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/=
qcom/kalambo.dtsi
> new file mode 100644
> index 0000000000000..8e2077d9d0a8a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "mahua.dtsi"
> +
> +/delete-node/ &cluster0_pd;
> +/delete-node/ &cpu_map;
> +/delete-node/ &cpu0;
> +/delete-node/ &cpu1;
> +/delete-node/ &cpu2;
> +/delete-node/ &cpu3;
> +/delete-node/ &cpu4;
> +/delete-node/ &cpu5;
> +/delete-node/ &cpu_pd0;
> +/delete-node/ &cpu_pd1;
> +/delete-node/ &cpu_pd2;
> +/delete-node/ &cpu_pd3;
> +/delete-node/ &cpu_pd4;
> +/delete-node/ &cpu_pd5;
> +/delete-node/ &cpu_scp_lpri1;

[Severity: High]
Since cluster 0 components are explicitly deleted here, does bwmon_cluster0
also need to be disabled?

The bwmon_cluster0 hardware is enabled by default in glymur.dtsi. If it
remains enabled here, the qcom,sdm845-bwmon driver will attempt to probe it
during boot. Would this result in a Synchronous External Abort (bus error)
and a kernel panic when the driver attempts memory-mapped I/O on the missing
hardware?

If bwmon_cluster0 is physically absent on Kalambo but cannot be deleted
entirely because it contains the shared cpu_bwmon_opp_table used by
bwmon_cluster1, should its status be overridden to disabled instead?

&bwmon_cluster0 {
	status =3D "disabled";
};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-b4-kalambo=
-crd-v7-0-f5685804478a@oss.qualcomm.com?part=3D2
