Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB963D3002
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212788; cv=none; b=NaxxsanK2xiDtxIFCwEdMLqLT4nh92plvtW1dP4MfPNBAn3qVvc6sGPwiXNW/jpjKsqMpK3lBd1mtQ2i7QnedfbZlnO8NolcDZW5UZZMmk4o67ZVE1lWAcchv2fM9952RPCS6vlj4g8AfenrCn3IesByyaTuQBBlXlbstcGvT/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212788; c=relaxed/simple;
	bh=QpzfZnZJqGqH1ERvbgAwrPUS4n+5SGTXMBJhHEIs1Ps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EWJTto1bevbn3sbnWwg0mv/yRZE/B+mJlTqx+3wlF8sZX0M+sN+wBOyK824+4s7oUSOtq830lDDGNCl+jW/91tzpbYw1bBNByFE0ryttafuFJNuvRfbIts0iEYIX9QwW0t2EqwcLAi7mM6lvvC9pqXHkXAGfzCGMUKlvhHocxqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0xshVt3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0xshVt3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363921F000E9;
	Tue, 23 Jun 2026 11:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782212787;
	bh=HZqZ8Enjc2FTn/VpdnbYAPn77tXP4Ct3rpuelGzP7CE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C0xshVt3CKd3w/PB7SdmFwZ8FYfHvE66T8et1dh2YRUlqZ6PVGKQ+bhAnPRCk0vkt
	 Wutw92Oex40jSoF9ntP4Aro0atr+Gvf1EJurrUL1IyI+hD3GD51+ZgSjPHjuqDZYaL
	 QrxMFgYSpOEkLG6rWOCNSz26+fbQS0eRvRupuKXiikPXdsNM2vWtYhON5Sej2WRMpc
	 vPVEDBo4bq5navrA0mKg2OQ7t0t2wL4ScLG/FxU/MsDmmjznGKPiJ3pgqE2gRMSRgw
	 RLYLI/H4T/Sku0ECW/UE8TeSRNWg+Zlps7ZFN3R2j+aGTCaUASAijRM+7v4q0m697+
	 ISFJSXIrXiYag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/12] dt-bindings: iio: dac: ad5696: add
 reset/ldac/gain support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623-ad5686-new-features-v4-1-28962a57db0f@analog.com>
References: <20260623-ad5686-new-features-v4-0-28962a57db0f@analog.com>
 <20260623-ad5686-new-features-v4-1-28962a57db0f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 11:06:26 +0000
Message-Id: <20260623110627.363921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `allOf` conditional block fails to restrict `gain-gpios` for=
 all applicable devices that lack a GAIN pin.
--

commit 23c63e7ff1a35cdc5b325bc954025b5cf88c49f5
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
dt-bindings: iio: dac: ad5696: add reset/ldac/gain support

This commit adds optional GPIO properties for the RESET, LDAC, and GAIN
pins to the AD5696 device tree binding. It also includes an if-then block
to restrict the use of the gain-gpios property on devices that do not
support it.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,ad5311r
> +              - adi,ad5691r
> +              - adi,ad5692r
> +              - adi,ad5693
> +              - adi,ad5693r

[Severity: Medium]
Should the 8-pin dual-channel DACs adi,ad5337r and adi,ad5338r be included
in this enum as well?=20

If these hardware variants also lack a GAIN pin, omitting them from this
restriction block would allow an invalid device tree configuration specifyi=
ng
gain-gpios for an adi,ad5337r or adi,ad5338r device to silently pass
validation.

> +    then:
> +      properties:
> +        gain-gpios: false
> =20
>  additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-ad5686-new=
-features-v4-0-28962a57db0f@analog.com?part=3D1
