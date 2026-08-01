Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D77A434E47
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785579347; cv=none; b=aZx9sVDDrTIYETgttRhYm0NuczGxGhp6bF1yTQxw4l+ofOTgy0tyf4hrzsgLoM+Q6uVleTNUVp1sdy1aJWmPzLq18UceDyfQ079oT0fmcsg2SPpZvXv/a6ltEn7ktTdhocRmSHxAlMzzY2BIoKCAxv6oqu6eXuZ1e47ndTP7Mvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785579347; c=relaxed/simple;
	bh=8iLJMsViHrFC28STgYLrbh30IUWAMfrr/mwjMN73p8o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tc8NC054uRpT/T9e0jBa6p3WmPMuSa7BnHzuWx9e6yNFVHGaByc/MMwykRMj6AFdi2SrkCffgfkjRbTHubCiwO58GwoFkY5sGm0InA9bRZr8fDJa6NpbktH9KPa5a/awHQkByB/e/+iLXS/RKlmyYpdLvDy82A7i/W3gVtom0RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6xUYVdg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6xUYVdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662211F00AC4;
	Sat,  1 Aug 2026 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785579343;
	bh=8iLJMsViHrFC28STgYLrbh30IUWAMfrr/mwjMN73p8o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f6xUYVdgycg4ZAwU5KNrSk6rqCjBpM5UMWi87+RlaYv5I8PgPlouP9/7udv9yGDPz
	 +GnSXU2SywP9cyAL+HcYMq28S1H9gMH24cGAY9qe4fMoVpFfVbyqxD0cyB+oWIbwoy
	 SnkYwhUuBygENVd97olUxrV030qRX+EfYQGyg89/xQhSGutsVthq0dntVfEKiuRTg2
	 pUf0NkxOyv+jotuga1H3XfpzR5Y6/1AiK+QBYtTaOcLfr1RHrsDDrNdZ8jfMg+0BgJ
	 OiKoIm5MGYpEG4AYSgaSCXwc5z0dTVJZ+H+ZpmGE4ZvTtmWNLACUhRspgSULZsLKnF
	 51rRJ0e16WnyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] arm64: dts: qcom: Add Kalambo SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260801-b4-kalambo-crd-v5-2-22160abacf3d@oss.qualcomm.com>
References: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
 <20260801-b4-kalambo-crd-v5-2-22160abacf3d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 10:15:42 +0000
Message-Id: <20260801101543.662211F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The bandwidth monitor PMU node for CPU cluster 0 (bwmon_cluster0) =
is not disabled or deleted, which can cause a boot crash when probed on Kal=
ambo hardware that physically lacks this cluster.
--

--- Patch [2]: [PATCH v5 2/5] arm64: dts: qcom: Add Kalambo SoC ---
commit 9554cda7ec4f38ae39a00604b42c25a1e924c0a8
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Kalambo SoC

This commit introduces support for the Qualcomm Kalambo SoC, which is
derived from Mahua. It removes CPU cluster 0 (cpu0-cpu5) and reassigns
the remaining cluster 1 CPUs as cluster 0, alongside adjusting SCMI
transport and PDC input mux pins.

[ ... ]
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
Since CPU cluster 0 is removed, does this code also need to disable the
bwmon_cluster0 node to avoid a boot regression?

If the node is left with its implicit status=3D"okay", the qcom,sdm845-bwmon
driver will unconditionally attempt to probe it during boot. Since the
Kalambo hardware physically lacks this cluster, accessing the unclocked
or removed registers can lead to a synchronous external abort (bus fault)
and a kernel panic.

Deleting the node directly with /delete-node/ might cause device tree
compiler errors because bwmon_cluster1 typically references the
&cpu_bwmon_opp_table nested inside bwmon_cluster0. Setting
status =3D "disabled" for &bwmon_cluster0 here instead would safely prevent
the probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-b4-kalambo=
-crd-v5-0-22160abacf3d@oss.qualcomm.com?part=3D2
