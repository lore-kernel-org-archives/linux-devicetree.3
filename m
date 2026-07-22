Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297F1345EB5
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741396; cv=none; b=J6ETgAqDy0yUTQT119eXdhtNR/0DvmuhauJ7oyfTBDV+8vunCG2ED+aFLduaKe4/3HNHfEVrMmkGZchI3R0Y8xgnCJmR0h/jnWbukoBNBauS7/3c6iN9VOMglItrYkamchokwZ+j3IGuDJfpKR2bDeiNeaOJ15E9Kmc9SbVri0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741396; c=relaxed/simple;
	bh=T6XITIr2vFOWUecj1hZCPGiaLqk+9GIlhHL83xeo9NY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KB+hwxB1v5xZf4P1HVpMfoeOJ/0lZ32CK/6YwvyRWKx2Jz+s0fXf0ZLjTAnvNPadWoRdhIKe3wdf3mGBMMfG5vEoPtxUiMI1QYag3Ls7L7eb2hC05t23wEmkChRIg+AvwiFD2IYuGEsPClu7/ZovGtfYKwgVuRysZ3BlJVmTAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXReMzXd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXReMzXd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C131F00A3A;
	Wed, 22 Jul 2026 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784741395;
	bh=MaoU0YPPSZfpXDcRdlhbR7HgIYNgXeCIRSLGiq3175g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jXReMzXdwYbRIMINdmmAIIXwERfMNhYsAb3ud3xV74k4k4/vOwQ0ACf/yHzLIkh2m
	 0Ed9n0jJJzxn8vLVd6xCdlD22JoEUa1EWbSP1LLrHQXEP7Ne9YN0E5WrXjiToXDchG
	 lBt3sbqhR++tUZVhbiFPyBgWqEGldqAZdimKDlgHY0grcedvTSNo7XDPP4foyhUgTO
	 toiT2hztSnhUV7EBpp7VecHf2djr387kUdw2uCacrwYwRTIVDrHqFZV4ySRDHzq87J
	 ZyS3tLxxVivPulV/436T5SmzxQNGcp3d6oLYEfKKv4a+i3XoXaj3l8DInq5DbG2p8a
	 RcKDqvOHCmGmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: omap: Convert L4 interconnect to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722171840.299303-1-egbostina@gmail.com>
References: <20260722171840.299303-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 17:29:54 +0000
Message-Id: <20260722172954.C4C131F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Top-level `additionalProperties: true` disables validation of mi=
s-typed or undocumented properties.

Pre-existing issues:
- [Medium] The schema enum omits multiple actively used compatibles and car=
ries over a typo from the text binding.
--

--- Patch [1]: [PATCH] dt-bindings: arm: omap: Convert L4 interconnect to D=
T schema ---
commit 1d2037651b45f654606d66d4cc1b50eca85740dc
Author: Eduard Bostina <egbostina@gmail.com>

dt-bindings: arm: omap: Convert L4 interconnect to DT schema

This commit converts the Texas Instruments OMAP L4 interconnect bus bindings
from text to YAML schema. It defines the compatible property as an array and
adds a select block to restrict the schema to TI-specific nodes.

> diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml b=
/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
> new file mode 100644
> index 0000000000000..465d48f44730a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
[ ... ]
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - ti,omap2-l4
[ ... ]
> +          - ti,dra7-l4-wkup
> +          - ti,am3-l4-wkup
> +          - ti,am4-l4-wkup
> +  required:
> +    - compatible

[Severity: Medium]
This is a pre-existing issue carried over from the text binding, but the
schema enum omits multiple actively used compatibles like ti,am33xx-l4-fw,
ti,am4-l4-fast, and ti,dra7-l4-per1.

Does this also carry over a typo in the am33xx name, specifying ti,am3-l4-w=
kup
instead of ti,am33xx-l4-wkup?

Because the custom select block strictly filters on this enum, device tree
nodes using the missing compatibles will silently bypass this schema entire=
ly
during validation.

[ ... ]
> +required:
> +  - compatible
> +  - ranges
> +
> +additionalProperties: true

[Severity: Medium]
Does setting additionalProperties to true defeat a primary benefit of the
schema conversion?

This globally disables strict property validation for the node. If a proper=
ty
is misspelled (like reg-name instead of reg-names) or undocumented, the
schema will silently accept it.

Should this bus node instead use a $ref to simple-bus.yaml or
simple-pm-bus.yaml and set unevaluatedProperties to false?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722171840.2993=
03-1-egbostina@gmail.com?part=3D1
