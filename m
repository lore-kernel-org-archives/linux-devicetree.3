Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588783F9A1F
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002280; cv=none; b=SxJv1Pw6x6zwMfNJCvDZgOxdFu8+LZ2W6AFSduLlYvFcB3WkuNlkhP1PZBFRftRmJgJvDxVt0ssdLYQDMOGljobRCeMwm+mWcl96LR9klNO1gr0wL/VM+xVApUcv2QKOyuddU2/VIG0CRmCCgi0k+DcECmolaIvPSbEbNhOu3RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002280; c=relaxed/simple;
	bh=+BldebRc4dteebf7RO5mEidFyYDbeKt1DjBOMI3oLuk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MzfTVLHwWZ1rGrJoBRYECEMnvgxLK1uHbG+YChBzGxo792QnLFwVIgVfmGOR3PA2GiNK+K/CmgDUEOGMy7/cD2jeJ77IxBkh6gLe1b5hHkTLrlxtDcQaK4oV6ct6q62nuFvZHmBBmCxTzvywlCya8z2WuQg70jeOJZqGD98rRrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKgOy5Ae; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKgOy5Ae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EA21F00898;
	Tue,  9 Jun 2026 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002278;
	bh=cVN0GqlNui9MDP9m/2jeDnHCymzYNhxDl/buXV6Iwk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bKgOy5AeLST4JNOEJ/3ie/U9BrN2HX3317IvpbTpBN8Lqy3iK60OBV+il7B9zolxv
	 baiwnfmmskosbeyInfehP6oLvLZ5pDhqLBf3UyX2NUvH5F2hNXXU5BibSHp9K5DuhM
	 7i+sbqPTVHyPrXdjxWvT7uMYIstI67BLJ8DglTs2UaZXfYbFlIyFPgLHDi8eoIXX5I
	 g9aay32qNfy77O8SBbbJ77SM1o1kn1oIqTEq08ZSZ8J9G47X8xSNs0WEasYd2I3Ihq
	 yG8Xvx3P3x0PwTQopbiFeSpsSqqmCfmPi7rEKZeSXCKKX3j/iJIWc6JDYvV3cXDpjN
	 2H3D//IE2QNXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608-block-as-nvmem-v3-7-82681f50aa35@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-7-82681f50aa35@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:51:18 +0000
Message-Id: <20260609105118.94EA21F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Silently ignoring -EPROBE_DEFER when fetching the NVMEM BD address=
 leads to a boot-time race condition.
--

commit 11d2d539f650246c72131a488fa018ce70494c2f
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

Bluetooth: qca: Set NVMEM BD address quirks when address is invalid

This patch adds NVMEM cell descriptions for the BD address in the device
tree and updates the QCA Bluetooth driver to set NVMEM quirks when an
invalid default address is detected, allowing the core to fetch it.

[ ... ]
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index dda76365726f0..df33eacfd29fa 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -721,8 +721,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, co=
nst struct qca_fw_config *co
>  	}
> =20
>  	bda =3D (struct hci_rp_read_bd_addr *)skb->data;
> -	if (!bacmp(&bda->bdaddr, &config->bdaddr))
> +	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
>  		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
> +		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);

[Severity: High]
Does setting this quirk silently ignore deferred probes and leave the
device unconfigured?

By setting HCI_QUIRK_USE_BDADDR_NVMEM, the NVMEM lookup is deferred to
the asynchronous power-on workqueue.

If the NVMEM provider hasn't registered the cell yet,
hci_dev_get_bd_addr_from_nvmem() returns -EPROBE_DEFER. Looking at the
core code, the return value is entirely ignored:

net/bluetooth/hci_sync.c:hci_dev_setup_sync() {
        ...
        if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM) &&
            !bacmp(&hdev->public_addr, BDADDR_ANY))
                hci_dev_get_bd_addr_from_nvmem(hdev);
        ...
}

Because this happens asynchronously instead of in qca_serdev_probe(),
the driver core cannot properly defer the probe.

While fw_devlink is present, partition scanning and NVMEM cell
registration for block partitions (like the mmc-card supplier
added in the dts changes) happen asynchronously after the block
driver binds.

Will this cause the Bluetooth driver to randomly fail initialization if
it probes before the NVMEM cell is fully registered?

> +		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
> +	}
> =20
>  	kfree_skb(skb);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-block-as-n=
vmem-v3-0-82681f50aa35@oss.qualcomm.com?part=3D7
