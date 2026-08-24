Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9CB3F3288
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576695; cv=none; b=cawgLaB+5D1+ocz+Bzb+q4q6itw/Hkn6Vm3mA41iBag38srurdNSOlMlCcw3pr1M58sQeSdQxAn0HCdlcwXhv5727a+FT9mGn8kElCJXKbTiCyAIPzNxz4eE5KOk7Z3i0TH3E2LNAYPxMAGzLE8HWsd50a1GO8fJYuVwGuZwiGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576695; c=relaxed/simple;
	bh=StZehmjulMM5RUvWggNW9Zycvk9sG1Wsg1+AOZeQQPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qXnIXHzifmNz8tdJmoLpa2Po2n2LY26K1o2WTv9tKEwejwk53BS/9dNoS9dFSzG3FKDHTnXi+h9LcLSuGR+RhcbZG0Rz2TmymzSPFhhPzes0cYc0UhwhomU6QnAHYZyYW+IuVAfd/Bpr3n0CYe+NDY8pmd9uiTrCh5uWrYsLPtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYt11qH5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYt11qH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03C01F000E9;
	Mon, 24 Aug 2026 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787576694;
	bh=IdlRXx3NJEg6zabFLmvRlcjgKF0Eo001KpN5GpsOy44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lYt11qH5e4i56wMspCuxwOxZafMI3UDvKYf/8syEycaIv7Ztt7qBZYdw8sJ3Ed+q0
	 4SdEDdh1s86K4lc3HTtf/IHoXS0WZvcTl3qa5WM3Xpb4hUkIJVw50tdF7UOf+vRV8L
	 AcX1K4nKKPTAhu+DaC+/v63V0AXx5Loi5Lg14dw2ewZL722DfNHGiD7LX4rw6AQ6Kd
	 luSqtivkOP7dWy8ZWz9FPDR/vvxOQtm49aF6witmwm9/+iyRoHgOGOYLA9YF5unqIO
	 mB5SO9NXn9PkpJX3UMOijyvh93LOSXRxsLUr1lKlbNex/gma+5SMBQZmIAMZc6TIn/
	 b9oo7LmIxqcyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/9] dt-bindings: pwm: Document RZ/G3E GPT support
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260824125523.131762-7-biju.das.jz@bp.renesas.com>
References: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
 <20260824125523.131762-7-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 13:04:53 +0000
Message-Id: <20260824130453.D03C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Add `#pwm-cells` to the `required` list. The binding omits this =
mandatory property for PWM providers.
--

--- Patch [6]: [PATCH v7 6/9] dt-bindings: pwm: Document RZ/G3E GPT support=
 ---
commit 9a7d174b7aaab1e8640a8415696ce9830442c765
Author: Biju Das <biju.das.jz@bp.renesas.com>

dt-bindings: pwm: Document RZ/G3E GPT support
   =20
This commit documents the device tree bindings for the General PWM Timer
(GPT) on the Renesas RZ/G3E SoC. It details properties for the 16-channel
32-bit timer, including interrupts, clocks, resets, and power domains.

> diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml=
 b/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml
> new file mode 100644
> index 0000000000000..cb4ffab5f47fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - reset-names

[Severity: Medium]
Since this hardware is a PWM provider and defines #pwm-cells in its
properties, should #pwm-cells be added to this required list?

Leaving it out allows incomplete device tree nodes to pass schema validatio=
n.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824125523.1317=
62-1-biju.das.jz@bp.renesas.com?part=3D6
