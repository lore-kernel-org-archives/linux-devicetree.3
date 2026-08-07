Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD28C2EEE86
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113580; cv=none; b=GgznHa7RkSyK47DMo6fWvJxSysBrRdnmZSO6NSrQ4YPWZekMZgUC4X3Rj+8npkNkHmyNQgSp3NBvuE/I8lYy3lAvKyta2mlQB7kA08PpYRS7vjUFM9g4Q6Vgke9/rxrFwYj/puPmZS/5O9PLfF+yIl1lkMaAwHX/23SeoDeVG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113580; c=relaxed/simple;
	bh=MSLZYnIbH4atRAgWOqsmjqo8CsesSHJaci9a238TTpE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dDXvRhVUDHVKHhTeLspvly03arb4gJwurRUSiivOVOi+bNmPO31sVV1CYcghQJkfimnx/jnCI/467vTLVWWSkyc0JE5hqrNH0fg8QgT2ZFGQuHw9qcZZ/5p+g86evssIOVUdLnCnbeg0KzfaTRuYHsvhPIohJy7Hd1nnV2TZGrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpy0OPq7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpy0OPq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3A51F00A3E;
	Fri,  7 Aug 2026 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786113570;
	bh=5zGEG7gZrQoa5wmJXj2ieOx7BBxPk6SXZXgq9n0uNsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lpy0OPq7P9rIaS1CYCCNlL7I5U3t+sObZd7ulot/t+wJXtWiCUR1Vu1FQ61gb8O7B
	 h1luCHxAe+I7XDh7GLX0exvopMBFaHK+Lcp24lBlDDdmhY/STXST91iBF3aL/4QuzR
	 UskTqisGBYRNKXVjPY26IFyXe2hQbNe8wAnzIcQtn8rv7elobdm+QAoDj5gsCeq2TX
	 hJV3x3eZPt7NP7RCCV1a2hzmR7yLXQrgLNHVk7mAIwEocbYbpvhndtK4lIdgDTUa4v
	 NJWrLWQvUzZjI2wCysJ1IGu1pBOR7kvck/jA+JEiGRAKW+uXYN34t9bArDYPumBngM
	 /ZAdmDqnoNiog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 08/10] Bluetooth: hci_sync: Add NVMEM-backed BD
 address retrieval
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260806-block-as-nvmem-v10-8-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <20260806-block-as-nvmem-v10-8-be598b2a5606@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 14:39:30 +0000
Message-Id: <20260807143930.BD3A51F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Reading the NVMEM cell asynchronously in `hci_dev_setup_sync` defe=
ats `-EPROBE_DEFER` dependency management, potentially leaving the device p=
ermanently unconfigured.
--

--- Patch [8]: [PATCH v10 08/10] Bluetooth: hci_sync: Add NVMEM-backed BD a=
ddress retrieval ---
commit da997894066d6b3f7aceb681048c25113a6d107e
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval

This commit adds support for reading the Bluetooth BD address from a
'local-bd-address' NVMEM cell, similar to Ethernet or WiFi MAC addresses.
It also adds quirks to indicate if a device should use this method and
whether the address is stored in big-endian order.

> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index c8d14128c363d..8132a1487ac25 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c

[ ... ]

> @@ -3701,6 +3702,39 @@ int hci_powered_update_sync(struct hci_dev *hdev)
>  	return 0;
>  }
> =20
> +/**
> + * hci_dev_get_bd_addr_from_nvmem - Get the Bluetooth Device Address
> + *				    (BD_ADDR) for a HCI device from
> + *				    an NVMEM cell.
> + * @hdev:	The HCI device
> + *
> + * Search for 'local-bd-address' NVMEM cell in the device firmware node.
> + *
> + * All-zero BD addresses are rejected (unprovisioned).
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +static int hci_dev_get_bd_addr_from_nvmem(struct hci_dev *hdev)
> +{
> +	struct device_node *np =3D dev_of_node(hdev->dev.parent);
> +	u8 ba[sizeof(bdaddr_t)];
> +	int err;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	err =3D of_get_nvmem_eui48(np, "local-bd-address", ba);
> +	if (err)
> +		return err;

[ ... ]

> @@ -5180,12 +5214,17 @@ static int hci_dev_setup_sync(struct hci_dev *hde=
v)
>  	 * its setup callback.
>  	 */
>  	invalid_bdaddr =3D hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
> -			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
> +			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
> +			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
>  	if (!ret) {
>  		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) &&
>  		    !bacmp(&hdev->public_addr, BDADDR_ANY))
>  			hci_dev_get_bd_addr_from_property(hdev);
> =20
> +		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM) &&
> +		    !bacmp(&hdev->public_addr, BDADDR_ANY))
> +			hci_dev_get_bd_addr_from_nvmem(hdev);

[Severity: High]
Does ignoring the return value here defeat probe deferral?

Since hci_dev_setup_sync() runs during device open rather than synchronously
in the driver's probe() function, any -EPROBE_DEFER error returned by
of_get_nvmem_eui48() inside hci_dev_get_bd_addr_from_nvmem() cannot be
propagated to the driver core's deferral queue.

Additionally, because the return value is completely dropped, does this
silently ignore permanent hardware errors like -EIO?

If the NVMEM cell is missing, not fully bound yet, or fails to read, it
appears the device could silently fail to acquire its BD_ADDR and
permanently boot in an unconfigured state without any log message.

> +
>  		if (invalid_bdaddr && bacmp(&hdev->public_addr, BDADDR_ANY) &&
>  		    hdev->set_bdaddr) {
>  			ret =3D hdev->set_bdaddr(hdev, &hdev->public_addr);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-block-as-n=
vmem-v10-0-be598b2a5606@oss.qualcomm.com?part=3D8
