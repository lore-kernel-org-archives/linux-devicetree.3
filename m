Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1E04E36F1
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983721; cv=none; b=TAIVEPLTWahey74G2iZWq1Dco5zFcz3i21ksYhK1HiQMIGv8r2ITUFAFRv+aRA9/+Cly4GyLgkxsNGNXskNkae4Bg1gsTGJPrZ7rXxuKLmL1T1kQpG0vDqkQ2hj7i04RI3a98TU74nNGnyfzIHoRJ35LlZaN99P/O/x4x1p8/TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983721; c=relaxed/simple;
	bh=uwMft3OMWBYSyKXJVcJ6J8AyPGqdyoenIS/KfoZ+G0Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=djvqD4wmN6qrLZNBTbnzEKnq4+O9iLIr0X01jNlEZs8/xFaKkET9/rLIb5DsObJZa0n7zw+hehgO56nrdMorRpsIumwrgAovrrlg3sOpi4zEHgYZD3pTKSnGu/ZTelfPz1TZl44tTxMDqTHGwHbgORLZRufNANt5tNQWjzgoDNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUEvlS43; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUEvlS43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FBE1F000FF;
	Wed, 14 Oct 2026 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983719;
	bh=Jkw0dHeIzeMzc+OMS9JH0tdxlvLyp6kqLoO0r0FiUwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LUEvlS43OsPaeX9l9wmMJKuOG61dZaHEKHz0pk5Lmyvqiw4uRfgxcU9JzFbRnfkbN
	 b54mduD9WmuYL2J370eiqwGYXyCnIeTE9k2h+9v0Bq093GVrUZlG1uQXbKyn42m3O7
	 w3xhhaiPfWV9PuPWY7OKEMKJb1kLA0yNjFAppLtsh1e3JciqGDg/BnpGv26Q3eqHNN
	 A1AHq8mu+4xhccQrYPHIbXsPWh5R2eSoDZ6rAhma+6j+qAeu1ZKxK/b0b/S60Jtf5A
	 7DHUgoZ2xQ8RbDImYDcZhpJuDITMSbUwucV6+dO1X1q6SSkJKI2lLBTBvnvh9jpjLs
	 Y1RIzRinTUt6Q==
Message-ID: <sashiko-outbox-171328@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/5] Bluetooth: hci_qca: Support BD address from an
 nvmem cell
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:15:19 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] bluetooth: device wrongly left HCI_UNCONFIGURED after nvmem MAC in=
it
--

commit 97b88af275cdce36b0a1523d7d18ad5eb2710216
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

Bluetooth: hci_qca: Support BD address from an nvmem cell

This commit reads an optional Bluetooth device address from an nvmem cell
and programs it into the controller during setup. This allows sourcing
BD_ADDR from firmware-provisioned storage.

> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c

[ ... ]

> @@ -2079,6 +2082,16 @@ static int qca_setup(struct hci_uart *hu)
>  	else
>  		hu->hdev->set_bdaddr =3D qca_set_bdaddr;
> =20
> +	/* Program a BD address sourced from an nvmem cell, if provided. */
> +	if (qcadev && qcadev->bdaddr_valid) {
> +		int berr =3D hu->hdev->set_bdaddr(hdev, &qcadev->bdaddr);
> +
> +		if (berr)
> +			bt_dev_warn(hdev, "Failed to set nvmem bd-address: %d", berr);
> +		else
> +			bt_dev_info(hdev, "Set bd-address %pMR from nvmem", &qcadev->bdaddr);
> +	}

[Severity: High]
Does this leave the device wrongly flagged as HCI_UNCONFIGURED?

When the controller boots with a default MAC, qca_check_bdaddr() detects it
and sets HCI_QUIRK_USE_BDADDR_PROPERTY. Here in qca_setup(), the nvmem MAC
is programmed into the controller using hu->hdev->set_bdaddr(), but it
appears it is not copied to hdev->public_addr, and
HCI_QUIRK_USE_BDADDR_PROPERTY is not cleared.

When initialization returns to the core stack, hci_dev_setup_sync() sees
HCI_QUIRK_USE_BDADDR_PROPERTY is still set and hdev->public_addr is
BDADDR_ANY:

net/bluetooth/hci_sync.c:hci_dev_setup_sync() {
    ...
    if (invalid_bdaddr && bacmp(&hdev->public_addr, BDADDR_ANY) &&
        hdev->set_bdaddr) {
        ret =3D hdev->set_bdaddr(hdev, &hdev->public_addr);
        if (!ret)
            invalid_bdaddr =3D false;
    }
    ...
}

Because hdev->public_addr is still BDADDR_ANY, invalid_bdaddr remains
true.

The core stack then marks the device as HCI_UNCONFIGURED:

net/bluetooth/hci_sync.c:hci_dev_setup_sync() {
    ...
    if (hci_test_quirk(hdev, HCI_QUIRK_EXTERNAL_CONFIG) ||
        invalid_bdaddr)
        hci_dev_set_flag(hdev, HCI_UNCONFIGURED);
    ...
}

Will this cause the core Bluetooth stack to refuse to bring it up
automatically, requiring manual userspace intervention and breaking the
automatic nvmem MAC provisioning?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-b4-nvmem-e=
fivar-v1-0-187c85f65018@oss.qualcomm.com?part=3D3
