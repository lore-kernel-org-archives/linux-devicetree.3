Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2144E42AFAA
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 18:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534157; cv=none; b=u+4189BNJjNB3mLwkv5amEGFzJ5X/WpaWchunD662gtFgZJUtJRsUEm7U1MXd4+smz0B97gtrO6FIKEW1/thtjSF/wc3eHB3io5w4J80V3yqz7bFwanCxM+8dFZe/OUBofeHH8+tnU6XFlcPTwmk9uCOsPp9a+pa8e2K+aUavfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534157; c=relaxed/simple;
	bh=qPEMMav64K7UMHSfPweNWc4gkpPOCzDhs4ucpfWChW4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bQAuY5uHf+jy7q0KflEAvZBNYcV30yaGgfs8eBJUqQV0/CTYfi+ukw3hp4NbCcFt2kOVrhMZO0QQjDvCXiFPj3K2B7tCxSkItrGjZEz/fjG1yt+as9FAHkVFvHX9A0PNErVh5+wONIXN7j47bMCcfQmEPyAaKntgBmv01DRUVSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNpMaif8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNpMaif8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE601F000FF;
	Sun, 27 Sep 2026 18:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534155;
	bh=rUqyOGpQ5p0dUJf3fovNuhsOcuyUoqVFwHQz5BKJrZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BNpMaif8Pn+lSie17cbRfBfjYwc5Ahy2EzHaNxesFDEJtQ9jwaWwqOYP7xpwvIQB4
	 WMI7QT/1gwFSGJkoj4Kat/bTbLqXKjQkMH/suflvsAMDv3T37r55FAJTXORIfTRZyO
	 W/wFdvCCeJsRZuB1EmuxwvOxXHXQh5I4sszt65bqf3U2WjPrp3cg1U/nrHmprfyr+Z
	 jrI3XVGagpufWvlIU6/kZ5TDnD8y7dOap29PluZFIMUUrr/qGRrwVoAVjvNqy7MOtA
	 hrmm3YjJsbiGL4/go+AF2eUBJRWHsaCA//syDZOtJ2zOXcXZe9Q2/lTtAuH4KiOv70
	 ybw8Y7IFynlEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/14] dt-bindings: display: solomon,ssd16xx: Add
 Solomon SSD1677 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Devarsh Thakkar" <devarsht@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260927182329.4193961-4-devarsht@ti.com>
References: <20260927182329.4193961-1-devarsht@ti.com>
 <20260927182329.4193961-4-devarsht@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 18:35:54 +0000
Message-Id: <20260927183555.6BE601F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: display: solomon,ssd16xx: commit message and schema=
 mismatch for ssd1677
--

commit 0557e7fb08a4970f824714f1d57d93f2cdcd0204
Author: Devarsh Thakkar <devarsht@ti.com>

dt-bindings: display: solomon,ssd16xx: Add Solomon SSD1677 controller

Adds support for the Solomon SSD1677 controller to the solomon,ssd16xx
binding. The commit message indicates adding it to the controller fallback
enum, but the schema restructuring implements it as a standalone constant.

> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd16xx.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd16xx.yaml
> index b31fb862de042..1a94ad9b0d944 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd16xx.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd16xx.yaml
> @@ -24,12 +24,13 @@ allOf:
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          # Good Display 4.2" 400x300 monochrome e-ink panel
> -          - gooddisplay,gdey042t81
> -      - enum:
> -          - solomon,ssd1683
> +    oneOf:
> +      - items:
> +          - enum:
> +              # Good Display 4.2" 400x300 monochrome e-ink panel
> +              - gooddisplay,gdey042t81
> +          - const: solomon,ssd1683
> +      - const: solomon,ssd1677

[Severity: Medium]
The commit message explicitly states the intent to "Add solomon,ssd1677 to
the controller fallback compatible enum." However, the patch implements it
as a standalone const under a new oneOf block.

In dt-schema, a bare const validates an array containing exactly one elemen=
t.
While restructuring the schema to avoid falsely linking the new ssd1677
controller with the existing ssd1683-based panel is structurally correct,
this creates a mismatch between the commit message's stated intent and the
implemented schema constraints.

Developers attempting to use the compatible string as a fallback (as
advertised in the commit message) like:

	compatible =3D "vendor,panel", "solomon,ssd1677";

will encounter dt-schema validation failures during make dtbs_check. Can the
commit message be updated to reflect the standalone nature of this new
compatible, or does the schema need to permit fallback usage?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927182329.4193=
961-1-devarsht@ti.com?part=3D3
