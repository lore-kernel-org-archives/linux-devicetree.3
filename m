Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973843112DA
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787345896; cv=none; b=dnP5RLHKbVYdS2MIKVUbCTRIrBRT/S6ceku0of8x3EP10R+mjVuOAKKDuhTuqXdJCZ3WiX8sH/WGmBVTtIUNYIGd6HJQIY8gFS4e5SFngh7QIKFgt7U8YViYyeXa3u5J5bkonnGimCd2ifv1Gz9N0NlRhOMXzpOLpy3ffFksd5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787345896; c=relaxed/simple;
	bh=MlmrsDDhWWlDxbFftilYfYESibJURW85Mn4vJ/gGgtM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BR++YvfhXEtcXWufWh5vMNex5kOzsJg1YFXCgqdxSYki9IHbaBYVfZ5joOvBVfTTsbiKANiyHt6o4qf3Y9L299xZctCmbaX207jA3blij/kZooFAvFS7q9pxpb8OX65NnlpobflHfKIYnyj574Jq6cq4ynURZHTFMtjSpKRZbvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jn/KyzMS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jn/KyzMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072561F00A3A;
	Fri, 21 Aug 2026 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787345895;
	bh=SLxdntNXGb0SIMwKtR1QcJMl0ouxcsdiy2UUdtb7ECU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jn/KyzMSHAjPOAD4UEZYIhdeeA8VZXQV2Yocs0ecFzg3IyrcgrzPd6uWTO+2S4ugN
	 sqv0wCpTlY6285NtRm8Gw1Ggi1ehz3vvw+9xhWu6cVtVeoiCivM9h/8ORdSwXIKecH
	 GBLCSxisJVMCGtdzO8i8hU5pk/2hIKUn7CmbGyMm3kPm3uudtAdr2F4MukctHqj3fr
	 ybSz9hLKz2Q8mf4LHvhfxW5lGVWXhtOlZjdBSLWSsN5W4+lg7dHvpHmuqU1/zhV+Sm
	 xWUOQVWJ6qMn53GuqpHLLl8PyTxS9lO32g+hJR6eiwm8iFGdZcWKpt+GXMbZsLMN+G
	 8cuPR3USr+d8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260822-ti-pinctrl-palmas-v1-1-a4d49e7f2dab@gmail.com>
References: <20260822-ti-pinctrl-palmas-v1-1-a4d49e7f2dab@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 20:58:14 +0000
Message-Id: <20260821205815.072561F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The legacy text binding file was not removed during the conversion =
to DT schema.
- [Low] The YAML example references an undefined phandle label, which will =
cause `dtc` to fail during `make dt_binding_check`.
--

--- Patch [1]: [PATCH] dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to =
DT schema ---
commit 3f34affd1ba20a6449af4fb14e654c0936273292
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to DT schema

Convert TI Palmas pin control text binding to DT schema. The legacy
binding allowed any subnode name. Restrict them to standard prefixes to
prevent the validator from accidentally evaluating standard integer
properties (like phandle) as child nodes.

[Severity: Low]
Should the legacy text binding file
Documentation/devicetree/bindings/pinctrl/pinctrl-palmas.txt have been
deleted in this commit?

Leaving the legacy text binding in the tree results in duplicate,
conflicting documentation for the same bindings.

> diff --git a/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.=
yaml b/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml
> new file mode 100644
> index 0000000000000..c07e3a782ef07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml
[ ... ]
> +examples:
> +  - |
> +    pmic {
> +        pinctrl {
> +            compatible =3D "ti,tps65913-pinctrl";
> +            ti,palmas-enable-dvfs1;
> +            pinctrl-names =3D "default";
> +            pinctrl-0 =3D <&palmas_pins_state>;

[Severity: Low]
Will this undefined phandle label cause dtc to fail during make
dt_binding_check?

It appears the palmas_pins_state label was omitted from the pinmux node
definition during the conversion from the original text file.

> +
> +            pinmux {
> +                gpio0 {
> +                    pins =3D "gpio0";
> +                    function =3D "id";
> +                    bias-pull-up;
> +                };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822-ti-pinctrl=
-palmas-v1-1-a4d49e7f2dab@gmail.com?part=3D1
