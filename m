Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CFB371D13
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 18:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783708160; cv=none; b=Hn2lxHTnqedZHRdEBxXQJzrmPT8q9SuzhwN3vxUL97Nm1xyGFTvg9WnI08DmCqV43i/o19uGl3PNckOLb/syCtJW5K6yIk7tmZJGqHRAQcd3IC4sEt6dVLe2MX78Sc/epb8p4zMe7nAvkBs4aRUB4i+h1CRblOaS9+DaYCjp03Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783708160; c=relaxed/simple;
	bh=ntQqPPEx23o84raPYbsRZlhN1VA991ZkLKwvNzZTqds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gpbziPX5omuLaQ1alVxQLNKHDmtNvHE5R9vpWgoDdIPJllss+OeCV1lZ9I7ylCZMrQHEoam/nwUdnJXd4iHh/RetG6N4v/8/kYsDMsxU+u0ZpPibKOrD4one/MpqEMrDEO4x0JzAzGGqxmPSpaGSbvi/3y/NdPcQMK/Xba7sIlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPJMwJOU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPJMwJOU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD89C1F000E9;
	Fri, 10 Jul 2026 18:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783708159;
	bh=hV6XeIYdq4kp/ILTdf7pwT06XRG0SCFacK+DSSyTsDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GPJMwJOUo1e+YsepHiKrgFJzdDLn3X8KYStBlYRcmDwCjAH2yFS6eIoalXG+10WoC
	 V2sdOuLPOPLNxmn8AtX3Ll8fUW45+ZGuXzO+ulKfjLt5/dnqt13Elbpb4fa3iknJh7
	 OTwBRQqe0tePC7VGXkrFMWXV2ox5tmejr+7yDoH8LuMeIsq/mBRy0kRhX7ftlC8fKT
	 RbWhZMeRkhyA7ynql0b3kl38IsrJfIeqVmdQWs00YVtUHwEDAxzwM/fa1Pre1iCjF/
	 BdnwL9J87sc5R+iRc5CtbpOZXH84FWY0+bpbZgHRnoYFSZ9UwHdpStGYzYfT1MlThL
	 w8pomSOEydGcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: Introduce nexus nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-1-b4680787377e@bootlin.com>
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
 <20260710-schneider-v7-2-rc1-eip201-upstream-v2-1-b4680787377e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 18:29:18 +0000
Message-Id: <20260710182918.BD89C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The clock nexus node schema omits standard nexus map properties =
(`clock-map-mask` and `clock-map-pass-thru`) and `#clock-cells`.
--

--- Patch [1]: [PATCH v2 1/7] dt-bindings: clock: Introduce nexus nodes ---
commit 4092325fdc1397916665dc9c21bd4330df6026ce
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

dt-bindings: clock: Introduce nexus nodes

This commit introduces a new device tree binding for clock nexus nodes,
allowing hardware containers to remap clock specifier lists from consumer
nodes in a generic way. It applies the concept from existing PWM and GPIO
nexus nodes to clocks.

> diff --git a/Documentation/devicetree/bindings/clock/clock-nexus-node.yam=
l b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
> new file mode 100644
> index 0000000000000..ff3283bd5fb11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
[ ... ]
> +properties:
> +  clock-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix

[Severity: Medium]
Does this schema omit the definition for #clock-cells and the standard
nexus map properties like clock-map-mask and clock-map-pass-thru?

Without these properties defined in the properties block, there is no type
checking for clock-map-mask and clock-map-pass-thru. Furthermore, if a
consumer device tree node uses them and specifies unevaluatedProperties: fa=
lse
in its own binding, could it spuriously fail schema validation during
dt_binding_check?

> +
> +dependentRequired:
> +  clock-map: ['#clock-cells']
> +
> +additionalProperties: true

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-schneider-=
v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com?part=3D1
