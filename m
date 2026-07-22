Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6DF385D7D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718389; cv=none; b=XMpc7W/WYwwuHBFGBCNT5J8BGjmFvfyRxlYEDstRLSj+LxHiEeqcGj/619SHpTK8/EPidS8ZIsb7/h7AQAHo1h1tOoefldLwLQae9xo0bUFphbt+H3rJL+GxMfSLL0AnxEgOaMachSZijIi65eX/mI+Xb0pty3y9Fj+r1/5RGGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718389; c=relaxed/simple;
	bh=N5n5KkuNG/4axsJATP0WrUrnWWPkm03QlHib7IBIUZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B8W6EWBRAaapNug6iSFKnThTYUfGUvjqQtqHX7jiNW8tJy1lqVlTtW8Em7n8jlxs1rI/omDsbTO+h0MbUemyrHm92f0bJtMFJqLqoz79TRSBza5IQbElyVce4yjo9SCRgjfOours0ruSbcwnye8lUimff9w42WBWai4k91AEX5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKL+YV0G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKL+YV0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B351F000E9;
	Wed, 22 Jul 2026 11:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784718388;
	bh=vlBrog9PPwgMP9NLm7KyJknNEspVACo3wrwSUqoRX/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CKL+YV0GB87mbB/z6RsLLR5Ege4/RSaX+2tW2ZV4VTogxBFrBjrxYTcjnwmCFEtVj
	 47BJmxB+AJZFO8MKYcFLsg27+YyX2w37W7hdcbIK+3VebrO6egzdemkOiqwuSmSw3O
	 1tf4Tk37JQukQBK8/KwgD0iP4hIMPIfc2tSZPzPklO4IKQPT41juoxHHlZ/nPc5KSt
	 fLSRbtEZtiuoSuGx+Ivg+JmachBE4juIkUuRRISkqdcb9XPCg6PqBS9CaZEQ+S6KKc
	 PqjQbFh5JWj0SmBMIKlkrJst5DSGag3Hz9rM9TqBt5Q3NuoXdcVJ2qW9C3n+U+Q8b9
	 2RADOLLCfQSbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add Kalambo SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-b4-kalambo-crd-v2-2-32d4addc1ac9@oss.qualcomm.com>
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
 <20260722-b4-kalambo-crd-v2-2-32d4addc1ac9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 11:06:27 +0000
Message-Id: <20260722110628.24B351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Failure to delete memory-mapped peripherals associated with the ph=
ysically removed CPU cluster 0 (`bwmon_cluster0`, `tsens0`, and thermal zon=
es), leading to fatal Synchronous External Aborts during boot.
--

--- Patch [2]: [PATCH v2 2/5] arm64: dts: qcom: Add Kalambo SoC ---
commit efe1f196fdd8b9205242ea046e1fba3ed5838bce
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Kalambo SoC
   =20
Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).

> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/=
qcom/kalambo.dtsi
> new file mode 100644
> index 0000000000000..07364a7abd9a9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "mahua.dtsi"
> +
> +/delete-node/ &cluster0_pd;
> +/delete-node/ &cpu_map_cluster0;
> +/delete-node/ &cpu_map_cluster1;
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
Does this code miss deleting other memory-mapped peripherals associated with
cluster 0, such as bwmon_cluster0, tsens0, and the cpu-0-*-thermal zones?

Since the qcom,sdm845-bwmon and qcom,tsens-v2 drivers will automatically
probe these nodes during boot, will attempting to read from these physically
absent registers trigger a fatal Synchronous External Abort?

If bwmon_cluster0 is deleted, will the nested cpu_bwmon_opp_table need to be
moved to a shared scope so bwmon_cluster1 can still reference it?

Also, since the thermal zones for cluster 0 lack labels in glymur.dtsi, will
they need to be deleted by node path rather than by label reference?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-b4-kalambo=
-crd-v2-0-32d4addc1ac9@oss.qualcomm.com?part=3D2
