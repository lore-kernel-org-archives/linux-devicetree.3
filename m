Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C17E3B6376
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045200; cv=none; b=CWEDx+8hVk+gHXNsnJETtv5li8FV+ylFVrfYngHlPCtIKaSO+4hDoES7jeKM4LwxtRIBTWV4hWCOizdShWfCn8wjB3HSIReKV4pZNd8zfkhUptlJ721PIyJpIsU7TKeUcN9DDrmjVDSLE8SchwVBAnEUup/evkGOq5I4DvkWYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045200; c=relaxed/simple;
	bh=rb/TEf4+pD2bgrELPiCeLwflrnqwqIZxlb6+UDOfmxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RAoUQlt6DEWx1bfFmrFRZeNjI5fY38asmuo5sO+h4TiDJpp+rUuCpIvRms2dDOVw7G/4CtTCmlMCthNd4/DQ5/zry63fc4VOTV9Hwjdp5bqIMxAKHfcSwJjaBJRnSEeYmq+YIxXJRRNiIV5KB5t3gASkv0vQh8vHaabLcAhwhi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQMiYi8P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQMiYi8P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE481F00893;
	Fri, 29 May 2026 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780045198;
	bh=SAc2MkY2xHt+8m1n0q14IyR2Fpl2OAfHU45Js8RTpMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KQMiYi8PIvctwDr7bfehO9fPKucKIN/L0fq1lMnviQVRXEuCEuxoxo3wcHYpe88r6
	 lWOzK4mAXjQYevTEkkKNJEIjgbgUpEBcp+2dPCjcXR026ub70qOUZpSRQjHKbyir3E
	 BPcQMRMIEnXnaWwn19Dkb89VcDWxj1/4k1ck2hSGOtRSmzoTjfaMmggbY+tdBpnpeA
	 igbG8yzx17jPoDzwfR3fal0Bjq4xwd+pOcpMF2RjbJrqCohCkecAYR4fUOr60iXqy8
	 +kAI2QhJsXS58VB4NmH7M1B6pOUkXIxcW0O58rHVoveemBI7xgcNgd4MdwayenbcLM
	 RmK/Cr848gqug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/15] dt-bindings: display: ti: Move ti,am62l-dss
 binding to a new binding file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-beagley-ai-display-v3-1-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-1-7fefdc5d1adf@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 08:59:58 +0000
Message-Id: <20260529085958.8BE481F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Moving ti,am62l-dss to a separate schema file dropped validation=
 constraints on the 'ports' node, allowing invalid device trees to pass val=
idation.
--

commit 85fc6244328cdbbf7ce0fee4d16b0be90b2b65a0
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

dt-bindings: display: ti: Move ti,am62l-dss binding to a new binding file

This commit moves the ti,am62l-dss binding out of the ti,am65x-dss.yaml
schema into its own dedicated file. This change is intended to simplify the
original file and adhere to a "binding file per DSS model" structure.

> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am62l-dss.ya=
ml b/Documentation/devicetree/bindings/display/ti/ti,am62l-dss.yaml
> new file mode 100644
> index 0000000000000..ce6185dca18d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am62l-dss.yaml
[ ... ]
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          The DSS DPI output port node from video port 1, which may be
> +          connected to the external DPI pins or to the internal DSI Tx
> +          controller.
> +
> +    required:
> +      - port@0
> +

[Severity: Medium]
Does moving this binding to a separate file drop the validation constraint =
on
the ports node?

In the original ti,am65x-dss.yaml file, the ti,am62l-dss hardware was
restricted by explicitly setting port@1: false inside the ports node (as
seen in the removed block below). This enforced the single-output limitatio=
n.

Because graph.yaml handles ports using patternProperties, it allows any
number of ports by default. Without an explicit restriction here (such as
port@1: false or additionalProperties: false), will dt-validate now silently
accept invalid device tree nodes that define extra spurious output ports?

[ ... ]
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.ya=
ml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 49a007cbcd3aa..75d9640398f0a 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
[ ... ]
> @@ -189,38 +164,7 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: ti,am62l-dss
> -    then:
> -      properties:
> -        ports:
> -          properties:
> -            port@1: false
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-beagley-ai=
-display-v3-0-7fefdc5d1adf@ideasonboard.com?part=3D1
