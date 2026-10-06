Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C57F3563CD
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 04:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791259503; cv=none; b=GMb+GF7xsj+ZCV+ckPu91plrio+nEv56/CNhtdTsUeXAlOf1EF1H2The4I0Huznw/f6bflFNbZlhh7J61AcXU+O6YHfDPHaTw50S2uo5xI0qFiOmJxdX3Wu0whxoG2b6GZFkIdGlWnXzpnCadCZ/nQleQJv/pKbrVC6G64jg0jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791259503; c=relaxed/simple;
	bh=FxWGy2C87sjoqKPcf1D5JUmfsX9IZtn/pW9zxp09wBw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JW60qKJTnq76agqxc5nqxckEqL5A2bBlfcU5IeWyv+TnYng3kQt+9xOzSAAr95x2/4eyi8dyGAxgtYKMIKqswRjiERYzfNEfSc5E1fu4rAchYsNqbTSOpeMDPvI6cjszE1X7MaI7y2po7IGPAQo8mwZMGDWpomzAejmWmPmFT3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZnw3G0j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZnw3G0j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FD41F00893;
	Tue,  6 Oct 2026 04:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791259501;
	bh=LwNVUD5YD/WjOhlh9UccWpv0Rc9NA/Q3ZQrnGPfVtJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PZnw3G0jWoJESoYMYNn6y83CFDx8cqPheajq6gnt08Xh5g/UBqa2Ec9SWtOyovYDZ
	 aNx6gnhh+Jn1Pq8858Eci3DmRJ0ICJmviPc/rAHQcmJepmX3AtO3DVdt7LX8pVxJmf
	 nD2Ae6JnUIvJ9ncVK5U0caS3ABKh0fejWj44QaK085HUE+cbhXCGV5jIZLAJncZh5w
	 TQvvRZAnqCnT3mvoyMHQVQeNsSvQYOAlBi0NEw5QgD0jU1QJuSPEc5NXrAR/nk/PF8
	 0MzV5fZ6LIbNZZ7PGeGw+WlKGVYkUjLitKuPkp2gZwv9RVOlp4wXYtf1uIY88ytuKD
	 68e4pVyVucmlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: Convert NXP PCA9685 PWM controller to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jeremy Dean" <deaner92@yahoo.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261006033518.34332-1-deaner92@yahoo.com>
References: <20261006033518.34332-1-deaner92.ref@yahoo.com>
 <20261006033518.34332-1-deaner92@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 04:05:00 +0000
Message-Id: <20261006040501.87FD41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: pwm: missing #pwm-cells in required properties
- [Low] dt-bindings: pwm: hallucinated maintainer name in YAML schema
--

commit 2d85be96eb45879405596ef1a5131c2b3425b8ed
Author: Jeremy Dean <deaner92@yahoo.com>

dt-bindings: pwm: Convert NXP PCA9685 PWM controller to DT schema

Convert the NXP PCA9685 PWM controller binding to DT schema format. The
conversion documents the reg property and makes it required, updates the
example node, and describes the PWM specifier cells and properties.

> diff --git a/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.yaml b=
/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.yaml
> new file mode 100644
> index 0000000000000..36b312ac0be95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/nxp,pca9685-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PCA9685 16-channel 12-bit PWM LED controller
> +
> +maintainers:
> +  - Jeremy Clifton <deaner92@yahoo.com>

[Severity: Low]
Is this the correct maintainer name? It looks like the name listed here=20
does not match the name of the patch submitter. Could this result in=20
incorrect attribution and metadata parsing by get_maintainer.pl?

[ ... ]

> +required:
> +  - compatible
> +  - reg

[Severity: Medium]
Should #pwm-cells be included in this required block?=20

The original text binding correctly mandated #pwm-cells since the PCA9685=20
acts as a PWM provider. Omitting it from the required list here reduces=20
schema validation coverage, allowing device trees that are missing the=20
property to silently pass.

> +
> +unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006033518.3433=
2-1-deaner92@yahoo.com?part=3D1
