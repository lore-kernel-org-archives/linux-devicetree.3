Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9886930D3ED
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525657; cv=none; b=h5F9rF4B1/PYJS21sxeC3lduMyRg040AF2V/MPkrMdq7DH5tRVdgBVNgh7TYoFE187m8/r656DTuGlBrv064B828kKXW+A2oP7ph9uxqr7ewdKsRwC4erM5A7RXPWTavBuwJmqaPaXx6LPZdgAizjtB9hdpLPUW1HyDs2oPSYNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525657; c=relaxed/simple;
	bh=yYUmjwK5mH3GMfocA0HVdjt3DqjkbXtkBthx3HWyTgk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YLKywpnOXwN5XD88xtOBNxsW7hJGvXq/hzK2APS5A6uEtmCyM+rzUKdDt2ibE1XO+RntFIv8VycyISZO/+9brkBz6DTAdVRHkpy4kvNTgiGX6w+OAotEhQL9gZNtuToRVtSzjS+0iv0LGbCGtnbhKgVbSVzweaNvECoN952O+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0rNkEuA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0rNkEuA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55C81F000E9;
	Wed,  8 Jul 2026 15:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783525656;
	bh=JRtIxxpR02HJceb9HbZNcIKj1MTNTQqQsEPbrfibPTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I0rNkEuAetKp9Z02iBaCf8HZo2bQEpt9upzEuo2/PntxOPAMfCPiB0iEr0mMVjkME
	 3Syz8MEBoLW7W06Hhdpfk/7r2i/C8ijYQw5o1QbikRXcuPa6K4qHxp86+/uWMOsNUd
	 Y6ZGltUuf9mCcA1MEM4SrsEZx1jG19nQsTNcNguNx0Ztr23L1kJJRj6Rr8ZJwwInGs
	 h4TrainZOTl0g1iIn146538bt7CcxIf6CvY7r05QRyZAUgH3E0JLPBhIElj6L4iH3T
	 IvwQX1KLNdXupuspcrsRkRb0c+L+ho+wcI7dLxUX7XlIyil6bK9Xq/NSgD1YzTqjsi
	 6kEu0xoRvr7sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] serial: 8250_aspeed_vuart: add VUART over PCI
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <28c6e7c493559feffc7e6231b0a2f0b73b7fda41.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <28c6e7c493559feffc7e6231b0a2f0b73b7fda41.1783524645.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 15:47:35 +0000
Message-Id: <20260708154735.D55C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe error paths fail to unregister the 8250 serial port and canc=
el the unthrottle timer, causing a resource leak and potential use-after-fr=
ee.
- [High] Sysfs attributes are exposed before the driver data is set, creati=
ng a race window that leads to a NULL pointer dereference.
--

--- Patch [4]: [PATCH v4 4/7] serial: 8250_aspeed_vuart: add VUART over PCI=
 ---
commit d4ec19577207abb14c5ca6354d48ef6da9508b14
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

serial: 8250_aspeed_vuart: add VUART over PCI

Enable the VUART over PCI for the AST2600. Activate it only if the
'aspeed,vuart-over-pci' property flag is set on an 'ast2600-vuart'
compatible node.

> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/se=
rial/8250/8250_aspeed_vuart.c
> index 6afa2f4057e1b..4d09c04cb9727 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c

[ ... ]

> @@ -540,6 +617,15 @@ static int aspeed_vuart_probe(struct platform_device=
 *pdev)
>  	aspeed_vuart_set_host_tx_discard(vuart, true);
>  	platform_set_drvdata(pdev, vuart);

[Severity: High]
This is a pre-existing issue, but setting the driver data this late creates=
 a
race condition.

The sysfs attribute group is created earlier in aspeed_vuart_probe():

    rc =3D sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);

If userspace accesses these sysfs files (e.g., triggering sirq_show()) befo=
re
platform_set_drvdata() is called here, dev_get_drvdata() returns NULL, which
then leads to a NULL pointer dereference.

Could the sysfs creation be deferred until after the driver data is set?

> =20
> +	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-vuart") &&
> +	    of_property_read_bool(dev->of_node, "aspeed,vuart-over-pci")) {
> +		rc =3D aspeed_ast2600_vuart_over_pci_set_enabled(pdev);
> +		if (rc < 0) {
> +			dev_err_probe(dev, rc, "could not enable VUART over PCI\n");
> +			goto err_sysfs_remove;

[Severity: High]
This is a pre-existing issue, but this error path fails to unregister the 8=
250
serial port and cancel the unthrottle timer.

If aspeed_ast2600_vuart_over_pci_set_enabled() fails, we jump to
err_sysfs_remove:

err_sysfs_remove:
	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
	return rc;
}

This cleans up the sysfs group but leaves the serial port registered.

Since the vuart structure is allocated with devm_kzalloc, it will be freed
automatically by devres when the probe fails. This leaves a dangling pointer
in the active 8250 serial port's private data, which can result in a
use-after-free if the TTY device is accessed.

Should this error path also call serial8250_unregister_port() and
timer_delete_sync() before returning?

> +		}
> +	}
> +
>  	return 0;
> =20
>  err_sysfs_remove:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783524645.gi=
t.gregoire.layet@9elements.com?part=3D4
