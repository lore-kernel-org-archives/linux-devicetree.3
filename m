Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BA341CB44
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525789; cv=none; b=AThUxGEfcXj/YHocYnIsG5TGDiA/wAj6s3gmQ9Ah7VPkj6Sb3QORV7UBPjC4PuLhAZhn2bw078QPOXa1zcFXy/5ziY/p1iZBiC6aLr98IgEN9PfkzvrgGmIwt24Ck6/e8ZTMlxmvZRCWi0ySylmPQ5/PAFpao0jWIPM+V7cgP9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525789; c=relaxed/simple;
	bh=UctYU+eSNQOriGZycicZRhSN/EZQljtP0N0MMfmw3FU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KSxPN4N9nPSZ2V/J+9ay3M5YnUM/VBcSFrfGebvIynhhB7A+3TTfcKTIovAGCZhB6YTGSqy1b0ZJuw5O2WxHlHbPfvJHSgdtDxHUtS3HHN3DfkTWFUDwpRfeTjDLCz7FM4QVq0+kLy8sbHSubjQgyWdhiA20+9tw40C79SPgTps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYxtRu73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYxtRu73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C5E1F000E9;
	Wed,  8 Jul 2026 15:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783525787;
	bh=An0uBYooxk0Q6HSiI847hmB85Y5Z0hcMtOso+X0XT9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AYxtRu734j3e8UFgfQ4NRTBwn3wqaeltqCkFH7v+KsSWtVQcbvqci2fbmAbqSmcR4
	 vgpBalZ8gaIFQRwnc6DdPeRbWWt76AfE8jp/auOK3Cb0yHxPLySgov1HzCug8E54Pw
	 Dg8SaythPz7+vhhKTta2p+F+OXt0v2D9UEc2s6LEkUpTJuDY6EQOLh/fPo2IwRCZyq
	 irjm84hKPPNXKc5Hyoz/NswFHKyTU21HeCGUiDy7BMM7Od1qCoL4BjxVvl+1VkCsga
	 NCLyGDmIfV2J68ltKJqU2E2KGdbRkAvsP4aSBlxEFSeYuWVoaRROrAgQoazxmRmhmc
	 HhOaHqk2A+zlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] serial: 8250_aspeed_vuart: add
 aspeed,ast2600-vuart compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <3598f3d668717082adbffa5179b4afbe39b2a946.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <3598f3d668717082adbffa5179b4afbe39b2a946.1783524645.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 15:49:46 +0000
Message-Id: <20260708154947.33C5E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Error paths in `aspeed_vuart_probe()` after serial port registrati=
on fail to unregister the port, leading to a Use-After-Free vulnerability.
- [High] Incorrect teardown ordering in `aspeed_vuart_remove()` allows the =
unthrottle timer to be re-armed after it is deleted, leading to a Use-After=
-Free vulnerability.
--

--- Patch [3]: [PATCH v4 3/7] serial: 8250_aspeed_vuart: add aspeed,ast2600=
-vuart compatible string ---
commit be545f82b6eac2794c78d897d8e0ac9945c563d1
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
   =20
Make the driver compatible with the ast2600-vuart.
Enable specific configuration for the AST2600.

> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/se=
rial/8250/8250_aspeed_vuart.c
> index 26fc0464f1cc2..6afa2f4057e1b 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -560,6 +560,7 @@ static void aspeed_vuart_remove(struct platform_devic=
e *pdev)
>  static const struct of_device_id aspeed_vuart_table[] =3D {
>  	{ .compatible =3D "aspeed,ast2400-vuart" },
>  	{ .compatible =3D "aspeed,ast2500-vuart" },
> +	{ .compatible =3D "aspeed,ast2600-vuart" },
>  	{ },
>  };

[Severity: High]
This isn't a bug introduced by this patch, but the error paths in
aspeed_vuart_probe() after serial port registration fail to unregister
the port.

If an initialization step fails after serial8250_register_8250_port() (e.g.
if aspeed_vuart_set_lpc_address() returns -EINVAL), the code jumps here:

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_probe() {
    ...
err_sysfs_remove:
	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
	return rc;
}

This error path omits serial8250_unregister_port(vuart->line) and
timer_delete_sync(&vuart->unthrottle_timer), leaking the registered port.

Since the vuart struct is then freed by devres, if a user opens the leaked
serial port, aspeed_vuart_startup() will dereference the freed vuart struct.

Should the error path unregister the port and delete the timer?


[Severity: High]
This isn't a bug introduced by this patch, but there is an incorrect teardo=
wn
ordering in aspeed_vuart_remove() that allows the unthrottle timer to be
re-armed after it is deleted.

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_remove() {
	struct aspeed_vuart *vuart =3D platform_get_drvdata(pdev);

	timer_delete_sync(&vuart->unthrottle_timer);
	aspeed_vuart_set_enabled(vuart, false);
	serial8250_unregister_port(vuart->line);
	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
}

Because timer_delete_sync() is invoked before serial8250_unregister_port(),
the UART and its IRQ are still fully active. An incoming interrupt can trig=
ger
aspeed_vuart_handle_irq(), and if the tty buffer is full, re-arm the timer
via mod_timer().=20

When the driver removal completes, the vuart struct is freed by devres. When
the re-armed timer fires, aspeed_vuart_unthrottle_exp() will dereference the
freed vuart struct.

Could the timer be deleted after unregistering the serial port to prevent
it from being re-armed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783524645.gi=
t.gregoire.layet@9elements.com?part=3D3
