Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7768230C150
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987565; cv=none; b=A6aYQEuFZO8wdCmsQ9Md0zCEAZatHy66np3nmt5OJO2Uhv8+BgIUazl2tq4d9LgBZo+T3gKhDVOqi+tdhOGIlkPGnr4hM+SIAvbqHR619beVvK91jhNPghu4sSXyMA4Qu+zShS7ibfZUZisHxCOYFL/8C4OCgicrj2Al29iZc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987565; c=relaxed/simple;
	bh=Qt3J7/OtiF9mNvlA8pwl2McUlHmptROUosDpdJv1xEI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l+5Er/chhcCBDZ3a4ue5i0WVrjCCzvkBa5sqAb0YTmA2hMWW++whR6IPcJrak3hBRlCGBq1lmBSOta7G75iLHhX6gQoccklTF/Zwi7+QQepux1iyn1HsnZQXZGS189ZMgZ8yvi2MAdqAhTjFk9KJ+xmG6MTMRiBtlOzscFChvL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBhP8Ez8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBhP8Ez8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBEB81F00A3A;
	Sat, 25 Jul 2026 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784987564;
	bh=qoqv2d+QyirQXHZUekufimZFQYy9x4uLodOICPSK3gY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OBhP8Ez8ju6UiLk9dq96LuXmNaDfB2LPkLdvpTPm7auYPqEPYVfMF3X0R1gJIESfM
	 0fGdcS9mNnFyvM0YljZjS35hzcm79Pngd2Oc1s4RI8jrOuuqudY/tQN839t1yX5eFC
	 ZH6aPXrqOvg1omyrrwq+2aElwj3Wq8p+ZjD+8zCtlPkhwvCLaHa65KUSHIzfiIcCB0
	 TUze+RJQuMANOyhPaJ+I8Ya/d/hotiEQ/EnQItBlB66bmStl59OjwC6ktCQt/UFFYV
	 N0eCn5xdcPSqZshyX99LWCyxoja5HWHB0uwCWxAT3xPFFxQezfirSPQnFzoi2drXzY
	 LMNPQgdtnutUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: spmi: apple,spmi: Add t603x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260725-t603x-spmi-v1-1-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
 <20260725-t603x-spmi-v1-1-e1a29fcd2d38@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 13:52:43 +0000
Message-Id: <20260725135243.CBEB81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding adds interrupt controller capabilities but fails to =
add `interrupt-controller` and `#interrupt-cells` to the `required` list an=
d example.
--

--- Patch [1]: [PATCH 1/7] dt-bindings: spmi: apple,spmi: Add t603x ---
commit 66ad58d37c9aac7f4dc961a6e2efa29feb72a053
Author: Sasha Finkelstein <k@chaosmail.tech>

dt-bindings: spmi: apple,spmi: Add t603x

This commit adds t603x compatibles, interrupt support, and support for SPMI
controllers that are not always-on.

> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c317..9fc511bb0cb88 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml

[ ... ]

> @@ -34,6 +36,18 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  interrupts:
> +    maxItems: 1
> +    description: Optional, operates in polled mode if not present
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg

[Severity: Medium]
Should interrupt-controller and #interrupt-cells be added to the required
list here, either globally or conditionally in an allOf block if they only
apply to certain variants?

When hardware gains new provider capabilities, the corresponding properties
must be added to the required list to prevent incomplete device tree nodes
from silently passing schema validation.

Additionally, does the example node need to be updated to include these
new properties?

Documentation/devicetree/bindings/spmi/apple,spmi.yaml:examples() {
    ...
    spmi@920a1300 {
        compatible =3D "apple,t6000-spmi", "apple,spmi";
        reg =3D <0x920a1300 0x100>;
        #address-cells =3D <2>;
        #size-cells =3D <0>;
    ...
}

If the properties become required, omitting them from the example will cause
the example to fail schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-t603x-spmi=
-v1-0-e1a29fcd2d38@chaosmail.tech?part=3D1
