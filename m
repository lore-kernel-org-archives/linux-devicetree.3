Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295C445FFAB
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115925; cv=none; b=lctnFbscZxV8iqepHgwbS1kzbEc8Ka76um/5cJPEE5SDs744LplfH01eAZuDU+xYcy7633vXqOi6iWN+Lv/2yBcEVch55mZutOmowkTvQqvw5PajGcVW4yxNxqFUbf2qJt1/+sFZi94Y3H2XuWx1OzhXAb9MAs2Y9iYc0aEUvpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115925; c=relaxed/simple;
	bh=EmC3f78Xd7UWrHx2XBzEL5rO/1FtzKEyqWL1s6gXTq8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c395ec0/qRcxehoV/imb46unThPl4ejYSj4m319y3260eMyXv0Jcz16O+eOcES3sFAMR++KitTX6anJuFbOpTcHxrw1ye2UxxXNw/k6mHDMpUB8DVlek2iNOeleJsDnJTHOKIxDWAf7WL5WPo8uASAOtZoOsx6q0cNgxn4bbDe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kl9gM3Q0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kl9gM3Q0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829071F000FF;
	Fri, 11 Sep 2026 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789115923;
	bh=EU4t0GdLYfH+AB9TmcAvgJlDtdIr/qHFDD4vtwuQDDs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kl9gM3Q0G17zNE97ZKMLA3B8a1KsB/4Druh/sZgHKKjG6WAgaI1BiKnywTLPFS7h2
	 8Ytm1UcHrmp1eK7YC2MxAe66LTi4f1Xk0KxMMcV75E4J3P+KUm4g2P9fN6Ml9qWvbO
	 WP7h3Pt0GN+HV6/Q3hxej8atFRc6tlsnWkyvs5/cIm7Jsz5xgB+XizSxeA8o7upI1i
	 t6Sc5aN5Jb2Fzr/1bMj7J4uC+EvJkhLBVmVOFS6SKbsdpiQTt1FzWdagrOTpXWPpO3
	 1FO8EzmICvjXniQarDothy2Pi2bFFnJLMqeWDrdJaX8akc3gEAo8YNJdhQ8kSZECNW
	 xDUOHyOtZzdxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soundwire: qcom: describe multi-master
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <d7b3d0618f20d18f714217d9604a7c09a3539578.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
 <d7b3d0618f20d18f714217d9604a7c09a3539578.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 08:38:43 +0000
Message-Id: <20260911083843.829071F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing `-cells` property definition for `qcom,multi-master-peer` =
causing dt-schema validation failures.
- [High] Undeclared `qcom,ports-ch-mask` property referenced in conditional=
 block breaks `dt_binding_check`.
- [Medium] Single-master configuration block fails to explicitly forbid mul=
ti-master properties, silently allowing incomplete multi-master nodes.
- [Medium] Commit message explicitly lists two properties but the code adds=
 three.
--

commit f97a4adf5082bcb22d04e3fb5cc90da2b743d260
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

dt-bindings: soundwire: qcom: describe multi-master

This commit adds properties to describe multi-master mode in v3.1.0+ Qualco=
mm
SoundWire IPs. It defines roles and peer relationships for logical buses us=
ing
multiple DATA lanes.

> v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
> bus with more than two DATA lanes. Add the two properties that
> describe such a pair:
>=20
>   qcom,multi-master-mode  role in the pair ("primary" or "dependent")
>   qcom,multi-master-peer  <phandle, bus-port-offset> to the other IP

[Severity: Medium]
This isn't a bug, but there is a slight inconsistency in the commit message.
It mentions adding two properties, while the patch actually introduces three
properties, adding num-lanes as well. Should the commit message be updated =
to
reflect the third property?

> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.y=
aml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> index 8e6973fa229c9..34ce8caec0a86 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
[ ... ]
> +  qcom,multi-master-peer:
> +    description:
> +      Peers in multi-master mode. Each entry is a
> +      <peer-phandle, bus-port-offset> pair. Peer N's DPn slots
> +      1, 2, 3, ... occupy bus ports (offset+1), (offset+2), ...
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: peer phandle
> +        - description: bus port offset (last primary-local port)
> +    minItems: 1

[Severity: High]
Because qcom,multi-master-peer is defined as a phandle-array, doesn't the
referenced target node need a corresponding #qcom,multi-master-peer-cells
property for dt-schema to parse the arguments?

Since the schema uses unevaluatedProperties: false and does not define
#qcom,multi-master-peer-cells globally, it creates a situation where adding
the cells property fails schema validation, but omitting it causes dtbs_che=
ck
to fail. Can this be resolved by declaring the -cells property in this sche=
ma?

[ ... ]
>  allOf:
>    - $ref: soundwire-controller.yaml#
> =20
> +  # Single-master (no qcom,multi-master-mode): needs port config.
> +  - if:
> +      not:
> +        required:
> +          - qcom,multi-master-mode
> +    then:
> +      required:
> +        - '#sound-dai-cells'
> +        - qcom,ports-offset1
> +        - qcom,ports-offset2

[Severity: Medium]
If a user writes an incomplete multi-master device tree node and forgets to
include the qcom,multi-master-mode property, will it silently pass validati=
on
here as a single-master configuration?

Since qcom,multi-master-peer and num-lanes are globally declared,
unevaluatedProperties: false won't catch them. Would it be safer to explici=
tly
forbid the multi-master properties in this single-master block by setting
qcom,multi-master-peer: false and num-lanes: false?

[ ... ]
> +  # Multi-master dependent: contributes DATA lanes
> +  - if:
> +      properties:
> +        qcom,multi-master-mode:
> +          const: dependent
> +      required:
> +        - qcom,multi-master-mode
> +    then:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,soundwire-v3.1.0
> +        '#sound-dai-cells': false
> +        qcom,din-ports: false
> +        qcom,dout-ports: false
> +        qcom,ports-word-length: false
> +        qcom,ports-sinterval-low: false
> +        qcom,ports-sinterval: false
> +        qcom,ports-offset1: false
> +        qcom,ports-offset2: false
> +        qcom,ports-lane-control: false
> +        qcom,ports-block-pack-mode: false
> +        qcom,ports-hstart: false
> +        qcom,ports-hstop: false
> +        qcom,ports-block-group-count: false
> +        qcom,ports-ch-mask: false

[Severity: High]
Does qcom,ports-ch-mask need to be globally declared in the top-level
properties block?

The dtschema meta-schema requires all properties evaluated in
if/then/properties blocks to be declared globally, and qcom,ports-ch-mask d=
oes
not seem to be present in this file or inherited from soundwire-controller.=
yaml.
Won't this cause make dt_binding_check to fail with an undeclared property
error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789114385.gi=
t.srinivas.kandagatla@oss.qualcomm.com?part=3D1
