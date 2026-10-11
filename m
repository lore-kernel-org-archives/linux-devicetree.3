Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE56F38D419
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 17:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791740244; cv=none; b=EX0ywNXVSvM5spaHPGRR79oVWI+TBXThP8CyNe7Eh0bP0u0DLofGHla3i7RVYwKRo7x7cNse+hUUyhXYvxX94NGqw8V/R/KCZ/ng3gwytCN3LoH2uDCF0jxoyFLDeFNF7t4HksS9C+ACfzeAESg7eJR/hFDNmC6QNcEBlsvLewM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791740244; c=relaxed/simple;
	bh=aXlFXaQt/khcM1w0/VkZsmp2/sKz7WIalnSXUIdUfqM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WGHCzWZL1IWOrtTL8xcTZ7DpVG9wuj4HKyliJR9PXVa48F2eArVMyrvNU6E1Tg6kXWG7cBhwQdiCvMAB7XsNNLfYUdLsUhyhcnq+EcJcBHfQo579mMvC1B7ROfUS6u6SMNmRZe9sYxzQ31GeumEiMBX0dl8y+ZC9NAPQBNm2HFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJ7E9lw9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJ7E9lw9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2531F0089B;
	Sun, 11 Oct 2026 17:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791740242;
	bh=HTauZeSjWAi+C+RmspD+Vi+f0bSO82hvRBSKV9yS/9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lJ7E9lw9nm1Ghv5FZocAvz9ibWAd9LB2Rw2VwR6dCDFT0LcC9ULPc3xU4bRRKXb5C
	 xTzfKLo6q73gEB1BCRqlq/hQe524+4iK4xXWWP54xK9HIilaX8ohlmS0B4wHcRpnZi
	 QK/mVgIeKNwBiZl2DpetgWfbqzjESAy9mkVjugSsD/sYXH+lvUfkxvmEJ/pcv9h5qC
	 x4QcukZOgf1tVvWhOJiu+XvUMRQrZvJi4IuGt5ntPLU0gHVg4Hyqs206a5OpwSQ3/p
	 7WB8z2hxx4dL7f1IHuvpBd8L88dGY5KZ7xI3FKyifc/ucflwn57LaZcB/Lud61/oM+
	 4Qc/oFC9Ye/TQ==
Message-ID: <sashiko-outbox-167353@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261011-dell-xps-9345-ec-v5-1-2ab1258b84c1@vinarskis.com>
References: <20261011-dell-xps-9345-ec-v5-0-2ab1258b84c1@vinarskis.com>
 <20261011-dell-xps-9345-ec-v5-1-2ab1258b84c1@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 17:37:21 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: architecture-specific header included in yaml example
--

commit 8b45bf401f436a6e8330c0e4539c0d77e9e73400
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

dt-bindings: platform: introduce EC for Dell XPS 13 9345

Add bindings for the Embedded Controller in the Dell XPS 13 9345. It defines
properties for thermal and power management over multiple i2c busses.

> diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,x=
ps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/d=
ell,xps13-9345-ec.yaml
> new file mode 100644
> index 0000000000000..3485117b505cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-93=
45-ec.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <arm64/qcom/qcom-adc5-gen3.h>

[Severity: Low]
Does this example include an architecture-specific header? Including headers
outside of include/dt-bindings/ breaks dt-binding schema portability rules.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-dell-xps-9=
345-ec-v5-0-2ab1258b84c1@vinarskis.com?part=3D1
