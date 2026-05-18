Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CA1382F25
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136952; cv=none; b=ZXHLaLkbDto3wXDzlcZ7fwRWH3DO891Vpdu4RKw8o4jGJxUL90wlfnphXmBpbI1Wx4PSu1oayCc23gGi78gmnAjy9wK4lgDzWghBnU/SFWDEALwJBUa7FjTWx707otz+lMvuUn5KhlLmRRZS9zDoHmftgtiH/zytp2rWOuCkoDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136952; c=relaxed/simple;
	bh=XzHqnbQOBkUaRcTLifkZfbcC2NZQ6vvm6fZ+AabYgYk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EVNEvg733gUf1CTzZIud69qlODbJ62o/MlT4/AvUlL31Ho0FFZAudnhhJfiEnxJc/0Fmgrol1+rZVkIroBjIxQeeIr/a2lWHd7HGQ/8we745yW2eGpqBwoxHgNGq4lWWXj4Wb5lOlyd0gtXKl/C2A/TdGV9G2zOJmx8laGOKvHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qvzq9LTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qvzq9LTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EC4C2BCB7;
	Mon, 18 May 2026 20:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779136951;
	bh=XzHqnbQOBkUaRcTLifkZfbcC2NZQ6vvm6fZ+AabYgYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Qvzq9LTU1j2Md3UlSD4K4Je+8i+av8MIKEYL4QNeS0c5R/iKBS7aop1H6fW62ckTs
	 sF8KgY4wn+sZaOMZI2afUnYIDgZ9QbTTF6gu07yY+rp8QOpEx2CnqJU4yywAK2gY9x
	 oIW9nEFJeu3ZW2Gr79MH68BvFmZTyk6H89ET6R7HSDVrSfU2WiCPJU0JtXN8EJNh5Z
	 tmsdk+LtDH2xtCmRCEegGK7uBmcxEIho9lOd2kRDxp61wmILFmBIQyn89O2X3KjnDC
	 95Ayil7Y8kvrqo+R6EqUiJyqPafnKApXckuX0+aVo9buCnMZEAVEYYyH///oIfePoa
	 go7RqBxWhAkXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: usb: add Qualcomm PMI8998 Type-C
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: taygoth <taygoth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <5f4271701066943ead54f82003ab282c4b39f3da.1779127507.git.taygoth@gmail.com>
References: <5f4271701066943ead54f82003ab282c4b39f3da.1779127507.git.taygoth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 20:42:30 +0000
Message-Id: <20260518204231.69EC4C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `qcom,spmi-pmic.yaml` parent schema unconditionally enforces=
 the old `qcom,pmic-typec.yaml` on all `typec@` nodes, which will cause `dt=
bs_check` validation failures for the newly introduced `qcom,pmi8998-typec`=
 hardware node.
--

commit 1c9db8c5249c49002058f3167b19c898d414957d
Author: taygoth <taygoth@gmail.com>
dt-bindings: usb: add Qualcomm PMI8998 Type-C controller

This commit adds a new devicetree binding for the Qualcomm PMI8998 USB
Type-C role-switch controller. It describes a hardware block distinct from
the TCPM-based qcom,pmic-typec controllers, using a single consolidated
interrupt instead of granular per-event IRQs.

> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yam=
l b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
> new file mode 100644
> index 0000000000000..f2814f5ce3de7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pmic {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        typec@1300 {
> +            compatible =3D "qcom,pmi8998-typec";

Will this node cause dtbs_check validation failures when instantiated
under the PMIC?

In Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml, the
patternProperties rule for ^typec@[0-9a-f]+$ has a hardcoded reference
to /schemas/usb/qcom,pmic-typec.yaml#.

Because this new qcom,pmi8998-typec schema defines only 1 interrupt instead
of the 8 to 16 required by the older binding, it will fail validation
against the parent PMIC schema.

Should the parent qcom,spmi-pmic.yaml schema be updated alongside this
change to permit this new hardware block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779127507.gi=
t.taygoth@gmail.com?part=3D2
