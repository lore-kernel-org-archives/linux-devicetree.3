Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B59532F764
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377428; cv=none; b=JoFiFQcvoP8LcvgrVMyyv9EOZEX9DBK3NVhY/mbFaW7HvxNvjXAeuc/nS7BnLQSWE8WmDu1KAhl3TY4q28WJaJoatWotU/3Xjk+x7uHPfEGKw1rmztRw2uW6lal5xJafy7KM4lvMfK4udCXAT1iuOafMGV368cRArypRhMcAez8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377428; c=relaxed/simple;
	bh=S778Dk2wiB+/8ducGcttVHQFRTe59I8CePeYr2jAdmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iXMn+x6xpJ5ejXQMqd0Pl6UfXx2nlE5MwUX8DTqaOGDZTKAuOon2Tv2hNxggcxl85otGaq2NpBfPMFgQ7JKmTSErJZPgHLwBJmFeQanF3Z7FFApVUYd4QfbMgLA/uMP85jy/tXV8mSqUNYipFgEyR4PuPxfJq++aw0le1JGD4+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzQ17ryq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzQ17ryq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378DC1F00A3A;
	Mon, 10 Aug 2026 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377426;
	bh=7vbV4/f/aqAksPChTG4Xyq/5eFNH2Ibv7qcq77uEcm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HzQ17ryqDUihRfZSOwdRBZ+EH5XSk/ipjkcemO4x6/NX92ZzDpr4TDTbIVzE+L/g8
	 +ClOPvee8G5XWp0bI77cEcZ2No8lU3kLLShAYJ0/s2wQeKShFSLMGp+eS7VM2tTJTe
	 rzabuLnTXYBfvhXcysx/Fq6b0lPjAL6K7NoxWib+DkHxKDN0ffy/sXnkjHqzvyywU/
	 9BEGGYV3vGGf/bWIZ/4JIB3NiKNxKMjH+hYrCb31e5+aJtfnTTkQTMjduS9+xh/3O0
	 CEowscUCGyVMI1UHAGMYwhaZhdEYSF0K2E5e9BLSSlUZ/NHwODMTWktTG3b3FsPOVE
	 Hi3pnPyq/Zyew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: xlnx,usb2: Make clocks required
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260810154548.2133565-1-radhey.shyam.pandey@amd.com>
References: <20260810154548.2133565-1-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:57:05 +0000
Message-Id: <20260810155706.378DC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Making `clocks` and `clock-names` unconditionally required break=
s backward compatibility for older device trees.

Pre-existing issues:
- [High] devm_request_irq is called before read_fn, write_fn, and spinlock =
are initialized, risking a NULL pointer dereference.
- [High] Device clock is disabled before the devm-managed IRQ is freed, cau=
sing a potential bus fault if an interrupt fires.
--

--- Patch [1]: [PATCH] dt-bindings: usb: xlnx,usb2: Make clocks required ---
commit e81394ee7d6f7bd713fd2fe198723a128037fcee
Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

dt-bindings: usb: xlnx,usb2: Make clocks required

Add s_axi_aclk AXI4 clock support as a required property. Traditionally thi=
s IP
was used on MicroBlaze platforms which had fixed clocks enabled all the tim=
e.
But since it is a PL IP, it can also be used on SoC platforms like Zynq
UltraScale+ MPSoC where it is mandatory to explicitly enable IP clocks.

> diff --git a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml b/Docum=
entation/devicetree/bindings/usb/xlnx,usb2.yaml
> index f295aa9d9ee79..156d3676f9f99 100644
> --- a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
> @@ -34,6 +34,8 @@ required:
>    - compatible
>    - reg
>    - interrupts
> +  - clocks
> +  - clock-names

[Severity: Medium]
Will this break backward compatibility for older device trees? The commit
message mentions this IP was traditionally used on MicroBlaze platforms whi=
ch
had fixed clocks enabled and likely omitted these properties. Making them
unconditionally required will cause existing, valid legacy device trees to =
fail
schema validation.

> =20
>  additionalProperties: false

[ ... ]

[Severity: High]
This is a pre-existing issue, but is there a risk of a null pointer derefer=
ence
during probe?

In drivers/usb/gadget/udc/udc-xilinx.c:xudc_probe(), devm_request_irq() is
called before read_fn, write_fn, and the spinlock are initialized:

drivers/usb/gadget/udc/udc-xilinx.c:xudc_probe() {
    ...
    ret =3D devm_request_irq(&pdev->dev, irq, xudc_irq, 0,
                           dev_name(&pdev->dev), udc);
    ...
    /* initialized later */
    udc->read_fn =3D ...
    udc->write_fn =3D ...
}

If an interrupt fires immediately after devm_request_irq() returns, the
xudc_irq() handler will execute and attempt to use the uninitialized spinlo=
ck
and udc->read_fn(), potentially crashing the kernel.


[Severity: High]
This is a pre-existing issue, but does disabling the clock before the inter=
rupt
is freed introduce a potential bus fault?

In drivers/usb/gadget/udc/udc-xilinx.c:xudc_remove() and the probe error pa=
th,
clk_disable_unprepare() is called on the device clock:

drivers/usb/gadget/udc/udc-xilinx.c:xudc_remove() {
    ...
    clk_disable_unprepare(udc->clk);
    ...
}

Because the interrupt is managed by devm_request_irq(), it remains active u=
ntil
the devres cleanup runs after the function returns. If a late interrupt tri=
ggers
in this window, xudc_irq() will attempt to access hardware registers with t=
he
clock disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810154548.2133=
565-1-radhey.shyam.pandey@amd.com?part=3D1
