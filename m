Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049F53E4510
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273625; cv=none; b=WldcCkbJyVzdY0urjZs9pM93DqBB9hMzTEVsYB9EdiChZp03Gx1bdTgLi9OIJXhSxRAX/J+YYr+XEpWKtdKN1/shqpzUrXT7WudSeZcpOYj42TkFNl429tIWOHw1JlwPO7QEelDcsasZkQuMf/+uHyeF89J0m1T0S4otZbBDvSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273625; c=relaxed/simple;
	bh=GiwSUk7Z8hYyBU9lG0QE6HpEM//Y7oBuG0+0dZlLgxM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rjwTxJsvbvgT34eGkCfzaMiVFVWGuqBMugsVCfv9qnlhEITslTooNRhpfFqcYCUDxvO+jI21mGncmOy4+8z+L8OpRhIiVXXokbvMdBCi5MuXZYtwjDIF208QjPL4yM/Z0k8eokSoCsDRxScJPFcwn7FzfJJjdQH8z3odrPtjYz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/fHrdkF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/fHrdkF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC8B1F000E9;
	Fri, 17 Jul 2026 07:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784273610;
	bh=A9xYxe9l5M9RD+eFu6fcy98Bi87zEITWsDTcsX6CBrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M/fHrdkFDtwtP2qF7PBDy8k6HEAytuVSfXEb0uBHFifugEiYc46XFLdtsMVeh1r5v
	 suVWfpX/giSSXA599s2P4oLdb1NK+XtNJRnlUxRT+YRJK8Ft9w6946fDKW6I5BJ0km
	 7SAmlOIA17NXfmin7NHEcMgIHyg+3KmA3EPvXLnn3ykkLaUVrHoDIFFUY/Y996Y6Lz
	 MGrcykyc6WACx4blMRw5E+y6vSEHaLtntvy9HrGea4ownr94XoX86kdG5yUh8P0laU
	 X4oP0SO+8OShlhIdoedKexoNMb953/PraZkVuGq87dpkIU0JFlsm8Lv+Vbhl5aWpW1
	 vidYytZFJlpvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: spacemit: k3: add i2s_sysclk,
 i2s_bclk_factor and i2s1_sysclk_src IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-k3-clk-fix-i2s-v1-1-e95001a692ee@linux.spacemit.com>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
 <20260717-k3-clk-fix-i2s-v1-1-e95001a692ee@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 07:33:29 +0000
Message-Id: <20260717073330.3CC8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly claims that CLK_MPMU_I2S1_SYSCLK =
keeps its existing ID of 47, when its actual ID is 34.
--

--- Patch [1]: [PATCH 1/3] dt-bindings: soc: spacemit: k3: add i2s_sysclk, =
i2s_bclk_factor and i2s1_sysclk_src IDs ---
commit 1a78396155ff5bfe1746259b3e076109f3ecbd38
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>

dt-bindings: soc: spacemit: k3: add i2s_sysclk, i2s_bclk_factor and i2s1_sy=
sclk_src IDs

This commit adds three new clock IDs for the SpacemiT K3 SoC to expose
clocks related to an I2S topology fix.

> CLK_MPMU_I2S1_SYSCLK keeps its existing ID (47) but will be repointed to
> the real per-instance i2s1 clock in a subsequent patch. No in-tree user
> references this ID so the semantic change is contained.

[Severity: Medium]
Does the commit message reference the correct clock ID here?

Looking at include/dt-bindings/clock/spacemit,k3-clocks.h, 47 is actually
assigned to a different clock:

#define CLK_MPMU_I2S1_SYSCLK     34
...
#define CLK_MPMU_I2S2_SYSCLK     47

Could the commit message be updated to reflect the accurate existing ID for
CLK_MPMU_I2S1_SYSCLK?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-k3-clk-fix=
-i2s-v1-0-e95001a692ee@linux.spacemit.com?part=3D1
