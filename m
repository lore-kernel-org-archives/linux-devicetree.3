Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DCD3749FA
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883228; cv=none; b=r5yDWXCX9b93XthB7LpqHn6hdJG/6YWZDQ8LEpEvncylR1KBy2zP/iLDNNWgxWYgED9/VEpCpBp27a914KWgAsPUJ5sPR78XaVngxvrN23vUaGMFy5NbEMAx7CoGqD91NhNM5sk6FIg9lh1295oBHdGlo9tvEjorV2396lyu7Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883228; c=relaxed/simple;
	bh=uIlj+He3nOiUXWdcfC/q3zexGGef9gH8o/wHwG3WnKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WJvwk7PNzyd3Eu76Vecnj1H1hygH7TLp6yTm72+Rflf9yqp2llLf9QTLq0HvKU46MyMKCe4zp3S85kIDk35SP0nHSb9GOIkqd22IoVxx+p+QHizyhXC17rrKfWHOkKt3aSQNsPoE1o6/+EOdLf8iGIHQ+hi45A0NhbsR6aDNjq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8Rt9R2H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8Rt9R2H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E530D1F000E9;
	Fri, 24 Jul 2026 08:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883226;
	bh=ag4pwnjy81ZBkAR/Cky/rzijYe7hOrwLSlZIE1OGekY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C8Rt9R2HVGXbomWuxHcn3iDEKwkvvixp1SdXP5VK5CwCqGzMGU87l7hmxddS5Cb3E
	 nfA+jD2ce+bsgd5A/hUDETYtuByrjM8NwuGcJJSO5Y0S3Vkz8NDdS9E/R56/6QUUUM
	 t28/CrSyzONr2+teiAacC8x2kTnjG9DHYcpINC6wxFwOUAlaQ0I9sIJm51CKRdgJj8
	 kFPAjMFEBQixsS4xfIZpU63ehzw05KlLGWBxkmU429YUllYfYmo4Nbg2/896cvj9xC
	 0X++0KdRXxxSQJStxkcuNC0vlEqXcJTOJy1ZIFXbXzkvyk494rOASKmmlAl683F7oW
	 DUhfdYyV8Kizg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/5] dt-bindings: pwm: dwc: Document optional resets
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724084304.1531-1-dongxuyang@eswincomputing.com>
References: <20260724084153.1473-1-dongxuyang@eswincomputing.com>
 <20260724084304.1531-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:53:45 +0000
Message-Id: <20260724085345.E530D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The timer binding for the same hardware family (`timer/snps,dw-a=
pb-timer.yaml`) was not updated to reflect the newly documented reset lines.
--

--- Patch [1]: [PATCH v13 1/5] dt-bindings: pwm: dwc: Document optional res=
ets property ---
commit 1c2d313919493838e6334a2a8bbd90732e217da2
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

dt-bindings: pwm: dwc: Document optional resets property

This commit adds the resets and reset-names properties to the DesignWare PWM
IP binding. It documents the active-low presetn and timer_N_resetn inputs f=
or
the bus and timer domains respectively.

> diff --git a/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm=
2.yaml b/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
> index 7523a89a17733..1f9d72f9f3590 100644
> --- a/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
> +++ b/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
> @@ -43,6 +43,16 @@ properties:
>        - const: bus
>        - const: timer
> =20
> +  resets:
> +    items:
> +      - description: Interface bus (presetn) reset
> +      - description: PWM timer logic (timer_N_resetn) reset
> +
> +  reset-names:
> +    items:
> +      - const: bus
> +      - const: timer

[Severity: Medium]
Should the standard timer binding for this exact same hardware module also
be updated to reflect these two newly documented reset lines?

The timer binding for the same hardware family currently only specifies
a single reset:

Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml:
  resets:
    maxItems: 1

If a device tree author adds the second reset line to a timer node
representing this IP, will it incorrectly fail schema validation against
snps,dw-apb-timer.yaml since that file lacks reset-names and caps maxItems
at 1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724084153.1473=
-1-dongxuyang@eswincomputing.com?part=3D1
