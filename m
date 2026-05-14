Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02C023D28C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778736821; cv=none; b=oTco2XulhTqti2WXnBYqa4QvgnaooTdRvYMd6DLZBzQ6kDfeDG7rEOKM88ilMGnDIjyWUZUP1nOFMnbNOzQdrbvklMtayFGGNp6CPqacjisSCeKeioTnbMge3trARSqBX2bD9UcAhcBFCoCvmrdFV8yogIdonfF8QYN7qh8lfkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778736821; c=relaxed/simple;
	bh=7g6RUZd2j16FB/oQJ+AhSfq8OxLZ05rk5jl735ZnZNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mdxqPZGVW3kMBQOGhAYia0JNaW6Wv/9YK4geBEhJAKbLA/pU4ti8zWHEoq6pZ4QflHjF7O/i2THjBzVkAVsuBUVLM9E9/g3fFGihwccaPlFYsBp2l5wzWE/soNGmdvbr0BkQJEe4RcXnWnH/5Y5PqQdRk3Ttebz+qyg5tZBhJo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rp1zCATL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rp1zCATL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE4EC2BCB7;
	Thu, 14 May 2026 05:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778736820;
	bh=7g6RUZd2j16FB/oQJ+AhSfq8OxLZ05rk5jl735ZnZNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Rp1zCATLDNoLJK1dImMrFzbizqv2ZaxqIHBeTzS+oND7pQt9obwRR43D0JR4E2gjH
	 Gxycnwo9Fe3z4Mhi1VqSnz6E/yZlzuLzhuc71Q2lRx0f8gTDbc7xTtxNrZk1+h/W6n
	 CfDprIpve+XqMOgldWeBxv83fjYKqkAw779tA0Jp+Th8K/+EH2U56XRQmuyAanC5k1
	 JdRKzCzqAQlXE0upVHDEL4pxd+b7KN2SQBQtqKi9ZYZ5+Qad8rkzJu1WuhmP3q6kN/
	 BeV/u4V1h4yYr9Eg9mEUOFJPqWmtrnA3qINlbIImUPAfWHNZsZXqm9yfymhu3C3UUF
	 d0sjZ1HRaEqkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-1-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-1-b59c370dc281@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:33:39 +0000
Message-Id: <20260514053340.4DE4EC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The schema does not define the `power-domains` property, preventin=
g valid device trees from describing the hardware correctly.
--

commit b3d73d9e0090a370ecfafe8774b6d58d6907b4db
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC

This commit adds the Eliza video clock controller compatible string to the
existing Milos videocc binding. It also includes the corresponding
dt-bindings header for Eliza.

> Eliza Video clock controller is on CX and MX rails similar to Milos.

Since the commit message explicitly states the hardware is on the CX and MX
rails, shouldn't the power-domains property be defined in the binding?

> diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.y=
aml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
> index 14c31efe1308a..6e3e4424af78a 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
[ ... ]
>  properties:
>    compatible:
> -    const: qcom,milos-videocc
> +    enum:
> +      - qcom,eliza-videocc
> +      - qcom,milos-videocc
> =20
>    clocks:

The schema qcom,milos-videocc.yaml does not define the power-domains proper=
ty,
and neither does its referenced schemas. Since the schema uses
unevaluatedProperties: false, any device tree node that correctly specifies
the power-domains property to model this hardware dependency will fail sche=
ma
validation.

This forces developers to omit the property from the device tree entirely. =
If
the required CX/MX power rails are not incidentally enabled by another
consumer, accessing the unpowered video clock controller registers during
probe or runtime could cause a synchronous external abort and kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-eliza_mm_c=
c_v2-v3-0-b59c370dc281@oss.qualcomm.com?part=3D1
