Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDE63E51D4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509816; cv=none; b=Mg+Q1xY1xgHvGdJIIjIn2/rweO/EsaNoj5u7Rg2H75kr47JafARdeuZ2gTJmCEDxKacHZAYLyCpbhqNSRpE1nm2DRJE+0PskZ8vl6EZcOQGjB2WkzCsyyqM27Vy8fyM+e6pvbKrtF2f+iVjciG3HvmWrr9y1kqUCnzARDA6iZCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509816; c=relaxed/simple;
	bh=/wkoOMVSdRd2CiuZ2mxmx6DCa+oOfFxqAc+/R8cc5VM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n/B7rTQLx5/mVIb7wkMtoQqCNYOA9ZwV7/u55ipq1rjtnABhoZnhvC8wN9zNZgAKs73KwNaQB314c0nfalZ4lE/d2r/aGAnNVTXr8mzHF/EkSLAYF6ny6TzIhW2CKrxg0UqWSBIRUN+36yDCe5QdSQmg4uN37ugpZqYf2njvvKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKGxkniu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKGxkniu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590471F000E9;
	Fri, 31 Jul 2026 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785509813;
	bh=RghDj4nEXNSV4HfmJ0mBMqLZLh2Q4I2x6tT4U9zSw5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NKGxkniuxBBQu6w7aNQ5aT0AcclU2tenN2TI7TlmIlLjMQnIf67YRPNEdUZQ6SIex
	 e1QsBU2VEUcul03uHT1nKkRGmEwkzmt625wMZy0ORhX9artsnu1iyVTSaHLPelgCTh
	 Os1GmWF8CEV7q4VdAIGu8RFY33UeTm9aWU7lBw4rzape+xNvE/JGNS6+fo0T2JDXsQ
	 9MOwYH3B+LqIiQQuRYuotn9K30C/GnUeBrrVYjdV6JbpF4pDqvrZWzCMzLo+B6GPiU
	 uCdJIeRVaHdAtTIUHNI24OFceki8WYQG+XFmhqSVJXtjpJayGAX2UbsFy3VL+W8m8E
	 1goh0cSCTYJdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: display: solomon,ssd1307fb: add
 SH1107 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Turek" <jakub.turek@elsta.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-feat-sh1107-v2-2-0d2893e44ebd@elsta.tech>
References: <20260731-feat-sh1107-v2-0-0d2893e44ebd@elsta.tech>
 <20260731-feat-sh1107-v2-2-0d2893e44ebd@elsta.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 14:56:53 +0000
Message-Id: <20260731145653.590471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The fbdev driver ignores the device-specific default dimensions do=
cumented in the device tree bindings, falling back to a hardcoded 96x16 for=
 all devices including the newly documented sinowealth,sh1107.
--

--- Patch [2]: [PATCH v2 2/2] dt-bindings: display: solomon,ssd1307fb: add =
SH1107 compatible ---
commit 6de7ab88b3219b227a8443711b01ecabe4a747f9
Author: Jakub Turek <jakub.turek@elsta.tech>

dt-bindings: display: solomon,ssd1307fb: add SH1107 compatible

This commit updates the device tree documentation to include the
"sinowealth,sh1107" compatible string. It also configures default values for
the display dimensions and clock settings when this compatible is used.

> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.=
yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> index 153ff86fb4059..6b17a701bbaa5 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
[ ... ]
> @@ -140,6 +141,22 @@ allOf:
>          solomon,dclk-frq:
>            default: 5
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sinowealth,sh1107
> +    then:
> +      properties:
> +        solomon,width:
> +          default: 128
> +        solomon,height:
> +          default: 64

[Severity: High]
This isn't a bug introduced by this patch, but does the fbdev driver actual=
ly
respect these default dimensions?

Looking at ssd1307fb_probe() in drivers/video/fbdev/ssd1307fb.c, the driver
appears to hardcode the fallback values to 96x16:

drivers/video/fbdev/ssd1307fb.c:ssd1307fb_probe() {
    ...
	if (device_property_read_u32(dev, "solomon,width", &par->width))
		par->width =3D 96;

	if (device_property_read_u32(dev, "solomon,height", &par->height))
		par->height =3D 16;
    ...
}

If a device tree node for sinowealth,sh1107 is created without the
solomon,width and solomon,height properties, relying on the schema's
defaults, will the driver initialize the display with the hardcoded 96x16
resolution instead?

> +        solomon,dclk-div:
> +          default: 1
> +        solomon,dclk-frq:
> +          default: 8

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-feat-sh110=
7-v2-0-0d2893e44ebd@elsta.tech?part=3D2
