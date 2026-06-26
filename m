Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D841E3DDE
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 07:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782460440; cv=none; b=ACwqEU6KN7DUBG5ZxhPWYieYnBOuZ5TThsG/g55m9s1aCm9cY58kpYwpG6gxZ7OjSJLIsSJdOloU19rpN/QP7feRGYPLrk0zYSvD7GWmhpJAISGqMBxWpWjomU3RyOwD7CgsFnuTnyhflHMM9wkqcrprsCxk3ECmPDB81UImtak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782460440; c=relaxed/simple;
	bh=WigDwDqcemVMDM2D5Qs+YN/uB/ZxsPC/4WwBUxkPL08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WsUJBPEiDvFXXAxKFMJBYdWvjhgv4aJf3Rlds4Dkyi0F9xC/UT4/LMzMomZNNALK21NUGTrqZ2foNXFP84QpYVTAllyKDFlvMEMmcuUQa9NSbBm+Tb0pEk29tOZcYfxTjI+TAaTUiUpUIlL4GqGJuQAaeWvfM7ZpLxTCzHZzlik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VO9Vr/Sk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VO9Vr/Sk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19D51F00A3A;
	Fri, 26 Jun 2026 07:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782460439;
	bh=WigDwDqcemVMDM2D5Qs+YN/uB/ZxsPC/4WwBUxkPL08=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VO9Vr/SkSig3sXjAN5VZWGnA4SGkSp7gpKiu4w7qsnCJfPYzXsvdN+6zApdvvSbGp
	 5gj4vmCO/TUXiMWP35LDX4Cwg5Qov4HZh5QPP65QA+R183mA1YshTbH7jJSV+JMf3K
	 Pct0MFly+HqAQjS38Q8hJ9WitMm0s19vev2MTxjRYY985J1X7SN0C6RgKeYWadmX+Z
	 lSqZkMpyixci14GuukBsatPuPQLHwF7DodA5yzvCvQyJGAb3ESiyGArRF3RJpHDF2f
	 xtmEZcKzR2VFX/YIQXKdqL8SHcSCOJKq91bmP+YHqsu3lqcPV/tsRQwCcEOb9/pWaW
	 yMW8t3or7jdtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Reply-To: sashiko-reviews@lists.linux.dev
To: peter.wang@mediatek.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260626074820.2537772-2-peter.wang@mediatek.com>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
 <20260626074820.2537772-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:53:58 +0000
Message-Id: <20260626075358.C19D51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML binding schema is missing the mandatory `$id` field.
--

commit 010ce9609c338d8282471debb7c3cd606956e201
Author: Peter Wang <peter.wang@mediatek.com>

Documentation: dt: reset: add mediatek,syscon-reset binding

This commit adds Device Tree binding documentation for the MediaTek SYSCON=
=20
reset controller. The binding describes a reset controller that is part of=
=20
a MediaTek SYSCON MFD block and manages multiple reset lines via the=20
mediatek,reset-bits property.

> diff --git a/Documentation/devicetree/bindings/reset/mediatek,syscon-rese=
t.yaml b/Documentation/devicetree/bindings/reset/mediatek,syscon-reset.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/mediatek,syscon-reset.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[Severity: Medium]
Is the mandatory $id field missing from this schema definition?

Without the $id field, the schema cross-reference system ($ref resolution)
can break, and dt_binding_check might silently skip validation or report
misleading errors. Should it be added to the top-level schema header?

> +
> +title: MediaTek SYSCON Reset Controller

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626074820.2537=
772-1-peter.wang@mediatek.com?part=3D1
