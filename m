Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80CB3093A6
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 16:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157933; cv=none; b=enUCC6EViJe1SPvUDjRIE5l40E1PxpBnMXuivAptjeqnEYrs9sg7og6xhQRyWgiAJj0YCx+JwPvZeM9OAWHOWg45dO+oN6Zx6wenMoRFT0/ntIjs7kyrg+iYSBlIv2dv0PFAuYl9qc7uXm4JkOrN3EL08X+qi79soXoJ141oA9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157933; c=relaxed/simple;
	bh=zBF1aLKHpba4+Tk6vrK/wSGr8CJ1L1gSMBASkfzTUsI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M7MMBpQx/MMFD1HtzFle7e5st2JCvYLv1y/ejBIfz3K6RUcnoQfxKlE4ktvADGmqAw4iFSbBJKjUxEh0uuV7dix4B8e+vNYaYbB8tSRWdMavDKIlcivb6/ufrUhCHNKrHeN4bMjoh8MxlefjoVH9ePVnz5N95lcTS8epQ79LbcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0pVIO4T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0pVIO4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B8F1F00893;
	Sat, 30 May 2026 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780157932;
	bh=/0aoasCLayw4MgcOaL1Y4hPOfu5m2a/nmXntUB4Sui0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g0pVIO4TZdVQpLCGWMzs4F33U1xjlFZhY13mxIJTLEnZAHPj4X1VAFt3UOZ8YOmTX
	 RLLADh5p+dTkgDKfcGmMGzGj2CMTsJcvmJrNLhbq+sTCBx6ZjaONjJw1Ffje7Qb0jl
	 IUgB8NkAwJVpGViJFaK2lrcR48AmUMDYTgOnrJWOCuS/OZMiTb7+HZvm4Ua8D+m4fz
	 Nkh0BI4P2BGqA4KAqLNhXUw9hK7jZMLB0GHDkLUI9WvxhbdLMtcqxfE+PKu3vyxTHr
	 E/7zuH13YYBWGdtL5GhCU5AX9DiC43C1RVQM8QXLt9360eBjNLLc6BHotbHFteb8ZT
	 R5yiGSBx+1N0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588
 crypto engine binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Olesinski" <dawidro@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260530160704.3453555-2-dawidro@gmail.com>
References: <20260530160704.3453555-2-dawidro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 16:18:52 +0000
Message-Id: <20260530161852.88B8F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Shared interrupt is registered before hardware clocks are enabled =
and driver structures are initialized, risking an unhandled bus fault.
- [Low] The device tree example fails to compile with `dtc` and `dt_binding=
_check` due to undefined SCMI macros.
- [Low] The device tree example will fail validation in `dt_binding_check` =
due to a mismatch between the `reg` property length and the default `#addre=
ss-cells`/`#size-cells`.
--

commit e90ad76061a5abfb6bd1bbdaa25b14862d6be7d3
Author: Dawid Olesinski <dawidro@gmail.com>

dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding

Add a YAML device tree binding for the Rockchip second-generation (V2)
cryptographic hardware accelerator present on the RK3568 and RK3588 SoCs.

> diff --git a/Documentation/devicetree/bindings/crypto/rockchip,rk3588-cry=
pto.yaml b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.=
yaml
> new file mode 100644
> index 0000000000000..4188ed8920db9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    crypto@fe370000 {
> +        compatible =3D "rockchip,rk3588-crypto";
> +        reg =3D <0x0 0xfe370000 0x0 0x2000>;

[Severity: Low]
Does this node need to be wrapped in a parent block that specifies
#address-cells =3D <2> and #size-cells =3D <2>?

Since this node is at the top level of the example, dt_binding_check defaul=
ts
both properties to 1, which causes a length mismatch with this 4-cell reg
property. This will trigger a dtc invalid length warning and cause
dt-validate to fail.

> +        interrupts =3D <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&scmi_clk SCMI_CRYPTO_CORE>,
> +                 <&scmi_clk SCMI_ACLK_SECURE_NS>,
> +                 <&scmi_clk SCMI_HCLK_SECURE_NS>;

[Severity: Low]
Are the SCMI clock macros defined anywhere in this example?

It looks like the #include directives for the SCMI headers (e.g.,
<dt-bindings/clock/rockchip,rk3588-cru.h>) are missing. During
make dt_binding_check, these macros are left unexpanded, resulting in dtc
syntax errors because bare strings are invalid inside a < > array.

