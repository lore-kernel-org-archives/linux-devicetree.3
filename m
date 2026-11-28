Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795835382;
	b=tuyrZEp780N1g3aWVmisjL+lu7QH7iHnZJSLI/RrlAdxmco18bE5EXdakTz5l6W4efXW
	 bPLk3ae1G15XLfoZJLpYqlvwz+aXZXQKzMxFXy3VkR/KvLA91gQ00wTsn3clvharl8w4W
	 GDf2BT+9BPG8poO60EscMHAjEDGMk2P7vzfKasrTPjCfdWisQ4Z3iWGmBOdovo75r8CoC
	 4wbtiUIE9nLtwpR8h6ksa1g9AGsAzcT2et8dgEn9UX3tim5aSC7vTr8MoZxYfEAAwyTCg
	 Q0EQCVVgRsSWAjqYiOGNRUL4NZPv4swIvuc3UN3XmeiJk7OlzXzKMaQdgezEipmVxVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795835382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5uP8bLhleIlCW+2pa4E+cgAik1u/TvGB+vHUxE2NTXg=;
	b=0NLFxZyFgvxUd7geq4gNdDbxmZhGafVw2oXNbtvSyyB+2uHZegd36MYdLb5novq0s/fl
	 OD1aUznIkWplOcEvz2/ZK/6LN8x5M7XG54a8JHb/Nhzc4ZTzu3DB/4P0lRMK4rhUWWhg0
	 juxj6aOGFyneFM+bulTYpFeDkkpbzX08yXFmDhoLteLjscpH6ajzwjGI4Krtf0EWvX+EW
	 wcFkX1UD4Bm4ZaqNNWJn7Q7dBKrKKe3MnKVqTQEPyf9DtPE6ZISjsxmQ+ZSWOXkBf/BV1
	 nWpOmRvJvBNgbxgbNt9q1CwhUYYmE/wOLAUcG8mpPEaxRxvuDKGsoLBYSvs9uiom1SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nX9TIbVo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EED606A31C
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 03:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nX9TIbVo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD441F00893;
	Sat, 28 Nov 2026 03:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795835382;
	bh=5uP8bLhleIlCW+2pa4E+cgAik1u/TvGB+vHUxE2NTXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nX9TIbVo0K6J+9pkm9nUIHFCYalsgfkWTDs5bJB/kPhioOpp617kptrsVjk49ygt/
	 aSOcENb2/oUSnbiGkOLyC9wVmeSF/FiSYOnVE0NZSlSerZv+9zAqBzVYhl4GwNSeMX
	 RSSigd6/LqTPvQoes7vKg0H0iNQLOTHsczvNtI8Ghk78BmGRdtkro5y/6W7ut0bQYy
	 9CcOBlMMKjTg+ezOh3YymEYAUpLvSNkFA6X3TNxQETd4y88FCbSb7JS5GHlO8W/9CB
	 qM2nWsxyJcPUkvnnGznFagznPB1IEWoAStKlwjCgJWXqPh3g8S7LhUNhl0xUQWL1eu
	 iNNCCUJb3Jd6Q==
Message-ID: <sashiko-outbox-238430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] spi: serialize OF notifier device removal with
 controller removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Debjit Ghosh" <dghosh@juniper.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261128024830.57367-1-dghosh@juniper.net>
References: <20261128024830.57367-1-dghosh@juniper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 03:09:41 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] spi: incomplete serialization in of_spi_notify() allows of_node
  UAF
- [Low] spi: missing Fixes trailer for klist corruption fix in
  of_spi_notify()
--

commit d8aab75e4e977ea5193817573284d57a2881b77e
Author: Debjit Ghosh <debjit.ghosh@hpe.com>

