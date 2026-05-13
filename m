Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8615442A9D
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778646971; cv=none; b=LD8qtzmJ+HwEFDIc64+BD3WGOxM0FytZLkNQAS+9smLhw3PtAz8vp2ddhAjHlFjg+J9a4WlA66GNivoaAFcy1PQ79as4rj05R7t8ttTAYOJPj4v8pfZuNY7/qLYO5JAWVjhWggW2O2tb9QWDf8CgzB0veM3DS6YHiWzVhtiEP64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778646971; c=relaxed/simple;
	bh=PYps/v4nWQ//yqjCHqoUKHnHNRlEdYHZoVUhEIrd0E0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p6vOiYFScLGFrLz87B4lReEMXT5w5Gq8B9aI7g77Cn2uVRbwY3uWV7WFFvZWHmqqnPanlOuYx3pdpj0FZXxOIMFqF0c0SVp/7uUxppjsZWcRi4R2JgFHm+ig4Vybh8Pq9COLCbwQjQsq9xS0nIbSwHUcnwF+3HguI5/7mbYL1oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3/ycbN3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3/ycbN3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11F6C2BCB7;
	Wed, 13 May 2026 04:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778646971;
	bh=PYps/v4nWQ//yqjCHqoUKHnHNRlEdYHZoVUhEIrd0E0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=e3/ycbN3cBNpB/mnCaz+4aJNtED5Ol4OnCDYGiImmaI1LiR+/w0egA6pIt275PMCs
	 rE8IEeEGSoO7jS/OT3gpXzCLDnbzyilE8ZVRe1mvCuX9mGhwDBmBF5zADjf5aBgCsk
	 D2bsU9OVCt/D23lOcgnS6UobriVYAPx/SLaPSUAE57/21Zfei/Jzu+aQ2osymZXPnd
	 ojX5FV4V4a7OZNQnNDwxvyUYr+kyR8KfnfX7FCozMT9G/diS103/N3xsX6nFlmTPRH
	 eQfFBaP+IuBi+2sJaX0u5PD0J89sskPw7yxixhXo54y//UB9+fwvNFOH1dgBU4kd8G
	 xRDAqTneztwvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: add Qualcomm IPQ9650 GCC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-ipq9650_boot_to_shell-v4-1-1e87c8326e59@oss.qualcomm.com>
References: <20260512-ipq9650_boot_to_shell-v4-1-1e87c8326e59@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 04:36:10 +0000
Message-Id: <20260513043610.D11F6C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The binding description claims the module provides power domains, b=
ut the schema explicitly disables this capability.
--

commit 4db89a6dba2bb07dd7133c52ce96e3e38a472691
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

dt-bindings: clock: add Qualcomm IPQ9650 GCC

This commit adds the device tree binding for the Qualcomm IPQ9650 Global
Clock Controller. It includes the YAML schema and header files for the=20
clocks and resets provided by the module.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9650-gcc.yam=
l b/Documentation/devicetree/bindings/clock/qcom,ipq9650-gcc.yaml
> new file mode 100644
> index 0000000000000..f33105217a062
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9650-gcc.yaml
[ ... ]
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and p=
ower
> +  domains on IPQ9650

This isn't a bug, but the description mentions that the module provides pow=
er
domains.

[ ... ]
> +  '#power-domain-cells': false

Does this controller actually provide power domains? The schema explicitly
disables them here, which suggests the mention of power domains in the
description might be a leftover from copying another binding.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-ipq9650_bo=
ot_to_shell-v4-0-1e87c8326e59@oss.qualcomm.com?part=3D1
