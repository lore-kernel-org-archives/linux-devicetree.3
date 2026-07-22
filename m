Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCF040F72B
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764307; cv=none; b=C1jeEhj4zZtUZQPcelC+bLBtt94zdG1bs+z0Sr77ik2HGfV1gTBrE+jBMCOL4kfAN7fPRu3Hakl+UDm4X+ekAm7l9BbMtEFX4bE2ls6QdKo4bF6y+URQ+iImk+WQah5HVNNfaHTGZ9uAe93yp1ustSVuUr3C8XEELrnTLEV5uLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764307; c=relaxed/simple;
	bh=n0tSy46fFjKgiMlruxNQzc1KbDdN0pFJI1AI1fwovTM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qNlXyxertWY/b0kJ8FokVtD6NTMKE9FS8kVUWvdPriQOHZW/WCaYySF6OLiZQr2sPgLhfIuXJSZoLZAJW0+ElfZTRReNpzFqKuSSSYyyzUJsgBFaVloq5245RtGdV1Ngp5LJhjR4Rwy+KeHVeGeDNURVbkQdjNjjUcAL1ZWtGNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfIR2e6I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfIR2e6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C461F000E9;
	Wed, 22 Jul 2026 23:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784764306;
	bh=Go8AOxmTWYcsuYmefwVa+XTgdRbOFg0rs8QpqfRlI/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EfIR2e6IThI+Yd6GcZcR8Yx4KO1tIg8QOntltH+WtBuSGUD7uU2vBHmISdsQ7AmBJ
	 GK4cY0Mu7eM/fspqWLcTjoOxjron+8j15HRBvWmetEaDWSdmMMDwySlBpXHdHktr2Y
	 VfYmW0SRLBDgbC21hKYh/Xzkr7wc0utX5eThsN33BA/eVeTiGsDb91mbNbcUy/9lVu
	 OHpV4SCKRXSyz8wJmnzVD0G9cUzSzj0R0qsKcf8fqa8fihM/cocIVbQ+dyprl5tqev
	 PUZAMG6Kj1T1z7aC/qr9KTejH0fQ1nC5grP1aFuzx/FzFKJKjSB1/3MFjidFQXPtHj
	 fFeNdm4gOlqRQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 23:51:45 +0000
Message-Id: <20260722235146.27C461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The unit-address in the example node name `audio-codec@3,0` does no=
t match its `reg` property `<0 3>`.
--

--- Patch [7]: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD937=
8 SDCA codec ---
commit 5fe69f3b063a8e89646196eb389830ac9c6473c6
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec

This commit introduces the device tree binding for the Qualcomm WCD9378
SoundWire slave devices. It defines properties for both mobile mode and
SDCA compute mode configurations.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yam=
l b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
> new file mode 100644
> index 0000000000000..2ed4ad92958ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

[ ... ]

> +  # SDCA / compute mode: single aggregated slave -- owns supplies,
> +  # reset GPIO and mic-bias voltages.
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    soundwire@7630000 {
> +        reg =3D <0x07630000 0x10000>;
> +        #address-cells =3D <2>;
> +        #size-cells =3D <0>;
> +
> +        wcd9378c_sdw: audio-codec@3,0 {
> +            compatible =3D "sdw20217011000";
> +            reg =3D <0 3>;

[Severity: Low]
Should the unit address in the node name be audio-codec@0,3 to properly mat=
ch
the reg property <0 3>?=20

The device tree compiler will likely emit a unit_address_vs_reg warning
during make dt_binding_check when parsing this example.

> +
> +            qcom,compute-mode;
> +            qcom,port-mapping =3D <2 2 3 4 5 6 7 8>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722234221.8847=
65-1-srinivas.kandagatla@oss.qualcomm.com?part=3D7