> +        clock-names =3D "core", "aclk", "hclk";
> +        resets =3D <&scmi_reset SCMI_SRST_CRYPTO_CORE>;

[Severity: Low]
Are the SCMI reset macros defined anywhere in this example?

Similar to the clocks property, the reset macro #include is missing
(e.g., <dt-bindings/reset/rockchip,rk3588-cru.h>), which will cause
dtc and dt_binding_check to fail.

> +        reset-names =3D "core";
> +    };

[ ... ]

Also, looking at the driver code added later in this patch series:

> diff --git a/drivers/crypto/rockchip/rk2_crypto.c b/drivers/crypto/rockch=
ip/rk2_crypto.c
> new file mode 100644
> index 0000000000000..df7dab4d7ca0b
> --- /dev/null
> +++ b/drivers/crypto/rockchip/rk2_crypto.c

[ ... ]

> +static int rk2_crypto_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct rk2_crypto_dev *rkc;
> +	int err =3D 0;

[ ... ]

> +	err =3D devm_request_irq(dev, rkc->irq,
> +			       rk2_crypto_irq_handle, IRQF_SHARED,
> +			       "rk-crypto", pdev);
> +
> +	if (err) {
> +		err =3D dev_err_probe(dev, err, "irq request failed.\n");
> +		goto err_dma;
> +	}
> +
> +	rkc->engine =3D crypto_engine_alloc_init(dev, true);
> +	if (!rkc->engine) {
> +		err =3D -ENOMEM;
> +		goto err_dma;
> +	}
> +
> +	err =3D crypto_engine_start(rkc->engine);
> +	if (err) {
> +		err =3D dev_err_probe(dev, err, "Failed to start crypto engine\n");
> +		goto err_engine;
> +	}
> +
> +	init_completion(&rkc->complete);
> +
> +	err =3D rk2_crypto_pm_init(rkc);
> +	if (err) {
> +		err =3D dev_err_probe(dev, err, "Failed to initialize runtime PM\n");
> +		goto err_engine;
> +	}
> +
> +	err =3D pm_runtime_resume_and_get(dev);

[Severity: High]
Is it safe to request the shared IRQ before the hardware clocks are enabled
and rkc->complete is initialized?

If another device sharing this IRQ triggers an interrupt during this window,
rk2_crypto_irq_handle() could be invoked. Reading RK2_CRYPTO_DMA_INT_ST
without clocks enabled would trigger a synchronous external abort (bus faul=
t),
leading to a kernel panic. It would also attempt to call complete() on an
uninitialized structure.

[ ... ]

> +static void rk2_crypto_remove(struct platform_device *pdev)
> +{
> +	struct rk2_crypto_dev *rkc =3D platform_get_drvdata(pdev);
> +
> +	/* Stop engine to prevent new requests */
> +	crypto_engine_stop(rkc->engine);
> +
> +	/* Unregister algorithms for this specific device */
> +	rk2_crypto_unregister(rkc);
> +
> +#ifdef CONFIG_CRYPTO_DEV_ROCKCHIP2_DEBUG
> +	debugfs_remove_recursive(rkc->dbgfs_dir);
> +#endif
> +
> +	/* Safe to kill the engine completely */
> +	crypto_engine_exit(rkc->engine);
> +
> +	rk2_crypto_pm_exit(rkc);
> +	dma_free_coherent(rkc->dev, sizeof(struct rk2_crypto_lli) * MAX_LLI,
> +			  rkc->tl, rkc->t_phy);
> +}

[Severity: High]
Can rk2_crypto_pm_exit(rkc) disable runtime PM (gating clocks) while the
devres-managed shared IRQ is still active?

This would reopen the bus fault window during module unload, as the IRQ is
not freed until devres cleanup occurs after rk2_crypto_remove() returns.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530160704.3453=
555-1-dawidro@gmail.com?part=3D1
