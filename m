Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751D6381E83
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405930; cv=none; b=sgxVGSzaSrIOqY0veJXeYJiJoAEcdfgt565F4JUo4BYohB99vk440Md2ONqURNc5F+0YLYwSmaYRZJesJWTlVQQlQc7Gm723ORvKpX4oR+1yM9WUPk6ycX6LdzlwgqUDKntcU6JRKIiECxl24Y8kh8S0+XpgZOWfFeS6HRl0fbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405930; c=relaxed/simple;
	bh=RB5pAEcY3D1vYg+clcr9xdexhj/9oC+mIlVTjmTsuEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wefy8JS5MAXFxQkTfyJPVbfPCAbk6sJW2k9bjPPUhDuazqAG40J5oRk8b2OzhaH1FxSbDrGQFil0nFd7RiTfXWhxvkk2bY4PCFyVR+sbBMXfB/rCxhRRsPmg7I1plgcWOGWZtdTXBJ7sTG/9c/UoVkySEsKvzwn8NmjQAHxRwXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeyL/krk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeyL/krk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D0F1F00A3A;
	Thu, 30 Jul 2026 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405929;
	bh=e9IG/NyqnCLMNFzh6bT+AZNZM6V3TcCNCcD+o3j1Mo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AeyL/krk91cnu0WAqjWW+5ENIF5SV7u4+LoOltJg41NYPCflf5qTrud6ElDaGdfIg
	 T6QzBQZ0fnrQ4YTl7nuCOQ5eGprF8x9PT6aV39yGPZcXGJNVfRJy3HUM0Sy/W0HS7N
	 8iUCilk2OzRMT3N6+ocPXg+qKC0XLPBUjX8Gsj9PsSCMdB0/X09XJ0kRJq3WlMVQf1
	 SPsaZ/mGKFSd+x57dUsYPG+Tzrryqg4gAxknsH4SpBTZgw0XHRTCgfije2xmJmq+sN
	 Hbn4GhiQDLCVfbVZ/xU5bmVe6fYsfRElsEfvNQgzkNbo7Ci9WvpAH0SEnLnS7ziY4e
	 CcD/ip656FLrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/24] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-5-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <20260729-mt8189-clocks-system-base-v4-5-e356b813a64c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:05:28 +0000
Message-Id: <20260730100529.12D0F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `if` condition in `mediatek,mt8186-clock.yaml` incorrectly e=
valuates the `compatible` array using a scalar `enum` without the `contains=
:` keyword, breaking schema validation.
--

--- Patch [5]: [PATCH v4 05/24] dt-bindings: clock: mediatek: regroup MT818=
8 dt-bindings into MT8186 ---
commit 1f0ad49080ff837b778f75346bbaeb49fc6d7fee
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: regroup MT8188 dt-bindings into MT8186

This commit regroups the MT8188 clock and system clock dt-bindings into the
MT8186 schema to ease maintainability. It merges the configurations into a
common file for SoCs that share the same kind of clock controller design.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-camsys-rawa
> +            - mediatek,mt8188-camsys-rawb
> +            - mediatek,mt8188-camsys-yuva
> +            - mediatek,mt8188-camsys-yuvb
> +            - mediatek,mt8188-imgsys-wpe1
> +            - mediatek,mt8188-imgsys-wpe2
> +            - mediatek,mt8188-imgsys-wpe3
> +            - mediatek,mt8188-imgsys1-dip-nr
> +            - mediatek,mt8188-imgsys1-dip-top
> +            - mediatek,mt8188-ipesys
> +    then:
> +      required:
> +        - '#reset-cells'
> +    else:
> +      properties:
> +        '#reset-cells': false

[Severity: Medium]
Does this compatible match need to be wrapped in a "contains:" keyword?

In dt-schema, the compatible property is evaluated as an array. Testing it
directly against a scalar enum without "contains:" means this condition will
always fail to match.=20

Consequently, the else block will unconditionally evaluate and force
'#reset-cells': false on all MT8188 nodes, including those that actually
require the property. Could this cause valid device trees to falsely fail
dtbs_check validation?

Looking at the deleted mediatek,mt8188-clock.yaml file in this patch, the
original schema correctly used:
        compatible:
          contains:
            enum:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mt8189-clo=
cks-system-base-v4-0-e356b813a64c@collabora.com?part=3D5
