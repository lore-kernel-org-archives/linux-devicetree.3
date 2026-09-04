Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C9346C4BC
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518971; cv=none; b=mVij6HbZ7T3tccmQt0ureLDYodhtis7B63856u0rB8GFBJNK4FepiH8KbdfQTCPNCroHfdRcMObSUpHKQToWMF6Nr3e/mYAN6N+CipTYiFonC7UtHVf0Gmuf4a1PhZAkEvamGj7VINjivLOIP7AnSD+g4kectvXQKHGJWm66F4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518971; c=relaxed/simple;
	bh=Qi81eSpc0fsV4QbxULZSzdVQB2EQuMHGL4lJGSYRl1g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kRA1F3uv61khAgK3Tb7vNPUmxeSUwIPoBsSl7N/BrkKUIZysbx5phStoRMlIh399NNDoDnst6YfMvu8+PicYGr/0L5j/asA0IBtAxkaFWG2RuxsmPC/tXXjQbgh1LtTi0tyGswl+UXCzV2jiorr9d6vxu3cqNPqW4KnPdHiG+hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNAiMYO8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNAiMYO8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E461F00A3E;
	Fri,  4 Sep 2026 10:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518969;
	bh=dDnbQmDtHq4bMZLzBRFW5jKne4eKS0cDRakRmgtfDE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SNAiMYO86E1xicW0cw3VULgSB36Dl6Iuc2eWkJIUMvdNYFCsX6wGlz+ZW62DuMGtA
	 tgksX+SjA6lf7xQe2J/qz+OGSHWFfurhJSk3oU2i9a5vvjxMde0xblTvIQHIAwHn+0
	 tmj4S/g6fisSn5FskYaoAhaaFm77GLbhPPc75ZnhjA3N/ggG1lvrulyvJg8Lweid2Z
	 +0BfyZDPdHdBGApfV4XDTG3xNLmhzdNY35oC7tGhe/1Z/TWk+ZQkjlEvlaKvh4a/uI
	 3MI+VhF0B62b+BIrx9KRVxcPj78rWWZb+hRhZ6hvThJ3IxConaS+IikjnE7gbgSK25
	 +z5QUeQ02kAgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] ASoC: dt-bindings: es8316: Document jack detect
 inversion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@thundersoft.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-rubikpi-next-20260605-v3-1-f49146d85af3@thundersoft.com>
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
 <20260904-rubikpi-next-20260605-v3-1-f49146d85af3@thundersoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 10:49:28 +0000
Message-Id: <20260904104929.55E461F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added property `everest,jack-detect-inverted` is not rest=
ricted to `everest,es8316`, allowing invalid configurations for `everest,es=
8311` and `everest,es8323` to silently bypass schema validation.
--

commit 9fc0fc78c1e3b0ad9527382c3b761e13ee89bf26
Author: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: ASoC: dt-bindings: es8316: Document jack detect inversion

This commit documents the everest,jack-detect-inverted property to allow
boards to describe the jack-detect polarity used by their wiring for the
ES8316 driver without failing schema validation.

> diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml =
b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> index f4ff23120c5b5..9060358a9080c 100644
> --- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> +++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> @@ -84,6 +84,11 @@ properties:
>    "#sound-dai-cells":
>      const: 0
> =20
> +  everest,jack-detect-inverted:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Defined to invert the jack detection.
> +

[Severity: Low]
Since this property in Documentation/devicetree/bindings/sound/everest,es83=
16.yaml
is specifically for the ES8316, does it need to be restricted in the
existing allOf conditional block?

Currently, the schema uses an if block to disable ES8316-only supplies for
other codecs like ES8311 and ES8323:

allOf:
  - if:
      properties:
        compatible:
          not:
            contains:
              const: everest,es8316
    then:
      properties:
        avdd-supply: false
        cpvdd-supply: false
        dvdd-supply: false
        pvdd-supply: false

Without adding everest,jack-detect-inverted: false to this block, won't
invalid configurations using this property on ES8311 or ES8323 devices
silently pass schema validation?

>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-rubikpi-ne=
xt-20260605-v3-0-f49146d85af3@thundersoft.com?part=3D1
