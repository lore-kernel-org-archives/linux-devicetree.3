Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227CC367B73
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643935; cv=none; b=APCKsb+SJyahAk210vmXosTeAt/vA7P0UaXdKIdzWJbanjXmyaLmaOZu+/J6gUM7jj6W+yBkFFNcPp/YT14ykkDvNSMBjR1m44DuTupdqyjUnU21rJ978RnNVsvP9kgpi+SbHpCE9q7DNuy4urSVo/XnI0B5dYd1pY/t/l9N7c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643935; c=relaxed/simple;
	bh=xs2UYKKEhjbgwdogz7s2BJIrBhN2Q+n5OA3hsXThI0k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rmf76u+krbc46OytXR9KfKhy4AQZXagGcRmt5kUxy+sZ2dupRNMs4/rxr7I+RanDmPd964u9AcME1dHPVDzKjfm+HArZBT792JO0lIuwHbG3v4GBmG3Cew6hcdid2ZZQu9YCFUjyhGUhy1jcxXKYUustECfbchmP/U9k7pNAzsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0i/p1OY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0i/p1OY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7151F000E9;
	Tue, 21 Jul 2026 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784643933;
	bh=UANdPwovPJlkrUTfWdevvycG6o9KJWanIDnSSIqGpFo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B0i/p1OYryXJTs7/MEF5okuM7OJuXJwJ7+0PI7bhPu/hN8rQhW/RNL3PRXoh00s1Z
	 OPfdECPXxCNx0iNBGB270+pgKHmUABK5GVyC8f0lUZ6s50WSMCw7X6m4tMmJiytD4H
	 hFf0y3BkpKzKAFPIyS5InzqUh676a+N+o4fK9KhXGamcMJzsRDYSp8L9Gs9lCa4sG6
	 LDVF7zSlN4CxUfGwRZEMlvxH8zN0ZpQwKA++RLbkP2c6whEai0l4viPgUvJIDC9M02
	 diepFJ7TPmyBQsJWWC1YoHikJ1M4lTYUnhcECh4alZ/qsh7H62Gf+2s7oGJ8OXd3WQ
	 0m8undl35JvUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: media: i2c: Add mira220 image
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260721-mira220-v5-1-533b0ad1065e@ideasonboard.com>
References: <20260721-mira220-v5-0-533b0ad1065e@ideasonboard.com>
 <20260721-mira220-v5-1-533b0ad1065e@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 14:25:33 +0000
Message-Id: <20260721142533.7A7151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema uses `additionalProperties: false` at the top level a=
longside an `$ref` to `video-interface-devices.yaml` in an `allOf` block, w=
hich incorrectly rejects inherited standard properties.
--

--- Patch [1]: [PATCH v5 1/2] dt-bindings: media: i2c: Add mira220 image se=
nsor ---
commit 4fdfbcc612e9cd0371486dfa12391a33292c795a
Author: Philippe Baetens <philippebaetens@gmail.com>

dt-bindings: media: i2c: Add mira220 image sensor

This commit adds device tree bindings for the AMSOSRAM Mira220 2.2 MP NIR
enhanced global shutter image sensor. It defines the required properties,
supplies, and video output port configuration for the device.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml=
 b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> new file mode 100644
> index 0000000000000..294211da8f2a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> @@ -0,0 +1,101 @@
[ ... ]
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vdig-supply
> +  - vana-supply
> +  - vddl-supply
> +  - port
> +
> +additionalProperties: false

[Severity: Medium]
Since the schema includes a reference to video-interface-devices.yaml in the
allOf block, should this be unevaluatedProperties: false instead?

Using additionalProperties: false at the top level only checks the properti=
es
defined locally in the current schema block. It ignores everything included=
 via
the allOf reference, which means valid device tree properties inherited from
the standard video-interface-devices.yaml schema (such as rotation or
orientation) will fail dt_binding_check validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-mira220-v5=
-0-533b0ad1065e@ideasonboard.com?part=3D1
