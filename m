Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126F046AF35
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 17:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137201; cv=none; b=rf7re+Hfhhysoidzd3Pdqus2f6F6lO4MjCq93V6Xbjrt+jZiS1b2MOQd1bl1UTXD3Qj8vb1GsB6czQPF9eivJjH7aSWNzeVt12uUmZVN63qsDA7Lq4rfM+/P49L+ZcVtYRAYrG37VMuZ0jvwQ33Y44sd0Y/i2ACFNTfkCISJBK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137201; c=relaxed/simple;
	bh=JWixNgjdi6ksT73tUbbX6u481lhPXJ9j5mH4OnqpVmw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xux8hWKTuytjBBAsE2R4dV8Z9LCB6tk0YHW7zDdXdYuOiYGxUvNyId+z7ihxx9vSSW5nqulnc0Jg3ZAZbEGHu00HsnqoiCejulsKnf/CETg96G3UEf99tRvSC0ke+EkL+tbuF6+ivuic4VFGWk3kngwuG8AGDOF10g/uleqGe4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExxsAe7l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExxsAe7l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838B11F00A3A;
	Wed, 15 Jul 2026 17:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784137199;
	bh=EvgP8D+cgDhjfqhRYDVcX+wxrGiwEuUQtclV2HlQl6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ExxsAe7lSoHW7lL2XhIClJ6cG9V+i0dD1pWMVdk3fPoECdpbR10BLxpLivYME3z2A
	 oCXuzYLvAVt34GIemTYhHHw5XTFa7n221oAq3AQeUfwzFZEnXUlyQuiSpTqmfUaVgQ
	 ncWoR4hbszLCbYS3CYpjTl4canh3YdDnQpO6MQP8eMHorQ9xjybGbsj5d0/x/Ren1M
	 /p5g3XY2tWh5U5xYXSP7yZ/jKFn1n5Hh698SIJsmTKkcOHMmhAq0f9CjbA2lphmqpr
	 O01q69wdg021aLFAtg9QUOleXoucA32PQ7xUz3vQGMM/5mvAVXcbsbw6qsifT3WGat
	 0EDJ0SDiKTXNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add imx708 image sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715-imx708-v1-1-1f36f54e14d4@ideasonboard.com>
References: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com>
 <20260715-imx708-v1-1-1f36f54e14d4@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 17:39:59 +0000
Message-Id: <20260715173959.838B11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The IMX708 device tree binding strictly prohibits standard camer=
a properties like `rotation`, `orientation`, and `lens-focus` by omitting t=
he common video-interface-devices schema reference.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: media: i2c: Add imx708 image sensor=
 ---
commit 6db06a28573083737d3c74ac1c5d01840d0d4fc3
Author: Jai Luthra <jai.luthra@ideasonboard.com>

dt-bindings: media: i2c: Add imx708 image sensor

This commit adds the device tree binding schema for the Sony IMX708 CMOS
sensor. It defines the I2C configuration, required power supplies, and
MIPI CSI-2 interface properties.

> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vdig-supply
> +  - vana1-supply
> +  - vana2-supply
> +  - vddl-supply
> +  - port
> +
> +additionalProperties: false

[Severity: Medium]
Will this strict additionalProperties constraint incorrectly reject standard
camera properties like rotation or orientation?

Because this binding in Documentation/devicetree/bindings/media/i2c/sony,im=
x708.yaml
does not reference the common video-interface-devices schema, standard devi=
ce
tree properties describing the physical mounting of the sensor will fail
validation during dt_binding_check.

Should this binding include an allOf reference to the common schema and use
unevaluatedProperties instead of additionalProperties at the top level?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx708-v1-=
0-1f36f54e14d4@ideasonboard.com?part=3D1
