Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8855B30D415
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008089; cv=none; b=SrkD9vYvhp0SZjD7eyP0pIMAzaKc+1hEmn8qmlL4sPJbimljNG821EKd3YqEhVCS9aZ9qg0iM+NG7xgbKflvBjFlm1FHLBMxp/Hzxiq1tLGh6ocdTyxaH2dM8zboerVhEg28JbeT37wqdRxGYfSri1xKPOIc9riZUqtXF9C9iy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008089; c=relaxed/simple;
	bh=SRSDzKlDCctcuXuxKJCEqjHS4xTBObko1jSBizja4MA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G+ZTWoItYqI0nUIhE+smni3QU3zIjMe3j/3hJ9NxKqjgu75nA1f+g7j2/GuakO0PIrAEEZpifRda/Nq4tj1A6R4o39+x4sgHRkWTLUOlnzcS4lOe762NUad9QZHjAYO+v/9hVdFrlTJOkIzDkcNMsAHB3PabG5JQHfPnSMh3Gqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpXVWhdq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpXVWhdq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DE81F00A3A;
	Thu,  2 Jul 2026 16:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008088;
	bh=Qfs2QTL8uxGAveHfQBWw2Abb6kWXWHTSgOpfali+bUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XpXVWhdqjvm6RaPSMPlzYPCs+u3PsP/Oa4jRGzz0fkuIlnk68nzM5Dh7yZSjvSRkY
	 inM9nOIrbYifVU4BRWWpdaRQB+39Pb2tdzbGzdkus7KLSjky5RDQH9hxZk4jCY9awr
	 GUc9IqhyO77STlSgz/FPpniJs5V0x7xGQ35feTems8vjsmjK61VgkTjVWF0clZyYLM
	 Lg00NCGQDV0Dmug9q66HxAatNFu6damwTPv6CsMPgfXcJIvckyVQy+S9s2qQXDBDoS
	 OZcweYPvfhQ9FoDf9b7bmNj24NunLKc2+jwsIfkgXn7LGHg7/6GvixUhmN6dgKc/rl
	 jboU9MK++VciA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/9] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-block-as-nvmem-v7-7-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
 <20260701-block-as-nvmem-v7-7-3fe8205ef0a8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 16:01:27 +0000
Message-Id: <20260702160127.D6DE81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Asynchronous NVMEM read silently swallows `-EPROBE_DEFER`, permane=
ntly leaving the device without an address.
- [High] Missing `HCI_QUIRK_USE_BDADDR_NVMEM` checks in MGMT interface caus=
e unconfigured devices to report 0 missing options.
--

commit b5310ae697f8c9e43fa71d6c9350c84adcaff918
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval

This commit adds support for reading the Bluetooth BD address from a
'local-bd-address' NVMEM cell, similar to Ethernet or WiFi MAC addresses.
It introduces two new quirks, HCI_QUIRK_USE_BDADDR_NVMEM and
HCI_QUIRK_BDADDR_NVMEM_BE, to indicate whether the platform should attempt
to read the address from NVMEM and whether it is stored in big-endian byte
order.

> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 3be8c3581c6ca..c0ed7fb14d19b 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c

[ ... ]

> @@ -5072,12 +5106,17 @@ static int hci_dev_setup_sync(struct hci_dev *hde=
v)
>  	 * its setup callback.
>  	 */
>  	invalid_bdaddr =3D hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
> -			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
> +			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
> +			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);

[Severity: High]
Does net/bluetooth/mgmt.c also need to be updated to check for
HCI_QUIRK_USE_BDADDR_NVMEM?

In get_missing_options() and is_configured(), there are similar checks for
HCI_QUIRK_INVALID_BDADDR and HCI_QUIRK_USE_BDADDR_PROPERTY. If this new
quirk is missing from those checks, userspace might be informed that it
has 0 missing options despite the device being unconfigured, preventing
userspace from resolving the unconfigured state.

>  	if (!ret) {
>  		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) &&
>  		    !bacmp(&hdev->public_addr, BDADDR_ANY))
>  			hci_dev_get_bd_addr_from_property(hdev);
> =20
> +		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM) &&
> +		    !bacmp(&hdev->public_addr, BDADDR_ANY))
> +			hci_dev_get_bd_addr_from_nvmem(hdev);

[Severity: High]
Does this silently swallow -EPROBE_DEFER?

If of_get_nvmem_eui48() returns -EPROBE_DEFER because the NVMEM provider
has not yet probed, the return value of hci_dev_get_bd_addr_from_nvmem()
is ignored here. Since hci_dev_setup_sync() runs asynchronously in a
workqueue, the error cannot be propagated, and the device might be
permanently left without an address.

> +
>  		if (invalid_bdaddr && bacmp(&hdev->public_addr, BDADDR_ANY) &&
>  		    hdev->set_bdaddr) {
>  			ret =3D hdev->set_bdaddr(hdev, &hdev->public_addr);
>  			if (!ret)
>  				invalid_bdaddr =3D false;
>  		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-block-as-n=
vmem-v7-0-3fe8205ef0a8@oss.qualcomm.com?part=3D7
