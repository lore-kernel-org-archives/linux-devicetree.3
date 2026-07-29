Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF371A2C0B
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785287312; cv=none; b=CGaXf8C3zErnJNPjzA6Kc6sxh/FtrClMmGeKo6ehnb9xyaRkx3q6yki15C1CqQf/BLvEPr7mhbHsAbLUrvEJnnuhWbJemSQViWVM23YQSG5y5mVsflo38EdKeIMfjcZtuiffVokwU3JAXLD+jG3lWSwc+VtuKhMMF+p/V1CrdLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785287312; c=relaxed/simple;
	bh=QS7fHjqa16zkkad51/El8mnPws5kqZwFQ2atwDfdn8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fG2gvb0MyPsPSa5rNAMGKydfiCQE8GZyGoFprcm8XZem75fkT2RkavaTCn8h0yEBffR/9dHslAmdAbb/YGNAR/5lhphumiN6FT1oElrdQg/Il3yBzZyqrgoAwXdVoHA8Vc3GX7fqYZOeaTmgtyf9bY5TEJlspyD6CbLt+ffJHE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClUSpVze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClUSpVze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1991F000E9;
	Wed, 29 Jul 2026 01:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785287310;
	bh=DlFh0t3RyGJwURCUjH77sTI+0wnEERN2rnVqmuFxQvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ClUSpVzeFa38fAC7JxRHGeuFhtfqR2+nLM+UG7AbiWA0SsQEVJHBUrJVcyZLKdJGa
	 JleS/YReGsxNfz6zvbf7q8FW+2heZcQF9s4UTfQNH7DO8Y1AVLLnZcaxS2fxPjn9+8
	 gyeviKWr0Jke3JFYALHTaUZPtBUCgYc0OaMAhS+7yCV9jNIkPhTf3YjQ6/bnWSu+aM
	 UpURP3yh7wT1chxccJVw8bDMlP1exYbg2CJoawYHeLD0tggDOA+ICqSpSlhsOWxxb3
	 i0SHXkX8M4QVvUK/8mo+0MEr7AAaeQWeJPKvMuDbx8kJRlVbslSqSy2ifYDXpmaeDb
	 X65uB7sTmymdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/6] dt-bindings: arm: qcom: Document Nord reference
 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729010022.875799-5-shengchao.guo@oss.qualcomm.com>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
 <20260729010022.875799-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 01:08:29 +0000
Message-Id: <20260729010830.3F1991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema omits the required specific SoC compatible strings (`=
qcom,sa8797p` and `qcom,iq10`) for the new Nord boards, restricting the val=
id compatible array to exactly two items.
--

--- Patch [4]: [PATCH v8 4/6] dt-bindings: arm: qcom: Document Nord referen=
ce boards ---
commit 460ffcc78443a859799a20a78b0fc8610e9fa849
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: arm: qcom: Document Nord reference boards

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
[ ... ]
> @@ -401,6 +401,12 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
> =20
> +      - items:
> +          - enum:
> +              - qcom,iq10-rrd
> +              - qcom,sa8797p-ride
> +          - const: qcom,nord

[Severity: Medium]
Does this restrict the compatible string array to exactly two items, omitti=
ng
the specific SoCs?

The commit message explicitly mentions SA8797P and IQ10, but the schema
only allows the board and the base series (qcom,nord). Standard Qualcomm
compatible chains usually include the specific SoC (e.g., qcom,sa8797p).

Will device trees that include a structurally correct 3-item compatible
chain fail dt_binding_check, forcing them to omit the specific SoC string
and potentially preventing future drivers from matching on SoC-specific qui=
rks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729010022.8757=
99-1-shengchao.guo@oss.qualcomm.com?part=3D4
