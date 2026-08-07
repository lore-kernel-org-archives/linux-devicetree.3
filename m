Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29473285CAA
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111602; cv=none; b=DTsFTVfBL2Ronjokri6mB92o2h3QCzATvF8/8fcpf8vOe83euMnE+V598aYn5UvromxlTvilByiNNonNZo608efDEM16Q1YdxM++qXJwVHTF/Pad1PRgOsoGlXJt2sjDtl9ayIVd7uh3ya7Jvwygwstp+YQGxb3BJkKjnfXP6hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111602; c=relaxed/simple;
	bh=6kBCS/whkqegAqzTBWUkNoardbfLQo5+lkr7XCLKkv4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TOcPa3G1k0DwRZscTkbQYX+QcoxS1CEk16WV/PmItbqRosh0XMc9kVLGwk/6vlCUHtZzZ8nDxk0tpoz9AVipC4VjQFvUBNixp46Moo6NYGmEeGWXHKS/oe4lZ1c0dbf1FxiBDTYrSLevm13sgN+69mZYSqvhsPZ8v4fXGe6Y2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzqtxLVZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzqtxLVZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DF61F000E9;
	Fri,  7 Aug 2026 14:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786111600;
	bh=L0MfWAmOKaa5e4ErxJfWtefvti04K/c699mS/zuw2Go=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lzqtxLVZPddgMtcJlUFjQy6O6yKiHjEK1MUhG/Ht21isXtAf+eHFxP0wH1+kY4Syo
	 c63QQdGbnaFefWj9hnGvTXjbsovCyaTXgWecNq2CzrJOaNVis+R/20dCYyKnrP//iE
	 RO3PNnML4UEInbT8EhD5a4BqZt0mG+fe4JIaIygWTFZ72tL/G+Mq/yAg/P+qsUpcHD
	 d2FAigA8OO3kwLJdNUoRrA5wUcfDfRYgJiC6CmcKXTbEyMtCgfX1aJAQ1nGWxRG8rG
	 wWf8ddwgX/QjczKzCaYSqypkYB51hMPcaxu6kpn4WvnIq5JdPlwe70dh+zE/OENMzf
	 vKr9cGekcZcgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: iio: light: veml6030: add
 veml6031x00 ALS series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-veml6031x00-v5-1-e60876fb3640@gmail.com>
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-1-e60876fb3640@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 14:06:40 +0000
Message-Id: <20260807140640.80DF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The multiline `title` string in the YAML bindings lacks proper inde=
ntation on its continuation line, resulting in a fatal YAML syntax error.
--

--- Patch [1]: [PATCH v5 1/4] dt-bindings: iio: light: veml6030: add veml60=
31x00 ALS series ---
commit 8d68b2e616d3ddf21759545fea44ab122ecc25e0
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

dt-bindings: iio: light: veml6030: add veml6031x00 ALS series
   =20
This commit adds the veml6031x00 series of ambient light sensors to the
vishay,veml6030 bindings, updating the required compatibility strings and
datasheet references.

> diff --git a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.=
yaml b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
> index 0041e1db68388..6a387c76df353 100644
> --- a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
> +++ b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
> @@ -4,7 +4,8 @@
>  $id: http://devicetree.org/schemas/iio/light/vishay,veml6030.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: VEML3235, VEML3328, VEML6030, VEML6035 and VEML7700 Ambient Light=
 Sensors (ALS)
> +title: VEML3235, VEML3328, VEML6030, VEML6031x00 series, VEML6035
> +and VEML7700 Ambient Light Sensors (ALS)

[Severity: Low]
Does this continuation line need to be indented?=20

Because it lacks indentation relative to the root mapping at column 0, the
YAML parser treats it as a new implicit block mapping key rather than a
continuation of the title scalar. This results in a syntax error during
dt_binding_check.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-veml6031x0=
0-v5-0-e60876fb3640@gmail.com?part=3D1
