Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2AB233722
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784636503; cv=none; b=pVOT8NSafDt4s8Tw6qUKcOiUdZex6L9fUrnw64IcT4noUQ/VYKsRQbuRAR/TSSQJwiLJ9JADyPnPUVvlqjUt8VggNui7kx3N8Z7WnWaMvTo6U6X+uB4bPNwVF2k8bxDeYqwai9FfbGT0udxIctqZW+b4F5yM2S10We145t7wEFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784636503; c=relaxed/simple;
	bh=Ua2kBj0JFvkurby1i5QGFj0D0xHsiC32eCLlDJC2veo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ozWfm1uVTefwuOQ1d2FmzhmD8UcooSP03HBFLUJ0ZsXVzIXLIEcG7FzO90I8VYX+ywj0h5awQ+EH575Qd4T1U7GfQrRED3f31JXXENLaBluyMop6a+s9F9hMuu9cUDXlBJdWUYH+MdbABZbZCb53ORcRRVRlnD4qHnUqKJbVV50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1e7cLtm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1e7cLtm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A9C1F00A3D;
	Tue, 21 Jul 2026 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784636502;
	bh=pQvbd+2ntNUylhbtFGIoBGRixRZ6/dIKROIqnwVNyK4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e1e7cLtmH7EWL1XmqTDmzXqzamchCFLqFhtL/VcrozKAMVGMO34GYCiBfAaXoJvKj
	 Ghx9Lf6uxgZ+4F+2SSLURqn1Ux8gJmIjJBQA0Qn+w4tB/u58/YY3R4Jfe6s3zaRXcL
	 WeQYCXLFZbmnuGb3NaHP/e5//rdEt0ldElwXHDLL1+nyTjhJ06RKmfnMXUjJzl5DeX
	 bFeA/0EVtSsRvajuRzbIPbOOONxTbGhmcf2Jrvu2xDxHneCaJ+WMZVrHjjRsgBt55G
	 w3AcxXJwXV0wG7C17JAF43z+51GRMgvhbWwzXEfWbTIo9UMyXsmRmGU2wM9lBqI25c
	 Mr7xODlVHk9fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/4] dt-bindings: timer: dwc: Update resets property
 items
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721120935.1359-1-dongxuyang@eswincomputing.com>
References: <20260721120757.1134-1-dongxuyang@eswincomputing.com>
 <20260721120935.1359-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 12:21:41 +0000
Message-Id: <20260721122141.D3A9C1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The timer driver ignores the newly documented APB interface reset =
(`presetn`), leading to system hangs if specified.
--

--- Patch [4]: [PATCH v12 4/4] dt-bindings: timer: dwc: Update resets prope=
rty items ---
commit 0298afcc08fcedc8999619356e00017ff450203d
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

dt-bindings: timer: dwc: Update resets property items

This commit updates the snps,dw-apb-timer binding to allow up to two reset
lines. It specifically documents the timer_N_resetn and presetn reset inputs
to match the hardware capabilities of the DesignWare IP family.

> diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.ya=
ml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> index d33c9205a9093..4d30cd01ac65f 100644
> --- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> @@ -25,7 +25,10 @@ properties:
>      maxItems: 1
> =20
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Timer ticks reference (timer_N_resetn) reset
> +      - description: APB interface (presetn) reset

[Severity: High]
Will this cause a system bus hang if a device tree is updated to specify
both resets?

Looking at timer_get_base_and_rate() in
drivers/clocksource/dw_apb_timer_of.c, the driver unconditionally fetches
and deasserts only the first reset by passing NULL as the id:

drivers/clocksource/dw_apb_timer_of.c:timer_get_base_and_rate() {
    ...
	/*
	 * Reset the timer if the reset control is available, wiping
	 * out the state the firmware may have left it
	 */
	rstc =3D of_reset_control_get(np, NULL);
	if (!IS_ERR(rstc)) {
		reset_control_assert(rstc);
		reset_control_deassert(rstc);
	}
    ...
}

If the device tree specifies both resets to match this newly added schema
capability, the second reset (presetn, which controls the APB bus interface)
will be completely ignored and left asserted.

Should the driver be updated to explicitly fetch and deassert both resets
(e.g., via reset_control_bulk_get) before extending the binding, to avoid
system hangs when memory-mapped registers are accessed?

> =20
>    clocks:
>      minItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721120757.1134=
-1-dongxuyang@eswincomputing.com?part=3D4
