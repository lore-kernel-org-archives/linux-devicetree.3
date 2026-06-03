Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53F3ADBA5
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500848; cv=none; b=YVHDvQgu+veM1j8+MlyrSGJONGNjs02TjmnwjJUkJawCYRc0M/rMDB/M9vSEpdm3PjE9lvj8PRUDD5k9R+xXUCUsa9pnmpadufWAyU/4Sy/kvGLKvbbWz7bhaTXq+zs/vpQoBiAWfUhLsvB46PinMx0diY0YIcSwIT/8ZD0mX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500848; c=relaxed/simple;
	bh=Its1H5nI6E8qUlk8j2QQvWbXs3zNNHJyy5c+hvQ2H5U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WaM45WmUjycE/RZ69S+V/F+3tBpTNfnPG9/OZKUftH8DMt86kbGDckd8r45zGXwByP1ciIYerQiE7ChV17wztuJZKKV/Lp4aYARgj+d3uwt5FjdKy+jbjVqgVUvAO47BqfvIVniBOmE+6kG5okFIFwGE7yO5yDSDtj973eWCyCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXjfFupL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXjfFupL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DAD1F00893;
	Wed,  3 Jun 2026 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500847;
	bh=gYU+Qc4IrqllSzoAiGqla9i/6scWPnuswUNLU5Ihnoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SXjfFupLiohELCPynvmZ8Pibo5+Ayz6eqbSN5aukkCv1AQ5XqVkFQTZcmGQbqcDRZ
	 eOm5SJD2DkNd0uoUCyP4cRQz5kbSfFl6fheA6GnJbxp89Clj32RJHkQRzXL3F/HmP0
	 sophXh7QCc953508mIQW68QTuWGXOiteV+0yiC40od7LtvWLPk+qgbfSC7D1vo+6cr
	 BvEiryheAfSKS2+PJCNouIMGr081s8tgDWqoDJomm5RdX0/yPE6uXgxVNYoyd/M2bi
	 UXyajjI/vYGIfWwrJo05F5XrVKR7/vB6LTGzFQ59tVko1RHJKSj73obkswtWahnlT1
	 m4zxl9Xw92qkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
References: <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:34:04 +0000
Message-Id: <20260603153405.50DAD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dt-bindings example in `xlnx,versal-clk.yaml` fails schema vali=
dation (`dt_binding_check`) because it incorrectly pairs an `xlnx,zynqmp-fi=
rmware` parent with an `xlnx,versal-clk` clock controller.
--

commit eb45bdb29d194f45db74a8a016c6af5c112a380b
Author: Michal Simek <michal.simek@amd.com>

dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema

This commit moves the ZynqMP clock controller binding to a dedicated=20
xlnx,zynqmp-clk.yaml schema, separating it from the Versal bindings. It=20
updates the xlnx,zynqmp-firmware.yaml schema to enforce the appropriate=20
clock-controller child node based on the selected firmware compatibility.

> diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqm=
p-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zy=
nqmp-firmware.yaml
> index 680082c29f016..72af37cdb103b 100644
> --- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmw=
are.yaml
> +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmw=
are.yaml

[ ... ]

> @@ -113,10 +112,14 @@ allOf:
>              const: xlnx,zynqmp-firmware
>      then:
>        properties:
> +        clock-controller:
> +          $ref: /schemas/clock/xlnx,zynqmp-clk.yaml#

[Severity: Low]
Will this new rule cause the example in xlnx,versal-clk.yaml to fail=20
dt_binding_check?=20

The remaining example in=20
Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml defines a=20
clock-controller with compatible =3D "xlnx,versal-clk" under a firmware=20
node with compatible =3D "xlnx,zynqmp-firmware":

    firmware {
      zynqmp_firmware: zynqmp-firmware {
        compatible =3D "xlnx,zynqmp-firmware";
        ...
        versal_clk: clock-controller {
          compatible =3D "xlnx,versal-clk";

Because this new conditional rule enforces that an xlnx,zynqmp-firmware=20
parent must have an xlnx,zynqmp-clk child, the xlnx,versal-clk example=20
might now be invalid. Does the example need to be updated to use=20
compatible =3D "xlnx,versal-firmware" to match the child controller?

>          pinctrl:
>            $ref: /schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780499520.gi=
t.michal.simek@amd.com?part=3D3
