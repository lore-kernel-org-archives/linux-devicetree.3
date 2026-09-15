Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703C4453A54
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504054; cv=none; b=MzP111w/PT2IYp1wUwrsc5Hx7DnooZldg+hd5pESzTEmTR7TUDJC3cIvewugJApDUwYjMFbRkkUDU7XVRQ9n11g25URtt9Ah+Jbnoe+397hbWupTH8UCmFCXd2EsoYrKR9qtJzDisw1pvcMVIKrmgdoE1gyPCuYscbYeADnzxCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504054; c=relaxed/simple;
	bh=hhk/7P6NV4HIuKC4XsArga2iwpcYZ/FGA6uEL4yc1DA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZfKQu5zUkbnvZKtwYQWdxFwBIYKztpDX5Dct1qlf+UZPiNRnjbeg8IIjrqiqA0c18h8BnWf37N9lNrRTastJUAJiSlCCBdpCCFvnQDxbq21fA85TJSID2wFOfvbzT/hHhFD0rKvZsyq3//DCiMeqfSJtD81FjGCkObeAPmaInpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcflhLLg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcflhLLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2B51F000FF;
	Tue, 15 Sep 2026 20:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789504053;
	bh=iW810a7bRbSTiQhNp0VdU8KfzGP3HX0lQ1FkpTF3bXc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VcflhLLgH+c0gak/a8qie0ZTqLuHiFkI2q0y0cELaWkv8XoobKwHqqeddI3VEaSQf
	 DUZzpvF3WrIZjJy8xRwom7FxhpqZWeLVaaPlCxk7NhHK70gW0vREpRCcAliVq3Id5/
	 Sgcc9nlKi2WWGTDc9N8qPcRX50VuGSZftTHWZW6KMJn28ntN9Y1iseSwLGnnoV1ufi
	 +Z58xsGmo0DhkZQ5hwFgSUr/vx6PLvuCMTO7NXRrrSAebndozjWMVWo/hecS2dXF1c
	 EPIQ9lVHPxWapgjzOsc5u9aIwHenDlv+ZnwkDYt+ENF4kPW9locTcp/RuBLwEP4a5f
	 wiE3qymGZhVaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: media: i2c: Add
 vision-components,mipi-module-controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Leitner" <richard.leitner@linux.dev>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 20:27:32 +0000
Message-Id: <20260915202732.9B2B51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: schema rejects i2c child nodes due to unevaluatedPr=
operties
- [Low] dt-bindings: dtc warning unit_address_vs_reg due to missing reg in =
i2c node
--

commit 0c92fd00fde60c6a3a9d90ca2a635a3a6b317fc1
Author: Richard Leitner <richard.leitner@linux.dev>

dt-bindings: media: i2c: Add vision-components,mipi-module-controller

This commit adds device tree bindings for the Vision Components MIPI Camera
Module Controller. The controller abstracts the camera sensor behind a unif=
ied
register interface and exposes a tunneled downstream I2C bus for the attach=
ed
image sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/vision-component=
s,mipi-module-controller.yaml b/Documentation/devicetree/bindings/media/i2c=
/vision-components,mipi-module-controller.yaml
> new file mode 100644
> index 0000000000000..2a031aea68457
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-=
module-controller.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clock-frequency
> +  - vcc-supply
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false

[Severity: Medium]
Will this constraint reject the downstream I2C bus child node?

Because unevaluatedProperties is set to false but there is no definition
(such as a patternProperties for ^i2c@[0-9a-f]+$) for the tunneled downstre=
am
I2C bus child node in the properties section, make dt_binding_check will fa=
il
validation for any device tree containing this hardware module's child node.

> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        vc_mipi_ctrl: controller@10 {
> +            compatible =3D "vision-components,mipi-module-controller";
> +            reg =3D <0x10>;
> +            #clock-cells =3D <0>;
> +            clock-frequency =3D <37125000>;
> +            vcc-supply =3D <&cam_3v3>;
> +
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            i2c@0 {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;

[Severity: Low]
Does this child node trigger a dtc unit_address_vs_reg warning?

The parent node controller@10 defines #address-cells =3D <1>, and this i2c@0
node has a unit address. Without a corresponding reg =3D <0>; property, it
violates Device Tree syntax and will trigger a warning during
make dt_binding_check.

Additionally, this example illustrates the usage of the i2c@0 child node,
which is paradoxically forbidden by the unevaluatedProperties schema
constraint mentioned above.

> +
> +                vc_mipi_sensor: camera@60 {
> +                    compatible =3D "ovti,ov9281";
> +                    reg =3D <0x60>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-vc-mipi-ct=
rl-v1-0-8a42b693d889@linux.dev?part=3D2