> spi: serialize OF notifier device removal with controller removal
>
> The OF reconfig notifier and spi_unregister_controller() can both
> unregister the same SPI device concurrently. However,
> spi_unregister_controller() unregisters children holding ctlr->add_lock,
> but of_spi_notify() does not. So both contexts, sometimes executing
> concurrently, would call device_del() on the same device potentially
> corrupting the controller's child klist.
>
>   Oops: general protection fault, probably for non-canonical
>         address 0xdead0000000000f8
>   CPU: 13 UID: 0 PID: 173 Comm: irq/38-pciehp
>   RIP: 0010:klist_next+0x6e/0x140
>    device_for_each_child+0x5d/0xb0
>    spi_unregister_controller+0x3a/0x140
>    ...
>    mfd_remove_devices+0x36/0x50
>    pci_device_remove+0x3d/0xb0
>    ...
>    pciehp_ist+0x13c/0x180
>
> while an overlay unload mechanism was concurrently removing the same
> device through of_overlay_remove() -> of_spi_notify().
>
> Serialize the notifier's removal path with the controller's child
> unregistration using ctlr->add_lock, and recheck OF_POPULATED under the
> lock before calling spi_unregister_device().
>
> Signed-off-by: Debjit Ghosh <debjit.ghosh@hpe.com>

[Severity: Low]
Should this bug fix include a Fixes tag?

  Fixes: ce79d54ae447 ("spi/of: Add OF notifier handler")

> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 0569f30785e9f..6a6c590649c1a 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -5390,8 +5390,25 @@ static int of_spi_notify(struct notifier_block *nb=
, unsigned long action,
>  		if (spi =3D=3D NULL)
>  			return NOTIFY_OK;	/* No? not meant for us */
> =20
> -		/* Unregister takes one ref away */
> -		spi_unregister_device(spi);
> +		/*
> +		 * Serialize against spi_unregister_controller. The device
> +		 * can be unregistered concurrently by its controller being
> +		 * torn down (e.g. on surprise hot removal of the underlying
> +		 * bus hosting the controller).
> +		 */
> +		ctlr =3D spi->controller;
> +		if (IS_ENABLED(CONFIG_SPI_DYNAMIC))
> +			mutex_lock(&ctlr->add_lock);
> +
> +		/*
> +		 * Recheck under the lock as whichever context executes first
> +		 * will depopulate the flag.
> +		 */
> +		if (of_node_check_flag(rd->dn, OF_POPULATED))
> +			spi_unregister_device(spi); /* takes one ref away */
> +
> +		if (IS_ENABLED(CONFIG_SPI_DYNAMIC))
> +			mutex_unlock(&ctlr->add_lock);

[Severity: High]
Can spi->dev.of_node still be freed while spi_unregister_controller() is
in the middle of device_del(&spi->dev)?

spi_unregister_device() clears OF_POPULATED and drops its of_node
reference before calling device_del(&spi->dev):

drivers/spi/spi.c:spi_unregister_device() {
    ...
	if (is_of_node(fwnode)) {
		of_node_clear_flag(to_of_node(fwnode), OF_POPULATED);
		of_node_put(to_of_node(fwnode));
	} else if (is_acpi_device_node(fwnode)) {
		acpi_device_clear_enumerated(to_acpi_device_node(fwnode));
	}
	device_remove_software_node(&spi->dev);
	device_del(&spi->dev);
    ...
}

Because of_spi_notify() checks OF_POPULATED (and calls
of_find_spi_device_by_node()) before acquiring ctlr->add_lock, it can
return NOTIFY_OK without waiting for spi_unregister_device() to finish:

CPU0                                  CPU1
spi_unregister_controller()
  mutex_lock(&ctlr->add_lock)
  ...
    spi_unregister_device(spi)
      of_node_clear_flag(dn,
                         OF_POPULATED)
      of_node_put(dn)
                                      of_overlay_remove()
                                        ...
                                          of_spi_notify()
                                            !of_node_check_flag(rd->dn,
                                                                OF_POPULATE=
D)
                                            return NOTIFY_OK
                                        free_overlay_changeset()
                                          ...
                                            of_node_put(ce->np)
                                              of_node_release()
      device_del(&spi->dev)
        ...
          of_device_uevent()
            dev->of_node              <-- use-after-free

When CPU1 sees OF_POPULATED already cleared (or fails to find the device
on spi_bus_type after bus_remove_device()), of_overlay_remove() proceeds
to destroy the changeset and free rd->dn and the overlay FDT memory while
CPU0 is still running driver remove callbacks and of_device_uevent() on
spi->dev.of_node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128024830.5736=
7-1-dghosh@juniper.net?part=3D1
