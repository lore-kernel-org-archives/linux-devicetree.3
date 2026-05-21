Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7743CC7FF
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365512; cv=none; b=bRZSyUxnvuAiXXzg/zkklWzFaK1YQCUeKx+QHGmule8uCleB1GQyJi64FyVRnIbaYwKvDERSo6nA+XGvwkjjSzKUnzVFCbmD1Vx+m2gIL1xTrCqoOSCUxG15txn0MAcFZNOYbjFyfIn6RTyxyPKPx0zqEHfbCXE8ug7eY7eDnZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365512; c=relaxed/simple;
	bh=TXy9ST2wzaQqS9PyDphSrA4G2mrI66BhFLd8Bz33BPM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=micgh4ZBoaX0f2d9mGjrrlDJODncM98QX5U/1XG4vj9mSXWMo2vVUXHXuJwOnD48cm5P6h8hW9CMH6NnlGhPhevscz2FxovgPzN1V6RmsImoRA8G31iVyLMTWpno3yYHCX/gV7SyZd3yaCJTCKf2+9ZsbnPBofDE3s3eBeoSn4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtCv+VYD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtCv+VYD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AF71F000E9;
	Thu, 21 May 2026 12:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779365510;
	bh=lsIBav6Z0VrkLuZlsxUpw+LRhDTFC9K+tZXyKTeoTSo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XtCv+VYDVJSNBav4LvcZAfvFWjRoHKUcp3dL948M3q/hxYVqOV6YKYxINwotSExtq
	 wfVHhxEqDtPHGzMDckwtrMR6hcDLQ6X1P3N7lQX1SuwauLe42ENIv94JQ8TJXSSli1
	 eI4VUGDOWeCwi8UDZbKHxBjHXVfO8YOhnyszqvW5LWHd7PDDhQ8sWgf8BPuP7LBbiU
	 ZOrQPc8RXs92I9J7zN0Drdz0h0bIQ3SIGkpf3Z9SIpy++c0TyOfFRm6Wmw6mM68y7O
	 M7+G3fsZltkYklk3K48qNyj/npnSxImIAj3NGII+tXjrWlMkWRMjYJNRAFWSGZCLSb
	 xaAdOFKjOehQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: analogix-dp: Add
 data-lanes support for endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521114459.1394264-2-damon.ding@rock-chips.com>
References: <20260521114459.1394264-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 12:11:50 +0000
Message-Id: <20260521121150.95AF71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `unevaluatedProperties: false` on `port@1` and `endpoint=
` nodes leads to leaky schema validation.
--

commit 707c36bedcf3fbf40724e79e4e941f57ce9d5a3a
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: display: bridge: analogix-dp: Add data-lanes support for endpo=
int

This commit adds data-lanes property support to the port@1 endpoint for
physical lane mapping configuration to handle PCB lane swaps and mismatched
pin definitions.

> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp=
.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
[ ... ]
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Port node with one endpoint connected to a dp-connector node.
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Port node with one endpoint connected to sink devic=
e node.
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]

[Severity: Medium]
Does this change allow undocumented properties or typos to silently pass
schema validation?

By replacing /schemas/graph.yaml#/properties/port with the open
/schemas/graph.yaml#/$defs/port-base, custom properties can be added.
However, since unevaluatedProperties: false is missing on both the port@1
and endpoint nodes, the schema validation becomes leaky.

Would it be better to add unevaluatedProperties: false to these nodes so
that property typos (like data-lane =3D <1 2 3 4>) are correctly flagged as
errors during dt_binding_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521114459.1394=
264-1-damon.ding@rock-chips.com?part=3D1
