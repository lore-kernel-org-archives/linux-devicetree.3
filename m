Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188600;
	b=VeUz6rlIEP7xHX0OfCYEVJDqQFpL6uYSHMTxfy74uhwZixaFCETIa+V/GFInmbKJRB7n
	 CQ3YPF3MjdIHagdIyFpXfLcdc5aKQqo62hgWjbs5jMKqhoA5dOWG5JsnrLgA8vFUoXVvb
	 7bWm3/NcGjUuRJJR5plyJQSPzqM1fYI/UOfX9WPlaAryqZICF2rpLLBTN8vI7pe9UVql7
	 6ov3ozt2WV8ufGBrGqlfMFWmkgVuQ7DSoDi+NLom4ohYdqrZtmz4BWbLSBZ8Qu0tyFMLJ
	 CoO2cOdIKrAnEi/L2n2tO0S84mrTzhzupn9Go+F+BUItHubT9N5OX7gaEBYEpfmV0aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188600;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7xEzMT1Olr8qotGUAyhuPPY+TX2tt5njGGfyAG6m+aw=;
	b=2UELqW+lUksL5ObS0eeRr5DmoKAHVY/K1z9MTv5/R1hs/zHRYPGH3IpmCVB5bcNDMniw
	 UQxeO7RKxRPtxJovFPi44J3bZkEVQI/Y2L1YZWdZ++vzAHhduaKAcHO+3xNORruPkLQdC
	 HzafXgA3ogz0oP+DmU+FYJZpg6n9/rcEHsOzRfAcBzOqym3PXcOKQr2RGnMU07u0a5bvT
	 hlKlxeYyDWIkDXMcM5qG102NO1uvGHpfOsCLARXa8Fq9rWMMRQHy/GOhWV/utpDAM65Sv
	 1/g5BZLLhf1yuewZxv/wGzrUiAksJXMO10XzwPx3ENRR4d6E4Mdhq5XgC3YGnoQWhGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wc+Dh85y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8BE606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wc+Dh85y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E93F1F01825;
	Wed, 28 Oct 2026 11:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188599;
	bh=7xEzMT1Olr8qotGUAyhuPPY+TX2tt5njGGfyAG6m+aw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wc+Dh85y2QXvM4udGjM2QjuI5p42VeGI4hPobqaxURu0i2mHkXTLxmu4HDJuOPO54
	 Y0E3M3x+TIBtGJZDaow78oT5ZpBAYe6pJEDVHiQaspZ2uTMwLn9dlCn0Yc3ch26zRg
	 c94qALVPw0PQC82nTZlExKN7a+k4apmitcl+kNMAbmqdIVyiS1INJrEvnBTIkNGRbY
	 DsSkYzGITjpoQOnDwUa2iecq4v87YOcKiIodQiu4nlDM41uKOIoPUt20wnyswpaKT/
	 aFrji+kzSbugojFGMy5oVZ8gajMFuR9/ieyrKnfHgPCkR4CyZLDuKtl7S/+cQshd0g
	 tnZK6qPYM4AsA==
Message-ID: <sashiko-outbox-187851@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] dt-bindings: arm: Add MPAM MSC binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-3-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-3-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 11:56:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] dt-bindings: arm: arm,mpam-msc: mismatched reg and ranges cell coun=
ts in example
- [Low] dt-bindings: arm: arm,mpam-msc: missing top-level required property=
 list
- [Low] dt-bindings: arm: arm,mpam-msc: example violates dt-check-style rul=
es
--

commit f7533674b3629d7c4309338f82390e5f0a91878a
Author: Rob Herring <robh@kernel.org>

dt-bindings: arm: Add MPAM MSC binding

This commit adds the devicetree binding schema for the Arm Memory System
Resource Partitioning and Monitoring (MPAM) Memory System Component (MSC)
using the arm,mpam-msc compatible string.

> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Do=
cumentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> new file mode 100644
> index 0000000000000..523978900d3de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> @@ -0,0 +1,52 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: arm,mpam-msc
> +
> +  reg:
> +    maxItems: 1
> +    description: A memory region containing registers as defined in the =
MPAM
> +      specification.
> +
> +  arm,not-ready-us:
> +    description: The maximum time in microseconds for monitoring data to=
 be
> +      accurate after a settings change. For more information, see the
> +      Not-Ready (NRDY) bit description in the MPAM specification.
> +
> +additionalProperties: false

[Severity: Low]
Should this schema include a top-level required block listing compatible and
reg before additionalProperties: false?

In drivers/resctrl/mpam_devices.c, do_mpam_msc_drv_probe() unconditionally
maps MMIO resource 0 for these nodes:

    if (msc->iface =3D=3D MPAM_IFACE_MMIO) {
        void __iomem *io;

        io =3D devm_platform_get_and_ioremap_resource(pdev, 0,
                                                    &msc_res);
        if (IS_ERR(io)) {
            dev_err_once(dev, "Failed to map MSC base address\n");
            return ERR_CAST(io);
        }

Without a required list in Documentation/devicetree/bindings/arm/arm,mpam-m=
sc.yaml,
devicetree nodes matching arm,mpam-msc that omit reg will pass dtbs_check
validation and fail at runtime during probe.

> +
> +examples:
> +  - |
> +    L3: cache-controller@30000000 {
> +        compatible =3D "foo,a-l3-cache", "cache";
> +        cache-level =3D <3>;
> +        cache-unified;

[Severity: Low]
Does this example trigger check_property_order() and check_unused_labels()
warnings when running scripts/dtc/dt-check-style --mode=3Dstrict on
Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml?

In cache-controller@30000000, the L3 label is never referenced in the examp=
le
(and uses uppercase characters), and cache-level and cache-unified are plac=
ed
before reg and ranges rather than after standard addressing properties.

> +        reg =3D <0x0 0x30000000 0x0 0x2000>;
> +        ranges =3D <0x0 0x30000000 0x2000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;

[Severity: Low]
Are the cell counts in reg and ranges consistent with the default example b=
us
here?

When make dt_binding_check extracts the example in
Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml, the surrounding
example-0 parent node defaults to #address-cells =3D <1> and #size-cells =
=3D <1>.

In cache-controller@30000000, ranges =3D <0x0 0x30000000 0x2000> uses 3 cel=
ls
(1 child address cell, 1 parent address cell, and 1 child size cell), which
matches a 1-cell parent bus. However, reg =3D <0x0 0x30000000 0x0 0x2000> u=
ses
4 cells as if the parent bus had #address-cells =3D <2> and #size-cells =3D=
 <2>,
causing it to be decoded under the 1-cell parent as two separate 32-bit
regions at base address 0x0 (<0x0 0x30000000> and <0x0 0x2000>) rather than=
 a
single region at 0x30000000.

Should reg be <0x30000000 0x2000> to match the 1-cell parent bus and ranges?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-mpam-resct=
rl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com?part=3D3
