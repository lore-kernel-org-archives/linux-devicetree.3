Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F85400966
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157584; cv=none; b=ccoJXdfzp3WcIjFL4h2yqKf8gxbe+04z/I0pfJGp2A7M1Wefw4EbTEko+Pq+LMY715TfamKB6XxCswyQk8AtLgKt9LIhFzuaDmrpWcDBOBe/AUBUfm/o31TO9a68XwaiOxJncZplZQhCVwPwALkum0SrmY6lcMp5IWXZS5FPPbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157584; c=relaxed/simple;
	bh=Gqjptc6G5kRrxJvM/vVbf/DmEdmWhewvBjcxVXxielw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qeD4qugbWzVLQA3HitESLjlK0GNLSCDoVno/UBbrSwDis6F8MYNkLN8hLUxKnMBpG5aiQWtFfpGWQUKlPbnGvqBdDrk+jFJ+44vNEFDPOIXGzCP1UVPY4LvKvCGLWvZ7K+/hvGV3gSn5lyw29KLY4XkT/6AGHmhBmVhf8iVqKJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2IzaWQF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2IzaWQF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FA81F000E9;
	Mon, 27 Jul 2026 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785157583;
	bh=Gqjptc6G5kRrxJvM/vVbf/DmEdmWhewvBjcxVXxielw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J2IzaWQF9sOpfuNpKtSpsjRInPKK9UZ6R7rLEdsy10cgxIsAemLu0bK7RLPPpGxw7
	 36hRWIYckCmxfaXKuMzfWZXFSfWOVu7ke/Y2Mbg6jYyoEpH20N0AEOLivj6G54FX3s
	 Movilkujd4JoToBdm334G6F3WP25VkKo1v0fmQ00ly2Ji1/KGHFOiXMTlqlm2BpJnd
	 ezuAhSyihsi/n3UHp8dKkfrEsZR5qa+yYDX/C0MICw4+vwuQFaI9aT8GcsUC34g3LQ
	 akXb7wjSYuhduelQuNZQK/U8B8hWk5qOmucAm2SV5qy1XzhF8CFkt6awjuc8+TrjZq
	 ibGdCC02wprlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: Add Kalambo SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
 <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 13:06:22 +0000
Message-Id: <20260727130622.B5FA81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing deletion of hardware blocks and thermal zones specific to =
the removed CPU cluster 0 (e.g., `bwmon_cluster0`, thermal zones), leading =
to a fatal SError and spurious thermal shutdowns.
--

--- Patch [2]: [PATCH v3 2/5] arm64: dts: qcom: Add Kalambo SoC ---
commit d6b5f610923793ce8197e8297bbc2ded9a915289
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Kalambo SoC

This commit introduces support for the Qualcomm Kalambo SoC, which is
derived from Mahua but has CPU cluster 0 removed. It reassigns the surviving
cluster as cluster0 in the cpu-map and overrides memory offsets for imem.

> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/=
qcom/kalambo.dtsi
> new file mode 100644
> index 0000000000000..4a68115a4286a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
> @@ -0,0 +1,97 @@
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
Does this also need to delete the associated bwmon_cluster0 node and the
cluster 0 thermal zones (like cpu-0-0-0-thermal and qmx-0-0-thermal)?

Because bwmon_cluster0 lacks a power domain dependency in the base device
tree, the icc-bwmon driver might unconditionally probe it. On Qualcomm SoCs,
attempting to map and access the MMIO registers of a physically removed
hardware block typically triggers a bus timeout and a fatal asynchronous
SError during boot.

Additionally, will leaving the cluster 0 thermal zones active cause them to
poll non-existent tsens sensors? If so, this could return garbage maximum
values and trigger an immediate emergency thermal shutdown.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-b4-kalambo=
-crd-v3-0-25280faceece@oss.qualcomm.com?part=3D2
