Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1644155C97
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 04:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780201219; cv=none; b=bs/Z7rfRFhabu7bDssdLaSb6/3kztlwbu9dbjlIrEUy9i9DBbxkl28YVqhqprzm86jAKccN4uNC5O+7Iuda1RJllosn5yOG++56kUm9TW8o4CBPm6jONdI36a6MftAmzvIY5T/AnIeywJ3Doszj+gZd4cSpHMf7s2sxGRAf3tMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780201219; c=relaxed/simple;
	bh=qu+8clgCdh2Ty2Fewqb4EzyfvUekNiaD8Bsf6dzXecY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D/erOmmKy5JEKnXWvMC3AA4eUi5RYnZFZNZIxtM73Jjm7mllgXc4K1ekNhJcOfQ9aM7Bu3rOAjDC4fL/KFnApZoaLkGafQTe6YiJVVZE7q4z8DjbLhjohD2ILP1+hNE13A4Ho26r0gF+1fb23lUm78A9pMWnG/SiUgp/EtaWVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZgo5cEo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZgo5cEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F7B1F00893;
	Sun, 31 May 2026 04:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780201217;
	bh=AQTMJ4kO4xsJVdlaPQ5EanBv4FTh1LbLKbs/z1WCsBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TZgo5cEoqeonEtkqwlmru13T24u/ynUnU3SbpeHK2LFAlTR7DPlRaJW5ImhqHwz5X
	 t3t8Mb7Ev4JCb/7NTNrwVI3ILVhoFU0k4LukvUs8tNI8FYsyp8c6oEqe8YjXHjLKzV
	 56zKu9JbjQEiuVjstNBVic4AlHhpqfLxhLpxfAubTPJ9nACLcXPm0mgUqVHpGFbpQ4
	 x8IXxNl1hJRa4odTfb4DxUeY8rQPjs7OLokbCA2onRXgTn/QQuuPuDxAIhoilTOJ0c
	 q6l+/O4a5L+eE+afm7Old6zxgYZCP1bO26sDCN7KKlL5YoUCpC866l/OblWAIm0F/m
	 eNPCximYB4FFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: qcom: add
 msm8660-mpm
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <4cca687dba2d1c341613a13d3e4b4a156b0d5531.1780195817.git.github.com@herrie.org>
References: <4cca687dba2d1c341613a13d3e4b4a156b0d5531.1780195817.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 04:20:16 +0000
Message-Id: <20260531042017.43F7B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing memory barrier and doorbell notification to RPM after clea=
ring pending interrupts.
- [Medium] The `qcom,mpm-pin-map` property is required by the driver but mi=
ssing from the YAML schema's required list, while `qcom,mpm-pin-count` is s=
trictly required by the schema but ignored by the driver.
- [Medium] The device tree binding defines a `reg` property that explicitly=
 overlaps with the RPM control block, an MFD/syscon architectural anti-patt=
ern.
- [Medium] The binding and driver omit hardware wake pins from the DT mappi=
ng, relying instead on a custom driver C API.
--

commit ff9b33b822acb8b5cceef507bbe942c3ff3618b7
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: interrupt-controller: qcom: add msm8660-mpm

Add the binding for the Modem Power Manager (MPM) interrupt
controller on the MSM8x60 family (MSM8260/MSM8660/APQ8060). The MPM
is a small wake-capable interrupt aggregator that lets the SoC stay
in low-power states while a small set of GIC SPIs continues to be
monitored and can wake the system on an edge.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,=
msm8660-mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/q=
com,msm8660-mpm.yaml
> new file mode 100644
> index 0000000000000..1288e83d75d6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660=
-mpm.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: qcom,msm8660-mpm
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      vMPM register window inside the RPM control block. Must cover
> +      the request registers at offset 0 of the window and the status
> +      registers at offset 0x420 of the window. A length of 0x440 is
> +      sufficient for the four-word request banks and the status bank.

[Severity: Medium]
Does this explicit overlap violate standard Device Tree architecture?

