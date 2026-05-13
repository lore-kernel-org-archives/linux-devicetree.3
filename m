Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375433911C0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648409; cv=none; b=N+wdPSjSDOYVjj3mPTM77MqNArk7kg9LHUAODfRdIdhjx67Gk9HaVC1q4EgPB1283QIRaB5XRWUWpkfBG9we08Zeb+chuxW9SzqxAgxK0yEHW8Z8TGF8HV5ARvlQ7kr/MGX2GCZx/GhcA7edocRCgegzUM2etFSbhRB6WggejFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648409; c=relaxed/simple;
	bh=TqLCITmBHROlI/6bD94uBpynN298xODzRDKewaoiTeU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GiEwjtT06TbdN3zXkt1EmBdyq1EcB1VqS96A8MiNfGL8q2e9xF9MbHWxUbJp6TiZXQS7vGWvRKTuHBVWcDA6htevnFKVkeDeiDxAcXiZxaYHAJMAW6a/rlKO0iDu3hy/sCmjCSqYQlT1AR5PWgUP4abVY8Av0yY6VfXSy8O2yq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyw3PPHb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyw3PPHb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C829C2BCB7;
	Wed, 13 May 2026 05:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778648408;
	bh=TqLCITmBHROlI/6bD94uBpynN298xODzRDKewaoiTeU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=eyw3PPHbv83ZBB3TjahSG70+ICxPBtffCGUkPYvYsZ7kv6xqOag3QhQlpOrlj9/ya
	 yv6LVAsD/F2xUWUlB5fc9sDpcUVhIwA4n1Ij3ZFtaVP8ivT/nQjB8FQ1g1Dxh4ODLi
	 ZGkDCEEX+8K+h9p4HNbu/VsLIMOevdb/uCdqIB+u7vvBGBnsw3uacR/21+zD4lyU2j
	 5asF7yuXTsLDz77uoQ4adSkMvyo03Hzu6D5J4VrKXEd6njTpoHxqaf9prh0tmMbHLy
	 EMK3KkpWngweKz4hYo6q1fu/5OU6i7dEpmEuiGif0KaG+UCDddANRVvbgp/bDg4hl7
	 GgjYBFGJNWSKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/16] dt-bindings: mfd: mediatek: mt6397: add mt6323
 PMIC thermal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260512-mt6323-v2-4-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-4-3efcba579e88@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 05:00:07 +0000
Message-Id: <20260513050008.8C829C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `#thermal-sensor-cells` property is constrained to 1, but th=
e MT6323 hardware only possesses a single thermal sensor, violating DT ABI =
design principles.
- [Low] The device tree example is missing the `adc` node and its correspon=
ding `mt6323_adc` label, which is referenced by the new `thermal` node.
--

commit 5d14cb32b8298f2c8dd1f6c1a6921b9e3942bf24
Author: Roman Vivchar <rva333@protonmail.com>

dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC thermal

This commit adds devicetree binding documentation for the MediaTek mt6323
thermal monitoring hardware, which reads temperature via an AUXADC channel.
It configures #thermal-sensor-cells to 1 and includes a thermal node in
the example block.

> While mt6323 exposes only a single thermal sensor, newer PMICs like
> mt6358 provide more than one sensor. Therefore define #thermal-sensor-cel=
ls
> as 1 to avoid breaking devicetree ABI in the future.

Since the mt6323 hardware only possesses a single thermal sensor, shouldn't
#thermal-sensor-cells be constrained to 0?

Future hardware variants like the mt6358 will use different compatible
strings, which can then define their own #thermal-sensor-cells: const: 1
constraint without affecting the mt6323 ABI.

Setting it to 1 here forces a dummy cell argument on single-sensor mt6323
devices, misrepresenting the actual hardware.

> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index beaa67bf0df2c..2c826737189e7 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
[ ... ]
> @@ -511,6 +547,14 @@ examples:
>          rtc {
>              compatible =3D "mediatek,mt6323-rtc";
>          };
> +
> +        thermal {
> +          compatible =3D "mediatek,mt6323-thermal";
> +          nvmem-cells =3D <&mt6323_thermal_calibration_data>;
> +
> +          io-channels =3D <&mt6323_adc MT6323_AUXADC_CHIP_TEMP>;

Does the mt6323_adc label exist in this example?

Looking through the example block, the adc sub-node and its corresponding
mt6323_adc label do not seem to be defined. Will this cause dtc to fail with
a reference to non-existent node or label error during dt_binding_check?

> +          #thermal-sensor-cells =3D <1>;
> +        };
>      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-mt6323-v2-=
0-3efcba579e88@protonmail.com?part=3D4
