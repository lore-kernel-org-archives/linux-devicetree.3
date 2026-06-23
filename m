Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812291FF5E3
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225702; cv=none; b=lNJ0OZCFkAKIQCX6OayUO6PDgYiqRSevAJ+Ez5AI5x/DR5b1jQT47R1+jPz93K5S8LG5LQsL1th+bEU95gGHFfwef8HqZk/Z+kyx3YyqPDCp+moJyym6COgW5p+SVvAMnS0wB3g1AAK2QPy5JGdrq3JMhjkkEcBan5ijU3yzwbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225702; c=relaxed/simple;
	bh=eM9eHJRPiRnq0HcKG9mRaJhTvaL4MZQpGgEBEgAcHMQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DkB85D+s0PnB2e07hKhPsbt48lDCGvLLjzrgxmmPFdRY8Ozu1E3/5Xo41AAp/o6aQ8c3Yn8rS1jbZY9yfNM2l00WLi9/bgmrmHeLWpg/e0NkU50TLoHP5mNEh4LAlKQS3bBK4LYsu80xHgKuzB/5ewPwebSrh3n9uW6XBgcKeCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFSbrCnT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFSbrCnT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED4E1F000E9;
	Tue, 23 Jun 2026 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782225701;
	bh=SQbihu0pUtSwFg6ReFSB0vwTOfV7TGX4PD0+9MHA7hg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bFSbrCnT5rUAz0nKZ+qol/BqXWBxlpSSIKmMqB77cH9Th5HuoeTiNq7zpAF/SAiKn
	 KzXjLEGosUof4K6cPQIS2Rh+hfeSVVm5YuiAzTeTjYuRnwfPCxv4JgThmK1L0C4qns
	 2l5ubPsa6TzNlzZuw+JhGqBizRK+dGhacQMaSJo0bRCgfokdwU2ySIOXb+a4xGSkEg
	 vNZHVN2vPzGrbXBBpK1e25x0BDGRvLszqZRJ26PGkds/9rumJugXImKFjZ8kUWmkMY
	 mkRgyzAoXF7nUnW5uIdv6fiZZD8DklUjES8Dy8nWQ9aKVQO39UVAtp8SQiIsXc7PHi
	 Cq5+pCqind3fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] serial: 8250_aspeed_vuart: add
 aspeed,ast2600-vuart compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <56c378923566ea0be831f58fd7c2f186ab3f5cba.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <56c378923566ea0be831f58fd7c2f186ab3f5cba.1782224059.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 14:41:40 +0000
Message-Id: <20260623144141.1ED4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Direct return in the newly added AST2600 PCI initialization logic =
bypasses all resource cleanup.

Pre-existing issues:
- [High] Missing serial port unregistration and timer cleanup on probe erro=
r paths causes resource leaks and a Use-After-Free.
- [High] Sysfs attributes are created prematurely in probe() and removed la=
te in remove(), allowing NULL pointer dereference and unmapped memory acces=
s.
- [High] Incorrect teardown order in remove() deletes the timer before unre=
gistering the port, allowing the timer to be re-armed.
--

commit 0b81ae92f1a0f52b8cec821070559651477025dd
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string

Makes the driver compatible with the ast2600-vuart.
This enables specific configuration for the AST2600.

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

[Severity: High]
Does the AST2600 PCI initialization logic bypass the error handling labels
in aspeed_vuart_probe()?

If aspeed_ast2600_vuart_over_pci_set_enabled() fails, the code returns
directly:

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_probe() {
    ...
    if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-vuart") &&
        of_property_read_bool(dev->of_node, "aspeed,vuart-over-pci")) {
        rc =3D aspeed_ast2600_vuart_over_pci_set_enabled(pdev);
        if (rc) {
            dev_err(dev, "could not enable VUART over PCI\n");
            return rc;
        }
    }
    return 0;

err_sysfs_remove:
    sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
    return rc;
}

This direct return bypasses the err_sysfs_remove cleanup label, which would
leave the sysfs group leaked and the UART port and timer active with
pointers to the devm-freed vuart structure.

[Severity: High]
This isn't a bug introduced by this patch, but does aspeed_vuart_probe()
leak resources and cause a use-after-free on other error paths?

If the probe fails and jumps to err_sysfs_remove, it removes the sysfs
group but fails to call serial8250_unregister_port() or timer_delete_sync():

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_probe() {
    ...
    rc =3D serial8250_register_8250_port(&port);
    ...
err_sysfs_remove:
    sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
    return rc;
}

Because vuart is devm-allocated, it will be freed upon probe failure,
leaving the UART port registered with private_data pointing to freed memory.

[Severity: High]
This is a pre-existing issue, but are the sysfs attributes exposed too
early in probe() and removed too late in remove()?

In aspeed_vuart_probe(), sysfs_create_group() is called before the
driver data is set via platform_set_drvdata():

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_probe() {
    ...
    rc =3D sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
    ...
    platform_set_drvdata(pdev, vuart);
    ...
}

If userspace reads attributes like lpc_address during this window,
dev_get_drvdata() returns NULL which is then dereferenced in the callback.

Additionally, in aspeed_vuart_remove(), sysfs_remove_group() is called
after serial8250_unregister_port():

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_remove() {
    ...
    serial8250_unregister_port(vuart->line);
    sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
}

Because unregistering the port calls iounmap(), any concurrent sysfs access
in this window could access unmapped I/O memory.

[Severity: High]
This is also a pre-existing issue, but does aspeed_vuart_remove() delete
the unthrottle timer before disabling the interrupt source that re-arms it?

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_remove() {
    ...
    timer_delete_sync(&vuart->unthrottle_timer);
    aspeed_vuart_set_enabled(vuart, false);
    serial8250_unregister_port(vuart->line);
    ...
}

At the point timer_delete_sync() is called, the UART port is still active.
If an RX interrupt triggers concurrently, aspeed_vuart_handle_irq() can
call mod_timer() and re-arm it. The re-armed timer could then fire after
the devm-allocated vuart structure is freed.

>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_vuart_table);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782224059.gi=
t.gregoire.layet@9elements.com?part=3D3
