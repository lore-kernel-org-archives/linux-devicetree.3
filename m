Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BDE4457D5
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513687; cv=none; b=cqG1flU7gcehHvCAkOCq/FIZNy9TlGAVCHXSvWA7Cm3ObETBN6a0F4ZBzO3AqFoNwhfekT2H1plFrp/1yIioeiaDmxIUy1dWJK+FD79kc9zDytSRzy2LgjdZaZOnIu5Ju2TSXYiPV9+mz1ajmi5pf9Irht5SNGqVY/MMX3Q2XOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513687; c=relaxed/simple;
	bh=d8OVrWGUTDXJES/mS9VPau7b4RPVibKImzR6/HVs0sA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LJO+CnY0V5OfuEVLIst2zesZ3SOg90zit5ewxydztR6+VCVfQ2du2VPYcUkYAGNRWd5gFASNOa6dFxJokzKzcNTnPfnuSHbGHr+uMPoyMn66YCgPRa0tFQXEkLVyo07cbvbCQTihM6HUoKNYdRFSLQQ+Dt/1sgJiz+u5R2hYL1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyhbVKbG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyhbVKbG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1351F00ACF;
	Fri, 31 Jul 2026 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785513685;
	bh=AcCSmo0a2OByJCyUmfR/e13efRiHLIw7Nt8FeFlilEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oyhbVKbGBJmfrPXc+r8uZWPfxTZGX7JQk1szmoIMHM922k2MiKgPJ2T5Q5kalPksf
	 Y4UCWqJ6mJotq4506JjteGjJ4W0xfdLKEpKqOjxl3tcIaUtFM9J/wfeGROm2IYn35v
	 3Qk1EFHG9soNt9KiW0AgzDpGwXrT9afwUz9dajCcGieoHmeroQyGxsfdHaSAOZtikO
	 Dfm0APXPxd5qxrm1YT+HMW9cQ14UUq2QvOYzaLA5MB8kHN9TAtXDK2RY255xaQJDz/
	 YFnZeVw/pstfqY7s9+BgUcHgKCMt7yrDJiwF0rZephiHX/jqeBpf49nqHtxqY0dXJY
	 Uml6J8KFdtYNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/10] Bluetooth: hci_sync: Add NVMEM-backed BD
 address retrieval
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-block-as-nvmem-v9-8-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
 <20260730-block-as-nvmem-v9-8-f72935817dbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:01:25 +0000
Message-Id: <20260731160125.AC1351F00ACF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Fetching NVMEM cells asynchronously in `hci_dev_setup_sync()` by=
passes the kernel's probe deferral mechanism, causing non-deterministic har=
dware initialization failures.
--

--- Patch [8]: [PATCH v9 08/10] Bluetooth: hci_sync: Add NVMEM-backed BD ad=
dress retrieval ---
commit 72e4410658718fb2db8f711db8f8fe59033dd650
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval

This commit adds support for retrieving the Bluetooth BD address from an
NVMEM cell when an in-chip address is not present. It introduces two new
quirks to indicate when to use the NVMEM address and its endianness.

> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index c0b1fc293b496..ff395bf14dbc3 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
[ ... ]
> @@ -3638,6 +3639,39 @@ int hci_powered_update_sync(struct hci_dev *hdev)
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

[Severity: Medium]
Will this return value be handled correctly if the NVMEM provider has not
probed yet?

When of_get_nvmem_eui48() returns -EPROBE_DEFER, the error is correctly
passed up from this function. However, looking at the caller below, it seems
this might not trigger probe deferral as expected.

> +
> +	if (hci_test_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE))
> +		baswap(&hdev->public_addr, (bdaddr_t *)ba);
> +	else
> +		bacpy(&hdev->public_addr, (bdaddr_t *)ba);
> +
> +	return 0;
> +}
[ ... ]
> @@ -5117,12 +5151,17 @@ static int hci_dev_setup_sync(struct hci_dev *hde=
v)
[ ... ]
>  	if (!ret) {
>  		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) &&
>  		    !bacmp(&hdev->public_addr, BDADDR_ANY))
>  			hci_dev_get_bd_addr_from_property(hdev);
> =20
> +		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM) &&
> +		    !bacmp(&hdev->public_addr, BDADDR_ANY))
> +			hci_dev_get_bd_addr_from_nvmem(hdev);

[Severity: Medium]
Does this silently swallow initialization failures?

The return value from hci_dev_get_bd_addr_from_nvmem() is completely ignored
here. If the NVMEM provider is not yet available, the -EPROBE_DEFER error
is lost and the Bluetooth controller might be left in an unconfigured state.

Additionally, since hci_dev_setup_sync() often executes asynchronously outs=
ide
of the standard driver probe sequence, would returning the error here even
properly trigger the kernel probe deferral mechanism?

Should the NVMEM cell be fetched synchronously during the initial device pr=
obe
sequence instead of waiting for the setup synchronization phase?

> +
>  		if (invalid_bdaddr && bacmp(&hdev->public_addr, BDADDR_ANY) &&
>  		    hdev->set_bdaddr) {
>  			ret =3D hdev->set_bdaddr(hdev, &hdev->public_addr);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-block-as-n=
vmem-v9-0-f72935817dbf@oss.qualcomm.com?part=3D8
