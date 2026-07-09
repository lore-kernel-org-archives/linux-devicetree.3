Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED1C25B663
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585499; cv=none; b=PJGSANHY26orflAue0n86wurdvEoNOybU/pqLGQdjcSv96ApVMr2Z9KDJrRLeuAAMvpMRI3JHR+Z9BnFckjEkUNVplJupl6ldFXMA285Gzb+OenLCvApGNTgvUv3r+LHGcQNcilwM9lyWzXFuulBNyikjQRgGf4aMj6f1JKvAk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585499; c=relaxed/simple;
	bh=KU9q9OqgQwD9QY92KR5eo1OBRO5IEnzQQvCxZyPs+bs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hVE7vj/wGAVuDBnCltnIcmptc8oh5rYE2leaJspOOQlh0IchgJ1ycvfvTrEofBqRDz8AAMSWWI7hlDzrFxB3EbPMvaJ4LmRYr20YGNyCrWMJjObOikv25FesOrhFCRZYh+q+TO2S75T6LxqXoAJpoq2JLEAixXA8RRNBKvylLbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTjTHykT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTjTHykT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EFD1F000E9;
	Thu,  9 Jul 2026 08:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783585497;
	bh=jFi6Dn7F1t4N6uCKWimkSPfG4Ex7cB8L3VhcVdbzOT4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bTjTHykTSfhH0ankdpdZl/sfb9sY4QT301/pYd7+YSHsG0+09ztP0baphceAkPNRC
	 L/v+ENXKlwpKK4ndZof+dp34Gnm9o5AfsV+Eo2TdVVEYjAsn6kdlN+eLk4AfgjTm/4
	 2VEVdfe2qnO99i9bV5MZbGnfRXkltByIWpOEh6nWpQLlS//3GgZX0HxiqHM6Kl2Wg0
	 P7sVWl5sLIqmwv3oQBjDsHcRzGnB5URRmKFbC6GCoyOo6oU9E5/XIuDKI+z7jv1N81
	 z4ZznJEUvl9uI8CSmw101XyTbUIcll/T7zx5zdQDDEt9Np5/1szG/r+2vyuCVgjY2F
	 ftBiAvsJG3dVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/3] dt-bindings: pwm: dwc: Document optional resets
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xuyang Dong" <dongxuyang@eswincomputing.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709081419.2077-1-dongxuyang@eswincomputing.com>
References: <20260709081337.2022-1-dongxuyang@eswincomputing.com>
 <20260709081419.2077-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 08:24:56 +0000
Message-Id: <20260709082457.66EFD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Inconsistent Related Binding: The related timer binding (snps,dw=
-apb-timer.yaml) was not updated to support the two reset inputs, causing a=
 mismatch within the same hardware family.
--

--- Patch [1]: [PATCH v11 1/3] dt-bindings: pwm: dwc: Document optional res=
ets property ---
commit 9b39c1c87d6471d2eec01acf8e6da72e82635001
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

dt-bindings: pwm: dwc: Document optional resets property

This commit updates the DesignWare PWM binding to document two optional
active-low reset lines, presetn and timer_N_resetn, to support future
use of resets for this IP block.

> diff --git a/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm=
2.yaml b/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
> --- a/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
> +++ b/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
[ ... ]
> @@ -43,6 +43,11 @@ properties:
>        - const: bus
>        - const: timer
> =20
> +  resets:
> +    items:
> +      - description: Interface bus (presetn) reset
> +      - description: PWM timer logic (timer_N_resetn) reset
> +

[Severity: Medium]
Since the DesignWare PWM IP has two reset lines for this hardware family,
does the related timer binding also need a matching update?

Currently, the sibling timer binding restricts resets to a single item:

Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml:properties.r=
esets
  resets:
    maxItems: 1

If an SoC device tree author adds both reset lines to a snps,dw-apb-timer
node to match the hardware capabilities described here, dt_binding_check
will reject the valid hardware description.

Could the sibling timer binding be updated in this series to prevent
this inconsistency and allow for both reset lines?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709081337.2022=
-1-dongxuyang@eswincomputing.com?part=3D1
