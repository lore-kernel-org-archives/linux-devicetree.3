Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BE144AB69
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810914; cv=none; b=fBDOVLs9gRhTBMSfpaH+srI/nhcyGQaWFdfMEEBGL6DL/yNbpeozDvd2trspr0o/kr4ahsKsujqhSXpFAwgEwdWZdhWUwygM+owpdK07AoaC02KhgR4WOHlB9gmwp/b/LfYK7XX8cUYpsrZ46YY7KqbChiG322z8kEnkAeP7vOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810914; c=relaxed/simple;
	bh=B58w8MyAdrLl5CsvlDNY9PlN1ldaLhgvjkX5doqTGEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a8fSeip1CJeKBZvlzhkkib+ot5W1xutXMPrDxQ/jN/kvjMKv81T+wenbWf23osm2nN2ROMEYJ3kCJ5TFEZ6C2q9h6v4vMzOAKkVnTC8DPCIxdPXQQkyqNDgUhunXROyQOykRJzA+r+4jDRlW7YTup9gvoYivigmk0exYTk04DXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1sR+jG8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1sR+jG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC301F00A3A;
	Thu, 23 Jul 2026 12:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784810913;
	bh=J+cgtSouLIajQZ6WwqdQLntG6d8iQqJ3EgeroEooGjQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d1sR+jG8jD0iOOz/n85OWDKD5Jpc4ktubYpxfLFjoygDikEjUeJanGI06nnN4RQLE
	 4c/I3RDTlLMNw5+iVie6N4dE+1mZVZFiSOrkPnKoByziywOAqAnArYAgg23x38BdVK
	 H39r4eOsumnPuuLfsBhdO1BIYaJEGKQOpB9Xrwwf8yOpBtggOhQQ3JWQnmtoVXoTpl
	 Rb+4c/gRxTRonMhIhgPXlcRCZPx4CF/kY2QdprBxnumNOURGq5+ACHkD8bzyIPF/iN
	 vjApZ1MZey3kJAh01ZeU62mr32AX41Mm2XsJupSzjqRG0ZQI/syMjLx7NkDBGsUIjW
	 km265+9CHSwVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] Bluetooth: qca: add QCC2072 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rahul Samana" <rahul.samana@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723-rb3-industrial-bt-uart-v1-1-3c8e580c09d1@oss.qualcomm.com>
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
 <20260723-rb3-industrial-bt-uart-v1-1-3c8e580c09d1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 12:48:28 +0000
Message-Id: <20260723124832.9EC301F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Uninitialized `config.calib_name` when using the `firmware-name` d=
evice tree property causes failure to load calibration data.

Pre-existing issues:
- [High] Unbounded polling loop on the TX queue can lead to a permanent tas=
k hang.
--

--- Patch [1]: [PATCH 1/3] Bluetooth: qca: add QCC2072 support ---
commit a8d57bcf86987ec0c8079a742e8a1f1f50322cdc
Author: Rahul Samana <rahul.samana@oss.qualcomm.com>

    Bluetooth: qca: add QCC2072 support
   =20
    Add QCC2072 as a supported Qualcomm Bluetooth controller.

> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 10c496eaea2c1..69427cc7eb5a9 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c

[ ... ]

> @@ -614,6 +662,11 @@ static int qca_download_firmware(struct hci_dev *hde=
v,
>  	memcpy(data, fw->data, size);
>  	release_firmware(fw);
> =20
> +	if (soc_type =3D=3D QCA_QCC2072 && config->type =3D=3D TLV_TYPE_NVM)
> +		qca_combine_nvm_calib(hdev, &data, &size,
> +				      config->calib_name,
> +				      sizeof(config->calib_name));
> +
>  	ret =3D qca_tlv_check_data(hdev, config, data, size, soc_type);

[Severity: High]
Does this code handle custom firmware names properly?

In qca_uart_setup(), if the firmware-name device tree property is set, the
driver enters the if (firmware_name) branch:

	if (firmware_name) {
		/* The firmware name has an extension, use it directly */
		if (qca_filename_has_extension(firmware_name)) {

When this path is taken, config.calib_name is never initialized. Then,
qca_download_firmware() unconditionally passes the empty string to
qca_combine_nvm_calib() for the QCC2072 controller.

This causes request_firmware() to fail with -EINVAL, logging a spurious err=
or
and skipping the calibration data append.

Could we initialize config.calib_name when a custom firmware name is provid=
ed
via the device tree?

[ ... ]

> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 1222f97800f4a..6fe3aab688e64 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c

[ ... ]

> @@ -1375,6 +1375,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, u=
int8_t baudrate)
> =20
>  	/* Give the controller time to process the request */
>  	switch (qca_soc_type(hu)) {
> +	case QCA_QCC2072:
>  	case QCA_WCN3950:

[Severity: High]
This is a pre-existing issue, but can this lead to a permanent task hang?

Just above this switch statement in qca_set_baudrate(), there is a polling
loop that checks the transmit queue:

	while (!skb_queue_empty(&qca->txq))
		usleep_range(100, 200);

This loop polls the transmit queue indefinitely without a bounding timeout.

If the UART hardware stops accepting bytes, for example due to stuck flow
control or a hardware crash, the queue is never emptied and the loop will s=
pin
indefinitely.

Could a timeout mechanism be added here to prevent a task hang if the hardw=
are
malfunctions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-rb3-indust=
rial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com?part=3D1
