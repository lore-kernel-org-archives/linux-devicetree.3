Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5B3FCB13
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174793; cv=none; b=XrGTl5Ve8ktxVFft65Exf0MjqthXknewIpetggDEruuIbbstYT0n87PHM4+Pcotw5gq9OkyFmMPnHxarp4C9dobD9qAELJuv9z6zMsx09XWe6gzEh4NvnC7gtqycl8z5kb+n1J9gSNDYzyxk1r0hK4rVY/o7viZ90Ej9O28SEJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174793; c=relaxed/simple;
	bh=w85PC1EkUqEUQTQ54oPXa5J3W308akXAgvGWArwFSjQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IzW5O6NUgdNEkJze55iD+/aJBwoI2lZU0b/CWGbf5HIHA4ZmibRjcaML7WR577lmdQiZSfiy4CPU1LsLJgi0U4nC7krvbeiM4dM42DkPt4BUs3P1ASW/KbyOYYAHu83T53rGQOarymTQxllYaahCSgb3hsalzWV//oNcGx9Olq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0sRHiN8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0sRHiN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB221F000E9;
	Mon, 27 Jul 2026 17:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785174784;
	bh=d+88j4Ml7SAUWQm54F20v71UdRpzP+Qd8s8k16YixDo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M0sRHiN8wPM4BbpylkoqxPBTCTw9mzr/F1S5LZDom8g6XfFe+dYnp4SzFbIgmXLic
	 94Ay/JFiDxQO3gzVoCxyj+pVZa45XgVOpFDZusidaFjtGyb5ZaAueciIL3Jqetbm1G
	 zRiyYtPjNnIwO/7WY05NJ0cdt/VXSrZDPU4BfGitNknwxHthVhCCZGnUZ+Ns4ULJsD
	 DHS3kKfNiLjFkS+dawTJUoPQHG15ElcJL2qw25x5kjViEgHaSi8o/erRQzaBQuHPnd
	 S+qRru64OMdM2j9FXSBEEGMyWpGpBkERz3W0hQuCi8zbnbG+hDr/TMuLk6FP0k0DR+
	 mg/3CRYuSC7Mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/35] dt-bindings: pinctrl: airoha: en7581: fix pwm
 pin-groups
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727174141.664933-3-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-3-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:53:04 +0000
Message-Id: <20260727175304.9FB221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The sister binding `airoha,an7583-pinctrl.yaml` is out of sync wit=
h the hardware capabilities, missing `gpio47` and `gpio48`.
- [High] Conflicting conditional constraints for the `i2c` function make th=
e AN7583 schema unsatisfiable.
--

--- Patch [2]: [PATCH v8 02/35] dt-bindings: pinctrl: airoha: en7581: fix p=
wm pin-groups ---
commit 69fe8d84177a9cae3d1defe966ff7b51f98c8706
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: en7581: fix pwm pin-groups

According to commit 08a5af468e613b ("pinctrl: airoha: fix pwm pin function
for an7581 and an7583") there is no gpio47 pin-group, so device schema must
be fixed.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.=
yaml
> index 0c5a7eb6d563e..12dd85b5b4105 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> @@ -208,7 +208,7 @@ patternProperties:
>                           gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
>                           gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
>                           gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> -                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
> +                         gpio42, gpio43, gpio44, gpio45, gpio46]

[Severity: High]
This isn't a bug introduced by this patch, but while you are fixing en7581,
the sister binding Documentation/devicetree/bindings/pinctrl/airoha,an7583-=
pinctrl.yaml
is out of sync with the hardware capabilities.

The enum list for pwm groups is missing gpio48:

Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml:
    ...
                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
    ...

Additionally, the enum list for pins is missing gpio47 and gpio48, and
maxItems is incorrectly constrained to 58 instead of 60:

Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml:
    ...
                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
                     pcie_reset0, pcie_reset1, pcie_reset2]
            minItems: 1
            maxItems: 58
    ...

Running dtbs_check on an an7583 device tree that configures gpio47 or gpio48
will fail validation. Could these constraints be updated so valid an7583
device trees can pass validation?


[Severity: High]
This is a pre-existing issue, but there are conflicting conditional constra=
ints
for the i2c function making the an7583 schema unsatisfiable.

The allOf if properties function block checks for function: const: i2c but
expects groups: enum: [i2s]:

Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml:
    ...
          - if:
              properties:
                function:
                  const: i2c
            then:
              properties:
                groups:
                  enum: [i2s]
    ...

Because there is another if block that correctly requires groups to be [i2c=
1]
for function: const: i2c, the schema requires all matching conditions to be
satisfied simultaneously. This makes i2c impossible to satisfy and leaves i=
2s
unconstrained.

Should this typo be corrected to function: const: i2s to match the group?

>            - if:
>                properties:
>                  function:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D2
