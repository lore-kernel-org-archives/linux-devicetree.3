Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B6831F9B1
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651708; cv=none; b=bA/8GM2l5DyEak037xgyfw3FXeMr+KA8l0DdsEfI0gE2j3xFvw+5sOVktdQ3u6c7iFR6WIIeznEN5+tfcZzcpf2CtvRIVAv84Lj3gn3krZjhWvGrpqbkG5Vijwn9iMsB3SFuZSK78HWuMWHsdZlhDxU+QQpotFW1/FHtfm/BoOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651708; c=relaxed/simple;
	bh=j+Hv+OZ8Yjh5aIJIDGCGd3Q2p0Gwj1L8pyJ9mRofDg0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O5B2+6b/5y5tde+1JnQif7D+HFpA8pXNwDoif0dPX4W0tiYW1SA0Geyi61xo3wpwyYbViSWRuxTSh4+lJv+oPO0dI8wUgYaVdHgeei1dgKaxI6RQv8ALIbBRd+UthwzknegkqkEjNAohhuE3DIsspQ6GNIHnOuo1zwa+M26KOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m84tAcAp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m84tAcAp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135A51F000E9;
	Fri, 10 Jul 2026 02:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783651705;
	bh=AFjXCR730VyGPuHj/phLYKFWXPDWPpw5RWAcLeJdUFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m84tAcApxnC2ajal9Luf4MHjOZ9ZJMqEiwENe6PZQNS0F78aHHBGrQsaT8eWIba9v
	 BCW88LGkYL12CgKud+quUTIVSc8VULawfiEBscpbpLiF2Ce1ZRJbSRgS7VxZCc6Mx5
	 m8MunnUqXvIz1GpVKquHhKit+Y6qo8+uUoaa164Mza9PKx6VEWcrXZy5QlLIvevxAO
	 ipNEGyIPsr28MqwZGfYUQw3MOgTji47NNmThkgldfUBMRKlhLWZ/dl9xql+sY9pu7d
	 HXIzuJ4hLmXbb7STmO9Q+sPYZGw4nhBOCklFOzAkXcGRHUP3gpXMjJaa6oVZ8I/OTI
	 gdz1mUKvhxM4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: arm: coresight-tnoc: Bind on
 platform bus instead of AMBA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-1-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-1-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 02:48:23 +0000
Message-Id: <20260710024824.135A51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The kernel has no platform driver configured to match the `qcom,co=
resight-tnoc` compatible string, leaving the device unbound on the platform=
 bus.
- [Low] Restricting the 'compatible' property to a single string abruptly b=
reaks schema validation for existing in-tree device trees that use the dual=
-string AMBA format.
--

--- Patch [1]: [PATCH v6 1/5] dt-bindings: arm: coresight-tnoc: Bind on pla=
tform bus instead of AMBA ---
commit 53696bf96bfa353e6c866bb916cba6363324a355
Author: Jie Gan <jie.gan@oss.qualcomm.com>

dt-bindings: arm: coresight-tnoc: Bind on platform bus instead of AMBA

The Aggregator TraceNoC hardware exposes CID registers, but the Component
ID value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID. As a result, the device cannot be identified on the AMBA
bus.

> Describe the Aggregator TraceNoC with a dedicated single
> "qcom,coresight-tnoc" compatible instead of the two-string AMBA form
> "qcom,coresight-tnoc", "arm,primecell". This creates the device on the
> platform bus so it is bound by the platform driver through its compatible
> string rather than as an AMBA device.

[Severity: High]
Does the platform driver have the correct compatible string to match this?

Looking at itnoc_of_match in drivers/hwtracing/coresight/coresight-tnoc.c:

static const struct of_device_id itnoc_of_match[] =3D {
	{ .compatible =3D "qcom,coresight-itnoc" },
	{}
};

Since "qcom,coresight-tnoc" is not in this match table, will the device
silently fail to probe at runtime on the platform bus?

> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.ya=
ml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> index ef648a15b8065..72fb1210e22e0 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml

[ ... ]

> @@ -22,24 +22,12 @@ description: >
> =20
>    Note this binding is specifically intended for Aggregator TNOC instanc=
es.
> =20
> -# Need a custom select here or 'arm,primecell' will match on lots of nod=
es
> -select:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - qcom,coresight-tnoc
> -  required:
> -    - compatible
> -
>  properties:
>    $nodename:
>      pattern: "^tn(@[0-9a-f]+)$"
> =20
>    compatible:
> -    items:
> -      - const: qcom,coresight-tnoc
> -      - const: arm,primecell
> +    const: qcom,coresight-tnoc

[Severity: Low]
Will this break schema validation for existing device trees?

Existing files like arch/arm64/boot/dts/qcom/sm8750.dtsi still use the dual
string format:

		tn@109ab000 {
			compatible =3D "qcom,coresight-tnoc", "arm,primecell";

Running make dtbs_check might produce validation errors until those device
trees are updated to match this new strict constraint.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-fix-tracen=
oc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com?part=3D1
