Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0744E3AB286
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352685; cv=none; b=c5O6nbRSW+HZ9aNsDPPBNSw10WUBTCoYDZJ/6QJQymTRxSRUvUJpPCMxjp5wZAwAhYhx5aMRE62gPJiV8oGHgnzK7AsiZEuKk3+KnIQQAaLqA5REGAeIGrYpB7hVXyqmHaiUL6Xz3a+bOtzJKyao/tf/Z/GKteNEbdUflNP8O+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352685; c=relaxed/simple;
	bh=EUME7pox6hfTx71k+T1WfSym0To3DL3tvWpNWdzgq9Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VEacV1fWjiOWtl3C5V3BRkoPfRSVWWRyj9jjGOkbkOOOmvCoKhz5felFyBBFVGiJO78vb1InxFfxTJm5BynJbaWYJT1I0RRumWUwNAD5PR1OCQcSPvHwvC+67N6ZAgMMvBCGlyz1sjqrrUIObPRUtWLj4HJ//LzkNjy2MGSN4Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6O4y+Gz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6O4y+Gz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41ED11F000E9;
	Mon, 10 Aug 2026 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352683;
	bh=EUME7pox6hfTx71k+T1WfSym0To3DL3tvWpNWdzgq9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k6O4y+GzDvbf636yYf0AA5rhy3xzMnK/KrCnjyjCjn3U28UCSVGaYY1ZDLKWE/DuH
	 Z5qTK0LremelxUrBgBjwJHnkvZyLLnqn61opyIEiCrckz549Svk4KlTBx7fJUaOp7d
	 Ri680Jd8beXerbuFlBadg5J3ATSeyE/mR69dgW6SUHTw8AJLE/qoqe0KbqNCOdL31e
	 Zs5WPQLad1ZQzhfMqCjuNgjLus6cKDIJKmoPY30SaU248BwXE7aygZRPJw1jGnUtLM
	 I2wA9xnxz77+9hb9DKJ91y9whnUiYht+JDteDZ4KIeAN0MIQIRRu07HSUz4mLS5OJC
	 h9yQMnKj48Ezg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: Add Kalambo SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810-b4-kalambo-crd-v6-2-744e8ad1dae9@oss.qualcomm.com>
References: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
 <20260810-b4-kalambo-crd-v6-2-744e8ad1dae9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 09:04:41 +0000
Message-Id: <20260810090443.41ED11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `bwmon_cluster0` bandwidth monitor PMU node is not deleted for=
 the Kalambo SoC, despite its corresponding CPU cluster being removed.
--

--- Patch [2]: [PATCH v6 2/5] arm64: dts: qcom: Add Kalambo SoC ---
commit 5b1921ede3b67f6a0faacd0ff5d06c244a23debf
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Kalambo SoC

Introduces support for the Qualcomm Kalambo SoC, which is derived from
the Mahua SoC. This removes CPU cluster 0, reassigns the surviving
cluster 1 as cluster 0, and adjusts SCMI transport regions and PDC
input pins.

> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/=
qcom/kalambo.dtsi
> new file mode 100644
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

[Severity: High]
Should the bwmon_cluster0 node be deleted here as well?

Since cluster 0 is removed for Kalambo, the bandwidth monitor node
(bwmon_cluster0) inherited from the base dtsi files will still be present
and active. Will the qcom,sdm845-bwmon driver trigger a Synchronous External
Abort during boot when it probes and attempts to access the memory-mapped P=
MU
registers for the now non-existent hardware cluster?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-b4-kalambo=
-crd-v6-0-744e8ad1dae9@oss.qualcomm.com?part=3D2