Overlapping hardware resources should typically be modeled as child nodes of
an MFD sharing a regmap, or accessed via a syscon phandle. By directly using
devm_ioremap() in the driver to bypass standard resource reservation, this
introduces an architectural anti-pattern:

drivers/irqchip/irq-msm8660-mpm.c:msm8660_mpm_probe() {
	/*
	 * Use a non-exclusive mapping: the qcom,rpm driver maps the
	 * surrounding RPM control block via its own platform resource,
	 * and our vMPM sub-region overlaps that mapping. devm_ioremap()
	 * does not call request_mem_region() so there is no conflict.
	 */
	mpm->base =3D devm_ioremap(dev, res->start, resource_size(res));
}

[ ... ]

> +  interrupts:
> +    maxItems: 1
> +    description:
> +      IPC IRQ raised by MPM when one of the enabled wake sources fires.
> +      On MSM8x60 this is wired to GIC SPI 2.

[Severity: High]
Does the interrupt handler in the driver lack a memory barrier and doorbell
notification after clearing pending interrupts?

Looking at drivers/irqchip/irq-msm8660-mpm.c:msm8660_mpm_irq(), the CLEAR
register is written using a relaxed IO accessor:

drivers/irqchip/irq-msm8660-mpm.c:msm8660_mpm_irq() {
...
		if (pending[i])
			msm8660_mpm_write(mpm,
				MSM8660_MPM_REG_CLEAR + i * 4, pending[i]);
...
}

Since the RPM caches the vMPM request registers, won't it miss the CLEAR
command without a doorbell notification, causing it to continue asserting t=
he
IPC wake interrupt?

Also, without a memory barrier, this might reorder against the subsequent
parent GIC EOI. Could this cause an immediate spurious interrupt storm since
the parent IPC interrupt is level-triggered?

[ ... ]

> +  qcom,mpm-pin-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: MPM pin number
> +        - description: GIC SPI number this pin maps to
> +    description: |
> +      List of (MPM-pin, GIC-SPI) tuples for wake sources that have a
> +      corresponding GIC IRQ. Consumers route their interrupts through
> +      the MPM hierarchical irqdomain to take advantage of these
> +      mappings.
> +
> +      Raw wake pins like SDC3/4 DATx (pins 21-24) are NOT listed
> +      here - they have no GIC SPI mapping and are accessed through
> +      the msm8660_mpm_set_pin_wake() / msm8660_mpm_enable_pin() C API
> +      by consumer drivers.

[Severity: Medium]
Is it correct to omit hardware wake pins from the device tree mapping and r=
ely
on a custom C API?

Device tree bindings should describe hardware resources completely and
independently of OS implementation. Omitting pins just because they don't m=
ap
to a GIC SPI forces consumers to be tightly coupled to this specific driver
implementation via C symbol exports:

drivers/irqchip/irq-msm8660-mpm.c:msm8660_mpm_enable_pin()

Would it be better to list these pins and avoid bypassing standard kernel
subsystems like dummy IRQ domains or pinctrl frameworks?

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - mboxes
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - qcom,mpm-pin-count

[Severity: Medium]
Are the required properties synchronized with the driver's expectations?

The schema enforces qcom,mpm-pin-count, but the driver ignores this property
and hardcodes the pin count to 64:

drivers/irqchip/irq-msm8660-mpm.c:
#define MSM8660_MPM_PIN_COUNT		64

Conversely, the driver's probe unconditionally fails if qcom,mpm-pin-map is
missing, returning -EINVAL:

drivers/irqchip/irq-msm8660-mpm.c:msm8660_mpm_probe() {
...
	ret =3D of_property_count_u32_elems(np, "qcom,mpm-pin-map");
	if (ret < 0 || ret % 2)
		return dev_err_probe(dev, -EINVAL,
				     "invalid qcom,mpm-pin-map\n");
...
}

Should qcom,mpm-pin-map be added to the required list to prevent invalid de=
vice
trees from silently passing schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780195817.gi=
t.github.com@herrie.org?part=3D1
