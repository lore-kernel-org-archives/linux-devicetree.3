Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCE2369D69
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 09:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564001; cv=none; b=RtEzrYXnMcfzwNgUHYpSxaHuGtn4eZJJhJkt6pyGsiLMkGAxeGEjHvwo1NXsctL59bOG2mBwXBDD8bUi1BSdsdkRBupS9RvBY7ZkvhlQVrvMg4/6o7hnwEFFk2sig96fCcLZf+VvrPTC2b2ubZAOZUu6nOwccKO5H6jd3hYntCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564001; c=relaxed/simple;
	bh=l9EJd6eCAOm30xsTUKABVr7KhIAfGQURNxkvtmopcNM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RauX314BA1WT0FaVIRsk18j8cPWjAkCnpCBG8TpQSCcs4jlkp01C9TlF+OVLZiFvNPBtOXFu1QWAFWlVYCutQudyKxqXnkXJmmZriUvsDuM2RPxiHJENO2iKDtUxX1hhoiDzpcWpLlbHQQJskv4NUQWy2XurUdHjzKVn5PulAsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mstnDBFR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mstnDBFR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40751F00893;
	Thu,  4 Jun 2026 09:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780564000;
	bh=tkeYPWXEAPxj0AWpRR3es7QnxH79QnuybIneW2XNCYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mstnDBFRhw4SE48d+GkRFFF76mo6KQndIOKytH1EwZCXkPL5KE3CJgCUEqAYnUxZ+
	 ST/m6Ev2BYI1vLPoViEH138PCkNQzmhXnh5dIW2azHjchzQ5ANL1svWvYwQHWKPedE
	 6MtNc/Qy51QY74EmlfxzHvohBK/Hm2z4AI+zS6cRAIGn689IO8tfGaDm/teANzjDOZ
	 IzT04HFnk9+cdRyf9HM2sJ3xJIiPvZxoK3vHzP//UAX5Rx2oFFNMXxQhEQ6m19PwLN
	 RkFCQEmemKYNI9YwIOsFXICltC5Tvj1FiQnPBFl115cGCefmquCWPrelBjVOKA+sOp
	 XNRSv+DNr7ZAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: display: bridge: analogix-dp: Add
 data-lanes support for endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260604085220.2862986-2-damon.ding@rock-chips.com>
References: <20260604085220.2862986-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 09:06:37 +0000
Message-Id: <20260604090639.D40751F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `data-lanes` property is defined strictly for the `endpoint`=
 node name, causing schema validation to fail or miss constraints if applie=
d to valid unit-addressed nodes like `endpoint@0`.
--

commit c6792a12ea4c785878c85982c6a4537b6a1901d6
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: display: bridge: analogix-dp: Add data-lanes support for endpo=
int
   =20
This commit adds data-lanes property support to the port@1 endpoint in
the analogix-dp bridge binding to allow physical lane mapping configuration.
It also updates the Rockchip eDP DT node example to demonstrate its usage.

> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp=
.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> index 62f0521b09245..ecf206871cdde 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> @@ -42,13 +42,22 @@ properties:
>      properties:
>        port@0:

[ ... ]

>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Port node with one endpoint connected to a dp-connector node.
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Port node with one endpoint connected to sink devic=
e node.
> +        properties:
> +          endpoint:
             ^^^^^^^^
[Severity: Medium]
Does restricting this to the exact node name 'endpoint' cause validation
issues for unit-addressed nodes?

Because JSON Schema strictly matches object keys, a node named endpoint@0
under port@1 will bypass this block, meaning the video-interfaces $ref
and data-lanes validation constraints are never applied.

Should this use patternProperties: "^endpoint(@[0-9a-f]+)?$": instead
of properties: endpoint: to ensure unit-addressed endpoint nodes don't
bypass these constraints?

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604085220.2862=
986-1-damon.ding@rock-chips.com?part=3D1
