Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F62472535
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932457; cv=none; b=Zvo5I/FxYU6G6c0Nb7BG1ilmUtcM2Vpc1xe1I7FTqIU2nEeGTFsnysY3Vr/K+/BDnIuTtq9fPaRcAqTBsdDV0K/bXITDTSR8FrX/jdDczP0Oa7WhxFfKWQbTzfBcw9DclFXd73ZO14ZZyaVWztwOhLjhM3wobwoEIPNdMqBxLts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932457; c=relaxed/simple;
	bh=N/dBT+vYlMvD3V36MSYdEfzku2yEoqj1b9HwnfkUoF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B88XlWQpnRXFnrwY57yB/Jf+C53iEzabPfyA4tXhDxc8M8SDf3DTPCm9jd2U01ON9r2RlCeLvjoHbMmWXbU9yYzSwmfzlwZa0BLFL34H7iKZeOxc+8M8gnTrzlT8dqG1nOB1JsL+2GPneJ62v8RHUwnLfvYREmHqtwR8fqp6Q/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OG1hLrs2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OG1hLrs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F8B1F000FF;
	Fri,  2 Oct 2026 09:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932456;
	bh=N/dBT+vYlMvD3V36MSYdEfzku2yEoqj1b9HwnfkUoF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OG1hLrs2wG12QwitYhl7JDE04s9EYHWXW1DbzwXpCGuqVarbybgXrxNALrx9IKHzm
	 gg9oX3ypKtKtUOvvgvBP1ZnKYqFUo7mHMGUwUkspPjQF1hmX4YVXaJOMHa6WNdAsTN
	 EPImWZEs3PHRrSDlZBpcV0Y+c62RPTzPF5pIIs/ykslOAKqaVi6Flww8PVRyHUA8lw
	 YmvUgITQ2APX9+Apw3aqi6kPJ2RBiiLDJIhQgaBEe1Kgps1cUUaT/V4h0Y0rwUkVQb
	 GEuEIFMKIWLRyJ/Ufxmz4/pbI4WDE20GUUow1ySiCmBJAShihb/eCDRh8G5xqQkIEN
	 RyFdFAg5eXYyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: Convert hisilicon,hi3660-mbox to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001230538.2751621-1-robh@kernel.org>
References: <20261001230538.2751621-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:15 +0000
Message-Id: <20261002091415.B5F8B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing subdirectory in schema id path for hi3660-mbox
--

commit 166b90ad2ed4cbcf55aa970feab55098ef88a99d
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: mailbox: Convert hisilicon,hi3660-mbox to DT schema

Convert the hisilicon,hi3660-mbox binding to DT schema format. The
binding and driver give no clue about what the 2 interrupts are, so more
details can't be added.

> diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-m=
box.yaml b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.=
yaml
> new file mode 100644
> index 0000000000000..c42ce576a029c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hisilicon,hi3660-mbox.yaml#

[Severity: Low]
Does this introduce a regression by omitting the mailbox/ subdirectory
from the schema id?

The $id field must exactly match the file location relative to
Documentation/devicetree/bindings/. Should this be updated to include
the mailbox/ path component?

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hisilicon Hi3660 Mailbox Controller

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001230538.2751=
621-1-robh@kernel.org?part=3D1
